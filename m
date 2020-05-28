Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2488.1590624373909827924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 17:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,442,1583164800"; 
   d="scan'208";a="93237377"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 May 2020 08:06:10 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 2B1EE4BCC89F
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 08:06:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 May 2020 08:06:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] util-linux: upgrade 2.35.1 -> 2.35.2
Date: Thu, 28 May 2020 17:06:00 +0800
Message-ID: <1590656760-18267-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 2B1EE4BCC89F.A7DE8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-hwclock-fix-for-glibc-2.31-settimeofday.patch
0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch
are removed since they are included in 2.35.2

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...lock-fix-for-glibc-2.31-settimeofday.patch | 112 --------------
 ...-types.h-before-checking-SYS_pidfd_s.patch |  64 --------
 ...accept-sector-size-ignore-unknown-he.patch | 137 ------------------
 .../util-linux/util-linux_2.35.1.bb           |  16 --
 .../util-linux/util-linux_2.35.2.bb           |  13 ++
 5 files changed, 13 insertions(+), 329 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux_2.35.1.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux_2.35.2.bb

diff --git a/meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch b/meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch
deleted file mode 100644
index 0672c3546a..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-hwclock-fix-for-glibc-2.31-settimeofday.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From ee85d3967ea09b215fcea5efdd90bbbf5e74a681 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Wed, 19 Feb 2020 15:50:47 +0100
-Subject: [PATCH] hwclock: fix for glibc 2.31 settimeofday()
-
-glibc announce:
-  ... settimeofday can no longer be used to set the time and the offset
-  simultaneously. If both of its two arguments are non-null, the call
-  will fail (setting errno to EINVAL).
-
-It means we need to call settimeofday(NULL, tz) and settimeofday(tv, NULL).
-
-Unfortunately, settimeofday(NULL, tz) has very special warp-clock
-semantic if used as the very first settimeofday() call. It means we
-have to be sure that we do not touch warp-clock if we need only need
-to modify system TZ. So, let's always call settimeofday(NULL, 0)
-before settimeofday(NULL, tz) for UTC rtc mode when modify system TZ.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/ee85d3967ea09b215fcea5efdd90bbbf5e74a681]
-
-CC: J William Piggott <elseifthen@gmx.com>
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Addresses: https://github.com/karelzak/util-linux/issues/957
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- sys-utils/hwclock.c | 49 ++++++++++++++++++++++++++-------------------
- 1 file changed, 28 insertions(+), 21 deletions(-)
-
-diff --git a/sys-utils/hwclock.c b/sys-utils/hwclock.c
-index e736da7179f8..16576bc186ff 100644
---- a/sys-utils/hwclock.c
-+++ b/sys-utils/hwclock.c
-@@ -658,6 +658,9 @@ display_time(struct timeval hwctime)
-  * PCIL: persistent_clock_is_local, sets the "11 minute mode" timescale.
-  * firsttime: locks the warp_clock function (initialized to 1 at boot).
-  *
-+ * Note that very first settimeofday(NULL, tz) modifies warp-clock as well as
-+ * system TZ.
-+ *
-  * +---------------------------------------------------------------------------+
-  * |  op     | RTC scale | settimeofday calls                                  |
-  * |---------|-----------|-----------------------------------------------------|
-@@ -675,41 +678,45 @@ set_system_clock(const struct hwclock_control *ctl,
- 	struct tm broken;
- 	int minuteswest;
- 	int rc = 0;
--	const struct timezone tz_utc = { 0 };
- 
- 	localtime_r(&newtime.tv_sec, &broken);
- 	minuteswest = -get_gmtoff(&broken) / 60;
- 
- 	if (ctl->verbose) {
--		if (ctl->hctosys && !ctl->universal)
--			printf(_("Calling settimeofday(NULL, %d) to set "
--				 "persistent_clock_is_local.\n"), minuteswest);
--		if (ctl->systz && ctl->universal)
-+		if (ctl->universal)
- 			puts(_("Calling settimeofday(NULL, 0) "
--				"to lock the warp function."));
-+			       "to lock the warp function."));
-+		else
-+			printf(_("Calling settimeofday(NULL, %d) to set "
-+				 "persistent_clock_is_local and "
-+				 "the kernel timezone.\n"), minuteswest);
-+
-+		if (ctl->universal && minuteswest)
-+			printf(_("Calling settimeofday(NULL, %d) to set "
-+				 "the kernel timezone.\n"), minuteswest);
-+
- 		if (ctl->hctosys)
--			printf(_("Calling settimeofday(%ld.%06ld, %d)\n"),
--			       newtime.tv_sec, newtime.tv_usec, minuteswest);
--		else {
--			printf(_("Calling settimeofday(NULL, %d) "), minuteswest);
--			if (ctl->universal)
--				 puts(_("to set the kernel timezone."));
--			else
--				 puts(_("to warp System time."));
--		}
-+			printf(_("Calling settimeofday(%ld.%06ld, 0) to set "
-+			         "the kernel time.\n"), newtime.tv_sec, newtime.tv_usec);
- 	}
- 
- 	if (!ctl->testing) {
-+		const struct timezone tz_utc = { 0 };
- 		const struct timezone tz = { minuteswest };
- 
--		if (ctl->hctosys && !ctl->universal)	/* set PCIL */
-+		/* warp-clock */
-+		if (ctl->universal)
-+			rc = settimeofday(NULL, &tz_utc); /* lock to UTC */
-+		else
-+			rc = settimeofday(NULL, &tz);     /* set PCIL and TZ */
-+
-+		/* set timezone */
-+		if (!rc && ctl->universal && minuteswest)
- 			rc = settimeofday(NULL, &tz);
--		if (ctl->systz && ctl->universal)	/* lock warp_clock */
--			rc = settimeofday(NULL, &tz_utc);
-+
-+		/* set time */
- 		if (!rc && ctl->hctosys)
--			rc = settimeofday(&newtime, &tz);
--		else if (!rc)
--			rc = settimeofday(NULL, &tz);
-+			rc = settimeofday(&newtime, NULL);
- 
- 		if (rc) {
- 			warn(_("settimeofday() failed"));
--- 
-2.17.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch b/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
deleted file mode 100644
index e43e12873f..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 3cfde0370d3a8949df0c5bcf447cec6692910ed2 Mon Sep 17 00:00:00 2001
-From: Sami Kerola <kerolasa@iki.fi>
-Date: Sat, 15 Feb 2020 21:12:50 +0000
-Subject: [PATCH] kill: include sys/types.h before checking
- SYS_pidfd_send_signal
-
-Including sys/types.h must happen before SYS_pidfd_send_signal is checked,
-because that header defines variable in normal conditions.  When sys/types.h
-does not have SYS_pidfd_send_signal then fallback is defined in config.h
-that is included by default, and has therefore worked fine before and after
-this change.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/3cfde0370d3a8949df0c5bcf447cec6692910ed2]
-
-Signed-off-by: Sami Kerola <kerolasa@iki.fi>
-Signed-off-by: Benjamin Fair <benjaminfair@google.com>
----
- include/pidfd-utils.h | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index 593346576..0baedd2c9 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -1,26 +1,28 @@
- #ifndef UTIL_LINUX_PIDFD_UTILS
- #define UTIL_LINUX_PIDFD_UTILS
- 
--#if defined(__linux__) && defined(SYS_pidfd_send_signal)
--# include <sys/types.h>
-+#if defined(__linux__)
- # include <sys/syscall.h>
-+# if defined(SYS_pidfd_send_signal)
-+#  include <sys/types.h>
- 
--# ifndef HAVE_PIDFD_OPEN
-+#  ifndef HAVE_PIDFD_OPEN
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
- {
- 	return syscall(SYS_pidfd_send_signal, pidfd, sig, info, flags);
- }
--# endif
-+#  endif
- 
--# ifndef HAVE_PIDFD_SEND_SIGNAL
-+#  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_open(pid_t pid, unsigned int flags)
- {
- 	return syscall(SYS_pidfd_open, pid, flags);
- }
--# endif
-+#  endif
- 
--# define UL_HAVE_PIDFD 1
-+#  define UL_HAVE_PIDFD 1
- 
--#endif /* __linux__ && SYS_pidfd_send_signal */
-+# endif	/* SYS_pidfd_send_signal */
-+#endif /* __linux__ */
- #endif /* UTIL_LINUX_PIDFD_UTILS */
--- 
-2.26.1.301.g55bc3eb7cb9-goog
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch b/meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch
deleted file mode 100644
index 911f70bc1f..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 00e53f17c8462cb34ece08cc10db60a7da29a305 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 4 Feb 2020 15:11:19 +0100
-Subject: [PATCH] libfdisk: (script) accept sector-size, ignore unknown headers
-
-- add sector-size between supported headers (already in --dump output)
-
-- report unknown headers by -ENOTSUP
-
-- ignore ENOTSUP in sfdisk (but print warning) and in fdisk_script_read_file()
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/00e53f17c8462cb34ece08cc10db60a7da29a305]
-
-Addresses: https://github.com/karelzak/util-linux/issues/949
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- disk-utils/sfdisk.c   |  6 +++++-
- libfdisk/src/script.c | 49 ++++++++++++++++++++++++++-----------------------
- 2 files changed, 31 insertions(+), 24 deletions(-)
-
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index bb6e1c6..c0bea70 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -1782,7 +1782,11 @@ static int command_fdisk(struct sfdisk *sf, int argc, char **argv)
- 		}
- 
- 		rc = fdisk_script_read_line(dp, stdin, buf, sizeof(buf));
--		if (rc < 0) {
-+		if (rc == -ENOTSUP) {
-+			buf[sizeof(buf) - 1] = '\0';
-+			fdisk_warnx(sf->cxt, _("Unknown script header '%s' -- ignore."), buf);
-+			continue;
-+		} else if (rc < 0) {
- 			DBG(PARSE, ul_debug("script parsing failed, trying sfdisk specific commands"));
- 			buf[sizeof(buf) - 1] = '\0';
- 			rc = loop_control_commands(sf, dp, buf);
-diff --git a/libfdisk/src/script.c b/libfdisk/src/script.c
-index a21771b..d3e67fa 100644
---- a/libfdisk/src/script.c
-+++ b/libfdisk/src/script.c
-@@ -805,8 +805,12 @@ static inline int is_header_line(const char *s)
- /* parses "<name>: value", note modifies @s*/
- static int parse_line_header(struct fdisk_script *dp, char *s)
- {
--	int rc = -EINVAL;
-+	size_t i;
- 	char *name, *value;
-+	static const char *supported[] = {
-+		"label", "unit", "label-id", "device", "grain",
-+		"first-lba", "last-lba", "table-length", "sector-size"
-+	};
- 
- 	DBG(SCRIPT, ul_debugobj(dp, "   parse header '%s'", s));
- 
-@@ -816,7 +820,7 @@ static int parse_line_header(struct fdisk_script *dp, char *s)
- 	name = s;
- 	value = strchr(s, ':');
- 	if (!value)
--		goto done;
-+		return -EINVAL;
- 	*value = '\0';
- 	value++;
- 
-@@ -825,32 +829,30 @@ static int parse_line_header(struct fdisk_script *dp, char *s)
- 	ltrim_whitespace((unsigned char *) value);
- 	rtrim_whitespace((unsigned char *) value);
- 
-+	if (!*name || !*value)
-+		return -EINVAL;
-+
-+	/* check header name */
-+	for (i = 0; i < ARRAY_SIZE(supported); i++) {
-+		if (strcmp(name, supported[i]) == 0)
-+			break;
-+	}
-+	if (i == ARRAY_SIZE(supported))
-+		return -ENOTSUP;
-+
-+	/* header specific actions */
- 	if (strcmp(name, "label") == 0) {
- 		if (dp->cxt && !fdisk_get_label(dp->cxt, value))
--			goto done;			/* unknown label name */
-+			return -EINVAL;			/* unknown label name */
- 		dp->force_label = 1;
-+
- 	} else if (strcmp(name, "unit") == 0) {
- 		if (strcmp(value, "sectors") != 0)
--			goto done;			/* only "sectors" supported */
--	} else if (strcmp(name, "label-id") == 0
--		   || strcmp(name, "device") == 0
--		   || strcmp(name, "grain") == 0
--		   || strcmp(name, "first-lba") == 0
--		   || strcmp(name, "last-lba") == 0
--		   || strcmp(name, "table-length") == 0) {
--		;					/* whatever is possible */
--	} else
--		goto done;				/* unknown header */
-+			return -EINVAL;			/* only "sectors" supported */
- 
--	if (*name && *value)
--		rc = fdisk_script_set_header(dp, name, value);
--done:
--	if (rc)
--		DBG(SCRIPT, ul_debugobj(dp, "header parse error: "
--				"[rc=%d, name='%s', value='%s']",
--				rc, name, value));
--	return rc;
-+	}
- 
-+	return fdisk_script_set_header(dp, name, value);
- }
- 
- /* returns zero terminated string with next token and @str is updated */
-@@ -1363,7 +1365,8 @@ int fdisk_script_set_fgets(struct fdisk_script *dp,
-  *
-  * Reads next line into dump.
-  *
-- * Returns: 0 on success, <0 on error, 1 when nothing to read.
-+ * Returns: 0 on success, <0 on error, 1 when nothing to read. For unknown headers
-+ *          returns -ENOTSUP, it's usually safe to ignore this error.
-  */
- int fdisk_script_read_line(struct fdisk_script *dp, FILE *f, char *buf, size_t bufsz)
- {
-@@ -1428,7 +1431,7 @@ int fdisk_script_read_file(struct fdisk_script *dp, FILE *f)
- 
- 	while (!feof(f)) {
- 		rc = fdisk_script_read_line(dp, f, buf, sizeof(buf));
--		if (rc)
-+		if (rc && rc != -ENOTSUP)
- 			break;
- 	}
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
deleted file mode 100644
index 516b783887..0000000000
--- a/meta/recipes-core/util-linux/util-linux_2.35.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require util-linux.inc
-
-SRC_URI += "file://configure-sbindir.patch \
-            file://runuser.pamd \
-            file://runuser-l.pamd \
-            file://ptest.patch \
-            file://run-ptest \
-            file://display_testname_for_subtest.patch \
-            file://avoid_parallel_tests.patch \
-            file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
-            file://0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch \
-            file://0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch \
-            file://0001-include-cleanup-pidfd-inckudes.patch \
-"
-SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
-SRC_URI[sha256sum] = "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.2.bb b/meta/recipes-core/util-linux/util-linux_2.35.2.bb
new file mode 100644
index 0000000000..752a6fa214
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux_2.35.2.bb
@@ -0,0 +1,13 @@
+require util-linux.inc
+
+SRC_URI += "file://configure-sbindir.patch \
+            file://runuser.pamd \
+            file://runuser-l.pamd \
+            file://ptest.patch \
+            file://run-ptest \
+            file://display_testname_for_subtest.patch \
+            file://avoid_parallel_tests.patch \
+            file://0001-include-cleanup-pidfd-inckudes.patch \
+"
+SRC_URI[md5sum] = "248a4d0810c9193e0e9a4bb3f26b93d8"
+SRC_URI[sha256sum] = "21b7431e82f6bcd9441a01beeec3d57ed33ee948f8a5b41da577073c372eb58a"
-- 
2.17.1



