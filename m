Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88B5E69169
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:54 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87772.1766434073851494693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1sW0EFA;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79e7112398so703411366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434072; x=1767038872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygHB8vQKgfNKCUEaHxzW7uHSrQNRhdWxYxVyplefU10=;
        b=m1sW0EFAcNZkfnILg505ClwnbNM0VH3Zfyv5oudlMBf2kjV5dxrKkxctLPMcrUgLuk
         vUevkFnmUPorcpvEEcVMhZW7PZxxEWI2XndCyyJtKlGAVrdmZl/gd4C5agVEnwvstxWl
         PBbvg1c8CBK3ceRnNX+wM+ber2ijUWwUliFyARrqCjo06q154Ow2gZDVSJRx6ssTdbQt
         qimeGsbCu/rVniOSxjVXRTs0MHnOc32JF8CbXOVwecCbjXC9Jk67KvxAfmu1gwxkjKV/
         ugcUzDKte3PkMlIx8i3xDpOkPWofc5MqkS34BZsXTnNTgyrOkYZN2ScOL54SkVtNb1DP
         v3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434072; x=1767038872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ygHB8vQKgfNKCUEaHxzW7uHSrQNRhdWxYxVyplefU10=;
        b=RuNN9Yu/1pjqYFaLmAPi7GBCcC9cgFDDAD+UFdqJknuWoC54HTT/DsUwHjuiqx04cX
         0bzDZklJikZwtIQfvj7SORLwrRdHG/2zvmsGjoHVmgps79sRgV8UKn3OvMar/cVIIhH3
         GhcSDX3y5qYVMdxPY3X0Peit+MH4+GFn4m2pv6ZRziFwhikX5qvNCtOv+wFp0cm1lLAf
         TLCYWI53XoXeQfGq0GViyvb7sfWyiHoQ7+TYyp044PmYjooOR4bwPxGq2VeA3Pf3xgfY
         IDeHxhpiNNG3d8OWoNZ5zQKO+WQOmjwHDAGfurEaPAE+6lRs0sv+CEp9REp+umdzEo3f
         ux0Q==
X-Gm-Message-State: AOJu0YxWiUZSHK4N4NiApp11irGzdq3EUTbcGSN9EZ1u/gIj529PAcco
	V6q7sz48wvpzZ5rWbDJwzL54ZCG5DVDFoC0Te1l2zSIopQphgY3zWmj9+YqM3A==
X-Gm-Gg: AY/fxX7AEUsW3BqNHMZttiXO+9jWmSQyWCagGPrNwB8W//ZqVuHLMZiFSmjhFgBONjM
	b8IMakXoeil9+CEUwAJARZG4O8047/QvQ/lDDCEri8Dgf+PO9wlB4GD73FIQmV4aFS6Eex3wt7V
	+7TXSOG9SDMfwtHJSbonEoBpSr84fU3gAcdxdQxQxEmKekMNy6+w9r6IisQVjxeO+vUZ1Qcp+mG
	vmUQHULD6p39TC11lAas9Qn0jfKQBSvG9qIfLc/SeoKCgZsX8ybiKL8cTy2sscmqZIO4DGKLVoA
	KnzHPoFlxU8HDkmuTN949cwBxa56SLwxbyOeLduI02G7GvnUWzCbaxRNO3yVQvkRJmvD4ERgi7e
	FtylG774yL5p0jVuaTamI8oxaQguCwL9In43GbLkrlZsNPwlSMoMrbs44e7daqRLnW1C1wP57xP
	jnqjcOydaM9T5Ngv7yzVgww2L4pkekv7+w40OG8Zic3pbbmlM=
X-Google-Smtp-Source: AGHT+IHCSgfk1Xp+AmGocZDRKH+cJCewT0XYdqROOCccv+lzSaYc7N07nsy3tuvH/kRK2mS0lSuyaw==
X-Received: by 2002:a17:907:1c0a:b0:b7a:1bdc:aab8 with SMTP id a640c23a62f3a-b80372301femr1281499366b.65.1766434072103;
        Mon, 22 Dec 2025 12:07:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 010/114] cups: upgrade 2.4.15 -> 2.4.16
Date: Mon, 22 Dec 2025 21:05:52 +0100
Message-ID: <20251222200739.2278706-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228335

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cups/cups/0001-use-echo-only-in-init.patch              | 2 +-
 .../cups/0002-don-t-try-to-run-generated-binaries.patch     | 2 +-
 .../0004-cups-fix-multilib-install-file-conflicts.patch     | 6 +++---
 meta/recipes-extended/cups/cups/libexecdir.patch            | 2 +-
 .../cups/{cups_2.4.15.bb => cups_2.4.16.bb}                 | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.4.15.bb => cups_2.4.16.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index c0cb7df581..e4b473aaf3 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
+From 575a890a818e8ddc95d22838480b62988ffcd639 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index cf2f1a6747..378ef677a5 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
+From 36fa890e4b30bf42318065fe3172ef92b2d3e313 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 31338822e6..2728fc7e3c 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
+From 53aeff85692ce3fd0ac325ec7dcdff31748ccee6 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index f96f745..27d8be9 100644
+index 6db1392..bc999e4 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -73,7 +73,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 493c7970ea..4acff27e54 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
+From fab57dbafccee851b22b757f08fc3273ad78b8ae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
diff --git a/meta/recipes-extended/cups/cups_2.4.15.bb b/meta/recipes-extended/cups/cups_2.4.16.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.15.bb
rename to meta/recipes-extended/cups/cups_2.4.16.bb
index dc22771db3..6c08e49728 100644
--- a/meta/recipes-extended/cups/cups_2.4.15.bb
+++ b/meta/recipes-extended/cups/cups_2.4.16.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "eff0bbd48ff1abcbb8e46e28e85aefaffa391a1d9c4d8dc92ab3822a13008d7f"
+SRC_URI[sha256sum] = "0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d"
-- 
2.47.3


