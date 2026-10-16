Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F417CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 09:03:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17311.1792141435151363814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 02:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HbjctjOd;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-487049569b6so4290564f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792141433; x=1792746233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Yv+C5VzCrYAs/FJefAw1Hm2v+E3SHtHM/pzL2TF6Qc=;
        b=HbjctjOd3MlqoNmcbokH5Zeoh201rbTl2/t+KR+lpI9asoyWtdUR/2QJ+zJKu+jOVQ
         8GMDj96xIwsoY18xOcxQ69o+Hgo2S5s6pV54vKH46G1gK4875Eys2ocA56G7M6KhK3xm
         W2J3EsDQAzbFB9n90hfl0qnM7ns3YkZDVo5TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141433; x=1792746233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Yv+C5VzCrYAs/FJefAw1Hm2v+E3SHtHM/pzL2TF6Qc=;
        b=tbUygRYz/K1QuZyHCPKCqTMUQn9cGCmVV70Tz2EmqQK2UV8m8STd5BNgAp1VbwZ1u6
         17DxGeTtHUic6X6eMopb9bBmGV5PUZnlAQiE1gPyQqT0rQBXfg4EJzGryKcwpjxkwZ71
         rRwJ3z6mh6GMjblCjOVom+SbLFxBUukc/vzMpDQlV68EfhGZbh5dr/MwogoZpaTs8yqN
         lxz0oExa9GVPhv9/GRJ8o4YRRlqNb8qS2pZIveAX0yYtgJpRcv8dqyDUmyv5Xd8kHHi2
         B9UK/GoJD8Uli17lmBesLgpjrrOFEhJ9cu95LBARhJf61ns1LrclKV0HN/60ATGC4oEg
         yt0A==
X-Gm-Message-State: AFq9FYKsY34dnSDpxxR6WaoWoNK83143PHHoOCgRpeyqyWFzekkJSSmu
	TIkygs19oAbEJ8JpbyzYFFBvwP/6mm48HoeDPndDG8S9XgqCEG9NXt8P5EUGQeMkeqQW8hbVhwa
	WBjNd
X-Gm-Gg: AYBFou08y77E8bbIlYq8LFZKblqz8dNn0M/H+szUPYtzGx8EoKujDN1pVCz5Nw5WREW
	TzmOnHTKkhHakGz4hSZzdLo9bASqXBivYiKR21U48krpAz6GgEdAbpJyC5fVPnY7JBEiY6jiOoW
	SSfN3Y2CAOR10UXb+YO4ygdjlWMVrNr3NS48mUmd9bOr2FQgYVBqvLvZbdiNCbgVS4A+HPAlH3t
	ojxG73xVvietbMVPkaiTY2XZdM70CeaCU5RQgFjrG09W/aT+1WwR/hY1AesfCX/48RW8PoyGOe0
	fEaq15HLHwVAHqJGjuBmM27Y9tSu8cCOpN6oiE9oNuqR3HyC+02acp3Q1xV7WtyXPjfbDE6kYVy
	sahWDvTHh5UhJcd8cA0mJ4IENPQqU6Fa98M7gDce4yEh64Vr6uJsj8nFVV7jmG9EPY/ytH2MEBx
	fGdjtjIrmEOSuRraTxXULlVj9wIqclZ9Pf4DR6MQ5Xt1sN9rhvWXt1xJF85ZYBCdMjRJcrJ1SJ/
	UA70qqDp4qq/7z0D8Tcj2eovCAGqhuBgX9iTrREvOSWxcIlvo+pqw/NYARWvsUSfHnpxW7xxUYB
	CTHbriJ8mWWIh7a5VLRMn30=
X-Received: by 2002:a05:6000:d87:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48dbace8790mr29339729f8f.43.1792141433056;
        Fri, 16 Oct 2026 02:03:53 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm3966966f8f.31.2026.10.16.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:03:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] ghostscript: Upgrade 10.07.1 -> 10.08.0
Date: Fri, 16 Oct 2026 12:03:49 +0300
Message-ID: <20261016090349.3254615-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248005

Upgrade to release 10.08.0:

- This release addresses a number of potential security issues.
- The wider adoption of "C99" and later features has reached the
  point where we must ease our policy on this area. The
  Ghostscript/GhostPDL codebase will remain "C89" plus widely
  supported extensions but, as of the 10.08.0 release, our included
  third party libraries will be permitted to use "C99" and
  potentially later features.
