Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB7FC19F29
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 23:11:56 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web08.13651.1658877110553130925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 16:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26QNBldR024605
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 18:11:50 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] openssl: Move microblaze to linux-latomic config
Date: Tue, 26 Jul 2022 18:11:46 -0500
Message-Id: <20220726231147.3744000-4-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726231147.3744000-1-mark.hatle@kernel.crashing.org>
References: <20220726231147.3744000-1-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 23:11:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168521

When building with the previous a number of atomic functions come back as
undefined.  Switching to linux-latomic fixes this.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
index e50ff7f8c5..04aff04fab 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
@@ -77,7 +77,7 @@ do_configure () {
 	esac
 	target="$os-${HOST_ARCH}"
 	case $target in
-	linux-arc)
+	linux-arc | linux-microblaze*)
 		target=linux-latomic
 		;;
 	linux-arm*)
@@ -105,7 +105,7 @@ do_configure () {
 	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
 		target=linux64-mips64
 		;;
-	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
+	linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
 		target=linux-generic32
 		;;
 	linux-powerpc)
-- 
2.25.1


