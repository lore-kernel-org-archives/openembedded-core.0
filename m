Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.687.1613432358748509595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 15:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UFG0m4Sb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o82so204653wme.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 15:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VZEIyEMfLbG0KkZdi7X5knjSPfCJyvM0bCtBgT/yUYc=;
        b=UFG0m4SbeFWdRov078Ou48w6dBwL1oKgFmspwwvFrIjLOnIkH2RT1hJWOODXXLh3fq
         4mizyjlhlE+H+Tbe13Lslxebr4qKeSNBap3VeWJjfmvBWZO/8c7nDD3UorVumm7o0ZM4
         LafmmZuFrOUAqsBae9XdhPELFHxSRU94CzEE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZEIyEMfLbG0KkZdi7X5knjSPfCJyvM0bCtBgT/yUYc=;
        b=aPUA23ZWsesgzUjTtupbLAKkQbtxTr/mWL2YKiAzRCirNcRcFZfhvVltT+80XFmR2/
         liVq+lkjoJCS4PxieuqkmeUiBPxDl2pPhEtsB87DqXzBGBbOCDqiEA0W+GE6UIVeo7JC
         +KU4PMbB0+voatTPHQOW/cqSlg3hH5xkKPL7FijHxBfZCsNz2OS3EfDTWaAsFDh9hali
         44ivNnRUQF1dKze4r5sIrIdvQQnX6NDEqzR/yGtFJ4Grc0oU9eWI53BRvFGE3hQ73GnZ
         9HaqtuttHt6qySKcr3vyAPURXb9XXQR7sSoDu7qiRX10VUdlR4lxEOtsjGvaATEmx3JG
         kfJA==
X-Gm-Message-State: AOAM531PcjTU9PaxAPkwiXccPtTCHnlDyGzajft/ZoO/MpgtLCHPH5C1
	t1t8A1RSpeEgvk1RoXD6JzKaUE7VDVyGUA==
X-Google-Smtp-Source: ABdhPJyrwM8xV4qsjm7nUAoefkNFm82VMY7seNoOWEC7a6vP1/R0Tp00XJXfKZPqcbduBtufhS1GDA==
X-Received: by 2002:a1c:e344:: with SMTP id a65mr887148wmh.44.1613432357131;
        Mon, 15 Feb 2021 15:39:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id i1sm919125wmq.12.2021.02.15.15.39.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 15:39:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] vim: Fix a race over creation of the desktop files
Date: Mon, 15 Feb 2021 23:39:14 +0000
Message-Id: <20210215233915.2007777-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210215233915.2007777-1-richard.purdie@linuxfoundation.org>
References: <20210215233915.2007777-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LINGUAS file can be written by two different Makefile targets
and if they race, the desktop file contents isn't deterministic.

Fix the makfile to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/files/racefix.patch | 33 ++++++++++++++++++++
 meta/recipes-support/vim/vim.inc             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/racefix.patch

diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
new file mode 100644
index 00000000000..48dca44cad6
--- /dev/null
+++ b/meta/recipes-support/vim/files/racefix.patch
@@ -0,0 +1,33 @@
+The creation of the LINGUAS file is duplicated for each desktop file
+which can lead the commands to race against each other. Rework
+the makefile to avoid this as the expense of leaving the file on disk.
+
+Upstream-Status: Pending
+RP 2021/2/15
+
+Index: git/src/po/Makefile
+===================================================================
+--- git.orig/src/po/Makefile
++++ git/src/po/Makefile
+@@ -165,17 +165,16 @@ $(PACKAGE).pot: ../*.c ../if_perl.xs ../
+ 		po/gvim.desktop.in po/vim.desktop.in
+ 	mv -f ../$(PACKAGE).po $(PACKAGE).pot
+ 
+-vim.desktop: vim.desktop.in $(POFILES)
++LINGUAS:
+ 	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
++
++vim.desktop: vim.desktop.in $(POFILES) LINGUAS
+ 	$(MSGFMT) --desktop -d . --template vim.desktop.in -o tmp_vim.desktop
+-	rm -f LINGUAS
+ 	if command -v desktop-file-validate; then desktop-file-validate tmp_vim.desktop; fi
+ 	mv tmp_vim.desktop vim.desktop
+ 
+-gvim.desktop: gvim.desktop.in $(POFILES)
+-	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
++gvim.desktop: gvim.desktop.in $(POFILES) LINGUAS
+ 	$(MSGFMT) --desktop -d . --template gvim.desktop.in -o tmp_gvim.desktop
+-	rm -f LINGUAS
+ 	if command -v desktop-file-validate; then desktop-file-validate tmp_gvim.desktop; fi
+ 	mv tmp_gvim.desktop gvim.desktop
+ 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1ea40e5e7f5..d57f784da5d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://racefix.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
-- 
2.27.0

