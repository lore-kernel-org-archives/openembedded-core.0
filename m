Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8846104C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 03:51:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01K3owLm026453
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:51:08 -0800
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 19 Feb 2020 19:50:47 -0800
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 11:50:45 +0800
Message-ID: <20200220035045.5027-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: fix hwclock settimeofday error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 03:51:18 -0000
Content-Type: text/plain

The change of settimeofday() systemcall since Glibc 2.31
will cause "hwclock -s" doesn't work with error:
"hwclock: settimeofday() failed: Invalid argument"
Backport a upstream patch to fix this issue.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 ...lock-fix-for-glibc-2.31-settimeofday.patch | 112 ++++++++++++++++++
 .../util-linux/util-linux_2.34.bb             |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch

diff --git a/meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch b/meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch
new file mode 100644
index 000000000000..0672c3546ae6
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch
@@ -0,0 +1,112 @@
+From ee85d3967ea09b215fcea5efdd90bbbf5e74a681 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 19 Feb 2020 15:50:47 +0100
+Subject: [PATCH] hwclock: fix for glibc 2.31 settimeofday()
+
+glibc announce:
+  ... settimeofday can no longer be used to set the time and the offset
+  simultaneously. If both of its two arguments are non-null, the call
+  will fail (setting errno to EINVAL).
+
+It means we need to call settimeofday(NULL, tz) and settimeofday(tv, NULL).
+
+Unfortunately, settimeofday(NULL, tz) has very special warp-clock
+semantic if used as the very first settimeofday() call. It means we
+have to be sure that we do not touch warp-clock if we need only need
+to modify system TZ. So, let's always call settimeofday(NULL, 0)
+before settimeofday(NULL, tz) for UTC rtc mode when modify system TZ.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/ee85d3967ea09b215fcea5efdd90bbbf5e74a681]
+
+CC: J William Piggott <elseifthen@gmx.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Addresses: https://github.com/karelzak/util-linux/issues/957
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ sys-utils/hwclock.c | 49 ++++++++++++++++++++++++++-------------------
+ 1 file changed, 28 insertions(+), 21 deletions(-)
+
+diff --git a/sys-utils/hwclock.c b/sys-utils/hwclock.c
+index e736da7179f8..16576bc186ff 100644
+--- a/sys-utils/hwclock.c
++++ b/sys-utils/hwclock.c
+@@ -658,6 +658,9 @@ display_time(struct timeval hwctime)
+  * PCIL: persistent_clock_is_local, sets the "11 minute mode" timescale.
+  * firsttime: locks the warp_clock function (initialized to 1 at boot).
+  *
++ * Note that very first settimeofday(NULL, tz) modifies warp-clock as well as
++ * system TZ.
++ *
+  * +---------------------------------------------------------------------------+
+  * |  op     | RTC scale | settimeofday calls                                  |
+  * |---------|-----------|-----------------------------------------------------|
+@@ -675,41 +678,45 @@ set_system_clock(const struct hwclock_control *ctl,
+ 	struct tm broken;
+ 	int minuteswest;
+ 	int rc = 0;
+-	const struct timezone tz_utc = { 0 };
+ 
+ 	localtime_r(&newtime.tv_sec, &broken);
+ 	minuteswest = -get_gmtoff(&broken) / 60;
+ 
+ 	if (ctl->verbose) {
+-		if (ctl->hctosys && !ctl->universal)
+-			printf(_("Calling settimeofday(NULL, %d) to set "
+-				 "persistent_clock_is_local.\n"), minuteswest);
+-		if (ctl->systz && ctl->universal)
++		if (ctl->universal)
+ 			puts(_("Calling settimeofday(NULL, 0) "
+-				"to lock the warp function."));
++			       "to lock the warp function."));
++		else
++			printf(_("Calling settimeofday(NULL, %d) to set "
++				 "persistent_clock_is_local and "
++				 "the kernel timezone.\n"), minuteswest);
++
++		if (ctl->universal && minuteswest)
++			printf(_("Calling settimeofday(NULL, %d) to set "
++				 "the kernel timezone.\n"), minuteswest);
++
+ 		if (ctl->hctosys)
+-			printf(_("Calling settimeofday(%ld.%06ld, %d)\n"),
+-			       newtime.tv_sec, newtime.tv_usec, minuteswest);
+-		else {
+-			printf(_("Calling settimeofday(NULL, %d) "), minuteswest);
+-			if (ctl->universal)
+-				 puts(_("to set the kernel timezone."));
+-			else
+-				 puts(_("to warp System time."));
+-		}
++			printf(_("Calling settimeofday(%ld.%06ld, 0) to set "
++			         "the kernel time.\n"), newtime.tv_sec, newtime.tv_usec);
+ 	}
+ 
+ 	if (!ctl->testing) {
++		const struct timezone tz_utc = { 0 };
+ 		const struct timezone tz = { minuteswest };
+ 
+-		if (ctl->hctosys && !ctl->universal)	/* set PCIL */
++		/* warp-clock */
++		if (ctl->universal)
++			rc = settimeofday(NULL, &tz_utc); /* lock to UTC */
++		else
++			rc = settimeofday(NULL, &tz);     /* set PCIL and TZ */
++
++		/* set timezone */
++		if (!rc && ctl->universal && minuteswest)
+ 			rc = settimeofday(NULL, &tz);
+-		if (ctl->systz && ctl->universal)	/* lock warp_clock */
+-			rc = settimeofday(NULL, &tz_utc);
++
++		/* set time */
+ 		if (!rc && ctl->hctosys)
+-			rc = settimeofday(&newtime, &tz);
+-		else if (!rc)
+-			rc = settimeofday(NULL, &tz);
++			rc = settimeofday(&newtime, NULL);
+ 
+ 		if (rc) {
+ 			warn(_("settimeofday() failed"));
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.34.bb b/meta/recipes-core/util-linux/util-linux_2.34.bb
index e9c2d80e902b..557449d140da 100644
--- a/meta/recipes-core/util-linux/util-linux_2.34.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.34.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
             file://0001-lsblk-force-to-print-PKNAME-for-partition.patch \
+            file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
 "
 SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
 SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
-- 
2.17.1


