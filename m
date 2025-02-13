Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3389DC021A8
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 20:02:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3558.1739476940205723530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 12:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B8361682
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:02:40 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8294D3F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:02:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] sysvinit-inittab: exec getty from the wrapper
Date: Thu, 13 Feb 2025 20:02:12 +0000
Message-ID: <20250213200212.1694055-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213200212.1694055-1-ross.burton@arm.com>
References: <20250213200212.1694055-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 20:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211368

Instead of forking, the start_getty wrapper can use exec to replace
itself. This results in one less process in ps per getty.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/me=
ta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index f5671ee53d2..f6a41428f76 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -17,4 +17,4 @@ case $(readlink -f "${getty}") in
         ;;
 esac
=20
-${setsid:-} ${getty} ${options:-} -L $SPEED $DEVICE $TERM
+exec ${setsid:-} ${getty} ${options:-} -L $SPEED $DEVICE $TERM
--=20
2.43.0


