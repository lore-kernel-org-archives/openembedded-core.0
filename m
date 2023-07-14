Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB645C0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.813.1689374024066760527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Kqcd9Qay;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-55bc29a909dso1432257a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374023; x=1691966023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GxyhXb75bRznFSxlAWbGwxzVk4MBjf63QpcQAkOQIc=;
        b=Kqcd9QayhmeY6lTDuV1/MNPClaLEL3qFzSTZx0eC1SN1epf+j2+ss8ZmrGQbwlPEo7
         cI6giLoRsicIkUOtF1LgA2cCoFBo1LrnMFzNeusymxho+IxIEqBU3LugUK1Stl000PPu
         4g2i8ATbz0xY/3H1zv4n/SwxbKirjEuM9UKpR5O2RUHq+U4kT2v6tYqwrHMuBFe5y54/
         9A7MMc0snf5EpQYZAwgD1uLWXkyrnMmkLSrjKDS23s4RVDM/J6/kZQ6g0Y2AeYUuPz3i
         qROOXfombytGpRJ5rxf3MNeOzg6s9NWnT8/2wVoGDbu8BIMUgAWiRzfDdS8A7fTO5WWv
         8+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374023; x=1691966023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GxyhXb75bRznFSxlAWbGwxzVk4MBjf63QpcQAkOQIc=;
        b=LDOcjyXE9SS659EmXfvlr4leGNyzCECY/PseiX0m9Uv4oi+EynaTN/aaWfU5uToziy
         LYquj4zDHXESpBT1DnO7DanZVhAH3fwCEePgD9pmePgngfSkdcE4x1KEh6FrVjiMokyb
         qZ3aHqEa8eqTrD1Ibh9OmR9nFHMJLacZhYH9oSsxdDr/73m9XDTH0tksjRiPXZLW9pzk
         4eZwwiDAUuSilkq5vCmrEl/5Mp3l2XGFgsKxYxTIvWdZIDBb654dYl2Qzoyn64jL6N6P
         5RxrzhaQsfBzsqLAR/BRKtEmzrJFI6+tRBI4EJRsBnBnEY940u7V+OAViPseFKzd3BZP
         lTIw==
X-Gm-Message-State: ABy/qLY5OI/3t24mUQ0fD7poArQXkZIDBivuyKwdWJkEOQEcXl0ez2wp
	vNcMNvM+Ai7IDpt9BJBqEalaTYXSRSAwOU8uXIM=
X-Google-Smtp-Source: APBJJlHfTZmB9hqtyF7Co3fOsEvgpYMNWniE4n08dfKVdb3YxqNrj74/uiVCbMPG2Hh9a75quoq4Cg==
X-Received: by 2002:a17:902:a50b:b0:1b8:4199:edfb with SMTP id s11-20020a170902a50b00b001b84199edfbmr4025797plq.25.1689374023063;
        Fri, 14 Jul 2023 15:33:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/26] cargo.bbclass: set up cargo environment in common do_compile
Date: Fri, 14 Jul 2023 12:32:49 -1000
Message-Id: <a1946efdbec608d47f9e992c1b5cf3c671a204fc.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184297

From: Alexander Kanavin <alex.kanavin@gmail.com>

cargo_do_compile runs only if the recipe is built using cargo
as the top level tool. Some recipes hide usage of cargo inside setuptools
(or autoconf) and use do_compile definitions specific to those,
and so the environment isn't properly set up.

This was exposed by latest versions of python3-cryptography.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f4ff643a028d7f5670d80861f2ce19ca2d90faa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cargo.bbclass        | 1 -
 meta/classes-recipe/cargo_common.bbclass | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 7a8cc1e751..3ef0bbbb44 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -55,7 +55,6 @@ oe_cargo_build () {
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"
 cargo_do_compile () {
-	oe_cargo_fix_env
 	oe_cargo_build
 }
 
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 82ab25b59c..1ca0be471c 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -149,6 +149,10 @@ python cargo_common_do_patch_paths() {
 }
 do_configure[postfuncs] += "cargo_common_do_patch_paths"
 
+do_compile:prepend () {
+        oe_cargo_fix_env
+}
+
 oe_cargo_fix_env () {
 	export CC="${RUST_TARGET_CC}"
 	export CXX="${RUST_TARGET_CXX}"
-- 
2.34.1


