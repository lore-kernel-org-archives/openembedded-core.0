Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09ED4CA5FA6
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33583.1790495024246754121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h001ax1H;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so16333725e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495022; x=1791099822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/qN+5oh8Trn3DSSJ6/h20ldcGjoVA4cchj69KA/U2+Q=;
        b=h001ax1HsZTSbaCosnnuO6sVAPRvuIeCjqYGZo5TSYPe6ZveMEKEDm1FvY8ibd92Wp
         Nd0intKKyldkU6jFRjRVoc3zbAVbCo57WQOgxFXNyEfyEhRRS9J2m76I+wmM8KBSdgOI
         yr6OLLG6p0DLwfSNC3Wyb/xWt6XznwlFFvwAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495022; x=1791099822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/qN+5oh8Trn3DSSJ6/h20ldcGjoVA4cchj69KA/U2+Q=;
        b=LVpzTHVw5zdUzxB9MQaPHOI7+fWXXefPFyJtUcSswZS+wVcUyLM3Ru8HSEd3OkJHtn
         CHfIV9ApPtAA3ewO5DJJ9siAdu6wBYUp+h213o/c1XYzC78K18S0VSg6uegrYOosWNzz
         yVyG04igKilR3ErRAZ9CRyDwfceXXWveQVHevZ2e15YrPyeHKVYq0tKlUcUAZ92q5YAS
         aNVN2pnCy4QK8zPlR9SAIFqWlXtSTJ0aDKqkoqk5Uj7KowgztNfdKdjyhkjhL19lh6ao
         i47JiaAtGBAmwFWk6AM1J5d3B7CpcOIBk7eAz6gPIjs3R7hr2pSPE5W3KHnSpevHymTr
         q3hw==
X-Gm-Message-State: AFuF++kdMe6/4+/6+lE7MJuhxlDEJz80O5VZBN/scPU7vgZtAbzPEg4C
	dreBvZJtRQfdoRRJzAeBTv6o5I6xJ1MGIhBgp23D4nlbEvmQt40TpOO9fX/BKtp3aXpx+JNbV9B
	idej/3jI=
X-Gm-Gg: AYBFou3AE4+BfSUckCTJK0c+EYy0pYBVXntV3DLNeeW8AkPtd73cL5Qpg4pfjpLhJj9
	DVK1wXaNw2Md34dILe2pOXSwDl7E3QzwxrlhgulRFkdCCvAqGU8dLHjAcCy0vHidPi9wO0ldxEG
	TujknWAxD83KgU5l9aUmOc5tNNoQ/xcCmdXV15epB+opCWzHmvt/o0CPrpbUvuX1ywxiNKjDmZT
	JAXvAMqJgZ4DE1b90WYQss8/8r2LoRf8+25MhTbO/cpHipbltfBUE6DX9LoOZi/LeAlqH0OKbmY
	DeSSSFhRoCf83k8iss86pGgsdSEnWZCwXDy7LXyftT8wdc77Nm2NINwBRj/klVelnY7f5znhmHJ
	yHeT6UU0Pq1l8Jku/bw8HFQqZeKXsSJ1fy/FR8B68sdaqUcPC/B8DiAC/MTjDHXGwTPt3d5gred
	EkoczTw767vNu5NaAVVwD3bKViNB/7b97LSUdDxPgDhi7qNk7EEbqz+l+zM65l9abh+0Syl9wE8
	Z+MmRnqijo9gKC2UcmD+xqvbkPO+LFrQjIVjMZtUO7otCA454NsgiihA0b7b6MrEdG857cwEPk=
X-Received: by 2002:a05:600c:8b8a:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49fe6701f1amr170560085e9.27.1790495022507;
        Sun, 27 Sep 2026 00:43:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/28] libxfont2: patch CVE-2026-59679
Date: Sun, 27 Sep 2026 09:42:57 +0200
Message-ID: <e58da77ff6681a50fedd9246468fa9797b5d6b0b.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246656

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the fix.

