Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78598C369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:41:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.43309.1744018859204381757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JCUy63gk;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso45444885e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018857; x=1744623657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8p/pov1qBoNfx+SqnTlz41RQkEbHc27Qw/9E0kHuoo=;
        b=JCUy63gkDhoMqC1AsJWdjePJflh29NMPBhUzN1rlApZEToR7kfrqz/pc/VMidregAo
         ZyC8JC9qHXt8fAElzw8u6fA6GX3p/c1HZ4EuD/ewnFrcAW/LGm8+GTmUZJl9G2OwXRHj
         JmHuuB6Ij3krM9BNYZ+c6estV2Tq54v0bN7XnNRUkTRClxFuc51jFCGkdUbG324cDiPb
         xTbjnEDZYgWiB0ihg2j6K6UqDYweuZepRQu79DZBimFo1aSoAmsGeo8E+JDOCRqbkf4D
         ig/7jMbyzNZO9SN+Xz8GUY60tiaXTkR9r7wODacswC/0bMvauhl6/K3ZAzGcjQJi2Y6R
         +6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018857; x=1744623657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8p/pov1qBoNfx+SqnTlz41RQkEbHc27Qw/9E0kHuoo=;
        b=reem33P5G91SPj2xunxBEMC7ZTb30Av+uU97M0e/tl3rlSzcbaIUkNgYHNZCz3ehR8
         s00chAcQPoSs9cKzMNsdW5vmN5+4435HRGAuWXH5PNYlHqOZuEuy8tgfp2caoHcVRo9k
         EVVIn8lKP8U+wY0kpnhpDR/x7qxTVIPhEq9gyGUUfJNp8d1BFFYH75TIOj2TjdieU+pv
         VwLNdm39zIB2aSI6XYzY96JpjniNVghVFKpLfqHwv7rNJz7uCdU6jqtJY7styzmQ6VyX
         dsutDu8xapnHloNQ4VwbIPOB7/oEKPxa1bnzhbthnZnTIUUXw1bXRhnnkyAw0YHYMU4R
         waLw==
X-Gm-Message-State: AOJu0YzH3uOaYZfIRULu+wfYsgOTMmVgs8McpZ13GZsyhboto7kauu0D
	7RMlU2Tuk0jZsL6iJKNQ+g9aEg8MXnfCEEtQ2bnPDdCO0oMIRRfOykfY1g==
X-Gm-Gg: ASbGncvTurgrp5TG9iqxRMm79v+7NrGv37wqEBkGwxh88zEqXjSOaqlII3d8SihpLYW
	AG8pAwCPvnSJrhpezycEBJnTK0u2nAmGBC3AabcEhuUv9sBBHBneL4zshAxriRr5+ToQNsEytIV
	V74QP10zhv4ttued2xmQhE5RbHr9/eDai3cItQiOtVfdrLWPK+RqOAnoIGfHnK+FbwDqw8x2SPn
	chHFhEvBauE+qgCiNHQHevlzx5/jR1qyLFIQQFb9cd3z2IK92QhKPMRqbU5M0rZqQPP3XU1YZrV
	d5haayGJyx1t8OD41h021WJqrwJRDAFY00kZ6BXC/dAhUTq0CYGN7npkDr3hE4wKrFtciuu6jPn
	WPCKFiA==
X-Google-Smtp-Source: AGHT+IEChngNbWRcuBkyy96gKm5uZGw3dfT5I5Np3D62X+jt2CCbOI6zn72tpceSLaAZzLyY99ebxA==
X-Received: by 2002:a05:6000:420f:b0:39c:2692:425a with SMTP id ffacd0b85a97d-39d0873fcd8mr8176153f8f.6.1744018857226;
        Mon, 07 Apr 2025 02:40:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/18] mdadm: update 4.3 -> 4.4
Date: Mon,  7 Apr 2025 11:40:39 +0200
Message-Id: <20250407094045.753021-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214421

From: Alexander Kanavin <alex@linutronix.de>

This update has been tested with glibc/musl and gcc/clang in all four
combinations.

Drop patches:
0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
0001-fix-gcc-8-format-truncation-warning.patch
0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
mdadm-3.3.2_x32_abi_time_t.patch
(issue fixed upstream)

0001-include-libgen.h-for-basename-API.patch
0001-mdadm.h-Undefine-dprintf-before-redefining.patch
(issue no longer occurs)

0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
(service file significantly rewritten, the need for the tweak
should be reassessed)

