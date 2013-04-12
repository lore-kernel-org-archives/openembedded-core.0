Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQbiI-0007Gp-4h
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 13:00:15 +0200
Received: by mail-wi0-f172.google.com with SMTP id hr17so1434611wib.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=4Ulg/W7dCaSo2pgNKac/F2bAFcqwe7FsbN3m0P9Q/3c=;
	b=kl+SgkW7WFwloC8ZV+c95qIzHB+kSm2HC4IMZdywTFL5r4EgDBcuU6wycejjBgyGLA
	pKh0a7lIOiTSxhQWQ79EXzxjxPZXYcNHxTB6P/k4IEkvUYy9gvGw7CJhcd4kKLpS2r2J
	Evtm6HlvNAJ/PDPIvJ5a6YqH4IlkiQnuRTHNxtFIobsyYOZpN0Y03YKggVPNTxam4JIT
	1x8M8p9f5RHinDrjeUznEefTtzUTuBZExnYti6Li8amc+6hRi39fDd795PIsl1uQwBID
	uzuIKru3IHPdWmf6nSPdnAiemCjaSK+9IO9wNDtvt5yZ94csTMnyxy4+YO542y9azGKV
	FrnA==
X-Received: by 10.180.108.106 with SMTP id hj10mr3209488wib.0.1365763369886;
	Fri, 12 Apr 2013 03:42:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm2522294wib.3.2013.04.12.03.42.48
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:42:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 11:40:01 +0100
Message-Id: <1365763201-19182-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnByOHgMkjwlBURzedAdKD60IG8+aTo4gzNTM06D66KgsUTuddtB1vyiKUBgeicHM4yB+xx
Subject: [PATCH] wayland: only build the scanner in wayland-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 11:00:24 -0000

We only build wayland-native for the scanner, so disable the bits we don't
actually need.  This gives us a small speed up but importantly should allow
wayland-native to compile on older hosts such as CentOS 5 which currently fails.

[ YOCTO #4245 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/wayland/just-scanner.patch             |   36 ++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.0.6.bb     |    2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/just-scanner.patch

diff --git a/meta/recipes-graphics/wayland/wayland/just-scanner.patch b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
new file mode 100644
index 0000000..234a9c5
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
@@ -0,0 +1,36 @@
+We only build wayland-native for the scanner, so disable the bits we don't
+actually need.  This gives us a small speed up but importantly should allow
+wayland-native to compile on older hosts such as CentOS 5 which currently fails:
+
+| wayland-1.0.6/src/wayland-server.c:1245: error: 'O_CLOEXEC' undeclared (first use in this function)
+| wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or directory
+| wayland-1.0.6/src/event-loop.c:199: error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
+| wayland-1.0.6/src/event-loop.c:199: error: 'TFD_CLOEXEC' undeclared (first use in this function)
+| wayland-1.0.6/src/event-loop.c:268: error: 'SFD_CLOEXEC' undeclared (first use in this function)
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 306d7b3..571fe89 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,7 @@ if BUILD_DOCS
+ doc_subdir = doc
+ endif
+ 
+-SUBDIRS = src protocol $(doc_subdir) tests cursor
++SUBDIRS = src protocol $(doc_subdir)
+ 
+ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e1d04ea..702342e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,4 +1,4 @@
+-lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
++#lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
+ noinst_LTLIBRARIES = libwayland-util.la
+ 
+ include_HEADERS =				\
diff --git a/meta/recipes-graphics/wayland/wayland_1.0.6.bb b/meta/recipes-graphics/wayland/wayland_1.0.6.bb
index 1585479..7c18979 100644
--- a/meta/recipes-graphics/wayland/wayland_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.0.6.bb
@@ -16,6 +16,8 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "936a2590aea69fa3c0cf234d54b9137c"
 SRC_URI[sha256sum] = "f52a012df699eff434b0f49e56000d6978b5f781048402ca8e0232242970fc49"
 
+SRC_URI_append_class-native = " file://just-scanner.patch"
+
 inherit autotools pkgconfig
 
 # We need wayland-native for the wayland-scanner utility
-- 
1.7.10.4



