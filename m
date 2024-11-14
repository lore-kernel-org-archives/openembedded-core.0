Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995BFD65C76
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 11:11:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.34864.1731582667865017449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 03:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHfY8QBw;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so4545865e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731582666; x=1732187466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUqU/XerDqnUC58iEEYUfF4kL+6bbBGHW+mHcqyHoT0=;
        b=DHfY8QBwDpH7+S+lhrCGDMbcaXo6Hxpoh1omUPMuyGTerskywC+24fw5++C9naoDBt
         RM3RHGqkXL9zytzFKI2fMq/YwMCVzzKsqv1ENHw6O49aaEOgyo+vK4+B9fx3bX0L/spF
         KYAptDUCzRGTgNAkyBlc9w+nGATxXfGV+wV1P0jnBQzTN9SNasWf5yQoMNBabhgoZLws
         HZsx5jQK3UZEWXSRRbVTCdGtb7ds4DELwUwpjftF+Tuvqd0EjY1CFGT8VlVW32JcyW/T
         znScHHUpFX69s8+gAvSenxEJk0r7WbLTVzWeSIQR6M119jaetrm7l7v79nYXTNk6MPfQ
         0eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731582666; x=1732187466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUqU/XerDqnUC58iEEYUfF4kL+6bbBGHW+mHcqyHoT0=;
        b=tLc5aPO9Xm5taQPnBfGQ8i9rUX7LUVtyec8fIOj6ToleGystppyg059UBzXxaPWHnD
         4cnB1L0cW6cqlNxlq2jBU2jgYH2RjhFcjwQFB01tB9OQuHhyQGMlR5wUNUpxr1RPZzv8
         UKTjwjXUyQYb08rS6JG/f+ctyMpTRfUGVyG8ol64MlmEvmbTi0HUuQX/Lik3y0mKHdt8
         alUGpi+5arCF+/KsUGyX5TWM1rjlTPn1CfLmVi76Svw7Ve3/CS99jGgh7lJ9usqufc7d
         PcXeN0oitW69gxgeAj5jzcuReOy/1CUB7vMbxDQApZJVYugKg4eXhd66EUSyJKzRdGMI
         m+3A==
X-Gm-Message-State: AOJu0YwVOlJGP8bxA/wnkNudOjQQmnyiqD6stsYLFBFg/GDkSXTh7jRw
	zGTnfKlju4OwXXOI0uRRUVzvtXmxH1oFVGVzNayH87VCWS4K9Bv+gAmoRw==
X-Google-Smtp-Source: AGHT+IEgVMx3fyvW5zxl6Hvo37KE9CPOkD/M6sGw6CNDKKcppNuXQi2F+XNSh7F1DBNTkw75t/ZNIg==
X-Received: by 2002:a05:600c:3ba3:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-432b7481bdbmr219472795e9.0.1731582666072;
        Thu, 14 Nov 2024 03:11:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adbeb47sm1165841f8f.63.2024.11.14.03.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 03:11:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] bitbake.conf: add an addfragments directive for oe-core and dependent layers
Date: Thu, 14 Nov 2024 12:10:59 +0100
Message-Id: <20241114111100.2624737-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207148

From: Alexander Kanavin <alex@linutronix.de>

Please see the patch to bitbake for syntax and implementation details.

The path prefix to fragments is in its own variable so it doesn't have
to be hardcoded into tools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 02bbf0e7a52..b6013f66e26 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -836,6 +836,8 @@ include conf/documentation.conf
 include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
+OE_FRAGMENTS_PREFIX ?= "conf/fragments"
+addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
-- 
2.39.5


