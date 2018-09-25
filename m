Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 0E992601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:18:31 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.76.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E857F2086B;
	Tue, 25 Sep 2018 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537895913;
	bh=aqBUTT4JHVMjR/VeTCcIElKsYGvOCnCSLwHjPX78XX4=;
	h=From:To:Cc:Subject:Date:From;
	b=OU8EvgO8eJ5NtEx1ENpWG/E3IQD1zg0Y2CHIoW5o/16xqzTMpvLsC1B2aybSp0p9I
	rB2W+MF5bJPuIsw5jCdS3vAznzK8YwkjFtkXQ27Wp+xlEw+E/zjmivh+4IRckbrot7
	cR6raqL4qs4GiMLlu22NMHQp+HE/oHjozQ642ZaM=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 17:18:27 +0000
Message-Id: <20180925171828.8655-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1 1/2] libice: CVE-2017-2626
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
X-List-Received-Date: Tue, 25 Sep 2018 17:18:32 -0000
Content-Transfer-Encoding: 8bit

* CVE-2017-2626
It was discovered that libICE before 1.0.9-8 used a weak entropy to
generate keys. A local attacker could potentially use this flaw for
session hijacking using the information available from the process list.

Affects libice < 1.0.9-8

CVE: CVE-2017-2626
Ref: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-2626
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../xorg-lib/libice/CVE-2017-2626.patch       | 144 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libice_1.0.9.bb |   4 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch

diff --git a/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch b/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
new file mode 100644
index 0000000000..382e0428c0
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libice/CVE-2017-2626.patch
@@ -0,0 +1,144 @@
+From da5dc9e3a7a7e96284512f976f864f7ef13755b7 Mon Sep 17 00:00:00 2001
+From: Benjamin Tissoires <benjamin.tissoires@gmail.com>
+Date: Tue, 4 Apr 2017 19:12:53 +0200
+Subject: [PATCH] Use getentropy() if arc4random_buf() is not available
+
+This allows to fix CVE-2017-2626 on Linux platforms without pulling in
+libbsd.
+The libc getentropy() is available since glibc 2.25 but also on OpenBSD.
+For Linux, we need at least a v3.17 kernel. If the recommended
+arc4random_buf() function is not available, emulate it by first trying
+to use getentropy() on a supported glibc and kernel. If the call fails,
+fall back to the current (partly vulnerable) code.
+
+Signed-off-by: Benjamin Tissoires <benjamin.tissoires@gmail.com>
+Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/lib/libICE/commit/?id=ff5e59f32255913bb1cdf51441b98c9107ae165b]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ configure.ac  |  2 +-
+ src/iceauth.c | 65 ++++++++++++++++++++++++++++++++++++---------------
+ 2 files changed, 47 insertions(+), 20 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 458882a..c971ab6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -38,7 +38,7 @@ AC_DEFINE(ICE_t, 1, [Xtrans transport type])
+ 
+ # Checks for library functions.
+ AC_CHECK_LIB([bsd], [arc4random_buf])
+-AC_CHECK_FUNCS([asprintf arc4random_buf])
++AC_CHECK_FUNCS([asprintf arc4random_buf getentropy])
+ 
+ # Allow checking code with lint, sparse, etc.
+ XORG_WITH_LINT
+diff --git a/src/iceauth.c b/src/iceauth.c
+index ef66626..9b77eac 100644
+--- a/src/iceauth.c
++++ b/src/iceauth.c
+@@ -42,31 +42,19 @@ Author: Ralph Mor, X Consortium
+ 
+ static int was_called_state;
+ 
+-/*
+- * MIT-MAGIC-COOKIE-1 is a sample authentication method implemented by
+- * the SI.  It is not part of standard ICElib.
+- */
++#ifndef HAVE_ARC4RANDOM_BUF
+ 
+-
+-char *
+-IceGenerateMagicCookie (
++static void
++emulate_getrandom_buf (
++	char *auth,
+ 	int len
+ )
+ {
+-    char    *auth;
+-#ifndef HAVE_ARC4RANDOM_BUF
+     long    ldata[2];
+     int	    seed;
+     int	    value;
+     int	    i;
+-#endif
+ 
+-    if ((auth = malloc (len + 1)) == NULL)
+-	return (NULL);
+-
+-#ifdef HAVE_ARC4RANDOM_BUF
+-    arc4random_buf(auth, len);
+-#else
+ #ifdef ITIMER_REAL
+     {
+ 	struct timeval  now;
+@@ -74,13 +62,13 @@ IceGenerateMagicCookie (
+ 	ldata[0] = now.tv_sec;
+ 	ldata[1] = now.tv_usec;
+     }
+-#else
++#else /* ITIMER_REAL */
+     {
+ 	long    time ();
+ 	ldata[0] = time ((long *) 0);
+ 	ldata[1] = getpid ();
+     }
+-#endif
++#endif /* ITIMER_REAL */
+     seed = (ldata[0]) + (ldata[1] << 16);
+     srand (seed);
+     for (i = 0; i < len; i++)
+@@ -88,7 +76,46 @@ IceGenerateMagicCookie (
+ 	value = rand ();
+ 	auth[i] = value & 0xff;
+     }
+-#endif
++}
++
++static void
++arc4random_buf (
++	char *auth,
++	int len
++)
++{
++    int	    ret;
++
++#if HAVE_GETENTROPY
++    /* weak emulation of arc4random through the entropy libc */
++    ret = getentropy (auth, len);
++    if (ret == 0)
++	return;
++#endif /* HAVE_GETENTROPY */
++
++    emulate_getrandom_buf (auth, len);
++}
++
++#endif /* !defined(HAVE_ARC4RANDOM_BUF) */
++
++/*
++ * MIT-MAGIC-COOKIE-1 is a sample authentication method implemented by
++ * the SI.  It is not part of standard ICElib.
++ */
++
++
++char *
++IceGenerateMagicCookie (
++	int len
++)
++{
++    char    *auth;
++
++    if ((auth = malloc (len + 1)) == NULL)
++	return (NULL);
++
++    arc4random_buf (auth, len);
++
+     auth[len] = '\0';
+     return (auth);
+ }
+-- 
+2.19.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
index f069749ce0..4962815ae3 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
@@ -8,6 +8,10 @@ negotiating versions, and for reporting errors. "
 
 require xorg-lib-common.inc
 
+SRC_URI += "\
+            file://CVE-2017-2626.patch \
+"
+
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d162b1b3c6fa812da9d804dcf8584a93"
 
-- 
2.19.0


