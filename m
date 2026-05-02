Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBFFCD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9405.1777739471676905993
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gZzgQuTK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so30610265e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739470; x=1778344270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRZlPJNw8CPbBivRfNnCMVbYEhT08KoCbsTayrByxOE=;
        b=gZzgQuTKSS+LokeQvVF8hgwVwUSRpvpXsLUuIGPswjr6PoSEfKWrH4wps+OYVnXTwU
         2dlhM9ropTKJymqyp4IqeR1wHLy1lr/mVTpLmA+NIEm2JeCsOXpE0TgG3DO8dkBuvFmt
         GnDxh+zmcyPVHq/wX+1GCph+zFh7t78felTEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739470; x=1778344270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tRZlPJNw8CPbBivRfNnCMVbYEhT08KoCbsTayrByxOE=;
        b=oJvP+Rg4hb8RvVyJDUxzO6TimVoRO+WT49cnhBoFNmNghjA4klQ2+wCtRXFIiuy2+/
         gNioBblFUzUBSMh0/zBOaW0KRv71bxYxImTFBoWF7XMB1vxT58To+7tyRGu6mIT75HCl
         ZgizcHIAUN0/Yq/xtcO7xGrpWkFRpw6yEtHed7s0RhSgC3v/knHTOguQIRPn3+IZST0a
         2uUTAGO+ykDmfHLdoVmduRctIuK4UIM6cdEpzSSPIjEwEiA+jqEoDDsJcVBzs247ur51
         BFuXtlnrexGOTqDC1WqnGHE2Jd4MXUudA7CP6U6mkS2g3yFSkvhuXAsKrmsRaYj7stXs
         aZNg==
X-Gm-Message-State: AOJu0Yxq8pZ/sxZvWrzl5jqbTlH1K2EsK5gqDARjnYE/72a2idXM+r1Y
	zpQL2o+Zr+eI8BifgvKZY+riImFbho3c6IloaLIHXMA6R2csnsLXTY2rpP/1d0cii/6z4eFwVAa
	0gqsi1SiHmR0I5DahFmtdef+TcmAvAtxTugsHKsrBMJHfpZBh1DuINbTCTswBlt9eTSzh7qEg99
	tOlNmYmhVLYRVgGmY=
X-Gm-Gg: AeBDieu+xB3H/H9Mu/fL3mgqEqYPhl/xyEkI6Y+B7kH+S0uBcRGBPbiqQ97HdotLphQ
	dfn4C3Lgk6939+Ty3L8eXY/CVEvYpB6XOX+w3htonlT7JCPbd+Oti5uWtXHvSpYoXvAKSAhDHs1
	K5oZ1SaOUoQx7GU35Hz340wm4lkqaTm/vl9VnQ+91L6j07RQs9rtlzVbLwse4DM9Oi9orqaQI7u
	Z8dVVFfMPr5U72nITpe0l7Zfy+2kMyznioo0vbFboackDgLP2spIQ70Y/W4Xtqibis9CddkLogP
	y1Uew+W4oM7AM+RaDVd/GSA5JbvO+px4ByOgAzj70IdPI3JtTUfQPfdWEShW7JAo0b6vQzMB7+x
	5Xz2wgTa0Etn0NserFjaliaGQuxW+w4Iy26GdXDD6bZvrfnR2cF9W+FAtyhPM6VclT5BaO4t4uD
	xpruwMMfBvC3u2dWawdvK+S8jStLhRMmhAd8p/h5LVfttt73hVREJLUJUg3LtmNVQ=
X-Received: by 2002:a05:600c:c058:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-48a9867c8famr43932995e9.29.1777739469567;
        Sat, 02 May 2026 09:31:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 48/62] python3-trove-classifiers: upgrade 2026.1.14.14 -> 2026.4.28.13
Date: Sat,  2 May 2026 17:29:08 +0100
Message-ID: <20260502162929.1377831-48-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236357

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...026.1.14.14.bb => python3-trove-classifiers_2026.4.28.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2026.1.14.14.bb => python3-trove-classifiers_2026.4.28.13.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
index f1b13412468..1ed81eccff2 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.1.14.14.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "00492545a1402b09d4858605ba190ea33243d361e2b01c9c296ce06b5c3325f3"
+SRC_URI[sha256sum] = "c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676"
 
 PYPI_PACKAGE = "trove_classifiers"
 

