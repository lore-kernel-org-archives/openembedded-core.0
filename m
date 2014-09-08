Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id BEB1862252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:00 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id x48so1959914wes.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6i4VDISFtZ8G0p42gy0BO9H6FAokBT9yN1/zGvF58+g=;
	b=Ax4N4iUHXGoG1c0GXLvXjIJlwrewOJSfk4DpkQMjlTiV6xqh7PUXYPbQCN5qFwDa5G
	slo7ab/9zoMN+Mt1STpVzc87ugGC03gqQFkTQDHZsbaWuJ2Id7iRFU7gCI3OI3JuNH1e
	5+Ri0wzw7m/V6htrFFEQK61yh9vXjbTPGIEtCzluqbUEfmu/GKCUjmGvoLZaz/s79rNy
	KOHuha5nlX5z/AwVucQxAeWqV1JV0lAU7PCOsdyZ1YzcYJGyrxA+ujuAAYyVCVYWtywz
	MnetkshK+kUPPNjOPUBr//kTWbDC/zBY5vwIt8HUHJohtTN22trikn5dxiIaOoI8BgHv
	2Eig==
X-Gm-Message-State: ALoCoQmxzyrwn45tsiWkb9ZmdoOybl17vVUDCevKJ/cVyl0Uadc4IzA6AgwScjqp+ewLrfvhbEXs
X-Received: by 10.194.173.234 with SMTP id bn10mr34447717wjc.81.1410177541337; 
	Mon, 08 Sep 2014 04:59:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:25 +0100
Message-Id: <03e12c16e74c0511c077d5332d1b8085168d5b77.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 07/27] perf: add libunwind support
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:02 -0000

From: Chong Lu <Chong.Lu@windriver.com>

Add a new feature named 'perf-libunwind'. Adding this support to perf allows it
to do stack traces on ARM - thumb2 and MIPS targets. PERF_FEATURES variable in
perf-features.inc will enable the perf-libunwind.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf-features.inc |    2 +-
 meta/recipes-kernel/perf/perf.bb           |    5 ++++-
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
index ebfedb9..cbd03f2 100644
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
1.7.10.4


