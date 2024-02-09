Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC19C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 12:30:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9940.1707481830499039268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 04:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69D21DA7
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 04:31:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF1B93F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 04:30:28 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: remove TMPDIR workaround
Date: Fri,  9 Feb 2024 12:30:27 +0000
Message-Id: <20240209123027.635200-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 12:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195205

From: Ross Burton <ross.burton@arm.com>

We had to export TMPDIR because Meson was writing temporary files into
/tmp and then trying to run them, but some systems had /tmp mounted
noexec.

This is now solved upstream as of meson commit 1e182b5 (which was part of
Meson 0.52.0), and these temporary files are written to the build tree
instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 33043231b48..a849e872976 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -152,9 +152,6 @@ meson_do_configure() {
     # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e5991=
6c18901cde90fa2b3
     unset LD
=20
-    # Work around "Meson fails if /tmp is mounted with noexec #2972"
-    mkdir -p "${B}/meson-private/tmp"
-    export TMPDIR=3D"${B}/meson-private/tmp"
     bbnote Executing meson ${EXTRA_OEMESON}...
     if ! meson setup ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_C=
ROSS_FILE} ${EXTRA_OEMESON}; then
         bbfatal_log meson failed
--=20
2.34.1


