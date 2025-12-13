Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03FAD5AE47
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:59:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2953.1765619982787065977
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJLZWQbY;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0a33d0585so865945ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619982; x=1766224782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4L83Y7VxtI5b9BWl2t1emCdJuUcvnl/K5vZlp3I/YE=;
        b=gJLZWQbYY4hMHPFjl84wpvktBfMKUaKoUEx2uCEgsBYFZgOgpNpWS0+sUfTSbsCy9t
         P2urM6Rl6ge6YZpzzbkoBKV0lRRHUAMifLCaBFlnNScfc6MdKUjwwkV138e76g+dHL4s
         PwnYbGshjLc1w8Ip/tSpnYw0Ty0tzaxPIxJfDBYkGOOGQzriHm44ol3by0w2d2Ktv8aR
         x0XeOu3duW+1QhSnTd+6F0qoyi1r9J4uYcPFjzo4YozDQnDy7TAfTpdclwq+UiRMDCCT
         lN72l9lXg2GAsiuOzumRH4LO4gamm0ERmxC3Kdr3AKVGDGbLiXc+vt5OmusFiB1F+eQK
         Oybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619982; x=1766224782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4L83Y7VxtI5b9BWl2t1emCdJuUcvnl/K5vZlp3I/YE=;
        b=QdlRnec+0vbSd2QXY9XuWn/kv+3NmYpWPQHlbtb6syiQ4Dy2BXHhSmRu9Af729FQIo
         6+K0/t5hI9EsxXyMn2TNplq8pOWqJ+RrEFJq8tx8IqX3958D7DFhs3Pb6taL1izXpVNh
         HB8NmrfZo72JMcx38rv9LgPSrMDbla21HxDeA33oNJdoVoImui48CEsNq7TJ6i5X3TgZ
         Bw9WZ7RlufnB+hU5tOR+q+3DpOgAyBWsr/Gv+NOQ5GL3M84VnTbdg4+SBlT+Xt9TZm3E
         iEUYwc+az5WYLLbJqlUwJQRLdgC57ynhgb7q6JfiUv8EaBCLtjpAih9CJLoSqMnaSeT4
         XmiQ==
X-Gm-Message-State: AOJu0Yz1WeUoJasmyiraHvq7FumDvn3aLY/g4RJDYmknAsCY3gJCmG/2
	A+1LUi28kn+NfyL6E9S/Z5PFHAUz6TJbCPVHnPMWhs+fymAmu/pyT0A9M0+g+A==
X-Gm-Gg: AY/fxX5dNON5zx2Rccv1sPSEkw+RsDeo9iKBYcwn2W8+MfjUEYbjxzdUf2UPf26neuD
	twGfqNTa8w1IAEqRf0VinlAc8539kFzCgwDMKCE8OFORUehK/vDr8VMqIvXRpseodJKPExqGwsF
	Sdr8KaObT98Am+RsvKUbam9yJW3qsULpw7/ZWueAGjEdCym0lylaPGqMgXDAwqBqgaGEdZTHzJg
	mWoutkwhemyIOFRC1A+N1EoadmIZh1ecMYPIBevNTCLLLp0V69sNd1AbvgX85+3sPmOAJz+vGvu
	a1KURM4K2qXIb+s00BvoypcAU9g7VQiul+hPM9BZFPyu6RYYoZD4CZl/6w0wiir/NY3PyFU4/zS
	nwjRS8oBnmBq2qXPzuApHR4EgYw6TNRUNYLdnbYKa7mum0MJnWve/lp8lLB2DlB2Z1mnWY7qHrD
	ymuSxtWt0lYIYfcGzFGoSsC21i
X-Google-Smtp-Source: AGHT+IEoY1mJvgtL26ttUOhqDmyj6ndISI0TVvY+HxnQ/aVzAkBfwqe3gZWiIERy5HvHAGxyCsBCFw==
X-Received: by 2002:a17:903:41d1:b0:29f:301a:f6d2 with SMTP id d9443c01a7336-29f301af82amr32008905ad.19.1765619981890;
        Sat, 13 Dec 2025 01:59:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 02/67] barebox: upgrade 2025.09.0 -> 2025.11.0
Date: Sat, 13 Dec 2025 15:28:26 +0530
Message-ID: <20251213095931.2571498-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227620

From: Enrico Jörns <ejo@pengutronix.de>

Changes in 2025.11.0
--------------------

* New boards supported: i.MX93 FRDM, Enclustra Mercury+ SA2.
* Stricter validation of network data in NFS client code.
* Enhance 'parted' command: allows creating partitions up to the end of the
  device.
* Various fixes and improvements.

Release Notes:
https://github.com/barebox/barebox/releases/tag/v2025.11.0

Changes in 2025.10.0
--------------------

* Added support for device mapper and dm-verity.
  Prepares for secure boot without the need for FIT images.
* Added security policy support.
  Kconfig-level decision of operations allowed/forbidden in a specific
  security mode.
* New boards supported: Samsung Galaxy S8, Samsung Galaxy S20 5G, Radxa
  Rock-5T and Protonic PRT8ML.
* Various fixes and improvements.

Release Notes:
https://github.com/barebox/barebox/releases/tag/v2025.10.0

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit c596157f82ebd8dd3703bf7a5193bd3080743b53)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index e41d0858fd..0ad9166aa2 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.09.0"
+PV = "2025.11.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
+SRC_URI[sha256sum] = "6a487eb975169ef4ecc912d3e1044fb9ee4aa164c21d4db960a384a60d0914f6"

