Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E6E3B73204
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBZBrY017081 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:11 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XNifxA1lr7vb
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:11 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBZ7XS017076
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:35:08 GMT
Message-ID: <1455276907.16142.274.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Feb 2016 11:35:07 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] autotools: Fix interaction with bitbake -b
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
X-List-Received-Date: Fri, 12 Feb 2016 11:35:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you run bitbake -b on something using autotools with dependencies on

m4 files, it currently fails as the TASKDEPDATA is incomplete for
bitbake -b
and this means the relevant macros aren't found.

Work around this by adding *all* m4 files for the -b case (and show a warning).

[YOCTO #8890]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index a5f2bff..6649f5d 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -148,12 +148,18 @@ python autotools_copy_aclocals () {
     bb.utils.mkdirhier(aclocaldir)
     start = None
     configuredeps = []
+    # Detect bitbake -b usage
+    # Everything but quilt-native would have dependencies
+    nodeps = (pn != "quilt-native")
 
     for dep in taskdepdata:
         data = taskdepdata[dep]
         if data[1] == "do_configure" and data[0] == pn:
             start = dep
+        if not nodeps and start:
             break
+        if nodeps and data[0] != pn:
+            nodeps = False
     if start is None:
         bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
 
@@ -188,6 +194,11 @@ python autotools_copy_aclocals () {
     #bb.warn(str(configuredeps2))
 
     cp = []
+    if nodeps:
+        bb.warn("autotools: Unable to find task dependencies, -b being used? Pulling in all m4 files")
+        for l in [d.expand("${STAGING_DATADIR_NATIVE}/aclocal/"), d.expand("${STAGING_DATADIR}/aclocal/")]:
+            cp.extend(os.path.join(l, f) for f in os.listdir(l))
+
     for c in configuredeps:
         if c.endswith("-native"):
             manifest = d.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}-%s.populate_sysroot" % c)



