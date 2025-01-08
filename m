Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB50EE7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.14216.1736325757029981839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WBZzUr10;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa67ac42819so2387823166b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325755; x=1736930555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=869i1WlyxR2N1ykWJHr1SaIc1BK8cPdIUXzwzkLSm5o=;
        b=WBZzUr10i55QSKmUVK+QaZS8hxvlA2b12SmssgwfhrbAWVZinlUiUCT05kk2z4+gs+
         3jHwhjfcR5HPgjbqcH59M0rhGLdxyLpp7W/Bo4Fb8X9TNCuXNh4kOBGWzL+GEM78Mg46
         jGzgEAhZxvDfs4CdfhgEi6iGeAVErkcmEtmepE/zGlXzgcy3o2G1yDsBSCk+a86Yo4ih
         DJBew7TqMYZZgK7PiL0937XNKi59nQdeBsjoI43UPk57IwPyPgL6pmT72OFuIM/76/HM
         crRQ0HV20934nzTvxrEs5GN6TMiRJuN3s8NOpp7vKmCP4HUMmaVQ5WHg68SwyAwoES7r
         Rg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325755; x=1736930555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=869i1WlyxR2N1ykWJHr1SaIc1BK8cPdIUXzwzkLSm5o=;
        b=TnpkD/r1IUmB6CzBkubuoUyc+PwjYcGQTlafduk8g5RgrLlE9uyaK6p+BGAsCGhq87
         s5yrsyzkM/TqRHD21NWrIFW+kkUsmFL8jHzgy+9QN5+cJwuAPAAgSQIGdiwR7VjuoGYb
         5Znc5kC+Qlt/oVkJUg1V6dmqrygZmZa+0ncvm+2fLockWs2RUeaBmB6vBVTDEviQ2mZ9
         RPZvDMnCy9v+HC9IIoawbDTm2xFzr32jr1jq/7JtoRcQvq8xsHy8MKQ7F8QHSQTNDdGi
         DirpWOt7z4VcSx7bFDSabJMHaWFryrWW3DUQDtQ/ziePbLx8X0sfe9o+9ffW53RFf8XZ
         gegQ==
X-Gm-Message-State: AOJu0Yy0JVVA0To0WF183sEDg92A+cKU+r4cs2jY8qEfyH99LlxQe55a
	eVqY10lhp78YKng0X2KY9TWwLVTHjaar2prvXLOHgVzjA+6om+2I8rGGPg==
X-Gm-Gg: ASbGncvOMAOZobDk2xwg1l/iDLsmPbGxFDJuS2ZMo0QNZUBVxQodxTcw/AWQ3z41AFE
	hLKFy0MHb8svBd5ulbvgfacLNx2W6n8wEQrkiFxApmUTh6AUFZl1vnmgAATuyKBrbBwfGikiqFH
	NCV2EHKrZm2izHlXMYHK9G5Tz6h/t16HrtmCEwrCjo2eaNN3tGXA1Xjx+STSD7QzpIQsTP53UXA
	5dcr8RLJ63mtwAlRfspemBIXcxoFdbXxMAzyTJWEGhJH66CpzipXSrcukclKY6/aeqrCzE+NVbK
	Z8AIBENX4sWiysodcw==
X-Google-Smtp-Source: AGHT+IEqLSJbXmAuPnPMmptOlTKa76PpKWRqL9KD/ELEAEyM3mSCcvH3rqFr8v+Ad2P7Dd8RG8VIeg==
X-Received: by 2002:a17:907:3d9f:b0:aae:ef24:888d with SMTP id a640c23a62f3a-ab2abc92349mr142210366b.55.1736325755214;
        Wed, 08 Jan 2025 00:42:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/20] procps: update 4.0.4 -> 4.0.5
Date: Wed,  8 Jan 2025 09:42:14 +0100
Message-Id: <20250108084226.117178-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209530

From: Alexander Kanavin <alex@linutronix.de>

Drop pidfd.patch (upstream significantly refactored the code; the patch can be tested
only with very old kernels; upstream submission has not been followed up since initial
MR creation).

