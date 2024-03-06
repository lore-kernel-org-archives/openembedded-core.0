Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D80C54E5D
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.15030.1709739736308973188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNNIdoIH;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a45aa7cb2b3so246753566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739735; x=1710344535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iR26OHGmPBhdewn4O7pZXE5vt8S3+IqHm4j1yoTtS5s=;
        b=cNNIdoIHkhg+ELMuiaYP+L+AyjPm/JpxHtmWfE6fb6JOMuWyjbVpGgF+aloRCzMJQP
         wVAu4tOTJ4wH+qVA/P8YbeM+GmC/zFzZF4uReMovfF3IA8os9ivcOc7bF0uADEHGUHkm
         4hNwkZa3gUd6yH5ZQqQ750GdVCBygeCHaQAoEkJyROKKa0MgCTR/QI5GlxCjrNI+CEpA
         YfooX0mrnOGW0lSxomv0lkIIDMM6gbX/M2F9/q6xeb/3QEAyYfCUwhjqNPCwM3Xq9Yeu
         02iy0VE3KAc8Mw2989r5QHt4jRnqOHh4Ff43Awn38xaM7g8xWb/On1XrdanZRUctITFu
         wXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739735; x=1710344535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR26OHGmPBhdewn4O7pZXE5vt8S3+IqHm4j1yoTtS5s=;
        b=t+OzJRz5lOqYfxMyZDqZFVrIsRVGIpWe1aPhO/TDcm6oXH427qS7Z7Vd4TSGKeB1P8
         QSoC9Zq56Dcx87TZGrGwfqW9GXNv8m9DAFzeWhX2xd3RYRQeMRNCkM6ClF5NACVkXf0i
         ASbrQWTnpkLxEGPKcrrI+iJNfvn2aftWyDjqwWOOvZeYAWx2prYKn14IRKYVZvIGKoil
         EqFqrMvEGM9zBc6QeXAM1At2rn+5hrVakdw2SgHIZkGZO6SetnSGf9lAuZW6oaNvVmM/
         fjI1zU5GaePSfrs/i3YJM3WftidDRuyImN7WINPoRG+M5bLqIU0TgOrL2cS1w3l1JDFM
         ILMw==
X-Gm-Message-State: AOJu0YxRnV6jokH3BdJK+uz/9v6cO080qsSQaF5I2xpOBL2L+PJZ5ZFo
	ep7IRPHHWphD1azfkY6TNknihbxpldxjCqE647ZEXlXBJRfAsv4fEw1jw6xw
X-Google-Smtp-Source: AGHT+IE/rSpGe3XOL9WnBDHhg8XsL36LycIhHwnZMBeLTU1EDoIrvaMuUAzpcVWkElz/fJgpUdxfxg==
X-Received: by 2002:a17:906:3c10:b0:a43:292c:2081 with SMTP id h16-20020a1709063c1000b00a43292c2081mr9316836ejg.16.1709739734643;
        Wed, 06 Mar 2024 07:42:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/47] mc: upgrade 4.8.30 -> 4.8.31
Date: Wed,  6 Mar 2024 16:41:30 +0100
Message-Id: <20240306154151.3741709-26-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196709

Fish vfs was renamed to shell vfs:
https://github.com/MidnightCommander/mc/commit/6ca4ab4b4ef0f42e9b56103038b7f45e146cbdc8

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/no-gplv3.inc                     | 2 +-
 .../packagegroups/packagegroup-self-hosted.bb             | 2 +-
 meta/recipes-extended/mc/files/nomandate.patch            | 5 ++---
 meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb}   | 8 ++++----
 .../packagegroups/packagegroup-core-full-cmdline.bb       | 2 +-
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.30.bb => mc_4.8.31.bb} (91%)

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
index d515fd4ad6b..b3eb936d94f 100644
--- a/meta/conf/distro/include/no-gplv3.inc
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -6,7 +6,7 @@
 # will be a cost in reduced functionality.
 
 # Settings for full-cmdline
-RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
+RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-shell mc-helpers mc-helpers-perl sed tar time"
 RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove = "diffutils m4 make patch"
 RDEPENDS:packagegroup-core-full-cmdline-multiuser:remove = "gzip"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index ae34a8a90b3..df71695a97d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -40,7 +40,7 @@ RDEPENDS:packagegroup-self-hosted-host-tools = "\
     iptables \
     lsb-release \
     mc \
-    mc-fish \
+    mc-shell \
     mc-helpers \
     mc-helpers-perl \
     parted \
diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
index 4ebaaa2fa73..92fa443865d 100644
--- a/meta/recipes-extended/mc/files/nomandate.patch
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -1,4 +1,4 @@
-From 4482ed0b8bd506cc2590ceacfdada6cc34450796 Mon Sep 17 00:00:00 2001
+From 78c5fd90a052f95157b3914c708a08b2eeab0154 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 4 Feb 2020 18:12:15 +0000
 Subject: [PATCH] mc: Fix manpage date indeterminism
@@ -15,13 +15,12 @@ RP 2020/2/4
 
 Upstream-Status: Inappropriate [OE specficic reproducibility workaround]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  doc/man/date-of-man-include.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/doc/man/date-of-man-include.am b/doc/man/date-of-man-include.am
-index c6b1e69..165a796 100644
+index 96f9f10..d734c5d 100644
 --- a/doc/man/date-of-man-include.am
 +++ b/doc/man/date-of-man-include.am
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-extended/mc/mc_4.8.30.bb b/meta/recipes-extended/mc/mc_4.8.31.bb
similarity index 91%
rename from meta/recipes-extended/mc/mc_4.8.30.bb
rename to meta/recipes-extended/mc/mc_4.8.31.bb
index 258ac38e157..69c32887a24 100644
--- a/meta/recipes-extended/mc/mc_4.8.30.bb
+++ b/meta/recipes-extended/mc/mc_4.8.31.bb
@@ -11,7 +11,7 @@ RRECOMMENDS:${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "38171f22f889e3030ec9055463d3ecd7843984ab24e6497d8294d1c441a7ddb4"
+SRC_URI[sha256sum] = "f42f4114ed42f6cf9995f1d896fa6c797ccb36dac57760dda8dd9f78ac462841"
 
 inherit autotools gettext pkgconfig
 
@@ -39,7 +39,7 @@ do_install:append () {
         rm ${D}${libexecdir}/mc/extfs.d/s3+ ${D}${libexecdir}/mc/extfs.d/uc1541
 }
 
-PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers ${BPN}-fish"
+PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers ${BPN}-shell"
 
 SUMMARY:${BPN}-helpers-perl = "Midnight Commander Perl-based helper scripts"
 FILES:${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
@@ -53,5 +53,5 @@ RDEPENDS:${BPN}-helpers-perl = "perl"
 SUMMARY:${BPN}-helpers = "Midnight Commander shell helper scripts"
 FILES:${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
 
-SUMMARY:${BPN}-fish = "Midnight Commander Fish scripts"
-FILES:${BPN}-fish = "${libexecdir}/mc/fish"
+SUMMARY:${BPN}-shell = "Midnight Commander Shell scripts"
+FILES:${BPN}-shell = "${libexecdir}/mc/shell"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index e9531fa8381..8dc62954a21 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -42,7 +42,7 @@ RDEPENDS:packagegroup-core-full-cmdline-utils = "\
     less \
     makedevs \
     mc \
-    mc-fish \
+    mc-shell \
     mc-helpers \
     mc-helpers-perl \
     ncurses \
-- 
2.39.2


