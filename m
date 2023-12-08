Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD346C10F04
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:34:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.11192.1702002840382927915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zZ656mwq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d03bcf27e9so13954485ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002839; x=1702607639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZWjCJeNz7JUi2hUUUuL+hRp4ZJpjzoWNot+JHRL0k=;
        b=zZ656mwq3k4EOxdbQXMA0oLoNV0pO00vtIi0Lkmh58fIJTw4W2Bkc9p02ji0cJuoCS
         PvXWLFcHKWuyNX4uZyCFydVgQEnjDb2I3XhZVjGQcZt3cq5cUX9il+h7tgbbtMEEq4d1
         JBY22egf5cfDx2kQCir0uhKNRjfpzoDvxrTkoti1Nj9lKdavNwA8sJKKt3eUsQaAS8Ax
         8Q8zehl6G1vNwj/IdwF+LWmyjHMlANWffKFaZWeQ5n/25qMzPKyHQ983mlOTcXPiI5hD
         nJApGEZOQTd+jiv3/oG6PRiH5ZnmOU2otc3PIdB9XkriBfm5ccXRUsnFzckAWEPEGodd
         2MiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002839; x=1702607639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbZWjCJeNz7JUi2hUUUuL+hRp4ZJpjzoWNot+JHRL0k=;
        b=XpCH0AsVjBEe+5plWp70Ecj9RZ/+f3+eBcBaVqLXdwYn078BplaY67zy+ErwmtdBld
         DFT9XhWWWGysUvYs1kRh7o6LuFr1LRV7ERCrzizZD8wILuIeoR6VZzKJJdgBLD1epKDQ
         yZbcVLWRndblBCaZjmhf3YlsNNkQnKGgLhOD9c76Gf07I3IE/hXMCJr+EVqDDooxxC3X
         UNXfm5Q4nLGczxiFOEbJZCLbS1zh8VrckZN40VEuU/bNoRkVbBfozTtDurz1CPuOYxZj
         A+vaIaHWOlg+hS1hxMoRoelc+JJA7IMF+rhlQZRGb0zHfL4O4zZuJJGe+pqYeUK3Mqew
         SIaw==
X-Gm-Message-State: AOJu0YxeJbDNF8gqv0s6K8ATUOee0tS5PsZK2dPJbG0RQYXgqftex+aO
	tUjiS6sVkRtaRxM25RLn45kmTZuT2qnTCTnXfL8=
X-Google-Smtp-Source: AGHT+IH2l20ApJeuLPeXnBFdCz2uJZbaUjDOoCUJZCLxDaEsFVfPI2ykb2nclK9dBmJ0d5TQwfAHUg==
X-Received: by 2002:a17:903:1104:b0:1cf:51f9:197b with SMTP id n4-20020a170903110400b001cf51f9197bmr3512781plh.23.1702002839490;
        Thu, 07 Dec 2023 18:33:59 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] rust-cross: Simplfy the rust_gen_target calls
Date: Thu,  7 Dec 2023 16:33:20 -1000
Message-Id: <9fb5f81f58306b2d355049698b6a17d045bd5e1e.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192006

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Match the code in rust-cross-canadian so that further simplifications
can be considered in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cb62d0a33777cb9afb1eea5f736a2580ce50dc7)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 12 ++++++------
 meta/recipes-devtools/rust/rust-cross.inc  | 16 ++++------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 3252827818..a73367bbd5 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -119,12 +119,12 @@ def llvm_features(d):
 
 
 ## arm-unknown-linux-gnueabihf
-DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-TARGET_ENDIAN[arm] = "little"
-TARGET_POINTER_WIDTH[arm] = "32"
-TARGET_C_INT_WIDTH[arm] = "32"
-MAX_ATOMIC_WIDTH[arm] = "64"
-FEATURES[arm] = "+v6,+vfp2"
+DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+TARGET_ENDIAN[arm-eabi] = "little"
+TARGET_POINTER_WIDTH[arm-eabi] = "32"
+TARGET_C_INT_WIDTH[arm-eabi] = "32"
+MAX_ATOMIC_WIDTH[arm-eabi] = "64"
+FEATURES[arm-eabi] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
 DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index 4c026b1f38..2e47a3aa5f 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -1,17 +1,9 @@
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    # It is important 'TARGET' is last here so that it overrides our less
-    # informed choices for BUILD & HOST if TARGET happens to be the same as
-    # either of them.
-    for thing in ['BUILD', 'HOST', 'TARGET']:
-        bb.debug(1, "rust_gen_target for " + thing)
-        features = ""
-        cpu = "generic"
-        arch = d.getVar('{}_ARCH'.format(thing))
-        if thing is "TARGET":
-            features = d.getVar('TARGET_LLVM_FEATURES') or ""
-            cpu = d.getVar('TARGET_LLVM_CPU')
-        rust_gen_target(d, thing, wd, features, cpu, arch)
+    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
+    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
+    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
 }
 
 # Otherwise we'll depend on what we provide
-- 
2.34.1


