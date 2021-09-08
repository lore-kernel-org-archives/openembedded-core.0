Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.11619.1631109764389442711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pL+Bj0Fb;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so1571710pjx.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=bQzGzwKjxN7WfoywyQOuG4PMXatAYdV3ZKQgTtpREII=;
        b=pL+Bj0FbnerM1A8BgSdtblEF/69Dy/SZbOYL/Cbiuc9+oV4mxJ1brc6vGXvk/6iB1i
         MGUDks9Gk1f9DAXr4poekkbJlvf2D2LDfq5OriSzOzH4NgaBg6riG40htumO2mxELWsI
         c9SlWBERFpnpTuQ5Axyd4Xt9plWcVKgN5hGIXJ+5a1GW7Sq6lMfp7tvY/AeBm07blY8D
         5c8tAesyBV3ty3OhKdLhPJC95CZP/N0xkJMvUQ03uWwXEk3zLcM8v/3PKXfByORbJ0k+
         hP2VUU2mX3h231ZjI1y9JMv6z0iAddRHgnMXgnVG5hJXP0Dyza/A+pNRW7X948f5UEGq
         il1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bQzGzwKjxN7WfoywyQOuG4PMXatAYdV3ZKQgTtpREII=;
        b=DwsKukgLp51KGZoOWHOL++0SQZZ8Z+PEKmE/vG1P5Jigykg8ETnO13l5/OiwG8SmbF
         y21Sh2hpVAJHOE7sSmBNo03CzEQhpi35WK/DU4jItsPfgBSiZ5kHO+YBp8wuS+Jyfls8
         tSHD56X2AC5/QbSPJuQfLrkLoFT3NJb+Y9CZuMSUJDqAGYsxNCvp6nTckJo54Yg5aHID
         D9k63Bhd05zVy0WUSlC0MT1kRpmzSS+z1YnBD1F+3KREovwq9o3MxCJQsQfoRbga7l/G
         GfpLRcvsKLMt6mXvGSjqXkHcTmSluoXzuh+8GHeTS4cItcjdSHiFbL2cJ9iUNsgMG59V
         9wAw==
X-Gm-Message-State: AOAM531YWKcoqGyDczbs9wKBVrv67J1IhOrt+AP1ruzTDUkzHP5dH2cn
	PIhGDptdkinBojUf4kcqENUDxhsYvpI=
X-Google-Smtp-Source: ABdhPJzkuxTX+O+J2E9aIrIyvr9J3MdDoO3wp42ktn8q1n+u8MnvAwCWsLelp6JhZd7b7X1Q75SgaQ==
X-Received: by 2002:a17:903:248:b0:138:d607:a8f4 with SMTP id j8-20020a170903024800b00138d607a8f4mr3320169plh.75.1631109763321;
        Wed, 08 Sep 2021 07:02:43 -0700 (PDT)
Return-Path: <ranjitsinhrathod1991@gmail.com>
Received: from localhost.localdomain ([103.238.105.154])
        by smtp.gmail.com with ESMTPSA id p4sm3063116pgc.15.2021.09.08.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 07:02:42 -0700 (PDT)
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH] rpm: Handle proper return value to avoid major issues and removing unnecessary code
Date: Wed,  8 Sep 2021 19:32:19 +0530
Message-Id: <20210908140219.19249-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Change in 2 patch as below to avoid critical issues
1) 0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
Handled return values of getrlimit() and lzma_cputhreads() functions
to avoid unexpected behaviours like devide by zero and potential read
of uninitialized variable 'virtual_memory'
Upstream-Status: Pending [merge of multithreading patches to upstream]

2) CVE-2021-3421.patch
Removed RPMSIGTAG_FILESIGNATURES and RPMSIGTAG_FILESIGNATURELENGTH as
it is not needed during backporting of original patch.
Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21]

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 ...rict-virtual-memory-usage-if-limit-s.patch | 25 ++++++++-------
 .../rpm/files/CVE-2021-3421.patch             | 32 +++----------------
 2 files changed, 19 insertions(+), 38 deletions(-)

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
diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
index b1a05b6863..d2ad5eabac 100644
--- a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
@@ -22,16 +22,16 @@ Fixes: CVE-2021-3421, CVE-2021-20271
 Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21]
 CVE: CVE-2021-3421
 Signed-off-by: Minjae Kim <flowergom@gmail.com>
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
 ---
