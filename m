Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.8846.1632492997095989973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NNf95Int;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id l6so6549412plh.9
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7OoOYGxp7QLOn3mpaZXyVRmkpMnZOYG5Qip74w+irUk=;
        b=NNf95IntHe+LpKCfLth7QGoHFw8DWJytVjTWanrHKCDCsdnES1IwFBpxzWVVpWbUCo
         PffCLUGGfaTOaW0PC6bomh900jKaWsC/CZyQPa4mdeW9zhsMeyKqe8XaJGP71hfEFN6Y
         GUi650/1j6obD/DRswyJTB3jJVxa9LRWGpEMVJEYVMmTYWUHDjbildFiUHg9O7OraXGk
         s4x6s78rUg0JpDuxBZCOeTmIiESeuN7hSWQiEfQqDCeoRUl95mnEPM8z4JGM6zkR2/09
         wuuLYD1hl7KmZIytlrsmIWkg0G2roJI8PNntL2J2mQZcBTKPFgx1qEgJfeDNQrQ9CJ76
         Im9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7OoOYGxp7QLOn3mpaZXyVRmkpMnZOYG5Qip74w+irUk=;
        b=USyJ1k7d1BKZo8orWclBEOsuezUWZboG9Pl1qvvDrY+x1C4KOI24tnhq1BOgy/qUy1
         GmjH9wqN4OaqpCyJxlV4NhmoMhR2AeNjktaSFZ8zZPVQ38xBrNJW3gOVxkOSvMXadTgd
         aM9Dp3PFBWRo1S7/idxPLzNLNd8lO/tsSkXpdUGgwZEjVjj0EhvSPIqTLwPOJrCq0WMM
         XU2CKdf/rLDkKM2EnwpJf69fPKwhhhl5YdvFz4h4QtmTFNRXlNwUU4ov6vNzJEtptj8h
         7PaD80e0U6nT9cY+Lu1v1Ts537MIrDn0Fu/YVo0s0+Rhhq/dZF3oqLuGEcStgLOXe2/2
         P+7Q==
X-Gm-Message-State: AOAM533FCPuID2/jxQnL/9QlxhAGBYNQjbOxkyTovn76OxZrFbeEBPRf
	A/AXb0W7A5Bj/aIR+q6eQrFMyNcHOhS6wrjh/Ug=
X-Google-Smtp-Source: ABdhPJwyTQHvtpBuNBl4FqHeFqJBIcivlqjE2zfPbX3lgxmx5Y6L3nOl3qn9uggvj9kcQVDg1Bf6Fg==
X-Received: by 2002:a17:90a:b105:: with SMTP id z5mr2496923pjq.64.1632492996009;
        Fri, 24 Sep 2021 07:16:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/25] rpm: Handle proper return value to avoid major issues
Date: Fri, 24 Sep 2021 04:15:21 -1000
Message-Id: <ab292be731581016ca7d7ed62e4cb2f00574b335.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch changed
to avoid critical issues
Handled return values of getrlimit() and lzma_cputhreads() functions
to avoid unexpected behaviours like devide by zero and potential read
of uninitialized variable 'virtual_memory'
Upstream-Status: Pending [merge of multithreading patches to upstream]

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5aae9c2cb464350bc443a0f60fd6602942e61f46)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...rict-virtual-memory-usage-if-limit-s.patch | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
index 6454785254..dc3f74fecd 100644
--- a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
+++ b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
@@ -11,36 +11,39 @@ CPU thread.
 Upstream-Status: Pending [merge of multithreading patches to upstream]
 
 Signed-off-by: Peter Bergin <peter@berginkonsult.se>
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
 ---
- rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++
- 1 file changed, 34 insertions(+)
+ rpmio/rpmio.c | 36 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 36 insertions(+)
 
 diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
 index e051c98..b3c56b6 100644
 --- a/rpmio/rpmio.c
 +++ b/rpmio/rpmio.c
-@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
+@@ -845,6 +845,42 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
  		}
  #endif
  
-+		struct rlimit virtual_memory;
-+		getrlimit(RLIMIT_AS, &virtual_memory);
-+		if (virtual_memory.rlim_cur != RLIM_INFINITY) {
++		struct rlimit virtual_memory = {RLIM_INFINITY , RLIM_INFINITY};
++		int status = getrlimit(RLIMIT_AS, &virtual_memory);
++		if ((status != -1) && (virtual_memory.rlim_cur != RLIM_INFINITY)) {
 +			const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
++			uint32_t threads_max = lzma_cputhreads();
 +			const uint64_t virtual_memlimit_per_cpu_thread =
-+				virtual_memlimit / lzma_cputhreads();
-+			uint64_t memory_usage_virt;
++				virtual_memlimit / ((threads_max == 0) ? 1 : threads_max);
 +			rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to %lu and "
 +			       "per CPU thread %lu\n", virtual_memlimit, virtual_memlimit_per_cpu_thread);
++			uint64_t memory_usage_virt;
 +			/* keep reducing the number of compression threads until memory
 +			   usage falls below the limit per CPU thread*/
 +			while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
 +			       virtual_memlimit_per_cpu_thread) {
-+				/* If number of threads goes down to zero lzma_stream_encoder will
-+				 * will return UINT64_MAX. We must check here to avoid an infinite loop.
++				/* If number of threads goes down to zero or in case of any other error
++				 * lzma_stream_encoder_mt_memusage will return UINT64_MAX. We must check
++				 * for both the cases here to avoid an infinite loop.
 +				 * If we get into situation that one thread requires more virtual memory
 +				 * than available we set one thread, print error message and try anyway. */
-+				if (--mt_options.threads == 0) {
++				if ((--mt_options.threads == 0) || (memory_usage_virt == UINT64_MAX)) {
 +					mt_options.threads = 1;
 +					rpmlog(RPMLOG_WARNING,
 +					       "XZ: Could not adjust number of threads to get below "
-- 
2.25.1

