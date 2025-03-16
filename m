Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0E2C35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.31802.1742141572010297701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z4erRqVD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso11263915e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141570; x=1742746370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MURyir0ZVd1J9zLVaz/zcczpsKGLpRxS6YUEyhXk0W4=;
        b=Z4erRqVD2p8+sTsRRmvjPqvojKXUmwtuXDVBCmndqaDZo12OrVfYG4bGM4j56pAE2l
         DUAafoRKaTeD3U9uG/0BFoPpcAlafxpN+KZcTe+Kymb0APkYBKpxuIolkPDDR8wCqw0e
         ayDEVptyVGSNC9Jz9aG2QVWt8DGjb4O1a6s1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141570; x=1742746370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MURyir0ZVd1J9zLVaz/zcczpsKGLpRxS6YUEyhXk0W4=;
        b=fUHrAaJcpURGBEByHkMreNw2hMHRyBqFS2NH20OFMCYtkmPIlHZpPo050EM1kIMi4/
         oX8mcwErbHw/tbwm8Fj3Z4gn6iI5fqRrwDbikrGR4bdbHxjCmCTHJtXI0T8HqqqI0seK
         oTccggRpPhLchQP7O2dX5Wo/r6yFeRnSgt+7P+5jEvrdpdT0NUBY3xquxq9oXdwNKvcs
         OwoqxgF+xgu45C18IIFOa4lGPBaGDTQY0SbiCahxYvF24deIoc5qagqGKznhe29by39D
         lN4c0B/iovl0+ouL998XYN6BWovJ8RkE/r7e3b/iHQ9TPMjNAayEh0NgUnfqDu46QNm5
         PCcg==
X-Gm-Message-State: AOJu0YwWmBw9p09vF3tDdpIJ+Cqfsp6w5m59ypw5OWymrJ6TU5EFMHw7
	+0wTlx1KUfoM2J3F/XgJfa4fVYNJNvkG7aPyjgxLGuWWI8KmDeIPXDZBwUE0kvMFy9FwKLBe78Z
	z
X-Gm-Gg: ASbGnctSyKnnN5H99wpYI0nd8nl0qC11nNbBmWu2Djf/UDlvw4I6PytJa0aVFLAtwZo
	y1dieTvKyDi+jewbLMJZojgrQwsbExK78OESzCireBneEZBFBKuDq2UsHDbct1AHNWJLg+YOnmB
	FjUsB6bC2mdLzpUxH7DIzkmz2wPr/Fa1VDpiC31SyvgoJEnWkfS1G21i5SMuF2jj4pBy87gBNsI
	l7T0cJPHelZDRcjqFN7x1mLhFzVQCqBPCnkSj4AnLQ/vzkG4R1GW3P7pG3lYBOmMF3ipblAmZ/M
	TvlOIqm90K1DPPAvJlQqvFRfwLDDStmtTMGCQTTkefCCdQUNBPezHkiKH/h3rMP0Q7sKLD9/kA=
	=
X-Google-Smtp-Source: AGHT+IHY6jAxrsPNscyvOx4pk0C5dHyp5IWp36ID22TeNy8DvRFTraToDDRVcA1SaBk6GBh18RxrkQ==
X-Received: by 2002:a05:600c:46d1:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43d1ec81224mr116707385e9.11.1742141569790;
        Sun, 16 Mar 2025 09:12:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/43] python3-setuptools: upgrade 75.8.2 -> 76.0.0
Date: Sun, 16 Mar 2025 16:11:53 +0000
Message-ID: <20250316161209.3629986-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213030

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ..._distutils-sysconfig.py-make-it-possible-to-substite.patch | 4 ++--
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 2 +-
 ...hon3-setuptools_75.8.2.bb => python3-setuptools_76.0.0.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_75.8.2.bb => python3-setuptools_76.0.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index f5f110d6915..e2fd53e0390 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From b84b849dc72d2523f18fdbbbd28a2cd975596d08 Mon Sep 17 00:00:00 2001
+From 801b64480490e99c5eb062401149d1f1a945e8f8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index da1eecb..bb02a09 100644
+index ef3def8..577d320 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -122,6 +122,8 @@ def get_python_inc(plat_specific=False, prefix=None):
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 83fcb27f2d2..0e75d0f62c1 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 88df88cfa90281468114efb368bd37213f2b0fb7 Mon Sep 17 00:00:00 2001
+From a8bffb1a3d0273d049b93df18982edee7b0cc4ec Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
index e9e6e9b2b60..71c8eb1a1f1 100644
--- a/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "4880473a969e5f23f2a2be3646b2dfd84af9028716d398e46192f84bc36900d2"
+SRC_URI[sha256sum] = "43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4"
 
 DEPENDS += "python3"
 

