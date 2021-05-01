Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.13546.1619905383942435140
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 14:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QVBKtOGs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id z6so1650634wrm.4
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4EPDENm63P0IwtKZA0NZgAbYUvVFx3TvynATAeKc+I=;
        b=QVBKtOGs5pDeyAYqj5RrxcJzQupzWH2sR1ulYtEVTMc5ktR/C4fZWbFCxP/R35CRw4
         jR8VLBqJzU+/z4z7uwZgegJRSmubwZNeItyjXGvZD4pMhJppGO7l30bbMRaf4XouD/2n
         MpLZrei3vfXBMomp3/IixlTWgE6IqSdhbWkgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x4EPDENm63P0IwtKZA0NZgAbYUvVFx3TvynATAeKc+I=;
        b=TzSS2ZXIdnQj5XJ4z+Jn/f9OP+AA5FWNI3ePdBzuGKMR/hJEgpzMODKbbuVXEOEAnN
         b7AQFejnGlLuiBCH7kHg/fOuniv6zipDTEBzD4XFrqG23rtb4eKrG2ER34AoayEXiK02
         8hd4s4Wc06GRmGncFh8Co5IYaIUf6nMIoH1EJo+FpfdhiSZOo7i6uu9VrvrqKEfDJJMU
         ilclEWktrvFYfTfCdfM3SGx01vvzz7fvBBMOpnfmaUW10epdmKBbaBLHLZBweW+NidTB
         /FHjI+BIPKTzsIh7t15XGeAxNkxN4C+C5yOI9qqBBMgOt66DARSyD6nUUmPnM7az3sOr
         tiWg==
X-Gm-Message-State: AOAM532rTKeSSkEuWvj8R556cwzzr/K7tdD7vhNUSfx1Gyk593fP/U9y
	1//d6enwBNcVeF7coW0H+MxrC0tjqJWw3w==
X-Google-Smtp-Source: ABdhPJxgBewEtc3x1w5mJklBdhrwtp2lkEPdkxE1ZXXdR3wLzdi0Kf+UVnscAVRCuCLm5kKooPbtPw==
X-Received: by 2002:a05:6000:1846:: with SMTP id c6mr15502686wri.129.1619905382210;
        Sat, 01 May 2021 14:43:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:39b1:e747:d5d0:81c2])
        by smtp.gmail.com with ESMTPSA id p10sm7462203wre.84.2021.05.01.14.43.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 14:43:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Fix note section alignment issues
Date: Sat,  1 May 2021 22:43:00 +0100
Message-Id: <20210501214300.1846296-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve note section normalization was added to patchelf in recent versions
however if fails if there are two note sections which aren't sized to match
section alignment. Tweak the code to account for section alignment.

This fixes patchelf failures on the autobuilder, particularly to ccache-native.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/patchelf/alignmentfix.patch      | 42 +++++++++++++++++++
 .../patchelf/patchelf_0.12.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
new file mode 100644
index 00000000000..62e11a5e7f8
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
@@ -0,0 +1,42 @@
+If a binary has multiple SHT_NOTE sections and corresponding PT_NOTE
+headers, we can see the error:
+
+patchelf: cannot normalize PT_NOTE segment: non-contiguous SHT_NOTE sections
+
+if the SHT_NOTE sections aren't sized to end on aligned boundaries. An example
+would be a binary with:
+
+  [ 2] .note.ABI-tag     NOTE             00000000000002f4  000002f4
+       0000000000000020  0000000000000000   A       0     0     4
+  [ 3] .note.gnu.propert NOTE             0000000000000318  00000318
+       0000000000000030  0000000000000000   A       0     0     8
+  [ 4] .note.gnu.build-i NOTE             0000000000000348  00000348
+       0000000000000024  0000000000000000   A       0     0     4
+
+  NOTE           0x0000000000000318 0x0000000000000318 0x0000000000000318
+                 0x0000000000000030 0x0000000000000030  R      0x8
+  NOTE           0x00000000000002f4 0x00000000000002f4 0x00000000000002f4
+                 0x0000000000000078 0x0000000000000074  R      0x4
+
+since the PT_NOTE section at 2f4 covers [2] and [3] but the code
+calclates curr_off should be 314, not the 318 in the binary. This
+is an alignment issue.
+
+To fix this, we need to round curr_off to the next section alignment.
+
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/274]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -1035,6 +1035,8 @@ void ElfFile<ElfFileParamNames>::normali
+                 phdrs.push_back(new_phdr);
+ 
+             curr_off += size;
++            /* The next section offset would be aligned */
++            curr_off = roundUp(curr_off, sectionAlignment);
+         }
+     }
+     wri(hdr->e_phnum, phdrs.size());
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 2eb09aee321..7c97ea07898 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -7,6 +7,7 @@ LICENSE = "GPLv3"
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
            file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
+           file://alignmentfix.patch \
            "
 SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
 
-- 
2.30.2

