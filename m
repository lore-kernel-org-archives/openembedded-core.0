Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D556C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12677.1784134079306668911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ltm21sHl;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a116bd18ebso1291727eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134078; x=1784738878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rt3acAGZlMP544ezc0Y5kgzCfuz8EKGwNyEGxX+UFaE=;
        b=Ltm21sHlilqtWGhoaWKRkMUwI6Iw4btaWZhbuNTfp+J+J9rDT7hLbO0XhxxTU+500T
         Jg9D1vdb/9U/xY8l5v51iNVH2i/RKDw8MI9TO48gtiITYapNfPlKxwI3pLnDNdc6+BO6
         O9MjpkfdX4rigL766SxTTUgau8n7iFqwe/1V5YZlBbpr0vSRkw8vOTVIOm6snuBer61E
         xDf86yVEJHbJDE8XheIKhMBpcsqQ8nXR+MTZDTa3b/kJSV8dWIoS0Zv2aB9czNefWZE/
         Nloit18GXCWzoA4W9HShShsp2ubRSiCshUdjH+tts9kpSIqpyZe+Fq/W8jqypPWgwUmA
         ds/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134078; x=1784738878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rt3acAGZlMP544ezc0Y5kgzCfuz8EKGwNyEGxX+UFaE=;
        b=JTyRV/cloG26XBPhXvqj26MIdBBWA7maxoCTEyh5/334a4v47hcyjANP053vcekPRo
         4DVDcHykuFTdyGf1tlEQMppBMoMOmK8HW/u9bDhAj+0oj9eAmzBQxdxj4jaa8N7GwSWt
         NeAicpW7XayNmBU52Qe2GZIO3m72qzcGKSJC2AhJ391cC7lzHgT4m+Sq74gi8gkVhO4O
         pta2NH87n3mNuggR5kG95oaNBeXil6mas4Co8KzEwqhd+28gqcetX1g7OyYeFEXZ5Rwr
         bBGEADznmZ8ZxVEPpLooGAc+BMQQCZJPXvNsGfevKAUhlEaPCpubVX5QV39ZbnVSUYBP
         JIGQ==
X-Gm-Message-State: AOJu0YxVjpHADgLLi/xj7MCp0xO29kgQR3zmMLoWfWbqpg8lo/4wp0lR
	yoK9OyA2HKdrKUaTuyqAfz7VdpkHRBQncqxWe3HvGq68P+cNjQvvx0zEzo0SLw==
X-Gm-Gg: AfdE7cl01DW31t9Uncwe4/mPbVKHRwf5vHYdPdeQilUWAdYf9RhFhUFV8i1CaU/xm+j
	0GuxApSeB0P83Y+ymQaFE9zHGTDM8fBNdZEkC1YoLusbhZwHW+W1hfkLmwvZvLoYteJsAskancu
	Hr07mCFm+g5YpslN+MvoLIRhAE1Pge9m5r67lbM+6rr1y/wgiIv39rSKE45u/LwkoRANNZiaNt6
	XAB5IZaRdldgsfXQI/G2mstpnDJv9Dd5J3UW2Gwv5vcaD4QIOgnl2XtEuHHHPIYOG083IVIqi0j
	IjoEEuQiKt6rnr1JjJX+b3WqAkcY7CDkg6czOBjxkGwl910fCwifjyxVFl2GToko8sSTJ3QaYhi
	rKzhM1nWK9hNISL2kL2DONT3jrx/rqoqquP34ZKKsAWrrVzsa0ktSoasgGJxkmidDag+LDJjx9o
	X2V1Gsc7KW
X-Received: by 2002:a05:6820:200d:b0:6a3:94bc:bdcf with SMTP id 006d021491bc7-6a39a72fb8amr10332180eaf.57.1784134078508;
        Wed, 15 Jul 2026 09:47:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 22/25] meta-selftest: libxpm: Fix license
Date: Wed, 15 Jul 2026 10:45:18 -0600
Message-ID: <20260715164739.364323-23-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241014

The license for this software is X11 and MIT (verified using the SPDX
license matcher website), so fix it up to be the correct SPDX
expression.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
index 1fcbbdd65e..bcfa65ab17 100644
--- a/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
+++ b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
@@ -1,7 +1,7 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
 
 DESCRIPTION = "X11 Pixmap library"
-LICENSE = "X-BSD"
+LICENSE = "MIT AND X11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
 DEPENDS += "libxext"
 PE = "1"
-- 
2.54.0


