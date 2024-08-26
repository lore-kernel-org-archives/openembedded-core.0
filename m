Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D458C5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 17:18:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.57536.1724692677216138286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 10:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3Mi7foE;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-202508cb8ebso30565575ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724692676; x=1725297476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qVUslDYBFYd3zpxB8xYJ56w4GV+zKO666zmK0t2ZdI=;
        b=e3Mi7foEd/tm7J+YGK254bNnvvpm2DpWFSF7DTHI+nWeoQ7ziz3tEnifAA8lb2jK7r
         Qwrc97fIPStyQQhLcerG7CGvqLS2M2gQXn2N1UkzJcCcKn6MzXXSlIjMlLkzLv0BvfEu
         Efia/PdgBPZRxBoNfvQEaM5EhrnyEn39VgH7Og4qfd3dhWC3Lh451DnIus2cQSvNb4h+
         UBMliUnm/vXWQtbZe9rUZP8urXAYLq6CnN+pJRjnYWsHU4S1dzHw6CJTLGnZQM+FMYFu
         1wHmjJrLBkto+JYz2m8hguOWFGAtQm4h68t7O7BINJKE/i7gp3QIYwR4cReexGZoUqVU
         DQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724692676; x=1725297476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qVUslDYBFYd3zpxB8xYJ56w4GV+zKO666zmK0t2ZdI=;
        b=kSwKLgttMTfeX4741m6+0pqhH9LLDf9raxwjbmYSU2fbFec3Bow4xMRICmoIbR2yQG
         U7tEQCdEGpFbs8dwDxnTX6f3CmSUOutWcTKG3E5+649rVi/KTmDItTxg8Uq1BWLyikxr
         nuJ8LNsxaXe5odSHrmGpiV/KIQwI1ZYvbtQI7F4oLHPw7Ot7G7I1nBjtiQ4dyLz99stQ
         pzG+Bc3e8tmETOK3CX3f+O/RGKNH0hqC03bmtU4CKJ6xDfCQ4FUiufKyNEr8l+d1cSVV
         KSu1NOLX+JVytCa73bytp187xT3elswLNIn/IeInS3KOQ2FEoxCqO8RcUEjYx4+KcmHH
         /AHQ==
X-Gm-Message-State: AOJu0YwjVWTwScJE94BAxVmbVTetpgH46HRI5WoT/B5E12Yf4+U122wJ
	vUINgkocSNxw54elI3sGihYxy4t3a42V4YUMAQQh/4L8GPV7zGh0geRvhg==
X-Google-Smtp-Source: AGHT+IF6aEs/O88yS2RKTfKTEJLfLiWBvhC1xPqSxvWoQopo4PT145stnqkE8BsaBPMIFaczWb7Nqw==
X-Received: by 2002:a17:902:f681:b0:202:3bda:6f39 with SMTP id d9443c01a7336-204df14be11mr2671205ad.17.1724692676209;
        Mon, 26 Aug 2024 10:17:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557eeccsm69968205ad.84.2024.08.26.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:17:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] quota: Apply a backport to fix basename API with musl
Date: Mon, 26 Aug 2024 10:17:50 -0700
Message-ID: <20240826171752.2886654-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826171752.2886654-1-raj.khem@gmail.com>
References: <20240826171752.2886654-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 17:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203762

Drop the local patches for supporting musl, as they are
either subsumed in the backport or are not needed anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../quota/0001-Fix-building-on-musl.patch     | 228 ++++++++++++++++++
 meta/recipes-extended/quota/quota/fcntl.patch |  70 ------
 meta/recipes-extended/quota/quota_4.09.bb     |   2 +-
 3 files changed, 229 insertions(+), 71 deletions(-)
 create mode 100644 meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
 delete mode 100644 meta/recipes-extended/quota/quota/fcntl.patch

