Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A63C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2275.1743577922353962723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FWmvqBKN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394a823036so59114665e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577920; x=1744182720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6VOJ8egF3U6CSKd6s+dX3PoeaJ9+tA+YmCX9CbOUGk=;
        b=FWmvqBKNUj3SRMZSVORyTGXfPpeAn6VNwHg6NAfhNhsoUhbAqMhoF1QAg5BlOvGdKo
         +Pu+s9y++7VQVv0e1Ncgkzvk4nrDDlIBI4RvCOBPBSmq6NtAFq9Mr3VnwOem44KjQvKh
         yCeC5Ls00V7qwvKOvI3DYLzuGKm+L5EQpIDXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577920; x=1744182720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6VOJ8egF3U6CSKd6s+dX3PoeaJ9+tA+YmCX9CbOUGk=;
        b=BSd7C91MUzNWkLaK47vPmYeHpjIIsgpGhuEFcha7mux6otj4f69nl7EUlv0cTEavlj
         ZtypnA5EDguweIV2OMPtjo/2V9+85LxoL1/1GZVDKH+QJlbFFR8qgwel1tFuAlQXAmg5
         trdpNonGxB5+JaudvL7LrC/lZ9e9LQuacw097BA0ns24cdCvXYGDCmXWiPRzdbq/9MIa
         GChkGVeDqpjNXLryBksXxLOdD6nfSF209Uo4wJHpeJih/hfdx3AukuYtdFPTA+HVoEPO
         eNIsZvvuXoPhaiYKOkKN33hpUIYCcv4HEpgUxNiHuzu2tXKetQwpiHk01VX94bbW9KYC
         n/bw==
X-Gm-Message-State: AOJu0YzLq71eZyqEo0mTsvh6YWa6ONcBkWYevGRHfjpGsVKe7xW1stNv
	Hwn0f1Pb4cGoYS8i8iuFvgTWetcCi0U8N+nyNIoaDhpuwySj+DYy91/DI9Ypt3MU1BznLco7kOj
	x
X-Gm-Gg: ASbGnct9kEnmpcbMqrb6z9vB2T2EywhZ5IbackrOeDhHqR+SVHCN1WkGTIPdeB69rPP
	7cLZ0TCuxYRFmZykrCSzE3/d/UCDNwww0H54pjBbuu/Msr7N+vyJeTFZDyZDFVtk0r5hNVzqGXN
	TnFbMvm4UVb/i9jYCnpFX9b8NCXjRt1VVrHYaoSNUmiNChZMYnRn2Zb1+J5ESwTVW6w4pRWMe3t
	lph0EqF4vMCcbIj9Aq1us3Z19zJ3Xe5PtkLd6Zg0JAUEsVJ+749V/+R9a9l6c5d0c5WClDHNsG6
	UJRXbYex3u5PLI0n2HaS1vVlQhOKTUk+VO2omTNimiRTxn9t39hu2ex3K5G/hhx9QLkTXCuRmw=
	=
X-Google-Smtp-Source: AGHT+IHRW6FWQb+1mAXrT9TPO1UIEYH/bU6tn/3KZDhdmUg43GiefHk34VsHq6o1WIMV/D314cEnLg==
X-Received: by 2002:a05:600c:4f8a:b0:43d:412e:8a81 with SMTP id 5b1f17b1804b1-43eb5cd2d2dmr8716895e9.28.1743577920292;
        Wed, 02 Apr 2025 00:12:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 39/48] python3-setuptools: upgrade 76.0.0 -> 78.1.0
Date: Wed,  2 Apr 2025 08:10:08 +0100
Message-ID: <20250402071017.2157620-39-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214212

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ils-sysconfig.py-make-it-possible-to-substite.patch | 10 +++++-----
 ...nditionally-do-not-fetch-code-by-easy_install.patch |  2 +-
 ...tuptools_76.0.0.bb => python3-setuptools_78.1.0.bb} |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_76.0.0.bb => python3-setuptools_78.1.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index e2fd53e0390..8ccffeef1de 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From 801b64480490e99c5eb062401149d1f1a945e8f8 Mon Sep 17 00:00:00 2001
+From c3d2c40e10f24724ab2e3d5f236823f3076c7aec Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index ef3def8..577d320 100644
+index e5facae..0932f6f 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -122,6 +122,8 @@ def get_python_inc(plat_specific=False, prefix=None):
+@@ -134,6 +134,8 @@ def get_python_inc(plat_specific: bool = False, prefix: str | None = None) -> st
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix = BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
@@ -32,7 +32,7 @@ index ef3def8..577d320 100644
      resolved_prefix = prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name != posix
      os_name = "posix" if is_mingw() else os.name
-@@ -242,7 +244,13 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
+@@ -256,7 +258,13 @@ def get_python_lib(
  
      early_prefix = prefix
  
@@ -47,7 +47,7 @@ index ef3def8..577d320 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -257,7 +265,7 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
+@@ -271,7 +279,7 @@ def get_python_lib(
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 0e75d0f62c1..785a2192c3a 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From a8bffb1a3d0273d049b93df18982edee7b0cc4ec Mon Sep 17 00:00:00 2001
+From 92363514224b0aeba065f83b868a15a2a03601ab Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
index 71c8eb1a1f1..7455ec41af8 100644
--- a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4"
+SRC_URI[sha256sum] = "18fd474d4a82a5f83dac888df697af65afa82dec7323d09c3e37d1f14288da54"
 
 DEPENDS += "python3"
 

