Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 01CC471AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:17:28 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f73so32097674wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=seLJmee+fvVB8Ip85WkZdvis/NyRP1sp3GTIBDhM5nY=;
	b=MbUQOyxrRE0+JyFvZdUNfRFQskqqscb4Nw8RSOoIVX8NYdoCn+KHxi4BhIcCxHzxo5
	+Uh1yUYBEHGEBH4XRGGTaScsXxkPi83Fp5vUVvAmsJg+RY3YQAdvCYRDLyzvdFrfQFnj
	r9CpiediLjqelGEg6eGcMZAxKmdc1OI+KnstYSRJMzWOxo4CtWYbnH4ZtlYCC5LX1W6n
	m2uIykOMCJlqsgCOSVviNgres/xPb+vVZBYB+Cpf/gZF8d0n6eWeo4VGwm6JTifKEHF2
	ZVJX9nQ3g6zCTPFHvdKkwFziXZAGeL1/CWVC8llI4WUIxjAG7eJ8JfdBI/oj7f47u04k
	uN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=seLJmee+fvVB8Ip85WkZdvis/NyRP1sp3GTIBDhM5nY=;
	b=uUVNZe5gZo/yzn5OSZSOykI8w2vPXMTavHhRdwcHGWZdSSvop99G4ew6cwPZcAjRys
	VSPv+ftZa3OFTc1S6dcEDD8w5VCeG5L5/GpI+ZBRe00pERydYNiSSl4Z04ELOqKUJxN4
	hySZr5QVEc7usuIBUx3/BPJPC8SIhh64nAEEdfzE2h3BM5w/Jf/cWhAAWaF/kG6fJAjl
	1ht7+vlbs6OhE08mGcFjlk5bYmb2x3HDWlyxWsO+Zt9c0VSsBqF0v1adYLXuZEAx7nzF
	wHwFXRZFTSSS3i4/cXqBIoZGAEjbOD9ahfnLSOPSaR1ibUCvroKwwflRH1tsx17Zk7Tc
	eZIA==
X-Gm-Message-State: AIkVDXKIZex6DpiKZhLCXG4Uhyeh+gZ+almsRdK6wDige9gW9yX4aKlEmhWfTxsisOMZcyU9
X-Received: by 10.28.198.65 with SMTP id w62mr13261591wmf.123.1484583448242;
	Mon, 16 Jan 2017 08:17:28 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l67sm22730379wmf.1.2017.01.16.08.17.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jan 2017 08:17:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 16:17:25 +0000
Message-Id: <1484583445-26924-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gstreamer1.0: make libunwind detection deterministic
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
X-List-Received-Date: Mon, 16 Jan 2017 16:17:29 -0000

Otherwise libunwind support will be based on the contents of the sysroot, which
can cause problems.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  1 +
 .../gstreamer1.0/deterministic-unwind.patch        | 24 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.10.2.bb               |  1 +
 3 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 86c6f66..72d7ce6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -24,6 +24,7 @@ PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
+PACKAGECONFIG[unwind] = "--with-unwind,--without-unwind,libunwind"
 
 EXTRA_OECONF = " \
     --disable-dependency-tracking \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
new file mode 100644
index 0000000..e39e6ca
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
@@ -0,0 +1,24 @@
+Make the detection of libunwind deterministic.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index ac88fb2..182c19a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -829,3 +828,0 @@ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
+-dnl libunwind is optionally used by the leaks tracer
+-PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
+-
+@@ -839,3 +836,7 @@ AC_CHECK_FUNC(backtrace, [
+-if test "x$HAVE_UNWIND" = "xyes"; then
+-  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
+-fi
++dnl libunwind is optionally used by the leaks tracer
++AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind],[use libunwind])],
++            [], [with_unwind=yes])
++AS_IF([test "$with_unwind" = yes],
++      [PKG_CHECK_MODULES(UNWIND, libunwind)
++       AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])]
++)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
index cc5c57f..4a01e8c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+    file://deterministic-unwind.patch \
 "
 SRC_URI[md5sum] = "0d289e5bcec6353e6540ddb75b7d371b"
 SRC_URI[sha256sum] = "150e8e81febac94c161d8141cde78a38038a8f56e8ec549f353da54994278d65"
-- 
2.8.1


