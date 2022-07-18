Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1722CCA485
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.28226.1658155764587267173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NRjc06sV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id b2so9227365plx.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bwe8CmoQs5AlWfzKgxmqBVVKQ048oFgZLVNKG+Z1ooU=;
        b=NRjc06sVZdBGUprIt75cnJJCJ/WuCiD41ZoZQbUo5As/bf7lx51hnZbyGF3B80GKMj
         RyOnDejsBkpBQB2eZsiKvV+Eo1a4mV8rso/3C+bpW5fNmBYGNKUAwDz+Q6Rz8UXWHXmF
         KcMip0VQJQ2gzjvhbGlplDFv297lkfzxJgWPXyy1jvLk4Tz6LVDzPTHJ05q4D3/v/Z0C
         y38o3Y0YATdq2y95CHwWPT/1HJDxgV3gV69tsoXIPSYkbyUpc1Oefyccjzfbj9HxLiAg
         6yKJDHihePtY0s9T4femhWVloCqXB30D0YSQAAGFYYJRrDSt46cPNUa+dPrqgjgcOaw8
         DGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bwe8CmoQs5AlWfzKgxmqBVVKQ048oFgZLVNKG+Z1ooU=;
        b=7xqUFd4L8o+a07Y5fOBclEbXoYjX5D970C5UqSNBjKkBBK3sYUs6VABKY7QFf37LFy
         6t/s4aJGeicEA9Hc25oSXt1vAznZ7gQHmlbyy5C6EPywJtqnXPTqFjz7miRG1dmGj3ui
         fFb1+xievzxbdoSPcVvXhcfWRzJf3cC/3VlgGDEPPF9B1f/mRSsrVhKGqpTG06o5F0Gl
         yzwq2EkzUk2UxWqaBNu6YWhwx1B24z/zMjhBmaJd9jJSz9c00BtT+SMCAKiwA1f4ZbYa
         CdSEcsKw67W4kN+5ubDj9KzKBScHUfi84Wp5XNccsFy7/EiJVKGCIrUHPx8g5yF/5fnm
         tkMw==
X-Gm-Message-State: AJIora+ew8FlWMyxRTIT4zmSlctBctBRMM2Z1zJSH9DR64HmBBKHpefd
	gUTkbRbMyOtCHYP5cee21IFnbXvU5tUeHU7a
X-Google-Smtp-Source: 
 AGRyM1twWPMrolBv0b11AwK+6/WOJFu43aVBSB/MTKwPONH8b7XAIj6oF0zmubk/YfSFVq+fDUyDNw==
X-Received: by 2002:a17:90b:3a85:b0:1f1:64c4:e56a with SMTP id
 om5-20020a17090b3a8500b001f164c4e56amr16763031pjb.139.1658155763496;
        Mon, 18 Jul 2022 07:49:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/35] harfbuzz: Fix compilation with clang
Date: Mon, 18 Jul 2022 04:48:27 -1000
Message-Id: 
 <7505ac6da37ba00d4dad74a0312ca20fc17e64df.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168202

From: Pavel Zhukov <pavel@zhukoff.net>

Fixup commit for prevous CVE-2022-33068 fix.

Fixes:
| In file included from ../harfbuzz-4.0.1/src/hb-ot-face.cc:39:
4429| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
4430|       if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
4431|           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4432|                                    ||
4433| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: note: cast one or both operands to int to silence this warning
4434| 1 error generated.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../harfbuzz/0001-Fix-conditional.patch       | 25 +++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |  5 ++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
new file mode 100644
index 0000000000..0f9b86973b
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
@@ -0,0 +1,25 @@
+From e421613e8f825508afa9a0b54d33085557c37441 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Wed, 1 Jun 2022 09:07:57 -0600
+Subject: [PATCH] [sbix] Fix conditional
+
+Signed-off: Pavel Zhukov <pavel.zhukov@huawei.com>
+Upstream-Status: Backport [e421613e8f825508afa9a0b54d33085557c37441]
+
+---
+ src/hb-ot-color-sbix-table.hh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hb-ot-color-sbix-table.hh b/src/hb-ot-color-sbix-table.hh
+index 6efae43cda..d0e2235fb2 100644
+--- a/src/hb-ot-color-sbix-table.hh
++++ b/src/hb-ot-color-sbix-table.hh
+@@ -298,7 +298,7 @@ struct sbix
+ 
+       const PNGHeader &png = *blob->as<PNGHeader>();
+ 
+-      if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
++      if (png.IHDR.height >= 65536 || png.IHDR.width >= 65536)
+       {
+ 	hb_blob_destroy (blob);
+ 	return false;
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index 81518a53ea..b639c276db 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz\
-           file://CVE-2022-33068.patch"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2022-33068.patch \
+           file://0001-Fix-conditional.patch"
 SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
-- 
2.25.1


