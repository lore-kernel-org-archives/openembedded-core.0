Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 358F97702B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:00:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 19D416002BA
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:59:39 +0100
Message-Id: <29451b27523dd212d768f9e83eccfe0cf8e78b3e.1441374016.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1441374016.git.joshua.lock@collabora.co.uk>
References: <cover.1441374016.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 2/9] busybox: fixes for when base_bindir != /bin
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
X-List-Received-Date: Fri, 04 Sep 2015 15:00:09 -0000

* Replace all hard-coded paths with variables
* Run sed over busybox.links.* to replace /bin with ${base_bindir}

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-core/busybox/busybox.inc | 49 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0769d92..ed8f9fe 100644
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
 
@@ -338,10 +341,10 @@ python do_package_prepend () {
         return
 
     if os.path.exists('%s/etc/busybox.links' % (dvar)):
-        set_alternative_vars("/etc/busybox.links", "/bin/busybox")
+        set_alternative_vars("${sysconfdir}/busybox.links", "${base_bindir}/busybox")
     else:
-        set_alternative_vars("/etc/busybox.links.nosuid", "/bin/busybox.nosuid")
-        set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.suid")
+        set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base_bindir}/busybox.nosuid")
+        set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
 }
 
 pkg_postinst_${PN} () {
@@ -353,22 +356,22 @@ pkg_postinst_${PN} () {
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
 							/*/*/*)
-								to="../../bin/busybox$suffix"
+								to="../..${base_bindir}/busybox$suffix"
 								;;
 							/bin/*)
 								to="busybox$suffix"
 								;;
 							/*/*)
-								to="../bin/busybox$suffix"
+								to="..${base_bindir}/busybox$suffix"
 								;;
 						esac
 						# we can use busybox here because even if we are using splitted busybox
@@ -376,7 +379,7 @@ pkg_postinst_${PN} () {
 						busybox rm -f $link
 						busybox ln -s $to $link
 					fi
-				done < /etc/busybox.links$suffix
+				done < ${sysconfdir}/busybox.links$suffix
 			fi
 		done
 	fi
@@ -387,19 +390,19 @@ pkg_prerm_${PN} () {
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
 
@@ -407,7 +410,7 @@ pkg_prerm_${PN}-syslog () {
 	# remove syslog
 	if test "x$D" = "x"; then
 		if test "$1" = "upgrade" -o "$1" = "remove"; then
-			/etc/init.d/syslog stop
+			${sysconfdir}/init.d/syslog stop
 		fi
 	fi
 }
-- 
2.1.4


