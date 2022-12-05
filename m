Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03D0C47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:34:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.5369.1670207660292301165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fWBGm2kK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207658; i=@fujitsu.com;
	bh=pYNOfKF2TcmRq+CNBz2+08BGyRizFNPzH7XaBEILOkY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fWBGm2kK403duYq9AP1/vsQpNl4AYv+/8QcLnADx6CIZgUUWMPoT3UsdiIfzKcMBr
	 7cTVxPOH3L0BHeBIRwOU6mOgq0zoDYsi7lvcKI/xGgX0oh4Pf8eeFP8U/GBXXXqelo
	 VR3nT3+R2zO5VaW8pmQCvlIsxet1GyFS37w/xv1siwjnvTaWsp68d7YOqduTm9wiV9
	 KveBA45TOGOaX42us0CYDiDHnxCn4Iamzio9XiBhQPqDc9eY6fiVXYKUSnI6QlSbas
	 ApQ+8tBohQGp68pDDfy+jUayoUKiSMQ6T7R5vRsWFJon4hk1r23fGCAddv/vHDEiqS
	 ekRJ+QYUMAVwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSXdlRG+
  ywYaLFhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aEfy3sBdOFK041rmRsYDzF38XIxSEk8JhR
  Yt6zK0xdjJxAzjUmibdfOSASuxklvv7bwwySYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQcLCAqYSq07bgoRZgMJf2w+xgNi8Ao4Se3d+ZAexJQQUJKY8fA82kVPASWLj3i5GiLWOEi
  sfNLNB1AtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQtTi0qSy3StdRLKspMzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J
  0ctLLdnECAzblGJ11R2M55b90TvEKMnBpCTKq/SoO1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  G90WG+ykGBRanpqRVpmDjCGYNISHDxKIrxC3kBp3uKCxNzizHSI1ClGRSlx3t5woIQASCKjNA
  +uDRa3lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ87r5Ak3hycwrgZv+CmgxE9DijfxdIIt
  LEhFSUg1Mm6f8+MB2tpNv5smZqmfjj6Y9XfnNcpe54cZbFvGzE/f/0m3SePMpwMVG/uudoL0e
  i7XdzxTP4JzGydJmL/hXW/uScIFl24Z9Bp+X/FhkqxMm0GjN2it4J3p1xXSVo/Z3v/c7B3bos
  wVPNW3b6slQl3Jv0rW1xvMlpu+KnqA53+u9ZTN7UND5qy6nHwd3HL3Of97/1OxTiiX+348JTC
  la+lOQ24FVW+1O4fEpwaWXQw+xzw5Xd7jmo3qyguf7fdlvAne3den9vXh+od56tdcfvZ7X/ch
  iPDBFNEpQ78u5zc8MdnycsZ1j99Wyg2rnefRftRtJ6szM2bUiyuWpr0uBgZSrxcFA4Ut6Zqu1
  zm7zVWIpzkg01GIuKk4EAGcWjbdWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-571.messagelabs.com!1670207657!127295!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15778 invoked from network); 5 Dec 2022 02:34:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:34:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A21F51000D5
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:34:17 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 959FB1000D2
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:34:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:34:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xz: upgrade 5.2.7 -> 5.2.9
Date: Mon, 5 Dec 2022 10:32:42 +0800
Message-ID: <1670207562-7127-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207562-7127-1-git-send-email-wangmy@fujitsu.com>
References: <1670207562-7127-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174275

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 * liblzma:

     - Fixed an infinite loop in LZMA encoder initialization
       if dict_size >= 2 GiB. (The encoder only supports up
       to 1536 MiB.)

     - Fixed two cases of invalid free() that can happen if
       a tiny allocation fails in encoder re-initialization
       or in lzma_filters_update(). These bugs had some
       similarities with the bug fixed in 5.2.7.

     - Fixed lzma_block_encoder() not allowing the use of
       LZMA_SYNC_FLUSH with lzma_code() even though it was
       documented to be supported. The sync-flush code in
       the Block encoder was already used internally via
       lzma_stream_encoder(), so this was just a missing flag
       in the lzma_block_encoder() API function.

     - GNU/Linux only: Don't put symbol versions into static
       liblzma as it breaks things in some cases (and even if
       it didn't break anything, symbol versions in static
       libraries are useless anyway). The downside of the fix
       is that if the configure options --with-pic or --without-pic
       are used then it's not possible to build both shared and
       static liblzma at the same time on GNU/Linux anymore;
       with those options --disable-static or --disable-shared
       must be used too.

 * New email address for bug reports is <xz@tukaani.org> which
   forwards messages to Lasse Collin and Jia Tan.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.2.7.bb => xz_5.2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.2.7.bb => xz_5.2.9.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz_5.2.7.bb b/meta/recipes-extended/xz/xz_5.2.9.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.2.7.bb
rename to meta/recipes-extended/xz/xz_5.2.9.bb
index 88ec847c15..7da7887b1c 100644
--- a/meta/recipes-extended/xz/xz_5.2.7.bb
+++ b/meta/recipes-extended/xz/xz_5.2.9.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     "
 
 SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] = "06327c2ddc81e126a6d9a78b0be5014b976a2c0832f492dcfc4755d7facf6d33"
+SRC_URI[sha256sum] = "e982ea31b81543d7ee2b6fa34c2ad11760e1c50c6f4475add8ba0f2f005f07b4"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
-- 
2.25.1


