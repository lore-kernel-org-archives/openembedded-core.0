Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC7EC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:20:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.27091.1656606048726055222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HTIr5Zyc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id k7so3582323wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdzWXpKWrMIV6eVLmwwa6bn8g/0xy0hHIya/Oty+yIY=;
        b=HTIr5ZycwUfeLcq3YN6A51bF4+qOmVIJ6TViSclJwdySPXQWjddVh7jX6bNRFdjEFw
         qhQ/dxESlJmDL0rDasgHbF/i0M/hEGYc35a3NW/JwC08w0QzMJ8Oh1hosrKTVzMYTMPc
         q/xPFDhpQzk+3Hf/yAfx3zqceSTSWVpTEY/gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdzWXpKWrMIV6eVLmwwa6bn8g/0xy0hHIya/Oty+yIY=;
        b=KCFa+UoaZbZcuG4BN9lXiB7Yj2kutezPFCRDOqXH2XFzWw5H0s1wpStnRSec8Npc6Q
         QQtnxir3g6dLPjpvdjW4ZNuIylPXnK2oZu0lizjQDI1LT37KhKVyJ93mvsX2PIwWI3a0
         6GKMcovC+rYLaQO1r8Lgaab0OitBMfaQd28R7cqNF3tgUS3e9EpEHt/wNKcu6S6RCWl+
         7aXil5qKRLCZ040NpYGP5h4P62QYIYeGy07fgbyG2XgyRlVOzSRHw+uDQj6+UeoLeF5+
         RD8qtz+GOOa7mqI6JT7cK7LPcpS9NPSXW8Uq9/aL0u/CE+dSJUmoVCBSYJzToj9VRXk9
         MGCw==
X-Gm-Message-State: AJIora8puQcd1MwW0ZeNEPDpfWBYiz5OKCpZhzYrY4MeKskLI1OzC98u
	54NJbldDlxY+zqvnWdsS6urgbBvx/l0FTw==
X-Google-Smtp-Source: 
 AGRyM1tA7sKDDZMPNge5CLlR3YWlx++BTi99Z94hzP0T6SKU7nI9pRnrxQT4ctA4qLhZD3VjuSN25A==
X-Received: by 2002:a05:6000:10b:b0:21b:88ca:9abf with SMTP id
 o11-20020a056000010b00b0021b88ca9abfmr9274388wrx.694.1656606046677;
        Thu, 30 Jun 2022 09:20:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f06b:8b84:2b52:384a])
        by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b0020e5b4ebaecsm19890408wrt.4.2022.06.30.09.20.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:20:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Upgrade 3.0.3 -> 3.0.4
Date: Thu, 30 Jun 2022 17:20:44 +0100
Message-Id: <20220630162044.671912-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:20:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167415

Includes a fix for CVE-2022-2068.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-Configure-do-not-tweak-mips-cflags.patch | 10 +++++-----
 ...sysroot-and-debug-prefix-map-from-co.patch | 20 +++++++++----------
 .../openssl/openssl/afalg.patch               | 10 +++++-----
 .../{openssl_3.0.3.bb => openssl_3.0.4.bb}    |  3 +--
 4 files changed, 21 insertions(+), 22 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.3.bb => openssl_3.0.4.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 5effa6c6f61..0b7abc3a112 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  Configure | 10 ----------
  1 file changed, 10 deletions(-)
 
-diff --git a/Configure b/Configure
-index 821e680..0387a74 100755
---- a/Configure
-+++ b/Configure
-@@ -1422,16 +1422,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+Index: openssl-3.0.4/Configure
+===================================================================
+--- openssl-3.0.4.orig/Configure
++++ openssl-3.0.4/Configure
+@@ -1423,16 +1423,6 @@ if ($target =~ /^mingw/ && `$config{CC}
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 60890c666d1..bafdbaa46fc 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -34,11 +34,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  crypto/build.info                 |  2 +-
  2 files changed, 12 insertions(+), 2 deletions(-)
 
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index f88a70f..528cdef 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -471,13 +471,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
+===================================================================
+--- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
++++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
+@@ -472,13 +472,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
@@ -63,10 +63,10 @@ index f88a70f..528cdef 100644
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-diff --git a/crypto/build.info b/crypto/build.info
-index efca6cc..eda433e 100644
---- a/crypto/build.info
-+++ b/crypto/build.info
+Index: openssl-3.0.4/crypto/build.info
+===================================================================
+--- openssl-3.0.4.orig/crypto/build.info
++++ openssl-3.0.4/crypto/build.info
 @@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
@@ -74,5 +74,5 @@ index efca6cc..eda433e 100644
 -GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
 +GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC_Q) $(CFLAGS_Q) $(CPPFLAGS_Q)" "$(PLATFORM)"
  
- GENERATE[uplink-x86.s]=../ms/uplink-x86.pl
+ GENERATE[uplink-x86.S]=../ms/uplink-x86.pl
  GENERATE[uplink-x86_64.s]=../ms/uplink-x86_64.pl
diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
index b7c0e9697f8..cf77e873a2a 100644
--- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
+++ b/meta/recipes-connectivity/openssl/openssl/afalg.patch
@@ -3,11 +3,11 @@ Don't refuse to build afalgeng if cross-compiling or the host kernel is too old.
 Upstream-Status: Submitted [hhttps://github.com/openssl/openssl/pull/7688]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-diff --git a/Configure b/Configure
-index 3baa8ce..9ef52ed 100755
---- a/Configure
-+++ b/Configure
-@@ -1550,20 +1550,7 @@ unless ($disabled{"crypto-mdebug-backtrace"})
+Index: openssl-3.0.4/Configure
+===================================================================
+--- openssl-3.0.4.orig/Configure
++++ openssl-3.0.4/Configure
+@@ -1681,20 +1681,7 @@ $config{CFLAGS} = [ map { $_ eq '--ossl-
  unless ($disabled{afalgeng}) {
      $config{afalgeng}="";
      if (grep { $_ eq 'afalgeng' } @{$target{enable}}) {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.3.bb b/meta/recipes-connectivity/openssl/openssl_3.0.4.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.3.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.4.bb
index 35a62755ad4..d9d17378d43 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.4.bb
@@ -12,14 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"
+SRC_URI[sha256sum] = "2831843e9a668a0ab478e7020ad63d2d65e51f72977472dc73efcefbafc0c00f"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