Add a patch to igt-gpu-tools to address a build failure with the new procps.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../procps/procps/pidfd.patch                 | 42 -------------------
 .../{procps_4.0.4.bb => procps_4.0.5.bb}      |  3 +-
 ...c-address-procps-4.0.5-compatibility.patch | 30 +++++++++++++
 .../igt-gpu-tools/igt-gpu-tools_1.30.bb       |  4 +-
 4 files changed, 34 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps/pidfd.patch
 rename meta/recipes-extended/procps/{procps_4.0.4.bb => procps_4.0.5.bb} (97%)
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch

diff --git a/meta/recipes-extended/procps/procps/pidfd.patch b/meta/recipes-extended/procps/procps/pidfd.patch
deleted file mode 100644
index 23d1a3cd3ea..00000000000
--- a/meta/recipes-extended/procps/procps/pidfd.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c8f625e085b8249cc009e8b19c3a19100217eb35 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 25 Apr 2024 13:33:15 +0000
-Subject: [PATCH] Fix pidfd_open detection
-
-This check for pidfd_open uses AC_CHECK_FUNC which just runs the specified code, but 
-src/pgrep.c checks HAVE_PIDFD_OPEN which will only be defined by AC_CHECK_FUNCS.
-
-Also pidfd_open is defined in sys/pidfd.h so that needs including.
-
-Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/229]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
-
-diff --git a/configure.ac b/configure.ac
-index fec27e3f..024731c7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -170,7 +170,7 @@ AC_TRY_COMPILE([#include <errno.h>],
- 		AC_MSG_RESULT(yes),
- 		AC_MSG_RESULT(no))
- 
--AC_CHECK_FUNC([pidfd_open], [enable_pidwait=yes], [
-+AC_CHECK_FUNCS([pidfd_open], [enable_pidwait=yes], [
-   AC_MSG_CHECKING([for __NR_pidfd_open])
-   AC_COMPILE_IFELSE([AC_LANG_SOURCE([
- #include <sys/syscall.h>
-diff --git a/src/pgrep.c b/src/pgrep.c
-index d8e57dff..c5211aec 100644
---- a/src/pgrep.c
-+++ b/src/pgrep.c
-@@ -44,7 +44,9 @@
-
- #ifdef ENABLE_PIDWAIT
- #include <sys/epoll.h>
--#ifndef HAVE_PIDFD_OPEN
-+#ifdef HAVE_PIDFD_OPEN
-+#include <sys/pidfd.h>
-+#else
- #include <sys/syscall.h>
- #endif /* !HAVE_PIDFD_OPEN */
- #endif
diff --git a/meta/recipes-extended/procps/procps_4.0.4.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
similarity index 97%
rename from meta/recipes-extended/procps/procps_4.0.4.bb
rename to meta/recipes-extended/procps/procps_4.0.5.bb
index b02f74bd6bb..3be40c38a4e 100644
--- a/meta/recipes-extended/procps/procps_4.0.4.bb
+++ b/meta/recipes-extended/procps/procps_4.0.5.bb
@@ -14,9 +14,8 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
-           file://pidfd.patch \
            "
-SRCREV = "4ddcef2fd843170c8e2d59a83042978f41037a2b"
+SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch
new file mode 100644
index 00000000000..7db773fe0db
--- /dev/null
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch
@@ -0,0 +1,30 @@
+From 173cdf607bf39c13eb4d4b0dadcb9dc6add76014 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 7 Jan 2025 09:54:07 +0100
+Subject: [PATCH] lib/igt_aux.c: address procps 4.0.5 compatibility
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/164]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ lib/igt_aux.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/igt_aux.c b/lib/igt_aux.c
+index 3407cc4f2..7028d3f57 100644
+--- a/lib/igt_aux.c
++++ b/lib/igt_aux.c
+@@ -1358,10 +1358,10 @@ static bool get_process_ids(struct igt_process *prcs)
+ 	prcs->comm = NULL;
+ 	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
+ 	if (prcs->stack) {
+-		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
+-		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
+-		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
+-		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
++		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
++		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
++		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
++		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
+ 	}
+ #endif
+ 	return prcs->tid != 0;
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
index a302e1877fc..dad752cb199 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_1.30.bb
@@ -11,7 +11,9 @@ inherit meson pkgconfig
 
 SRCREV = "edf352a96646c8d793f0c1eb11795112f9bde725"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master \
+           file://0001-lib-igt_aux.c-address-procps-4.0.5-compatibility.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


