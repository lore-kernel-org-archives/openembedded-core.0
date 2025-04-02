Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F260BC36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.2239.1743577861287169261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PkC2Q+/f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so45919795e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577859; x=1744182659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3nLfW4hhTtxYmg40ZB6KJquaBtBmL7mu8m+Zi3phpE=;
        b=PkC2Q+/fnh7RfkQxoT+M3kliy/K+z53z8SzwdAwKkdZ50eBI5vFMLmC602XGYMCLut
         toz89jr6/+/kgc8mMOW2EbKxm3o9nVhESDReG52vfgsYDg40hlWqLoZE5RX0TEKJkOwV
         cO82DssMVF9QR6GprlGyitPHJVLcuTpYhh6Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577859; x=1744182659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3nLfW4hhTtxYmg40ZB6KJquaBtBmL7mu8m+Zi3phpE=;
        b=J9Ejfh4zNCvaagvpT9BZkDB4eZ/EJvCKvgbdcsm3RttnwSxUGIk1n33vxGvyTSr0XC
         7PaibCU0OlShay3EH/CFKTWxkEVX1jjv3S76isHUPrP7lSZzLipiy4SbOkLb67BPb1Ad
         CL5+4SLY1NxcMQQnWdMiNNNL2w6b44fHMvRgBFHp71rlftzmCIyU9mtp1T2k3rVvzaLv
         4LA5+GIb6X1T/HuVXkwU7OgB/XmAgSG4+jUKyr+pNYPdtV8QLlpwbxU02la9c50fyrF5
         4wMjc9YxSblNgMQzKGejEqLw/cEd5yRTbYVih5LHmuHQXCtuBkbqdXK3xlc8XGTih1Vs
         mrFw==
X-Gm-Message-State: AOJu0Yxd6mBUk98nT1kU5YKEtIZPejltMEk7Dkcv0PrmZy914lFSWB8p
	1uEtrQLR0ocYKMk9JicAIngygEkQJOEfmX8oCP1HAcWzPYMs146a34ZlYMYLgzqeqlKyeHug3aA
	r
X-Gm-Gg: ASbGncspWaJ64o5+GUvPAWSkaLdQSWaedEDfHfjGansCPohZWvVgF29oaNJ/L0/KaHb
	ALtOBsy/KsRrq+miElZsC2/HON84xQP+eRNMu/EsvcPrrnIVOW20jNbYd8CcIDeyMC1QjUKjiac
	MUNRULd520kTLFyAGWUP0IqE9CrWCFaLCpeq/g0uiiz0whiVizE03C5ckil51tABz5XZUc5P93y
	YwcFrzpGrvcSjltIAuJt4rwQK61au1n58MlKZNhueOlGkMlWHvwX17pIwEO3iXcvRU1sb2koNag
	BxOF0umZanUgoKsfg4zbgbaoLVHTUDimDS9hHQrj3zQViy3O4AYJv7F1SopoQcXG92btZ/Pr5g=
	=
X-Google-Smtp-Source: AGHT+IEszueTHp9epn33n1uT0YULlgdUX1f2Ne7LxBPSC1Mb0IT/SBcyn+qOyELVYb+yP9Qc4pCAyw==
X-Received: by 2002:a05:600c:470f:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43db628b92fmr130936955e9.20.1743577858937;
        Wed, 02 Apr 2025 00:10:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/48] libevdev: upgrade 1.13.3 -> 1.13.4
Date: Wed,  2 Apr 2025 08:09:45 +0100
Message-ID: <20250402071017.2157620-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214189

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libevdev/{libevdev_1.13.3.bb => libevdev_1.13.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.3.bb => libevdev_1.13.4.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.3.bb b/meta/recipes-support/libevdev/libevdev_1.13.4.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.3.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.4.bb
index b920b349cf4..3ff64bd04b9 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.3.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "abf1aace86208eebdd5d3550ffded4c8d73bb405b796d51c389c9d0604cbcfbf"
+SRC_URI[sha256sum] = "f00ab8d42ad8b905296fab67e13b871f1a424839331516642100f82ad88127cd"
 
 inherit autotools pkgconfig
 

