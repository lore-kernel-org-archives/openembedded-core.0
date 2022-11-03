Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4D7C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:31:10 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.16144.1667453468931867595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g9v0VEyf;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453467; i=@fujitsu.com;
	bh=nrPzzdpx6SIpfK5U6QqdQFTuNcqumfroAoo2T9fl8+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=g9v0VEyfdbIXwus8YbtXN06YXOkY6qy1PqyqQjtRhnfMknENy8cpHgL11LsxKpJH1
	 o7trJN2/FtK75e6Y1viFmWj/BNCImBCaMcZ/Rg8NcHUV0CElc0tkkT8EgUQLFQ+LRM
	 8v22fMeaPczw6W5VMzOhfnDsxFJ+Aimr3hkGvKitUj0KtdWIXZwahcS7mfXtlM7x3G
	 pZNo/BQg3vRrCl51nhbK/qdWbnumW8H9JKrm3MTlrbzyQSzkoMJsXTLtCXcwx8thpS
	 KOjR7tIolXdIesHds54NLukb7v+O9zaeRGYR+LwoTmzMuAqhwdpaFF1DN4cCWQCL4G
	 /McHLaaigL7bw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORqCsVlJx
  ssPaOkcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFw9TumgjscFbeeXmZsYHzJ3sXIxSEk8JhR
  Yv30LVDONSaJ528us0E4uxklLq5bx9TFyMnBJiAlceP+f6AEB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQEPiZn/z4CVsADFJ153AQnzCjhJfGg4xQhiSwgoSEx5+J4ZxOYUcJb42T4LzBYCqlm5Yw
  0LRL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXVO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDATSlmLNvB2L3sj94hRkkOJiVR3is7k5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfBqB
  SYnCwkWpaanVqRl5gCjCCYtwcGjJMJ73Q8ozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd
  4tAUBFAiBFGaV5cCNgEX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvVpBVPJl5JXCbXgE
  dwQR0xLbqJJAjShIRUlINTGLrVs5cKi3w5t6SnginWy033tb45W7mZjvaymcqk7B59033okfm
  v0VOLt4oylWcvoXPSvPNvg7Dz/9vWkS0hizZuc772OLjRZa5bxY0G+fk/JJa+FFX59Wu6O/f9
  8R9P2r/hOP5DInuW7zBNpdfX+goYQjT5ZvX25HV7JJy+NSl4G9lYp8Y/nAZ69oLfj8bNSNt8x
  Spv08mz5kdEl/cmqh34rzEohue5omF25yMH7X+ENh03WzuBa+jyfPqnqUbbmfebt/c26hx9KZ
  H3G1hvRCNTR63pM7ou7pen+Do4aAvE/Xo7MxCE9l3j4WiPt1QqZofJzDt3C4B9taPTvPmVOed
  PXzPPPHNk9xDZy7e9VZiKc5INNRiLipOBACh6zl/YwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1667453466!2603!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28366 invoked from network); 3 Nov 2022 05:31:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:31:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7721910019A
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6A9F1100199
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:31:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libedit: upgrade 20210910-3.1 -> 20221030-3.1
Date: Thu, 3 Nov 2022 13:30:45 +0800
Message-ID: <1667453448-28192-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
References: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172603

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libedit_20210910-3.1.bb => libedit_20221030-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20210910-3.1.bb => libedit_20221030-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb b/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20221030-3.1.bb
index 5aa83ef246..9195258c10 100644
--- a/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5"
+SRC_URI[sha256sum] = "f0925a5adf4b1bf116ee19766b7daa766917aec198747943b1c4edf67a4be2bb"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


