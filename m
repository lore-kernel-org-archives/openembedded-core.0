Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C54C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 10:38:00 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.10136.1678358274782289363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 02:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=K/dC7rM8;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id h3so1301707lja.12
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678358273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGeOURyTeWlLKaF1z3BpeoouiFSXhKPWXgFoQUNosVU=;
        b=K/dC7rM8Fz81L9shXuMjsYakAcWmdsxkF7SmzVn5SdkgIKI0THQlONxQquVSQY0pcK
         L8IbcWgtw0ryf557uVYfc0paFqnX2EooCNxEct6PU3+L+5o1s8nQe6nI1mkTHqwpNdPd
         W3e0/Y7z5HNhEoaK8LC6X4oJBj+sU2cUWF+ABOkvqHvWZg9VhwFYZbqwWQ09i2ZicRyb
         bxR7K3TCj3MyCqqXblg7szles83Zu50kyvFXCwUAfnpBg7516BZ7ex2dVV4flP33eXL4
         /J04D/LKFDfTHPcX9E5TG4eJn/KumXmNgAGTgbf8/kLNcp6Y5KXd0rUc8K9BOeBAeZH0
         rttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGeOURyTeWlLKaF1z3BpeoouiFSXhKPWXgFoQUNosVU=;
        b=V2jxX7rRHmWB/SXB1Gs4HXtGTghZriuJSCuR/QALvBOlGnJIlW0XbUY+nDPaVUPZJR
         +6SimFcK2G8NWSmvCeYcmDjW8i3hSuenWY0rrVL3oD/vyWp1gNsY4gQ4yZtHgTzVrwNs
         FHtI9Kdc7l+CbDflHL09wVv7JFHCSarFVUCo0ZU/BQGebgAKHOAbeMxwR4xny1f3HmV8
         B03bhewI0jyIm8CUD+JWKhThJHn71SJdRqLgABnPW5PZd3Q2JIouJFcasdAt25HeaLNY
         V+RdaXyYkivjUOCZEvc7MWSzgZbBwDfXBj6jeTi33BU51WsqPpJ92BzWPB21y+uUmcMH
         /NhQ==
X-Gm-Message-State: AO0yUKXjKGIeUS1BeE6Sm0Rzwl9mc0q6nK0lSwTzi1+Px6NWmrrwf0l0
	2EyYQSMvaXrkUuIApIbxP5hz/7aU6cRNm3HA6NI=
X-Google-Smtp-Source: AK7set9BVDckfRd000U2SB9OBu96XLd+EdgsArqKqCcfLR5YUiF3aaY78V6KAbQOSM92NIlDpF4I9Q==
X-Received: by 2002:a2e:b8d2:0:b0:28e:b061:7a9b with SMTP id s18-20020a2eb8d2000000b0028eb0617a9bmr7642670ljp.42.1678358272403;
        Thu, 09 Mar 2023 02:37:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s23-20020a2e9c17000000b002945d119e09sm2882425lji.8.2023.03.09.02.37.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:37:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: import patch from upstream to fix tools build on musl
Date: Thu,  9 Mar 2023 13:37:17 +0300
Message-Id: <20230309103717.1235631-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 10:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178218

Fix building the crashdec on the musl systems.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
new file mode 100644
index 000000000000..3ab22889bf1c
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
@@ -0,0 +1,44 @@
+From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
+From: Jami Kettunen <jami.kettunen@protonmail.com>
+Date: Tue, 31 Aug 2021 00:15:58 +0300
+Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix musl build
+
+Upstream-Status: Backport
+
+Fixes the following error I noticed when building against aarch64 with
+musl libc:
+
+  In file included from ../src/freedreno/decode/crashdec.h:38,
+                   from ../src/freedreno/decode/crashdec.c:40:
+  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type name 'uint'
+    104 | static inline uint
+        |               ^~~~
+  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type name 'uint'; did you mean 'int'?
+    105 | pm4_calc_odd_parity_bit(uint val)
+        |                         ^~~~
+        |                         int
+
+Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19665>
+---
+ src/freedreno/common/freedreno_pm4.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/common/freedreno_pm4.h
+index 8f958953d693..091247e709a0 100644
+--- a/src/freedreno/common/freedreno_pm4.h
++++ b/src/freedreno/common/freedreno_pm4.h
+@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
+ #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
+ #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
+ 
+-static inline uint
+-pm4_calc_odd_parity_bit(uint val)
++static inline unsigned
++pm4_calc_odd_parity_bit(unsigned val)
+ {
+    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
+                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) >> 20) ^
+-- 
+2.39.2
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8a8a057c6bf8..c0b8f6562585 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
+           file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
            "
 
 SRC_URI[sha256sum] = "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9"
-- 
2.30.2


