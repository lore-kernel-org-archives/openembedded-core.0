Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8511C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:03:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.40694.1681117393502977283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q88fYvFe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117391; i=@fujitsu.com;
	bh=SMO59+k2LYwsRsthhWS69xr7iHc0rrnbdBSHPiqexs0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=q88fYvFeo/xbcw5RuCRgkEHCALVHlNOGIt0OFE71jBCglknpJd/MXXiigp4anQ2FL
	 5ncw80GhS59PUzJRY0WuX7ZUnT4YZC/PwdAeAXv8ryDyPIORoK328qLB1TSo1EFoY2
	 9iEnFriiiYVoyyik81xSOoC6rm5yMzk+dG9tv98MhpuqzBvIp48+XPgPgw1bdXDixk
	 AlgPfxiO39Ubgu2C8F+w2Qyg8ujXWgz0ttWqSvoFxmKXQz7ZYROm7YJZNoY+Qz9k+T
	 WCBv5/ZZgshWDaiUByu+PRmR2Y/1HYX3tPmFAre5mqDIRDWk0kBHKCq1Uaphqs9nbJ
	 KtVVctBWHEnnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpHv+gnG
  KwdTzwhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aUzW3MBR/YKy5OPs/UwDidvYuRi0NI4AGj
  xO0J91ghnMtMEm8/dLNBOHsYJQ7+bGLuYuTkYBOQkrhx/z9QgoNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAuUTfirUsICUsAqoSHS/rQMK8Ak4Smyd9ZgOxJQQUJKY8fA82kVPAWeLAskeMIOVCQD
  VXp0lBlAtKnJz5hAViuoTEwRcvmCFaFSVmX25mgbArJBqnH2KCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNTTVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3JRilvgdjNf6/uodYpTkYFIS5e3iMk4R4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MFrcBYoJ1iUmp5akZaZA4wimLQEB4+SCG/WeaA0b3FBYm5xZjpE6hSjopQ4LwdIQgAkkVGaB9
  cGi9xLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5tx0GmsKTmVcCN/0V0GImoMVcLgYgi0s
  SEVJSDUymfBOlxF+80cy7MctKVYRvvdq0vs+/eXJW/3xennoowO7Zq9RM7ZAVOxoivdrnemhw
  m1fbR/AZ/7x5l6OBk0nQlynB9Ngno0aZ2I4FGQlbTwT8V85VvHJHYEnyksY/c18Vs93wyF9cs
  XDyp/6QwzciJYM4zx/d+ajdTyXXtc3f+AZnb+Uvr2CXaxrbPmksSH27/NvWzc4Rt6ZOyLdvPP
  0op3lhMlPqoXyhqc/+vD1z7YzckRshDh5GjCJy2qHp65tqGp0v1b543c+74/WvFLZLwaeWKL2
  KtfpwMLw7/2dXcnxNd/a29XEud88LKc/Wd5th0jZTrmrf3E27zjP2HVpy8v0l59D87Qulzzy4
  GqLEUpyRaKjFXFScCAC7cPxLVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1681117391!194507!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17698 invoked from network); 10 Apr 2023 09:03:11 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:03:11 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E47381C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:03:10 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D8E401C7
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:03:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:03:09 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ruby: upgrade 3.2.1 -> 3.2.2
Date: Mon, 10 Apr 2023 17:01:54 +0800
Message-ID: <1681117314-24836-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117314-24836-1-git-send-email-wangmy@fujitsu.com>
References: <1681117314-24836-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179862

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/ruby/{ruby_3.2.1.bb => ruby_3.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.2.1.bb => ruby_3.2.2.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.2.1.bb b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.2.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.2.2.bb
index 3f1bbc262b..481fe7c23d 100644
--- a/meta/recipes-devtools/ruby/ruby_3.2.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.2.bb
@@ -51,7 +51,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "13d67901660ee3217dbd9dd56059346bd4212ce64a69c306ef52df64935f8dbd"
+SRC_URI[sha256sum] = "96c57558871a6748de5bc9f274e93f4b5aad06cd8f37befa0e8d94e7b8a423bc"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


