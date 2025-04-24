Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E9EC369D8
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.9653.1745479261289280386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZKC0QDLm;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225df540edcso19238175ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479261; x=1746084061; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dD5GTmuDn23P6owo6Z0lS2o9XeR7WW9tT1TDVWp+gqI=;
        b=ZKC0QDLmeWWOXgk43lDhSXOaHiOVtvsh2mJFGZs2Hj/qltPIehmC/qQ6IIg7KfDZiS
         xUFlZvV8vy+HXpUZKyXmGsf2G3zzwYms1bp04q1SP3sc1jIkAHeOH3oMQa8wbBtuVNB6
         4szBp8o0dBZ1MnUegiqH0WGsyW6osNee5S+mxyxcx/ylHe3UUWgk/nhwIVC0ckLg6Jxm
         XuPx80LSaxA6BtAWMFLIBdIAeWBG2Kx4Yr9ghYyBmbrGJfdjhsREd/2pO5IWTDnFbOUl
         O/BMkUfpbHkfQHLDbBHWrxw4J1ACJd9U/deflTgtf13RzLEfQ4bndaO8BgpF2kx+Tfnn
         CsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479261; x=1746084061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dD5GTmuDn23P6owo6Z0lS2o9XeR7WW9tT1TDVWp+gqI=;
        b=OwJz1ntfyigjMafrDnStrz17xrbAkSm8vT3FaE+FcFC/n3eaOV2jrLtDKATGp8NBir
         iJJ2aRo0DdGjK0vXeGU9mQ/BRRO9gIDXm0FyOS/lPX+hsY/IwXJP2jw/38VQ3ASBmR8E
         uHQNYJlcMYSol8hACq9NytMZ3d6IbpJitTg9cs1rEY3PXb68zo9j/DRlF6Fma3eFs/ia
         ouO50xedG2DkA+jclSBA3A6xBArKa/6+rynvHG9vAGE1pYbKJIUiLSY6dHn0bk7B7JtX
         lKGY+5qgbr7rzrCWr57xxewP0KOKpR/yJ2NZc3RqGXdGnf6TyOX/NrVz2G2cPGzaCqro
         JUrg==
X-Gm-Message-State: AOJu0YzHrCI9YxfxttPQgRuDqQNUGvQ7aPN17qoXam4o0BuNgw8RmdHY
	AX7NZ6drd15ZoCePbJ870xsvku5RhR1EBIzTlh9WwGxIX7Hp5EvXhuLSt1u3
X-Gm-Gg: ASbGncswC2ez0ReSs8XwFn41p3guegSo8F7JsVeTam8AVVlHwtTNSWdw4IcZo6HzcgM
	DxDNICGV6JsxocqxyCBDDi3CRlTw4lpg37KtpCGBQqHvXSulUxy2XI871mMD6N9RIn1K/lZM7Mt
	Wn9cNXZQ/Tddh93ljk4VsTlsU4ioJinH+H88R4oWeD1oQbZNjY6NyqB7swaaKd45lH/mg2JmFye
	J5zBQQebbueSTxLk2+GpX8KTHeFvbdENuXqGYqrxOnw2R+/8xDhKef8iiF4GLDfNwrThSOHEZsf
	sbJFjKjp7jwLptl8P071EJkBH5lZMVsMGkACmWGah6c=
X-Google-Smtp-Source: AGHT+IHsx0gPtlQ5iBqMl3phIEIARoDVEw/Uv7mptYN/UnsfpF/+3sx1sTTKN7uPT3g8Dy5+32pb9Q==
X-Received: by 2002:a17:903:1b03:b0:223:807f:7f92 with SMTP id d9443c01a7336-22db4983516mr18756235ad.20.1745479260671;
        Thu, 24 Apr 2025 00:21:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:43 -0700
Subject: [PATCH 09/11] openmp: Omit time stamps from generated files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-clang-merge-v1-9-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215336

This improves reproducibility where openmp-src becomes consistent across time

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-emit-date-and-time-into-generate-files.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/clang/common.inc             |  1 +
 2 files changed, 38 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang/0040-openmp-Do-not-emit-date-and-time-into-generate-files.patch b/meta/recipes-devtools/clang/clang/0040-openmp-Do-not-emit-date-and-time-into-generate-files.patch
new file mode 100644
index 0000000000000000000000000000000000000000..9c416080ae6035c9747b40e5c39e7a6e477d3859
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0040-openmp-Do-not-emit-date-and-time-into-generate-files.patch
@@ -0,0 +1,37 @@
+From 5674e8fb8eafa189a4843080d8fe782d6b5f13f2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 23 Apr 2025 11:52:48 -0700
+Subject: [PATCH] openmp: Do not emit date and time into generate files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This improves reproducibility where the generated files do not
+contain time stamps e.g.
+
+//·The·file·was·generated·from·en_US.txt·by·message-converter.py·on·Wed·Apr·23·16:00:53·2025.·//
+./usr/src/debug/openmp/20.1.2/runtime/src/kmp_i18n_id.inc
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ openmp/runtime/tools/message-converter.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/openmp/runtime/tools/message-converter.py b/openmp/runtime/tools/message-converter.py
+index a493d64c1692..0bd5f929fab6 100644
+--- a/openmp/runtime/tools/message-converter.py
++++ b/openmp/runtime/tools/message-converter.py
+@@ -188,11 +188,10 @@ def insert_header(f, data, commentChar="//"):
+     f.write(
+         "{0} Do not edit this file! {0}\n"
+         "{0} The file was generated from"
+-        " {1} by {2} on {3}. {0}\n\n".format(
++        " {1} by {2} {0}\n\n".format(
+             commentChar,
+             os.path.basename(data.filename),
+             os.path.basename(__file__),
+-            datetime.datetime.now().ctime(),
+         )
+     )
+ 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 6c89d853d5219b4d1f2907100dfad91953b126e9..5208b451d6a616c81c6b4fea1709d3fd460e6f50 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
     file://0037-clangd-Add-a-build-option-to-disable-building-dexp.patch \
     file://0038-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
     file://0039-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
+    file://0040-openmp-Do-not-emit-date-and-time-into-generate-files.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

-- 
2.49.0


