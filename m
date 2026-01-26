Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A856CF65D9
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 10:28:26 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16747.1769423293693504247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 02:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QhhjP1jV;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f5381d168so4072205b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 02:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769423293; x=1770028093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYvOJNAn7ebbRSvhx4paKBm6AkMIXzYWuxXZf6agtbg=;
        b=QhhjP1jVGUYzTWF4tJjAeBG81m06R5L0QorMbcjI07dxiQpRMUBPmJMSKGO6hrTDPd
         5ILqO5XP1LXmyF/DW7YlmRrk2qQzxHG587jlNh+TNG6+DythIy8j+dbbbLXMAEDe0yAz
         Dh6r34O4dyjtkq6HyoH1SHA6yG3nOKK+nfFu4+0NMYkee3TCyK6NidUBYOpWEYpbfuZE
         KGR4OOOhDubK2Gv8+7GYypN8DaJB4KXwASeqKnsiCAZ3APh9qKA6v4EqtFsBvO5QPWLd
         xTY+03DREgvelfMNz0vqwI+U/jKKy3YKoIHen6HGjrZi6NyPgiGxhjkMPXTYe3iu34s/
         +VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423293; x=1770028093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYvOJNAn7ebbRSvhx4paKBm6AkMIXzYWuxXZf6agtbg=;
        b=f9ZM9/QxGIkNv8KGOWc/S6uQR/3VhjfWij8ccXqlz0eV4DN+TkSnbX548WBPGEF13F
         W8FTts6on6/NpO3SuCZwRfK4491ehILERlHkhs5G4/aBAccwvFZ2YWxHnrky3a/oAkwj
         kT7XStEnhth5XjHqhS6uRH8OIY/CfsaTI/8y5a17HvqMD9SlwtvRpIJfONnt6gmNdNG8
         yfNIdjsSjiBNvuaV62dF0O6YBLfBBKUZPqYMuzOk7p44HsNAIESrlGFWbPlKTO5zbvKV
         4TtAEU0fI7y32Yi7QXHC2hkIf8r+2v5j7048vQx53hzuSfSC8KkbOWvjhBZs69Ux3gVs
         GpJA==
X-Gm-Message-State: AOJu0YyMBp07XfDLTZJ4IaLLtYQ4Pr/vatcNzmpnLcUxuXI7xDJQmtuQ
	6yP6pnOVR1gxWXyE6S2AO9XblTPyjHuH6kOvng3JzIHHPW1Y9/JAUAeTmk+iWJU4
X-Gm-Gg: AZuq6aKhp/2MX8H2n0aLTrqNXljKsHFG+N1mrcY/Tv6i8sjx0kVYoXCj6LTeIXw87TL
	loy9NlTTIA8N5nZXB+xJu89HSld0/iw63k9m5G+q4HF0rElrKSlvqlZm5qp4buLS+FiwcHg64wo
	MrNuq95IWMkyFw0rJvk9LqtnGVDRBecoa3vKDEpRMDZ9B7BR3D2LQ/+iFw7rBB2+L9tQhLhioDD
	7LKYPSg3MrfSSeuAOdA9WBHU6ao4rAzx53C5F1vNUVUotPAYl6j8oUCmTvhshSdbE2CNrBg/b5M
	77G0Hb0zMQmlp77o+2f0HS9dHTVG0VHtRvuhF732oD55AumJkpLL57Bi5BmMM3OmjAMi1hC7qWG
	6iYDQakWg0DfYyXPXSi0KfNyNTrStnovQTvc/wvVJfz/ZXXh061csPRUHUwVwXRiNwU147AgJ0c
	EQE9IW0zr/2pkaNtTbo1Gs1isR
X-Received: by 2002:a05:6a00:2e83:b0:81f:4f47:c6d6 with SMTP id d2e1a72fcca58-823412d360fmr2998951b3a.65.1769423292795;
        Mon, 26 Jan 2026 02:28:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644989sm8880357b3a.13.2026.01.26.02.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:28:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/4] mdadm: upgrade 4.4 -> 4.5
Date: Mon, 26 Jan 2026 23:27:47 +1300
Message-ID: <20260126102747.1077552-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
References: <20260126102747.1077552-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 10:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229982

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/tree/CHANGELOG.md?h=mdadm-4.5

Replaced 0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
with 0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch as
partial changes from first patch are part of the upstream version[1].

Dropped xmalloc.patch which is part of upstream version[2].

Also refreshed other patches.

