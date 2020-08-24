Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.1984.1598295647435433705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 12:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DUcGZhlT;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id p25so8520494qkp.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 12:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9qp+iR5vyKc86o05nExrnQSW+3AAIz/BjNtiuST9RFA=;
        b=DUcGZhlTAp5RjxUHj5Y/u72lc5n8loGR183nPqGsfp6PnOohYwX2WuXyK2izMbJwaa
         FA3mjHuJofdSgfu74QOQ6bjQMuEDTyKhWZqpSz4YyNdkZ73RYEjQedl6JD5TPdSlWuAW
         U/5r1x3a8g1sqUShAWiNUt0Odk3i3cohPPPsvV4CssrCaQbapqe7F+SCohCYCU0lGdR0
         TmYeWsxVXR8lfQG/Vcl1hzzE7rWvFaRh3tl+BQ2HUmhpJZU99TWybTUyHQoBWdhTcli9
         Gf2hBnEpAAySBmOCH3+PhQwElV8FHlkKTThYOKQ+wAGzfnm0mJ+Br3GYXSNWRGOc0Lf1
         aH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9qp+iR5vyKc86o05nExrnQSW+3AAIz/BjNtiuST9RFA=;
        b=okVXS1ToPSkILgtfwyUQ1ghxa+PiTt8gG8bBdq9IM17cNKC0rDu1Iza4f7zz+rEmdc
         1kWGXErjDbBjri+3jWLFG0AbtTK04PeKQRzpXmwqnXyzwhj/CY7WdJNDZQBpAAfEsA0I
         2ORCSiiuX/0uhatHCZdxZKqtYGUcoQm1gecv9zAd8n3hUBJ+42mAcJrbsDIUgKarkYFP
         8BueYa+MwK51F1HmJF6IRD92fghs7+zRkZUx9w/abBTWtB4WLBstdxpkYugM9GHnogvj
         YnUxqRCSfZAk/0xJCdHT1Wwo8URz0Jec3TJATYMjwZCG871HSFs1MeiZmnofhtBEmLE0
         XCJw==
X-Gm-Message-State: AOAM5327fAHA0PZdFQaW+2/XDMj1cPd7DowpBpaA8MLkLdxpMsCOPcIL
	LjMeAEA7s+DbJU4epr9sLhk=
X-Google-Smtp-Source: ABdhPJyi2FczmfMZEmbCPgjXd2Ywlt/ronvEu1KbEEdAeB6ztOp0t435NGfB4TAcP1f9kunWzfi3iw==
X-Received: by 2002:a05:620a:138a:: with SMTP id k10mr5982005qki.171.1598295646584;
        Mon, 24 Aug 2020 12:00:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f3sm3160826qth.56.2020.08.24.12.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 12:00:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.8: selftests/bpf: Prevent runqslower from racing on building bpftool
Date: Mon, 24 Aug 2020 15:00:40 -0400
Message-Id: <20200824190041.54316-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200824190041.54316-1-bruce.ashfield@gmail.com>
References: <20200824190041.54316-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.8:

    912adf166eb0 selftests/bpf: Prevent runqslower from racing on building bpftool

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.8.bb |  2 +-
 .../linux/linux-yocto-tiny_5.8.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.8.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index ca791a3b14..b2d4995474 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
 SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index ed07f6d9d7..847b2623d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "01ca9ab2d6cb0de4425d9dfca99dff30653083d9"
-SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine_qemuarm ?= "a463c9ee9da138e9fd6f602b5a18352ddd241fbd"
+SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
 SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index b10554af87..86f3e851f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3c532d32043dbe90c159f334d8c4232ca67537cd"
-SRCREV_machine_qemuarm64 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_machine_qemumips ?= "de93c804ee2e77d32e8a103a68ef19df6947757f"
-SRCREV_machine_qemuppc ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_machine_qemuriscv64 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_machine_qemux86 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_machine_qemux86-64 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
-SRCREV_machine_qemumips64 ?= "3109e6f363109f0dd4bd6a8647f639e445c533f2"
-SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine_qemuarm ?= "cdc1a8a82f795aa0bcf60744109798a7cea5816f"
+SRCREV_machine_qemuarm64 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
+SRCREV_machine_qemumips ?= "b71b28c3ef58e2db03ab3eb6c576a1e9fda7f181"
+SRCREV_machine_qemuppc ?= "912adf166eb0688e011154048f5fa0e5863249c3"
+SRCREV_machine_qemuriscv64 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
+SRCREV_machine_qemux86 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
+SRCREV_machine_qemux86-64 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
+SRCREV_machine_qemumips64 ?= "21530680430bfb9f8a73fba97e6734bd4869a690"
+SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
 SRCREV_meta ?= "2f9b296099dc534d1c9909f34b1090d8d2280c9b"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.19.1

