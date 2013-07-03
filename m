Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 580236AE71
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 04:47:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r634ljnS003186
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2013 21:47:45 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 2 Jul 2013 21:47:45 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2013 12:48:12 +0800
Message-ID: <61d58e6bfc00142957a77a3a1747c9848710917a.1372826827.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372826827.git.Qi.Chen@windriver.com>
References: <cover.1372826827.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] busybox: fix the on-target upgrade problem
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
X-List-Received-Date: Wed, 03 Jul 2013 04:47:44 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

We now can have a 'one-binary' version of busybox, or 'two-binary'
version of busybox, controlled by the 'BUSYBOX_SPLIT_SUID' variable.
This makes on-target upgrade a problem, as we have to support the
following four upgrading paths.

For convenience, in the following context, A is used to denote a
'two-binary' version of busybox while B is used to denote a 'one-binary'
version of busybox.

A --(upgrade)--> B
B --(upgrade)--> A
A --(upgrade)--> A
B --(upgrade)--> B

This patch makes effort to support the above four situations.

[YOCTO #4802]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |   48 +++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 8567d64..acd2bfb 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -190,6 +190,10 @@ do_install () {
 			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
 			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
 			ln -sf busybox.nosuid ${D}${base_bindir}/sh
+			# Keep a default busybox for people who want to invoke busybox directly.
+			# This is also useful for the on device upgrade. Because we want
+			# to use the busybox command in postinst.
+			ln -sf busybox.nosuid ${D}${base_bindir}/busybox
 		else
 			if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
 				install -m 4755 ${B}/busybox ${D}${base_bindir}
@@ -198,6 +202,12 @@ do_install () {
 			fi
 			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 			ln -sf busybox ${D}${base_bindir}/sh
+			# We make this symlink here to eliminate the error when upgrading together
+			# with busybox-syslog. Without this symlink, the opkg may think of the
+			# busybox.nosuid as obsolete and remove it, resulting in dead links like
+			# /bin/sed -> /bin/busybox.nosuid. This will make upgrading busybox-syslog fail.
+			# This symlink will be safely deleted in postinst, thus no negative effect.
+			ln -sf busybox ${D}${base_bindir}/busybox.nosuid
 		fi
 	else
 		install -d ${D}${base_bindir} ${D}${base_sbindir}
@@ -306,6 +316,44 @@ python do_package_prepend () {
         set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.suid")
 }
 
+pkg_postinst_${PN} () {
+	# This part of code is dedicated to the on target upgrade problem.
+	# It's known that if we don't make appropriate symlinks before update-alternatives calls,
+	# there will be errors indicating missing commands such as 'sed'.
+	# These symlinks will later be updated by update-alternatives calls.
+	test -n 2 > /dev/null || alias test='busybox test'
+	if test "x$D" = "x"; then
+		# Remove busybox.nosuid if it's a symlink, because this situation indicates
+		# that we're installing or upgrading to a one-binary busybox.
+		if test -h /bin/busybox.nosuid; then
+			rm -f /bin/busybox.nosuid
+		fi
+		for suffix in "" ".nosuid" ".suid"; do
+			if test -e /etc/busybox.links$suffix; then
+				while read link; do
+					if test ! -e "$link"; then
+						case "$link" in
+							/*/*/*)
+								to="../../bin/busybox$suffix"
+								;;
+							/bin/*)
+								to="busybox$suffix"
+								;;
+							/*/*)
+								to="../bin/busybox$suffix"
+								;;
+						esac
+						# we can use busybox here because even if we are using splitted busybox
+						# we've made a symlink from /bin/busybox to /bin/busybox.nosuid.
+						busybox rm -f $link
+						busybox ln -s $to $link
+					fi
+				done < /etc/busybox.links$suffix
+			fi
+		done
+	fi
+}
+
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
-- 
1.7.9.5


