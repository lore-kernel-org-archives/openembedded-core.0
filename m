Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9F2C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:18:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.28581.1702574292023804595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC7792F4
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:18:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E19403F738
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:18:10 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: re-enable profile guided optimisation
Date: Thu, 14 Dec 2023 17:18:06 +0000
Message-Id: <20231214171806.1934090-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 17:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192395

From: Ross Burton <ross.burton@arm.com>

This was accidentally disabled in the 3.7.2 upgrade in 2019[1] where PGO
was made target-only. Change the wrapper script generation so that it
happens in all environments but class-native.

[1] oe-core 02714c105426b0d687620913c1a7401b386428b6

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.11.5.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipe=
s-devtools/python/python3_3.11.5.bb
index d375de4b19c..e7b2b08f7f0 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -129,18 +129,24 @@ EXTRA_OEMAKE =3D '\
   LIB=3D${baselib} \
 '
=20
-do_compile:prepend:class-target() {
+# Generate a Profile Guided Optimisation wrapper script that uses qemu-u=
ser for
+# all cross builds.
+write_pgo_wrapper:class-native =3D ":"
+write_pgo_wrapper() {
        if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', =
d)}; then
-                qemu_binary=3D"${@qemu_wrapper_cmdline(d, '${STAGING_DIR=
_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
                 cat >pgo-wrapper <<EOF
 #!/bin/sh
 cd ${B}
-$qemu_binary "\$@"
+${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_=
DIR_TARGET}/${base_libdir}'])} "\$@"
 EOF
                 chmod +x pgo-wrapper
         fi
 }
=20
+do_compile:prepend() {
+        write_pgo_wrapper
+}
+
 do_install:prepend() {
         ${WORKDIR}/check_build_completeness.py ${T}/log.do_compile
 }
--=20
2.34.1


