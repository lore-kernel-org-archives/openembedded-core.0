Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.26175.1619994000777359385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 15:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BAI1r9MG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id p6-20020a05600c3586b029014131bbe5c7so4716449wmq.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LAjV7rcDVOGNezxuN1ZkP13euQLua4re3w+ywozj4m8=;
        b=BAI1r9MGqrpwHs+cdhwBTj+ZW9J2ZZDljf69S7PeP4srVw5E4QgGLX9m/lyO64cbIU
         EiWwpuDpfG16k4Ksm7LP1xK/UseftgeKYOmFBXog+yW/q4nc+Fbabls4iVyxYmdU0YF+
         OFodsX6t7O2FvzrjU/NslsaZamc/B/I+fW1PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LAjV7rcDVOGNezxuN1ZkP13euQLua4re3w+ywozj4m8=;
        b=SgalMsLA+uVWcAxlAIgkkI71yBz5ktfBtPNnNExopgGkJbVfiKdWnaas2npNKD4AyJ
         NcX5FHB7DJDJRAknoqK8RxebpnSk6udYMUQ9nJWtdGSRvuosMZEHSc8kIyjFYD9p9jqK
         s1zJEyJHmEcRfFbR6i1bI+86r7nR89DlTyUMNC68ac8P1by43rAT8KZNdkY8vw0Wid1r
         eIB+YYAH0SwvqjLYyVVynAsQqSQU+WKA8WeUa5X1yZEMyNssAznnSAbYQheOCHl1NHOd
         hSmTxMA685FhtC1qh8vlaxsvAqwHUszPF4SqHy5pg8epYLkKaIIf3jugxRb8eYdT87xu
         Fl/g==
X-Gm-Message-State: AOAM531ubIrbYAsTPaGOpBxXMBpL0tMRgUJdIUGslYFcbJsKpYCI0ReH
	zF31Nch5a3uhmOrrNAt1ZOd34+DXR20gIA==
X-Google-Smtp-Source: ABdhPJwJNBwlnw/GX6fxdrMa0MDssfqEmLQPKDEvP0ymiTCj9fMNvptcfxEc2+QC+89yBZtA8gqkVQ==
X-Received: by 2002:a05:600c:1994:: with SMTP id t20mr4627401wmq.177.1619993999134;
        Sun, 02 May 2021 15:19:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id n22sm7071110wmo.12.2021.05.02.15.19.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 15:19:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Fix alignment patch
Date: Sun,  2 May 2021 23:19:56 +0100
Message-Id: <20210502221956.1879204-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous fix was in the right direction but needed to account
for the section alignment of the current section. Tweak the patch
to handle this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/patchelf/alignmentfix.patch      | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
index 62e11a5e7f8..a06876e50a1 100644
--- a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
@@ -31,12 +31,14 @@ Index: git/src/patchelf.cc
 ===================================================================
 --- git.orig/src/patchelf.cc
 +++ git/src/patchelf.cc
-@@ -1035,6 +1035,8 @@ void ElfFile<ElfFileParamNames>::normali
-                 phdrs.push_back(new_phdr);
- 
-             curr_off += size;
-+            /* The next section offset would be aligned */
-+            curr_off = roundUp(curr_off, sectionAlignment);
-         }
-     }
-     wri(hdr->e_phnum, phdrs.size());
+@@ -1010,8 +1010,9 @@ void ElfFile<ElfFileParamNames>::normali
+             size_t size = 0;
+             for (const auto & shdr : shdrs) {
+                 if (rdi(shdr.sh_type) != SHT_NOTE) continue;
+-                if (rdi(shdr.sh_offset) != curr_off) continue;
++                if (rdi(shdr.sh_offset) != roundUp(curr_off, rdi(shdr.sh_addralign))) continue;
+                 size = rdi(shdr.sh_size);
++                curr_off = roundUp(curr_off, rdi(shdr.sh_addralign));
+                 break;
+             }
+             if (size == 0)
-- 
2.30.2