[1]https://security-tracker.debian.org/tracker/CVE-2026-59679

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont2/CVE-2026-59679.patch   | 93 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch
new file mode 100644
index 00000000000..8e2ea4bd62b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch
@@ -0,0 +1,93 @@
+From 016a21b1eea8e4aef4949e19cdf5f386f36fd978 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 13 Jul 2026 15:48:06 +1000
+Subject: [PATCH] fserve: validate num_chars against encoding array size in
+ fs_read_glyphs
+
+FS_QueryXExtents16 causes us to allocate the encoding[] array, later
+during the FS_QueryXBitmaps16 reply handling we fill in that array.
+There is no verification that the allocation is large enough, a
+malicious font server could send us a small numExtents and a
+large num_chars to force underallocation and OOB read/rwrite.
+
+A regression test is included that constructs a crafted
+FS_QueryXBitmaps16 reply with num_chars > num_encoding and verifies
+the library rejects it.
+
+CVE-2026-59679
+
+Found-by: Zhixi "Jace" Sun, independent security researcher
+Assisted-by: Claude:claude-opus-4-6
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/36>
+
+CVE: CVE-2026-59679
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/668fea81f40bcb48ec67fb55d0b851049d265290]
+
+Dropped makefile and test changes during backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/fc/fserve.c    | 22 ++++++++++++++++++++++
+ src/fc/fservestr.h |  1 +
+ 2 files changed, 23 insertions(+)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index abf7d07..744a68c 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -1081,6 +1081,7 @@ fs_read_extent_info(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ 	return AllocError;
+     }
+     fsfont->encoding = pCI;
++    fsfont->num_encoding = numExtents;
+     if (haveInk)
+ 	fsfont->inkMetrics = pCI + numExtents;
+     else
+@@ -1980,6 +1981,17 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     {
+ 	minchar = 0;
+ 	maxchar = rep->num_chars;
++
++	/* Reject replies where num_chars exceeds the encoding array
++	   size allocated in fs_read_extent_info() to prevent
++	   out-of-bounds access on encoding[]. */
++	if (rep->num_chars > (CARD32)fsdata->num_encoding)
++	{
++	    ErrorF("fserve: num_chars (%u) > num_encoding (%d)\n",
++		   (unsigned) rep->num_chars, fsdata->num_encoding);
++	    err = AllocError;
++	    goto bail;
++	}
+     }
+ 
+     off_adr = (char *)ppbits;
+@@ -2001,6 +2013,16 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     for (i = 0; i < rep->num_chars; i++)
+     {
+ 	memcpy(&local_off, off_adr, SIZEOF(fsOffset32));	/* align it */
++	/* Bounds-check minchar against the encoding array size to
++	   prevent out-of-bounds access from a malicious font server
++	   reply with more num_chars than num_extents. */
++	if (minchar >= (unsigned long)fsdata->num_encoding)
++	{
++	    ErrorF("fserve: glyph index %lu >= num_encoding (%d)\n",
++		   minchar, fsdata->num_encoding);
++	    err = AllocError;
++	    goto bail;
++	}
+ 	if (blockrec->type == FS_OPEN_FONT ||
+ 	    fsdata->encoding[minchar].bits == &_fs_glyph_requested)
+ 	{
+diff --git a/src/fc/fservestr.h b/src/fc/fservestr.h
+index 29ae46e..da95e41 100644
+--- a/src/fc/fservestr.h
++++ b/src/fc/fservestr.h
+@@ -43,6 +43,7 @@ typedef struct _fs_glyph {
+ typedef struct _fs_font {
+     CharInfoPtr pDefault;
+     CharInfoPtr encoding;
++    int		num_encoding;
+     CharInfoPtr inkMetrics;
+     FSGlyphPtr	glyphs;
+ }           FSFontRec, *FSFontPtr;
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
index de6418b11a5..8775d1cc13d 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -18,6 +18,7 @@ BBCLASSEXTEND = "native"
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
             file://CVE-2026-56003.patch \
+            file://CVE-2026-59679.patch \
            "
 
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"

