Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B901ECD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9525.1777739486390475820
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bjyAdiEZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0046078so21538845e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739484; x=1778344284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuGJSeRc8/u4THghCJkpM6gTJe/pNIAE3DzGaEgpSMY=;
        b=bjyAdiEZXm2Itb6JDZveUlzvVJVJ50/y5lJeDi+KEq9nk5IvncesDp1ctGY+LTAtQX
         t9oH1db/cBhj96bQFLGVjr7TvV42GBGoYKb0z9QcubMPEpJqOEBlLQtUniM71Xms93sN
         1P8N/HM2+Ehl+7pgzk4dKRk4G5afHUaVHPLK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739484; x=1778344284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuGJSeRc8/u4THghCJkpM6gTJe/pNIAE3DzGaEgpSMY=;
        b=LOan7YIV1NPXUgjUntHTOKRcYYK8zu364VH0PvbSEO+Ib7HtCLUdbCYIrP7cngRqVg
         Was7YfB2p99kxc3D28JznI3ekLKyFutNpyifG2ekpeBxNgVkR2NEMsKWLIVtqtlJlNWM
         KOThb1tALlsnNdM72jO5EYf2qtdKYY4fCmif1LZRXV6nhOgkJNBue4TFikwT0jWc1oUU
         MXhOFCUKiFcZRtygLFbkXvK9xHQL4oXVAnyt190VVuXaWFlH9qPStDc7sL8883+AP7cQ
         uI8enGZnL4hXRFEIw51qLWjaWZjx1rjFO7KlbSCzKHOf7m+/NqLAbQ0courqpt7We1Ta
         Rk9A==
X-Gm-Message-State: AOJu0Yzt4brCZUcrClAA1zRYxgqQxcHZuuiID1PkZo9cmmjoo7gIDm6Y
	jUECFdTUgDv5nw4SmyE3aAeychwg8dXnsbxROoo6wpMR0EyJAKLQuDhv0PFVgvrdjpu7JIEutzB
	wBX7VRmSbn3UZ8j1dfVmUaDf6AS6HA3ROjRw0CvKqY/gwHpPK70xgg+V7gzy3vdv+fjAhkvfVAf
	MAw/5IaJLpsOZ2zf4=
X-Gm-Gg: AeBDiev2wXAv4VioWyyLGSAnwk70RTCXpLQ9bi21X4gaM1JQYba2VwTlNvaY3AYFFqB
	msSjMRSMwjgkXeu3FznC5BLvlk+HA00dloebWeWPV0I43vqfVO/0VU+yZw2ZZwmMAPfVliYhyFc
	2OolxhSep56XB7856/Qi+Uos8oMa5DvRnC6QEI7IZHZIeFGldWn0rZ0DtPQQAreIMZhnrffSvRD
	JR58Hha67W+GDBJKu7f/SImLw4iDiRGqMVwiCqbvzLCaH1spo6THCyEQROT9QqZL2pjdE7HZtQK
	E41+er98KZxj3wnrsTWytIEh8HPiVkHQkXG8OGAQdym/E7uY9WRepCaN3qHncGZ51W2F8499owH
	ph7azobj5Du559OPGCsHtVBdOLUKV36Fw/Ix5cbc7XK3e9uL9o3wiGHXnOzcHIUFyEjh9Dr86ff
	xlOG1oWSOZv027/zY3WEkRSZq+lHGrwMFiEtbooRsxKGyaujjm0FKj8YDz/yQfWg8=
X-Received: by 2002:a05:600c:444c:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-48a9866dcd9mr51533865e9.22.1777739484270;
        Sat, 02 May 2026 09:31:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 55/62] rsync: upgrade 3.4.1 -> 3.4.2
Date: Sat,  2 May 2026 17:29:15 +0100
Message-ID: <20260502162929.1377831-55-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236364

Drop backported CVE patch included in this release.

Parts of the prototypes patch were fixed upstream (in zlib) but some sections
were not, drop the merged sections of the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-prototypes-to-function-declarations.patch | 68 +++----------------
 .../rsync/files/CVE-2025-10158.patch          | 36 ----------
 .../rsync/files/determism.patch               |  4 +-
 .../rsync/files/makefile-no-rebuild.patch     |  6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb}  |  3 +-
 5 files changed, 16 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 3011308c61a..e6d3578e85c 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 073caa67f2aa221de113a21f8105940421a2da90 Mon Sep 17 00:00:00 2001
