Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97469C44506
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88741.1783067402641202967
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SD58Rf50;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso311938f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067401; x=1783672201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmjodCcss52XDz0Xw7dLja5Yd1qxUXj94hkvEqHcTMI=;
        b=SD58Rf506kgb+GSWoeGxmYtjMr2N/QH/9V47q8+cmKHFfAqplr0/EIIVNl4zHEr+sK
         xh9h7C6j7hOd01FlQOQJ85ZkaOw4+yYvnERZxvv/N6uF31Fy0yi6EiEAsvAe6jX/CCgp
         0NK8D3veAsAp0AhZb43qpnm9ICteYEIczh/io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067401; x=1783672201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmjodCcss52XDz0Xw7dLja5Yd1qxUXj94hkvEqHcTMI=;
        b=CdNDzCG1pUK+snQVf4pg5mc/nLan3qw5AFL1zusFoT5P9XomwR7BxAR2dI5hK6PbEm
         808KRbbKiT9jw2REU+U6rB8/BXWQPG3R+oe3JOFb0Ldpo6ory8RIisXILY5ZmP/vU7We
         Khh/4rnlajf8zO0RXbknahOTRseRz7/LU1uyqsfLu7D4TotbqR928KOKXL35cc10vIsx
         PrReF3MBn3/tu/oSzoHpUJhkmI3MVRvFrkn7Ywjy1XjcANjUhsOwuLwN5IYj0WPByXNr
         v0eXRSDoraM/GQxKgWqwvYlscoktBfpnls65ROWYziMqCcnnroFSfhAPUjweSvcAgG/F
         PVww==
X-Gm-Message-State: AOJu0Yy+7TSb0hHTfqVCAuwjBzwis4pDYYGeIRR7mUeG6cU4UecqQquH
	dhL7Ut5BGMNGXAThkc0M2Xebe8qwbLKKzMGi90DN/y58nL/ESwBSJqI8TMb9nFceWIxeBqdg0Lj
	dcPVjkjk=
X-Gm-Gg: AfdE7cn/FWuTh2krk8zOugJ+4rMx5WAyUrnc/XZiJE/dI6fq9Xwjmw85srBNaFmpZLu
	dNeEn8vlhhqdC5ciZrZNOnTfzH6Ibo24aQw9xazphobafaK4g0U4jEdn+b1cazBh5tI934NbVyW
	xyohp4rEqReR89X+IpbwMiUTZyrANGNkgfRxgB9RiMKNu0zAzt4JtgcLir1HGwTlettI/eNX5Bs
	FDPxXjL078xE+ljrJGUJ3KuIw87uuSlPog7FPLcd77giSnZNDrG6BqX7dIAc3FNNEyjCrgY7Gr9
	E/voaDs+6lbXw/ht7sGAelVF+eYW8ITFBsDS3R4mmxGXc7Dg210X1z9lGJBGExPSNmBwV7baB6W
	o9h1JGjf47Ct22ZwlNRs6+0VQOdnr3IJvdQPkSF4rVO+e6E/7Gqh7OrcmaHUvyKaTYwjhLKWduH
	4ohOEl4zkx7XUS6KV2j7e7kjwOwAaVVQ+xiVnjJZRKdw==
X-Received: by 2002:a05:6000:469b:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-47758327af3mr10543903f8f.16.1783067400767;
        Fri, 03 Jul 2026 01:30:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.29.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:29:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/15] jansson: upgrade 2.15.0 -> 2.15.1
Date: Fri,  3 Jul 2026 09:29:44 +0100
Message-ID: <20260703082955.1585712-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240086

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...se-default-symver-when-the-linker-su.patch | 45 -------------------
 .../{jansson_2.15.0.bb => jansson_2.15.1.bb}  |  6 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
 rename meta/recipes-extended/jansson/{jansson_2.15.0.bb => jansson_2.15.1.bb} (69%)

diff --git a/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch b/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
deleted file mode 100644
index eb0c459f68d..00000000000
--- a/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7c44ab421c725ea6fed358f435c5461c0096f852 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 Jun 2026 14:04:19 -0700
-Subject: [PATCH] configure: only use --default-symver when the linker supports
- it
-
-jansson enables symbol versioning on glibc by passing
--Wl,--default-symver to the linker. This is a GNU ld option which is
-not understood by every linker, e.g. ld.lld errors out with:
-
-  ld.lld: error: unknown argument '--default-symver'
-
-Probe the linker with a link test before adding the flag so the build
-works with both GNU ld and lld. When the linker does not accept the
-option the symbol versioning provided by the explicit version script
-is still applied; only the implicit default version is dropped.
-
-Upstream-Status: Submitted [https://github.com/akheron/jansson/pull/744]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e5c126a..1bb8b34 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -135,7 +135,16 @@ AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
-
- # Enable symbol versioning on GNU libc
- JSON_SYMVER_LDFLAGS=
--AC_CHECK_DECL([__GLIBC__], [JSON_SYMVER_LDFLAGS=-Wl,--default-symver])
-+AC_CHECK_DECL([__GLIBC__], [
-+    saved_LDFLAGS="$LDFLAGS"
-+    LDFLAGS="$LDFLAGS -Wl,--default-symver"
-+    AC_MSG_CHECKING([whether the linker accepts -Wl,--default-symver])
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
-+        [AC_MSG_RESULT([yes])
-+         JSON_SYMVER_LDFLAGS=-Wl,--default-symver],
-+        [AC_MSG_RESULT([no])])
-+    LDFLAGS="$saved_LDFLAGS"
-+])
- AC_SUBST([JSON_SYMVER_LDFLAGS])
-
- AC_ARG_ENABLE([dtoa],
diff --git a/meta/recipes-extended/jansson/jansson_2.15.0.bb b/meta/recipes-extended/jansson/jansson_2.15.1.bb
similarity index 69%
rename from meta/recipes-extended/jansson/jansson_2.15.0.bb
rename to meta/recipes-extended/jansson/jansson_2.15.1.bb
index 1a0b6f24acf..60bbc5ba6dd 100644
--- a/meta/recipes-extended/jansson/jansson_2.15.0.bb
+++ b/meta/recipes-extended/jansson/jansson_2.15.1.bb
@@ -5,11 +5,9 @@ LICENSE = "MIT & dtoa"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
 
 GITHUB_BASE_URI = "https://github.com/akheron/jansson/releases"
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-configure-only-use-default-symver-when-the-linker-su.patch \
-		  "
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "070a629590723228dc3b744ae90e965a569efb9c535b3309b52e80e75d8eb3be"
+SRC_URI[sha256sum] = "0c7114dc0b2d22a670724a1f95922029d7077c19dbf79a584cb8084d2f267f2f"
 
 inherit autotools pkgconfig github-releases
 

