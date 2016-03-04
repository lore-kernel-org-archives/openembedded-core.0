Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73B1773197
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24GRDHp002098 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 16:27:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4UvQ5ESD9ALG
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 16:27:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u24GRBJc002094
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 16:27:12 GMT
Message-ID: <1457108831.2804.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Mar 2016 16:27:11 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] insane/prelink: Handle nonstandard library paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2016 16:27:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Prelink contains some hardcoded assumptions about the path layout of
the target system. Unfortunately if the system doesn't match, prelink
doesn't work. This breaks:

a) prelink of those images
b) the unsafe-references-in-binaries QA test (which uses prelink-rtld)

One way to work around this is to construct an ld.so.conf file which
lists the library paths in question. We do this in sanity QA check and 
in the rootfs prelink code, being careful not to trample any existing
target ld.so.conf.

There is an additional problem that $LIB references in RPATHs won't be
handled correctly, I've not see any system use these in reality though
so this change at least improves things.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index d4bb3ae..53c4b0b 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -1,6 +1,10 @@
 do_rootfs[depends] += "prelink-native:do_populate_sysroot"
 
-IMAGE_PREPROCESS_COMMAND += "prelink_image; "
+IMAGE_PREPROCESS_COMMAND += "prelink_setup; prelink_image; "
+
+python prelink_setup () {
+    oe.utils.write_ld_so_conf(d)
+}
 
 prelink_image () {
 #	export PSEUDO_DEBUG=4
@@ -20,6 +24,13 @@ prelink_image () {
 		dummy_prelink_conf=false;
 	fi
 
+	# We need a ld.so.conf with pathnames in,prelink conf on the filesystem, add one if it's missing
+	ldsoconf=${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf
+	if [ -e $ldsoconf ]; then
+		cp $ldsoconf $ldsoconf.prelink
+	fi
+	cat ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf >> $ldsoconf
+
 	# prelink!
 	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
 
@@ -28,6 +39,12 @@ prelink_image () {
 		rm -f ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
 	fi
 
+	if [ -e $ldsoconf.prelink ]; then
+		mv $ldsoconf.prelink $ldsoconf
+	else
+		rm $ldsoconf
+	fi
+
 	pre_prelink_size=`du -ks ${IMAGE_ROOTFS} | awk '{size = $1 ; print size }'`
 	echo "Size after prelinking $pre_prelink_size."
 }
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ebf92ac..7ac945d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1094,12 +1094,17 @@ python do_package_qa () {
                continue
             if w in testmatrix and testmatrix[w] in g:
                 warnchecks.append(g[testmatrix[w]])
+            if w == 'unsafe-references-in-binaries':
+                oe.utils.write_ld_so_conf(d)
+
         errorchecks = []
         for e in (d.getVar("ERROR_QA", True) or "").split():
             if e in skip:
                continue
             if e in testmatrix and testmatrix[e] in g:
                 errorchecks.append(g[testmatrix[e]])
+            if e == 'unsafe-references-in-binaries':
+                oe.utils.write_ld_so_conf(d)
 
         bb.note("Checking Package: %s" % package)
         # Check package name
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 9a86410..30d3062 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -293,3 +293,14 @@ class ThreadedPool:
         self.tasks.join()
         for worker in self.workers:
             worker.join()
+
+def write_ld_so_conf(d):
+    # Some utils like prelink may not have the correct target library paths
+    # so write an ld.so.conf to help them
+    ldsoconf = d.expand("${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf")
+    if os.path.exists(ldsoconf):
+        bb.utils.remove(ldsoconf)
+    bb.utils.mkdirhier(os.path.dirname(ldsoconf))
+    with open(ldsoconf, "w") as f:
+        f.write(d.getVar("base_libdir", True) + '\n')
+        f.write(d.getVar("libdir", True) + '\n')



