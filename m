Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0749CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 10:38:06 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.9477.1758710281566437419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 03:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jAXeTArg;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57afc648b7dso5027587e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758710279; x=1759315079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dNhPELIxfX3HJrI4jeBdmQxt07TlqinmHw6t2YpJBs=;
        b=jAXeTArgFIWyEEKjMqCFhKF5P8dOutFUw3CFjiRCIB81ebxT0GVR32tyCpEdFQ89cu
         TBdMS5uR/tHyeRCRsHLcK1qu22Vp7a4s9rw8AmK0B/liKgdEnUC+p/gh+rtMwyni9KHc
         WVEHJfiN4aLJUaUj9GiBOl6MB3KRtF08jts+A63GOcDIX4D2CAbplA6iWuyEBL9dzP/p
         lxQ9/bH60xZY3cOsocWvJus+0/LGN7ZhiNkzfpSzMEpHkxTW71L18DZi5dplJ8Hnk6op
         qnvDmDwE3Yr4kcIQ4cQkOQ6fo4pJ1QPZ0eypAjIh+7u5iyHnIFtV7uIJbuLgwQbk8bS/
         8KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710279; x=1759315079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dNhPELIxfX3HJrI4jeBdmQxt07TlqinmHw6t2YpJBs=;
        b=cx68OBgmynwPvndJ+lKteDwXvqfqs5uEnBtB3yxUgCcO/5VVvXLHU5wy24Pcq4RpMQ
         rubBXDuNxOKiJUvVLZCRPMwh11EiRNEvHaruXgusKmFRwWmtNSyGl/c6KvkZ3qTtsawx
         lwkSPPJixvCrNnELkybutWS0WqYUEw+TfJiBGYcfoZY4eiXu0aXR8G+TrBn3REcay7cE
         73OidhONd0QwgiJ+MJYNQH0IpiCtJ9RVTqMANEgFocqryRQvj6EVzMoypoMe+MRzPjga
         YDmsG6pCNiKFBTSz7y0hbDFePH8+JQFItalwbg++wUeiHf/L88+WMoq2SUFS3xBJ1ga7
         pb3A==
X-Gm-Message-State: AOJu0Yz4kxUX+T2UzV4ShLzjKx9uBenqJiE4mENjliub1oKJmjI3q2D6
	gKezoPdFVpel65jhXPnQRsHv+3N9eASasuWY1Zw2txBUfbTIbIJaWhhcz3PA8tYX6UnQaMRBFub
	hP5Wljos=
X-Gm-Gg: ASbGncve8aNA5abHwOYv5mZ+VnDnCMOkag10c03F7pBg25/ufykFBhUCacWtUkgBmhF
	6FxRWinRxUw3N7a+v7yPSw8HmZWtKS28oAfiPFch/HOwtkPGeVAG6zpErKEgWyZHs/orZ2FLNJ6
	VO2/4rydag2z4GoXnZTro+/xBx6gnF2JIrBSLsc8oo+kbAip0B4CQglk456jAyjAwnZcLfVTzrc
	2/aC1edOel5+hRtX9VqEA1LpZNXBD8jIyfYjeu3WLAZQQhIqy4X7o3TCGNbvZG+l7OH0xwP2grd
	5iDENUpaH6pNA1DEwDn/d3heVlniBIkkxqFOJDS+xPAzu+/nU4TvQg5g/lD1cgbdnlRa0TbcCxQ
	WY9nwPPSf+oX8nFyQdzzSsPpZkCi4H3aEtWZ8+SX3nKKCp1/9F/p6A2+7
X-Google-Smtp-Source: AGHT+IHZ5rdkpwvGDU1t3328pcqojczcIgDJvsTp5FlAJYTs1YK4Y/fOpBEHvO1yuW3Mq8Qc4wY/yg==
X-Received: by 2002:a05:6512:4018:b0:57a:3d7e:7274 with SMTP id 2adb3069b0e04-580708fc92cmr2225813e87.15.1758710279379;
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57fcb8914f6sm1798976e87.60.2025.09.24.03.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] fontconfig: disable tests on native builds
Date: Wed, 24 Sep 2025 13:37:29 +0300
Message-ID: <20250924103729.111501-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 10:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223959

The tests require json library which is not in build
dependencies:

../sources/fontconfig-2.17.1/test/test-conf.c:27:10: fatal error:
json.h: No such file or directory
   27 | #include <json.h>

The tests will not be run in native build so just disable them.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
index 22bdfb139c..54a4c33e62 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb
@@ -66,5 +66,6 @@ FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 FONTCONFIG_FONT_DIRS ?= "no"
 
 EXTRA_OEMESON = " -Ddoc=disabled -Ddefault-fonts-dirs=${datadir}/fonts -Dcache-dir=${FONTCONFIG_CACHE_DIR} -Dadditional-fonts-dirs=${FONTCONFIG_FONT_DIRS}"
+EXTRA_OEMESON:append:class-native = " -Dtests=disabled"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


