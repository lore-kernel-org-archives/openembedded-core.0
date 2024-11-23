Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AEBE6ADEE
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 10:13:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.44910.1732356815813652863
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 02:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhdCe3mk;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-382423f4082so2004016f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732356814; x=1732961614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quE2BGkNiu+jHZygTFLBEMTPWsSEcwiqhYgF60haiCw=;
        b=fhdCe3mkPFAqhRYuhlpc1DcSaacV4v+Ui035hP9aHOLfO9ZXiy6eaZdjXPctKzyLEk
         cvvkn0HKgu/29At6lTRPZFTRRtDXAxrfDJqE8UgDpHfZoQnbA0OMhK6CHh+Cl+Oh4Eh5
         er/YESE8/rUDQUc9pxEeWUcV5YmRBB9MUdCtclits2lr0Flnhg7vB7d722B531tKn8hi
         fRG0etVxr/isrhPmFPnBKAEmg3mqlaGtxn1kY9Ro2/A/2yPyCO8Gt+Q3IpGTVALXUW16
         2VkRqSrrBcCCr66CAIiLTqy2rxx9zjHq1DscS5i/ruCbjmvNDOWHaEqWarsnxkgWH6lq
         qWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732356814; x=1732961614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quE2BGkNiu+jHZygTFLBEMTPWsSEcwiqhYgF60haiCw=;
        b=Bky4ggBgxrbLWWgtPMQOo9FHgUQ69+Y4gFusqTSZKL+MVXoh9l+4Fi5cItoeOCpcKe
         HOcFKyt5m39UI95A8ZhOTjRcKAz+aMCUWnTDwUTh5aK7o6hXVjvE94b88UpXUOnhinMQ
         9frm9yALpC4fmPb8fIiga8jDVyQ/mWmPm8al7oq4DVGpS17A4nV465bE5uk/JTHWGpW1
         Uucd/SU9Y01QcMRdoHojBi3aQuRn5jLjmavTtq0fEtfjlNjf2ywPwsCHMzd45knhqlYO
         3eQVUGhgNv8YziFR1PZC8iVELsRBfdMvkQrMhYi4oKCZm33Sm+AuHq4/w98fI9KwUx5P
         /chg==
X-Gm-Message-State: AOJu0YwBxv+c/hMoDbfUizp2Wwfkn9VBvsPY6UJ4iltBWNLAd8DEn8tj
	s/aYKriFC0WqFoyZax7riIzbf0FoYnASEjXqDeHmgWoXmG9EgIUksScPIw==
X-Gm-Gg: ASbGncs21zcg9wLiVl80YQE2F77/rzWm+QmU3D1a3+Y+StGTR66H2wB5RaCOmz8J5LH
	tq5QfkQPtFc3LIOegDXOon23tyzGyQqZDhVIFvP6WcgzymxOI7/2IOmJN3ZSqiOSV0gT2PGErRM
	YT3ebLz4k1fno4eRiulBOQK8wWJkYgiGfZB6Y9yqubMnaHgd4s9rRdtaWADZlrTi3cPW1+ouzro
	HwdzEKofeV7bC6WcTPQU7nBTZuMx1AI7hHFqGL0ltU6Yucpp9Xejl/r4vHhU/U+Uu3nHZzhOMfK
	316CiBWKn+M=
X-Google-Smtp-Source: AGHT+IEhq2PyUz5DmegE0QXwdI+ZOT5F6XFSBHM0hPJeeIyeS+rzFm1pF5QjLX8x/+l4koeNIYhnxg==
X-Received: by 2002:a5d:6d03:0:b0:382:495b:7ed7 with SMTP id ffacd0b85a97d-38260bcb1e3mr6246897f8f.39.1732356813826;
        Sat, 23 Nov 2024 02:13:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a3asm4789868f8f.66.2024.11.23.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 02:13:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [kirkstone][PATCH v2 2/2] package_rpm: restrict rpm to 4 threads
Date: Sat, 23 Nov 2024 11:13:28 +0100
Message-Id: <20241123101328.2516665-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241123101328.2516665-1-alex.kanavin@gmail.com>
References: <20241123101328.2516665-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 10:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207672

From: Alexander Kanavin <alex@linutronix.de>

TL;DR version:

with this, and the previous compression level changes
I am seeing drastic speedups in package_write_rpm completion times:

webkitgtk goes from 78 seconds to 37 seconds
glibc-locale goes from 399 seconds to 58 seconds (!)

The long version:

rpm uses multithreading for two purposes:

- spawning compressors (which are nowadays themselves
multi-threaded, so the feature is not as useful as it once
was)
- parallel file classification

While the former behaves well on massively parallel CPUs
(it was written and verified here :), the latter was then added
by upstream and only benchmarked on their very old, slow laptop,
apparently:
https://github.com/rpm-software-management/rpm/commit/41f0e214f2266f02d6185ba11f797716de8125d4

On anything more capable it starts showing pathologic behavior,
presumably from spawning massive amount of very short-lived threads,
and then having to synchronize them. For example classifying glibc-locale
takes
5m20s with 256 threads (default on my machine!)
1m49s with 64 threads
59s with 16 threads
48s with 8 threads

Even a more typical recipe like webkitgtk is affected:
47s with 256 threads
32s with 64 threads
27s with 16 or 8 threads

I have found that the optimal amount is actually four: this also
means that only four compressors are running at a time, but
as they're themselves using threads, and typical recipes are dominated
by just two or three large packages, this does not affect overall
completion time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 198a6d0afda..ec31adf967c 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -680,6 +680,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
+    cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
-- 
2.39.5


