Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE4B0728F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 09:17:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ9Hih1016675
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 01:17:44 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Dec 2014 01:17:43 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 17:17:42 +0800
Message-ID: <3803f210415897cb65d0fa81261a22504f72bd45.1418979966.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418979966.git.Qi.Chen@windriver.com>
References: <cover.1418979966.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] busybox: fix hardcoding of paths
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
X-List-Received-Date: Fri, 19 Dec 2014 09:17:53 -0000
Content-Type: text/plain

Instead of using paths like '/etc' and '/bin', we should use ${sysconfdir}
and ${base_bindir}.

Otherwise, when ${base_bindir} is not '/bin', there would be errors.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 66 +++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bd66e4f..b853adc 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -178,6 +178,9 @@ do_install () {
 	if [ "${base_sbindir}" != "/sbin" ]; then
 		sed -i "s:^/sbin/:${base_sbindir}/:" busybox.links*
 	fi
+	if [ "${base_bindir}" != "/bin" ]; then
+		sed -i "s:^/bin/:${base_bindir}/:" busybox.links*
+	fi
 
 	install -d ${D}${sysconfdir}/init.d
 
@@ -319,6 +322,8 @@ python do_package_prepend () {
 
     dvar = d.getVar('D', True)
     pn = d.getVar('PN', True)
+    sysconfdir = d.getVar('sysconfdir', True)
+    base_bindir = d.getVar('base_bindir', True)
     def set_alternative_vars(links, target):
         f = open('%s%s' % (dvar, links), 'r')
         for alt_link_name in f:
@@ -334,11 +339,11 @@ python do_package_prepend () {
         f.close()
         return
 
-    if os.path.exists('%s/etc/busybox.links' % (dvar)):
-        set_alternative_vars("/etc/busybox.links", "/bin/busybox")
+    if os.path.exists('%s%s/busybox.links' % (dvar, sysconfdir)):
+        set_alternative_vars("%s/busybox.links" % sysconfdir, "%s/busybox" % base_bindir)
     else:
-        set_alternative_vars("/etc/busybox.links.nosuid", "/bin/busybox.nosuid")
-        set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.suid")
+        set_alternative_vars("%s/busybox.links.nosuid" % sysconfdir, "%s/busybox.nosuid" % base_bindir)
+        set_alternative_vars("%s/busybox.links.suid" % sysconfdir, "%s/busybox.suid" % base_bindir)
 }
 
 pkg_postinst_${PN} () {
@@ -350,22 +355,29 @@ pkg_postinst_${PN} () {
 	if test "x$D" = "x"; then
 		# Remove busybox.nosuid if it's a symlink, because this situation indicates
 		# that we're installing or upgrading to a one-binary busybox.
-		if test -h /bin/busybox.nosuid; then
-			rm -f /bin/busybox.nosuid
+		if test -h ${base_bindir}/busybox.nosuid; then
+			rm -f ${base_bindir}/busybox.nosuid
 		fi
 		for suffix in "" ".nosuid" ".suid"; do
-			if test -e /etc/busybox.links$suffix; then
+			if test -e ${sysconfdir}/busybox.links$suffix; then
 				while read link; do
 					if test ! -e "$link"; then
 						case "$link" in
-							/*/*/*)
-								to="../../bin/busybox$suffix"
+							${bindir}/*)
+								to="${@os.path.relpath('%s/busybox' % base_bindir, bindir)}"
+								to="$to$suffix"
+								;;
+							${sbindir}/*)
+								to="${@os.path.relpath('%s/busybox' % base_bindir, sbindir)}"
+								to="$to$suffix"
 								;;
-							/bin/*)
-								to="busybox$suffix"
+							${base_bindir}/*)
+								to="${@os.path.relpath('%s/busybox' % base_bindir, base_bindir)}"
+								to="$to$suffix"
 								;;
-							/*/*)
-								to="../bin/busybox$suffix"
+							${base_sbindir}/*)
+								to="${@os.path.relpath('%s/busybox' % base_bindir, base_sbindir)}"
+								to="$to$suffix"
 								;;
 						esac
 						# we can use busybox here because even if we are using splitted busybox
@@ -373,7 +385,7 @@ pkg_postinst_${PN} () {
 						busybox rm -f $link
 						busybox ln -s $to $link
 					fi
-				done < /etc/busybox.links$suffix
+				done < ${sysconfdir}/busybox.links$suffix
 			fi
 		done
 	fi
@@ -384,19 +396,19 @@ pkg_prerm_${PN} () {
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
 	# for syslog, httpd and/or udhcpd will fail if there is no other package providing sh
 	tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
-	ln -s /bin/busybox $tmpdir/[
-	ln -s /bin/busybox $tmpdir/test
-	ln -s /bin/busybox $tmpdir/head
-	ln -s /bin/busybox $tmpdir/sh
-	ln -s /bin/busybox $tmpdir/basename
-	ln -s /bin/busybox $tmpdir/echo
-	ln -s /bin/busybox $tmpdir/mv
-	ln -s /bin/busybox $tmpdir/ln
-	ln -s /bin/busybox $tmpdir/dirname
-	ln -s /bin/busybox $tmpdir/rm
-	ln -s /bin/busybox $tmpdir/sed
-	ln -s /bin/busybox $tmpdir/sort
-	ln -s /bin/busybox $tmpdir/grep
+	ln -s ${base_bindir}/busybox $tmpdir/[
+	ln -s ${base_bindir}/busybox $tmpdir/test
+	ln -s ${base_bindir}/busybox $tmpdir/head
+	ln -s ${base_bindir}/busybox $tmpdir/sh
+	ln -s ${base_bindir}/busybox $tmpdir/basename
+	ln -s ${base_bindir}/busybox $tmpdir/echo
+	ln -s ${base_bindir}/busybox $tmpdir/mv
+	ln -s ${base_bindir}/busybox $tmpdir/ln
+	ln -s ${base_bindir}/busybox $tmpdir/dirname
+	ln -s ${base_bindir}/busybox $tmpdir/rm
+	ln -s ${base_bindir}/busybox $tmpdir/sed
+	ln -s ${base_bindir}/busybox $tmpdir/sort
+	ln -s ${base_bindir}/busybox $tmpdir/grep
 	export PATH=$PATH:$tmpdir
 }
 
-- 
1.9.1


