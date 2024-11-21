Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C6BD6ED34
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:42:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.10888.1732196548644970636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 05:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMxc4PLN;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43193678216so8274775e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 05:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732196547; x=1732801347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NjpfYti60rru5AAc7KLNQYdx2g7YFoMlGLBy8c+gvg=;
        b=gMxc4PLNI9QfesMCLq2S1WkohWecZoLg35NR/OaxCKN0QiukDHkuwUtkXSfKE3mK9W
         qZjxNtOGX9EtIXMyK+o5ztIChGS70zUHFucpw9H6u7EzTtJMF6NzisIVUQflxg42NS9l
         fUFY/excUklnDqWhS+zReIEj40Z8DdAl/inQivph1tycgFcaPM3ShoMvtDhXtmuXgvsL
         NJNG9nhVpJiFevvAy6cPNnZUh1A91iwvJqEHFb3zMQ9WJzNvUzoEZ1rk9ev2OEVqa02z
         GE3idhCXbmTNObWaUs0/5Yyo+0yD78GgnF3uuVwcuroMi8Ezvr3+Fhb+/ICdaf26zE0K
         DSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196547; x=1732801347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NjpfYti60rru5AAc7KLNQYdx2g7YFoMlGLBy8c+gvg=;
        b=r0bDS+nZ284On/VIgm7xdDXXDn5h4d8OzPPhGVlUecbSltvpbvRx0N5Y7ywAa/oCwQ
         IhOG7CYX/8Vcm5rep4litrCUNPtXvYZDnByPZUqv7LZzijTf/C5B/ks8wdRSaXA2v5mq
         VWphPgDGS5U+OZRyceGGvmlNYG6bkKZOPZEPT8VOamDcy/GOeGlmnx5/vv9xm3XwVGIJ
         7Wz5kAh4QkD+CX0iTd9kcmlUxLcfKf0zUTaa1HeC0OnYBTbOUC9zo9lyiZmsIVXVjP/0
         HaL+0L44f0eCI5waKEJK+F6EDOi29W+Y2eTzoIAGzATP7h7bq0q8Vo4PcyCRwgPb48cn
         0Bvg==
X-Gm-Message-State: AOJu0Yw74UXGkpZxGM6fNXnaRblNivEqT8E+eJc84m52iDEtuylItJ0m
	1NMM2wIDu7jqE+jNZWAcgGnaivYEmPO3VWL5si9/ETlUf6tJ6vDZBRwB7g==
X-Gm-Gg: ASbGnctAomx+uWbiqQc9Q+FDM+TqcY3snvJqZn8StkjedaAb1E3mO0onfzeZPRt+16z
	7fZoXPr6f19V5x4B+j0vWLs9DqqAl+jhQ+VZrD/Bgxa+CzG6hHjhyApCDze8CA4zPQf6dx+0VYV
	//TE+nJ+eWWkhB1QtNEMr0QjxXJ4M2ftFrT54qRTdjM4UMxTIK83QejL4xaLM589JWycrT+z8Xf
	oUmenro3Fxqp/fXqeBUy8CcB4KDLGwoovswL54crg4u9x18SzVinrHFU7ZkU9Qa1UFIrDFS9im0
	gUZu38BkeLI=
X-Google-Smtp-Source: AGHT+IGmkc6D8+KAL0gpP3YNhWAw3nhEaZ1ZkHVF/ke/WIGCaqaamQP26wnSYZIVhZu4vuGz+igLEg==
X-Received: by 2002:a05:600c:4e8d:b0:431:1a98:cb40 with SMTP id 5b1f17b1804b1-433489d5c5dmr58962505e9.18.1732196546917;
        Thu, 21 Nov 2024 05:42:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549052c0sm5225598f8f.7.2024.11.21.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:42:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [styhead][PATCH 2/2] package_rpm: restrict rpm to 4 threads
Date: Thu, 21 Nov 2024 14:42:18 +0100
Message-Id: <20241121134218.1072729-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121134218.1072729-1-alex.kanavin@gmail.com>
References: <20241121134218.1072729-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207532

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
index bf74091da43..b78401c808d 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -688,6 +688,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
+    cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
-- 
2.39.5


