Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B12B771A40
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 07:25:34 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so15409914pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2016 23:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KG1zmBKEO5puUIKQHHijTqLOAY+Jfaakkklnv6OHCFA=;
	b=jOPPm4lO0ayE9kIjjuz0V3J/pmrIrLtYUpZsIPF4q+IVlRvtnO3Df3Wq3WrcDF6xQ7
	7fOzeNwJ5DoTQ4/R9Ce/1h5lfzTVnmp45lg+f8TKKToKG0LlfvxcJtBWi3teWmenuC5f
	Q4C/hn7J996GCVjnJoJPKMA/iMCiLx5vsib/KRT8aIrxo21AHOu37jqVDTiZ+koHKrLV
	MTyX54tAQU9uwOJ85sPSBnHd+o96UMXYfaoy3bRbPtytYNRmv7aRZu3QtKjOEVREn68W
	xVuJYfcr+FnGhh622YhWvXrUN/+UUWAmWQFIqidjfXPCkVeqZIxRArKi8gz5WeiHwnep
	eojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KG1zmBKEO5puUIKQHHijTqLOAY+Jfaakkklnv6OHCFA=;
	b=g/wIUt07+mE/9KclZ9JcvOgmaoH7pDZTrdo09GZpm2p3AG6nuBLOytBVTIZ3Jt9zbD
	5DD5xmgQps+tosfFt+oOWCvYtqbqGPsO053WUJjxBNqNitZeiVjyei7gANEEtmo61M6y
	w9kDUbIzZO6IOxqf0el3jfC09g8LS0RwXMh3vXdL6sXFWVG2Z5m+F3U/dMaQ8TzknAOO
	KC8f4h9wMUZ39qfijbl9h92VvNbYNiY2vGYuvORGpf8WHLEL3LTAWfNzeTrjhHs/RW/Y
	zBaN8TB+AoywDNOQR4aqofybmWMjairvaxcXt4oz7EHFsFTpDEzZFnIBpLiYAcpvcTEw
	iXnQ==
X-Gm-Message-State: ABUngvfFSRHGUPMhTAltikTtDCKaqki7//W/kjOs+50I5q3eq5eigT134gkbSQ2frOFZEg==
X-Received: by 10.98.64.76 with SMTP id n73mr10907214pfa.33.1478503536510;
	Sun, 06 Nov 2016 23:25:36 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	cp2sm37636677pad.3.2016.11.06.23.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 23:25:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:25:27 -0800
Message-Id: <20161107072527.394-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107072527.394-1-raj.khem@gmail.com>
References: <20161107072527.394-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc-2.0: Detect pthread_getname_np() before use
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
X-List-Received-Date: Mon, 07 Nov 2016 07:25:36 -0000

Fixes build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...st-for-pthread_getname_np-before-using-it.patch | 70 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb      |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch
new file mode 100644
index 0000000..c6e4966
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch
@@ -0,0 +1,70 @@
+From f627fe16099a2b08d8b4e9023ae6b4f352451967 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 08:59:08 -0800
+Subject: [PATCH] Test for pthread_getname_np before using it
+
+Its a GNU extention and not all libc implement it
+musl e.g. implements the setname API but not getname
+in any case, it seems to be safer to check for the
+function before using it.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ config.h.in         |  3 +++
+ configure.ac        | 10 ++++++++++
+ glib/tests/thread.c |  2 +-
+ 3 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/config.h.in b/config.h.in
+index 2c35ff1..da7ac30 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -326,6 +326,9 @@
+ #undef HAVE_PTHREAD_COND_TIMEDWAIT_RELATIVE_NP
+ 
+ /* Have function pthread_setname_np(const char*) */
++#undef HAVE_PTHREAD_GETNAME_NP
++
++/* Have function pthread_setname_np(const char*) */
+ #undef HAVE_PTHREAD_SETNAME_NP_WITHOUT_TID
+ 
+ /* Have function pthread_setname_np(pthread_t, const char*) */
+diff --git a/configure.ac b/configure.ac
+index 4309671..209770a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2121,6 +2121,16 @@ AS_IF([ test x"$have_threads" = xposix], [
+              AC_DEFINE(HAVE_PTHREAD_COND_TIMEDWAIT_RELATIVE_NP,1,
+                 [Have function pthread_cond_timedwait_relative_np])],
+             [AC_MSG_RESULT(no)])
++        dnl gets thread names
++        AC_MSG_CHECKING(for pthread_getname_np(pthread_t, char*, size_t))
++        AC_LINK_IFELSE(
++            [AC_LANG_PROGRAM(
++                [#include <pthread.h>],
++                [pthread_getname_np(pthread_self(),"example",0)])],
++            [AC_MSG_RESULT(yes)
++             AC_DEFINE(HAVE_PTHREAD_GETNAME_NP,1,
++                [Have function pthread_setname_np(const char*)])],
++            [AC_MSG_RESULT(no)])
+         dnl Sets thread names on OS X 10.6, iOS 3.2 (and higher)
+         AC_MSG_CHECKING(for pthread_setname_np(const char*))
+         AC_LINK_IFELSE(
+diff --git a/glib/tests/thread.c b/glib/tests/thread.c
+index 5447836..2f248a6 100644
+--- a/glib/tests/thread.c
++++ b/glib/tests/thread.c
+@@ -174,7 +174,7 @@ test_thread5 (void)
+ static gpointer
+ thread6_func (gpointer data)
+ {
+-#ifdef HAVE_PTHREAD_SETNAME_NP_WITH_TID
++#if defined(HAVE_PTHREAD_SETNAME_NP_WITH_TID) && defined(HAVE_PTHREAD_GETNAME_NP)
+   char name[16];
+ 
+   pthread_getname_np (pthread_self(), name, 16);
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
index 00ae7ef..17016c8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://gi-exclude.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
+           file://0001-Test-for-pthread_getname_np-before-using-it.patch \
            "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
-- 
2.10.2


