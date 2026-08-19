Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019ACC5DF90
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10414.1787155074812124912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tpv6oaBP;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so5167815e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155073; x=1787759873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JjvnlLkpdzifuFz4eyiRIp3KKbY0/lVsSzU2WWXZUV0=;
        b=tpv6oaBP/q8MaZWso9hCjqBPZ6oY79TxHB/1x59Zgxg3AcWDURG83u2LnSei1TUTET
         3nVAX+dXA4ZIokcI+BdkDFamV1Az7xB5Ye4e0M3Q9OoASV2Ti0ZUNoK6iPORdRVbG4qs
         ZaJCzWEFwAVj7RfXLJInDIxenp8bGOYXmK//E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155073; x=1787759873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JjvnlLkpdzifuFz4eyiRIp3KKbY0/lVsSzU2WWXZUV0=;
        b=G+IFSz5KFo24T0thgv7PC0RggjQYYmDKEAjFi63hEvyR2a2LcD2sJTkVScW62FT/ts
         51oE+AYfuKC/25EcLUNjgEIOcRjZoPIYfP66Z3S+irkh+gT2wLK5qcpbhJd+xL6WTQS7
         Ri9A0ohLgxgAMw+b0mBNRl8rkqF6e8rqSUzUQZ1WASS0RfYBuaDYwmAtyVwfrqRCh78k
         xecHsLkLq3kkKA06cotlBd/x+J9aWtrBz0S+m7cT9hVaTxGQcZM8vtaN4Bq5zEWzavFT
         mZWz4l5VPE9gOuSWUu9ekRlnNpuJCT/cRXGAcTi7ZUKX7/ARptNr2cWJxoHI6Mx5Ip74
         4Rxw==
X-Gm-Message-State: AOJu0YwWQxazEtUVVYT3IrESc2INCeJZWTeqfFdGDi8oct91rqIIjSYU
	oh0Iy1CpNyHvWo+lX3RBCV3u051NdX6sv6e4XdRmcAZW1jzB72HUMqfSP667KppmCrn/Z9pgAdv
	LHsqqls0=
X-Gm-Gg: AR+sD10O9ukDoJuyJ9ZSP6Epzt4lIzpzpOgyfSgxLcXb0v8DNp2dypDZw6Ac8RCbdKM
	bPt5gvzaQIXkvSqXukYfRidIYqZdLRhEPeWrdEpPKpyvnQUB2TkVsuls8nR8P3fpWW4wXKyn9XN
	JXT7NcMPLB5dj6gOEYUtQ3ALHbH9GxDukVjCTwrIkkaQDwm4Gj3CQRJ0SCYfMFoOPpqit1AJCBU
	tRxZGurm270E+zW/RB/EdR3C5xabdtFDE1BBKwzlNXGqov1hy5Ny0KW28rUBaaQL9Kpz25CRYB5
	nQh0GI96FA5+vLtCzRviBom3wYB6f2xbJ51R79cZrVKu9nf3+2N+nZuqD6fZxZ78x/IM14va0GT
	CrpnePMq7w5ZIjDdTV8XUcxJ/hhGNQqJDCnnUCB3hxiNghye6bkheNElmJkxTrNpGJ4/fjd0fzH
	u2njEeTGAWv4pmKz6hYpI+yDLOj13UiXXdF9lSJ86R660QOX+D4LpAIFNmsLcFm3eeHfo8WUE8J
	1uDrijoXPmod/Q6pTkUp6Ldb7C5p+sVBV594dmsqEmtIP+PifPEXT3EvcLvr9+Ukas9vazl5CR+
	5Tp6LlSFiNvGXp32fnpzRKvJBqPX0+qzMoZ7UVwOiq5/EchzD9U=
X-Received: by 2002:a05:600c:1f94:b0:499:8807:345f with SMTP id 5b1f17b1804b1-499aa1b6994mr93856195e9.13.1787155072960;
        Wed, 19 Aug 2026 08:57:52 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:52 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/37] xserver-org: update CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:56 +0200
Message-ID: <1847e619f756eb0bba2bf7597a21b964cf626427.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243761

From: Peter Marko <peter.marko@siemens.com>

In cvelistV5, CVE-2024-21886 uses CPE xorg:xserver ([1]).
Detected because this CVE is shown for xwayland recipe.

[1] https://github.com/CVEProject/cvelistV5/blob/cve_2026-04-12_1800Z/cves/2024/21xxx/CVE-2024-21886.json#L646

(From OE-Core rev: c3cbb4003424f8b1e1faa06857096f4b1e609fea)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5311f2a08842612b74472c843be2ae0d47cff6f5)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 815be6a4986..9bf5137de1e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -19,7 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
 
 UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
-CVE_PRODUCT = "xorg-server x_server"
+CVE_PRODUCT = "xorg-server x_server xorg:xserver"
 
 CVE_STATUS[CVE-2011-4613] = "not-applicable-platform: This is specific to Debian's xserver-wrapper.c"
 CVE_STATUS[CVE-2020-25697] = "upstream-wontfix: \

