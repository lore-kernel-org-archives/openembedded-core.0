Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90668CD98DC
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105061.1781424268924952876
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h6yPTMVL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso9924005e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424267; x=1782029067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsMjRF2BDNH1b0E+sCNT82ZOTinPhrsNM+MpI9fKL/I=;
        b=h6yPTMVL/6mac32d4TKyojJ0Y/3DatzJw1H0QIqWtxRayWOx+zsDBeIik+GCEARROZ
         TfEyQf+nJG8SXDLDRMV7KE6Vx4vuv3NCYzZrdRgoCD3DWAb0mxn5/NNMX/Xf1khQeY2C
         Ght0snCWfEYAgfA+Bz10jX6lOvDH2dBbUvUyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424267; x=1782029067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsMjRF2BDNH1b0E+sCNT82ZOTinPhrsNM+MpI9fKL/I=;
        b=QAvduk2v20AQUldfyisRvVIQaYU8dGLW5fR/bltEu+uN9Set1xnAiyAhbMrQ9OkHZm
         L7yTpdyQrflz0stDV6UNhDP+Ulhw/6XGwhcDIcMtYiuAujtegyCi5MylZqQMyClaBwIj
         8muJ+5AHSQMcaVvIZCyNLyd24kUXwR5biAqgSt+ZB7E8BkoJx06TomfmLfCK8sKdzbE5
         fAH8bTAOxJlFIgOX8A0I1Y1F7gHeIhIgki4NrO6t3PFqqxASAy/uqsi+zqeLftenvyD5
         4SPglIbfdFDBWqAxjf6hY7Q6jkyEuPTfI9hcNDYUJ+pKC5e2kwEFkeH4QPTKV9QIyw2W
         qZTg==
X-Gm-Message-State: AOJu0YxxiHkVPSnzHVSIyrdTSECBFt0gxM2/NQjMStt7+Mevx3sIlAn1
	pcjNz3DqG/wzCcLPzRF+dlCfb0TdWWGEHYPzv6g6UVqdaE0EhS9/vVkGi73Km11iOEgGU2qTlzt
	lG2/0
X-Gm-Gg: Acq92OHX8msoaMD89WsAHQ32VRmHDqgNAKbirjfEEIjkEZTyZZ/MAvv8AXCyAmfZqDB
	zhNWw5snb7eSLM22lx39km/kCeqmPWR1srBqsy1umMeMi7Z8RRMRBDX/GFCbQ1SHV9pOeL+y+9P
	O6ISnAlZiJK+THm9tpJS3Htd2huGdKbwSm8gwxnpn1i3Uh3Hso1I7z1QnDNRyCVOhit2+IwJPUv
	7Sf3cIsj0iJgWXdbaf0XaDov75wUis5JgXOIWzaZd+jM/pZ+yKr+qTqHr56tcOuKiiB5k+0ox+A
	DRp+fyaSpleChN7sorj7OoEwlzTPQ4nDY3N2dmnOCf/JzKE6kXcccZqFPnUJ7aE+EbiKRGkKtmk
	muQgg6zUq+hMAykCXCI95zV+WaIUk0ObrZBTwFi0RPTOStYBvsapDWp9htO48XAc4A5vrIIcgwi
	FIcaV+faBogdTiR62EKhFsJo8Q3riTllYwrg+GkMv4r20gTHSwWbDqstc45ghLs5c=
X-Received: by 2002:a05:600c:138b:b0:490:5000:917 with SMTP id 5b1f17b1804b1-490ec480f21mr105244295e9.1.1781424267102;
        Sun, 14 Jun 2026 01:04:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 51/56] utfcpp: upgrade 4.0.9 -> 4.1.1
Date: Sun, 14 Jun 2026 09:03:02 +0100
Message-ID: <20260614080307.4017177-51-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238735

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/utfcpp/{utfcpp_4.0.9.bb => utfcpp_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.9.bb => utfcpp_4.1.1.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
index 55780b1c7c2..80da59bf90f 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "63d64de49fd6b829f7c8694df5ab2ee625cb7134"
+SRCREV = "819011bb01628fe1aa2f1da9f2c842a48fd5680b"
 
 inherit cmake ptest
 

