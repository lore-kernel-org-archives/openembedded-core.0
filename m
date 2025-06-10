Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9ADEC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:39 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.96523.1749584310180260801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GJFO0SZ8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c4476d381so197340a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584309; x=1750189109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jkSVEdjphHODdTmOhvbvSR8WE0eRj2aIRxQ5J173/s=;
        b=GJFO0SZ8R9wN04NEsVkL9UlvugSaUoVyRoHuPIbXYzkjHgXu8OWw6KFEJwocNQsqkv
         t4mlw4B5DCdzdRnI8GIPl59KpDkwrs0pgLqlQyCTZNFJCmMxtHpJwN+/jCL0LrHNM8uW
         2iWAX5VgXMyX8Y9BaTx3Kai7N3n96T2SgRqOuoFQwYHUhjFhVxG9Iwg+DNR5KDQYH1aN
         40Z687ruQBjnDjSWGcgxJpcHayXeFT06QHePVDIh/M3/PaDHwQrDdJXv/tQDA2MlqJNc
         VmzMBSGJxSLdDYSUTQGj0LkvueF1sNTF0GR6mJkvrfUYhwVo9deYy6uSAiOTFd3xbFdY
         6/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584309; x=1750189109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jkSVEdjphHODdTmOhvbvSR8WE0eRj2aIRxQ5J173/s=;
        b=P5mLVaM5h4JCmJSy6498/Zq7Cso9lmzkeBMjni6bqYfCV7c2hzPZSZbtPCQ77CnYCc
         WinkDiX0hzG7R8/ilX1vpktFAnx9FieJvOSifPKnAS7RgHfTAxPi2OPHBsPb1/XRrGUU
         hnl/mEtu73BGqOWczUH37v03M+1fPjqqyxNggfllsHiebBClaKCEWdimVLXrVhv0QOml
         vHte7PgwXEA7oHGDRl8/UGFiRF80TR8Km0/w5DJYQ8jhasevKEKiSfb+pQvpxflGljgP
         yL4J/HZDfRDYdSqkkMxfAoRaAHEteqRF9IT0jnLnPpWNtFpkQ0yR6woHu7evOHNwb2+6
         VNUA==
X-Gm-Message-State: AOJu0YzaKG3JCXQYq04vYFJbcDf9VGlziX30eg0TCnzwRQfy8CKtoLmR
	RfEEnmucOTNn1BlcVvDvxcem/xR1oR2HvEPmgHQxW6LGPz/ZgtYWRUXvF7itQAM0L7+cNyb+ktq
	SEORh
X-Gm-Gg: ASbGncuxC8BtG7+inF6/lsArtCCH6ETXNweYkM8p98nYIQU2DyVIRZnl13LtV34y4z0
	/YbxR6BF27Pia4u00lV8BmX+GaTgzhlGaoyoGZyYSH6+K5bOXjeY4svJC/7EylTKiYlA/Gfx6Yz
	xGFZ41Fnenc+73fwAcQw+Xyzmmu3uAxU6DpX8xrkz66GiS4TGeldvimX4p82L073C7YjTdmYuNO
	kxQjp1Saz3mKsWAJD7JMPwAS3QUyPuCOGppddyPrcQA7Pv/HZkTL5DpMZdmRdNZStIjy+8tQa9+
	qtLffNKgeaWr8IO4wbHSPWpWAhWNleWFjZbY/J5ww25PXyps1uP6AQ==
X-Google-Smtp-Source: AGHT+IHyMheW95s4tggKq6dAmB4H4JiWF5tPMgd/Q5P0re2QEQVJAy4SIJVqD3zrnp/HDOJ1BHcMAw==
X-Received: by 2002:a05:6a20:7d9b:b0:21f:5283:4fa5 with SMTP id adf61e73a8af0-21f86dea0fbmr938326637.3.1749584309403;
        Tue, 10 Jun 2025 12:38:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] ghostscript: fix CVE-2025-48708
Date: Tue, 10 Jun 2025 12:38:07 -0700
Message-ID: <7052a81e4f9b19b5640b414c10b19f8232d81572.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218423

From: Archana Polampalli <archana.polampalli@windriver.com>

gs_lib_ctx_stash_sanitized_arg in base/gslibctx.c in Artifex Ghostscript before 10.05.1
lacks argument sanitization for the # case. A created PDF document includes
its password in cleartext.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-48708.patch          | 46 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch
new file mode 100644
index 0000000000..5c8069a4ea
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch
@@ -0,0 +1,46 @@
+From 5b5968c306b3e35cdeec83bb15026fd74a7334de Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Sat, 12 Apr 2025 10:24:43 +0100
+Subject: [PATCH] Argument sanitisation - handle '#' as per '='
+
+Bug 708446
+
+CVE: CVE-2025-48708
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=5b5968c306b3e35cdeec83bb15026fd74a7334de]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gslibctx.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 2cf5c9dda..40ff984f9 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -1225,9 +1225,9 @@ gs_lib_ctx_stash_sanitized_arg(gs_lib_ctx_t *ctx, const char *arg)
+         case '-': /* Need to check for permitted file lists */
+             /* By default, we want to keep the key, but lose the value */
+             p = arg+2;
+-            while (*p && *p != '=')
++            while (*p && *p != '=' && *p != '#')
+                 p++;
+-            if (*p == '=')
++            if (*p == '=' || *p == '#')
+                 p++;
+             if (*p == 0)
+                 break; /* No value to elide */
+@@ -1269,9 +1269,9 @@ gs_lib_ctx_stash_sanitized_arg(gs_lib_ctx_t *ctx, const char *arg)
+         case 'S':
+             /* By default, we want to keep the key, but lose the value */
+             p = arg+2;
+-            while (*p && *p != '=')
++            while (*p && *p != '=' && *p != '#')
+                 p++;
+-            if (*p == '=')
++            if (*p == '=' || *p == '#')
+                 p++;
+             if (*p == 0)
+                 break; /* No value to elide */
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index e872fbe88c..3b50ac1409 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -73,6 +73,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27835.patch \
                 file://CVE-2025-27836-1.patch \
                 file://CVE-2025-27836-2.patch \
+                file://CVE-2025-48708.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.43.0


