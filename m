Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B6EC3ABAC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8288.1745982025917448165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MY7VfuiN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso5361955ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982025; x=1746586825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rz+Jo7cJuq9tDUikZlbExDQQxCtv8ojActzBzMTdgUs=;
        b=MY7VfuiNfnEG9EeoCm8gZwW2r/YZTyMaledAet8X/f4Mm18OtCLO94aPMYATv8tjL4
         XuQmuTTaPqORl1eLCCyM6CzGGTZexTOK1O2kL9RJBi74Uw5xNqktMqbqNYSB2r9Uq1Ll
         8VJnxfcqA9kLtiQso2HdGWYcyhDpgsUZdFrZTU+/gQLBtHtLulZwfbwG9ov6o4BmyUaP
         LThMzPU4+xMnb3S4hQVMwqRahi32EvmKzr9cB09XlvzMnk+QQCbBwm9MhpfWM78uSJ9L
         f6TL8nfwoaEaxukbNUzusl60v31dk2Upgg7W7hywhAhynBRKTqSwTzHIPXUpxBuLdt2d
         KURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982025; x=1746586825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rz+Jo7cJuq9tDUikZlbExDQQxCtv8ojActzBzMTdgUs=;
        b=xC+Y7HG0DEKIF+k/uXh+xL4VONbT0/HHMCr7FGr3t+CNYOBKuHjvEfZmDpPDyvidUZ
         kwyZMsRqD3liXSiqpRISiZmnUVry2/4avUrwQSKmi3HHQimuWPediaEfTAc2zVNCTagt
         SIjm6btwspVWFiDouZhGtWxBxY8Rcoqe+OJSMhwAg8Geey73URdZ0p9ZDLu/wdst4Zg2
         CGr236CjPspM862Z5dZ1XY29F9Npqzz3XSloTjo0SFobfOYAThzHiZvDASocR6T0BTn5
         G4tkl/Yx3fBoSHxwPhtVGrxrDttIGFGWSzVX38KHHKpcz4qhrmX4sdBcCQO50W6/WZfO
         sH9w==
X-Gm-Message-State: AOJu0Yy5CFqYwSbL30jKkFrfc1BL5536O2BE3DOgTDDNPk+TZEalzhib
	wnNz4YmmM5lpYuLgxPJTZwBfOoU5vp0CUswgEuU63uk7tP/LxIAPd30jFs7Fz3TemQyPf8fuc5F
	/
X-Gm-Gg: ASbGncs1u5buUS6MIqAngNaJDWgocC0s/XEHVxEsBlqA4RsD3G4G6iyW3KxLddMCXz2
	rkOEXQLAy93yL8RXjgKmd19d6JcO/m0ZDFEmRP9XrkpAC+rKjZytnMyGqWJ4NkQB0dSmbBqgLOD
	txf7qeSTkPiyn/UgpPgU/L0ptNH0O3yY/+jVo6KL3NzVx+6yEAlqdE7V0jjwfQ8oEmYOWqVj5Df
	0tx1TiP5TB19PmNRnZgdYZPQDJodQxjqlpJ2tAV5wFSxWwGUBOQCfmluIhrT9IMV71MjgZayAQg
	SdDDpeBThByBJAZiSwMG5jzTsXMReDM=
X-Google-Smtp-Source: AGHT+IE2i0/9AyQyTys1AS1plxhHaLChkS7GFT2aZkCY+rC7z2HcwuzQdn6KHJoi4oS97DjIAv500w==
X-Received: by 2002:a17:902:e809:b0:223:fb95:b019 with SMTP id d9443c01a7336-22df481ab3dmr15915075ad.24.1745982025082;
        Tue, 29 Apr 2025 20:00:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/15] perlcross: update 1.5.2 -> 1.6
