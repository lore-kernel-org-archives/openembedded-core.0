Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304E9C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:15:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.64476.1673241329496874667
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qZ9z2HrA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241327; i=@fujitsu.com;
	bh=MA+uCXnoaSzsQr2VCdnVUyhyL+lKtmilVBboaNjmT3Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qZ9z2HrASrCtXv5MLp0DZoLbnWgUa/VvLKvsp1vOl5wFRurJTUfsXe3EfK2Wb633q
	 ggncI7pJ1+fEiwK4xn4rLs9J/sPfpYlyqwUM681iC9QvoTdSht+XXD0RbW2fkeKfip
	 HhYFrvsvurYffryQqHRfQsybJpauVOiC32tR3yaVmkkZ+BGUfehMSts5mgLz7662Qd
	 0f2N+0DJCmDg+xTDSoeQP/VHm68p1BUJtp8KtfwPGQFYgXaC1d/jUBqJue8x3jHORi
	 oHirXEoPvpygAXISDyQQ4KQnrx9xMXsAqQEwtj8ydIlu1hiF6s8q1SfF4BKOcqRkKX
	 rP9BhfRDOIWuw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSff9ot3
  JBoubmCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oy978+wF2zkrzgyYTpjA+Np3i5GLg4hgceM
  EpdWt7JCONeZJC4vPMwE4exhlPh1ZypbFyMnB5uAlMSN+/+BbA4OEQE9iav/REHCzAIqEi9+9
  7CDhIUF7CWu9IOFWYDC+w5PZASxeQWcJJpmLmYBsSUEFCSmPHzPDFLOKeAscaBdEiQsBFRy4f
  IRNohyQYmTM5+wQEyXkDj44gUzRKuixOzLzVBjKiVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQtTi0qSy3SNdFLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctL
  LdnECAzblGI2nx2M/5b+0TvEKMnBpCTKy1G1K1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/f1
  N3JQoJFqempFWmZOcAYgklLcPAoifByzQRK8xYXJOYWZ6ZDpE4x6nKsbTiwl1mIJS8/L1VKnL
  d2IVCRAEhRRmke3AhYPF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwrMQ9oCk9mXgncpld
  ARzABHfFj6k6QI0oSEVJSDUzOiu29Lxcnbqi5Ej957ifZWRv0Ym3XPr9lIBQdYzHPNeQR67Mn
  Yn21ivuXh6zsbZ8ybWPMbK21K++bmfIuuK79bdKnOT9ubL3w0vXngpaF3V9y3/yxDTq6/Anv1
  KeOBk3Gyx2XsFwyeXSgVKEv22Yuw/L+mNpZ+97tbRFd28llpLZo1Rn1u7z+rj+3nizwlexVjN
  k9zeTa4k87bs51DfwpcsVnX2HLHZk1Ee+WJJxp+2TwseW7TNfGa0VS3DNm74mSD/HXq3397kS
  yfurZK1YuVxv9+5cd/XPx9/WAd/01d/84JTtZxPvfmD27KHVhl5Fsv0mb2452zZqASDuhxICk
  fxNOP1PP+e2R3f24+P18JZbijERDLeai4kQAAVzI4WIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1673241326!315880!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22226 invoked from network); 9 Jan 2023 05:15:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:15:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9A4C41000DC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:26 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8EBB7100329
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:15:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxkbcommon: upgrade 1.4.1 -> 1.5.0
Date: Mon, 9 Jan 2023 13:14:56 +0800
Message-ID: <1673241297-28966-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673241297-28966-1-git-send-email-wangmy@fujitsu.com>
References: <1673241297-28966-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175661

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add 'xkb_context' flag 'XKB_CONTEXT_NO_SECURE_GETENV' and 'rxkb_context' flag
  'RXKB_CONTEXT_NO_SECURE_GETENV'.

  xkbcommon uses 'getenv_secure()' to obtain environment variables. This flag
  makes xkbcommon use 'getenv()' instead.

  This is useful for some clients that have relatively benign capabilities set,
  like CAP_SYS_NICE, that also want to use e.g. the XKB configuration from the
  environment and user configs in XDG_CONFIG_HOME.

  Contributed by Ronan Pigott.

- Fix crash in 'xkbcli interactive-wayland' under a compositor which supports
  new versions of the xdg-shell protocol.

  Contributed by Jan Alexander Steffens (heftig).

- Fix some MSVC build issues.

- Fix some issues when including xkbcommon as a meson subproject.

- meson>=0.51 is now required.

- New API:
  XKB_CONTEXT_NO_SECURE_GETENV
  RXKB_CONTEXT_NO_SECURE_GETENV

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_1.4.1.bb => libxkbcommon_1.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.4.1.bb => libxkbcommon_1.5.0.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
index df13ceb389..01966c8973 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "943c07a1e2198026d8102b17270a1f406e4d3d6bbc4ae105b9e1b82d7d136b39"
+SRC_URI[sha256sum] = "560f11c4bbbca10f495f3ef7d3a6aa4ca62b4f8fb0b52e7d459d18a26e46e017"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.25.1


