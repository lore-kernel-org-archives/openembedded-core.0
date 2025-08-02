Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0C7C87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 15:53:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.556.1754149986767195931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 08:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HE57tNqN;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-615c29fc31eso4504994a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754149985; x=1754754785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=naRVuw0m0EAu19poWmBzSRgpt33EWJiID91wGZ8QNpw=;
        b=HE57tNqNmhvnYyXgQgWGqHDCW0qhIZLDkkP9NQHqgMX2TQAxEf1borW9R4vQC9K2lX
         EuyPuaxlkzrUaDkStZZUyyRkHFFDBfmpyX615jdTUjPl8D97UrKPAc7Ng64XIRcQ0I6T
         RlHDm2jdAeuT2vKCC8/DshzZ+xFqjIVzIzhGQej5tNDhLY1JzTpE6EJt28XmrmfZV9aH
         CPp6cRsG9VlhNzkdPWdQyKmB7xrxnCNCa7pG/ietj3ZqN7mHcMSWGIkyYpYCnAWN23MM
         45eIxiDeOLMqYsSr8PA17eNft8WvtDMNljrXasG0T7IxNR0HMU2NsK+2qpeDCwHE2e6Z
         frNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754149985; x=1754754785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naRVuw0m0EAu19poWmBzSRgpt33EWJiID91wGZ8QNpw=;
        b=Uwq/4lgSYkq4w36+FBOFMjc+uvDq8woJgRdOeOoCUeNKbs9tQo8qmf7Unh9haDQcET
         ajOZXpkThF86nt30hsyEeZZOqk8CoQ7+9qPlhvjl6VpZl/AICBbxs30f8/Pu9xJuAiO9
         Xro52hsmNQ7RxlUDm7XwOSUp4gkDEECkiTuM9Dqg6c/mkmfylibDexAz+Wn22KAFNG8v
         lEDIMloRREytBXzLQvzoVe2Fx5CqLau6IVppfX/5mZ+Qi40rUB7GM9CsYg765Tl6jV2m
         Ls8iUxVk2ToAQU7G+rmUNHY5qPqI/PB60JS6f9ZDBdL3cgn8Y89CABVHkHXsZNXxgguE
         thnQ==
X-Gm-Message-State: AOJu0Yy8u7jPm8IhR2X2osN2lmkFjRfO9V8l3wHeF7HFdzaymQZ/aAwO
	XNUmn9emUNLDIP0Tjq07vlF0XoGNByZ2Rz0P+BplYWIiVcgNlmsnUAZNVmZtzA==
X-Gm-Gg: ASbGncthfbkUk/LBaJwb6+jdCvYMHjMNhStgqMGPC9rd7PywzfPqEBT6JnBokH7uQSN
	1C37v/XyQvAJAZLuHdO1209MNFUFiNSYiSgv+iUWh7F4YhmUGWe/atAhBQ7fxDtAHO5zAsKO4Cq
	SIub1A/NmVizyOMByfK7NuRcjThqVlM4kJ72qcoRDY+u0QN7CWj6Kv6zpZfudyW7PTYjatR+6e0
	JSzO+7UT+XYXPlpddWVCtOwMIrVfFjBnBjN3YSW6sMULlgN4R+53QsW/wF/ST+JRu1AJNbLRoBg
	8ZoTd0DJhFEde9sVaQhPzrEuAWgUjbSvpDa/6HL/oIMD+hBU7MbAfj+3n36sj7wens1KQEoAYE/
	ePnqKA/To+b+5dIwWwOfhRhoa3kpONA==
X-Google-Smtp-Source: AGHT+IHfMoV1MmVvj0W5Sz4bWV2Nu++PsDXEg4rrBMLpbIMNKPii/8iAZu/V5O1fIJdT6nPyCqj2cQ==
X-Received: by 2002:a05:6402:26d3:b0:615:4227:3b2e with SMTP id 4fb4d7f45d1cf-615e71576a9mr2551230a12.23.1754149984728;
        Sat, 02 Aug 2025 08:53:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f385absm4226753a12.29.2025.08.02.08.53.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 08:53:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] quota: upgrade 4.09 -> 4.10
