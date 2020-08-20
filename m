Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.105574.1597906652653301869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 23:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ntpQKoiA;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id mt12so557742pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 23:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eL28J9P7ZMO1Yu+C/nTNimJNbuSRiGytYzcDII30ecM=;
        b=ntpQKoiARXcw4yp9HVOHRW0jTZzYyPHv9i3rPxxb1oCuIPCfuywH2g2/R1R60bC7y5
         9U3pr3/9SJW8dTZjvOq2NS4hq8SPCWvrC4JOQ8GMkPr94rkbLJHI5QatOZPpCpNNpnSv
         1M/M71UzpDq0NuPWmay9BmThvGfCXaYFrP+mG69GQp4vKh8yWdG0qxOkpw3ol278V0C7
         6C3uNgIa3QbiO4+P7cm4X3K1NiCiS/c/JBgUnH89LuJxZEmJRXl7yZw5bQzboQUbyTMz
         TreY5MIVLAE0x0eSpOk2pccb9HJJpAJeVyIAKOHCnOEIoF6yNMssfu+WQeacBIJggScf
         f1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eL28J9P7ZMO1Yu+C/nTNimJNbuSRiGytYzcDII30ecM=;
        b=l3YChqCkfgeeVKWgw/YqKHRUVu9rynKdOO/Q8d43EQ5w2qlygDecP4ZNUR3mmlG6YP
         07VMAfNmzJ2euNPvXzKQDxOCyxEdnOiMkfwb/UeRplYBx31JrRGvnZ3Ap2GmStZv2GJc
         ka3YDiZpzOBLm0CTaAyw/dOJtBhQfQOrOP7VvnIE0wMkxxofGyuzvudHBqMztXaEP/qP
         IrPyj/58NlPlbSfuLR3Q4yBSFTG27KLnEsJ3x9C3bZA7MBGrVePsw5I+m53IBqpRjxuq
         rEg6Yp0et0VPJZtskjPtgugbz1QmVoJlzOqIQkFiJGKv+gT/We++0hc/6jV9jKRU+K7+
         oRtw==
X-Gm-Message-State: AOAM53125CYQJy9ohfrtmAhK9MonVgVoOcGGnTdLN/NTP18WKFXG4bPu
	/zO504TJq6JLFV96F5BlzDZ6d7V4FdspDw==
X-Google-Smtp-Source: ABdhPJx4Kle5UlEoKikEMivq6N9ecN5HKa/rfs2j8iKvuKeOsGX94Z34cmEFK4CYw/8Tra036N+dsA==
X-Received: by 2002:a17:90a:bc96:: with SMTP id x22mr1479703pjr.164.1597906651621;
        Wed, 19 Aug 2020 23:57:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id 77sm1534936pfx.85.2020.08.19.23.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 23:57:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] binutils: Let crosssdk gold linker generate 4096 btyes long .interp section
Date: Wed, 19 Aug 2020 23:57:24 -0700
Message-Id: <20200820065727.2589128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gold is used as default linker in crosssdk e.g. when building SDK
binaries with LTO, the binaries do not have large enough .interp
section size and SDK relocation fails for those nativesdk binaries and libraries
which used gold for linking. This patch extends the .interp relaxation
fix to gold

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-crosssdk-Generate-relocatable-SDKs.patch | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 0e62d47616..4c1d11291b 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,22 +1,38 @@
-From b8d182865081d17549fb9a4b9bc3062b526caf65 Mon Sep 17 00:00:00 2001
+From a0b23b160d6cfa7be4437c6e623633d76395f2ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
-Subject: [PATCH 01/17] binutils-crosssdk: Generate relocatable SDKs
+Subject: [PATCH 01/16] binutils-crosssdk: Generate relocatable SDKs
 
 This patch will modify the ELF linker scripts so that the crosssdk
 linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
 will be relocated, at SDK install time, the interpreter path can be easily
 changed by the relocating script.
 
+generate larger .interp section for gold linker as well
+
 Upstream-Status: Inappropriate [SDK specific]
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+ gold/layout.cc        | 2 +-
  ld/genscripts.sh      | 3 +++
  ld/scripttempl/elf.sc | 4 ++--
- 2 files changed, 5 insertions(+), 2 deletions(-)
+ 3 files changed, 6 insertions(+), 3 deletions(-)
 
+diff --git a/gold/layout.cc b/gold/layout.cc
+index 13e533aaf21..b0afff16e2e 100644
+--- a/gold/layout.cc
++++ b/gold/layout.cc
+@@ -5019,7 +5019,7 @@ Layout::create_interp(const Target* target)
+       gold_assert(interp != NULL);
+     }
+ 
+-  size_t len = strlen(interp) + 1;
++  size_t len = 4096;
+ 
+   Output_section_data* odata = new Output_data_const(interp, len, 1);
+ 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
 index 03392d265c7..435689ea144 100755
 --- a/ld/genscripts.sh
@@ -43,10 +59,10 @@ index 03392d265c7..435689ea144 100755
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index 0b8b32a4407..ee6b71075d7 100644
+index eb74743e5c3..c9a8a47615f 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -140,8 +140,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
+@@ -143,8 +143,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
      DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
    fi
  fi
-- 
2.28.0

