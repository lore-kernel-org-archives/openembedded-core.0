Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D24C3601C
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.73.1743546990081550106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aEjbHRqz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22403cbb47fso127287985ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546989; x=1744151789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwbq9rf//QDFD7M/oDnyD7Pwfi0DBuw0dKpMXDzdIUw=;
        b=aEjbHRqzsfaYozfLow5bFj4GTyE/9TON965tqx6UFSeIEL/LQZimN2dp41pdx1H0AK
         4UW415oQ56uXHme/DSBiysmL9VIawoTTJ2vi7arsxmaSkkSTE6XbyjQ/4Gy60MakeBSb
         kGA3YWfKF82+33f/YJHfrq7n1jDm+ceEfr2c/209I6GhsaGibF3RCWh9aVfQ7/RvRyww
         wijfOzndbSJ/CaHm28Nt0wXSARsnsGFZ3wKl1ABzasbpWrGBXuLwd5TzFxf+AGM0kEA+
         Bv1j3IOJzo7csuIMW0BSTJJuQm9MtxNEp00U9Fii+euSYRAIcaaSb/9iFHCYS7ZH8vWp
         wzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546989; x=1744151789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwbq9rf//QDFD7M/oDnyD7Pwfi0DBuw0dKpMXDzdIUw=;
        b=eQ2A1LDtt5lPe3wdBqGHX7bPhR8pFDox5D+jT6f1w/uYP4Nc5+JZs4TTU79ZfrO6K4
         BC89f9GDKYkDfyoyLpzaEKF0AQ0E4s5F9hR8lCdYoMpnkqT017TEj60dIvdL0x+HfwKg
         XgaD+yz0PKkhGHiGd/Cu3MnSz4ky3K1oBgtxcwlepg0eKa0LyAPfu9zY7HTzQDT8Bv8d
         kdPw0f7iQfg5lrFD/ssPHZB/C+KTYzMdF5SEyCyZwXe/YasP26kD3qIzgKTZpE5T5iQD
         TjMPQIn/n593hUhjxMSffczCSMlaoh1FAwGx5l7G8mfyRfJ9wU2cYozGlLjYos2bAqi5
         Xf1Q==
X-Gm-Message-State: AOJu0YyoA71JR+bf6LRVto2hzFYEARDsJ1fL7oU0AiaHAF4fqxoFkRBe
	dyCILShWpydzfl5QQu1FysFa7S7X20CK5LzcjK1TxaGknELRQhgP1w/8TOrdVBseohl9ELwi/gU
	P
X-Gm-Gg: ASbGncu/tTxxW08rEoUabcjtMvV62Ahqkguo8Tb47MoauU3rMN2GKHh6JtCsviC5pyc
	2FqR3qcoy8n5bR9wOh5u9Lh4ytZGWXj/FB7b4ipD9ghvQXuzlXU+2G/+QHBg+ETDHKJVftbc/KL
	wVM6T4UV3OHYN67kquuPalEmCo0i5aW/iFl2eXjpm3oVgGAdBMuLsYCbO7yxFD062BiN8ywLLN2
	laDprh41VxFyQ5qc72sxyIjL8wOznj7+6rS1rADktZvnO6aHF0TjGkodysiK4Tmm0t+2p0yMHGo
	9lyg4HDcPcAn3sfxzxchQgZhmI/UxH7qA0Cm/tleUbqKMCI=
X-Google-Smtp-Source: AGHT+IHrzbqKp0UwVCEagnaf1w7Xl5mgVWyNBO3zD7gZbWq3eVIIdxhVTZxPmy04w0+NOX3hNUR+zg==
X-Received: by 2002:a05:6a00:4f81:b0:736:532b:7c10 with SMTP id d2e1a72fcca58-7398046286emr22165508b3a.21.1743546989242;
        Tue, 01 Apr 2025 15:36:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] freetype: patch CVE-2025-27363