debian-no-Werror.patch
(replaced with setting CWFLAGS to an empty string in the recipe;
we already set correct flags via CC/CFLAGS, and upstream's only
get in the way)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-corosync-and-dlm-header-files-check.patch |  6 +-
 .../files/0001-Makefile-install-mdcheck.patch |  6 +-
 ...for-implicit-fallthrough-warning-sup.patch | 44 ---------------
 ...-fix-gcc-8-format-truncation-warning.patch | 36 ------------
 ...01-include-libgen.h-for-basename-API.patch | 56 -------------------
 ...-y-for-use-syslog-to-recive-event-re.patch | 25 ---------
 ...h-Undefine-dprintf-before-redefining.patch | 39 -------------
 ...FILE_OFFSET_BITS-to-enable-largefile.patch | 18 +++---
 ...ts.h-include-for-NAME_MAX-definition.patch | 24 --------
 ...-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch | 10 ++--
 .../mdadm/files/debian-no-Werror.patch        | 29 ----------
 .../files/mdadm-3.3.2_x32_abi_time_t.patch    | 36 ------------
 .../mdadm/files/xmalloc.patch                 | 32 +++++++++++
 .../mdadm/{mdadm_4.3.bb => mdadm_4.4.bb}      | 15 ++---
 14 files changed, 56 insertions(+), 320 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/debian-no-Werror.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
 create mode 100644 meta/recipes-extended/mdadm/files/xmalloc.patch
 rename meta/recipes-extended/mdadm/{mdadm_4.3.bb => mdadm_4.4.bb} (84%)

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
index fa1f0aa5204..8598aea1f1e 100644
--- a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
@@ -1,4 +1,4 @@
-From 76856a34a4e339e4a53b09d028f89fcc520e3127 Mon Sep 17 00:00:00 2001
+From 232101e2fcc6359fb6db2bc232570e373e368c75 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 9 Feb 2016 11:44:01 +0200
 Subject: [PATCH] Fix the path of corosync and dlm header files check
@@ -14,10 +14,10 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index cbdba49..7bfd336 100644
+index bcd092de..0a78cd22 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -109,8 +109,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
+@@ -130,8 +130,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
  SYSTEMD_DIR=/lib/systemd/system
  LIB_DIR=/usr/libexec/mdadm
  
diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
index a4be1aa8a1c..bb4e8d06042 100644
--- a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -1,4 +1,4 @@
-From 0be066d57a7dd1aead5488d0a095863608f2e559 Mon Sep 17 00:00:00 2001
+From 407691e11037709af888ce2cf6bd5eac6971ac61 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 25 Jan 2022 16:25:01 +0800
 Subject: [PATCH] Makefile: install mdcheck
@@ -14,10 +14,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile b/Makefile
-index 1141971..f4059e2 100644
+index 981e16fa..b28e7855 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -325,6 +325,7 @@ install-systemd: systemd/mdmon@.service
+@@ -345,6 +345,7 @@ install-systemd: systemd/mdmon@.service
  install-bin: mdadm mdmon
  	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
  	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
