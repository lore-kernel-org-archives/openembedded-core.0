Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279D3FC9810
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38377.1774823887692166431
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=umaKER1/;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso38127115e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823886; x=1775428686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+R7PuJ+CsfXjuC7V/6QmmmvMOueIhSFAnJLctsI/fs=;
        b=umaKER1/VSMEN2iVxEocUWo4NZU62FooXqtA0Zf1QInjpXvLd2QchLyrhjnK/Mot1t
         9MvyHqIyIPdfpPKHFHpR1zfq3//WM+nV9J1j4z4+NKoOJFzQt2J2TF6i3NpjWEmxVszD
         JD8Bq6DLeG51MBEac5QgOsVREPH/oOIGkxlR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823886; x=1775428686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T+R7PuJ+CsfXjuC7V/6QmmmvMOueIhSFAnJLctsI/fs=;
        b=MW3UL9JqXK+Sdm3GLtAXDLfD4sCkYnhC4lTtnoaW76OGalk9+aBqEd5Z/QXL+Pzx1a
         XbdC0qc/xOxNKcJkpyMVwOCOzRnQRM9YUAQAj+QbvsdrT/LtxEVB1ZAcL7UOQEYVfhcG
         IBPELvq1My0EhSpsIHsZJSlOeuUTqy8cl7sIITpDzHxchTIqoS+wzJPkVLM2zbmmFMn0
         tTADF2LqQaXquuiAp9fRWgvsCi2YeeP6zcUtC5hRDjcCvKpqHWxJY9t6nPB2w7xALnHI
         3it7/0ZgbC2s11VEuBzGz8/q4gA0afVUbpK6VVX4skmcrLdANuIm+CpmYvcTJGK1Pu9a
         w58Q==
X-Gm-Message-State: AOJu0YzD1a6GaehVnDKFzCz2PnofT65GOZ+JIYvoakojdVyYYucRSgXq
	yqFpEpHn/+cws36y0j2pCOo3wjIICLc0qvbJcOeqW247gidYeq2TuGY4MVQl5GQZzG1ZunRaKeZ
	rGLpLNCQ=
X-Gm-Gg: ATEYQzwFxaNata/P2TNoFLiCxY97na9MwJKj5Y1Ic+nGdQrZNAadbJhFGQ6Io2ZQzXn
	anulr+lSqLQvGYqoPJzTppze4vL41KdoII6CVQRnXi8qyCBoGwfxK5NYH1s8tz6HOFPtSIeN3xh
	0GLOaZtfqWIhRSSTLt0PmwiRi7iQEpHjQttB5v0EjFbyEGHk98ePLU1e77je4VwSbSjoKQwbyIe
	gdqeZIt/V4WXTjTB9FlSIdNaVcfJtQos7Gv2JiHJMfvBrLp3FnV76iU5e1X3niQ9N2+2h52swAd
	cII58UQN+2Ue1v2WdBEAzV2h6lUkUwEIXuKolE8f/uX6MrtWbyF/kXUXLXQJeP+4ccrLGU35uqR
	WX8x/gyvi//Bi78KLo30Od6Zk8kX+3/cCprROhxFCowC1Sy2Kccww5nueIyQchzuiCO4i3d69Ql
	/kT7epn1ZhE+HqleXWkheKFCrs2MNOh0FK92EieP3HrIJH3otmoYvu/IWHvxSx69aLc6aimMVLj
	Z1Mora+ik8be3Kpgzb27ryEaY0=
X-Received: by 2002:a05:6000:400c:b0:43c:f583:126a with SMTP id ffacd0b85a97d-43cf58312e7mr9788289f8f.14.1774823885743;
        Sun, 29 Mar 2026 15:38:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/16] pseudo: Add fix for glibc 2.43
Date: Mon, 30 Mar 2026 00:37:37 +0200
Message-ID: <ebe917f3d1e858ddfcc1bcbf209ed55b422a527d.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234163

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[YC: upstream commit 7d35b0e7929d666af783db835a3a809f8f6ce429]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0f063f18812..3ae560487bd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

