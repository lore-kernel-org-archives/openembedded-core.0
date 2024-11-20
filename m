Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E804D711AC
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:04:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.15646.1732115035037724717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbt3JZHM;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso41688165e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732115033; x=1732719833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz5j7WwYKyakKGVrWgcz+6xntyF4VJWt+XCLyFjWI1I=;
        b=jbt3JZHMtkj3nrHw/D5QVYW2fXI9Ij4ZMz5gdMekXtiHt8laXCne7IWpVxucGYlSUW
         Qq8oqYdMh/6M5X6REmnaboyEOgHz+6S+sgjtA4vckTAYnC0CkkRu50hIAbTzYDyyQ0F5
         Pzkd5t9Bw4+JacjOqCX+5cijfoOF7SMR9pSIuebw6+OdllBIiuO7gr8FWx9T8BAVkxL0
         tOtYLcB6i3HG32xNkPKOCYMIqQFHdt5oqv0NNc5O4KyiMBcOwye8/4oSqmdIrlsWahiD
         rJapJ9w1Z6Fhhvqul/iWi0M0iNSANqEMnaVI61hF13B9JHLg7Eu5Hk1Aw/XE67vns6NE
         p/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732115033; x=1732719833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cz5j7WwYKyakKGVrWgcz+6xntyF4VJWt+XCLyFjWI1I=;
        b=L1QtG77Wr5W3lGWmndl+ZJLTiRlekgZMYvaTln2xBIRd6ebN4BiXpN4txQ/tpU37Ou
         0FbOBXOy/DjJxA267Ro94Ves0lov8gmcAlagqUQWGf+CQVkTsFKlv7TIR/uJoF0B1wVp
         lW14MSecKprcqOn4nwpBGjaUHZoUP4N2xDSz+IQnPcDAvSVQVB5Ef1nKaAqMDexHFCpF
         EtSkeuxr4a5q5/xcTjE+TozpezFVxbUQ8v9FQnYWNns2S7i0R5hqeUjffrvXEzoiqvtS
         qQAFCX2li/szFarxB4fMjUm91ar5vA1eDQPfv2haw5AlK0nqvR3d/bUGy2LE813NWCXN
         2i2Q==
X-Gm-Message-State: AOJu0Ywxwl25rFJlk7+4S5m/RKt1GICd6MQhfJcxlMRn6RCS90Z/Q0WT
	wiq0Tgi8O7nfunFrR39Z2fqE6Czxo6i2uJaOyeVod3O7e6jY0GrT5nfQUQ==
X-Google-Smtp-Source: AGHT+IGo/TTWgi8+YNt1vq0wm8ehN2ApNQOXmydHBfvhSvkcax+ujubLWOsaSBIFYRCTes1tQ1nQEg==
X-Received: by 2002:a05:600c:1d0f:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-4334f0215bdmr25372605e9.25.1732115031174;
        Wed, 20 Nov 2024 07:03:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1030sm21855025e9.7.2024.11.20.07.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:03:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] package_rpm: restrict rpm to 4 threads
Date: Wed, 20 Nov 2024 16:03:46 +0100
Message-Id: <20241120150346.2279992-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241120150346.2279992-1-alex.kanavin@gmail.com>
References: <20241120150346.2279992-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207458

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
index b2b7fafa177..021c53593fd 100644
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