- The 10.08.0 release removes a number of old, unmaintained and (at
  the time of this release) untestable and thus unmaintainable
  devices from the default builds, as a precursor to removal of the
  device sources in the next release.
- The usual round of bug fixes, compatibility changes, and
  incremental improvements.

Drop out-of-tree.patch because it was a backported patch that has
been included in this release with commit 8c71024:
Bug 709459: Fix out of tree cross compile builds

Drop 0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
because it has been fixed in the upstream with commit b0d1a49:
Bug 709589: Fix clang/C23 build failure

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ace-static-const-double-with-macros-.patch | 33 ----------------
 .../ghostscript/ghostscript/out-of-tree.patch | 39 -------------------
 ...ript_10.07.1.bb => ghostscript_10.08.0.bb} |  4 +-
 3 files changed, 1 insertion(+), 75 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.07.1.bb => ghostscript_10.08.0.bb} (93%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
deleted file mode 100644
index 6f310abf2e..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0298799777bd179c455e5ce8d6008b2d84732967 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Tue, 7 Apr 2026 22:40:26 -0700
-Subject: [PATCH] psi/ztype.c: replace static const double with macros for
- min/max int bounds
-
-Clang rejects floating-point arithmetic in static initializers when it
-cannot evaluate them as constant expressions at compile time. Replace
-min_int_real and max_int_real with #define macros so the arithmetic is
-evaluated at each call site, fixing the build without any semantic change.
-
-Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=709309]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- psi/ztype.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/psi/ztype.c b/psi/ztype.c
-index a01d83f..d454778 100644
---- a/psi/ztype.c
-+++ b/psi/ztype.c
-@@ -53,8 +53,9 @@ static int convert_to_string(const gs_memory_t *mem, os_ptr, os_ptr);
-  */
- #define ALT_MIN_INT (((ps_int)-1) << ((sizeof(ps_int) * 8) - 1))
- #define ALT_MAX_INT (~(ALT_MIN_INT))
--static const double min_int_real = (ALT_MIN_INT * 1.0 - 1);
--static const double max_int_real = (ALT_MAX_INT * 1.0 + 1);
-+
-+#define min_int_real ((double)(ALT_MIN_INT) - 1.0)
-+#define max_int_real ((double)(ALT_MAX_INT) + 1.0)
-
- #define REAL_CAN_BE_INT(v)\
-   ((v) > min_int_real && (v) < max_int_real)
diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
deleted file mode 100644
index a0360fed43..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8c71024e8b9dae1b691ad96eb5af39840fb73a99 Mon Sep 17 00:00:00 2001
-From: Chris Liddell <chris.liddell@artifex.com>
-Date: Tue, 4 Aug 2026 09:30:31 +0100
-Subject: Bug 709459: Fix out of tree cross compile builds
-
-Fix path/file name for the configure generated arch.h.
-
-Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=8c71024e]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b25aaab1a..fe79c416e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -45,8 +45,8 @@ fi
- THEMAKEFILE="${MAKEFILE:-Makefile}"
- AUXFLAGS_MAK=auxflags.mak
- 
--ARCH_AUTOCONF_HEADER=arch-config/arch_autoconf.h
--ARCH_AUTOCONF_HEADER_PROTO=arch/arch_autoconf.h.in
-+ARCH_AUTOCONF_HEADER=./arch-config/arch_autoconf.h
-+ARCH_AUTOCONF_HEADER_PROTO=$srcdir/arch/arch_autoconf.h.in
- 
- dnl --------------------------------------------------
- dnl Local utilities
-@@ -400,7 +400,7 @@ if test x"$with_arch_h" = x""; then
-           *)
-             ARCH_CONF_HEADER=
-             if test x"$host" != x"$build"; then
--              ARCH_CONF_HEADER="\$(GLSRCDIR)/../$ARCH_AUTOCONF_HEADER"
-+              ARCH_CONF_HEADER="$ARCH_AUTOCONF_HEADER"
-             else
-               ARCH_CONF_HEADER=
-             fi
--- 
-cgit v1.2.3
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.08.0.bb
similarity index 93%
rename from meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.08.0.bb
index 3254872036..ccbcc347f7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.08.0.bb
@@ -24,11 +24,9 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://out-of-tree.patch \
-           file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch \
            "
 
-SRC_URI[sha256sum] = "2fc74362f9be6fae1b0a65d38fdcfd4f0b518cc3b07c5581fb661eb4d2e15251"
+SRC_URI[sha256sum] = "caf199e3f233f1290b27d0972d636f66c303355f2353309b7bfddf1edda06b3d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.47.3


