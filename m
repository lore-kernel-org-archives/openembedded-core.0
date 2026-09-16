Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB011C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 00:44:15 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4572.1789519445983312602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 17:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W3hlcEp2;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so208372b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 17:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519445; x=1790124245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXIV9GSzys60igQw6GTgZOYelRbQVf/NYyDKx1lmx+U=;
        b=W3hlcEp2GEisphYClPG128Bm7dKTu/92bdC6V9higVmuXdgPCtSmZPf+6RRJzGciD8
         EGj5OCC0+1VrlIWFRyVRvzBy0hVM0DzwfI4u0us3u8RY1ETo54hXoJEI3DOsjb3J7NBc
         hjnWsEYJGBdwtIF8YHa8kPZtmrogsG0NWr2sYw6f992atctYM8i7SuBFFS6hC4lrhm76
         kJzrHE1A4eeNbUcPcROkHxeX3q2/GPpnYg4Nald+UzeOf4FqWiw7VYhJK9JHPzqJH+Pz
         1iPZGDpykKe6ysTswx0foaq36wuSP5fPdRNTU80dXT15202k0PwTqsummwOuay2cOBrC
         5mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519445; x=1790124245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXIV9GSzys60igQw6GTgZOYelRbQVf/NYyDKx1lmx+U=;
        b=ketdT/TDGYeWebnvsyW6e/ZApcgnfj7I412HoRKV+i5iN3WksavKv1qb1J2ah/9Azn
         PpHw7RrlzHJj8AXcOlHH2R/2WvR36f+b1Cemvd5YZ73JejZuDIRqsR06XiIoEOFnYrUA
         KFRte4ftqZDJ+WqoHju60h9HkI6jkryoAlpWNJkN3A0GXrKWjfI2ddnL3ex8EDUs1pbD
         wUQH6kiy1nn+4wdXsVxYs+qbRw1MAqtMaXxwsLDC5kGjYwUG2JKd7RFCet5yO1S6e2ca
         GLm9Cml4Myzu1qACEZTb460z3GQSVa0IHzm3rw0OtodyFG4XLlbOmwyDhJ2rfLVJRGTM
         seng==
X-Gm-Message-State: AFuF++nJYT3xMFQn66422FlMpYkKpf5bSTtGIqgcLvUFX3BGxTS/rstD
	iH2Q9BA+QDNjsHQzILXKPZc2iT23jyh6F2/LyazqMZje/kLQnKEG9ftTHyMxdQ==
X-Gm-Gg: AYBFou1c2hoANu/vXJqlSUGiMq/hf/b1gXIWP26HLs+yTScCm3eS7lm6qVuXGNVAqaQ
	WKFN7QFaKWkopNRUhH5DAJbGgXz4uUiYY+y9AwsiGuAl8TflYiPZRRpMIU2nGuVEjRSvpbYNkCF
	OACy3rQpSIWCOq3h3nn3QudQktuIEZl7mjpoi5Ox17ZZZWVrIghAXDulzvyotUAyDVSMhm8QOu6
	eqznsiMeCSPALcycercyP78XqWwLmJU4WohBuLBBIundvUAjSjaXNtJXMofX3U+0MMfJtPOAZR2
	unpTgwfgoZe61JgcqyVhJHZ0bYeEgCdmgFzoDDaKl3ts4ynD/kHwXAvhZ3IPfl1LNxd4+ELplOd
	Z4y7R8ZF2ZYcq6bt89ASCkwcgHKi7XbuG8Q2aQDLl7WnUrlCMUK44Hkqumgi4XXkt3U5i2V+f+r
	YYzmSU3s1O617dkwEev+bRkl/NZQVMHyiMb6CPMdyrHprJzGEMXcn1PCtQw4vQ4WEQUOVKd5xo7
	asn1WUHBMkj2VpDjgBS2vk=
X-Received: by 2002:a05:6a00:3317:b0:86a:c062:8af2 with SMTP id d2e1a72fcca58-872362fb364mr1180552b3a.3.1789519445318;
        Tue, 15 Sep 2026 17:44:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87200c58265sm314134b3a.14.2026.09.15.17.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:44:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][wrynose][PATCH 3/3] libxfont2: patch CVE-2026-44950
Date: Wed, 16 Sep 2026 12:43:53 +1200
Message-ID: <20260916004353.478934-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916004353.478934-1-ankur.tyagi85@gmail.com>
References: <20260916004353.478934-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 00:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245912

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the fix.

