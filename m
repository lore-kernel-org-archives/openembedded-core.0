Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1962CD5AE4C
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 09:59:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2955.1765619996774391903
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 01:59:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GZvbjIpp;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29808a9a96aso27481115ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 01:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619996; x=1766224796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaydQ931wrqRoBrEhw+paHS50eVuSIEJGVs+cT1Pgak=;
        b=GZvbjIppJr72qldZ8aUgxDLI6rACJxIPMPW6qH/EfGgtuJJe9AfHwaoG1AWKORjxhc
         SjjIR40HCjaDE/HEkbpZePPRR47HrMwle6JfEc0mt8yvkmNMAnK0imMaCtdFqQsdVyod
         5hgwv3nAnk+mot3NWkykQQkV7IQQWEr7UxYWOl86HXHaDLLtTrFOjZqN5vuTADslAqp6
         QWmcSZlJpIUMQTAKahRLPCwvr2etlNdHyiszktRO0hAcXqRXRmboX0dw91Nq+CjH/Jjk
         nn9hKZeqrHwJmRDpIjHqXvNiJMZCAaLmmStZLJySq9uDkII8toUVNnmE4DfCxcT4Z8Qi
         H13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619996; x=1766224796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaydQ931wrqRoBrEhw+paHS50eVuSIEJGVs+cT1Pgak=;
        b=MWLPzMwAy3r/rbCLpRWmoXao3ziU2xJVmkI+le0i2mWcxFMXOA9LGck1bKS9VoorQw
         d0Xh3nsCBA2APC8RHezpEKn9G/nEszep1LuCOEHQE83azSO1dTL1RS4kcXsxraUaYc11
         Mqt4cMKg5Pum6fpzI+NZaNNplIPTjyn+hhzH6v/rm94Y/tqM6xwVDgcS1SmaAj//aNzM
         tgkS2J8OFwwjs2U16xyA+J1WeeeOKhS9rEepx7xDiA9WPTAKs7v1ok5Mq9roSsFs4nQ/
         FxDmzsUXYmBNOitOm+RIzszEaT4uldqbg6od0jh+HhjIXwyjyDPuM4i7H9fCdQ9b9fGk
         pxcw==
X-Gm-Message-State: AOJu0YyVBdgJ8u4AcBcdbi3WtgGzrCfzqzsWnvmqVPqncBG9BQvsygMA
	1x3PWTNAYWhBxT8nlB2MVbc9XVMfrRnwu0RpK260g6uWx7XjzNze99dTexxPLw==
X-Gm-Gg: AY/fxX7/g9tYT6/BZCZVOoQPVTfTwOpdMXFDMLn7tgSzA/4EPKIY2L+0nd6E8PaajKW
	LyGQvbJQ4h1kgOvpr0tvyTKD75svGcNSBi/KmHDLE2g07836HQEmyrAabxr854g8vUvjKzWvEyj
	fwjz+OBOv9RDk2mjPe8P9qK8xwh3lPm85ck31v8vfKsgUsxksYdyGuG0oGZgIEzIDXETq8MQyTN
	Xrj99QOxHEVl+I1yqM3TkZ+ITG1OEx4OVGMvEgBJaiqM/K4VS29RYnLEjMCsvInFanEo3WUEqlR
	71fYQ1f4ENhzO6LA4nO22xFNlg3BkoNbKQTgujRLb1NPfhchjgCjquq3aJRL5JTIdHlQdOKfIOm
	VHm9J9rYRyAKTyv/eRfynASrvXsjZ/OuEHobE5hIsUtzLX9sBfFWpf94pSMGbTFlCBKx8HkUUei
	1IUhKsV8uaOQmjqRKXiut4OiEa
X-Google-Smtp-Source: AGHT+IEAd8P29dtCz5pRrM7TuKB8Y5V2eimZ5O1OUBL+TSn3jZuRIEuZ018PXKEGf5ySQ3Nt5PIRyw==
X-Received: by 2002:a17:902:d550:b0:267:a95d:7164 with SMTP id d9443c01a7336-29f244d0b69mr42162635ad.60.1765619996013;
        Sat, 13 Dec 2025 01:59:56 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:59:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 07/67] nfs-utils: remove obsolete 'make clean' call
Date: Sat, 13 Dec 2025 15:28:31 +0530
Message-ID: <20251213095931.2571498-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 09:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227625

From: Ross Burton <ross.burton@arm.com>

The 1.2.8 release did indeed ship binary .o files, such as:

  nfs-utils-1.2.8/support/nfs/conffile.o

No recent release has done this though.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 2751280d2d6238839aa5c7f5624a63fcfc9f8a85)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
index 08e7dd8900..65970f58e8 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
@@ -123,12 +123,6 @@ do_configure:prepend() {
 		${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
 }
 
-# Make clean needed because the package comes with
-# precompiled 64-bit objects that break the build
-do_compile:prepend() {
-	make clean
-}
-
 # Works on systemd only
 HIGH_RLIMIT_NOFILE ??= "4096"
 