Date: Sat,  2 Aug 2025 17:53:03 +0200
Message-ID: <20250802155303.1812309-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 15:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221384

Drop 0001-Fix-building-on-musl.patch, because it is included in this release.
Add backported 0001-setproject-Fix-openWRT-build.patch, which adds a missing header
to prevent build failure with musl.

Changelog:
- Update Polish translation
- quotasys: Make detection of QF_META format work for bcachefs
- quotaio_xfs: Fix memory leak
- setproject: Add support for bcachefs REINHERIT_ATTRS ioctl
- setproject: Simple utility for setting projects on files/directories
- Move user/group/project name translation into common.[ch]
- Add support for bcachefs
- Fix building on musl
- quotaio_xfs: Convert remaining quotactl(2) calls to quotactl_handle()
- quotaio_xfs: Fix quota-tools on XFS
- quotaio_xfs: Fix error handling in xfs_read_dquot()
- Disable BSD_BEHAVIOUR by default
- quotaops: Checking egid with BSD_BEHAVIOR
- Enable support for tmpfs quotas
- Add quotactl_fd() support
- Rename searched_dir->sd_dir to sd_isdir
- quota-nld: fix open PID file failed when systemd read it
- edquota: Fix editing of individual user grace times
- setquota: Avoid false error messages when setting grace times
- Make configure.ac POSIX compliant
- Update required gettext version

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../quota/0001-Fix-building-on-musl.patch     | 228 ------------------
 .../0001-setproject-Fix-openWRT-build.patch   |  30 +++
 .../quota/{quota_4.09.bb => quota_4.10.bb}    |   4 +-
 3 files changed, 32 insertions(+), 230 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
 create mode 100644 meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
 rename meta/recipes-extended/quota/{quota_4.09.bb => quota_4.10.bb} (91%)

