Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401A3C87FD1
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.66590.1753646703716686426
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zb8ezvXF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23c8f179e1bso42847005ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646703; x=1754251503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smyuliY09WF8sK7YaF7Jm/7uXj80/GqmtKJSz/kzwfk=;
        b=zb8ezvXFKXEuetHfSmdgmaa91UdHcKPhIe3i1BeF+Omj+Uz+5AEFgwroXnsBC5ly6k
         u6PLphMQYdgzx0AHQvfnD2C5pmnItlfS6PDuoZT97HkUzHfupqJvuWyBh4CRF4raICAa
         LshDBBwTiFgLq7dFq4NEGyAyVwbHPLvYSNaCgf4Luw2o19pgghAaxk3+jw/6fhXfjntK
         lN0X3apfOvdJOYW+rgNL6VKJyZ8lUV0M1nG0mlEuBBmEDksbre/g1EI8AV9VLuE7KijE
         kqqcwnECht8qibrlR7Rqu+JPu2h6ZIXak6E3OXrhfN6XbIvOL05WuJzwi63fthbWKUnL
         00AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646703; x=1754251503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smyuliY09WF8sK7YaF7Jm/7uXj80/GqmtKJSz/kzwfk=;
        b=XEyID1M3VV1ikP2eZASJsRizpEF2PnQks58e8t20DwCICZjP6EVNUmZPmn/2jzVUAs
         d4u2gH5AkO8ANFLGY/ucdXQKuuWHSTU0ZO1OTDOOIHaURGWMirVw0tD9R+N5+BzzWtrg
         0NvPCBVXhxegijjX9ygjaM3ieAg+8F3WgCt0ZCOaZuTEpA8rCliKIMjm6UDA0vbuwnxE
         m2/SVPE6vOz3/67XphLE2Z9zbRpST5iXdD241iHp+epYL5eWc/h3ThimmIqu/1DXRi11
         gIYlJy4heS20PltVJgA3h5fiiBeD+WxaHRCxrK7VQhGzLVyR/d3M4H5JCB0gyikURU30
         D+ew==
X-Gm-Message-State: AOJu0YwGOITOXPoD1Hu8kzvXl1CExBYIRzEndVOr4BH0/lzRGNYqnmIE
	qh0C1B8f/uIyaWLMB21j/dt6PqxM6H7wRDyVeP/On0uh2f4BxSZ03zldZY/CY5K6G9P6l28Vop5
	mAx/afRY=
X-Gm-Gg: ASbGncuNDuKrRR469V2Amd+dVOVM1axImBScyATNb1kHqb4LNeHhQp2aCUvlbMUPbCJ
	lkF1lr8w/zThH+FXEM0mviJDj2rmn0V8/apBwwo9RujwjCdHJgBVNH/Ilh9Q5xRrICrDr5wWFrX
	ni84734VTnqrnp+JpcqN9jG4Vh4DyMFboTMMb4YFJE9SpzxvyZbWW3CHWMafRLYKPlMBtME/lVf
	VmYX6XQpADfc0/J8i+/5+2Bh2QNE0NXqU1xOFpMuo/1J8ZKIWQER6CMTKUSmuyu6OO5amFNKFZC
	LyXE5J6WuB3bGEPuVr173GDLzxI06R9Tk/BUoxftpJD3pSKz7G+aKc6IcCF3n1pUkmx/u0cP0xM
	tKZs1hiYhn4nN6w==
X-Google-Smtp-Source: AGHT+IGpwY2HlynOXnRP4DIhCuQV1jxENzaOQZyFI2o3PAOuKRx/27BVUUPS77/iVbqhqnndphBWqw==
X-Received: by 2002:a17:902:f693:b0:234:c549:da10 with SMTP id d9443c01a7336-23fb31e312emr126342235ad.47.1753646702809;
        Sun, 27 Jul 2025 13:05:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.05.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:05:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] glibc: stable 2.35 branch updates
Date: Sun, 27 Jul 2025 13:04:40 -0700
Message-ID: <2ea1d2d9bc6d173a8a586542d47a7f8a443d24c1.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220979

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on glibc-2.35 stable branch are updated.

git log --oneline d2febe7c407665c18cfea1930c65f41899ab3aa3..80401002011f470d9c6eb604bf734715e9b3a8c2
8040100201 Fix error reporting (false negatives) in SGID tests
c6ec750be5 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
c9e44b6467 support: Don't fail on fchown when spawning sgid processes
621c65ccf1 elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
c7ff2bc297 Revert "elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static"
8624f6431b elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
ed10034f00 elf: Test case for bug 32976 (CVE-2025-4802)
08aea7712d support: Add support_record_failure_barrier
901e24b128 support: Use const char * argument in support_capture_subprogram_self_sgid
bff3b0f16c elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static

Dropped :
0025-CVE-2025-4802.patch
ed10034f00 elf: Test case for bug 32976 (CVE-2025-4802)

Test results:

             Before    after    diff
PASS          4833      4839      +6
XPASS            6         6       0
FAIL           133       130      -3
XFAIL           16        16       0
UNSUPPORTED    200       197      -3

Following commits improved test results:

8040100201 Fix error reporting (false negatives) in SGID tests
Improved SGID test handling by unifying error reporting and using secure temporary directories.
Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
These changes reduced false negatives, increasing overall test pass rates.

8624f6431b elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
Fixed tst-dlopen-sgid false positives by correctly handling subprocess exit status (bug 32987).
Ensured test fails on abnormal or non-zero child exits.
This commit restores reliability in SGID testing and is the first step toward centralized SGID test error handling.

UNSUPPORTED tests changes
-UNSUPPORTED: elf/tst-env-setuid
-UNSUPPORTED: elf/tst-env-setuid-tunables
-UNSUPPORTED: stdlib/tst-secure-getenv

FAILed tests changes
-FAIL: elf/tst-dlopen-sgid
-FAIL: misc/tst-error1
-FAIL: resolv/tst-resolv-aliases

PASSed tests changes
+PASS: elf/tst-env-setuid
+PASS: elf/tst-env-setuid-tunables
+PASS: stdlib/tst-secure-getenv
+PASS: elf/tst-dlopen-sgid
+PASS: misc/tst-error1
+PASS: resolv/tst-resolv-aliases

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc              | 2 +-
 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch | 3 ++-
 meta/recipes-core/glibc/glibc_2.35.bb                  | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 34b199c02b..b269518af4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "d2febe7c407665c18cfea1930c65f41899ab3aa3"
+SRCREV_glibc ?= "80401002011f470d9c6eb604bf734715e9b3a8c2"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
index 0298f5a865..a1197c0318 100644
--- a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
@@ -81,7 +81,7 @@ index 09079c12..c2baed69 100644
 -		  NULL, NULL);
 -
 -  /* Remember the last search directory added at startup.  */
--  _dl_init_all_dirs = GL(dl_all_dirs);
+_dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;-  _dl_init_all_dirs = GL(dl_all_dirs);
 -
 -  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
 -
@@ -97,6 +97,7 @@ index 09079c12..c2baed69 100644
    if (__libc_enable_secure)
      {
        static const char unsecure_envvars[] =
+ setup_vdso_pointers ();
 @@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
  #endif
      }
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 3023e9c1ed..df5f14984a 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -27,6 +27,7 @@ CVE_CHECK_IGNORE += "CVE-2023-4527"
 CVE_CHECK_IGNORE += " \
     CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 \
     CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 \
+    CVE-2025-4802 \
 "
 
 DEPENDS += "gperf-native bison-native"
@@ -61,7 +62,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://0025-CVE-2025-4802.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
-- 
2.43.0


