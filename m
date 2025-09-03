Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5E5CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.16913.1756916108928903820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XOIB/gyn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7725147ec88so17209b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916108; x=1757520908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BVMBGKWWWvyQfU/SSIrep2QondFVWsD7cXXjTGupss=;
        b=XOIB/gynSGljx6HQTygPvaxLXDvWjQxQPsNZF2lDWvMem9fOg7qkIhoesey7MG2vau
         l0Ejj1r6a4cMwK5gk4gowQBXqJk6DIcbUAbxQTFxvjgUKbFHCgrgyFjaR9xvWAjZr3TB
         GRwQtdesimufOcf2vVIKnNKARRt0p/rExb1B1+LlajxfW60kitDr9lRR3TwYDZDICH3W
         RYC3mDkpsSaP/Uqp2/dtngpWswzZ3DKmLV84TkrMxjHM0DGo+UbGePLW2CxF0n1Tk+pS
         7D9w9oT3DpiN55e4SoJN5kQ5LVewaQsFYS8wu9cOzUs9vjljn+HWYDCeSQLYd6ak4rlR
         FngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916108; x=1757520908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BVMBGKWWWvyQfU/SSIrep2QondFVWsD7cXXjTGupss=;
        b=sZSECJ5YCoVyBqgb0lQLoEZ1xT1GdDJEVLfYKy8n7Ku5xtyUmC6wGp4f1leYIbJhRs
         J0mcQs+R+TTrPPD16u/xulC4jxAIkuyjkfdgFDHRXWiVHgEFmvW7/0XWEzfveYQFbbRW
         bTnYeEowfHHs/p5rIsz8jpw15QzhI2uXnwqQQ3EX7UwgMRZvg4rpys7KtcDJxH2mLGcD
         fnBS3wFM1ZWtNSpSeg5tgGTUjCx723DMqLl+vGKz7DpnZyJzU4xumRWYTbPZNkenpU35
         /Jq4v0+/O1kuuQcFYRWWWpQCwEyLmBJEZaBSh7zviQ+O+CdNTNznw4qEEtwDPTYdIqK4
         T6uA==
X-Gm-Message-State: AOJu0YwXMeLc0B29jrtZ9aMXuHPRFfaB7TX2bNYQyo5CM+tb1cJV3F3t
	nNyYP07HhxO/v/ZAVyHow9LwGgCmU91sNsragMQH+a1tFsMqJkeQvQSKQx5xEX9Btr+JQ7rf1pP
	AJ7YS
X-Gm-Gg: ASbGncviiPdpgkpmDKPOiU9i2i10Ut1vTBWTnSf2HLkeh1ZxdOJkUu1jVzc2/NqrFPV
	8wXd7miWHfb7pjy3tWmJbEZdR85aS5TQ/+LnVtykPch3nj522ziZya1jt9hdwFpZquBOrK5u6rB
	8g+S75rt2Wj4bo0YVjfQilvHrfhcHUMAtkO6GDpcwu6XltgAXadJUjM65kQFeqw6lOR8vNbDWJG
	4+tZjqigFYwOxBk3i/uS7gvDoMQPYW0dssRNVI7QunYrovEQPZf+sf8R6odpDSU7d8n1Q9Bepxt
	s29bxVk5FJxAO1rlNWgCyAXoC2TazRE27W7/L4SXmemAQnM5FpIqmPsO5+XFnd0xd1UI31IAvTy
	rJIkuoaJyJ3kO0dEZhIJhIhO/
X-Google-Smtp-Source: AGHT+IFHZvh+gpRJ7n2gyAE2NW5+edh80KVOdeqnWBjafCV4BFvjzUVMXL00mfqsjQvFYsr55qLTXA==
X-Received: by 2002:a05:6a00:2e08:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-7723e24fe9emr18211955b3a.4.1756916107681;
        Wed, 03 Sep 2025 09:15:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] tiff: fix CVE-2024-13978
Date: Wed,  3 Sep 2025 09:14:51 -0700
Message-ID: <f6ff692be6b08290845b6c6c27eaf5d676476464.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222866

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
as problematic. Affected by this vulnerability is the function
t2p_read_tiff_init of the file tools/tiff2pdf.c of the component fax2ps.
The manipulation leads to null pointer dereference. The attack needs to
be approached locally. The complexity of an attack is rather high. The
exploitation appears to be difficult. The patch is named
2ebfffb0e8836bfb1cd7d85c059cd285c59761a4. It is recommended to apply a
patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-13978

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2024-13978.patch         | 47 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch
new file mode 100644
index 0000000000..3a4845d415
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch
@@ -0,0 +1,47 @@
+From 2ebfffb0e8836bfb1cd7d85c059cd285c59761a4 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 5 Oct 2024 09:45:30 -0700
+Subject: [PATCH] Check TIFFTAG_TILELENGTH and TIFFTAGTILEWIDTH for valid 
+ input, addresses issue #650
+
+CVE: CVE-2024-13978
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiff2pdf.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 63751f1..fef28d1 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -1255,9 +1255,25 @@ void t2p_read_tiff_init(T2P* t2p, TIFF* input){
+ 			TIFFGetField(input, 
+ 				TIFFTAG_TILEWIDTH, 
+ 				&( t2p->tiff_tiles[i].tiles_tilewidth) );
++                        if (t2p->tiff_tiles[i].tiles_tilewidth < 1)
++                        {
++                           TIFFError(TIFF2PDF_MODULE, "Invalid tile width (%d), %s",
++                                     t2p->tiff_tiles[i].tiles_tilewidth,
++                                     TIFFFileName(input));
++                           t2p->t2p_error = T2P_ERR_ERROR;
++                           return;
++                        }
+ 			TIFFGetField(input, 
+ 				TIFFTAG_TILELENGTH, 
+ 				&( t2p->tiff_tiles[i].tiles_tilelength) );
++                        if (t2p->tiff_tiles[i].tiles_tilelength < 1)
++                        {
++                           TIFFError(TIFF2PDF_MODULE, "Invalid tile length (%d), %s",
++                                     t2p->tiff_tiles[i].tiles_tilelength,
++                                     TIFFFileName(input));
++                           t2p->t2p_error = T2P_ERR_ERROR;
++                           return;
++                        }
+ 			t2p->tiff_tiles[i].tiles_tiles = 
+ 			(T2P_TILE*) _TIFFmalloc(TIFFSafeMultiply(tmsize_t,t2p->tiff_tiles[i].tiles_tilecount,
+                                                                  sizeof(T2P_TILE)) );
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 4c9c212312..d5ae82bc7c 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -59,6 +59,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8176-0002.patch \
            file://CVE-2025-8176-0003.patch \
            file://CVE-2025-8177.patch \
+           file://CVE-2024-13978.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


