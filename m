Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18A8C7EE24
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:44 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.30327.1683300035093514769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=L6T5B668;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6436e004954so2088647b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300034; x=1685892034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27k/LZZYqkl8m/hRlYIg/LJxULAULUffuyxJAPQQxI4=;
        b=L6T5B668N+RNQnJxaUuzkRid6lQN5FmWCwBiOqvALeyzaS8i8Mg5LbyX0fqXimcFwv
         twYyAlLPsOS/lPj45LC6LK/LzSVo1f6pgKz6g+6dYoFE7CIvu0AumaAWdgKpdHAe892q
         WZCI29ipFX4jBPRx5Ft/n9atHq+P4T4/U6vsy/L6QhKmPHWamoigfOTKYzXPNQTBADpU
         0fygoSLPFH8d5k308Lst/6EPBBiG9ReoPuH05dTBiG4Ebp5/BYzh++3fO1QnQiHb2Ieh
         3T82ht6879TC6rU+htzqDRjbpv3QbrOmd0yb3m6lemfqyfSnpjXVvYxpvy9QBZLzw1Wk
         fNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300034; x=1685892034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27k/LZZYqkl8m/hRlYIg/LJxULAULUffuyxJAPQQxI4=;
        b=MoIeQ76K1lp5OSvwkWPE4mEYqEqdCjSreHofIaXoE10WuoWqcfUP7Hk+ROV6gx8PHA
         nvXm87Cj/6pSqS33IbyD9PPv+7D0oB25FrWU9BqFtPE+EbIFN/3Aky+rNPzEVos3pB1L
         RHrF7OhSv7+JMeLLB3CSVG9JUdnZ2YPs/AXWjqbCmXSzt+he7JTyGTX/wSpcL4stKXvN
         7bseolHKbetKUC3ta/y9d+e7vhP9Y0VRTz/vp1aqLhrycOsIAJkivR/0up+ZkNu9KpzO
         759IRvhBy/ZAHuY/gPNSuv4F8eJQAQkL8f2sEbcWewrHVi1tAb9E0hDG6ore5VO/8pXt
         IH2Q==
X-Gm-Message-State: AC+VfDwzVBcditjUBLe7rE5GEy2Q98Cudnd3i4NDfjXcumEmJESrtHwj
	Z5oPK2P6iNHcfbl5vk21aYkyVo3BrXMeMH/SqJQ=
X-Google-Smtp-Source: ACHHUZ4w5N3vR/HrDN5n7TLZiB6DHvZEiGq7r6HIbm3UI/WvUm/y8xcoMiAqeo7HIv9Q2Q/BUr2UOQ==
X-Received: by 2002:a05:6a00:2352:b0:63d:3a18:4a03 with SMTP id j18-20020a056a00235200b0063d3a184a03mr2571295pfj.5.1683300034097;
        Fri, 05 May 2023 08:20:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/35] wpebackend-fdo: upgrade 1.14.0 -> 1.14.2
Date: Fri,  5 May 2023 05:19:29 -1000
Message-Id: <f248513b4cf0b61a61e8586a3bcf2a7c83a3b538.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180938

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Reverted a change introduced in 1.14.1 which introduced crashes both
  with WebKitGTK and WPE running under Wayland in some configurations.
- Fix a crash caused by wrong assertion, which was typically triggered in
  debug builds when using the NVidia drivers.
- Fix WebKit no longer repainting after provisional navigation with
  PSON enabled.
- Fix graphics buffer leaks by always freeing them in buffer destroy
  listener callbacks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit aa37e18a51714af3281b4127dceb40b38aa8ac3c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
index 708201043b..b3d7b229c8 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
+SRC_URI[sha256sum] = "93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.34.1


