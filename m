Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76EEC88E7F
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 00:44:05 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4580.1789519443900228406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 17:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L7vW795T;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86868f7707dso155269b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 17:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519443; x=1790124243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3++iwIoIr6QZIQfDn1e4imTFSOLbIHQlaKtZ8UR5r28=;
        b=L7vW795T+OPe1xGncMwGJs6pZImd5baUyMSm56Fidy1JeeHBTmveg2fuQYlpnXdj2D
         waMC8vAaPe/BwFPyy2TjRX3bBKU2HMgyO+Lh8iR3RyySxVRneoa+s+aJiuwRmatHoJak
         DgVIk05tz13XclLtjxjLs2GT6jpJUa24SJUbcJdgX8QISTdOWM2woBxsz0hrqypGrvwK
         fLMt8V86mcL28Dv13mdXVrMOxGvu/6HaFDnwcVjMi9wjdRtOOVbTA6Lr6woUGEi4KTxW
         tXe3nuFxgJLWKKAb+ZcqtrlmmveUBQwJ0GNhQPE01N0HZN8nYBlOarZtcpHQScqErqZ9
         jXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519443; x=1790124243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3++iwIoIr6QZIQfDn1e4imTFSOLbIHQlaKtZ8UR5r28=;
        b=ACZm5Arx1vop1CWWoc8A7L91ZyNMD5R25S9of8c6xfnhV3vzbfGeHF/YdRhfr27jEB
         ZfnrxCLXBO/VNrnUSMv2NwCRsfyoVXsIz6A9qxg/TKRl1x7XGL4SpSBUZP6y/CRvHD61
         cbwHBMMPM7heXR1i4z9I8N4+yG+OOG7dbhspMwMlSNvGIfUgGlxpEWz258q2c5Po3SOn
         wupxBTxFYLpdG43eTY/BpacqSqp7xaNfBkZ2WiSc3MfEREnyAb4ibi8DQqeUEduxJuxv
         KRrsoctmzfOhcbra3I5VZzcxEFunKJOpQgPkNBQQ6nJ/qiESgkCOR79aD1gYzpP5tW+E
         q/fg==
X-Gm-Message-State: AFuF++neV37tEPVSaZMtOEsav98BkXIvQzq14vP2K7I3w9+RJeQ/WIXr
	TVwJZ+v69sZ76BB3JmSEJwC+OQeUwfOR8xv3/fr7I4btlQPrBBr4VvR+0VU8gw==
X-Gm-Gg: AYBFou2GDDppGesuaVb4nHb48uUDPEaRJrVeAcFeJY6slUW8PQ80J0UiprXJUzHl3R7
	tQbpZGWPk0zDzzaYBUORqETNCJdPpGK5hr2NI5pNo4cL+xp/l7tOlw37f/xzObM5mt7TAa0r7Bt
	ysHZhc3dMnTaCJQtsiuP1jk9x5xyk/RK6SEQcCxan5dNgHIMWvASjORTuUyml42LtDxrjT28spf
	inqIjRD9drRulhWd5ckHEA3IMSnU7TH+FAlVwwKO87XLKK6JN4FeULAct7W7gflpUzXCmrFQ8BB
	NA7JDHCCIsNfbml/a5tjyBO8Mr3Xydb1MfHNNvbC7qPwHp/od9+l6wCbBVSyDeDNfmZrB1gNXnx
	dS7ixwduiBjCHZbWsptSTqTUvPp9kt/xlqd4RI5QYITTexAnWxvBOyu09y36I5NfJkfZoRmkpqA
	fyqPQsCrwr/gUnz/0qn7RRsx4CiFKzdLG3mN5ov9qasMjtFJLeYfO6u133JcDTZk0ahMzZnsMir
	r6Asfh1Lu1DmxQt6NXK+RFFR1Z+op54Lg==
X-Received: by 2002:a05:6a00:1304:b0:870:ef71:e8c8 with SMTP id d2e1a72fcca58-8723c64d085mr812264b3a.12.1789519443207;
        Tue, 15 Sep 2026 17:44:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87200c58265sm314134b3a.14.2026.09.15.17.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:44:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][wrynose][PATCH 2/3] libxfont2: patch CVE-2026-59679
Date: Wed, 16 Sep 2026 12:43:52 +1200
Message-ID: <20260916004353.478934-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916004353.478934-1-ankur.tyagi85@gmail.com>
References: <20260916004353.478934-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 00:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245911

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the fix.

[1]https://security-tracker.debian.org/tracker/CVE-2026-59679

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../xorg-lib/libxfont2/CVE-2026-59679.patch   | 93 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-59679.patch
new file mode 100644
index 0000000000..8e2ea4bd62
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
index de6418b11a..8775d1cc13 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -18,6 +18,7 @@ BBCLASSEXTEND = "native"
 SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
             file://CVE-2026-56003.patch \
+            file://CVE-2026-59679.patch \
            "
 
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"

