Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CD4C61DDE
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3060.1787945909104348152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zewwgp7z;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12678315e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945907; x=1788550707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zWJV2COg3VraLDsx/2lOGKnNGAKGVskzGl54RXQiYP0=;
        b=zewwgp7zllPqi/KQ6Byhg2TSFHoBjE0u7BoO4yIGk9t+832Ck1ezF+we988aq9dhvi
         tn0UTo9p48AA+1EDufS4sS1omEZ15ImQtdXS2AIIxN5jc/dFE76PRiHv/cufZEvDzcXP
         ZgprEzpDUOpmYWcHB8YrnnW+0FjLScriJk/PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945907; x=1788550707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zWJV2COg3VraLDsx/2lOGKnNGAKGVskzGl54RXQiYP0=;
        b=bOveEdDio7RMY0V+N4QmY5qJGBZthCpMPdBPyXgNG7L49shiCJIurW3iUYvlrUJ0Ni
         xo2CRA81zeo1LcZFUBXuD6AhR1L/5TtO2K2CNJT86Ojyx/CrT1RL0w6I+AEntVRmnXtk
         H0ip7nJjcv78A48l80v2NsQ+kGzK26YeFf7HUvWH569PezTAUKEsV3h9U5GVO57ilp6c
         4VgS9qQtx+WG/nJSj4QiKvUV6HR2RIJmBrlRwM9rQpWF3VHIUKf4W9varJIRxV5qzYjD
         e9h8zRiNgP+4Dtnfmu0AxPCty5p+++02wKckUtGNH+GXsJm3PNadpurMtZHFpTOd/3sK
         01eQ==
X-Gm-Message-State: AFuF++lu8qWk7wXBEi//SWEUpCmaMiqXZDEBqMwUJjNMGr4sXLhex1qg
	VvrHo1WeYis2Zsf8J09ELJ4KCc+6rWfZc7Kjqk+YbZxPRXQlbHT1VWZ177ko/n/FDAd7PsdXEgH
	5dpmsmbQ=
X-Gm-Gg: AR+sD10gc820/lnYOYGwNOUg2SbkAfmpNvh9mVDOH3cNAFewn0D0pHGSUEAfu/aUqED
	uV2EPtRm/JM8k9csGzO4+nWl/r7yAaVRIi7d2Cb0+Dj9khfP7pUNy/pyJ3qOIQcI9/jSuipmL+A
	9GDJIkDaiLsX9ZE+TxU/GlI6g5nhpCiMj1d3Npo8TcA85j6gs4eNbFt5IsAsnGnWNZbeqd8w9n9
	lDcr+rugpJRgSDppqgRSv2JfeZ8dfkv9EXiaFLfvAoH4LyJzrE5GhxgYHoZUyVYhnCekRJA3HyK
	E4ceIrHB2ZT4AeE6zvXX4/j/VFLXxDyxtiF8008+QkLQXL47HDAWo3Z/fLqwFf62s8VAuxK1g63
	gmZNNqWJkUl1+duL+zaLXb0hRT1uABZtjnV6AmTKM7qetedmJoV4m2IkdaMgnzi5/IzqnidO1gd
	y7hEEdhAPkW4+Ai5vzFRg8KNQXqKJQ+nQZwPFcKFJji1beDpun4DB2RUKk+c3VYykqdVlnt8rbS
	7Cnvl/IyNVj2WQXFoIGq+fuopRCZOt8aByoDSE+F5KDwgTUoabNdNkyDhLiagmn
X-Received: by 2002:a05:600c:4ecb:b0:499:d95a:44d with SMTP id 5b1f17b1804b1-49b91bd885fmr142046695e9.0.1787945907298;
        Fri, 28 Aug 2026 12:38:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 40/56] xwayland: upgrade 24.1.11 -> 24.1.12
Date: Fri, 28 Aug 2026 21:35:50 +0200
Message-ID: <6ea9a3edfd29987d08935c52290847f42228f116.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244601

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c8b621ec16840082b31cf76378b9940851a9d45c)

Release Notes:
* https://lists.x.org/archives/xorg-announce/2026-June/003702.html
* https://lists.x.org/archives/xorg-announce/2026-June/003704.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xwayland/{xwayland_24.1.11.bb => xwayland_24.1.12.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.11.bb => xwayland_24.1.12.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
index eabf66ffec7..52572bfd21c 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
+SRC_URI[sha256sum] = "6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

