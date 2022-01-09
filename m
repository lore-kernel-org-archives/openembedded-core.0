Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB81C4332F
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.23775.1641767276508418069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lyg0roi2;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 18-20020a05600c22d200b00347d3a13c7cso3682710wmg.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DPhmsxy5YZ7FdAFZXOY8ExlmTQJYEaaZ/QNrLY03sLc=;
        b=Lyg0roi2ZRLFvPSy1MNY35bQ6YgGudALBA4lc+XNtnu8GkWnim0QDUB0JmlynfFvP6
         IS53JqKYULWCN4JDomDOZpITEwMwMpU+TUlYmLmOD0MzinYhH9qvzPkl31aDVsS4FoOy
         TDOsRPHlW7hncWp8Jx8DUAXDRSPuiaUvzY9Fbs+z6kE/AH0pEk7SC8vyNfeIEu1o14yJ
         ZJKYlxe4NKng3t10dD3Z1k1IqPLrUSKgNmsklCQAAFqKzbcLQEIZfYAx18IGgGScEZS+
         RbihPXNio68T5OUq74L30mKgi/+9bdvyKWd4sCJmj4BK01xDp+ofFB8p5qa2/HxKZhVm
         EtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DPhmsxy5YZ7FdAFZXOY8ExlmTQJYEaaZ/QNrLY03sLc=;
        b=yfIO4ScssbxD0GDChdmFu6qK5+yGfxmyITHHWdjHK9DKGTxOppmyYSs5Inf6izrtrk
         RgFP/+QUZ3Ahj5eeI740nc3rKHFYhU2t42wf9/5EtJhx1f0DkXkOBMq1EBb0bT0ejyOF
         IDLfiNH+oj875lo85J0V4pzSp+lc/2vrqvoEWraWocdslQqLnSAtKY6tPnBtRj+eKxan
         1IJ4JwGH6ERObVhOahaIafRyeFOzvcDZQZ2oBQnmHAYsv5UGlXg0+WtKEluUW4KTuxHk
         8ZT5RTCGCK1cTJ4Ioc3tpPYw8otvkvMJ15KZrFyzYVY4HDig3+wfYr4pFZWn1nC6mN3F
         vXdA==
X-Gm-Message-State: AOAM530oOpDBXsKAJN5re/iSctHU2Qja6GfMNJjcMfT7mkoMNfz483No
	yFgD5F0fsEkuTJ7LBDWnozPS7DB55tQ=
X-Google-Smtp-Source: 
 ABdhPJybe0+dwTlcBB5abN3HRuD204E+CZYGhzjWzxfwNrNX0wPCTyWsm4sReWdnYOYsI4b+G0Uq9A==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr19462597wms.100.1641767275150;
        Sun, 09 Jan 2022 14:27:55 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>,
	"Maxin B . John" <maxin.john@intel.com>
Subject: [PATCH 07/14] mdadm: update 4.1 -> 4.2
Date: Sun,  9 Jan 2022 23:27:25 +0100
Message-Id: <20220109222732.2252416-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:27:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160310

Drop 0001-Compute-abs-diff-in-a-standard-compliant-way.patch
(upstream refactored code)
mdadm-fix-ptest-build-errors.patch
(upstream fixed the issue)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-test/images/oe-selftest-image.bb  |  3 +-
 ...abs-diff-in-a-standard-compliant-way.patch | 31 -------------
 .../mdadm/files/debian-no-Werror.patch        | 19 +++++---
 .../files/mdadm-fix-ptest-build-errors.patch  | 43 -------------------
 .../mdadm/{mdadm_4.1.bb => mdadm_4.2.bb}      |  7 ++-
 5 files changed, 17 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
 rename meta/recipes-extended/mdadm/{mdadm_4.1.bb => mdadm_4.2.bb} (93%)

diff --git a/meta-selftest/recipes-test/images/oe-selftest-image.bb b/meta-selftest/recipes-test/images/oe-selftest-image.bb
index 5d4d10eef6..e295943ae5 100644
--- a/meta-selftest/recipes-test/images/oe-selftest-image.bb
+++ b/meta-selftest/recipes-test/images/oe-selftest-image.bb
@@ -1,6 +1,7 @@
 SUMMARY = "An image used during oe-selftest tests"
 
-IMAGE_INSTALL = "packagegroup-core-boot dropbear"
+# libudev is needed for deploy mdadm via devtool
+IMAGE_INSTALL = "packagegroup-core-boot dropbear libudev"
 IMAGE_FEATURES = "debug-tweaks"
 
 IMAGE_LINGUAS = " "
