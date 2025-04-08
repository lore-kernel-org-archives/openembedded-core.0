Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C1DC369A5
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:26 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.6775.1744145481078512557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NGJ+EYUb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223fd89d036so73585595ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145480; x=1744750280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4b0UsnO7c5Ii1hrsKHwfSCjKqWpb92NGASRIJLf3U4Y=;
        b=NGJ+EYUb0enZxTs/f6j59IPYFTzp3L/22zohixevdkcQCkqNJfJMy8rIFWjAFotk+K
         ww6M8qAo95YwfnOXoOOa4Oadw1mjBBPBtQt+67D7VGw38PBYlnd7btaKWMOFB9/ayyag
         pnuFjjDU7QcHcD2Rvna6XvAZgRs5yZwK0EMBEzSYabvIzd4mJD68BU3HvJmgf1707YOu
         2j1TB1PQzQniHlK8O09Uju25k1KWxcwoMbBM4vX34JXUy0f9rGuhxUWS9NMELoIA35bn
         bpMQmVs2DYXgSCZkZ9EMsI7db5es8Kx4wofg7mlMSM1kSIVKv3/F+ochausSAPj1oqfQ
         +24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145480; x=1744750280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4b0UsnO7c5Ii1hrsKHwfSCjKqWpb92NGASRIJLf3U4Y=;
        b=YwZKBxEgp9EprHgVOCXFITyL5pZdc5RJLl2wHrMhOBRlu2h3BGyUILCJpb4Ab3whTZ
         ahLtc6DcOmgK/d3cosYQ6s4gaoUW1Rv3Wk97Ii9jez+5zqEJje5vRdRyhSlXRMsnSYwq
         hg+iuMIaxxvA7+jinR48E22Hm5DfxkBIZLP65Cgh1v1GzuDTjk8BFiVb4roIIpW9Sfgb
         KnOG3qcHZ7bFY/U9UprLEHOF0uNlAHDNQ5qy97W5a2dkyMID+D8FZ/mbRrFBokrScnZY
         2wNnSzWhMOgW4pDAJREXaX7OV176zZ4xB3uSEisiPTm12jsxhXtfJli5wE8Ab341b4BK
         pPjQ==
X-Gm-Message-State: AOJu0Yy7dWEOcq49g1QY1FuC+PmO2XdVeeuDDp2AfnveBj/jaxzteDgD
	EWys6SosHODWHuTFoEnGQ9zu5ku6TkELaUQ1+noh8KpqJTKx5MVuTDz7IEC9ByHhi3bPv/o/zqh
	k
X-Gm-Gg: ASbGncsQHd8+UNmooBZ/uE3ti/Y6XOu0sQx17XeDHcfzUpIlOFeYTDPn7IZ9lQRJVjK
	AIfpTB+YTeQSD/kjGM/EkgpAh+IfEB5vWbTt57FwyWFbF4Bo+w3jlVEWaHnhMANhJC7xGHo1yFO
	d1VcITZJbIbDCDjyEyK/8ZoFzwpqUcCFJcVLu64S11BsAFeseuGofVMt6JX1JJdMES2iiIHq1N7
	b4vF85m0tp1/LkyK6HfjkvJq88WXYCDfSQIVY9zDLG0kz3w1vUsrIboRSvCRzOGp2CvTN3r5u8J
	mn47392kYladatb8ZWpJGPmkewhH3zj26eze
X-Google-Smtp-Source: AGHT+IHMTtjVp+c5nCLy1R21TuAtSSGcOP0jdESPY5trd+C8SZC7T9SgyfjU0oXEMM5MEpuWNctU+Q==
X-Received: by 2002:a17:902:f54a:b0:225:ac99:ae08 with SMTP id d9443c01a7336-22ac3f32236mr2015555ad.5.1744145480204;
        Tue, 08 Apr 2025 13:51:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] ghostscript: Fix CVE-2025-27831
Date: Tue,  8 Apr 2025 13:51:00 -0700
Message-ID: <810795d2f1d7798c52675efd94917bf99fb940d0.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214559

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=bf79b61cb1677d6865c45d397435848a21e8a647
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=bf79b61cb1677d6865c45d397435848a21e8a647]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


