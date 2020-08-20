Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.105578.1597910478773554239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 01:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WeMjNRdV;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id u20so645350pfn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eL28J9P7ZMO1Yu+C/nTNimJNbuSRiGytYzcDII30ecM=;
        b=WeMjNRdVGtwS2Mw3iRbbrY65vHfryUhdh+/mzX+L4R2f5pLw0yF4e8FKECqThaaoHf
         5hg6sjYLAIrAyovrP+MFJdlh03sYebivV04NVSdLQvvvjO6nfn6/oyovlU5u6iH+We8i
         rJfZfy22ga7EOLiRzpiITCKKsOORIeUfCGmrLT/0npGQ8TRYF/VxHEFWIDj5z4p+/l/2
         33zMJJQ9yeYkpEjYD7SibcOTbwNkwhvlPmfSXUjvsXoT41//dzbqE5XmiX24AyuPaG0t
         tbEvdol35itbFR/QXosj1d0wNQOJmFU45ftEBERvXILk/iPB0/5YXsua5oEdbk8tZhBs
         N+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eL28J9P7ZMO1Yu+C/nTNimJNbuSRiGytYzcDII30ecM=;
        b=eqXSGV0/4baWyN96OJ++wtp+o5gDjTX2an7a8+MnkRAjJ2UQgGsVED8UeOj86Mpr8B
         qvB4+4WF1welDdEHHK+Fgf7lpTbvlnzA5WBQJZgBbe5H/caMRLam1y9sd1NtFNmxWgov
         /PFMP/evEC02veDNMHrfFDXuwQ5ByS75usGWcQ9N4Hl5CoJyAxf1RQaRGAoSo0acMEIS
         cQ4poJzIJIGlKoJ73fYlgaTiGuyzp86bvFSZN36/ylb6hFmbfr7DOpGjrg/9A7e4DTks
         BvXhzl6z530uY2aKYxK58nFWywA2M7jPHgQDy2WB6f8DjKtDUpSpNY55HgLyDgVRIwzj
         s63w==
X-Gm-Message-State: AOAM532Dc0MKFaBwgAkFbWOVsI0sYNqY4/tanAXoa02MnlHOz8aBeZ/p
	wD9iOwo5Mex12m2O72XXqNjjFL0GT4tvHQ==
X-Google-Smtp-Source: ABdhPJwkYSHS5FcouAorzCHtlAtAyppe2qMfCoxVJEPvo4pzmR3XcYHtlrgeASnGL6IXEU5M3ds/Xw==
X-Received: by 2002:a65:4d0f:: with SMTP id i15mr1589714pgt.71.1597910477754;
        Thu, 20 Aug 2020 01:01:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id mp1sm1402119pjb.27.2020.08.20.01.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 01:01:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 1/3] binutils: Let crosssdk gold linker generate 4096 btyes long .interp section
Date: Thu, 20 Aug 2020 01:01:13 -0700
Message-Id: <20200820080115.2715139-1-raj.khem@gmail.com>
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

