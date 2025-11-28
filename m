Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B8ED116F1
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:13:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15753.1764335626444525789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 226F6175A
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:13:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 34CB63F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:13:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/meson: dump the end of the meson-log.txt on failure
Date: Fri, 28 Nov 2025 13:13:40 +0000
Message-ID: <20251128131340.3277792-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226905

When 'meson setup' fails it just prints the summary of the failure and
leaves the full details in the meson-log.txt.

  ../sources/xorgproto-2024.1/meson.build:22:0: ERROR:
  Executables created by c compiler x86-poky-linux-gcc [...] are not runn=
able.

  A full log can be found at [${B}]/meson-logs/meson-log.txt
  ERROR: meson failed

In CI systems where the build tree is then thrown away this is not very
useful, so on failure also output the last ten lines of the log file:
hopefully that is enough for context without flooding the logs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index c8b3e1ec29a..45d43319f9c 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -174,7 +174,13 @@ meson_do_configure() {
=20
     bbnote Executing meson ${EXTRA_OEMESON}...
     if ! meson setup ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_C=
ROSS_FILE} ${EXTRA_OEMESON}; then
-        bbfatal_log meson failed
+        MESON_LOG=3D${B}/meson-logs/meson-log.txt
+        if test -f $MESON_LOG; then
+            printf "\nLast 10 lines of meson-log.txt:\n"
+            tail --lines=3D10 $MESON_LOG
+            printf "\n"
+        fi
+        bbfatal_log meson setup failed
     fi
 }
=20
--=20
2.43.0


