Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10C1C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.69590.1677430960513286978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZT/iQkrN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id v11so884063plz.8
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFgo/1h1lKSD0/sVHS8EJGX2Nvw4vdCZLN6L3/pvhlk=;
        b=ZT/iQkrNjyhxXqvouLkmNJQsOETHSih9UZna73R4rP8bCID+TUS1SiPVRVzz3+od2D
         DS8dQqQrRH36uQ5siclsFyDxkQC9oBr7RFYwCHYUmYykzasYG9vLTFrQxqRZMccPNSLe
         p6Pa8/XcwtHDU8GXvHa2Ya7NpZlsGrdjhZDjDbb//kjaNOzcHdPTUdaw5TBqIlDlpE0r
         2EaeDpkaxPZNfxclKzFCVCqolDoNkR9mFBEkY90zaYfKVxSRZqlOpwnP0Wf87MMhvM1p
         BoMjcz08xaXXEo5gAQCqGrRinS8blNqVKX1gtkFdDRo9TEW7Z8Rv/ELLpQ8AMkd5rn4n
         PeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFgo/1h1lKSD0/sVHS8EJGX2Nvw4vdCZLN6L3/pvhlk=;
        b=i7n/5uKEOkKdt4PNAwPZjhuDKMrqLKNOUjK/E19ZCpYCB88KdWieyZSJ5MXjgMctxh
         ltSZQrBu4KgWYC6+8C7fgqOvUGbnBtZ4XrTpnaZSAPCWJ7pzEL4g4dY+IMZne1MVBtYY
         dKBtzJvZYPdha03BiHJGNEhWzEpJSfzsBRMCw553Xv845GPKD7vKXcQTEWddsC68yjSg
         SchX6T7qIcEY9RSUZOMHCf56RzAzFdpD+LosJUxvL1LbIcJaG5ANAq6yLfr1e6nRcHAt
         UYKKoK8/thkwZaT8/29l6gCA4cGBm8eN56L2EiKimg0z1cckECsFa810oypJ3CD1QPWd
         UYkQ==
X-Gm-Message-State: AO0yUKVei1Xh/vGDYB7kWfcDvkuSGN8Fc+uR4fG/PFEj0vWejky9h2IP
	eUN1mpV2XZdfYb14+L0m/vczHWQ0Sp49wyBlvGI=
X-Google-Smtp-Source: AK7set/2uvyO5rkNoztgvnAMIHTCj7WIpjLR2k2RkKnfSlpTDp+Zk+zA8LFYq+uHfxUGV5pm8Pj+dA==
X-Received: by 2002:a17:90b:1bc3:b0:237:8338:ef4c with SMTP id oa3-20020a17090b1bc300b002378338ef4cmr10906947pjb.9.1677430959432;
        Sun, 26 Feb 2023 09:02:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/28] xwayland: upgrade 22.1.7 -> 22.1.8
Date: Sun, 26 Feb 2023 07:02:01 -1000
Message-Id: <964ca02debe1e85cb91789dee1d08344f4fcf33a.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177743

From: Wang Mingyu <wangmy@fujitsu.com>

xwayland 22.1.8 - Security fix for CVE-2023-0494

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0ca374267cce807d12d706564989900fe61bd97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.7.bb => xwayland_22.1.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.7.bb => xwayland_22.1.8.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index dd32bd0111..6919ba421b 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d53afac6c71953f5cf66d03d289dacd8961da5bd309c1dff125d5955d9db5f76"
+SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


