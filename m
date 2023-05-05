Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098BFC7EE2C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.30312.1683300017813611652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RQD9UpLu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64115e652eeso20483458b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300017; x=1685892017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7Fg0IVg6sQHSDfUIQO8vexy6VviuU2pF94qCnDZi7o=;
        b=RQD9UpLuTgjXrrOtxzYIVq1KuGKjeW/KIcUhJipaNTjfTMviNndbp+zzYuv+WwtuCT
         hfj9JjL5E5C7gy05/BnyidzvnXUTVLWHwggqbfFx/tPv23RITJyounusN68KHeLc/zv2
         c8CUFdm8Gcrt0lGPPG4YpYnGdoUJ65mVdvoC4KcqZQmZYOfh0TBc6dreLggHUIKSa8SB
         aP52bYbl9Of1FkAMsjca0aFI99yCfm/LnjOemGk5OQxydvc7rnqUBw3I7XSUfY8mWnWT
         GLjk8J0JHsUdpN2jvKYTzRvmRe9MuGzGXWg2Qv6PUJQnEzgr75dNYtyYSAG+BlxQ+ciT
         3bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300017; x=1685892017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7Fg0IVg6sQHSDfUIQO8vexy6VviuU2pF94qCnDZi7o=;
        b=Bz75y1w5jpVWUbtt/bsTmsfRJTpnBv4x1CW1EuCLFDdgc87J7Uix7iB2CdPHqx4T+h
         HhEQt+vr1mjST1F94de1U2HpS5QPTty8uk/SovbWDQYzgQgYPeoEQC8LuG0nvLic+erQ
         U+Zven+ydkxMYt3U/3S99xg2qDCYqyQvcDCZCOs6/ELvu4CCFVX4r1oYcAP5QXEgiCFd
         yCAVyeROn/pbFVSFpSFcfZP6BYpqVQikLM28xIDq7va1GRKHqeltuSJOhA4+/TB/Sfv7
         6bWfyGAot8lTlzReCKfoaYrgPy2sv+WaLCXB33p/zkDnLBWP3B7Yazx+BDqFHu1uxy8K
         /3mg==
X-Gm-Message-State: AC+VfDwxYs1HylJHJSPcbcFsxyJZpIx7RqVyd5FEVXu6c3FBGy6XWKIQ
	H1nR9ziROGeiroghwyswD0kvRmfeIIXbU/xBwZc=
X-Google-Smtp-Source: ACHHUZ6+TCvpG6R1yq4VIDeqlC/iCiGyX8WAdPjcH8dC8+lT2BZW6HW1FxGTW0sDti7zBMcG85nRug==
X-Received: by 2002:a05:6a00:1955:b0:63b:19e5:a96e with SMTP id s21-20020a056a00195500b0063b19e5a96emr2407166pfk.9.1683300016841;
        Fri, 05 May 2023 08:20:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/35] cracklib: upgrade 2.9.10 -> 2.9.11
Date: Fri,  5 May 2023 05:19:19 -1000
Message-Id: <f1285f72a7a48fb9d3eff8c00f524801446c8b42.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180928

From: Wang Mingyu <wangmy@fujitsu.com>

Changes:

v2.9.11 Added xz dist
Fix incorrect non-static memory return (drfiemost)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a3932906cba1e693ff51a4fdcc60a7b15debee9f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cracklib/{cracklib_2.9.10.bb => cracklib_2.9.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.10.bb => cracklib_2.9.11.bb} (94%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.10.bb b/meta/recipes-extended/cracklib/cracklib_2.9.11.bb
similarity index 94%
rename from meta/recipes-extended/cracklib/cracklib_2.9.10.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.11.bb
index 8197cdad9e..34ef2b65a1 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.10.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.11.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            "
 
-SRCREV = "e74c539344d024709ee76e2920b0af7f9a5c5556"
+SRCREV = "4cf5125250c6325ef0a2dc085eabff875227edc3"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
-- 
2.34.1


