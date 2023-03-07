Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D56AC6FD1A
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 15:56:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18955.1678204568270060682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 07:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225D5113E;
	Tue,  7 Mar 2023 07:56:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 414F83F67D;
	Tue,  7 Mar 2023 07:56:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] manpages: use an intercept to run mandb
Date: Tue,  7 Mar 2023 15:56:06 +0000
Message-Id: <20230307155606.1190265-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 15:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178114

If you build an image with lots of manpages in, then each package will
run mandb inside qemu-user at rootfs time.  This is a slow operation
and should be done once when all of the packages have installed using an
intercept instead.

The call to mandb has been changed too. mandb doesn't actually allow
the configuration file to be read from stdin so that was being ignored,
instead write the file to a temporary file and use that.

This means we then don't need to tell it where to search explicitly, and
it writes the indexes to the correct paths so we don't need to move
files afterwards either.

Sadly we do still need to run mandb inside qemu-user, as the underlying
database is a gdbm file and they are byte-order dependent.

For my test case of core-image-base with api-documentation
DISTRO_FEATURES and doc-pkgs IMAGE_FEATURES enabled, the performance
gain is significant:

  core-image-base do_rootfs  -1303.1s   -73.6%   1771.6s -> 468.5s

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/manpages.bbclass     | 12 +-----------
 scripts/postinst-intercepts/update_mandb | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 11 deletions(-)
 create mode 100644 scripts/postinst-intercepts/update_mandb

diff --git a/meta/classes-recipe/manpages.bbclass b/meta/classes-recipe/m=
anpages.bbclass
index 693fb536714..e9ca2f895bd 100644
--- a/meta/classes-recipe/manpages.bbclass
+++ b/meta/classes-recipe/manpages.bbclass
@@ -23,17 +23,7 @@ pkg_postinst:${MAN_PKG}:append () {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'false', d=
)}; then
 		if test -n "$D"; then
 			if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', =
'false', d)}; then
-				sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf | ${@qemu_run_bi=
nary(d, '$D', '${bindir}/mandb')} -C - -u -q $D${mandir}
-				chown -R root:root $D${mandir}
-
-				mkdir -p $D${localstatedir}/cache/man
-				cd $D${mandir}
-				find . -name index.db | while read index; do
-					mkdir -p $D${localstatedir}/cache/man/$(dirname ${index})
-					mv ${index} $D${localstatedir}/cache/man/${index}
-					chown man:man $D${localstatedir}/cache/man/${index}
-				done
-				cd -
+				$INTERCEPT_DIR/postinst_intercept update_mandb ${PKG} mlprefix=3D${M=
LPREFIX} binprefix=3D${MLPREFIX} bindir=3D${bindir} sysconfdir=3D${syscon=
fdir} mandir=3D${mandir}
 			else
 				$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefi=
x=3D${MLPREFIX}
 			fi
diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-=
intercepts/update_mandb
new file mode 100644
index 00000000000..a061bb426a6
--- /dev/null
+++ b/scripts/postinst-intercepts/update_mandb
@@ -0,0 +1,16 @@
+#!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
+
+set -eu
+
+# Create a temporary man_db.conf with paths to the rootfs, as mandb need=
s absolute paths
+CONFIG=3D$(mktemp --tmpdir update-mandb.XXXXX)
+sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf > $CONFIG
+
+PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --conf=
ig-file $CONFIG --create
+
+rm -f $CONFIG
+
+chown -R man:man $D${localstatedir}/cache/man/
--=20
2.34.1


