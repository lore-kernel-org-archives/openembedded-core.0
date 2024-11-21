Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363D3D6ED38
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:43:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.10909.1732196585241691379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 05:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PubCZjyh;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-431ac30d379so8031145e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 05:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732196584; x=1732801384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCw9B+vY5TJHhat3HlgpOnfYSyWHBmZEtmF9m61TqIo=;
        b=PubCZjyhK309fce5bJpZW264VBmZEI1Krr3/nGLWWsNqk2qYSFOjUsgv5SxP/dUmX4
         erXUBjy29Ul6QHxFvVL0VQkB9emwEFzkYbwu6D6iOQXJz46BMRIfJ/gk/BFfmp0Lyy3W
         3sL8CccJML+vsKoTkIRZT13qNdz+5CqGa4YzCFYYCOK5jYUKE+h845G186aNV122LJml
         ym3Oo+QNXSd9tB+vprYiC5fL/VidDbPOBHWtw71xNwOWW5IXzltKBReQSGQpZL3gagdp
         Iz4SoN8GbGB5Qz8b4tGOKD8IB5vxN0eYP0qllUBV5JaIm9vCghv7aU9pnXiKBGB5VlRy
         vlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196584; x=1732801384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCw9B+vY5TJHhat3HlgpOnfYSyWHBmZEtmF9m61TqIo=;
        b=AHM4vQGvLFX2X/GWJbGc8irxdGWwiSR+/3z+hyaP65GULPRyOLfPnVrm8SrdCuGHFx
         t7UVso4KuQee7Zl5I955EgNmYRzOPrSO6PzW+8IBB6XBCH+dhbemdi+OpuH7Ua09g4DD
         Dg+mS12xvBcHCd2noMhfOsSs6RJ0iE0KDtTiVBmUX7Wsld/iBPrcXgACCxnt9Jk+JBZ6
         spspPC4ObSynjMLpKgtQnYSZv0ASTFS8fIWeMn8SQBxM/surO6Y24CKPfLl/LGL+82JV
         JR3VpaswdA9l9cZXmnxUWvje5+QV2TLTQj03GGQCVB+Oik9agEJPzXsSRrvVPit/PekD
         O4Og==
X-Gm-Message-State: AOJu0YxlFn1VeE5B27jRFGY+lySJ8zsb0xTfzrxpiaBxFb+W8NzDL2mS
	mIrpTl6uRcM3QtGhmmYGkogpHJBlGtApNtnuhnFdrE3BkKZs+cHKdfE9QA==
X-Gm-Gg: ASbGncufU3S7MoU36Bff3KhG8UQifGJG6EF9t/oAQYYsrVUJORC77rAJHYLyipvGiqo
	leeAj4laeVxtvhlLstLzFeVyaovBbZEVNbO4+k+gU+rim2JJ7no6GUENr2qjXGJfePZqdSj/PKD
	smkhNaCsoR3phawp0ZxJ9XWFgyCF3rQaWOgmpJicAEfyF6RyC0DW42Zl66PAhvtF5mJ7cvHKdDb
	uoC5lgoPz5sOiCeuiKnSl0CJj8OxXMlY2K2m8HPu4P0TZEhSytBtZl5kKG2Nkv2xXHyXV5ICsFH
	MsCiRgRivos=
X-Google-Smtp-Source: AGHT+IFN/EmeLPZzY2Pn5xWsqWUu9LKfjiSUshh6wfUw2ILOZCnyiwiFLMNdzSL58/GhWCQx3de9gA==
X-Received: by 2002:a05:600c:a06:b0:431:59ab:15cf with SMTP id 5b1f17b1804b1-433489d4c68mr53930925e9.19.1732196583554;
        Thu, 21 Nov 2024 05:43:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b462e30esm58764475e9.28.2024.11.21.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:43:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [kirkstone][PATCH 1/2] package_rpm: use zstd's default compression level
Date: Thu, 21 Nov 2024 14:42:59 +0100
Message-Id: <20241121134300.1074541-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207535

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default, while 19 is the highest and slowest.
It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/package_rpm.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index f403af53439..3541be07aeb 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -2,9 +2,7 @@ inherit package
 
 IMAGE_PKGTYPE ?= "rpm"
 
-RPM="rpm"
-RPMBUILD="rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.39.5


