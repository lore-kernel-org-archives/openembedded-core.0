Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE380711A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 08:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7T8hnke025286
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:43:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 01:43:48 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 16:38:37 +0800
Message-ID: <d2d05abe9ec5edc07e7f064ac52748ea87847c3f.1409301362.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409301362.git.Chong.Lu@windriver.com>
References: <cover.1409301362.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perf: add libunwind support
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
X-List-Received-Date: Fri, 29 Aug 2014 08:43:49 -0000
Content-Type: text/plain

Add a new feature named 'perf-libunwind'. Adding this support to perf allows it
to do stack traces on ARM - thumb2 and MIPS targets. PERF_FEATURES variable in
perf-features.inc will enable the perf-libunwind.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/perf/perf-features.inc | 2 +-
 meta/recipes-kernel/perf/perf.bb           | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
index b8859ab..2dbbb47 100644
--- a/meta/recipes-kernel/perf/perf-features.inc
+++ b/meta/recipes-kernel/perf/perf-features.inc
@@ -1,4 +1,4 @@
-PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
+PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
 
 def perf_feature_enabled(feature, trueval, falseval, d):
     """
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index bfd210c..ab94a05 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -20,6 +20,7 @@ BUILDPERF_libc-uclibc = "no"
 # to cover a wide range of kernel we add both dependencies
 TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt slang', '',d)}"
 SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"
+LIBUNWIND_DEPENDS = "${@perf_feature_enabled('perf-libunwind', 'libunwind', '',d)}"
 
 DEPENDS = "virtual/kernel \
     virtual/${MLPREFIX}libc \
@@ -27,6 +28,7 @@ DEPENDS = "virtual/kernel \
     ${MLPREFIX}binutils \
     ${TUI_DEPENDS} \
     ${SCRIPTING_DEPENDS} \
+    ${LIBUNWIND_DEPENDS} \
     bison flex \
 "
 
@@ -62,6 +64,7 @@ B = "${WORKDIR}/${BPN}-${PV}"
 
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
+LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1',d)}"
 
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
@@ -76,7 +79,7 @@ EXTRA_OEMAKE = '\
     CC="${CC}" \
     AR="${AR}" \
     perfexecdir=${libexecdir} \
-    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 NO_LIBUNWIND=1 ${SCRIPTING_DEFINES} \
+    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} ${SCRIPTING_DEFINES} \
 '
 
 EXTRA_OEMAKE += "\
-- 
1.9.1


