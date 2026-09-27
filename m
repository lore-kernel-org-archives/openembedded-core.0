Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4B6CA5FA3
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32855.1790495025287474914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hw8utQ92;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887d06c669so1576312f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495023; x=1791099823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uHWIKBHi2HOlR4eEKUSrqGZswLFireko1xikBLg3V+c=;
        b=hw8utQ92EmiqymkZConPHq/LdIDXlizd8UoNm1kV7dDXeWetBYsK2ctrmh4i6H5vnw
         RqyWTva7ONlIj/Wl2rb6F0s0RZ29ango4JmvZ0HB2IFvTfebu7pYkxdM5xlRGZyTYO4m
         UdQsoUQHm1BydfmXO7MTbZP23WOzUKAvEAuz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495023; x=1791099823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uHWIKBHi2HOlR4eEKUSrqGZswLFireko1xikBLg3V+c=;
        b=hYcVfywOOkr/wlof6BQEeZx8115JEtUaldQVaYk2MeOZydlrF+zOuZEmKsO9UZB/N0
         9IteEWFmJXiMuouzBswoJH5Ak1HdVVlQOZ+wQhB5DksMtochpXFMfK42bExuFXw4SbSB
         919diw43AYy4rddKt494WChRBkxq1stAP4VbRr5GHTIjcczQnYvJw+Vx0U4UXBdmkzPS
         q6iQn4JeVHWWgMD7Rl63Q3NWfSAi3NqPCp18MCqppBFnLYIH/cPjf1oeUpaEPYUuJ4Uj
         QA5+HyXvA1WeELCB3nFxml8pAyo9loVLH6vkvMKMFXWuPSh9SeITtjWCqwoVeUIpQYCL
         EjXQ==
X-Gm-Message-State: AFq9FYJI20NIB34lapcXTRk88XSshIQkafo7EyqhlJaUWgiIQtP9w8UF
	Tn55NFlclPEkd1qFnVJT7bzP5JKV0c4PCdIP9tnIoxIBD2n1dtHXau4qMZztcxCod6FiAfw7stl
	zfEnMM18=
X-Gm-Gg: AYBFou0uYtLYxJ4uLgQG3EGq+A3e7w5wjUJ59hY5qAecfxiLUaoqfWlcUF709/86FqE
	qDKr/gn118/q08m/TfPbSi3SW8JbLBWl/TZwWjy6kSsEWrjwHSxpFP0pGl80SeYA6wXOP1hFoqz
	R/BQeBWw2JGcsL8/RG7gL1rHjr2zZedVs6o5q0YeLMNDCqvpsI4psylHzSBIRnTsCiO8z/Bkbpl
	XioQsD5a2+90nM84kvlq8IonE6q6yeNX6hf29s43BWnpjepbpoyNAM2C7A7xErJ8hfUj0GmYLxt
	akyclPPguh79GyplWgxXHSjBzYRef+zA98UbyVMc38HBLYI/WJNjT/i40C4fufvC9fMzowy6szJ
	+RewM/eqiiSF4hzcQhXaNc0JdsQpZ21DkI7Lgh8qVdywwXs7KLSC/6wBdPg76sOiJM538KHWTXK
	evPJE68jHmLiNbuq0vbK4hj5MoZbZcE0X8EveE1KTCba9yTDdXLZ2mGwwcOm+mMbCd7FHzeeG2c
	osjrIu9zVeELjV2F/hYr5JlKLWCPpB7faM5PY1TsMYEYlGEx+PX4pI4xLQT/OfGCV/h0pnNBQ==
X-Received: by 2002:a05:6000:41d1:b0:488:5db4:791e with SMTP id ffacd0b85a97d-48872a5c50amr18058057f8f.11.1790495023399;
        Sun, 27 Sep 2026 00:43:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/28] libxfont2: patch CVE-2026-44950
Date: Sun, 27 Sep 2026 09:42:58 +0200
Message-ID: <8d24302fac46c0cbb94b930465c139d1cc1b7e6e.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246657

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the fix.

[1]https://security-tracker.debian.org/tracker/CVE-2026-44950

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont2/CVE-2026-44950.patch   | 99 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-44950.patch
new file mode 100644
index 00000000000..96e3c1f0a85
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
index 8775d1cc13d..17cfc133d66 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://CVE-2026-56001.patch \
             file://CVE-2026-56002.patch \
             file://CVE-2026-56003.patch \
             file://CVE-2026-59679.patch \
+            file://CVE-2026-44950.patch \
            "
 
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"

