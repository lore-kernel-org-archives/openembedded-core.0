Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27743C71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.95894.1749584321371611383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zt/+S6fK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so4624993b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584321; x=1750189121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yw49X4cSStN80mOTz3qz0CK3CEv2NRBM0MBq5aWOQYU=;
        b=Zt/+S6fK7lN9HQrQiExXFvHHGRC4Fdv7+aibDXATcctIG3814VvosMMqb3Bg+2zUkx
         cLys1yH3Ud8ApECrpyohVzlczHNyfEL/SR4fGuuyb8M9zKnTgtVYbd1s5ZtfhtEsZY1k
         LZQWJsLUXFeB+lylJ3DjQ2vwHbJxVmZpPn/FzXAo2v1lAyULGXJ+N/MXHvb7cMvRsyi1
         WhooEpaKsYcO3uqM6ZpZcdjQbG6HwsRHHTwbPGOraGT1nyef12gIc4MpsbU5V423fwK9
         7rR1JR5KWUOwYwAiwOAnQcfnHBhdmkLDrCPOpNPqXO9MrizoItw3FTe09Rjh+y+i+EL0
         STZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584321; x=1750189121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yw49X4cSStN80mOTz3qz0CK3CEv2NRBM0MBq5aWOQYU=;
        b=SE6ce2ho7J0ut8ULDkEC7TnZqs3SB641Y4sIxsIGu3KCjimn2I8Zfsln4z8bIwviCz
         3yqCfLj7fheesjSETs/82C88Lw66dX6VC42KRdSEJxYkOEWJlJMp9FE/MX/yIT1Ay2hl
         UTrXmfqdJzvOtlbb5oqt2kif/RRA6U3i3Ek/UHPWE0B0UsLS2X7riHHZTh2bDqFspBy7
         29oBupf6VHFTucIe17UReQPbDMPQ0nsBjHd8YxDWuWfRUPnxVE9NFhGXyZWN48ts0eg7
         H5ms6MeozFQ9UXkqx4Gg1LRwfDavLke0Mzn5yN5o/o7mX4xr9PYxOrq8xLddn/EtLlHH
         Be8Q==
X-Gm-Message-State: AOJu0Ywg9ODRw9GnDAXfftzyoWIrrbOQK0oJG1u9v3249KW7a8yI9xTP
	Fw1ea46NxuQ9J947/t11st06MGEo5dZxarYPDq56Rp1hGf5UA3IF4N2TKd7IqBo6xt8MNjYNdod
	umJI+
X-Gm-Gg: ASbGnct8XFuNlu0BEa1Ohsu/WN6ldgRhWjyWdXJ6lxRNFQeYb0d3/Sz+/qDEEW5fzYO
	aExuqZlddxjD+EP3luHTfhFBrGoPovGRHEiPD9sgIWhBthmouUES7kKqEvpiVfvEklsq3vHg28z
	Lv1TPgB7mjjprNjOm/DSWiVq2+41KkaqvHN3lKmzAK7M+CZ1JNvXEeAkdw5IiVvC2NGiu27k//r
	3xXoMapCQhBlrDENw4nDyVsZehGcbTJD9Sl6Zdmfr88sdDVPJ58TNz6KXy/wCclXUT9H3OTfBN+
	tqj2Sd5e9xkKv04sU8ALsUcCaQsoCNlcq5/uEqPYbWDkCAKq5hCGIw==
X-Google-Smtp-Source: AGHT+IEWawpkmEN7awUVz0wGSeO1JWEXW/rpq7mvh/J2au2iCDaUehh44dVxmhb6mOrbJneBtoBzjA==
X-Received: by 2002:a05:6a20:9186:b0:218:96ad:720d with SMTP id adf61e73a8af0-21f865bd1bamr1219715637.1.1749584320664;
        Tue, 10 Jun 2025 12:38:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] binutils: add CVE-2025-1182 patch file to SRC_URI
Date: Tue, 10 Jun 2025 12:38:14 -0700
Message-ID: <131f93b8efcddac984965a250b5391c43ca54ac8.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218430

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Forgot to add CVE-2025-1182 patch file to SRC_URI in the following commit
https://lists.openembedded.org/g/openembedded-core/message/217350

After rebasing the CVE-2025-1180.patch, we encountered hunk errors while applying the
CVE-2025-1182.patch, so I have modified the patch accordingly.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                 |  1 +
 .../binutils/binutils/0040-CVE-2025-1182.patch | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 01fd03d2f4..085ca2301e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -75,5 +75,6 @@ SRC_URI = "\
      file://0038-CVE-2025-0840.patch \
      file://0039-CVE-2025-1178.patch \
      file://0040-CVE-2025-1180.patch \
+     file://0040-CVE-2025-1182.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
index 682f633927..03604bfdd4 100644
--- a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
+++ b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
@@ -18,14 +18,14 @@ Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
 diff --git a/bfd/elflink.c b/bfd/elflink.c
 --- a/bfd/elflink.c
 +++ b/bfd/elflink.c
-@@ -14711,6 +14711,10 @@
-        }
+@@ -14712,6 +14712,10 @@
+ 	}
        else
-        {
-+         if (r_symndx >= rcookie->locsymcount)
-+           /* This can happen with corrupt input.  */
-+           return false;
+ 	{
++	  if (r_symndx >= rcookie->locsymcount)
++	    /* This can happen with corrupt input.  */
++	    return false;
 +
-          /* It's not a relocation against a global symbol,
-             but it could be a relocation against a local
-             symbol for a discarded section.  */
+ 	  /* It's not a relocation against a global symbol,
+ 	     but it could be a relocation against a local
+ 	     symbol for a discarded section.  */
-- 
2.43.0


