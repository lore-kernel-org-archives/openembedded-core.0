Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB155C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:02:49 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4234.1785794563470740401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=f+kQHTQz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202608032202416ce89c9e4e00020762-eqxc6q@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608032202416ce89c9e4e00020762
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0bt/w6HnsQjesI6FWY9dcen6wNft8Fv906Utull7Iug=;
 b=f+kQHTQzIucZ9d4V4uvIWo3mojwACO0reD4Ka+k878gTZ1vJ1ixxeoTjVshWm9BdjeB3U2
 7tXEquW94BRKwipE8fI27553o8AiNo2HaLhqudeiScumeA8dx+cbbc+sygIuZc447rE9I6FF
 ROcsdD77Q+D1lbT8D8MBOiRbhDKMVIHd9dQ6lXdPbbUy80/GM0uW+i5ZSvg74oyoaiaAHoiF
 Qf1OhJZR77NI725ffvZHt+pguIqhRYy7a2Gr3U7ysxrrXQQKFutMjFj666Ml1xqdS/Cpn0A/
 6RESq5VJtwtgz4FYlwmN25UxI+kNQFS2Mqic7JR8wYP+mYgg6WuWriSg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 05/15] rsync: upgrade 3.4.1 -> 3.4.2
Date: Tue,  4 Aug 2026 00:01:45 +0200
Message-ID: <20260803220157.1520377-5-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242661

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Drop backported CVE patch included in this release.

Parts of the prototypes patch were fixed upstream (in zlib) but some sections
were not, drop the merged sections of the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 7ae818a6c3635bff7701c339174b6d281a507462)

Release notes:
* https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
* packaging: remove old release system
* runtests.py: error early when test helper programs are missing
* ci: add OpenBSD and NetBSD build jobs
* testsuite/xattrs: ignore SUNWattr_* in the Solaris xls helper
* use openat2 RESOLVE_BENEATH for secure_relative_open when available
  (this is a regression fix)
* Start 3.4.3dev going.
* testsuite: run protected-regular test as non-root using unshare
* ci: add Ubuntu 22.04 and AlmaLinux 8 workflows for backporting
* combined security fixes for 3.4.3 release
  * https://www.cve.org/CVERecord?id=CVE-2026-43617
  * https://www.cve.org/CVERecord?id=CVE-2026-43618
  * https://www.cve.org/CVERecord?id=CVE-2026-43619
  * https://www.cve.org/CVERecord?id=CVE-2026-43620
  * https://www.cve.org/CVERecord?id=CVE-2026-45232
  * https://www.cve.org/CVERecord?id=CVE-2026-29518

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
index 3011308c61..e6d3578e85 100644
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
index 1c5661d35b..0000000000
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
index f915d658c8..fd96b873c8 100644
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
index 42af4c55d0..fb195b1e68 100644
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
index 509be486b8..5fe1bc2c2b 100644
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