diff --git a/meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch b/meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch
deleted file mode 100644
index 803a59b3ec..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b273e892bd6aaafe448f84356abb78a6d463e784 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Dec 2018 17:22:39 -0800
-Subject: [PATCH] Compute abs diff in a standard compliant way
-
-This make it a bit less implementation defined and silences clang
-warning -Wabsolute-value
-
-| super-intel.c:2822:20: error: taking the absolute value of unsigned type 'unsi
-gned long long' has no effect [-Werror,-Wabsolute-value]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- super-intel.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/super-intel.c b/super-intel.c
-index 6438987..10d7218 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -2819,7 +2819,7 @@ static unsigned long long calc_component_size(struct imsm_map *map,
- 	 * 2048 blocks per each device. If the difference is higher it means
- 	 * that array size was expanded and num_data_stripes was not updated.
- 	 */
--	if ((unsigned int)abs(calc_dev_size - dev_size) >
-+	if ((unsigned int)abs((int)calc_dev_size - (int)dev_size) >
- 	    (1 << SECT_PER_MB_SHIFT) * member_disks) {
- 		component_size = dev_size / member_disks;
- 		dprintf("Invalid num_data_stripes in metadata; expected=%llu, found=%llu\n",
diff --git a/meta/recipes-extended/mdadm/files/debian-no-Werror.patch b/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
index e66a15cd79..fa90647489 100644
--- a/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
+++ b/meta/recipes-extended/mdadm/files/debian-no-Werror.patch
@@ -1,5 +1,7 @@
-From: martin f. krafft <madduck@debian.org>
-Subject: Remove -Werror from compiler flags
+From adb75f0bdec97dbe4aa15cc988d349775f7995ff Mon Sep 17 00:00:00 2001
+From: "martin f. krafft" <madduck@debian.org>
+Date: Mon, 3 Jan 2022 19:14:12 +0000
+Subject: [PATCH] Remove -Werror from compiler flags
 
 -Werror seems like a bad idea on released/packaged code because a toolchain
 update (introducing new warnings) could break the build. We'll let upstream
@@ -8,15 +10,18 @@ use it to beautify the code, but remove it for out builds.
 Signed-off-by: martin f. krafft <madduck@debian.org>
 
 Upstream-Status: Pending
+
 ---
- Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/Makefile b/Makefile
+index 716c97c..40354ea 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -48,7 +48,7 @@ endif
- 
- CC ?= $(CROSS_COMPILE)gcc
+@@ -50,7 +50,7 @@ ifeq ($(origin CC),default)
+ CC := $(CROSS_COMPILE)gcc
+ endif
  CXFLAGS ?= -ggdb
 -CWFLAGS = -Wall -Werror -Wstrict-prototypes -Wextra -Wno-unused-parameter
 +CWFLAGS = -Wall -Wstrict-prototypes -Wextra -Wno-unused-parameter
diff --git a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch b/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
deleted file mode 100644
index 8e2a8a9043..0000000000
--- a/meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 911f6ea9be0c334885aeff66853b111cbd4066df Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 10 Feb 2016 17:28:05 +0200
-Subject: [PATCH] mdadm-fix-ptest-build-errors
-
-builds fail with ptest enabled:
-
-| restripe.c: In function 'test_stripes':
-| restripe.c:845:4: error: ignoring return value of 'read', declared with
-| attribute warn_unused_result [-Werror=unused-result]
-|     read(source[i], stripes[i], chunk_size);
-|     ^
-| cc1: all warnings being treated as errors
-| Makefile:214: recipe for target 'test_stripe' failed
-
-Upstream-Status: Pending
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
----
- restripe.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/restripe.c b/restripe.c
-index 31b07e8..592ba5d 100644
---- a/restripe.c
-+++ b/restripe.c
-@@ -864,10 +864,14 @@ int test_stripes(int *source, unsigned long long *offsets,
- 
- 	while (length > 0) {
- 		int disk;
-+        ssize_t ret;
- 
- 		for (i = 0 ; i < raid_disks ; i++) {
- 			lseek64(source[i], offsets[i]+start, 0);
--			read(source[i], stripes[i], chunk_size);
-+			ret = read(source[i], stripes[i], chunk_size);
-+            if (ret == -1) {
-+			  printf("Read Failed\n");
-+            }
- 		}
- 		for (i = 0 ; i < data_disks ; i++) {
- 			int disk = geo_map(i, start/chunk_size, raid_disks,
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
similarity index 93%
rename from meta/recipes-extended/mdadm/mdadm_4.1.bb
rename to meta/recipes-extended/mdadm/mdadm_4.2.bb
index 35535aef86..fa51364283 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -12,11 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
-           file://mdadm-fix-ptest-build-errors.patch \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
-           file://0001-Compute-abs-diff-in-a-standard-compliant-way.patch \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
            file://debian-no-Werror.patch \
            file://0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch \
@@ -26,11 +24,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            "
 
-SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
-SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
+SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
 
 inherit autotools-brokensep ptest systemd
 
+DEPENDS = "udev"
+
 SYSTEMD_SERVICE:${PN} = "mdmonitor.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
2.20.1


