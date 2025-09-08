Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9CBCAC582
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:22:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.6387.1757366563655307725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQ+fJZGw;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7725147ec88so2064224b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757366563; x=1757971363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XndxjME58HYUR9/dTOs/uNH42wVURQ9mJ/j+Zzo+jMk=;
        b=mQ+fJZGwkNsl2VmUFX1RF9nOhe/949NpDEeTC1CoRCT69wgWv1KLnY7hCPfV5QXjVW
         wtanow8d+EKQYLOwav5LrJ7lifTzWY/qpBtPQLkSnGhDu1jvfwP0cXAeq5XzCMy1/Hke
         k68mXueYUTgDgOJmvXc0kHn0x1LJHpEQJc5sqN+Z2Drb7F/OoL1B4QJ6DRKV3BBDFkx/
         5Gs/Yibajn5D8f6WzbTkIz/CecemaYDnmL033uqLJ3wZQx4hA7X47ddkRriXWVGIWSJK
         SyH7iLD7/qOoBPXzhJ6I/awXRc4gYDY275PETzJYjwyG0ZHCcZejtRECB5rdy957f/4J
         VDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757366563; x=1757971363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XndxjME58HYUR9/dTOs/uNH42wVURQ9mJ/j+Zzo+jMk=;
        b=g/Q1Ke7AG04xvje1TThKa5sbV/H5YeTn51dZO75Gl+IHQoRBMkREK9X1kGyz4Y2v2E
         eImkS2tiL1mX7Qkmn8oE9oCE3Fsq26Nw1TbyTjIEl8QqHMx9yHwJVC8OPahT3H3CxEIw
         eoKBeTozXjUbTfy+GGr8fweNDwoUdQOEYV+qY8DJpV7UCvHuqquOXGR21x4weomFuDmd
         WoIeRakwSucfz2/s2NeYYKYbCAB9Z8o8pAZOMu1yByA8B9qfqlkyeZ5R7Be6p87XHXv+
         tNbPLmLxXYSwQkJz7xgizGa82GClN27YeY9dXCwXLTQPahWYGtbJCfUscVUP7GhFanLG
         cDLw==
X-Gm-Message-State: AOJu0YxYOQcmalwdqc+k2TOQKYemnncrE1w5+ccI5krxseL/6NtFgVA4
	+hzOd4EhVRyotT8N3Dby4AXxU6OWSDme8fAMV6sZeu/6/TF4rGr9kPG7iBj+XdX2
X-Gm-Gg: ASbGncu9s/LEbVI+EO3vFnRrjY40lTY2eA5+43fUmZnL2wW+g6Q7HbfXv0dhESykLh9
	ImpZnkTtSzAc+jLVjHMrRTT/qXPn5WS1LGBg72TIGX3Bm3qRL0gBcSxR8lJB9fHscJ00cbhKGML
	S/RQyrnO8avLFyg+xazrfQyrVPn4MYpnKTu0k7k7QEGQuEXnanWoz7x0GhqQF4J5xwrsFfLFtAc
	UVGxm/J8G73XnQzFUWUeCJrdKNIU98t/RJiawIRxsroGbSzN4978QyEivTF4YWWd9+5bEVtNSse
	qnfqvEweXN8c0EDP7ojTXsacL/d3ZZG5w8a+UUSGpZuYX1l6+wTc9mY0vXUufUQ70IzwW5MGxk+
	2zMQLXttyikKgatQS2z70ajhMzePDy84H4Mzb8PQqtQu5hx5wFPMQdhJw0/mrn2Z/qa1oAS3mQB
	TInqCMzsZsYWDraBAWtkslLsQfi65GWGcOKAKg81JO
X-Google-Smtp-Source: AGHT+IFueq36I8FZcw27HF56MWdSlSr5nJClPn0jjgzXzSbTnXdYLko4OESwZhCTWn5lJsaLooBUqg==
X-Received: by 2002:a05:6a00:7094:b0:772:44c4:4e23 with SMTP id d2e1a72fcca58-7741bee6eaamr13964835b3a.6.1757366562585;
        Mon, 08 Sep 2025 14:22:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fe29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723d79fcfesm27795562b3a.16.2025.09.08.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:22:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] spirv-llvm-translator: Upgrade to 21.1.0
Date: Mon,  8 Sep 2025 14:22:37 -0700
Message-ID: <20250908212238.3500731-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908212238.3500731-1-raj.khem@gmail.com>
References: <20250908212238.3500731-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 21:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223083

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 ...vm-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} (91%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
similarity index 91%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
index 64a73ce55aa..63fae47377e 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "74843f2186bb63b6802758222084da17fcbe603c"
+SRCREV = "acb023b63a4bafd53d0ba6a1a452b1f0e5671458"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "
@@ -20,6 +20,7 @@ inherit cmake pkgconfig python3native
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 # for CMAKE_SHARED_LIBS=OFF see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
 EXTRA_OECMAKE = "\
+    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
     -DBUILD_SHARED_LIBS=ON \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_POSITION_INDEPENDENT_CODE=ON \

