Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194ACD6D22C
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:32 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.79057.1732733429416409430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RJpBz2OC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7250906bc63so69391b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733429; x=1733338229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD86FHLOqtsDpBH3C4PamUIZuLKdh2ebroQAIA+20Hg=;
        b=RJpBz2OCFJyBYI0b1JfaPvHY4f9OCattu1CpaAbc/z3yU7Y26SiiOF6WMi/zADFYEm
         76sef60BpipQZO4MAsYQTXFwdM+1fAMCXAnom+An6sIjd8Qe+01h5YLS7VFG39qpNhPv
         5WSjbHqVt08yr2Psm8q1bNmZg7tFaeoYI9YkvffmOGuGLexaz4LHXNhhJJXuyBphljRz
         frwj6tKnIXYObclWq5fvQacsohNffihKf/ciZ72oufRbT64ryBM6ejc1+EfKcEA6ug/f
         rPhN/ivZQnX6BZlwuNpOjv2onOst+R5BNtU38EGUJsZAbfruVC4s5dhuYgtYBiOql6bP
         Kyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733429; x=1733338229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pD86FHLOqtsDpBH3C4PamUIZuLKdh2ebroQAIA+20Hg=;
        b=WbIyrPKu1xW6DIB89NlCfNzbpRlEgnD7wBoGLMaENIvqKjzNEcoee3HootS3PDw562
         HeEeCpNevgOBIL5DAcjgIckuBaezhTTL/6JVmvWn3j86ZP+n4LMtce4GM6WjRXY+qky4
         6H0WeO5YpaIDgAKN2MJ440TDiXZZib7T9+4NTamLqhLmCxqqpMhVfyKVUyIRY6jnaUaa
         YwEtx4JUALjAyAV9tPC5MH0pS4w9A7TnxEeS/ZpCBN2mdvmdGgX+fjT/0M4WqFT8s3/A
         7SieScvG4UkE3Su7x520+gpqKfY3Yjc6axHnuF/L4OO3AEJPyvd4M+2pGd6035+xdmHf
         ODvA==
X-Gm-Message-State: AOJu0YxCuMKjp5XfMF8YAuX7SvEabWs2M/h/H7PGwimansnBJCzW850x
	xjuT/xqGREGeBPe7KONyFOjllwMOBwIocCdnfNmLB66a3ruQjY+BPerHi8AqLadxeSQOgbZFDVH
	g
X-Gm-Gg: ASbGncug/h1nuJ2JY/XwD5M+N0x09gnjuZ/10RPWyk9/buIhQmBSsLOuqfzi3nvBgba
	Dz7KXmJtD5yXe9e438m/frjG1ehTyYxyv34GkvQmVUgkq99RaZDwwHIZTmeP9K7DXKk6XpJy9pL
	W8E/OVwp+523dJyKIOKCqsLBua4z7fxmOPqpy4jDiAmOgLAymivnatOF3hS5MGucuTkH7Lop0rT
	5/coXa0Lla5JwV5Pp/xOZT2PSR24AoLQXAS68o=
X-Google-Smtp-Source: AGHT+IE+MvV+j/EivFlSJbB9IUyzh1C/fTwD6B+dQwW/Ldf+uwrUypKGAJPihryCC+wL32+oJtnIpQ==
X-Received: by 2002:a05:6a00:2382:b0:725:3c2d:f7b6 with SMTP id d2e1a72fcca58-7253f364a85mr523344b3a.10.1732733428633;
        Wed, 27 Nov 2024 10:50:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/14] package_rpm: restrict rpm to 4 threads
Date: Wed, 27 Nov 2024 10:50:05 -0800
Message-Id: <896192604d84a6f77095f23cd13232e249b7aac5.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207954

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 198a6d0afd..ec31adf967 100644
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
2.34.1


