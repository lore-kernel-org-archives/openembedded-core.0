Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7F89D7F884
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:35 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id s21so11071023plr.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AJfHUZxlt99tk0Wa9n4O/xUwBOEqsVF72T2IanVs21g=;
	b=Mnxl1n8Vk4yzR5joEayCt4h+Bo/aoGDK8dJom0EMho3zNtCiuk/jTy55qpjgIWreve
	sj4nsOeSohG8oi3JeRNpB2oK8p6RpR2vt/A9Y4CaJ0Yb2woLovlvf+LQxetRtNQTqwxY
	DYR8wV0OCxzO0DKuEFP60afo8h/XBnit4a6yDnoki8LJZMXrkNkmk29q5ijPSFGXt9da
	maIDDqZ7w7OrZCHXX7tq0Hmy1VkX4nG8mW6DGpxrBOKAvgk0ekZgouy4wFxMRzFKu2g1
	Xyyu73fioYcfqGjEf8gDN3f3jlOc5wFud0oq/V6kQP5WhXdHayz9QbAfdeaYzqvbPQt9
	JXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AJfHUZxlt99tk0Wa9n4O/xUwBOEqsVF72T2IanVs21g=;
	b=tPRvRA8wSY5GbHDCchRtTxSpJ8rUCata33i3uFmRx2lpQIPVMqiYVJqQ1JFWAnWdns
	l/QQSOXKbYEV8G/ZRRZ63hlDgw973xCnPUA56djbVXJ+XjZCvXWbxg8oNOBJAojNU81i
	aA7wtpV0Dbh5vrHIy+mHn9ILqF0wmUsTbDHvq56E+6eSajyx8xikCR7j6ZuPcy9TzfyZ
	apU9OfMHO8FZm4L2x5kC8S9VdT503s/epAX5j64/dMXbQK45dZOdaZ8Lh+mNt2lwTqx5
	6ap09uShSAgqmvdRp0ipTxWiO1jd9FgixYcttW71+5UTP4klwXbmgEfNj0ZcJxwjU3Ry
	bG3w==
X-Gm-Message-State: APjAAAUb8jN+1+lGJynLT765wAcKB3PAfcvpKbaeB9AR3tuUJRZpjBlK
	4jf42JhFQEFp8S/DX1bkrHXjxh4xqtA=
X-Google-Smtp-Source: APXvYqyPbIpOD58k19Y3cwi6R/cT9LAh8quHrj+wW4SeLxh2NGGxqHcs7JHtLasN/ebkRTl/Gp/dKQ==
X-Received: by 2002:a17:90a:6484:: with SMTP id
	h4mr39585487pjj.84.1577645076365; 
	Sun, 29 Dec 2019 10:44:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:05 -0800
Message-Id: <20191229184415.19514-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/19] busybox: Replace obsolete stime API with clock_settime
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Remove-stime-function-calls.patch    | 85 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch b/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch
new file mode 100644
index 0000000000..9b9432844c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-Remove-stime-function-calls.patch
@@ -0,0 +1,85 @@
+From d3539be8f27b8cbfdfee460fe08299158f08bcd9 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Tue, 19 Nov 2019 13:06:40 +0100
+Subject: [PATCH] Remove stime() function calls
+
+stime() has been deprecated in glibc 2.31 and replaced with
+clock_settime(). Let's replace the stime() function calls with
+clock_settime() in preperation.
+
+function                                             old     new   delta
+rdate_main                                           197     224     +27
+clock_settime                                          -      27     +27
+date_main                                            926     941     +15
+stime                                                 37       -     -37
+------------------------------------------------------------------------------
+(add/remove: 2/2 grow/shrink: 2/0 up/down: 69/-37)             Total: 32 bytes
+
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9] 
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ coreutils/date.c         | 6 +++++-
+ libbb/missing_syscalls.c | 8 --------
+ util-linux/rdate.c       | 8 ++++++--
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+--- a/coreutils/date.c
++++ b/coreutils/date.c
+@@ -279,6 +279,9 @@ int date_main(int argc UNUSED_PARAM, cha
+ 		time(&ts.tv_sec);
+ #endif
+ 	}
++#if !ENABLE_FEATURE_DATE_NANO
++	ts.tv_nsec = 0;
++#endif
+ 	localtime_r(&ts.tv_sec, &tm_time);
+ 
+ 	/* If date string is given, update tm_time, and maybe set date */
+@@ -301,9 +304,10 @@ int date_main(int argc UNUSED_PARAM, cha
+ 		if (date_str[0] != '@')
+ 			tm_time.tm_isdst = -1;
+ 		ts.tv_sec = validate_tm_time(date_str, &tm_time);
++		ts.tv_nsec = 0;
+ 
+ 		/* if setting time, set it */
+-		if ((opt & OPT_SET) && stime(&ts.tv_sec) < 0) {
++		if ((opt & OPT_SET) && clock_settime(CLOCK_REALTIME, &ts) < 0) {
+ 			bb_perror_msg("can't set date");
+ 		}
+ 	}
+--- a/libbb/missing_syscalls.c
++++ b/libbb/missing_syscalls.c
+@@ -15,14 +15,6 @@ pid_t getsid(pid_t pid)
+ 	return syscall(__NR_getsid, pid);
+ }
+ 
+-int stime(const time_t *t)
+-{
+-	struct timeval tv;
+-	tv.tv_sec = *t;
+-	tv.tv_usec = 0;
+-	return settimeofday(&tv, NULL);
+-}
+-
+ int sethostname(const char *name, size_t len)
+ {
+ 	return syscall(__NR_sethostname, name, len);
+--- a/util-linux/rdate.c
++++ b/util-linux/rdate.c
+@@ -95,9 +95,13 @@ int rdate_main(int argc UNUSED_PARAM, ch
+ 	if (!(flags & 2)) { /* no -p (-s may be present) */
+ 		if (time(NULL) == remote_time)
+ 			bb_error_msg("current time matches remote time");
+-		else
+-			if (stime(&remote_time) < 0)
++		else {
++			struct timespec ts;
++			ts.tv_sec = remote_time;
++			ts.tv_nsec = 0;
++			if (clock_settime(CLOCK_REALTIME, &ts) < 0)
+ 				bb_perror_msg_and_die("can't set time of day");
++		}
+ 	}
+ 
+ 	if (flags != 1) /* not lone -s */
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index e7618e5bfe..1d0102eb2b 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
+           file://0001-Remove-stime-function-calls.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.24.1


