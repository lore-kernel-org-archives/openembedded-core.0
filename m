Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99040C8302B
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 10:11:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9433.1724926275887568390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 03:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yefyxg/r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-371a9bea8d4so294300f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724926274; x=1725531074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThGPrA8k0ycfA9kTYIOSZQaWWZL7X8SJieZqJvpQ5ls=;
        b=Yefyxg/rwS8d+W02m80gd8TKL3sVC7X739S0ijHOFA26Dc0vXuhSHu5s6aOuNd0CAC
         5NH7DqJJSSqSKeCWJvTGSh/edQN2fxWHfawBlG2yDv6GayM0dTQ3bpCkAu2Ux40Vxo4M
         HxoHNjrmuw18v+gMZYzRv9p/3jLyunBtWZd50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926274; x=1725531074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThGPrA8k0ycfA9kTYIOSZQaWWZL7X8SJieZqJvpQ5ls=;
        b=BnXATrhqF1/e1XvHdyR9A0OKdc88fCMtqTDci+bceZwY314izxk2UZtu9lNQ3S690f
         vAimn5cKaM3lm06p62KLWm2UZWJMympyiawIip5yOpwr2AZ0kkfS2QHFwWW9C80nPyW+
         uLCHQRzFitkw+eFI0VewOQazh4yb2t4enD08p7NfHXmS9NUPgsyziDGSCccUqVacmE95
         wUt5FJqrpBYddna4dL/FyDD9oqoVZnoxLSRCDQWS17QNuuRF5ZrCz2MDLijy/bnv/kbB
         NDC1u45HuiiDh9vzXVaDTqFH+KN4EuWRsNbBSz3weDeGr79CurSo8dUyKM5h8ldWRa99
         uVHQ==
X-Gm-Message-State: AOJu0YwDwZfXAsEPdDKCvJ3aYHzwb8LlOJWJ7hIqiQOvAAUwTHNs0YFx
	YZw0WXfEtcrWiU1AbR+BNuhOjnxepT5n7JHR8qMocgJk9FsJYIRVodW2Rurc45DOTxS10XXPIXn
	H
X-Google-Smtp-Source: AGHT+IH3Zd+4jcu4Cw2WAUR3emmm+wyi/PnOA3LkiWibok+vjxtROZneL1S/Jrcd/Yiy0MLI7Rjmdw==
X-Received: by 2002:adf:e882:0:b0:374:93ca:b1de with SMTP id ffacd0b85a97d-3749b586c35mr1677236f8f.52.1724926273441;
        Thu, 29 Aug 2024 03:11:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee99d6dsm1009420f8f.48.2024.08.29.03.11.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:11:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lz4: Fix static library reproducibility issue
Date: Thu, 29 Aug 2024 11:11:11 +0100
Message-ID: <20240829101112.3986061-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 10:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203908

The autobuilder was seeing an intermittent reproducbility issue in lz4 with
regard to symbol ordering in the static library. Add a patch to fix this which
has been submitted upstream.

Fix the SRC_URI whitespace and cleanup the patch directory naming whilst here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lz4/lz4/reproducibility.patch             | 33 +++++++++++++++++++
 .../lz4/{files => lz4}/run-ptest              |  0
 meta/recipes-support/lz4/lz4_1.10.0.bb        |  4 +--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/lz4/lz4/reproducibility.patch
 rename meta/recipes-support/lz4/{files => lz4}/run-ptest (100%)

diff --git a/meta/recipes-support/lz4/lz4/reproducibility.patch b/meta/recipes-support/lz4/lz4/reproducibility.patch
new file mode 100644
index 00000000000..c138986da89
--- /dev/null
+++ b/meta/recipes-support/lz4/lz4/reproducibility.patch
@@ -0,0 +1,33 @@
+lib/Makefile: Fix static library reproducibility
+
+The static library contents varies depending of the order of the object files on disk meaning
+it isn't reproducible.
+
+To avoid this, use the SRCFILES values which are already sorted, mapped to the object names
+instead.
+
+
+Upstream-Status: Submitted [https://github.com/lz4/lz4/pull/1497]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/lib/Makefile
+===================================================================
+--- git.orig/lib/Makefile
++++ git/lib/Makefile
+@@ -55,6 +55,7 @@ CFLAGS   = $(DEBUGFLAGS) $(USERCFLAGS)
+ ALLFLAGS = $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
+ 
+ SRCFILES := $(sort $(wildcard *.c))
++OBJFILES = $(SRCFILES:.c=.o)
+ 
+ include ../Makefile.inc
+ 
+@@ -102,7 +103,7 @@ liblz4.a: $(SRCFILES)
+ ifeq ($(BUILD_STATIC),yes)  # can be disabled on command line
+ 	@echo compiling static library
+ 	$(COMPILE.c) $^
+-	$(AR) rcs $@ *.o
++	$(AR) rcs $@ $(OBJFILES)
+ endif
+ 
+ ifeq ($(WINBASED),yes)
diff --git a/meta/recipes-support/lz4/files/run-ptest b/meta/recipes-support/lz4/lz4/run-ptest
similarity index 100%
rename from meta/recipes-support/lz4/files/run-ptest
rename to meta/recipes-support/lz4/lz4/run-ptest
diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index 40768fb2925..3b98adf42e5 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -13,8 +13,8 @@ PE = "1"
 SRCREV = "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
-	   file://run-ptest \
-	   "
+           file://reproducibility.patch \
+           file://run-ptest"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"

