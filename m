Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A32E7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.5386.1735810875515687405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A756B+Cl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso113516135e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810873; x=1736415673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L0NBPpjun5+WczAF/TYeFFf0EXWB11Nem5e9b9BZMU=;
        b=A756B+ClmqHMwTAioXKpy7gJOiQ2zBAHu5xCypBOJSuecTNvgBN9gQG0O/aMm9iWUo
         ebSf9DdxGa68aCrehMVexfvxIVzBs2zeeUr/w1efV22WRk3J5O7SgzeKjr24mbXUgcrR
         koPJbYR1obzA2CYHotzzZWc+Qtj32KdjtCcgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810873; x=1736415673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L0NBPpjun5+WczAF/TYeFFf0EXWB11Nem5e9b9BZMU=;
        b=eoBd+ZOqEHL0O4cUXconT2DAFkltwE3y9ju1nVyIdTH5OPSOANUnt4TUxHAaAxTLoD
         JgcXb27FeyAJrjTqgQ89TGAe6erDxCBW8T4B4u3JkOUQbXDPnK3wjBYh7nK+kluF+K3o
         5JcNzXtT8AiyvKXSchkRtBX+aefdeJMf0/UXEqBCJzH2iqO1Efo8W9xYid2pQWUoW2xs
         a+erslrvnvCRWyJ8nHIXjkBHB2fpq9ohm+6GpF4tlvn9LN8Z5DkFU/TFz/RNGjwo0dtC
         3AH19ooNqHf5sWaHJ6FJCEVAUTn5DNOY2NqDMMU9tmt8iBx8n86dl3Q4V94tQkkAZv27
         XSYA==
X-Gm-Message-State: AOJu0Yynov0qdh2UWo2H0k5t1pY/SIVapG37yQWg7aQZT9XBoFl/On7s
	oUt1U3ebiFs5Yohr8Cgkiv+n1oXO/TcXjj495Kr0Y6K7ruSfutR1SkNMRL09QKkL7p3JtqLbvoi
	no3Q=
X-Gm-Gg: ASbGncvZqDNGFtIet5wOKet6pSepfqMijxN14Wd/Cx1fnXvN8eOBgFnL9TgCoeb17Qw
	ScEMn7XF7HO2w8f2B/bLZrUF7uuIYlH5PIW+DZZYwlrcfz8CfGUBiLMzxTxDuzzOJWOkyt7YhNW
	Q+H2ZsF8vcVI0gfhaO6skS67yaNzmDDivtb8erxuh+PwsXDD1Wei53saLcXVoEkGyH8rcnOe9vt
	spL+mrT+ImDi035YuulubLJkonUeobJVzIc4VamYN85YpPy2pCjeE28sDmobBVZSxpRCg887hQq
	rClg7m53SQ==
X-Google-Smtp-Source: AGHT+IH8M70dvVmDgq7PUerfYdSdSINpS1VP2gXkeBDmdcVFPuvO5hlqrW1f9uT40qMz1qJiAz4L2A==
X-Received: by 2002:a5d:6d8b:0:b0:386:3356:f3ac with SMTP id ffacd0b85a97d-38a221f2dedmr40787293f8f.26.1735810873413;
        Thu, 02 Jan 2025 01:41:13 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/21] libcap: upgrade 2.71 -> 2.73
Date: Thu,  2 Jan 2025 09:40:40 +0000
Message-ID: <20250102094059.322187-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209269

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...sure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch | 2 +-
 ...tivesdk-libcap-Raise-the-size-of-arrays-containing.patch | 4 ++--
 .../files/0002-tests-do-not-run-target-executables.patch    | 6 +++---
 .../libcap/{libcap_2.71.bb => libcap_2.73.bb}               | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.71.bb => libcap_2.73.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
index e77d0c8c51c..c576351e819 100644
--- a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
+++ b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
@@ -1,4 +1,4 @@
-From 2261f47bac78aa77934ca03980ed54d1d86116b9 Mon Sep 17 00:00:00 2001
+From bda8da622bd3f4d8b0e577387e988ce364b917c4 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 23 Jun 2016 16:26:43 +0800
 Subject: [PATCH] Ensure the XATTR_NAME_CAPS is defined when it is used
diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index ecbdd22099a..f2d11b2983a 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From fcb0166c5e991fcf62797b19bea39983214289cb Mon Sep 17 00:00:00 2001
+From 1343e4ee17bb3f72e6b244706cacbeb16463c5d7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcap/execable.h b/libcap/execable.h
-index 7a2d247..682e0ee 100644
+index 89e61a3..22518dd 100644
 --- a/libcap/execable.h
 +++ b/libcap/execable.h
 @@ -23,7 +23,7 @@
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index 31f27e914fe..8cabed6342a 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,4 +1,4 @@
-From a3368b38abfb703e730fc5462f42cc5d177d864d Mon Sep 17 00:00:00 2001
+From 5846ba594bedd66c8fd216cad6518f7be11b7a92 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/tests/Makefile b/tests/Makefile
-index ecb7d1b..8950c73 100644
+index 3d03721..fbb1d78 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -61,13 +61,11 @@ endif
+@@ -69,13 +69,11 @@ endif
  
  # unprivileged
  run_psx_test: psx_test
diff --git a/meta/recipes-support/libcap/libcap_2.71.bb b/meta/recipes-support/libcap/libcap_2.73.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.71.bb
rename to meta/recipes-support/libcap/libcap_2.73.bb
index 08ee4423302..94601c75b3d 100644
--- a/meta/recipes-support/libcap/libcap_2.71.bb
+++ b/meta/recipes-support/libcap/libcap_2.73.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "b7006c9af5168315f35fc734bf1a8d2aa70766bd8b8c4340962e05b19c35b900"
+SRC_URI[sha256sum] = "6405f6089cf4cdd8c271540cd990654d78dd0b1989b2d9bda20f933a75a795a5"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 