[1] https://github.com/md-raid-utilities/mdadm/commit/787cc1b60130b8031be59e49d54463c58cd8cf74
[2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/raid6check.c?h=mdadm-4.5&id=e0df6c4c984d564e9e40913727e916a6cd8f466e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-corosync-and-dlm-header-files-check.patch |  6 +--
 .../files/0001-Makefile-install-mdcheck.patch |  8 +--
 ...tripe.c-Use-64-bit-off_t-across-both.patch | 54 +++++++++++++++++++
 ...-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch |  6 +--
 .../mdadm/{mdadm_4.4.bb => mdadm_4.5.bb}      |  5 +-
 5 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch
 rename meta/recipes-extended/mdadm/{mdadm_4.4.bb => mdadm_4.5.bb} (96%)

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
index 8598aea1f1..9572c2e8c7 100644
--- a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
@@ -1,4 +1,4 @@
-From 232101e2fcc6359fb6db2bc232570e373e368c75 Mon Sep 17 00:00:00 2001
+From 77e9527a0ea995ed377e00813eeeb17175dbce72 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 9 Feb 2016 11:44:01 +0200
 Subject: [PATCH] Fix the path of corosync and dlm header files check
@@ -14,10 +14,10 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index bcd092de..0a78cd22 100644
+index 8031ce24..788ff5d9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -130,8 +130,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
+@@ -120,8 +120,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
  SYSTEMD_DIR=/lib/systemd/system
  LIB_DIR=/usr/libexec/mdadm
  
diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
index bb4e8d0604..6d4e8c3f29 100644
--- a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -1,4 +1,4 @@
-From 407691e11037709af888ce2cf6bd5eac6971ac61 Mon Sep 17 00:00:00 2001
+From ed0163039de3e22ee6501162616649b6ec0e0366 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 25 Jan 2022 16:25:01 +0800
 Subject: [PATCH] Makefile: install mdcheck
@@ -14,14 +14,14 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile b/Makefile
-index 981e16fa..b28e7855 100644
+index 788ff5d9..2201a6e3 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -345,6 +345,7 @@ install-systemd: systemd/mdmon@.service
+@@ -327,6 +327,7 @@ install-systemd: systemd/mdmon@.service
  install-bin: mdadm mdmon
  	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
  	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
 +	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
  
  uninstall:
- 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
+ 	rm -f $(DESTDIR)$(BINDIR)/mdadm $(DESTDIR)$(BINDIR)/mdmon
diff --git a/meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch b/meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch
new file mode 100644
index 0000000000..ca4cec5ab8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch
@@ -0,0 +1,54 @@
+From 0d685f4ec8b54860a031fe3e04a2fff535288f80 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Mon, 26 Jan 2026 22:46:51 +1300
+Subject: [PATCH] raid6check.c, restripe.c: Use 64-bit off_t across both musl
+ and glibc
+
+This commit is adaptation of original patch[1] after commit[2] addressed
+lseek issues.
+
+[1] https://lore.kernel.org/linux-raid/20221110225546.337164-1-raj.khem@gmail.com/
+[2] https://github.com/md-raid-utilities/mdadm/commit/787cc1b60130b8031be59e49d54463c58cd8cf74
+
+Upstream-Status: Submitted [https://github.com/md-raid-utilities/mdadm/pull/235]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ raid6check.c | 4 ++--
+ restripe.c   | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/raid6check.c b/raid6check.c
+index 4469dc8f..fa50d44e 100644
+--- a/raid6check.c
++++ b/raid6check.c
+@@ -288,7 +288,7 @@ int manual_repair(int chunk_size, int syndrome_disks,
+ 	}
+ 
+ 	int write_res1, write_res2;
+-	off64_t seek_res;
++	off_t seek_res;
+ 
+ 	seek_res = lseek(source[fd1], offsets[fd1] + start * chunk_size, SEEK_SET);
+ 	if (seek_res < 0) {
+@@ -381,7 +381,7 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
+ 			goto exitCheck;
+ 		}
+ 		for (i = 0 ; i < raid_disks ; i++) {
+-			off64_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
++			off_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
+ 						   SEEK_SET);
+ 			if (seek_res < 0) {
+ 				fprintf(stderr, "lseek to source %d failed\n", i);
+diff --git a/restripe.c b/restripe.c
+index ec8d6275..58c0f5f5 100644
+--- a/restripe.c
++++ b/restripe.c
+@@ -756,7 +756,7 @@ int restore_stripes(int *dest, unsigned long long *offsets,
+ 			if (src_buf == NULL) {
+ 				/* read from file */
+ 				if (lseek(source, read_offset, 0) !=
+-					 (off64_t)read_offset) {
++					 (off_t)read_offset) {
+ 					rv = -1;
+ 					goto abort;
+ 				}
diff --git a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
index e425fc446e..2ef92418ed 100644
--- a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
+++ b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
@@ -1,4 +1,4 @@
-From 8de073c637a1ea968b7304f373a20b13a4a47bbc Mon Sep 17 00:00:00 2001
+From b7e51fbedc1fbc44af00398a4a7aef51cdf191ee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 12 Mar 2024 10:54:08 +0100
 Subject: [PATCH] Create.c: include linux/falloc.h for FALLOC_FL_ZERO_RANGE
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/Create.c b/Create.c
-index fd6c9215..3210a03e 100644
+index 4aa75b7e..5d5fc806 100644
 --- a/Create.c
 +++ b/Create.c
-@@ -33,6 +33,7 @@
+@@ -31,6 +31,7 @@
  #include	<signal.h>
  #include	<sys/signalfd.h>
  #include	<sys/wait.h>
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.5.bb
similarity index 96%
rename from meta/recipes-extended/mdadm/mdadm_4.4.bb
rename to meta/recipes-extended/mdadm/mdadm_4.5.bb
index 26a60e4c1a..8305215b07 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
@@ -13,12 +13,11 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;bra
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://mdadm.init \
            file://0001-Makefile-install-mdcheck.patch \
-           file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
            file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
-           file://xmalloc.patch \
+           file://0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch \
            "
 
-SRCREV = "8e56efac9afd7080bb42bae4b77cdad5f345633a"
+SRCREV = "8f0c7692d48414ff7b3fe927ce75799c65ef24b1"
 
 inherit ptest systemd
 