diff --git a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch b/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
deleted file mode 100644
index 16fdefbbd1c..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c29d086714b49a6d76ccca83b4a6fa2f139bad6e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 13 Oct 2017 10:27:34 -0700
-Subject: [PATCH] Use CC to check for implicit-fallthrough warning support
-
-This warning it new in gcc7 and in cross compile case
-its possible that build host gcc is version 7+ but the
-cross compile used for compiling mdadm is < version 7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 7bfd336..9ab6a65 100644
---- a/Makefile
-+++ b/Makefile
-@@ -56,21 +56,21 @@ CWFLAGS += -Wp -O3
- endif
- 
- ifeq ($(origin FALLTHROUGH), undefined)
--	FALLTHROUGH := $(shell gcc -Q --help=warnings 2>&1 | grep "implicit-fallthrough" | wc -l)
-+	FALLTHROUGH := $(shell ${CC} -Q --help=warnings 2>&1 | grep "implicit-fallthrough" | wc -l)
- 	ifneq "$(FALLTHROUGH)"  "0"
- 	CWFLAGS += -Wimplicit-fallthrough=0
- 	endif
- endif
- 
- ifeq ($(origin FORMATOVERFLOW), undefined)
--	FORMATOVERFLOW := $(shell gcc -Q --help=warnings 2>&1 | grep "format-overflow" | wc -l)
-+	FORMATOVERFLOW := $(shell ${CC} -Q --help=warnings 2>&1 | grep "format-overflow" | wc -l)
- 	ifneq "$(FORMATOVERFLOW)"  "0"
- 	CWFLAGS += -Wformat-overflow
- 	endif
- endif
- 
- ifeq ($(origin STRINGOPOVERFLOW), undefined)
--	STRINGOPOVERFLOW := $(shell gcc -Q --help=warnings 2>&1 | grep "stringop-overflow" | wc -l)
-+	STRINGOPOVERFLOW := $(shell ${CC} -Q --help=warnings 2>&1 | grep "stringop-overflow" | wc -l)
- 	ifneq "$(STRINGOPOVERFLOW)"  "0"
- 	CWFLAGS += -Wstringop-overflow
- 	endif
diff --git a/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch b/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
deleted file mode 100644
index 3cf295106fb..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-fix-gcc-8-format-truncation-warning.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 78e5bb08971a5644a56af60d51ef35e13522e811 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 14 Dec 2018 15:12:31 +0800
-Subject: [PATCH] fix gcc-8 format-truncation warning
-
-While compiling with `-Werror=format-truncation=', it failed
-[snip]
-|super0.c:236:32: error: 'snprintf' output may be truncated
-before the last format character [-Werror=format-truncation=]
-|   snprintf(nb, sizeof(nb), "%4d", d);
-|                                ^
-|super0.c:236:3: note: 'snprintf' output between 5 and 12 bytes
-into a destination of size 11
-|   snprintf(nb, sizeof(nb), "%4d", d);
-[snip]
-
-Upstream-Status: Submitted [https://github.com/neilbrown/mdadm/pull/34]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- super0.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/super0.c b/super0.c
-index a7c5f81..a79b6bd 100644
---- a/super0.c
-+++ b/super0.c
-@@ -229,7 +229,7 @@ static void examine_super0(struct supertype *st, char *homehost)
- 	     d++) {
- 		mdp_disk_t *dp;
- 		char *dv;
--		char nb[11];
-+		char nb[12];
- 		int wonly, failfast;
- 		if (d>=0) dp = &sb->disks[d];
- 		else dp = &sb->this_disk;
diff --git a/meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch b/meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 70be43c15ec..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 7759ceda978aba38861d4846d0c1657465b72f04 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Mar 2024 23:13:32 -0700
-Subject: [PATCH] include libgen.h for basename API
-
-Musl does no more provide it via string.h therefore builds with newer
-compilers e.g. clang-18 fails due to missing prototype for basename
-therefore add libgen.h to included headers list
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-raid/20240325061537.275811-1-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Monitor.c        | 1 +
- platform-intel.c | 1 +
- super-intel.c    | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/Monitor.c b/Monitor.c
-index 824a69f..e3942e1 100644
---- a/Monitor.c
-+++ b/Monitor.c
-@@ -26,6 +26,7 @@
- #include	"udev.h"
- #include	"md_p.h"
- #include	"md_u.h"
-+#include  <libgen.h>
- #include	<sys/wait.h>
- #include	<limits.h>
- #include	<syslog.h>
-diff --git a/platform-intel.c b/platform-intel.c
-index ac282bc..5d6687d 100644
---- a/platform-intel.c
-+++ b/platform-intel.c
-@@ -19,6 +19,7 @@
- #include "mdadm.h"
- #include "platform-intel.h"
- #include "probe_roms.h"
-+#include <libgen.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/super-intel.c b/super-intel.c
-index dbea235..881dbda 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -23,6 +23,7 @@
- #include "dlink.h"
- #include "sha1.h"
- #include "platform-intel.h"
-+#include <libgen.h>
- #include <values.h>
- #include <scsi/sg.h>
- #include <ctype.h>
--- 
-2.44.0
-
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
deleted file mode 100644
index f224d0008d4..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c27e128fdc062ec3fcdf7b48a8c5078615c538df Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 1 Jul 2019 11:34:49 +0800
-Subject: [PATCH] mdadm: add option -y for use syslog to recive event report
-
-fix service startup failed when there is
-No mail address or alert command
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- systemd/mdmonitor.service | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/systemd/mdmonitor.service b/systemd/mdmonitor.service
-index 9c36478..d289846 100644
---- a/systemd/mdmonitor.service
-+++ b/systemd/mdmonitor.service
-@@ -14,4 +14,4 @@ Documentation=man:mdadm(8)
- Environment=  MDADM_MONITOR_ARGS=--scan
- EnvironmentFile=-/run/sysconfig/mdadm
- ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
--ExecStart=BINDIR/mdadm --monitor $MDADM_MONITOR_ARGS
-+ExecStart=BINDIR/mdadm --monitor -y $MDADM_MONITOR_ARGS
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
deleted file mode 100644
index 52daea2a495..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4dd5c2659722b44409cee28b4cea68cdeaa1f987 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 9 May 2016 22:03:57 +0000
-Subject: [PATCH] mdadm.h: Undefine dprintf before redefining
-
-dprintf is also defined in libc see
-usr/include/bits/stdio2.h, this comes into
-play especially when fortify sources is enabled
-and compilers like clang reports the override
-
-In file included from policy.c:25:
-./mdadm.h:1562:9: error: 'dprintf' macro redefined [-Werror,-Wmacro-redefined]
-        ^
-/mnt/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/bits/stdio2.h:145:12: note: previous definition is here
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- mdadm.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/mdadm.h b/mdadm.h
-index 1f28b3e..04996e2 100644
---- a/mdadm.h
-+++ b/mdadm.h
-@@ -1869,11 +1869,13 @@ static inline sighandler_t signal_s(int sig, sighandler_t handler)
- }
- 
- #ifdef DEBUG
-+#undef dprintf
- #define dprintf(fmt, arg...) \
- 	fprintf(stderr, "%s: %s: "fmt, Name, __func__, ##arg)
- #define dprintf_cont(fmt, arg...) \
- 	fprintf(stderr, fmt, ##arg)
- #else
-+#undef dprintf
- #define dprintf(fmt, arg...) \
-         ({ if (0) fprintf(stderr, "%s: %s: " fmt, Name, __func__, ##arg); 0; })
- #define dprintf_cont(fmt, arg...) \
diff --git a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
index 13435ee418f..aa874dbec36 100644
--- a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
+++ b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
@@ -1,4 +1,4 @@
-From aa86de05cd6a75222b38e0789ac96fe00f705430 Mon Sep 17 00:00:00 2001
+From 9e3b15adf86147fe581cd2159cb99708abe26158 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Nov 2022 12:31:22 -0800
 Subject: [PATCH] restripe.c: Use _FILE_OFFSET_BITS to enable largefile support
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 22 insertions(+), 15 deletions(-)
 
 diff --git a/raid6check.c b/raid6check.c
-index 9947776..8e7f142 100644
+index 99477761..8e7f1421 100644
 --- a/raid6check.c
 +++ b/raid6check.c
 @@ -22,6 +22,9 @@
@@ -60,7 +60,7 @@ index 9947776..8e7f142 100644
  			if (seek_res < 0) {
  				fprintf(stderr, "lseek to source %d failed\n", i);
 diff --git a/restripe.c b/restripe.c
-index a7a7229..1c03577 100644
+index 5e126eb7..af76c634 100644
 --- a/restripe.c
 +++ b/restripe.c
 @@ -22,6 +22,9 @@
@@ -71,9 +71,9 @@ index a7a7229..1c03577 100644
 +#define _FILE_OFFSET_BITS 64
 +
  #include "mdadm.h"
- #include <stdint.h>
+ #include "xmalloc.h"
  
-@@ -581,7 +584,7 @@ int save_stripes(int *source, unsigned long long *offsets,
+@@ -583,7 +586,7 @@ int save_stripes(int *source, unsigned long long *offsets,
  				       raid_disks, level, layout);
  			if (dnum < 0) abort();
  			if (source[dnum] < 0 ||
@@ -82,7 +82,7 @@ index a7a7229..1c03577 100644
  				    offsets[dnum] + offset, 0) < 0 ||
  			    read(source[dnum], buf+disk * chunk_size,
  				 chunk_size) != chunk_size) {
-@@ -754,8 +757,8 @@ int restore_stripes(int *dest, unsigned long long *offsets,
+@@ -756,8 +759,8 @@ int restore_stripes(int *dest, unsigned long long *offsets,
  					   raid_disks, level, layout);
  			if (src_buf == NULL) {
  				/* read from file */
@@ -93,7 +93,7 @@ index a7a7229..1c03577 100644
  					rv = -1;
  					goto abort;
  				}
-@@ -816,7 +819,7 @@ int restore_stripes(int *dest, unsigned long long *offsets,
+@@ -818,7 +821,7 @@ int restore_stripes(int *dest, unsigned long long *offsets,
  		}
  		for (i=0; i < raid_disks ; i++)
  			if (dest[i] >= 0) {
@@ -102,7 +102,7 @@ index a7a7229..1c03577 100644
  					 offsets[i]+offset, 0) < 0) {
  					rv = -1;
  					goto abort;
-@@ -866,7 +869,7 @@ int test_stripes(int *source, unsigned long long *offsets,
+@@ -868,7 +871,7 @@ int test_stripes(int *source, unsigned long long *offsets,
  		int disk;
  
  		for (i = 0 ; i < raid_disks ; i++) {
@@ -112,7 +112,7 @@ index a7a7229..1c03577 100644
  			     chunk_size)) {
  				free(q);
 diff --git a/swap_super.c b/swap_super.c
-index b6db574..18c89e2 100644
+index b6db5743..18c89e2b 100644
 --- a/swap_super.c
 +++ b/swap_super.c
 @@ -1,3 +1,6 @@
diff --git a/meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch b/meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
deleted file mode 100644
index 0916efafdf5..00000000000
--- a/meta/recipes-extended/mdadm/files/0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 8fa7d3cb96e8833743b635fb198675ad6c020b6e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 12 Mar 2024 10:51:51 +0100
-Subject: [PATCH] util.c: add limits.h include for NAME_MAX definition
-
-Upstream-Status: Submitted [mariusz.tkaczyk@linux.intel.com,linux-raid@vger.kernel.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.c b/util.c
-index b145447..a9cb6c4 100644
---- a/util.c
-+++ b/util.c
-@@ -36,7 +36,7 @@
- #include	<ctype.h>
- #include	<dirent.h>
- #include	<dlfcn.h>
--
-+#include	<limits.h>
- 
- /*
-  * following taken from linux/blkpg.h because they aren't
diff --git a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
index 145c65477ab..e425fc446e2 100644
--- a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
+++ b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
@@ -1,4 +1,4 @@
-From a22b2345b9773d362acd85dd4c4a6a3cda9100d4 Mon Sep 17 00:00:00 2001
+From 8de073c637a1ea968b7304f373a20b13a4a47bbc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 12 Mar 2024 10:54:08 +0100
 Subject: [PATCH] Create.c: include linux/falloc.h for FALLOC_FL_ZERO_RANGE
@@ -14,14 +14,14 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/Create.c b/Create.c
-index 8082f54..7071f0a 100644
+index fd6c9215..3210a03e 100644
 --- a/Create.c
 +++ b/Create.c
-@@ -31,6 +31,7 @@
+@@ -33,6 +33,7 @@
  #include	<signal.h>
  #include	<sys/signalfd.h>
  #include	<sys/wait.h>
 +#include	<linux/falloc.h>
  
- static int round_size_and_verify(unsigned long long *size, int chunk)
- {
+ #ifndef FALLOC_FL_ZERO_RANGE
+ #define FALLOC_FL_ZERO_RANGE 16
diff --git a/meta/recipes-extended/mdadm/files/debian-no-Werror.patch b/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
deleted file mode 100644
index b758fcd0ab2..00000000000
--- a/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 319b3191f088cea7b0fb6038ab7625d5e049dcf7 Mon Sep 17 00:00:00 2001
-From: "martin f. krafft" <madduck@debian.org>
-Date: Mon, 3 Jan 2022 19:14:12 +0000
-Subject: [PATCH] Remove -Werror from compiler flags
-
--Werror seems like a bad idea on released/packaged code because a toolchain
-update (introducing new warnings) could break the build. We'll let upstream
-use it to beautify the code, but remove it for out builds.
-
-Signed-off-by: martin f. krafft <madduck@debian.org>
-
-Upstream-Status: Pending
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 9ab6a65..1141971 100644
---- a/Makefile
-+++ b/Makefile
-@@ -50,7 +50,7 @@ ifeq ($(origin CC),default)
- CC := $(CROSS_COMPILE)gcc
- endif
- CXFLAGS ?= -ggdb
--CWFLAGS ?= -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter -Wformat -Wformat-security -Werror=format-security -fstack-protector-strong -fPIE -Warray-bounds
-+CWFLAGS ?= -Wall -Wstrict-prototypes -Wextra -Wno-unused-parameter -Wformat -Wformat-security -Werror=format-security -fstack-protector-strong -fPIE -Warray-bounds
- ifdef WARN_UNUSED
- CWFLAGS += -Wp -O3
- endif
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
deleted file mode 100644
index ecd1f037d01..00000000000
--- a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ca91d9fc07943f209988411f2596e4b69828f208 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Sun, 15 Mar 2015 09:02:14 +0000
-Subject: [PATCH] mdadm: Fix build in x32 ABI
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When try to print time_t values as a long int it causes an error because time_t
-data type in x32 ABI is long long int.
-
-Upstream-Status: Pending
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
----
- monitor.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/monitor.c b/monitor.c
-index 4acec67..8dcdfd6 100644
---- a/monitor.c
-+++ b/monitor.c
-@@ -447,9 +447,12 @@ static int read_and_act(struct active_array *a, fd_set *fds)
- 		if (FD_ISSET(mdi->bb_fd, fds))
- 			check_for_cleared_bb(a, mdi);
- 	}
--
- 	gettimeofday(&tv, NULL);
-+#if defined(__x86_64__) && defined(__ILP32__)
-+	dprintf("(%d): %lld.%06lld state:%s prev:%s action:%s prev: %s start:%llu\n",
-+#else
- 	dprintf("(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s start:%llu\n",
-+#endif
- 		a->info.container_member,
- 		tv.tv_sec, tv.tv_usec,
- 		array_states[a->curr_state],
diff --git a/meta/recipes-extended/mdadm/files/xmalloc.patch b/meta/recipes-extended/mdadm/files/xmalloc.patch
new file mode 100644
index 00000000000..61774721d03
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/xmalloc.patch
@@ -0,0 +1,32 @@
+From c5cf5a83be4e3ce04ebf3250f77aeb465eeb53a1 Mon Sep 17 00:00:00 2001
+From: Xiao Ni <xni@redhat.com>
+Date: Fri, 17 Jan 2025 15:15:40 +0800
+Subject: [PATCH] mdadm/raid6check: add xmalloc.h to raid6check.c
+
+It reports building error:
+raid6check.c:324:26: error: implicit declaration of function xmalloc
+
+Add xmalloc.h to raid6check.c file to fix this.
+
+Signed-off-by: Xiao Ni <xni@redhat.com>
+Link: https://lore.kernel.org/r/20250117071540.4094-1-xni@redhat.com
+Signed-off-by: Song Liu <song@kernel.org>
+
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?h=main&id=e0df6c4c984d564e9e40913727e916a6cd8f466e]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ raid6check.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/raid6check.c b/raid6check.c
+index 8e7f1421..486b10c6 100644
+--- a/raid6check.c
++++ b/raid6check.c
+@@ -26,6 +26,7 @@
+ #define _FILE_OFFSET_BITS 64
+ 
+ #include "mdadm.h"
++#include "xmalloc.h"
+ #include <stdint.h>
+ #include <sys/mman.h>
+ 
diff --git a/meta/recipes-extended/mdadm/mdadm_4.3.bb b/meta/recipes-extended/mdadm/mdadm_4.4.bb
similarity index 84%
rename from meta/recipes-extended/mdadm/mdadm_4.3.bb
rename to meta/recipes-extended/mdadm/mdadm_4.4.bb
index e3b94d4b6fd..db45df43d3d 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
@@ -11,22 +11,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=main;tag=mdadm-${PV} \
            file://run-ptest \
-           file://mdadm-3.3.2_x32_abi_time_t.patch \
-           file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
-           file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
-           file://0001-fix-gcc-8-format-truncation-warning.patch \
-           file://debian-no-Werror.patch \
            file://mdadm.init \
-           file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://0001-Makefile-install-mdcheck.patch \
            file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
            file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
-           file://0001-util.c-add-limits.h-include-for-NAME_MAX-definition.patch \
-           file://0001-include-libgen.h-for-basename-API.patch \
+           file://xmalloc.patch \
            "
 
-SRCREV = "d709d4161d1dd51a976147e8372fbd99ff8183bd"
+SRCREV = "8e56efac9afd7080bb42bae4b77cdad5f345633a"
 S = "${WORKDIR}/git"
 
 inherit ptest systemd
@@ -44,7 +37,7 @@ CFLAGS:append:powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS:append:mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS:append:mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
-EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
+EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
                 BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}" \
                 SYSROOT="${STAGING_DIR_TARGET}" STRIP='
 
@@ -53,7 +46,7 @@ DEBUG_OPTIMIZATION:append = " -Wno-error"
 do_install() {
         oe_runmake 'DESTDIR=${D}' install install-systemd
         install -d ${D}/${sysconfdir}/
-        install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
+        install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
 }
-- 
2.39.5


