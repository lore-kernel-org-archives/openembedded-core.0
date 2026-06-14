Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D448ECD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105056.1781424258171946371
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mfq2WK0v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso9923375e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424256; x=1782029056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2Jc4/VkTXJwsiVVqQWUcKOBMzZPgw1rHnq2wf9p6mU=;
        b=Mfq2WK0vZTjq9T1aZsEZj1cbDRBsODVu3MKWvL9SRq2bD5wqRePyMnld04TuMjUFXK
         xqcuAT2sjDk0dUkBqfpWSmmC/Db0qyXKnOIjytAZXLYUDNXig15xvjolSJEaJltnL38c
         CekDHf2DnTRi52KDPAlF+kUO25UrF8szEBI9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424256; x=1782029056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2Jc4/VkTXJwsiVVqQWUcKOBMzZPgw1rHnq2wf9p6mU=;
        b=dTsfR6shHFiex+zFIEOVgqcpNkB/9VORqTFJuG5V0YQxdN5oWBad0uZcR3wFy2V6H2
         IHM3v9Jnpy/1j+JmRaKfYJKId+zfLg629R7Sgfg3yeCBmLfpEYpfTZx63yunxFVw4MpH
         icEp0mlLsorEt54WyH5n1vehXkh/aiDHpFduf3N5EviSqna+PyzXC4pa9pv2oHU0N9jd
         ided9NcH88BwQTw1ySH1l49pgbp2JzrsTSMj2oP8k3Hkfp7ZecMuSNNrB7753ED8SuQk
         lVL+aD9uz3B/zOevebZUx+5Lxu5VXLy8zN0QVjjdKZMdTzgdjIEwRU4BtB1pPu1GXzKN
         KhHA==
X-Gm-Message-State: AOJu0Yxd7Qis8/wxNm6YkjaxyBodHDc6y056tZNoYS0NuG+SiNAGfFwf
	iqyjKtpGjFvgA0PnvpoWfFh7C4SciyoE25gMGFheJJm0iE8gQ7zfzSygKup/gKuNmrwuppjwsFl
	1Z6Sf
X-Gm-Gg: Acq92OFz+B3yCjJAnUddzDc2M9qO4kDag2PWAyqVgqYxPHehjQi14IWUBKO/n55Jt4m
	ipAmi/mwGvrtR5N2G4bmnr5HCwerFlRHHGKAM+6pXM4bSZt6lLQhmJamPmUykbF1pX3xa55E5vt
	+IIzvBt1zcUNp4Mtl4xGCl6sGnxS8BOYIiHKtSUBTzCUp2Hfy6+62shQEp8DB9eQCORUT2KZf3M
	D3+7qlbGnt9d+KlhZqt1vexhObFgvuGGwjEqN4vRZCt/c53oqaFGqO7UWBwGXtaD7IG6GGm5KDI
	DKQiArgIz2HpA3RPORF1mQGu6eZ35EgcAvu7jlBlz659YGXTLD6THfmcZiaxLjBbBrnT498ubxQ
	t0bsOp8/njOxoof+k+ptCXWCCuDcpeIfXof9lnq2UIJV+5UG1SIuttE+kGaF+/TVeK9e3lWVJ0j
	KzwedskPApQ4GV83sjdll7lMfXQAeeGLSPz4UgBgWpo3x5LqDsFm6E
X-Received: by 2002:a05:600c:1d89:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490ec4d786emr92499075e9.9.1781424256349;
        Sun, 14 Jun 2026 01:04:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 44/56] rsync: upgrade 3.4.2 -> 3.4.4
Date: Sun, 14 Jun 2026 09:02:55 +0100
Message-ID: <20260614080307.4017177-44-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238728

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-Add-missing-prototypes-to-function-declarations.patch | 8 ++++----
 meta/recipes-devtools/rsync/files/determism.patch         | 4 ++--
 .../rsync/files/makefile-no-rebuild.patch                 | 6 +++---
 .../rsync/{rsync_3.4.2.bb => rsync_3.4.4.bb}              | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.4.2.bb => rsync_3.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index e6d3578e85c..ede0238b2ef 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
+From c05cc113f925bda645c8e51b83e9dc30b0543bad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -50,7 +50,7 @@ index 24de64f..a787488 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index e4ba1cc..8482b71 100644
+index b948f16..afca81d 100644
 --- a/log.c
 +++ b/log.c
 @@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
@@ -63,11 +63,11 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index ccad28a..bbb09ba 100644
+index 229a889..aa158ad 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
- 	stats.deleted_files += stats.deleted_specials = read_varint(f);
+ 	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
 -static void become_copy_as_user()
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index fd96b873c85..a8fee5ba0af 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
+From 32852028e95cdf78d09f1bd867f3b46b4728f9e3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 80e9d72..a7d313c 100644
+index 0ba2d5c..b9c5438 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index fb195b1e685..914b50a7b7e 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
+From 50ef5ccd9149cee27bae29e767ff1c2e76bdc879 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index c2fe775..80e9d72 100644
+index 79060b3..0ba2d5c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
+@@ -200,60 +200,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.2.bb b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.4.2.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.4.bb
index 5fe1bc2c2b3..fa9a61778f6 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
+SRC_URI[sha256sum] = "bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846

