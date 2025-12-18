Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7968FD6ACF3
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:02:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40331.1766059316910352278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YWFD7o+X;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc544b09so347857f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766059315; x=1766664115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44PTI2O5tYBwI330Cyr50GcQl0cnzm2fhTfHOZ4fi+w=;
        b=YWFD7o+XMjzekcZnGX0yWZRYNzGyYJRVC9uDM7KetQfGKL07AQa2hHMXqGqYKIPh2P
         SHk+ebc15ZJ2QI3kPU7y4MSIZEROZrdEvbY8YLqhafHAshKYvkSm/qdvkxjS90LVD5VE
         ziHrWyu1K5Y7/LiiFjqDf0qqyMf63s3EAOsSFoHqG1QdcNW9orZLBIWa09JgPsuS5kI7
         /J1g/ZzyPS2zBtOCQqebvhXzNYkmM7VRzLWce9qo//DcdoTkbrGxCQGprb9IjQtE8rGf
         NAoGXzD0rrqFPwvRNGx35bJEHCrbgQtmTjoyXt0r/UvG+9Ze2sWOktIxuA/f39AfvNef
         8v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059315; x=1766664115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44PTI2O5tYBwI330Cyr50GcQl0cnzm2fhTfHOZ4fi+w=;
        b=VUqK6ETPBT3MFe6wMsglb69b9PwuIzBQw32h+kf/yTQB79uDUGub9nlMFYm7Owb7Q9
         0FfOKNAJjLccgFl/Otoq0B6ypxu2xR/7ePJRYnigDPZw1+zcpZYq+qk2B7CNL6Qqjag/
         J5AEmuO/GULJMNIy9b8NpnB2T18na11zedE7V8qGFK9qkCM6VQhbgp42ACwg0EG1FJgQ
         4wVWr8MQO110lzbCGcb4zbSsKqgTdjxYNKdGpp/Eb692C4YEVoOe5hiQuY/3RomNM0k3
         VI4Tu6xW/LNulBKF09GybZzSeZrST78E5zCcuYbAJqRnu8L4HrXKCS9LVeBVNjJcuJGp
         PeaA==
X-Gm-Message-State: AOJu0YyF2gCjY14M/CptfA6xOnBiYs67CTgXxxZxl+IU+pvx0838s4Ub
	yBRyVn9BeRSercJZfSlXWsP37En0G5FtPnbKDk9hp6J55jC7L/uCLeFcCKtILQ==
X-Gm-Gg: AY/fxX41Rk8/gy4AfWnuc6afQGewZTXoNsBCRWxvXVZu/P52tDjC8eD7kA1CY4/OvZr
	NfzkM/mrhrGEmP5vGc+cyQ3J6uxaYPfOdTJgRsmXmH19EX30YtPX8+RH7q6B/p0OPCmohasexIO
	AAkvuXyRFh1hkFIeC0YJ1bRSnzuYck/TVzkPimBY11iIOwNT00L4DFpxe1k5hnFdn5aopI4P1+R
	id1t0YO3WjWjV2Drv4mJKuwugdsmc8fsXp25iGJTlawxQNTuRTKdhlzZZ5qutG+rTtYuLwKE5Ib
	9SFXJXkOw1a9wCi9OWNyjl9e9zhpNFVNU1YT/d/sdOqz2NijDN9LKlkXoW9twBCL8RlK2OH6yMY
	/v1BhvBWZGEup7zEJZTUwd5lIYOSVI60xzwCcbjr5f5MnOpupe4LTCtvDA9/SpHGksVMtB7UaWl
	etXBJasd8I294VDacsfkDMh1HTgH9nNDwdcg==
X-Google-Smtp-Source: AGHT+IGjvv1IIrnoxa/VeBH24Jpey2CSFvUIEdpuXwtCpFmTPmkiPm0jYS+ankNu1tNflwhnNgKYRw==
X-Received: by 2002:a5d:64e9:0:b0:430:fcf5:495c with SMTP id ffacd0b85a97d-430fcf55f26mr15626824f8f.4.1766059314930;
        Thu, 18 Dec 2025 04:01:54 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43244949ba6sm4684850f8f.19.2025.12.18.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:01:54 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 1/2] spdx30_tasks: Add summary field with fallback chain
Date: Thu, 18 Dec 2025 13:01:38 +0100
Message-ID: <20251218120139.104155-2-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218120139.104155-1-stondo@gmail.com>
References: <20251218120139.104155-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228118

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add automatic population of summary field with intelligent fallback
chain to improve SBOM human-readability and documentation completeness.

The summary field provides a brief description of each package in the
SBOM, making it easier for humans to understand the purpose of components
without reading full descriptions. The implementation uses a fallback
chain to ensure every package has a meaningful summary:

  SUMMARY:${package} → SUMMARY → DESCRIPTION → generated description

This improvement addresses SBOM documentation quality requirements and
makes SBOMs more useful for security review and compliance documentation.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index f731a709e3..286a08ed9b 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -636,7 +636,22 @@ def create_spdx(d):
             set_var_field(
                 "HOMEPAGE", spdx_package, "software_homePage", package=package
             )
-            set_var_field("SUMMARY", spdx_package, "summary", package=package)
+            
+            # Add summary with fallback to DESCRIPTION
+            summary = None
+            if package:
+                summary = d.getVar("SUMMARY:%s" % package)
+            if not summary:
+                summary = d.getVar("SUMMARY")
+            if not summary:
+                # Fallback to DESCRIPTION if SUMMARY not available
+                summary = d.getVar("DESCRIPTION")
+            if not summary:
+                # Last resort: generate from package name
+                summary = f"Package {package or d.getVar('PN')}"
+            if summary:
+                spdx_package.summary = summary
+            
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
             if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SPDX_PACKAGE_URL"):
-- 
2.52.0


