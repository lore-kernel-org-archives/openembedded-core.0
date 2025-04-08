Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909E4C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:57:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.71921.1744109869617477454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GRqTvCGP;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223f4c06e9fso48819555ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744109868; x=1744714668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDQkEKnw5KSWu5aqmG6//twBQ3CYTomBXPofGR5nn9o=;
        b=GRqTvCGPT8YoIp2O5hrGN2nRCSUdFjgfjl5vXp1r0d8t1KzpMnPh5GViDHWB9ZL+q8
         WiFuvaFAMifdmo/vvx8T6Yuk05hheFFaN6unCrajXJyXR85FvtptpfTRjhn1OYofCQZZ
         Am+bixiaK2yIyIY855XJR20qNJF5nxS0cjPxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109868; x=1744714668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDQkEKnw5KSWu5aqmG6//twBQ3CYTomBXPofGR5nn9o=;
        b=k9xcBDkMTnwcyHYd1SJiREqt/VdF1lIkpWmUroVoZTqVRl4E+ge49sSTUA6VbrOu+O
         A90UJ2B3nC/siPLQT0T+N00qdKqz7znnpc3nYqATh0AJk9eMy99BE9J4ym/HWH7tQqnx
         qnd8/rRsoS93sOm9VR9rg5qycLstSxQ1WgUA2y1MPJ8ZAVfeYZm2qnluf9FV3H+uaPNU
         7OEeL9Aeb7BvEOLruDOLAwfEuzbgieoc1cHZS/SnLF3h7uqvGMXWQZv6PFLLFIoeBdvs
         jfkxJcDjzMKHN1qwumY5a8IWGUkzO6DIy7ewwjwaj8LYfJ2FtwrjDj1atDhbitsZZfAG
         e+SQ==
X-Gm-Message-State: AOJu0YxAUBQKlFUiZay6aiyKBDKlb4np6Eb56iRDAgbJbp26zfBCNi0G
	Zcat6B3yHcg234xsF1s694WZE/VIGOCfEABnGgjvgf0CTgstHD2vU2OuQNCiJXFx5eXCAsff0eW
	xwtM=
X-Gm-Gg: ASbGncsVsFbFUr0R6Llz3ajheekXfZH9XsAmI4O68rX+MZ0tVgtz52ZuILuBOfzTbAe
	hHv8TTIPX5s51bighYlEJwLyUKb7f/bGeNKk9EcpIW3Umz62ZjMRMZcka4h1V9eWH62rfytV0Od
	K/Qa1idxXCkKnbLjaIR4986G8XD49/ythSJcf8CWcuoG0kbpZcpLgBqaOxVnfnr7SC1XmW4lmTr
	MLFv59pQNU4tayC0RJs/vtjmCKzNRXP6wJKQtRtScrR9JtuJY7ewoExXYy9DOgemmILA5alr8Yh
	Vl0DvBpKq/5WtQ5xhWzjDhfBE+lav+ZIlHI75Alp3rEHMyzwxGdcAMNtnxl2zdxuV4c=
X-Google-Smtp-Source: AGHT+IEBwBRG6Z6VQ8d10m4LZwjzcDGoa5YygdoSxTysbMZAyYwJMxpPN5ZioK08FID744CiJsHOOQ==
X-Received: by 2002:a17:902:d48d:b0:226:3392:3704 with SMTP id d9443c01a7336-22ab5e37788mr30641285ad.12.1744109868185;
        Tue, 08 Apr 2025 03:57:48 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe34sm97696255ad.67.2025.04.08.03.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:57:47 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/6] ghostscript: Fix CVE-2025-27831
Date: Tue,  8 Apr 2025 16:27:17 +0530
Message-Id: <20250408105721.1798123-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408105721.1798123-1-vanusuri@mvista.com>
References: <20250408105721.1798123-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214527

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=bf79b61cb1677d6865c45d397435848a21e8a647
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=bf79b61cb1677d6865c45d397435848a21e8a647]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../ghostscript/CVE-2025-27831-pre1.patch     | 50 +++++++++++
 .../ghostscript/CVE-2025-27831.patch          | 84 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831-pre1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831-pre1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831-pre1.patch
