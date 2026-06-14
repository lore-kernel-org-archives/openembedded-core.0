Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0053BCD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105070.1781424276218689850
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DE0TlnWb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so17399655e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424274; x=1782029074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pr3Ed79MHSE4V1KP0efz1Oscg6RRHZqbyElkzfJwALE=;
        b=DE0TlnWbW0fQDElKoA5DGb9Zj7sYojUmU9woC7+/Z3H3p3ESkwuJF9kDLkxMMbg4y9
         V1RHSLYvrOXz3dJsaiKWzdTRCeFdexhtn/IwXcPyslQYaOiZ3zzdHDuMxhC3ZFUnrtm8
         PYWhz5JFYcaT2VceeeF406UtCkp8CBEG99u/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424274; x=1782029074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pr3Ed79MHSE4V1KP0efz1Oscg6RRHZqbyElkzfJwALE=;
        b=mCIIJdM7PAn8yZN/FISddidBDLaj/ifqhHOnrMTBii1MUs0GMWu0eP3IAhnfqIBT7u
         x996Vx8sQE6L9PXCAiJhfYUeJmfzd9sqGJmsYj7qf/+BQrwh6FO7cp0QTjwUtfpoG9TY
         pELSk9CPDnDe/0rxa/5IV4Gsl/CICLvXKemTXnC1F0uiwFc6BBSjGGz6T6NYamLsRNzW
         zstbFJgxsk2F3R/h3dhiVIvY4sbHTMaBjpN5OTJw1eFS8Xbh1KBrinXgJHzbn4rKsYip
         6tzaK0pyAPzC9ahi5Qg8s57E/dl67wwGRkQaY1fD0iakz0zgdBLzJfhpLiUsaI7k09Gi
         VQQg==
X-Gm-Message-State: AOJu0Yx0nWCVU8W1lrdkNng6sYsebJQoSpfcBSoUrsRQ17/bVzgnw3F/
	uDcHsqglzY5nzZGMmHfGSx4g62DVUB2WN449t/VbdDXiacQt61ZmIqLxhyW/u4AiZ12MKIJRmaO
	jrpRw
X-Gm-Gg: Acq92OEyYdtHp2VN643GC4uug0g5NPF9tm37bqoT7lOtwu6oZRTrR4UMR89tFcnSDE2
	UEVGUR0bkjRiw2tSktgludvEV/rdGUMimEcLrfmIL5RbZnEXRIUzUBIYEoaB629vxNI1wqSTyjd
	mbUnG+tBsjOP+OF7+IQZ2QTlQIiWteHz34s+vQfxZ/bj5F3pAneNpDSb0bZwDU3MsT5/PvAmME+
	FqfxQqyLRFNdqoEdAj3Y6lOE9gs3RacqE49bckXMvQMU3FB0Sb3TS5yBQ/C8pRWMCOoXR8uf7rx
	LNCs4P24/O8Z0Qfn2p4VX4Q8OcthoutFR0zVWa4NWwOw3rS0uVGg5stxQdeaAYKw1Mc7GuehHs9
	5i+ORwv87VltvgW0iHqYuj6JC20O9zOGudekF1lhVEdzsrdscmjzGB3oTGXG1dnrLMX4CDoeIZl
	Z4tnrswFQr2b+oVNWdi/dWrFnQgxzU1OT1TlR+zv7+3FVfz/IzJEeE
X-Received: by 2002:a05:600c:3b15:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490ec522d44mr137354385e9.33.1781424274505;
        Sun, 14 Jun 2026 01:04:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 56/56] xwayland: upgrade 24.1.11 -> 24.1.12
Date: Sun, 14 Jun 2026 09:03:07 +0100
Message-ID: <20260614080307.4017177-56-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238740

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
 

