Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E806C61DDB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2986.1787945903822531147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dCRtRkQj;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49557167508so12998445e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945902; x=1788550702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4I0sRohltdVV1CczI79DOiryIQpYS3kx8t/YKP0HYr0=;
        b=dCRtRkQjdq2P0RGssGJxnS9LMT5OC7Gt7YN8vgzXjdfoDDiVuCWHs8CKj7dTfas1Vv
         k9ELD6DJ56iRavMNxysbYxnVfGgcTMM0lbIHkxJOfv+5mnK74rhrAcG5m5SrgrPkwFda
         RMGryw/uo+H9IvIre8i8L8gSRHjwYDxKE8m10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945902; x=1788550702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4I0sRohltdVV1CczI79DOiryIQpYS3kx8t/YKP0HYr0=;
        b=iTu+6cqnrD5Gx/UPZh3/1IQx3JIpsqGbqptmEcwwHHz1bkcA+UjwD5/7LMRxGlsFIr
         wqOI+O0ENvs/gELe6Z3vwhFxNDSEGr6xZawDpH9aSFINetK87quKFzRzSk0arJrw7dZx
         b3Bn73rf+RCHWZ3wPjIaibF6VIi8u5v1toFs8vOd/zedIRpXHia4rp4lyunOv3nVZKxB
         J/U8LvvnNqNbI0D0VbJr+71fJXyT6LorXnDhAdaxkeUXIFpnN8DCdPGydrqUmlm1eJIU
         YOOjjas9eexQOmTaooXTCUGmQjZ7ZInaFYeQZAECvPMEtNccPpRHCWpv24UiyypKeD0H
         bTpg==
X-Gm-Message-State: AFuF++mbKmaPSRTHqFGp1OJlFDplfglu8oDNsA+CEar+9GWvZxaBmz3C
	2eXgT4hbfLgeEH8SMoxMIaOeJbiCYIsUq+PbKuKx6EEk49bZCaVfdwT2ZFo9vnh0P7+4prtsRfA
	Uc7XkOhA=
X-Gm-Gg: AR+sD12j7gte1ZLVmgx0yPaCWjYsO1jHCP+Sq2rSbkvQpLwlS+C65WRluhfxPgG6NcL
	hFD7iftiV7StIBLnD9lzy9R2+qsYt4XY2551V69cdKK0gGo9eUQX1Z0D693Vqsycrzmm6NeABVG
	Xk+4MVjfWV5xXRSrvj94kayD/Ngawz3IBark0eWuCPtdrOMLEKYYtGEaf8diYAKbAv05evA305D
	Gx/oAsGa9Ij50RwqRzgp1B8jawc6aAXAYzVHeCc4u0tvFIFet46iRSQIVaj209PGygZ/xhMi/gG
	8ziZg7fVOB9ZfGiUiCHWMz9Ahi+jlEdyrA8pEi+mhVELosRFu1d9ek8RmnSkWyuN5RjOKrlyiQJ
	JLAqCF02qxaRKYGJANfYHES68N60E4+/rWa09YLGPS7FLSivp1FIUZteBCd/RWOcuo65+aoS+iy
	38+y4+fx0aZ3M8CjVUxNwxZK0p1svhiWBq8Xw3alkYE2uQas7u+tgiHXcmL7S30dfSDv9jlvxr5
	ZLh4H/WEVFDy/Q+uGjbYZB9qrceMgIbjrkPj1q6pCbgaoF6zgILOqBWPkdlp90W+wmz8CGF3m4=
X-Received: by 2002:a05:600c:a0a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49b91c27789mr132375415e9.6.1787945902043;
        Fri, 28 Aug 2026 12:38:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/56] xserver-xorg: upgrade 21.1.23 -> 21.1.24
Date: Fri, 28 Aug 2026 21:35:41 +0200
Message-ID: <22241fdfeaf8053c2cb1dc00a6ab89da242b175c.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244592

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: a0bcc350b93bee2217cb723ccd6baba6fa252e0d)

Release notes:
* https://lists.x.org/archives/xorg-announce/2026-July/003716.html
* https://lists.x.org/archives/xorg-announce/2026-July/003718.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.23.bb => xserver-xorg_21.1.24.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 4a5bf4ba437..14831b1a9b9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From fec2a3c8922ee7526d59e9fa2c6ad0943018b7b0 Mon Sep 17 00:00:00 2001
+From d387580194e91ad73f896a9669757612c8601c92 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
index d3c00e087e5..8d7f9ae14d2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.24.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
+SRC_URI[sha256sum] = "1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.

