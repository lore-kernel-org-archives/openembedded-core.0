Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C4AC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:03:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.40693.1681117390663693819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hGFqbSP4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117388; i=@fujitsu.com;
	bh=s6CwrZinactbs7mEFJpGBxWXVj+E+/MjuSpfZeMV9gE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hGFqbSP4+XY4G/T2aO+bWAT+xOtfP13fTwFm6weZL6T5gQmZ0JcEm6eg6xFsEnoC6
	 xYpU2As/rwudvtCjbJxpX+2VgnOqixBH0s8CNzHDzX1XK76bnMTq418W+AR5FP1Xcc
	 gDMQcFzdsGA5e1nBPqbO9U367mbHBo8zCSBC0o9bkYSl9UJTlhOKBNXVnMCM/NPSjV
	 iEi/eAqtOuKAq2UcltjbSQz8lPJV3Tj748ibY1VHnvnumjva//doBR1iCbpn+0FuvQ
	 zL2GeXFLZdZIWNyPc3IBMM1AEfLx7IuMHw3ZWHyXZgEKGBU6JNz+gJV8IqVy9womxs
	 nwdQJLtb/Y9lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWffMBeM
  Ug7PrhS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oz5j78xFXRyVvTe2cXawPifvYuRi0NI4AGj
  xNf5Z9kgnMtMEhP2TmSCcPYwSkzb85mli5GTg01ASuLG/f9AVRwcIgJ6Elf/iYKEmQVUJF787
  mEHCQsL2EicX2MMEmYRUJV4vOYOI4jNK+Ak8frUNXYQW0JAQWLKw/fMIDangLPEgWWPGEFahY
  Bqrk6TgigXlDg58wkLxHQJiYMvXjBDtCpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVoVpxaVJZapGuil1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmb
  nJOil5dasokRGLgpxQlpOxhb+/7qHWKU5GBSEuXt4jJOEeJLyk+pzEgszogvKs1JLT7EKMPBo
  STBawCMBSHBotT01Iq0zBxgFMGkJTh4lER4s84DpXmLCxJzizPTIVKnGBWlxHk5QBICIImM0j
  y4NljkXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLvtMNAUnsy8Erjpr4AWMwEt5nIxAFl
  ckoiQkmpgkhdOCLi2f2G/09LDFyUeeS8olJ9be5T74pW/JzqnHdrfmaAdU6O3duPC3btcH3ao
  WunMehVsWJW1Lq0q+8KeRx1OnEbnfn6eIT9/cTP/opR3544JpFb8sf4yOV7gzPuLZpxm12eW7
  Um9z3bcXGzJF1XGtoU3dJh38ok7dDLLn/jWnWRbJK9kryXm3Hc5zJ+j4sUffl7Zc03x96QeM4
  j8nzT1w61FV/6cLHmjKnLXbdfWwicPHi7KubMniV2t4lqO2KTO5Ahnvhnx+uzzel7/usZaU9L
  GbKe8eE10+bcShx+Vz/9GOJWt6bu3TkptJyvn3Kc/P6h/ktN2OrQ1wfVasMnNtbxf61ax5Fbn
  JRVcUGIpzkg01GIuKk4EAOsFjKlXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1681117387!327808!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16872 invoked from network); 10 Apr 2023 09:03:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:03:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BF5D616F
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:03:07 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B29B2155
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:03:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:03:06 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pango: upgrade 1.50.13 -> 1.50.14
Date: Mon, 10 Apr 2023 17:01:53 +0800
Message-ID: <1681117314-24836-4-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179861

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix underline thickness in scaled contexts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pango/{pango_1.50.13.bb => pango_1.50.14.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.13.bb => pango_1.50.14.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.13.bb b/meta/recipes-graphics/pango/pango_1.50.14.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.13.bb
rename to meta/recipes-graphics/pango/pango_1.50.14.bb
index e673366dc7..ec7a913009 100644
--- a/meta/recipes-graphics/pango/pango_1.50.13.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.14.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "5cdcf6d761d26a3eb9412b6cb069b32bd1d9b07abf116321167d94c2189299fd"
+SRC_URI[archive.sha256sum] = "1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