Date: Tue,  1 Apr 2025 15:36:11 -0700
Message-ID: <5a8d4c7a9a0e099da0294141cf5590b55f0503cd.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214156

From: Peter Marko <peter.marko@siemens.com>

From [1]:
An out of bounds write exists in FreeType versions 2.13.0 and below
(newer versions of FreeType are not vulnerable) when attempting to
parse font subglyph structures related to TrueType GX and variable font
files. The vulnerable code assigns a signed short value to an unsigned
long and then adds a static value causing it to wrap around and
allocate too small of a heap buffer. The code then writes up to 6
signed long integers out of bounds relative to this buffer. This may
result in arbitrary code execution. This vulnerability may have been
exploited in the wild.

Per [2] patches [3] and [4] are needed.
Unfortunately, the code changed since 2.11.1 and it's not possible to do
backport without significant changes. Since Debian and Ubuntu have
already patched this CVE, take the patch from them - [5]/[6].
The patch is a combination of patch originally proposed in [7] and
follow-up patch [4].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-27363
[2] https://gitlab.freedesktop.org/freetype/freetype/-/issues/1322
[3] https://gitlab.freedesktop.org/freetype/freetype/-/commit/ef636696524b081f1b8819eb0c6a0b932d35757d
[4] https://gitlab.freedesktop.org/freetype/freetype/-/commit/73720c7c9958e87b3d134a7574d1720ad2d24442
[5] https://git.launchpad.net/ubuntu/+source/freetype/commit/?h=applied/ubuntu/jammy-devel&id=fc406fb02653852dfa5979672e3d8d56ed329186
[6] https://salsa.debian.org/debian/freetype/-/commit/13295227b5b0d717a343f276d77ad3b89fcc6ed0
[7] https://www.openwall.com/lists/oss-security/2025/03/14/3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/freetype/CVE-2025-27363.patch    | 44 +++++++++++++++++++
 .../freetype/freetype_2.11.1.bb               |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
new file mode 100644
index 0000000000..28fc50c0cb
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
@@ -0,0 +1,44 @@
+From 26b83ec58c60ced0e6c423df438227fb33ccca2e Mon Sep 17 00:00:00 2001
+From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
+Date: Thu, 13 Mar 2025 08:41:20 -0400
+Subject: [PATCH] fix OOB write when when attempting to parse font subglyph
+ structures
+
+Gbp-Pq: CVE-2025-27363.patch.
+
+Source: https://git.launchpad.net/ubuntu/+source/freetype/commit/?h=applied/ubuntu/jammy-devel&id=fc406fb02653852dfa5979672e3d8d56ed329186
+
+CVE: CVE-2025-27363
+Upstream-Status: Inappropriate [cannot do exact patch backport as the code changed too much]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/truetype/ttgload.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgload.c b/src/truetype/ttgload.c
+index 11968f6..f5aa292 100644
+--- a/src/truetype/ttgload.c
++++ b/src/truetype/ttgload.c
+@@ -1948,7 +1948,7 @@
+         short        i, limit;
+         FT_SubGlyph  subglyph;
+ 
+-        FT_Outline  outline;
++        FT_Outline  outline = { 0, 0, NULL, NULL, NULL, 0 };
+         FT_Vector*  points    = NULL;
+         char*       tags      = NULL;
+         short*      contours  = NULL;
+@@ -1957,6 +1957,13 @@
+ 
+         limit = (short)gloader->current.num_subglyphs;
+ 
++        /* make sure this isn't negative as we're going to add 4 later */
++        if ( limit < 0 )
++        {
++          error = FT_THROW( Invalid_Argument );
++          goto Exit;
++        }
++
+         /* construct an outline structure for              */
+         /* communication with `TT_Vary_Apply_Glyph_Deltas' */
+         outline.n_points   = (short)( gloader->current.num_subglyphs + 4 );
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 29f4d8dfb7..22158511c1 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
            file://CVE-2023-2004.patch \
+           file://CVE-2025-27363.patch \
            "
 SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 
-- 
2.43.0


