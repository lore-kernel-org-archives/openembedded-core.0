Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2514FCEFC4D
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:31:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4657.1728415876757632556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 12:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D03ADA7
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E234D3F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] insane: optimise test in package_qa_check_shebang_size
Date: Tue,  8 Oct 2024 20:31:02 +0100
Message-Id: <20241008193103.2429829-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008193103.2429829-1-ross.burton@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 19:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205309

Check whether the elf is not None first, before doing os.stat() calls
on disk. Also don't check anything that isn't a file, not just FIFOs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 686040f7a48..be358f49993 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -82,8 +82,7 @@ def package_qa_clean_path(path, d, pkg=3DNone):
=20
 QAPATHTEST[shebang-size] =3D "package_qa_check_shebang_size"
 def package_qa_check_shebang_size(path, name, d, elf):
-    import stat
-    if os.path.islink(path) or stat.S_ISFIFO(os.stat(path).st_mode) or e=
lf:
+    if elf or os.path.islink(path) or not os.path.isfile(path):
         return
=20
     try:
--=20
2.34.1


