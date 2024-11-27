Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F120D5A6D9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:12:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.64895.1732680739904666463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jvm1DDuz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724d8422dbaso5002116b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680739; x=1733285539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9y1+i7weqlhMtSeFtZo7cfbR0/S6fHtYu7qvTsyTos=;
        b=Jvm1DDuzV5mFvDKp3o0ffGanvxZIZkz1JWXHl/U2I2miPi+qkebxv0/y0hW3ZTRj1T
         3TugcF3QRT6ZaK37/tyIJKNLOD9bYcjDAEG1xetATlBWtCg/0sBd9mM3B/51GADSX/Hj
         XhgT9c8A54fkcIA23iD+CKv5cltrVMJOLmGiQUhq3n3SSVRkXq91FiPihbwglu81S9le
         1Tcl3NbpAgQqLKEuEQqlwtzH5i+zog1vFLLxBEKm6NUpTkaF11QpEBPtYDbIqHOyAcDC
         8vp3537AZU9e5LQybpbXzt8voXhLq0Sx50xcK5UX27G31q6Mr2+6e4jstRaEIr1m5FkO
         hXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680739; x=1733285539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9y1+i7weqlhMtSeFtZo7cfbR0/S6fHtYu7qvTsyTos=;
        b=ROpOBUrkuAoL+SX04R/kHm75RZPyE5bzziI1tJQWy53j6x1z+zOJpSHmUYzkokSbCo
         Wdnm5dpzbjfk3ZpR4ixLsTdYO/t/MPG8+09s8zbdBazLZXK2pZTi4su7S4AB0uaA160S
         hXp7JJQKl9HNaE4VSQtu+cYhIYo48jjvHnQKIr7H8BMv2+zRa4qP5yJQshEPbnNrgKsH
         izq2f92DOD/0WxkWA4it+D2ur2dgdtaShmYdvhw2etBJQOG6yuUmlFKjuX6BXEhQKETE
         3hSPVTG2N3aVFvfHZ8XoQ1VJ8ZkOaunt/HkGMZjpjkopZzcHptZpGq19zMAfXncCTRuc
         0Yeg==
X-Gm-Message-State: AOJu0Yx06zdMCCNWzWg19h5zqdkaifvzayxr0J3XENSDu/xO0olhkw0B
	YSINk78IMcko5ppO4HaUQEct1EdT4JPHGjAvJuWw7j1W55Y/UJO4a/c5ga2klFYg2wnqZcE3iaQ
	u
X-Gm-Gg: ASbGnctGKXnxUc4Rmkx1xTqyfxv3M1gAMp4YT4SXGs8x2FgWq0+nyhwDuj4NcUohmU7
	3tbXJe5g0dB0Kj0rjcKU+MiGOets4dzR1tJE9YshEq1nzIHqzGPBFPMHL+kjAv9pdUBcFGBifdP
	ZypYfU3kUD7w+n06LXE2mzUkulU+6oEMMybmMfDeVMJ3v8y0BoudKfL4jhqlSjzqfXiBFd6vh77
	bGkIEQxQ0KhqCETKCcg6jS2ziDPM7BF+ZpDLXI=
X-Google-Smtp-Source: AGHT+IFJG0l1GqXY6pJoC8Qp+bfmIlNWq+cFJOYsN39p1wik9AeCSIGHVmshTapyGzv3b1eTE1CePQ==
X-Received: by 2002:a05:6a00:1a8b:b0:724:fcff:505b with SMTP id d2e1a72fcca58-7253007218fmr2450341b3a.14.1732680739129;
        Tue, 26 Nov 2024 20:12:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:12:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 18/18] package_rpm: restrict rpm to 4 threads
Date: Tue, 26 Nov 2024 20:11:38 -0800
Message-Id: <ac480775440fba812fd5aa9da73e0e5bc60d46d6.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207912

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
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index b2b7fafa17..021c53593f 100644
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
2.34.1


