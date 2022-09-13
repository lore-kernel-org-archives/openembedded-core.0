Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC9DC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:30 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.5276.1663078700685426541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qAQQwrvc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d82so11892072pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=TIwC8s6hSovcoczmtLwdjXevcATp821BSacZEnE25p0=;
        b=qAQQwrvceZuNbTleyKqFMgfijt8hFirk0dp4I/zHWDbTMIceMIRnDR58SlBfAuOdFY
         MseA4gg+jGugO0if159/Vp9L1E4tgFY/NOcwGxD5cU1r62PYIVk8Cd7932KJbqN7vLoR
         v4r13LVmN9V79tAoBHulVS0EbL/G64urXdtqFjpWfSSaw2juVXL8Bd6j5wRuwJZes3HQ
         7IeBXEqwsEXB7FJrE7/I1x4juA6DuAxRuK7aDFsbHt3DXLhaRogoXH+VXITxTpQTQ4gA
         KbeoYsou21rjJHVR6nwGF3NfiRFDiSCjJwK9tc4+kaSxTq+Ou7ifSebI13Xjt9FzTBtk
         8VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TIwC8s6hSovcoczmtLwdjXevcATp821BSacZEnE25p0=;
        b=azPnH3JJJGOW7kU7rbtrvvvMKucR1cIn+csFaLLy+Co/FXGPmizJPl9AQTmZRnAmGA
         vQupQbAT0mh2kWokzHWHMuZ/S6Bp0r3Z3OzTXomW84oJq58I4fI2blvNpIkLD7M2v7iV
         mgPTKosE6ImHzBKGRIHROshrGl/hAI0s63cW4ReQubakUvJK4ugHCVnqm/Ag2NCkVZq/
         /Mr4rT34X2UP78l5bhYSztlcCrZPGdY5NO3YYN+lPXlzuPHcZO/HBGE+97nFXUfuDcY0
         SvxnpADn6gPmFI/E/esciFCDP6pO4xX3PHmqVGz+5AFL91QAv2/uXO+e84Vz2jQaPg8E
         JqBQ==
X-Gm-Message-State: ACgBeo3gNvzMuAV+B4QSrTkGQhWp4+Fuclvig/yVfU7JBEN6jqPwHUDg
	KxOSEbPAbAU7Gd5g/b6nhNckAIFdpO1dlZbZ
X-Google-Smtp-Source: 
 AA6agR7QsU1gZSZYLJVnenCicNENxW7nH4lh4wLuWXZWap3+YEKqQTjSzzsKurDTrkr0dvM8YGWMQg==
X-Received: by 2002:a63:231c:0:b0:434:9c3b:546e with SMTP id
 j28-20020a63231c000000b004349c3b546emr28614512pgj.593.1663078699544;
        Tue, 13 Sep 2022 07:18:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] ruby: drop capstone support
Date: Tue, 13 Sep 2022 04:17:44 -1000
Message-Id: 
 <fe8e54576e97ef7c4845889f3e8bb53f524c0611.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170582

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Upstream dropped capstone support and this also causing us
reproducibility issues.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d2496a904a7099ef0de818180820ad7b40843a08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-Remove-dependency-on-libcapstone.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.2.bb      |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch b/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
new file mode 100644
index 0000000000..5d0f8fcc09
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
@@ -0,0 +1,36 @@
+From 222203297966f312109e8eaa2520f2cf2f59c09d Mon Sep 17 00:00:00 2001
+From: Alan Wu <XrXr@users.noreply.github.com>
+Date: Thu, 31 Mar 2022 17:26:28 -0400
+Subject: [PATCH] Remove dependency on libcapstone
+
+We have received reports of build failures due to this configuration
+check modifying compile flags. Since only YJIT devs use this library
+we can remove it to make Ruby easier to build for users.
+
+See: https://github.com/rbenv/ruby-build/discussions/1933
+
+Upstream-Status: Backport
+---
+ configure.ac | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+Index: ruby-3.1.2/configure.ac
+===================================================================
+--- ruby-3.1.2.orig/configure.ac
++++ ruby-3.1.2/configure.ac
+@@ -1244,15 +1244,6 @@ AC_CHECK_LIB(dl, dlopen)	# Dynamic linki
+ AC_CHECK_LIB(dld, shl_load)	# Dynamic linking for HP-UX
+ AC_CHECK_LIB(socket, shutdown)  # SunOS/Solaris
+ 
+-if pkg-config --exists capstone; then
+-   CAPSTONE_CFLAGS=`pkg-config --cflags capstone`
+-   CAPSTONE_LIB_L=`pkg-config --libs-only-L capstone`
+-   LDFLAGS="$LDFLAGS $CAPSTONE_LIB_L"
+-   CFLAGS="$CFLAGS $CAPSTONE_CFLAGS"
+-fi
+-
+-AC_CHECK_LIB(capstone, cs_open) # Capstone disassembler for debugging YJIT
+-
+ dnl Checks for header files.
+ AC_HEADER_DIRENT
+ dnl AC_HEADER_STDC has been checked in AC_USE_SYSTEM_EXTENSIONS
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.2.bb b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
index 6fc1f53b18..387bfa9b44 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.2.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://0001-Remove-dependency-on-libcapstone.patch \
            "
 
 SRC_URI[sha256sum] = "61843112389f02b735428b53bb64cf988ad9fb81858b8248e22e57336f24a83e"
@@ -25,7 +26,6 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 # rdoc is off by default due to non-reproducibility reported in
 # https://bugs.ruby-lang.org/issues/18456
 PACKAGECONFIG[rdoc] = "--enable-install-rdoc,--disable-install-rdoc,"
-PACKAGECONFIG[capstone] = "--with-capstone=yes, --with-capstone=no"
 
 EXTRA_OECONF = "\
     --disable-versioned-paths \
-- 
2.25.1