+From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -17,20 +17,17 @@ Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/03
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- checksum.c   | 2 +-
- exclude.c    | 2 +-
- log.c        | 2 +-
- main.c       | 2 +-
- zlib/crc32.c | 2 +-
- zlib/trees.c | 2 +-
- zlib/zutil.c | 4 ++--
- 7 files changed, 8 insertions(+), 8 deletions(-)
+ checksum.c | 2 +-
+ exclude.c  | 2 +-
+ log.c      | 2 +-
+ main.c     | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 66e8089..b24b202 100644
+index 24e46bf..6ae3178 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -40,7 +37,7 @@ index 66e8089..b24b202 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 87edbcf..ae0de2f 100644
+index 24de64f..a787488 100644
 --- a/exclude.c
 +++ b/exclude.c
 @@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
@@ -66,7 +63,7 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 4f070ac..f59eaec 100644
+index ccad28a..bbb09ba 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
@@ -78,48 +75,3 @@ index 4f070ac..f59eaec 100644
  {
  	char *gname;
  	uid_t uid;
-diff --git a/zlib/crc32.c b/zlib/crc32.c
-index 05733f4..50c6c02 100644
---- a/zlib/crc32.c
-+++ b/zlib/crc32.c
-@@ -187,7 +187,7 @@ local void write_table(out, table)
- /* =========================================================================
-  * This function can be used by asm versions of crc32()
-  */
--const z_crc_t FAR * ZEXPORT get_crc_table()
-+const z_crc_t FAR * ZEXPORT get_crc_table(void)
- {
- #ifdef DYNAMIC_CRC_TABLE
-     if (crc_table_empty)
-diff --git a/zlib/trees.c b/zlib/trees.c
-index 9c66770..0d9047e 100644
---- a/zlib/trees.c
-+++ b/zlib/trees.c
-@@ -231,7 +231,7 @@ local void send_bits(s, value, length)
- /* ===========================================================================
-  * Initialize the various 'constant' tables.
-  */
--local void tr_static_init()
-+local void tr_static_init(void)
- {
- #if defined(GEN_TREES_H) || !defined(STDC)
-     static int static_init_done = 0;
-diff --git a/zlib/zutil.c b/zlib/zutil.c
-index bbba7b2..61f8dc9 100644
---- a/zlib/zutil.c
-+++ b/zlib/zutil.c
-@@ -27,12 +27,12 @@ z_const char * const z_errmsg[10] = {
- ""};
- 
- 
--const char * ZEXPORT zlibVersion()
-+const char * ZEXPORT zlibVersion(void)
- {
-     return ZLIB_VERSION;
- }
- 
--uLong ZEXPORT zlibCompileFlags()
-+uLong ZEXPORT zlibCompileFlags(void)
- {
-     uLong flags;
- 
diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
deleted file mode 100644
index 1c5661d35b5..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c2ff1647b1d9a0b92b73af106ce133490306e886 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Aug 2025 17:26:53 +1000
-Subject: [PATCH] fixed an invalid access to files array
-
-this was found by Calum Hutton from Rapid7. It is a real bug, but
-analysis shows it can't be leverged into an exploit. Worth fixing
-though.
-
-Many thanks to Calum and Rapid7 for finding and reporting this
-
-CVE: CVE-2025-10158
-
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
-
-Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
----
- sender.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sender.c b/sender.c
-index a4d46c39..b1588b70 100644
---- a/sender.c
-+++ b/sender.c
-@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
- 
- 		if (ndx - cur_flist->ndx_start >= 0)
- 			file = cur_flist->files[ndx - cur_flist->ndx_start];
-+		else if (cur_flist->parent_ndx < 0)
-+			exit_cleanup(RERR_PROTOCOL);
- 		else
- 			file = dir_flist->files[cur_flist->parent_ndx];
- 		if (F_PATHNAME(file)) {
--- 
-2.51.2
-
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index f915d658c88..fd96b873c85 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 41b859a9df9611b7b3f6cbe28af47118d947080f Mon Sep 17 00:00:00 2001
+From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1d13e8c..2c5cf99 100644
+index 80e9d72..a7d313c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 42af4c55d00..fb195b1e685 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 603e5862cca832ae925d0c92a8654a57caff5910 Mon Sep 17 00:00:00 2001
+From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7c75c26..1d13e8c 100644
+index c2fe775..80e9d72 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -184,60 +184,6 @@ conf: configure.sh config.h.in
+@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.4.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.2.bb
index 509be486b87..5fe1bc2c2b3 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://CVE-2025-10158.patch \
            "
-SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
+SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846

