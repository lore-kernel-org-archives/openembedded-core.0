Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D843CFC5E8
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 16:06:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.47525.1728576396139497526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 09:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6E7497
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:07:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 412B33F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:06:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 09/11] insane: optimise test in package_qa_check_shebang_size
Date: Thu, 10 Oct 2024 17:06:21 +0100
Message-Id: <20241010160623.2880937-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010160623.2880937-1-ross.burton@arm.com>
References: <20241010160623.2880937-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205418

Check whether the elf is not None first, before doing os.stat() calls
on disk. Also don't check anything that isn't a file, not just FIFOs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 05b8538940d..bec349e97cc 100644
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


