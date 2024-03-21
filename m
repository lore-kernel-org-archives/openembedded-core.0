Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6E6C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 16:20:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.1174.1711038010073838001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 09:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cs+/CZdX;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dff837d674so9486555ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711038009; x=1711642809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQCa7LoMifQQ9wZ6XKeiGBQhi0n5rGLPg2KdlGX3ldk=;
        b=Cs+/CZdXRnvsJJBwsNFg0hx10tGqm6y6H5juYStj6vs2U70aWcqV14d+XInPQgwF3C
         1h21cqmu5ZAKpHbvNkH4KiIOBqIFgoTRU68+WVt9U6YnOchcrFWCiX3Nl00w1KXaehHa
         CW6LScAhtJ/rrOEdVH0aUR1sufMCn5LjZ6UcfWozugJFR3aMCQq/KrMvqbHyLblhogJ0
         /K+UOJZVnExK2o7MlTa6XVd0J/dUiFVtgoSSMkfQZNe4V5qsHMZuSkK1ipH5IDMBG5Kx
         QvXxejOzW003U0CJSoq64wSo+eHSGXiYwh7N8NpJtTY36Fal/DwPRlKL3PDlHTDWd/Es
         p8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711038009; x=1711642809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQCa7LoMifQQ9wZ6XKeiGBQhi0n5rGLPg2KdlGX3ldk=;
        b=W96DO+jsJm0TgLSe9gZTuGmnesfC4LU5PnrsMA4itDu2If4xHnLBLT6hyw4XZQMXU2
         Ivp4ggSmJgJVGz47JvkbEpyLuWDGwtNUGWsvaDI9QlqpT5iO2xw1FOl6KNF8CRy/lFLv
         p+BfuMQk7qeLtiYr9Fkc/ve/x8zfx8HMkTtp1aummVkKL4xZValwX69RQon+aGGqhHqr
         HYI78qdNfFguZeVt8EcHlSNo3eiXMYZeV9MvSiW+vuJKLP6AFhMNWZiLgJ0TY2af87Xq
         af7P4TEHlFG1lvgugPt/uJx/+0vL3z6xJi86lRF1ix23HlYtDpmO0IMpcVJzR13Gjeof
         oLVw==
X-Gm-Message-State: AOJu0Yx3VemQYVNbp5SFltn1HSYyeFZghpSJdSTYI1cR/ZxBumYFWQRB
	32YSvw3WNpwqiYRzWhYbz1Vn8AdGynMAp3POYMps2OmmDXb3JV0qLXaShQ6d
X-Google-Smtp-Source: AGHT+IFVExxBg5bmXIRRD2A5xbZIfEtm6R0ZkhpfPfQ00eybxjoH2Lq2vSgQUkGBqjQUic03/RaORA==
X-Received: by 2002:a17:902:6546:b0:1e0:2a42:56a4 with SMTP id d6-20020a170902654600b001e02a4256a4mr5568230pln.4.1711038009025;
        Thu, 21 Mar 2024 09:20:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::debd])
        by smtp.gmail.com with ESMTPSA id t22-20020a170902b21600b001ddd5e158bdsm10265219plr.284.2024.03.21.09.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 09:20:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 18.1.2 bugfix release
Date: Thu, 21 Mar 2024 09:20:06 -0700
Message-ID: <20240321162006.3378618-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 16:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197415

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 8086c9e2eb9..e1d5fc47a1f 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.1${VER_SUFFIX}"
+PV = "18.1.2${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "dba2a75e9c7ef81fe84774ba5eee5e67e01d801a"
+SRCREV = "26a1d6601d727a96f4301d0d8647b5a42760ae0c"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.44.0


