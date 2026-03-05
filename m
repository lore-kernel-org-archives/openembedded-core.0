Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F0CEEF33E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40182.1772700955456545560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zg6GDPPc;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso52072955e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700954; x=1773305754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJRXiyYSHn9FUIfTtJzSZkEuZayUmgkWl7qLQjZfQMM=;
        b=zg6GDPPc67QkOXoLialQHliV9AdZts2DzVDTywwV2PDMwGtGzsoAGkLbyjgwYa4aaC
         oS1UJ83cSWss2Do2u2a/F2By96H604jt9+HDC2Nbc0gH+Zwtel0W6x9IS++Nxh+DLRnB
         myULGIRYUqzv7RtBT2vwxV35NiAjbydApuND4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700954; x=1773305754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJRXiyYSHn9FUIfTtJzSZkEuZayUmgkWl7qLQjZfQMM=;
        b=eagq0eUkPrgkQMcDC/pacTMiJIGlhT5EL5CPTEmzQiwLNWQVIr94s7eAE+Vhbhh4Af
         MxQsKGlC8l+9OVSDF0SWYZOGtgDdKtokKU3Jm3BRuJ0Byg5S8EHWVGwUQhORtC5f3M4b
         BelJLaKat/LlUrxztdYI+p7EO3LyLSRGaBriaAzpLszMPloqFCuCBk537SXLqZps46HT
         ofAHZdqu1w2Z1BKZN7M72nKLA0MaBoGXNMXmd8BALpWwt6P4MMbT9C5wmOEVjkEePpDe
         ijJMFth57pSlaJegawr4mgY6IuuhBnNO5q9dOfJiIwDe+yX2CrSe8i2D6PA2OJd2iosr
         TuiQ==
X-Gm-Message-State: AOJu0YzJz1lbV/CcwfAgyVRzal/RmVIcN5dgSfSgL5NaoDqujWZdkbEL
	qQ15TMABXqmY+SJ1pIUBKUAo8Rh0h3hINH3aE+ZntOKys4pb+WVCTWwdN2aqoNjF5dw95D9XU7C
	UWf2l
X-Gm-Gg: ATEYQzw9X9NXOYu6rcjEA/qu+/jR9Tn/n/k4njuIth7ax/cYqHXyoSevLG8frjArzjM
	/gloRLX0s7Vy1mhcQSJV6TjYi9K345O/8AYpOWsgMxreIPbTlQo5EML3KiSbSvMzx9vri1WhxZd
	DOv8Hz5o593zPRi6EjLtLP3HapbRsoWKEYldbXygsj0vtZRAmdGaPa4ZePVfp+700sNo6ZEI+7F
	LWu2lLUHMUCTJW7F1M73UdHGO1AYNenjW88JtRqGD/t3Wi/gGorEw0isjJwSVgsMGU4w70DxdKF
	OJNyHlzRGksRY2i/nrhAV5HtLfmWxAkbzQi7PYNfDgqJxdOwhZSDYeuWHDpG3dTtBGpnKMiQiN7
	JSTBq0oaC7j28LSdvopEhxwMLg/tHLqZPd7cmQpUPHC58kk2mCZIKQzvXziNTOVSmO0hMNo/jCp
	+yYOvtF3ar0LqpFdYvJ44+WMM4ueNdMYPqDZhoIAFWRwMorl4GiJASOgF3+pGxAgKPDM+1Uehf6
	CLAgE0lSXQrc61oeZCmae65G60Pxq9bVvUODc4=
X-Received: by 2002:a05:600c:1d21:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-4851ee7b570mr24233835e9.4.1772700953504;
        Thu, 05 Mar 2026 00:55:53 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/12] README: Add whinlatter subject-prefix to git-send-email suggestion
Date: Thu,  5 Mar 2026 09:54:59 +0100
Message-ID: <46724cf2319e1a1fba8215165c11fe3d7c9ac039.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232461

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 7187fb94be3..35a9866db7b 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -22,7 +22,7 @@ As a quick guide, patches should be sent to openembedded-core@lists.openembedded
 The git command to do that would be:
 
 ```
-git send-email -M -1 --to openembedded-core@lists.openembedded.org
+git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='whinlatter][PATCH'
 ```
 
 Mailing list:

