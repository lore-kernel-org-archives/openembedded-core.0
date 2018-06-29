Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id D9B5574E36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:59:08 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id r24-v6so8352388ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+Tw3BRtM+peEtXClXsoRTjbU3GRk+dItwyZ+OpWWFCc=;
	b=lmgV39fi3R4aWiyGYc0Fvy/jwPaFoskPCyD6+99MWbcLYmgTewNHbxyWJQ/oEa5eHc
	WH8TvUth93MoqHqeBp2tYNYQmGwO2vnHfWuTHbJQ31Oau0cOpZeIuorhOUNpVgYbX7m3
	ovL5zyuyO0swgH3kHK87YnRQ4v0FVnrwLwutd4byyjH/3nQ5mIUR1Kb4gbMBHIXzm52X
	KB4YHQG4n6vkP20RUQqOcPsXCvt6UF0PDgIbuBcpnqBo370zEq7kGw0Vuv621LYN5bqx
	IxPn/EXw1E72OS1l/rhA6z4EGihYnYIkc6+9ZZgLgNBC5ScXIfiTK5hcJ2BGIgzQYcQE
	/gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+Tw3BRtM+peEtXClXsoRTjbU3GRk+dItwyZ+OpWWFCc=;
	b=RB1eHMMZ4e7zf4NrnLYPiQRuSCcGZQ9OQ19cf9uqwMzO72Z7AXSDZEl0OBHA8n8sr8
	uD1sVGo0qLss/6PxewONUohpjOdTsG62idFfvmCn25HRLvaM71Op3jPK9qWPiA0SaZEv
	D/8tEjYaKIhSWRFVBeLrQV7CqQMi0PFM0gqKxSfPWSp2b0geftnweIY2C8v2x7ZvFMGa
	kVjkjozqAH5AEumH1ZhJV6uHT5SQiTdit/BpXA/+I3Z/WLkMjOVn9usq9ZaZWPWY1Otd
	XaechCwQPalerq6vCyPJ9vzuPpoS/LCwJciDbfJC2/4nVH/4nS0pZmu5PqNV1Orsc3td
	v3vg==
X-Gm-Message-State: APt69E1Kmip/aS7YVIOT2gIi7EyLN5niGmY+vaRx8/Fh5azPuH26ljNH
	6KD0mGYasTha8cLq9n1Hfkz+
X-Google-Smtp-Source: AAOMgpd68UZGTHz/YzehYvln20dInshF/1ZGTU8NBmQ3GsYItkpv9K0OWyL4J2vtlrXMiCXQetmRsQ==
X-Received: by 2002:a6b:b5c1:: with SMTP id
	e184-v6mr12373520iof.267.1530277149753; 
	Fri, 29 Jun 2018 05:59:09 -0700 (PDT)
Received: from georgedesktop.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	b130-v6sm680811itc.38.2018.06.29.05.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 05:59:09 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2018 07:58:37 -0500
Message-Id: <20180629125837.14657-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [morty][PATCH] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Fri, 29 Jun 2018 12:59:10 -0000

From: Dengke Du <dengke.du@windriver.com>

When subversion run on x86 and lib32 on x86-64, it use the APR's
apr.h header file. But when configure the APR, APR meets the cross
compiling, it was hardcoded in configure.in in apr source code. As
the following:

	APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)

It pass 8 bytes to off_t when meets cross compiling, but on x86 or lib32
the off_t in glibc was 4 bytes, so it let the application who use apr.h
go to wrong.

Such as subversion:

	svnadmin create test

So we should let the APR detect the correct off_t when cross compiling,
change it to the following:

	AC_CHECK_SIZEOF(off_t)

The same for the following hardcoded types for cross compiling:

	pid_t	8
	size_t	8
	ssize_t	8

Change the above correspondingly.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

Cherry-picked from master e18820ca9202c07e2406d702c46f45415182b7a6
I spent 4 hours tracking down a problem where apache was responding
to a request with corrupt Content-Range data. This patch fixes the
problem.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...ze-doesn-t-match-in-glibc-when-cross.patch | 76 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb         |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch

diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
new file mode 100644
index 0000000000..12371428f0
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
@@ -0,0 +1,76 @@
+From f26e8b88d2c90ed7eb9d4e276412b0923c23d10f Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Wed, 14 Dec 2016 18:13:08 +0800
+Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
+ compiling
+
+In configure.in, it contains the following:
+
+	APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
+
+the macro "APR_CHECK_SIZEOF_EXTENDED" was defined in build/apr_common.m4,
+it use the "AC_TRY_RUN" macro, this macro let the off_t to 8, when cross
+compiling enable.
+
+So it was hardcoded for cross compiling, we should detect it dynamic based on
+the sysroot's glibc. We change it to the following:
+
+	AC_CHECK_SIZEOF(off_t)
+
+The same for the following hardcoded types for cross compiling:
+
+	pid_t	8
+	ssize_t	8
+	size_t	8
+	off_t	8
+
+Change the above correspondingly.
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ configure.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 9d57ae6..5b19940 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1681,7 +1681,7 @@ else
+     socklen_t_value="int"
+ fi
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], pid_t, 8)
++AC_CHECK_SIZEOF(pid_t)
+ 
+ if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short"; then
+     pid_t_fmt='#define APR_PID_T_FMT "hd"'
+@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long, [ssize_t_fmt="ld"])
+ APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt="u"])
+ APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt="lu"])
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], ssize_t, 8)
++AC_CHECK_SIZEOF(ssize_t)
+ 
+ AC_MSG_CHECKING([which format to use for apr_ssize_t])
+ if test -n "$ssize_t_fmt"; then
+@@ -1767,7 +1767,7 @@ fi
+ 
+ ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <stddef.h>], size_t, 8)
++AC_CHECK_SIZEOF(size_t)
+ 
+ AC_MSG_CHECKING([which format to use for apr_size_t])
+ if test -n "$size_t_fmt"; then
+@@ -1784,7 +1784,7 @@ fi
+ 
+ size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""
+ 
+-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
++AC_CHECK_SIZEOF(off_t)
+ 
+ if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" = "4yes"; then
+     # Enable LFS
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index 302c93504b..f560c8b9c4 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://upgrade-and-fix-1.5.1.patch \
            file://Fix-packet-discards-HTTP-redirect.patch \
            file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
+           file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
 "
 
 SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
-- 
2.17.1


