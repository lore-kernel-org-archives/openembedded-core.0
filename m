Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55E6E748EE
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:01:05 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.62442.1696176056297405567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qoq7cHuB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c3f97f2239so142065375ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176055; x=1696780855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glaTlnF4jnaoZjzXVN6AOjjGtxRT+eaYScavwkTlnpg=;
        b=Qoq7cHuB2N3cX1ctZZ751MGECnIsURFcdbI2Te+gKKsIANxRBwW0fNnpyhagM74zJZ
         zblTNxGluEFWrexCSA1mYxdDkZVtB0DESJd1BHzAE6ORVRAdbk7wtNCBcYQA2p2MeUCe
         IPtv+KLvCt9rDj9W/PS7GYFOeLwg2ERczT8wVCxror4am3PRPW9iNh4EX+PidBvIkPm2
         0wpl6KskaavID6uN5tEU34MzdyQ8VnAE8vYG/MQYegVi7dZNpPmdWwoPnT9ldVDts3iy
         sNfd66miX42MX8MzQbtzuvXHdncvKO86Ga41cu451W+Nfo6vd0cZjzhDdCD9N3BtZk8h
         c0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176055; x=1696780855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glaTlnF4jnaoZjzXVN6AOjjGtxRT+eaYScavwkTlnpg=;
        b=HMChp5t5RQCmxIstJrx3Ijxis4EWLYOIfO/zmy4aMRQfQSO9mOgrmYSgrN6PEHMtBe
         4lr8GYb7bD4oI/PZJc1TS74BptHJuHsYXQwm+McWI31eoo9KUWYu83W9FLSTNC/fMCSL
         gGpU4BAIdVCSHFN7CznpUvbuAYOnJZqJT6ttgjzypC9dfgTN3Y14sn7ximSNjxyIcH0C
         5TovPqFIHsPUGxsjJK/kgLZzB/R/vOEvtVd1P7EwpJsZhqXIVGAAmMFjo+oMkSO6V/CR
         rhgAPyv4BbrDvMZjZ0rJfHwg3qLmziwRZJWKobmWiktrSQtlx593fK4MN+aN3OiI20Ck
         oKlg==
X-Gm-Message-State: AOJu0YwCtRsYaW8gF3d7rqW+QZi5mqldruzeZhsbnTfO0ZukcCWYvChS
	M43paCJd9Q/NYH8b8kmqv5Ma7dDeL6O9+aq2VIxjig==
X-Google-Smtp-Source: AGHT+IFybjlYLi+2RTiq1aUrN0sf9L3ibFxweAeDnPLhv/w97GpNUlANE+fZXWacrUAYkbLxeOifwA==
X-Received: by 2002:a17:902:f7c4:b0:1b8:90bd:d157 with SMTP id h4-20020a170902f7c400b001b890bdd157mr9418688plw.26.1696176055237;
        Sun, 01 Oct 2023 09:00:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/23] inetutils: don't guess target paths
Date: Sun,  1 Oct 2023 06:00:07 -1000
Message-Id: <86b88aaec534c3da74de6127198c57521977bd10.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188509

From: Ross Burton <ross.burton@arm.com>

inetutils guesses a lot of target paths in cross builds, and warns that
some of them are known to be wrong (for example, whether /proc/net/dev
exists is guessed as 'no').

Add a post-configure function to check for these warnings, and pass
--with-path-* as appropriate to set the paths explicitly.

This means we can remove the patch which was setting PATH_PROCNET_DEV,
and the autoconf cache value inetutils_cv_path_login.

The downside is that these --with-path-* options are not real autoconf
options, so the "unknown options" warning is emitted.  Losing those is
an acceptable compromise, so disable it.

Musl doesn't implement utmp and has stub defines for _PATH_UTMP but not
_PATH_UTMPX, so we need to set the X variants explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91179f89db127063dbdf998e15d63e04d6be53f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../inetutils-1.9-PATH_PROCNET_DEV.patch      | 37 -------------------
 .../inetutils/inetutils_2.4.bb                | 21 +++++++++--
 2 files changed, 18 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
deleted file mode 100644
index 460ddf9830..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 101130f422dd5c01a1459645d7b2a5b8d19720ab Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Wed, 6 Mar 2019 09:36:11 -0500
-Subject: [PATCH] inetutils: define PATH_PROCNET_DEV if not already defined
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this prevents the following compilation error :
-system/linux.c:401:15: error: 'PATH_PROCNET_DEV' undeclared (first use in this function)
-
-this patch comes from :
- http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/
-
-Upstream-Status: Inappropriate [not author]
-
-Signed-of-by: Eric Bénard <eric@eukrea.com>
-
----
- ifconfig/system/linux.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ifconfig/system/linux.c b/ifconfig/system/linux.c
-index e453b46..4268ca9 100644
---- a/ifconfig/system/linux.c
-+++ b/ifconfig/system/linux.c
-@@ -53,6 +53,10 @@
- #include "../ifconfig.h"
- 
- 
-+#ifndef PATH_PROCNET_DEV
-+  #define PATH_PROCNET_DEV "/proc/net/dev"
-+#endif
-+
- /* ARPHRD stuff.  */
- 
- static void
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
index 032c0d6b24..d3d65e1469 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -19,7 +19,6 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://rsh.xinetd.inetutils \
            file://telnet.xinetd.inetutils \
            file://tftpd.xinetd.inetutils \
-           file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
            file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
@@ -42,15 +41,31 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6 gl_cv_socket_ipv6=no,"
 PACKAGECONFIG[ping6] = "--enable-ping6,--disable-ping6,"
 
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
-        inetutils_cv_path_login=${base_bindir}/login \
         --with-libreadline-prefix=${STAGING_LIBDIR} \
         --enable-rpath=no \
-"
+        --with-path-login=${base_bindir}/login \
+        --with-path-cp=${base_bindir}/cp \
+        --with-path-uucico=${libexecdir}/uuico \
+        --with-path-procnet-dev=/proc/net/dev \
+        "
+
+EXTRA_OECONF:append:libc-musl = " --with-path-utmpx=/dev/null/utmpx --with-path-wtmpx=/dev/null/wtmpx"
 
 # These are horrible for security, disable them
 EXTRA_OECONF:append = " --disable-rsh --disable-rshd --disable-rcp \
         --disable-rlogin --disable-rlogind --disable-rexec --disable-rexecd"
 
+# The configure script guesses many paths in cross builds, check for this happening
+do_configure_cross_check() {
+    if grep "may be incorrect because of cross-compilation" ${B}/config.log; then
+        bberror Default path values used, these must be set explicitly
+    fi
+}
+do_configure[postfuncs] += "do_configure_cross_check"
+
+# The --with-path options are not actually options, so this check needs to be silenced
+ERROR_QA:remove = "unknown-configure-option"
+
 do_configure:prepend () {
     export HELP2MAN='true'
     cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
-- 
2.34.1


