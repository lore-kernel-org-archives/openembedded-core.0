Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BA8E6917D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87779.1766434078433930367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cIaPGrAF;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso5587617a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434077; x=1767038877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whWjwe7tscZf5Ucxkys/jjJLEIVbfzLxP3YZPk8jFeQ=;
        b=cIaPGrAFwkvwsHGuZbf2EtNW7BImiUXVuuh/z+HZUyI4AEiAwNXUNUErAt9NIRTa23
         1+uE+gBgVzhpNq0v+5ZjNTOsXFJabtodg5TrnTdypvxeYOwL8Gsb14mJFYxjPrgx/C/v
         dAKliiA3DU9CJ6l1Kckuhwnq1Xfpa2NMiU2w2icuPC635CAGQVGwdClJsxMePEMywKN/
         BDGOcNsAJHdez2dtBw4fpXaZvadEaWe1ShgxXTOUrh1iL9qyjk2YRLqsmbE2a37ryMUn
         bnxlBTjtczo+GMP3drshJvU/QKyCNjDpsEiMQ5NuMpDWbDfK9qAJKLCT6IakW7pndI8j
         TZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434077; x=1767038877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whWjwe7tscZf5Ucxkys/jjJLEIVbfzLxP3YZPk8jFeQ=;
        b=Dghp49Uz9azCGTSk6GYfa6K94iLstwMp/Qo5mxbfbyTjCM7EdL5s5vtXCoMn8DslOT
         xXpPKe/9DcaEr+u4L7oFgEckTAXeltDTnAqWOG81iPFwRQLL24e0n+tqlp081JD0rkC+
         qBf9LV0x05MM5X1SAXR20s/J7l5APETryjdgg0PhuNQrPVL/qN5zPJHvVSjOcJia2mM0
         y1tGBgChcOq9FoDzFn1fwNhh4J3aSOmVoJCsRfrgygoCgHnzWpPyW8dKn4F9PwiM3xTX
         LeOO91UDfpus0m3E9JghFSorW+3H7amwzOLlMu6fXkO7TSuvcCBLKRLGDkgW7rPFCleX
         c9vA==
X-Gm-Message-State: AOJu0YxFaue8Z1eib++kbE86FoYPmgqHl94xRfZ49/B3BlG3E89NrLQM
	J99zkLda3AnyXXsahqJA9vd+l2F6DUn6PNeTCg7Zn1pki09XiccyPBsBxvJgog==
X-Gm-Gg: AY/fxX6L9WV3zXqifk3Bn5c2UaieZ7bK/R9uSspcWRJjrLsvHtNQL/T5/dVD0UbuFaN
	4s4HUQzLYjYPnipJOs1bpSi6+YIaqGOZTJDGM+mnwxNOgAVOmyhjpjqU2bfslBY1AKsDVa3qsuL
	dDDNF55wWUtSwRGPQ7cBcoIRbht2i8i3O8qLB0OqGSygWFTm6hvl2vhkQPfB8LZwV9oH0mRk058
	gQ59/qBhuZdebnN8qY6NDxsCVkTYGMGX06nvavRYsLM5wbTUrlAkV4P4NiqjInkl3Sz5x3mvPLz
	66TlHHz7y1CvOcGVAgxofMJeBu25vGv4+P4r7nOfjXxTWD/p047vefVUi1ST17Y6M9PuH0QxvAR
	iG98iu9bpUNMyhd+gILMszJfbToa2zhd/AF5FGL7RKS01Vhz/w+MPEcuKi58D8qYZBj8vkFN6Ox
	Ik6LmaE8IrzNEc3KPdg9pXaA0xUMgKWSvKu7rReVeDIv8H79g=
X-Google-Smtp-Source: AGHT+IH/ADTxUd0HwtACk4pQp+74P0iazQLBtVAbkgpRLNPEuSBGqKlR8V52xEXmmNE+IuqKH+dr9g==
X-Received: by 2002:a17:907:7246:b0:b72:aaae:1b22 with SMTP id a640c23a62f3a-b8036ebd982mr1376734266b.12.1766434076547;
        Mon, 22 Dec 2025 12:07:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 017/114] gtk-doc: upgrade 1.34.0 -> 1.35.1
Date: Mon, 22 Dec 2025 21:05:59 +0100
Message-ID: <20251222200739.2278706-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228342

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Do-not-error-out-if-xsltproc-is-not-found.patch      | 4 ++--
 ...001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch | 2 +-
 meta/recipes-gnome/gtk-doc/files/conditionaltests.patch       | 4 ++--
 meta/recipes-gnome/gtk-doc/files/no-clobber.patch             | 2 +-
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch      | 2 +-
 .../gtk-doc/{gtk-doc_1.34.0.bb => gtk-doc_1.35.1.bb}          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.34.0.bb => gtk-doc_1.35.1.bb} (96%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
index ee1acda401..575ca5d32f 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
@@ -1,4 +1,4 @@
-From 50d3b9d3ca0e1ff47c8e7559303855530e58839a Mon Sep 17 00:00:00 2001
+From 5d64ab3a7c18904231d611b1262d1289b7282930 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 7 Sep 2016 14:52:04 +0300
 Subject: [PATCH] Do not error out if xsltproc is not found.
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8725074..0491090 100644
+index f238de9..909771d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -37,7 +37,7 @@ dnl Check for xsltproc
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index f329539fa8..600ea40f3d 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 64163565f8d6853b02e53308a6e6ba23d9d96299 Mon Sep 17 00:00:00 2001
+From 98fc3c6e6ac36a2351ee7ff260bf74a7866c8483 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
index 55cae34b46..81017f61ce 100644
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
@@ -1,4 +1,4 @@
-From 9aa9230a305e964b2417daea2b51e43b2dee607c Mon Sep 17 00:00:00 2001
+From e4d003318a87ff895b1fcdad1ba4ca3f4f730cf9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 27 Jun 2017 21:00:58 +0100
 Subject: [PATCH] gtk-doc: Handle floating gtk-doc dependency
@@ -13,7 +13,7 @@ Upstream-Status: Pending
  1 file changed, 10 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 0491090..4270c88 100644
+index 909771d..9db9fbc 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -82,6 +82,11 @@ if test "x$GCC" = "xyes"; then
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index 90207d6c12..a75c2bceb7 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From fa5e31e02b9d3c6c5ec3cdc1f34dd6c179520fd0 Mon Sep 17 00:00:00 2001
+From bcf24419dc1965086793b4ff66a2f9b06574f974 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 1b5c190f56..b1c6c25dc4 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From c11fba9bcb8d55568067e626bd959841c05081e5 Mon Sep 17 00:00:00 2001
+From 24ddd2afb4fcdb8b7c88af5caec0c18ec9e7ff4e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
similarity index 96%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
index 693ae427e0..c9ab7ff1e9 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
 
-SRC_URI[archive.sha256sum] = "b20b72b32a80bc18c7f975c9d4c16460c2276566a0b50f87d6852dff3aa7861c"
+SRC_URI[archive.sha256sum] = "611c9f24edd6d88a8ae9a79d73ab0dc63c89b81e90ecc31d6b9005c5f05b25e2"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.47.3


