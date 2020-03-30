Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.46407.1585561284052537445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 02:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=axNUvq9Z;
 spf=pass (domain: googlemail.com, ip: 209.85.221.49, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-wr1-f49.google.com with SMTP id d5so20798692wrn.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 02:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3ZagtUKPkgZM0alqL314ioSH/BXtkm0sSFqVaRq/yM=;
        b=axNUvq9ZeY65shkF59ZEEkc7rsbzKQ8xMco+5p7pO6f0Hvx72iKCMKY9eRAB2mGfPc
         PcgXaS5TAVQRWWpmgCUOVNv9x2hjSo9VsaSjcY1So6Ec6nVNnpoguDpdc1cgwGJSDc6E
         HKIugyPtsUmSpzbAQHLBe2dXG6Ej2cIlZTgxeN2saykgV5MS/e951xclnOEMKh+SIo+I
         cDOf/4zRfHjUnquoQsXdn3u6ggfwbdUS8eccCeD1QOpvMTchmyPSfsGXE82Bh6eCxXKi
         m4Hsvs8EAAmOLwgGFWNvIVCpp9lJrbVNTW7cuwp8crEypIvs1p/eZBk2OZfvebVDH6Uh
         N94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B3ZagtUKPkgZM0alqL314ioSH/BXtkm0sSFqVaRq/yM=;
        b=LiBgO9OXIIAHB4VxxCAOWf9Q0t8vOrqpTePEur6iNbNo7ZmPodjEri16+iWU/UdlS/
         h1QKQ3ae5wpiEy4l67hiU564zpMoW1kRLjgfnYMnLtJ1ifR+iZLgpO8VzqbS7ccp2EE4
         Rbo8yoNNQQ4Ig6XInfYYnEiixVBCXurFgK8oVCR/uitKESlPn6h0Xg/TCUHDvqEhKCYB
         PqzJm/4WG00izh8U2uYtd1pJwPpbG3+com069Uf9Mt6qlvLDvXAx/edSpowTeLN/BWud
         HEanFwFI6MRvTwVRTPjLMNrXuYmwpV/eaqfwPUOkCR9kcl1eVM8+f/9ka7ZSR10IO3cM
         Kbew==
X-Gm-Message-State: ANhLgQ3/jyQHcCKple2SLg7Ioqs3CYPVVYMmaJFn3n40Z4L1xkWIRtfD
	iQ3DkdNfT2t9do5KE//3GSiW2YxFB68=
X-Google-Smtp-Source: ADFU+vtiR1Fd4K4d3+oDGxzdlQ61NyuRmhZ3zn2oYz+bfwnzGuG9N1GtI84nlRkX4xD/zetZYh0cpg==
X-Received: by 2002:adf:fa8a:: with SMTP id h10mr13787442wrr.160.1585561282160;
        Mon, 30 Mar 2020 02:41:22 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from giesela.fritz.box (p200300E5171FDB00499A1C4FE5832282.dip0.t-ipconnect.de. [2003:e5:171f:db00:499a:1c4f:e583:2282])
        by smtp.gmail.com with ESMTPSA id g128sm20670245wmf.27.2020.03.30.02.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 02:41:21 -0700 (PDT)
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: [PATCH v2] python3: fixing bpo-36852 patch for builds on i686 architecture
Date: Mon, 30 Mar 2020 11:41:11 +0200
Message-Id: <20200330094111.979870-1-matthias.schoepfer@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>

The original patch "bpo-36852: proper detection of mips architecture
for soft float" uses AC_CANONICAL_TARGET to determine the platform
triplet. While AC_CANONICAL_TARGET exports i686 as target_cpu, gcc
is using i386 instead. We fall back here to i386, as it is conform
to the previous behavior.

Upstream Status: Submitted [https://github.com/python/cpython/pull/13196]

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 ...-detection-of-mips-architecture-for-.patch | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
index fe0aa8aabe..c4fae09a5b 100644
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -1,4 +1,4 @@
-From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 2001
+From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001
 From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 Date: Fri, 31 May 2019 15:34:34 +0200
 Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
@@ -13,15 +13,16 @@ to do this in a more autoconf/autotools manner.
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
 Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 
+%% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
 ---
- configure.ac | 171 +++++----------------------------------------------
- 1 file changed, 17 insertions(+), 154 deletions(-)
+ configure.ac | 175 +++++++--------------------------------------------
+ 1 file changed, 21 insertions(+), 154 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0f85486..0ca7e24 100644
+index ede710e..bc81b0b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -704,160 +704,23 @@ fi
+@@ -710,160 +710,27 @@ fi
  MULTIARCH=$($CC --print-multiarch 2>/dev/null)
  AC_SUBST(MULTIARCH)
  
@@ -193,9 +194,16 @@ index 0f85486..0ca7e24 100644
 +     	PLATFORM_TRIPLET=vxworks
 +	;;
 +     *)
-+	PLATFORM_TRIPLET=${target_cpu}-${target_os}
++        if test "${target_cpu}" != "i686"; then
++		PLATFORM_TRIPLET=${target_cpu}-${target_os}
++	else
++		PLATFORM_TRIPLET=i386-${target_os}
++	fi
 +	;;
 +esac	
  
  if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
    if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
+-- 
+2.24.1
+
-- 
2.24.1

