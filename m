Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.15131.1631123140869278018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 10:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pY9Fivp+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id l11so1775610plk.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=eS5N88Bpf+I59doz+ur7guBldnc4rU5/fF/KBiCUmv8=;
        b=pY9Fivp+w1tsEsVipsnVdcquoz4mBCfyvEA9+DzCuNTzFCtdHrrkJCPQ9xMoAxXApN
         kIRgpdkHwYOT6Ow0SUIzQ8k+PJOGxXamO+fi/tQ15XmTyCGyBJIq87M9IhO/xyNzqvcT
         bRuIUXKAuXuaEoD9PUR6aZEFZ17HVo6uQw7n1zCpW1He6QWm/OCSZWb+H4ZG6vRYtscx
         8zrXVDz65X4O8jpHIt5cuQRNlhLeOfO1izAB92xMYDjR62LEIcT0SfHtrsSc7Nejeugd
         AS+S67AolVyK2itLlqAfZJbHwbRdbvg4uGhcP46h8HvXZ19NCJpR43zkH/WHYb73naM+
         vn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eS5N88Bpf+I59doz+ur7guBldnc4rU5/fF/KBiCUmv8=;
        b=mXzLwSlSoeXkQgMRS8SQI2Bhyx4/OvSa5+tQfAn//zPtLth39ZTw8iME9KFfMTuoXa
         a9MpgZyEZJVw/aHu9vw853194RZA7/F9j9A+cvoYG1FlrT6cn9Ie/UxlPQD1BYWYQeGK
         fdC7maeVyRxkOzx0qjCOTEeuOHlmEw4Id/VUeicEPUUdLELeEXd3rXkpGSCuAWIvTAfn
         lMkgtF2bC1416rFnAgF98QkRnRBBPEKCbEFD9pNFzt5xTynK0ZRDBgAdbcrapXtpLLVn
         5koUQK9aC0Xw52B8dieCVjI9yaxc6uzcKzq9dXdTrcHixSmEWeMFmwBHArgBgPQaofgB
         /kzA==
X-Gm-Message-State: AOAM530q0gI6YdsoC5bNnlvyIO92HriBzZfrle9VmucKGEXQV3kDp+fD
	SocxpprjZEpjp8SCQJO64A4aaxXLJgY=
X-Google-Smtp-Source: ABdhPJyYWapyIcVIs/WROfTp19qUm+STB7IsoisjXcIwLrNrasv4mg7aZstcZ2VwkrEf3OsQTkaJZQ==
X-Received: by 2002:a17:902:7e47:b0:137:60bd:c08f with SMTP id a7-20020a1709027e4700b0013760bdc08fmr4114996pln.8.1631123139975;
        Wed, 08 Sep 2021 10:45:39 -0700 (PDT)
Return-Path: <ranjitsinhrathod1991@gmail.com>
Received: from localhost.localdomain ([103.238.105.154])
        by smtp.gmail.com with ESMTPSA id n185sm3183165pfn.171.2021.09.08.10.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 10:45:39 -0700 (PDT)
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][master][PATCH] rpm: Handle proper return value to avoid major issues
Date: Wed,  8 Sep 2021 23:15:15 +0530
Message-Id: <20210908174515.11125-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch changed
to avoid critical issues
Handled return values of getrlimit() and lzma_cputhreads() functions
to avoid unexpected behaviours like devide by zero and potential read
of uninitialized variable 'virtual_memory'
Upstream-Status: Pending [merge of multithreading patches to upstream]

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
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
2.17.1

