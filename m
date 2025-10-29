Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C97CCF9F7
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:20 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web01.13557.1761768737951649111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pOvJoxPM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a2754a7f6aso403365b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761768737; x=1762373537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOECH9XbPXTcU0bEdNxSTLvqEXe3spGx//ZpSsizkfs=;
        b=pOvJoxPMkX7U4LUFqeML2rmjKaDjjw3Qy5J2L7bOF5jNZEaZNrGrdkwuEkpAmIFFr7
         4k0ftrjafJr1UlnHtHQ1Mq+YaNc1q3C1/agZWd8t17wcnvdj/vSuL2ukUupajHO4x5wm
         DqyEFZxU4JxjGRkEUVd3yQiCmvmGcKOf7iISe42UcYEqWKa+daLPaZRqoMZwkEDbZS0d
         AtJezvEA4zikizOG3acnGMny+4AITiSYg4DXKR0TafSpaob8v94+VrQberglD5FgBrjU
         c1Z2gawS2QqEgRddFMM78/poy2CU17+lvPDcxN8UzV0QBhJlDKbSTJycO0KqD1HbcKhJ
         UvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768737; x=1762373537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOECH9XbPXTcU0bEdNxSTLvqEXe3spGx//ZpSsizkfs=;
        b=NDOdhRCyMYDT6z3evT1fSe6qUCMlqGFDpBjxc+h7N6Dn9XtNu2pa5rxgNDxDXrsLlu
         gxXbQ0Pljl08oQQEeFmpehUExWVyREe5RecDAxvMbcWx7Clf+n4bWBmBWebs1EBGuYP+
         pDnUYCzvAUMIXOk+moVYlT49SwdquFI36p3JK+0CgW/KbxEIcnrt722njpJ9xA5jfGyy
         aCyoRVI0W3wxOim9JedrNLkuI+8bdiNWvluTnzawWe/nTwqIkFLlwyEHKpUekmWVqwj1
         37DDI1T8z7y27L5Uwl3SJPYngSKrR6RTH2BejZk28mUh975abVRt+6IUBfu6cw6O78JJ
         LH7g==
X-Gm-Message-State: AOJu0YwYCnjjfVccjqojUV65R0I+McWcO//1qT9gm7VnPZFEoUfJ4lhp
	U+BjieYVwtjY6ywdGxjnN4If+cRafrhkQWev3S1zOBH1Ep9zYQx7nWzZEivJV+w3nNqsiPytJRO
	fvt3wagM=
X-Gm-Gg: ASbGncu0TYtj81jSSbn3VkVP/cVIiOxp8S0Rx6l1F48dhX6TJFp67WOisjID935QUeY
	SYpftsteILCWFSph/QSc4NQZ/1LL0H42ANKKWrkyg9fnHUO7LEGTChz77siftbhr5v+NQBvZRDv
	cX3vMMkhejOHjc5cmKTic3fMehF3mPDkrdmoVMy89BHrvRLDABwQyqNxYgk6HMj6i+oD3Cx4Bm3
	Em5/YazQTKlUnTHfxJB0EurToJyGjZVdAVLVOwXXjS5KtDkLFXKRupPffDGt1yMFde3l1j0cu7G
	fcVK3z91O0BKtg8jRJkay3ontIYrBw/HN2gmyL/hs7CQLR5G6m+1V4cgCt/JI5XYRXk1xRYfNUr
	aOA/boAOmNb1kZYkdvBY3izdgbm4e8mO655UkSv96mbX+JnsruzKO8EAonF308TBXKI0=
X-Google-Smtp-Source: AGHT+IFU0nBbC9G9csrMOO+g//YqgKPVE2I7fifK6BhiEexVD0ozX6Ab1bkZs1rlRzsJl13If1J9Cg==
X-Received: by 2002:a05:6a00:1826:b0:7a2:7d23:f6df with SMTP id d2e1a72fcca58-7a4e290feb7mr5294604b3a.7.1761768737170;
        Wed, 29 Oct 2025 13:12:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087d2asm16522100b3a.63.2025.10.29.13.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:12:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/6] tiff: ignore CVE-2025-8961
Date: Wed, 29 Oct 2025 13:11:54 -0700
Message-ID: <1ff4b39374a5b328069a928e7234c3397769dc6f.1761768602.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761768602.git.steve@sakoman.com>
References: <cover.1761768602.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 20:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225469

From: Yogita Urade <yogita.urade@windriver.com>

This CVE is for the tool which is removed in v4.6.0 via [1] and
re-introduced again in v4.7.0 via [2].

[1] https://gitlab.com/libtiff/libtiff/-/commit/eab89a627f0a65e9a1a47c4b30b4802c80b1ac45
[2] https://gitlab.com/libtiff/libtiff/-/commit/9ab54a858049bef020d578c71d82669531551c00

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 9957699fb2..777783d7cc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -29,7 +29,7 @@ CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://secur
 CVE_STATUS[CVE-2023-3164] = "cpe-incorrect: Issue only affects the tiffcrop tool not compiled by default since 4.6.0"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_REMOVED_TOOLS"
-CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851"
+CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851 CVE-2025-8961"
 CVE_STATUS_REMOVED_TOOLS[status] = "cpe-incorrect: tools affected by these CVEs are not present in this release"
 
 inherit autotools multilib_header
-- 
2.43.0


