Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id E460A7F695
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 16:31:25 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id g6so2482131plp.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 08:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AJfHUZxlt99tk0Wa9n4O/xUwBOEqsVF72T2IanVs21g=;
	b=mZXJzhUwhEh0vPz1PFNrp9DQADWJbMAZg42GepFB3vc4xa7gCdGV5ml3PjlHgu8ful
	F3w5R4P6kvz1WgQAPFcgyH/wNw3xlDnGA5nh52/vVT23q7e/b3ngN8t98G6dQYu0QMxr
	ZqsnWwz7ECbkaE6K49CZ+i7QvQ/AwM4wZ6liFQoGDBU9aIYR2F+oq79GLJBJ8jh4gxJ2
	GP70uItjvCRE5hy09fYeCAlI3dZtdww/WqFOnVGKLTxi5Qdu04CxIrmnSOztttXx0Rak
	7MkDVkBCNzQusZS1l9Qzz0XwfTRPxCEuIS7wkq+HE2TwLNR9S37SOasvYMHj+zNxjbna
	Ecsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AJfHUZxlt99tk0Wa9n4O/xUwBOEqsVF72T2IanVs21g=;
	b=n975Y5Spw1jhB8oiHOvO/8Ktf1jdrO8bl7UsXZxSeQYnGTWDXvHP6pQbiGMsosWrG6
	njIpgvp0RHmEYcq1AtBFySMfXbYb3MDbaf6lBSDOCUSYcicDYOPTexXsE5nTfW+oXVXf
	lPHJuX3wmc7+4x9y0HEvRPI1SvwZfAZUwp3z7JQxSgLUsm89+0P/gJgfeeAtKUFG8rfe
	UbRKYffEmwywmnH/Sf5+eZgH0mJAtKpXVgSdkYeZfpYaBnb/U27WSZWVPyybbRtYSPjz
	ahrP7dORrRoZrRGKkGlJaocuRCCumOrhIXl7AKvxhbV/+co9nDw+aKG9FFCPhGMPVKyg
	bCuA==
X-Gm-Message-State: APjAAAVB2WLn4PEsyT3SkCu3zO6XfcXlxh+DO9hHMV0eeqRNVNxEs19F
	QeyfbGakZbyVkdmlCCehv9ZjGOREpQI=
X-Google-Smtp-Source: APXvYqyKs+eXSL1dNwBnw3eESOTreBUf38O4XFWEeJInmx7u3NrQDYOIG6CSKmYTMuXNx23+p6ls0Q==
X-Received: by 2002:a17:902:8f85:: with SMTP id
	z5mr21814077plo.43.1576945885579; 
	Sat, 21 Dec 2019 08:31:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	h16sm17821331pfn.85.2019.12.21.08.31.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 21 Dec 2019 08:31:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Dec 2019 08:31:12 -0800
Message-Id: <20191221163112.2481556-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] busybox: Replace obsolete stime API with clock_settime
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
X-List-Received-Date: Sat, 21 Dec 2019 16:31:26 -0000
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


