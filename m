Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ud7tD-0004sW-Im
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 01:47:16 +0200
Received: by mail-ea0-f180.google.com with SMTP id g10so2089361eak.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=kVI738LXpe3Gn3mLw1wotHUF5SAX6jVjsqcchPE/MfU=;
	b=vU6w0N2EBAIFsCrBYV5ghyDQvNa0+fPGZYdeJstle+rz+4a27BZ2r8VKbimc7CV8iK
	8eAD+GwU6HkTlnUtRvpVA5XdhlGldlDHTgy0yHyK8RDb8H3Mo6QPu3wMSGVzsaboykwh
	OBpkTNFR3i8ksiA82FNEwGYNfOVtSnSBGVYCEsGmH5W52bowspz2WwKXSW50Nej671kH
	PmkLUTUXG5N8PKh2RLMvdlGhfm8mS+lltrDXCR9FzCAbm6QDmsg8KN0D5asecz0QpaXU
	mpw8Jiww1mkCsoNAtNvau1PwOYmAKzbFELIPvsz+EbODutq6rUyt/IsiS4tV3Ad1AK8d
	sMug==
X-Received: by 10.14.220.71 with SMTP id n47mr43677037eep.33.1368746940891;
	Thu, 16 May 2013 16:29:00 -0700 (PDT)
Received: from localhost.localdomain (p5B0A1F3C.dip0.t-ipconnect.de.
	[91.10.31.60])
	by mx.google.com with ESMTPSA id g7sm14253687eew.15.2013.05.16.16.28.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 16 May 2013 16:29:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 01:28:42 +0200
Message-Id: <1368746922-6279-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] qt: fix warning -Wunused-local-typedefs introduced by gcc 4.8
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
X-List-Received-Date: Thu, 16 May 2013 23:47:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

in meta-oe maliit-framework failed with

| In file included from /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/include/qt4/QtCore/QtCore:53:0,
|                  from ../utils/core-utils.cpp:18:
| /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/include/qt4/QtCore/qtconcurrentfilter.h: In function 'QtConcurrent::ThreadEngineStarter<void> QtConcurrent::filterInternal(Sequence&, KeepFunctor, Redu
| /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/include/qt4/QtCore/qtconcurrentfilter.h:108:47: error: typedef 'Iterator' locally defined but not used [-Werror=unused-local-typedefs]
|      typedef typename Sequence::const_iterator Iterator;
|                                                ^
| cc1plus: all warnings being treated as errors

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |    1 +
 ...emove-unnecessary-typedef-found-by-gcc4-8.patch |   37 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb          |    2 +-
 5 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc b/meta/recipes-qt/qt4/qt4-4.8.4.inc
index 3f0f003..965b617 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
@@ -24,6 +24,7 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0022-ssl-certificates-blacklist-mis-issued-turktrust-certificates.patch \
            file://0023-qtnetwork-blacklist-two-more-certificates.patch \
            file://0024-Change-all-shmget-calls-to-user-only-memory.patch \
+           file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch
new file mode 100644
index 0000000..498f14f
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch
@@ -0,0 +1,37 @@
+From https://codereview.qt-project.org/p/qt/qt
+ * branch            refs/changes/22/53322/2 -> FETCH_HEAD
+From 28524b867ee8c9784f00eec0f07e4d9491a651b8 Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Tue, 9 Apr 2013 16:41:23 -0700
+Subject: [PATCH] Remove unnecessary typedef, found by GCC 4.8
+
+qtconcurrentfilter.h:108:47: warning: typedef 'Iterator' locally defined but not used [-Wunused-local-typedefs]
+
+Qt5 commit: d4c241a98059edaa7a4b15beb1cfd16ed041284e (qtbase)
+Task-number: QTBUG-30594
+Change-Id: Icc69e41c2d4e11962f0c8434236d4847b46e7d9d
+
+Upstream-Status: Pending for 4.8.5 [1]
+
+[1] https://codereview.qt-project.org/#change,53322
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/corelib/concurrent/qtconcurrentfilter.h |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/src/corelib/concurrent/qtconcurrentfilter.h b/src/corelib/concurrent/qtconcurrentfilter.h
+index 50b58bd..5a70182 100644
+--- a/src/corelib/concurrent/qtconcurrentfilter.h
++++ b/src/corelib/concurrent/qtconcurrentfilter.h
+@@ -105,7 +105,6 @@ namespace QtConcurrent {
+ template <typename Sequence, typename KeepFunctor, typename ReduceFunctor>
+ ThreadEngineStarter<void> filterInternal(Sequence &sequence, KeepFunctor keep, ReduceFunctor reduce)
+ {
+-    typedef typename Sequence::const_iterator Iterator;
+     typedef FilterKernel<Sequence, KeepFunctor, ReduceFunctor> KernelType;
+     return startThreadEngine(new KernelType(sequence, keep, reduce));
+ }
+-- 
+1.7.4.4
+
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
index 286da95..c08927e 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
@@ -1,7 +1,7 @@
 require qt4-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " -no-neon" ,d)}"
 
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 7645232..59c8ab5 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=6e1694ee338db410417517884918d4d2 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 inherit native
 
@@ -18,6 +18,7 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
            file://0021-configure-make-qt4-native-work-with-long-building-pa.patch \
+           file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch \
            file://g++.conf \
            file://linux.conf \
 	"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
index e5db30d..d6edef9 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt4-${PV}.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " -no-neon" ,d)}"
 
-- 
1.7.4.4