[1]https://security-tracker.debian.org/tracker/CVE-2026-44950

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../xorg-lib/libxfont2/CVE-2026-44950.patch   | 99 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch
new file mode 100644
index 0000000000..96e3c1f0a8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch
@@ -0,0 +1,99 @@
+From b48aa50f2ba02f74167492c1c3aa312a7590991a Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 13 Jul 2026 15:50:09 +1000
+Subject: [PATCH] fserve: bounds-check cumulative glyph data writes in
+ fs_read_glyphs
+
+fs_read_glyphs() copies each glyph's bitmap into a single allbits
+buffer allocated to rep->nbytes bytes. The per-glyph guard validates
+only that the source slice (position, length) lies within the pbitmaps
+source buffer. It does not check whether the running destination cursor
+has exceeded the allocation.
+
+A malicious font server can send overlapping source offsets (e.g. 1000
+glyphs each referencing {position:0, length:64} with nbytes=64). Each
+individual source range passes validation, but the cumulative writes
+total 64000 bytes into a 64-byte destination buffer.
+
+Interestingly there was an unconditional debug printf in place that
+sort-of warned about this but didn't prevent this. Let's remove that and
+instead use the actual check to bail out before we run OOB.
+
+A regression test is included that sends 100 glyphs each referencing
+the same 64-byte source slice into a 64-byte destination buffer, and
+verifies the library rejects the overflow.
+
+CVE-2026-44950
+
+Found-by: Zhixi "Jace" Sun, independent security researcher
+Assisted-by: Claude:claude-opus-4-6
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/36>
+(cherry picked from commit c2d222bb22c623d8a40f3275077fc7e6617f2c8a)
+
+CVE: CVE-2026-44950
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/c2d222bb22c623d8a40f3275077fc7e6617f2c8a]
+
+Dropped test changes during the backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/fc/fserve.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/src/fc/fserve.c b/src/fc/fserve.c
+index abf7d07..0fdc090 100644
+--- a/src/fc/fserve.c
++++ b/src/fc/fserve.c
+@@ -1899,10 +1899,7 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+     fsOffset32		    local_off;
+     char		    *off_adr;
+     pointer		    pbitmaps;
+-    char		    *bits, *allbits;
+-#ifdef DEBUG
+-    char		    *origallbits;
+-#endif
++    char		    *bits, *allbits, *origallbits;
+     int			    i,
+ 			    err;
+     int			    nranges = 0;
+@@ -1992,8 +1989,8 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ 	goto bail;
+     }
+ 
+-#ifdef DEBUG
+     origallbits = allbits;
++#ifdef DEBUG
+     fprintf (stderr, "Reading %d glyphs in %d bytes for %s\n",
+ 	     (int) rep->num_chars, (int) rep->nbytes, fsd->name);
+ #endif
+@@ -2014,6 +2011,18 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ 		    (local_off.position < rep->nbytes) &&
+ 		    (local_off.length <= (rep->nbytes - local_off.position)))
+ 		{
++		    /* Check that the destination buffer has enough room
++		       for this glyph to prevent a heap overflow from
++		       overlapping source offsets. */
++		    if (local_off.length >
++			rep->nbytes - (allbits - origallbits))
++		    {
++			ErrorF("fserve: glyph data overflow: "
++			       "cumulative write exceeds nbytes (%u)\n",
++			       (unsigned) rep->nbytes);
++			err = AllocError;
++			goto bail;
++		    }
+ 		    bits = allbits;
+ 		    allbits += local_off.length;
+ 		    memcpy(bits, (char *)pbitmaps + local_off.position,
+@@ -2041,10 +2050,6 @@ fs_read_glyphs(FontPathElementPtr fpe, FSBlockDataPtr blockrec)
+ 	}
+ 	off_adr += SIZEOF(fsOffset32);
+     }
+-#ifdef DEBUG
+-    fprintf (stderr, "Used %d bytes instead of %d\n",
+-	     (int) (allbits - origallbits), (int) rep->nbytes);
+-#endif
+ 
+     if (blockrec->type == FS_OPEN_FONT)
+     {
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
index 8775d1cc13..17cfc133d6 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
             file://CVE-2026-56003.patch \
             file://CVE-2026-59679.patch \
+            file://CVE-2026-44950.patch \
            "
 
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"

