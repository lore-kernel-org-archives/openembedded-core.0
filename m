Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F62CF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.45601.1727661491865044752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xHw8oH3f;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e0aded661bso2659931a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661491; x=1728266291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro4d7ym1DapVNNfaZMVZ5LNO0EVNACqoD5C45KIRbng=;
        b=xHw8oH3fjYWHucaf/AcqA4lRUUl94V4OX3jelyOAomRPn05Ksogbua4g4O+kHQ18tG
         YX50jjl47Tpn0KtZkzwpWYsOH2HQBGITKMYin0UC7NBydH3Ha0769IDZl11GgByUCnwT
         oYhzvpcdrmE15ped6eyBvC1fm6Sj46LM+Sc6r5oCZhlTiIKmtLwOBL32Y6olSlh0JCbI
         URK7AdYK/wh1MRLnYHv+mUjAA6CmxCdnIo/1c3sf87o+6o7wTQVUXXLARcvQmIaUu9yx
         zWGCCeSk6srF5HHlvWrQ07Ek5WsShjKNdfQlcsRPAOGrEnLDiXahZxNNhv1gE8cFoVxh
         1aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661491; x=1728266291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro4d7ym1DapVNNfaZMVZ5LNO0EVNACqoD5C45KIRbng=;
        b=IPoLF4OHvjB3c9d0jmK6LHgOc4dPgarTcUr/NOkBapKwHC7i7byjAzVjvTrO4kNQpn
         HhZomjUSUrpB/DphZQX4JqeiUL4rZWEPBdCTruM5KD6Hw9UKWcTzCcdEtCNsinhO8/C3
         lMNSPpzh+GEGQLJ/tX+hBCA1wM6rw3oZ8Q9gdxrsMIexO2238GlAav35+8LEKFVRudhE
         ODb8LzhgsOzBkwyb1ZaXMwbNUJ/V4HaNwpDbMpxtBquy8CeUxN0WVVtv9AzQKg7mWtsx
         Q2BUErQtwJFYmVIMaJGCfyaHXlq2Nb+iY1OhAjLwBa1F5J8fI1/g21GNEejVH9Y12ds1
         NoGA==
X-Gm-Message-State: AOJu0YzVzJKTQyXwk/khFvKjwS+CCw/0jMXmqUCpWABHAGmYp8e7eVbl
	TWe74aDmiG3PXjtVbQe9kLHeyoNVGO0bea3/kgNYmglRaFVAZrvdgjQPxO+5cuqewEGlfDvqoF4
	5AZQ=
X-Google-Smtp-Source: AGHT+IEN8jw7DO6PcqTY/9o/Y+XmCAtZl7fYpm9UNZZdQm1vLgT5Wk3g9pYqefn56gIu50sXB/boFw==
X-Received: by 2002:a17:90b:1082:b0:2ca:2c4b:476 with SMTP id 98e67ed59e1d1-2e0b89e344amr12810730a91.10.1727661491092;
        Sun, 29 Sep 2024 18:58:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/27] rpm: fix expansion of %_libdir in macros
Date: Sun, 29 Sep 2024 18:57:20 -0700
Message-Id: <7c7f95668d270a825c7d3d235ec2b8d4e7eb0b9f.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205087

From: Yi Zhao <yi.zhao@eng.windriver.com>

There is a patch in oe-core[1] to avoid hardcoded paths in macros. It
tries to use libdir to expand %_libdir in macros.in. However, in
upstream commit[2], libdir for macros in CMakeLists.txt is set to
${prefix}/=LIB=, which causes %_libdir to expand to ${prefix}/=LIB=
instead of the correct path in the final macros.

On target:
$ rpm --showrc | grep _libdir
[snip]
-13: _libdir    ${prefix}/=LIB=
[snip]

This also causes %__pkgconfig_path in fileattrs/pkgconfig.attr to become
an invalid regular expression when building rpm packages. This results a
warning in log.do_package_write_rpm in all packages:

Warning: Ignoring invalid regular expression ^((${prefix}/=LIB=|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$

Set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} instead of ${prefix}/=LIB= to
make sure it is expanded to the correct path in macros.

After the patch:
On target:
$ rpm --showrc | grep _libdir
[snip]
-13: _libdir    /usr/lib
[snip]

[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
[2] https://github.com/rpm-software-management/rpm/commit/d2abb7a48760418aacd7f17c8b64e39c25ca50c9

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ae0e217145f45d065124aeb0a7d72a0c25f621ef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch | 53 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.19.1.1.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
new file mode 100644
index 0000000000..1bd83e7bef
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
@@ -0,0 +1,53 @@
+From fea9cea49aa0844de14126e54d05b91ba619427f Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 26 Jul 2024 17:18:30 +0800
+Subject: [PATCH] CMakeLists.txt: set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} in
+ macros
+
+There is a patch in oe-core[1] to avoid hardcoded paths in macros. It
+tries to use libdir to expand %_libdir in macros.in. However, in
+upstream commit[2], libdir for macros in CMakeLists.txt is set to
+${prefix}/=LIB=, which causes %_libdir to expand to ${prefix}/=LIB=
+instead of the correct path in the final macros.
+
+On target:
+$ rpm --showrc | grep _libdir
+[snip]
+-13: _libdir    ${prefix}/=LIB=
+[snip]
+
+This also causes %__pkgconfig_path in fileattrs/pkgconfig.attr to become
+an invalid regular expression when building rpm packages. This results a
+warning in log.do_package_write_rpm in all packages:
+
+Warning: Ignoring invalid regular expression ^((${prefix}/=LIB=|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$
+
+Set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} instead of ${prefix}/=LIB= to
+make sure it is expanded to the correct path in macros.
+
+[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+[2] https://github.com/rpm-software-management/rpm/commit/d2abb7a48760418aacd7f17c8b64e39c25ca50c9
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ed847c09a1..385b5040c6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -84,7 +84,7 @@ function(makemacros)
+ 	set(sysconfdir "${CMAKE_INSTALL_FULL_SYSCONFDIR}")
+ 	set(sharedstatedir "${CMAKE_INSTALL_FULL_SHAREDSTATEDIR}")
+ 	set(localstatedir "${CMAKE_INSTALL_FULL_LOCALSTATEDIR}")
+-	set(libdir "\${prefix}/=LIB=")
++	set(libdir "${CMAKE_INSTALL_FULL_LIBDIR}")
+ 	set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
+ 	set(oldincludedir "${CMAKE_INSTALL_FULL_OLDINCLUDEDIR}")
+ 	set(infodir "\${prefix}/${CMAKE_INSTALL_INFODIR}")
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
index 0802f26295..9330323797 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.19.x;protoc
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
+           file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
            "
 
 PE = "1"
-- 
2.34.1