Date: Tue, 29 Apr 2025 19:59:55 -0700
Message-ID: <e78d04202b7e73b22d8434b148c52bc4bd539f81.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215713

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: dee97a3d3127eeba77bc6be05dea25f89aa734e5)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ile-check-the-file-if-patched-or-not.patch |  3 +-
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  9 ++--
 .../perl-cross/files/determinism.patch        | 41 +++++++++++--------
 .../{perlcross_1.5.2.bb => perlcross_1.6.bb}  |  2 +-
 4 files changed, 29 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.2.bb => perlcross_1.6.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index 4e9153ebf1..7efee733c6 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -1,4 +1,4 @@
-From 3eb33dce6e3c93e1b3efcc9649f871100adada30 Mon Sep 17 00:00:00 2001
+From d0292a4f91ca22f8919a0f13d8961f98743bdbf1 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 2 Jul 2021 09:08:21 +0000
 Subject: [PATCH] Makefile: check the file if patched or not
@@ -9,7 +9,6 @@ one time.
 Upstream-Status: Inappropriate (OE-specific)
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
index 6c3f08c432..6d387fe66a 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
@@ -1,4 +1,4 @@
-From f824cbec9ac8f113a4ae35d57bd18625d415a71b Mon Sep 17 00:00:00 2001
+From c4ebb6d11d690185f66a3f0a591f193fd6611122 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Nov 2018 15:37:40 +0100
 Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 01644cd..be811a7 100644
+index 4b80079..c6d6042 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -180,7 +180,7 @@ endif
+@@ -191,7 +191,7 @@ endif
  
  ifeq ($(useshrplib),true)
  $(LIBPERL):
@@ -22,6 +22,3 @@ index 01644cd..be811a7 100644
  else
  $(LIBPERL):
  	$(AR) cru $@ $(filter %$o,$^)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/determinism.patch
index e9bf752bcb..ef11b12a35 100644
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -1,4 +1,7 @@
-Fixes to make the perl build reproducible:
+From 8fd84d6d760b21bad2c499b572951cc3f2235953 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 5 Feb 2020 23:54:02 +0000
+Subject: [PATCH] Fixes to make the perl build reproducible:
 
 a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
    whether the shell is bash or dash which can cause the test result to be incorrect.
@@ -8,7 +11,7 @@ b) Sort the order of the module lists from configure_mods.sh since otherwise
    the result isn't the same leading to makefile differences.
    Reported upstream: https://github.com/arsv/perl-cross/issues/88
 
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst 
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
    there for good measure)
    This needs to go to upstream perl (not done)
 
@@ -20,12 +23,26 @@ RP 2020/2/7
 
 Upstream-Status: Pending [75% submitted]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+---
+ cnf/configure         | 2 +-
+ cnf/configure_mods.sh | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: perl-5.30.1/cnf/configure_mods.sh
-===================================================================
---- perl-5.30.1.orig/cnf/configure_mods.sh
-+++ perl-5.30.1/cnf/configure_mods.sh
-@@ -82,7 +82,7 @@ extonlyif() {
+diff --git a/cnf/configure b/cnf/configure
+index 2f451c6..86bc865 100755
+--- a/cnf/configure
++++ b/cnf/configure
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+
+ base=${0%/*}; test -z "$base" && base=.
+
+diff --git a/cnf/configure_mods.sh b/cnf/configure_mods.sh
+index d4ef5a7..8e88b48 100644
+--- a/cnf/configure_mods.sh
++++ b/cnf/configure_mods.sh
+@@ -108,7 +108,7 @@ extonlyif() {
  }
  
  definetrimspaces() {
@@ -34,13 +51,3 @@ Index: perl-5.30.1/cnf/configure_mods.sh
  	define $1 "$v"
  }
  
-Index: perl-5.30.1/cnf/configure
-===================================================================
---- perl-5.30.1.orig/cnf/configure
-+++ perl-5.30.1/cnf/configure
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- 
- base=${0%/*}; test -z "$base" && base=.
- 
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.bb
index b41c182fad..295dd0cfc1 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90"
+SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.43.0


