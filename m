Return-Path: <paul.gerber@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B6FC83038
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 10:44:13 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.9865.1724928245779927512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 03:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=WOmGL2MZ;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=HgYK5s4J;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: paul.gerber@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724928246; x=1756464246;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mYOZt3N42oT06ejZeR75AGpfBtoh6RZ22kTZOC8y/jo=;
  b=WOmGL2MZ8ielJG8QpHUfqwe+M2yVYfQAQUP+Ae1r2zonzJ48utwsI6gS
   ax7mEtck4/inuKUrw/K3qbjarbhXq1knz/AsJdbw4zLAcpqFqb5ecazgL
   fFYTAFD9iouGwIWWj/y4hlyjG+Uu7mGDNmqvKX1yEcMR/n1p+hv/eE2cN
   WNnxIzipfq6qxkLYUiFDNw/D5Nl5kwsO2yO1+rDtiDQYojDPK7O807Wim
   QWPpusCvKm9E1Akug0ozdIE9aiRY/C7t62ut6EMZitDAMDDt4mUQ8x+6k
   oxbrz86jkU1B8gG5wg7g8aStarqtZCmvVuuXxvYDSDFrDFa6xDauAK0fB
   Q==;
X-CSE-ConnectionGUID: tZfc3IUMSvK4eCrnw1jyTg==
X-CSE-MsgGUID: rU6N5JA9QHa4hWQOoMIgoA==
X-IronPort-AV: E=Sophos;i="6.10,185,1719871200"; 
   d="scan'208";a="38656917"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Aug 2024 12:44:04 +0200
X-CheckPoint: {66D050F3-31-6568578B-E2E34638}
X-MAIL-CPID: 524A69DF3479B6F0F5943C7EA1918B11_3
X-Control-Analysis: str=0001.0A782F1B.66D050F4.0012,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F4131617D3;
	Thu, 29 Aug 2024 12:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724928239; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=mYOZt3N42oT06ejZeR75AGpfBtoh6RZ22kTZOC8y/jo=;
	b=HgYK5s4JbhzyOhurNgvhMN1VMyGWy2OohC6pAqN03h+/xkWnouMX0KECTKyL6Xx4UqTLvT
	uyw0HGd4fzHvJVF6SWoXTFwRZfa2leiIuQxFjYWSi7/L2zrozxEri1mdf1d2CDJOq3R+Ry
	WOuKBnlFekZxndsZec++WvIwqv7eyA1TyxuAn8YUYvpuTnuINpyMRyIzS4rJS/SuDgn8LW
	ME1kzLbdZbCCM3jwxr3M5zVbnNUoOtBs18ShkxT44xE0/gnGIfBjRae7bJ8S1kRxsT5xX4
	kCiOnxlZ1XS2flMvndmYGvv9KvH3Pvam1N4KFqAE2CeRA6Kf8LDjUJqHmicUMw==
From: Paul Gerber <paul.gerber@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Gerber <paul.gerber@ew.tq-group.com>
Subject: [PATCH 1/1] uboot-sign: fix counters in do_uboot_assemble_fitimage
Date: Thu, 29 Aug 2024 12:43:36 +0200
Message-ID: <20240829104336.2223531-1-paul.gerber@ew.tq-group.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 10:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203910

Without unsetting `j` and `k` for each `UBOOT_MACHINE`, `j` and `k`
are incremented in the same frequency as `i` and therefore `$j -eq $i`
and `$k -eq $i` is always true for the first `type` from `UBOOT_CONFIG`
and the first `binary` from `UBOOT_BINARIES`.

Signed-off-by: Paul Gerber <paul.gerber@ew.tq-group.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index c8e097f2f2..3e5f5dcf66 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -356,8 +356,9 @@ do_uboot_assemble_fitimage() {
 	fi
 
 	if [ -n "${UBOOT_CONFIG}" ]; then
-		unset i j k
+		unset i
 		for config in ${UBOOT_MACHINE}; do
+			unset j k
 			i=$(expr $i + 1);
 			for type in ${UBOOT_CONFIG}; do
 				j=$(expr $j + 1);
-- 
2.44.1


