Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E0FC38145
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 14:41:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.7371.1662129709025133296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dyPSbNg+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso3453072wmh.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=DGBbn5v3+pRM135PuArExBYHb+/YeLrC8XzDJSyIDZc=;
        b=dyPSbNg+BRFq6OpCUmKSRbnJUHdPok5srCDQdNN3MBtcg1ItlLs5TNADXfiEvLThnR
         2caC6hs/Iy56EEbGwbvBUumjdboopqdXWoLBec5jlVq2iyzJdB+YgesDQhfSsLzgDF6d
         8yD+w6vCUP/qW4YJ9Inu847zYiJ5OFjXjG5LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=DGBbn5v3+pRM135PuArExBYHb+/YeLrC8XzDJSyIDZc=;
        b=KvsPbxK/xPxbxTEV1yMYKoYGuoKUFQjADjR/5UjmOC1KtKxdL8lKgN3KLJN6aUorxS
         VMdSBG6a0EybgnDurfNVMaHJwI3HFVVLzhHPl5AFR0O3F/iZdejM3T1f8mmI0UxSiEsM
         zu0nciyErUWoi4XuWgdthG17MoXd6xE8sPlwDyUeaNPCocgUZKPJBrgk/V8D+JbdtKDT
         DROooepakhmEEKNBDaIBkVDzu+6Tdjf7nrpBB5LxNkRtz5/T2QnpOJvGXtRuFkCsMkz/
         pq9iEY+VhG9hi/TlO35nrZPas75wYpI01jW1SMgiXmRACuwBdQcPQDWYC3RCnYnik2HD
         eYMw==
X-Gm-Message-State: ACgBeo1jO9rmEhQ/MTQMQ3gJ9Ac6EULLbVV7qLhcgm2SnmTsV1KMRCap
	dcr9tRoGlDkYI1PrVxMkIPfR3WGg4NmjbQ==
X-Google-Smtp-Source: 
 AA6agR67lHRSmpAh0R7TJTA3wb0yTXvLrCakxNeJlGkVaHIzj5M+lJUy9uygVLuvlK7JJlqYWNKeEg==
X-Received: by 2002:a05:600c:35d0:b0:3a8:3f16:2c38 with SMTP id
 r16-20020a05600c35d000b003a83f162c38mr3246599wmq.162.1662129707063;
        Fri, 02 Sep 2022 07:41:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 p17-20020a5d4e11000000b00225250f2d1bsm1662218wrt.94.2022.09.02.07.41.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 07:41:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-multilib-config: Fix i686 toolchain relocation issues
Date: Fri,  2 Sep 2022 15:41:45 +0100
Message-Id: <20220902144145.313486-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 14:41:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170249

This code wasn't changing the linux.h on i686. Make the entry match that
for i586 which was correct.

This fixes problems where the wrong dynamic loader path was used by
nativesdk-gcc on i686 SDK targets by ensuring SYSTEMLIBS_DIR is replaced
by %r in the correct header files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 26bfed9507b..2dbbc23c940 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -154,7 +154,7 @@ python gcc_multilib_setup() {
     gcc_header_config_files = {
         'x86_64'    : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
         'i586'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
-        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux64.h'],
+        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
         'mips'      : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
         'mips64'    : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'],
-- 
2.34.1