diff --git a/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch b/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
new file mode 100644
index 00000000000..ce20f672cce
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
@@ -0,0 +1,228 @@
+From e73c5b48e12c3f02e532864a1107cdc8a4feafc3 Mon Sep 17 00:00:00 2001
+From: Brahmajit Das <brahmajit.xyz@gmail.com>
+Date: Sun, 14 Jul 2024 07:58:50 +0000
+Subject: [PATCH] Fix building on musl
+
+basename(3) is defined in libgen.h in MUSL. Include libgen.h where
+basename(3) is used.
+
+Upstream-Status: Backport [https://sourceforge.net/p/linuxquota/code/ci/e73c5b48e12c3f02e532864a1107cdc8a4feafc3/]
+Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+---
+ convertquota.c |  1 +
+ edquota.c      | 11 ++++++-----
+ quota.c        |  1 +
+ quota_nld.c    |  1 +
+ quotacheck.c   |  1 +
+ quotaon.c      |  1 +
+ quotastats.c   |  1 +
+ quotasync.c    |  1 +
+ repquota.c     |  1 +
+ rquota_svc.c   |  1 +
+ setquota.c     |  1 +
+ warnquota.c    |  1 +
+ xqmstats.c     |  1 +
+ 13 files changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/convertquota.c b/convertquota.c
+index 6c8a553..4eb05ed 100644
+--- a/convertquota.c
++++ b/convertquota.c
+@@ -14,6 +14,7 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include <endian.h>
+ 
+diff --git a/edquota.c b/edquota.c
+index 20ca306..c5b27cf 100644
+--- a/edquota.c
++++ b/edquota.c
+@@ -20,6 +20,7 @@
+ #include <stdlib.h>
+ #include <fcntl.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "quotaops.h"
+@@ -38,7 +39,7 @@ char *progname;
+ static int flags, quotatype;
+ static int fmt = -1;
+ static char *protoname;
+-static char *dirname;
++static char *dir_name;
+ 
+ static void usage(void)
+ {
+@@ -138,7 +139,7 @@ static int parse_options(int argc, char **argv)
+ 				  exit(1);
+ 			  break;
+ 		  case 'f':
+-			  dirname = optarg;
++			  dir_name = optarg;
+ 			  break;
+ 		  case 256:
+ 			  flags |= FL_NUMNAMES;
+@@ -176,7 +177,7 @@ static void copy_prototype(int argc, char **argv, struct quota_handle **handles)
+ 	protoprivs = getprivs(protoid, handles, 0);
+ 	while (argc-- > 0) {
+ 		id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
+-		curprivs = getprivs(id, handles, !dirname);
++		curprivs = getprivs(id, handles, !dir_name);
+ 		if (!curprivs)
+ 			die(1, _("Cannot get quota information for user %s\n"), *argv);
+ 		argv++;
+@@ -223,7 +224,7 @@ int main(int argc, char **argv)
+ 	argv += ret;
+ 
+ 	init_kernel_interface();
+-	handles = create_handle_list(dirname ? 1 : 0, dirname ? &dirname : NULL, quotatype, fmt,
++	handles = create_handle_list(dir_name ? 1 : 0, dir_name ? &dir_name : NULL, quotatype, fmt,
+ 			(flags & FL_NO_MIXED_PATHS) ? 0 : IOI_NFS_MIXED_PATHS,
+ 			(flags & FL_REMOTE) ? 0 : MS_LOCALONLY);
+ 	if (!handles[0]) {
+@@ -296,7 +297,7 @@ int main(int argc, char **argv)
+ 	else {
+ 		for (; argc > 0; argc--, argv++) {
+ 			id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
+-			curprivs = getprivs(id, handles, !dirname);
++			curprivs = getprivs(id, handles, !dir_name);
+ 			if (!curprivs)
+ 				die(1, _("Cannot get quota information for user %s.\n"), *argv);
+ 			if (flags & FL_EDIT_TIMES) {
+diff --git a/quota.c b/quota.c
+index a60de12..66b0fa3 100644
+--- a/quota.c
++++ b/quota.c
+@@ -20,6 +20,7 @@
+ #include <unistd.h>
+ #include <limits.h>
+ #include <ctype.h>
++#include <libgen.h>
+ #ifdef RPC
+ #include <rpc/rpc.h>
+ #include "rquota.h"
+diff --git a/quota_nld.c b/quota_nld.c
+index 58a62af..710b556 100644
+--- a/quota_nld.c
++++ b/quota_nld.c
+@@ -26,6 +26,7 @@
+ #include <fcntl.h>
+ #include <limits.h>
+ #include <signal.h>
++#include <libgen.h>
+ #include <sys/stat.h>
+ #include <asm/types.h>
+ 
+diff --git a/quotacheck.c b/quotacheck.c
+index e2c3bbd..fa1d297 100644
+--- a/quotacheck.c
++++ b/quotacheck.c
+@@ -19,6 +19,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <errno.h>
++#include <libgen.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
+diff --git a/quotaon.c b/quotaon.c
+index 351c851..17b6bcc 100644
+--- a/quotaon.c
++++ b/quotaon.c
+@@ -13,6 +13,7 @@
+ #include <string.h>
+ #include <stdlib.h>
+ #include <stdarg.h>
++#include <libgen.h>
+ 
+ #include "quotaon.h"
+ #include "quota.h"
+diff --git a/quotastats.c b/quotastats.c
+index a059812..4076a7d 100644
+--- a/quotastats.c
++++ b/quotastats.c
+@@ -24,6 +24,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <signal.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "common.h"
+diff --git a/quotasync.c b/quotasync.c
+index cad2a20..e90b24a 100644
+--- a/quotasync.c
++++ b/quotasync.c
+@@ -7,6 +7,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "common.h"
+diff --git a/repquota.c b/repquota.c
+index e79fc4d..8e509bd 100644
+--- a/repquota.c
++++ b/repquota.c
+@@ -18,6 +18,7 @@
+ #include <pwd.h>
+ #include <grp.h>
+ #include <getopt.h>
++#include <libgen.h>
+ 
+ #include "pot.h"
+ #include "common.h"
+diff --git a/rquota_svc.c b/rquota_svc.c
+index 6e856bb..c17df13 100644
+--- a/rquota_svc.c
++++ b/rquota_svc.c
+@@ -34,6 +34,7 @@
+ #include <signal.h>
+ #include <errno.h>
+ #include <netconfig.h>
++#include <libgen.h>
+ #ifdef HOSTS_ACCESS
+ #include <tcpd.h>
+ #include <netdb.h>
+diff --git a/setquota.c b/setquota.c
+index c517ab1..9e4b2fa 100644
+--- a/setquota.c
++++ b/setquota.c
+@@ -18,6 +18,7 @@
+ #include <time.h>
+ #include <ctype.h>
+ #include <stdlib.h>
++#include <libgen.h>
+ 
+ #if defined(RPC)
+ #include "rquota.h"
+diff --git a/warnquota.c b/warnquota.c
+index 2882fee..6f63ce7 100644
+--- a/warnquota.c
++++ b/warnquota.c
+@@ -31,6 +31,7 @@
+ #include <time.h>
+ #include <getopt.h>
+ #include <locale.h>
++#include <libgen.h>
+ #ifdef HAVE_NL_LANGINFO
+ #include <langinfo.h>
+ #endif
+diff --git a/xqmstats.c b/xqmstats.c
+index 59b1d66..345b060 100644
+--- a/xqmstats.c
++++ b/xqmstats.c
+@@ -8,6 +8,7 @@
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <string.h>
++#include <libgen.h>
+ #include "common.h"
+ #include "pot.h"
+ 
diff --git a/meta/recipes-extended/quota/quota/fcntl.patch b/meta/recipes-extended/quota/quota/fcntl.patch
deleted file mode 100644
index 09a0c687b64..00000000000
--- a/meta/recipes-extended/quota/quota/fcntl.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 00a456145531d194d3993c9f4cd404d5ca16c9df Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Apr 2015 17:36:44 +0000
-Subject: [PATCH] quota: Fix build with musl
-
-Include fcntl.h to pacify compiler errors on musl
-like
-
-error: unknown type name 'loff_t'
-Cover rpc headers under proper conditional
-Dont use __P its undefined
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- quotacheck.c    | 1 +
- quotaio.c       | 1 +
- rquota_client.c | 4 ++++
- 3 files changed, 6 insertions(+)
-
-diff --git a/quotacheck.c b/quotacheck.c
-index bd62d9a..772a27d 100644
---- a/quotacheck.c
-+++ b/quotacheck.c
-@@ -19,6 +19,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <errno.h>
-+#include <fcntl.h>
- 
- #include <sys/stat.h>
- #include <sys/types.h>
-diff --git a/quotaio.c b/quotaio.c
-index 94ae458..d57fc1a 100644
---- a/quotaio.c
-+++ b/quotaio.c
-@@ -12,6 +12,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <stdlib.h>
-+#include <fcntl.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/file.h>
-diff --git a/rquota_client.c b/rquota_client.c
-index 7f8e821..d48505a 100644
---- a/rquota_client.c
-+++ b/rquota_client.c
-@@ -19,7 +19,9 @@
- 
- #include "config.h"
- 
-+#if defined(RPC)
- #include <rpc/rpc.h>
-+#endif
- #include <sys/types.h>
- #include <sys/param.h>
- #include <sys/stat.h>
-@@ -35,7 +37,9 @@
- #include <stdint.h>
- 
- #include "mntopt.h"
-+#if defined(RPC)
- #include "rquota.h"
-+#endif
- #include "common.h"
- #include "quotaio.h"
- #include "quotasys.h"
diff --git a/meta/recipes-extended/quota/quota_4.09.bb b/meta/recipes-extended/quota/quota_4.09.bb
index b779657dfc5..8e4d4aed8b9 100644
--- a/meta/recipes-extended/quota/quota_4.09.bb
+++ b/meta/recipes-extended/quota/quota_4.09.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://fcntl.patch \
+           file://0001-Fix-building-on-musl.patch \
            "
 SRC_URI[sha256sum] = "9cdaca154bc92afc3117f0e5f5b3208dd5f84583af1cf061c39baa0a2bb142f9"
 