new file mode 100644
index 0000000000..bdf597f38e
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831-pre1.patch
@@ -0,0 +1,50 @@
+Partial backport of:
+
+From bf79b61cb1677d6865c45d397435848a21e8a647 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Tue, 27 Sep 2022 13:03:57 +0100
+Subject: [PATCH] PCL interpreter - fix decode_glyph for Unicode
+
+The text extraction (and pdfwrite family) expect that decode_glyph
+should always return pairs of bytes (an assumption that Unicode code
+points are 2 bytes), and the return value from the routine should be
+the number of bytes required to hold the value.
+
+The PCL decode_glyph routine however was simply returning 1, which
+caused the text extraction code some difficulty since it wasn't
+expecting that.
+
+This commit firstly alters the text extraction code to cope 'better'
+with a decode_glyph routine which returns an odd value (basically
+ignore it and fall back to using the character code).
+
+We also alter the pl_decode_glyph routine to return 2 instead of 1,
+so that it correctly tells the caller that it is returning 2 bytes.
+Finally we make sure that the returned value is big-endian, because the
+text extraction code assumes it will be.
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=bf79b61cb1677d6865c45d397435848a21e8a647]
+CVE: CVE-2025-27831 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ devices/vector/doc_common.c |  8 ++++++++
+ pcl/pl/plfont.c             | 12 +++++++++---
+ 2 files changed, 17 insertions(+), 3 deletions(-)
+
+--- a/devices/vector/doc_common.c
++++ b/devices/vector/doc_common.c
+@@ -513,6 +513,14 @@ int txt_get_unicode(gx_device *dev, gs_f
+         char *b, *u;
+         int l = length - 1;
+ 
++        /* Real Unicode values should be at least 2 bytes. In fact I think the code assumes exactly
++         * 2 bytes. If we got an odd number, give up and return the character code.
++         */
++        if (length & 1) {
++            *Buffer = fallback;
++            return 1;
++        }
++
+         unicode = (ushort *)gs_alloc_bytes(dev->memory, length, "temporary Unicode array");
+         length = font->procs.decode_glyph((gs_font *)font, glyph, ch, unicode, length);
+ #if ARCH_IS_BIG_ENDIAN
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831.patch
new file mode 100644
index 0000000000..8956d276d1
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27831.patch
@@ -0,0 +1,84 @@
+From d6e713dda4f8d75c6a4ed8c7568a0d4f532dcb17 Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Thu, 21 Nov 2024 10:04:17 +0000
+Subject: Prevent Unicode decoding overrun
+
+Bug #708132 "Text buffer overflow with long characters"
+
+The txt_get_unicode function was copying too few bytes from the
+fixed glyph name to unicode mapping tables. This was probably
+causing incorrect Unicode code points in relatively rare cases but
+not otherwise a problem.
+
+However, a badly formed GlyphNames2Unicode array attached to a font
+could cause the decoding to spill over the assigned buffer.
+
+We really should rewrite the Unicode handling, but until we do just
+checking that the length is no more than 4 Unicode code points is
+enough to prevent an overrun. All the current clients allocate at least
+4 code points per character code.
+
+Added a comment to explain the magic number.
+
+CVE-2025-27831
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=d6e713dda4f8d75c6a4ed8c7568a0d4f532dcb17]
+CVE: CVE-2025-27831
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ devices/vector/doc_common.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/devices/vector/doc_common.c b/devices/vector/doc_common.c
+index 690f8eaed..05fb3d51f 100644
+--- a/devices/vector/doc_common.c
++++ b/devices/vector/doc_common.c
+@@ -479,7 +479,7 @@ int txt_get_unicode(gx_device *dev, gs_font *font, gs_glyph glyph, gs_char ch, u
+                     }
+                     if (strlen(dentry->Glyph) == gnstr.size) {
+                         if(memcmp(gnstr.data, dentry->Glyph, gnstr.size) == 0) {
+-                            memcpy(Buffer, dentry->Unicode, 2);
++                            memcpy(Buffer, dentry->Unicode, 2 * sizeof(unsigned short));
+                             return 2;
+                         }
+                     }
+@@ -497,7 +497,7 @@ int txt_get_unicode(gx_device *dev, gs_font *font, gs_glyph glyph, gs_char ch, u
+                     }
+                     if (strlen(tentry->Glyph) == gnstr.size) {
+                         if(memcmp(gnstr.data, tentry->Glyph, gnstr.size) == 0) {
+-                            memcpy(Buffer, tentry->Unicode, 3);
++                            memcpy(Buffer, tentry->Unicode, 3 * sizeof(unsigned short));
+                             return 3;
+                         }
+                     }
+@@ -515,7 +515,7 @@ int txt_get_unicode(gx_device *dev, gs_font *font, gs_glyph glyph, gs_char ch, u
+                     }
+                     if (strlen(qentry->Glyph) == gnstr.size) {
+                         if(memcmp(gnstr.data, qentry->Glyph, gnstr.size) == 0) {
+-                            memcpy(Buffer, qentry->Unicode, 4);
++                            memcpy(Buffer, qentry->Unicode, 4 * sizeof(unsigned short));
+                             return 4;
+                         }
+                     }
+@@ -527,12 +527,16 @@ int txt_get_unicode(gx_device *dev, gs_font *font, gs_glyph glyph, gs_char ch, u
+         return 1;
+     } else {
+         char *b, *u;
+-        int l = length - 1;
++        int l;
+ 
+         /* Real Unicode values should be at least 2 bytes. In fact I think the code assumes exactly
+          * 2 bytes. If we got an odd number, give up and return the character code.
++         *
++         * The magic number here is due to the clients calling this code. Currently txtwrite and docxwrite
++         * allow up to 4 Unicode values per character/glyph, if the length would exceed that we can't
++         * write it. For now, again, fall back to the character code.
+          */
+-        if (length & 1) {
++        if (length & 1 || length > 4 * sizeof(unsigned short)) {
+             *Buffer = fallback;
+             return 1;
+         }
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index dae8dff813..94a21d1dce 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -63,6 +63,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-46955.patch \
                 file://CVE-2024-46956.patch \
                 file://CVE-2025-27830.patch \
+                file://CVE-2025-27831-pre1.patch \
+                file://CVE-2025-27831.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


