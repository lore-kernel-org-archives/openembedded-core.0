Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EABCA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48827.1791301599684548116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E9BJwVRl;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c45111bebso625730f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301598; x=1791906398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P6YwkdRt+tx3jZw9v0GfcUpUDFRDNtuky/G/gmwrtGs=;
        b=E9BJwVRlPU6omMUAGt6Ruz1/dAOfSSOfyeBKiMZaFHIosqjNHJP6Lqrq4oy6+dUMAB
         YMVSxvjnQYME3UThbdSK/7KIQatSttsza8FDQmRLJ0EzJRm81RCKDXXFskpydllEXIXd
         UNH8gXogljUuGW8ZYoF8htvd+OsyRVTj79zcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301598; x=1791906398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P6YwkdRt+tx3jZw9v0GfcUpUDFRDNtuky/G/gmwrtGs=;
        b=upzOtiPVduDTdDQriBNy0sXDMTVbf0WOm6KHPBwSlZMidw7Iznpf7fJNIT2dVqKogj
         YTlWQjxBl2x2F4W9DIs83ej5CGwRM4CxBX9dGGEy+NAjwXpvrmwbmKAZk76w/GGG+drU
         ny5u5IDwj+qh73GWM99YVilS5rC4lRt+JrI4WzpHdoEbEEPuSJBKH7TE6fv+aLcFKijT
         sDMP4C+YsXCyEWEMHarpyVgQVtFxCuZO9JUY/lm7gGA0CxmZyeseh92ZTF2PEwm19jtK
         Uogu7nXolEOB/An155DRi3TRImf0mU5eLVLCh15+kjFqog4aoZw9fIyxZwbIydH+cPs2
         fZNQ==
X-Gm-Message-State: AFq9FYKLtGAGQaiWNkR5DcIkNA9MQCVm4KrOycDAaYVlhYFZxeITxrIF
	YVfKZba6RMhlaJM16vcJrYtg8dv0GRg9aLdzBSkHgLRODsJXa3m5SkZ0Eh0jWNxEzFI7UybzPOe
	W/vIHEH8=
X-Gm-Gg: AYBFou2dixOD+l57MoiSiKvsob2WWeFv6vJd1RHB4w/Z4VgBrT++t0AMjK7JOaFDjoj
	jbKoRDP6ZGLUvXQRiqX0EKRKRGcJ+ogl98V0+zDMDnDCKFRZTE/13ceqABdG5gbG55QoGInBzxD
	dWizRd9sOumiRBn0DGtd8Fq1sGhuxID8m8f3QJ/wTcYSrZFhR+MKhaCmJzZhsPd+1sG3wAOzGCi
	qDx+Jfgjg9mtlkyxZf0T/xwcTa3yhHxg5+1cxL3gs5d8aOm3CWyt6qlfMX3nkB49z1YXJYLv3Vk
	ML9olOnZ0XJ6/60fC8P0ZalrksgHTypx7accruX63+WWQ9ejwVJtN8l59Hth57w0KE9Muhb/dBy
	ygdafJ9h2KzlS0MwYAGOq6QPSTEatDiXXT5CRJczyLaSzgizMn0EkrYteqPEJoBOpnZLkTpYD78
	tCDVS0zxLGXk8tKhOIGKueACR156T8qrr5PGbWHAU3/DTu0qbuD0P+1nVsz8SllZQ7ofG5pYnwP
	vwozDlBbkzfXOR+yg8VbkrfYAgO9YrZDI37+ZqAiRBUoSvJPPiOvjU3D+e1pwXueHu2ohzpdq8s
	Zm0HOw==
X-Received: by 2002:a05:6000:4918:b0:48c:43e1:a332 with SMTP id ffacd0b85a97d-48c6d0ebee9mr3572137f8f.7.1791301597165;
        Tue, 06 Oct 2026 08:46:37 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 17/19] python3-hypothesis: upgrade 6.168.0 -> 6.168.1
Date: Tue,  6 Oct 2026 17:46:03 +0200
Message-ID: <a04168e182bc5279e5f361c3168066ccda2f79ad.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247305

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8ba62ee7b86114cffc25a349573bf48eafaa361)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...hon3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.0.bb => python3-hypothesis_6.168.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
index ec75251e705..7386f26afa4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "72af51087b7b5ab21c49f0d502f803c20897678652835596bd2a8b169a39135e"
+SRC_URI[sha256sum] = "fd8acb5c67f260dfbdcc1b2dc95ff48b2b3f90708ae595c76f591bbf3f6f8eeb"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

