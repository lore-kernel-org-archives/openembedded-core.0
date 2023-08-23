Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECB8C3DA6F
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.13095.1692801434390704493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=shWu74so;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c0bae4da38so1556895ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801433; x=1693406233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GILTXznheZEP3ekxEKmpgm/3Sa4JusAozg7ktYhIGPo=;
        b=shWu74sorsPQzwBeNgWtUNZE19SUZY44jof9Cy1SRfc6+yEOLgaAGHy9RQzrD71oOQ
         bfZsHdS22C77cHAqWQeaMzuUKVyc5bOxo7fZeYZFO+PUSasr4NqysLS9hgiwSyGuUx+s
         j4t/0fBu0eb5ywKwTbFMNcg9nX6a8fSp7Dc22a//RFAs+zfGNZDQPSugto6mFXlkNItg
         s+Z6dge3wj/rfciO7QdhVG0mwF/OSoBaD8imPuui2q959SIHuAGOBGLQwGeLuRP4wg7P
         Gb+x4xmtJhqkUR7xGflzO83Ur0sXNc/oBdTM/hqqA8kQVm6IU9IK444S/S8Hg3VMdwMf
         NMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801433; x=1693406233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GILTXznheZEP3ekxEKmpgm/3Sa4JusAozg7ktYhIGPo=;
        b=X2WASRwJ0XswQ3YlpWlNGu8MEFnbBMMIEHaVftUasvQ9KsyvFA8+M9aluUKovsk4Ed
         CxcxJdbDTV5rBZ15f5PKGTFkWYSFLbAtGcDed03uuhTeWrkfBo16RY6yrgjnMYf7Ujo3
         fD/EONR1LsGDoHCBuPyoZYQxsbrMN3Gdylr+jZxrN4Tb6Aft8cKyrZlJXk1tC/m5GSrw
         C5LgFs1+QEUsa2pZbCzuWP6++7EWM7gnx274w2wP2IkF52ZS2ouIE5V6xPQmfCeuf2c6
         LF5YcB6rp85ujhNLLORhQ5cs/rp8RCqYbE7370C/psxw94tgaOy39pSFpzppwUCf8K81
         hc/Q==
X-Gm-Message-State: AOJu0YzI+fj7ZvyENaNDypP0MWSaBT4U5dRrBD29qWJSq36JP7b/aFBX
	AQOnba528tpk1nzYtKw7slU2q4BhlLTf8xgiH98=
X-Google-Smtp-Source: AGHT+IGNEOGvc0PdfZDVQgTwEBoL7iCw9e0dN76+p2tNn5ToPhfvdP5Mlhzy/ApbaWpbx71tUZIsYw==
X-Received: by 2002:a17:902:c94a:b0:1b7:f64b:379b with SMTP id i10-20020a170902c94a00b001b7f64b379bmr20580787pla.17.1692801433552;
        Wed, 23 Aug 2023 07:37:13 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/36] kernel: Fix path comparison in kernel staging dir symlinking
Date: Wed, 23 Aug 2023 04:35:56 -1000
Message-Id: <cf2267f80ec44b24c627347df7efbd492a07dcfa.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186607

From: Staffan Rydén <staffan.ryden@axis.com>

Due to an oversight in the do_symlink_kernsrc function, the path
comparison between "S" and "STAGING_KERNEL_DIR" is broken. The code
obtains both variables, but modifies the local copy of "S" before
comparing them, causing the comparison to always return false.

This can cause the build to fail when the EXTERNALSRC flag is enabled,
since the code will try to create a symlink even if one already exists.

This patch resolves the issue by comparing the variables before they are
modified.

Signed-off-by: Staffan Rydén <staffan.ryden@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit afd2038ef8a66a5e6433be31a14e1eb0d9f9a1d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a82e4cf942..f7d199e917 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -176,13 +176,14 @@ do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILD
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 python do_symlink_kernsrc () {
     s = d.getVar("S")
-    if s[-1] == '/':
-        # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
-        s=s[:-1]
     kernsrc = d.getVar("STAGING_KERNEL_DIR")
     if s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
+        if s[-1] == '/':
+            # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as
+            # directory name and fail
+            s = s[:-1]
         if d.getVar("EXTERNALSRC"):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
-- 
2.34.1


