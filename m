Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB026D711BA
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:32:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.16427.1732116733009951720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDO6afeK;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43161c0068bso39986365e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 07:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732116731; x=1732721531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlFGTqXQh9bgom3yErdpm3YOj6XEEiYrwqPDE/KW7w4=;
        b=GDO6afeKOkhvAH6KhAxMwoBepsm47cABdX11PF0RNa4EprBNkOYZ4CELEAATQtapF4
         2Va8xwLw0dISgxjUqkKwah3tzUpVSAcBz7n469kPUVleP8XJyykJu+ZpCHRul/Ee1k28
         OoOFOau6KmJ6tO/cpiTxfNMIyCmEvas9ABNbrvOFsxZSD0+bfSok7RQlsNw56SUcKs1C
         CUTSufHmi8/y6mzqbQ2UjamLaAQxH79GIqLnz84lTGHYqqfiLYbmDKmNaolVo3kDFNbY
         gOZ2JQ4UM/++mcvfUdTSckIVnOUIDBDKtKN0HaZaxiF+skOSx8BZWahUNbBz2wABhht0
         RUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732116731; x=1732721531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlFGTqXQh9bgom3yErdpm3YOj6XEEiYrwqPDE/KW7w4=;
        b=RugqDw9xUfTDbWdnETy0hKYKGyWB7BiJzCnF+g1CKdgk1VXjzjhrvFcSoE1bPFvqM3
         FZhm4lpJ9a+oo7h0xO5QW7jE+tHrsY8QXW7LU8OdPfzESByEvShFj28he3rVNK//nHgf
         Gd268DhkhyZDNFaNQ0UThtXde2/xzgdoBF+ntZQUbLyjigXhlLuAlq4gDKjDI69dx0Qk
         L420PhPDN9B2xsikZ3d2GvktL9jW5GyNxpgGYkDdBID9q0n3nZkmEn0racKwrT6sYL5O
         N4m5eO1udbHiXpHWPlTgTtfxHSb5Qq8VjpenkqRqGNsYgmma04VDww2mlRJU9sPcwni/
         Zj2A==
X-Gm-Message-State: AOJu0Yw9oCy0SFVE5Q7vc0o9qhMc/2kDrjc2ALLUOO4ZnFCE7yLdTor/
	vOL0aSrQtD5tF92yVtwM5jRjm3RBsS+ZxY06Cw9r+TiY377l/Q6DWg8O/w==
X-Google-Smtp-Source: AGHT+IEk+xyy0Jxpj3e/vxt4KdloL05uppMbLhSyhmAJxP9E6sxN/GO1wPJTcH41/gARPnAmbsw9hw==
X-Received: by 2002:a05:6000:471a:b0:382:49a5:2229 with SMTP id ffacd0b85a97d-38254b0e3a9mr2708405f8f.39.1732116731169;
        Wed, 20 Nov 2024 07:32:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825490522csm2363349f8f.17.2024.11.20.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:32:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 3/3] package_rpm: restrict rpm to 4 threads
Date: Wed, 20 Nov 2024 16:32:05 +0100
Message-Id: <20241120153205.2525735-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241120153205.2525735-1-alex.kanavin@gmail.com>
References: <20241120153205.2525735-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207463

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
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index fab8f568781..a3be823c9d8 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -696,6 +696,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
+    cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
-- 
2.39.5