- lib/package.c | 115 ++++++++++++++++++++++++--------------------------
- lib/rpmtag.h  |   4 ++
- 2 files changed, 58 insertions(+), 61 deletions(-)
+ lib/package.c | 113 ++++++++++++++++++++++++--------------------------
+ 1 file changed, 52 insertions(+), 61 deletions(-)
 
 diff --git a/lib/package.c b/lib/package.c
 index 081123d84e..7c26ea323f 100644
 --- a/lib/package.c
 +++ b/lib/package.c
-@@ -20,76 +20,68 @@
+@@ -20,76 +20,67 @@
  
  #include "debug.h"
  
@@ -46,8 +46,6 @@ index 081123d84e..7c26ea323f 100644
 +    { RPMSIGTAG_GPG, RPMTAG_SIGGPG, 0 },
 +    /* { RPMSIGTAG_PGP5, RPMTAG_SIGPGP5, 0 }, */ /* long obsolete, dont use */
 +    { RPMSIGTAG_PAYLOADSIZE, RPMTAG_ARCHIVESIZE, 1 },
-+    { RPMSIGTAG_FILESIGNATURES, RPMTAG_FILESIGNATURES, 0 },
-+    { RPMSIGTAG_FILESIGNATURELENGTH, RPMTAG_FILESIGNATURELENGTH, 1 },
 +    { RPMSIGTAG_SHA1, RPMTAG_SHA1HEADER, 1 },
 +    { RPMSIGTAG_SHA256, RPMTAG_SHA256HEADER, 1 },
 +    { RPMSIGTAG_DSA, RPMTAG_DSAHEADER, 0 },
@@ -61,6 +59,7 @@ index 081123d84e..7c26ea323f 100644
   * Translate and merge legacy signature tags into header.
   * @param h		header (dest)
   * @param sigh		signature header (src)
++ * @return		failing tag number, 0 on success
   */
  static
 -void headerMergeLegacySigs(Header h, Header sigh)
@@ -170,27 +169,6 @@ index 081123d84e..7c26ea323f 100644
  	    applyRetrofits(h);
  
  	    /* Bump reference count for return. */
-diff --git a/lib/rpmtag.h b/lib/rpmtag.h
-index 8c718b31b5..d562572c6f 100644
---- a/lib/rpmtag.h
-+++ b/lib/rpmtag.h
-@@ -65,6 +65,8 @@ typedef enum rpmTag_e {
-     RPMTAG_LONGARCHIVESIZE	= RPMTAG_SIG_BASE+15,	/* l */
-     /* RPMTAG_SIG_BASE+16 reserved */
-     RPMTAG_SHA256HEADER		= RPMTAG_SIG_BASE+17,	/* s */
-+    /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNATURES */
-+    /* RPMTAG_SIG_BASE+19 reserved for RPMSIGTAG_FILESIGNATURELENGTH */
- 
-     RPMTAG_NAME  		= 1000,	/* s */
- #define	RPMTAG_N	RPMTAG_NAME	/* s */
-@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {
-     RPMSIGTAG_LONGSIZE	= RPMTAG_LONGSIGSIZE,	/*!< internal Header+Payload size (64bit) in bytes. */
-     RPMSIGTAG_LONGARCHIVESIZE = RPMTAG_LONGARCHIVESIZE, /*!< internal uncompressed payload size (64bit) in bytes. */
-     RPMSIGTAG_SHA256	= RPMTAG_SHA256HEADER,
-+    RPMSIGTAG_FILESIGNATURES            = RPMTAG_SIG_BASE + 18,
-+    RPMSIGTAG_FILESIGNATURELENGTH       = RPMTAG_SIG_BASE + 19,
- } rpmSigTag;
- 
  
 -- 
 2.17.1
-- 
2.17.1