diff --git a/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch b/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
deleted file mode 100644
index ce20f672cc..0000000000
--- a/meta/recipes-extended/quota/quota/0001-Fix-building-on-musl.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From e73c5b48e12c3f02e532864a1107cdc8a4feafc3 Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Sun, 14 Jul 2024 07:58:50 +0000
-Subject: [PATCH] Fix building on musl
-
-basename(3) is defined in libgen.h in MUSL. Include libgen.h where
-basename(3) is used.
-
-Upstream-Status: Backport [https://sourceforge.net/p/linuxquota/code/ci/e73c5b48e12c3f02e532864a1107cdc8a4feafc3/]
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-Signed-off-by: Jan Kara <jack@suse.cz>
----
- convertquota.c |  1 +
- edquota.c      | 11 ++++++-----
- quota.c        |  1 +
- quota_nld.c    |  1 +
- quotacheck.c   |  1 +
- quotaon.c      |  1 +
- quotastats.c   |  1 +
- quotasync.c    |  1 +
- repquota.c     |  1 +
- rquota_svc.c   |  1 +
- setquota.c     |  1 +
- warnquota.c    |  1 +
- xqmstats.c     |  1 +
- 13 files changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/convertquota.c b/convertquota.c
-index 6c8a553..4eb05ed 100644
---- a/convertquota.c
-+++ b/convertquota.c
-@@ -14,6 +14,7 @@
- #include <fcntl.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include <endian.h>
- 
-diff --git a/edquota.c b/edquota.c
-index 20ca306..c5b27cf 100644
---- a/edquota.c
-+++ b/edquota.c
-@@ -20,6 +20,7 @@
- #include <stdlib.h>
- #include <fcntl.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "quotaops.h"
-@@ -38,7 +39,7 @@ char *progname;
- static int flags, quotatype;
- static int fmt = -1;
- static char *protoname;
--static char *dirname;
-+static char *dir_name;
- 
- static void usage(void)
- {
-@@ -138,7 +139,7 @@ static int parse_options(int argc, char **argv)
- 				  exit(1);
- 			  break;
- 		  case 'f':
--			  dirname = optarg;
-+			  dir_name = optarg;
- 			  break;
- 		  case 256:
- 			  flags |= FL_NUMNAMES;
-@@ -176,7 +177,7 @@ static void copy_prototype(int argc, char **argv, struct quota_handle **handles)
- 	protoprivs = getprivs(protoid, handles, 0);
- 	while (argc-- > 0) {
- 		id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
--		curprivs = getprivs(id, handles, !dirname);
-+		curprivs = getprivs(id, handles, !dir_name);
- 		if (!curprivs)
- 			die(1, _("Cannot get quota information for user %s\n"), *argv);
- 		argv++;
-@@ -223,7 +224,7 @@ int main(int argc, char **argv)
- 	argv += ret;
- 
- 	init_kernel_interface();
--	handles = create_handle_list(dirname ? 1 : 0, dirname ? &dirname : NULL, quotatype, fmt,
-+	handles = create_handle_list(dir_name ? 1 : 0, dir_name ? &dir_name : NULL, quotatype, fmt,
- 			(flags & FL_NO_MIXED_PATHS) ? 0 : IOI_NFS_MIXED_PATHS,
- 			(flags & FL_REMOTE) ? 0 : MS_LOCALONLY);
- 	if (!handles[0]) {
-@@ -296,7 +297,7 @@ int main(int argc, char **argv)
- 	else {
- 		for (; argc > 0; argc--, argv++) {
- 			id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
--			curprivs = getprivs(id, handles, !dirname);
-+			curprivs = getprivs(id, handles, !dir_name);
- 			if (!curprivs)
- 				die(1, _("Cannot get quota information for user %s.\n"), *argv);
- 			if (flags & FL_EDIT_TIMES) {
-diff --git a/quota.c b/quota.c
-index a60de12..66b0fa3 100644
---- a/quota.c
-+++ b/quota.c
-@@ -20,6 +20,7 @@
- #include <unistd.h>
- #include <limits.h>
- #include <ctype.h>
-+#include <libgen.h>
- #ifdef RPC
- #include <rpc/rpc.h>
- #include "rquota.h"
-diff --git a/quota_nld.c b/quota_nld.c
-index 58a62af..710b556 100644
---- a/quota_nld.c
-+++ b/quota_nld.c
-@@ -26,6 +26,7 @@
- #include <fcntl.h>
- #include <limits.h>
- #include <signal.h>
-+#include <libgen.h>
- #include <sys/stat.h>
- #include <asm/types.h>
- 
-diff --git a/quotacheck.c b/quotacheck.c
-index e2c3bbd..fa1d297 100644
---- a/quotacheck.c
-+++ b/quotacheck.c
-@@ -19,6 +19,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <errno.h>
-+#include <libgen.h>
- 
- #include <sys/stat.h>
- #include <sys/types.h>
-diff --git a/quotaon.c b/quotaon.c
-index 351c851..17b6bcc 100644
---- a/quotaon.c
-+++ b/quotaon.c
-@@ -13,6 +13,7 @@
- #include <string.h>
- #include <stdlib.h>
- #include <stdarg.h>
-+#include <libgen.h>
- 
- #include "quotaon.h"
- #include "quota.h"
-diff --git a/quotastats.c b/quotastats.c
-index a059812..4076a7d 100644
---- a/quotastats.c
-+++ b/quotastats.c
-@@ -24,6 +24,7 @@
- #include <errno.h>
- #include <string.h>
- #include <signal.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/quotasync.c b/quotasync.c
-index cad2a20..e90b24a 100644
---- a/quotasync.c
-+++ b/quotasync.c
-@@ -7,6 +7,7 @@
- #include <string.h>
- #include <errno.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/repquota.c b/repquota.c
-index e79fc4d..8e509bd 100644
---- a/repquota.c
-+++ b/repquota.c
-@@ -18,6 +18,7 @@
- #include <pwd.h>
- #include <grp.h>
- #include <getopt.h>
-+#include <libgen.h>
- 
- #include "pot.h"
- #include "common.h"
-diff --git a/rquota_svc.c b/rquota_svc.c
-index 6e856bb..c17df13 100644
---- a/rquota_svc.c
-+++ b/rquota_svc.c
-@@ -34,6 +34,7 @@
- #include <signal.h>
- #include <errno.h>
- #include <netconfig.h>
-+#include <libgen.h>
- #ifdef HOSTS_ACCESS
- #include <tcpd.h>
- #include <netdb.h>
-diff --git a/setquota.c b/setquota.c
-index c517ab1..9e4b2fa 100644
---- a/setquota.c
-+++ b/setquota.c
-@@ -18,6 +18,7 @@
- #include <time.h>
- #include <ctype.h>
- #include <stdlib.h>
-+#include <libgen.h>
- 
- #if defined(RPC)
- #include "rquota.h"
-diff --git a/warnquota.c b/warnquota.c
-index 2882fee..6f63ce7 100644
---- a/warnquota.c
-+++ b/warnquota.c
-@@ -31,6 +31,7 @@
- #include <time.h>
- #include <getopt.h>
- #include <locale.h>
-+#include <libgen.h>
- #ifdef HAVE_NL_LANGINFO
- #include <langinfo.h>
- #endif
-diff --git a/xqmstats.c b/xqmstats.c
-index 59b1d66..345b060 100644
---- a/xqmstats.c
-+++ b/xqmstats.c
-@@ -8,6 +8,7 @@
- #include <stdio.h>
- #include <unistd.h>
- #include <string.h>
-+#include <libgen.h>
- #include "common.h"
- #include "pot.h"
- 
diff --git a/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch b/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
new file mode 100644
index 0000000000..8ca3d9f773
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
@@ -0,0 +1,30 @@
+From 41ba7031ca4852739dd1f66102d34e4a98490906 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Tue, 1 Jul 2025 15:41:56 +0200
+Subject: [PATCH] setproject: Fix openWRT build
+
+basename() needs libgen.h include in openWRT build environment. Add it.
+
+Reported-by: "W. Michael Petullo" <mike@flyn.org>
+Signed-off-by: Jan Kara <jack@suse.cz>
+
+Upstream-Status: Backport [https://sourceforge.net/p/linuxquota/code/ci/41ba7031ca4852739dd1f66102d34e4a98490906/]
+
+This also fixes the build in Yocto.
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ setproject.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setproject.c b/setproject.c
+index e688dcd..4308435 100644
+--- a/setproject.c
++++ b/setproject.c
+@@ -13,6 +13,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <libgen.h>
+ 
+ #include <linux/fs.h>
+ 
diff --git a/meta/recipes-extended/quota/quota_4.09.bb b/meta/recipes-extended/quota/quota_4.10.bb
similarity index 91%
rename from meta/recipes-extended/quota/quota_4.09.bb
rename to meta/recipes-extended/quota/quota_4.10.bb
index 8e4d4aed8b..6f1dc58777 100644
--- a/meta/recipes-extended/quota/quota_4.09.bb
+++ b/meta/recipes-extended/quota/quota_4.10.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://0001-Fix-building-on-musl.patch \
+           file://0001-setproject-Fix-openWRT-build.patch \
            "
-SRC_URI[sha256sum] = "9cdaca154bc92afc3117f0e5f5b3208dd5f84583af1cf061c39baa0a2bb142f9"
+SRC_URI[sha256sum] = "a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e"
 
 CVE_PRODUCT = "linux_diskquota"
 

