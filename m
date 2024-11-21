Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370FBD6ED34
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:43:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.10872.1732196585957050004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 05:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GTm47lPY;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43169902057so7678745e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 05:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732196584; x=1732801384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+x9hPZnhOPdrQQtJYvLvWSJi3JkKu+O9nruz1pyoXQ=;
        b=GTm47lPYep+9rki0L1L0trP/uqMGyBaE3Tv2dGjf2AcXVWVxLJG/mCK1+xVEK7llPu
         bmoA1JNN2Ima+hWvhgNKmLrBa5GhQHhHOSvsX7HPfrQ4aIlR9odNxtkS9MwxDyPx/oCi
         RF/s6OYLCG7AQrn6AJ2LH9clREtEP4PNR3WBdgNwaI/7jvbZn6SvShhX7Amox6tQubd8
         oNbsW9vEghhjqSoHCVwOcpu1bwAeqJXNofwvSz7Fs2MEMEYaeuOMF96HApBWABBa+6mw
         nD3BHGlvNq7TX1XE72pAT+iRdraYIWuDjRKV2STwxmAsAdxd32A1jnd34TqsJy8OwwXK
         emQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196584; x=1732801384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+x9hPZnhOPdrQQtJYvLvWSJi3JkKu+O9nruz1pyoXQ=;
        b=JzczbgAPAe2BiXEtO14lbx6q6BBoxV3AXDJGKgz1xQfOgNF9R2N4oMJ/8jgJW3BMBT
         BmDnK+TeYLNEwNZzQVpyju7NOlYOyuq8ds9wG8lD0cnP9XUCCIaj/my0kIPnw6k3GCjz
         p0HDPNIy0PWq92m9hNLxWdUZzhGilpUuCdzAhyi3jiN4ZVsAzu7uwR7+09y5Z873BMGl
         CDZrug7JH23Qe3r2ypFMWs2Tfdde5nEbsqtgs87WEvXZ1fzj49glK4bVTLO37+n6jvHj
         MKVzJTZ4jGRKfF2yDQa5LaLamWm8zNl1H/HpYtO25euZKDzGH8lK7PY5PPuFcmBUj4D0
         d3XA==
X-Gm-Message-State: AOJu0YygQcIoAJmHQARfICue0lHlFol4wNhMT1R3D6IOmSS3lB0xHJLw
	jGByJ1oDX3R/YTRMxfnZNPgr7gONpQuVnuQOxNd/FCm4riAjw7NKaQ6HyQ==
X-Gm-Gg: ASbGncslA8N3PRPFDcQ0pz65THzImj68tMctcvysop+4LqeWzoAsSCkZV+YshrqjfQO
	RcQrBV6Us/e+xJPJXakzAKdAqJo3cZZmkFq+LeovvfWRare4r/B0F/pouXEwKsVaffEWlJpKMok
	GcyfdYQMj/RAV/CrgPueMB0o0qHgHnL/6h3yWU0NSEKB5UHCD/vmZZz8d/0ZrRye/xfyxgXkd3N
	b8D4jlYkuhPQ9UKhgGBwGh92aYH5V4HhhvNLsoh0xNh0XeBbjoRFGpHizSVuPVUNeUobvfxFzHp
	pZ2VvKNSv+w=
X-Google-Smtp-Source: AGHT+IFAI9PfpQ5+LNhQI18mVKdRGlE97kEx4ZY3txyxHe79h8Qt0hU8FqU1LDX8dRQyzVNxYdOMmA==
X-Received: by 2002:a05:600c:6748:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-433489b3db9mr58126985e9.13.1732196584247;
        Thu, 21 Nov 2024 05:43:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b462e30esm58764475e9.28.2024.11.21.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:43:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [kirkstone][PATCH 2/2] package_rpm: restrict rpm to 4 threads
Date: Thu, 21 Nov 2024 14:43:00 +0100
Message-Id: <20241121134300.1074541-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121134300.1074541-1-alex.kanavin@gmail.com>
References: <20241121134300.1074541-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207536

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
index 3541be07aeb..44b5a4dd6a0 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -678,6 +678,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
+    cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
-- 
2.39.5


