Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 97B9D65E0C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 19:59:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 07 Oct 2014 12:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="396748224"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.59])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2014 12:52:59 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Oct 2014 15:00:30 -0500
Message-Id: <1412712030-12657-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] busybox: fix upgrade problem with deb packages
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
X-List-Received-Date: Tue, 07 Oct 2014 19:59:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Busybox prerm scripts create temp directory and fill with
symlinks to common utilities in order to upgrade itself, PATH
is exported but dpkg didn't take a look of this links and fails.

In order to fix,

	Changed temp directory to /usr/loca/bin in debian packages.
	Added missing links for utilities tar, find, tail, cut.

Busybox syslog prerm script tries to stop the daemon but if already
stopped returns 1 then causes that dpkg fails because it expects 0.

In order to fix,

	Added workaround to exit 0 in debian packages.

[YOCTO #6768]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 46 ++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bd66e4f..61f12b4 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -377,13 +377,46 @@ pkg_postinst_${PN} () {
 			fi
 		done
 	fi
+
+	# Workaround for deb packages, clean
+        if [ "$DPKG_MAINTSCRIPT_PACKAGE"x != x ]; then
+		tmpdir='/usr/local/bin'
+		rm -f $tmpdir/[
+		rm -f $tmpdir/test
+		rm -f $tmpdir/head
+		rm -f $tmpdir/sh
+		rm -f $tmpdir/basename
+		rm -f $tmpdir/echo
+		rm -f $tmpdir/mv
+		rm -f $tmpdir/ln
+		rm -f $tmpdir/dirname
+		rm -f $tmpdir/rm
+		rm -f $tmpdir/sed
+		rm -f $tmpdir/sort
+		rm -f $tmpdir/grep
+		rm -f $tmpdir/tar
+		rm -f $tmpdir/find
+		rm -f $tmpdir/tail
+		rm -f $tmpdir/cut
+        fi
 }
 
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
 	# for syslog, httpd and/or udhcpd will fail if there is no other package providing sh
-	tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
+
+        # Workaround for deb packages, dpkg don't take into account exported PATH variable,
+        # use instead local directory.
+        if [ "$DPKG_MAINTSCRIPT_PACKAGE"x == x ]; then
+		tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
+        else
+		tmpdir='/usr/local/bin'
+		if [ ! -e $tmpdir ]; then
+			mkdir -p $tmpdir
+		fi
+	fi
+
 	ln -s /bin/busybox $tmpdir/[
 	ln -s /bin/busybox $tmpdir/test
 	ln -s /bin/busybox $tmpdir/head
@@ -397,6 +430,11 @@ pkg_prerm_${PN} () {
 	ln -s /bin/busybox $tmpdir/sed
 	ln -s /bin/busybox $tmpdir/sort
 	ln -s /bin/busybox $tmpdir/grep
+	ln -s /bin/busybox $tmpdir/tar
+	ln -s /bin/busybox $tmpdir/find
+	ln -s /bin/busybox $tmpdir/tail
+	ln -s /bin/busybox $tmpdir/cut
+
 	export PATH=$PATH:$tmpdir
 }
 
@@ -405,6 +443,12 @@ pkg_prerm_${PN}-syslog () {
 	if test "x$D" = "x"; then
 		if test "$1" = "upgrade" -o "$1" = "remove"; then
 			/etc/init.d/syslog stop
+
+			# Workaround for deb packages, if syslog is already stopped returns
+			# 1 but dpkg expects 0 and then fails.
+			if [ "$DPKG_MAINTSCRIPT_PACKAGE"x != x ]; then
+				exit 0
+			fi
 		fi
 	fi
 }
-- 
1.9.1


