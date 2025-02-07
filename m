Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49ACC0219C
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:41:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.72474.1738942864574260890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 07:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6346D113E
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Feb 2025 07:41:26 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BC973F58B
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Feb 2025 07:41:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dbus: explictly set the path to systemctl
Date: Fri,  7 Feb 2025 15:40:58 +0000
Message-ID: <20250207154058.3103011-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 15:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210983

The dbus.socket user unit file calls systemctl, and the meson.build uses
find_program() to find the path, falling back to a hardcoded value if it
cannot be found.

On the initial build the sysroot doesn't contain systemctl (as it is not
in the target systemd sysroot), however after the do_package_write_*
tasks have completed there is a systemd-systemctl-native recipe in the
sysroot which will be found and result in host paths being in the target
packages, specifically in /usr/lib/systemd/user/dbus.socket:

  ExecStartPost=3D-/work/ross/build/tmp/work/core2-64-poky-linux/dbus/1.1=
6.0/recipe-sysroot-native/usr/bin/systemctl

This can be replicated by forcing a rebuild after a forced packaging:

$ bitbake dbus -C do_package_write_ipk
$ bitbake dbus -C configure
ERROR: dbus-1.16.0-r0 do_package_qa: QA Issue: File
/usr/lib/systemd/user/dbus.socket in package dbus-common contains
reference to TMPDIR [buildpaths]

We could do the unit mask manually instead of using systemctl (as it's
just a symlink) but the hardcoded path is still wrong, so write a small
Meson cross file to specify where the binary is.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/dbus/dbus_1.16.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.0.bb b/meta/recipes-core/db=
us/dbus_1.16.0.bb
index f516273cc77..80e766f9592 100644
--- a/meta/recipes-core/dbus/dbus_1.16.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.0.bb
@@ -124,6 +124,16 @@ pkg_postinst:dbus() {
 	fi
 }
=20
+# dbus uses find_program() to find systemctl, which results in a build p=
ath in the
+# user dbus.socket
+EXTRA_OEMESON:append:class-target =3D " --cross-file=3D${WORKDIR}/dbus.c=
ross"
+
+do_configure:prepend:class-target() {
+    cat >${WORKDIR}/dbus.cross <<EOF
+[binaries]
+systemctl =3D '${bindir}/systemctl'
+EOF
+}
=20
 do_install:append:class-target() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false',=
 d)}; then
--=20
2.43.0


