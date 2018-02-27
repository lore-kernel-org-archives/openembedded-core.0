Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 81F0871B2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:34:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 04:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,400,1515484800"; d="scan'208";a="31007152"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 27 Feb 2018 04:34:17 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 063285802B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:34:16 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 14:37:06 +0200
Message-Id: <1519735027-10472-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519735027-10472-1-git-send-email-maxin.john@intel.com>
References: <1519735027-10472-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] piglit: upgrade to current git master
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
X-List-Received-Date: Tue, 27 Feb 2018 12:34:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to revision:
4ce0887e2f7f848d2be2e435a2d0f3c80e44ea3b

remove backported patch:
        0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>

i# Your branch is ahead of 'origin/master' by 2 commits.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...gl-context-priority.c-Use-piglit_egl_get_.patch | 41 ----------------------
 meta/recipes-graphics/piglit/piglit_git.bb         |  5 ++-
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
deleted file mode 100644
index e2e87cc..0000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cb562a383229074b44db6998b85572d2abe7c363 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
-Date: Fri, 24 Nov 2017 10:31:55 -0600
-Subject: [PATCH] tests/egl/egl-context-priority.c: Use
- piglit_egl_get_default_display
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The entry point is not guaranteed to exist, so use the
-piglit_egl_get_default_display() helper which does the correct thing.
-
-Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Reviewed-by: Tapani Pälli <tapani.palli@intel.com>
-Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
-
-Upstream-Status: Backport
-
-https://cgit.freedesktop.org/piglit/commit/?id=cb562a3832
----
- tests/egl/egl-context-priority.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/tests/egl/egl-context-priority.c b/tests/egl/egl-context-priority.c
-index 7f26fc614..9590ccae3 100644
---- a/tests/egl/egl-context-priority.c
-+++ b/tests/egl/egl-context-priority.c
-@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)
- 	if (!strstr(exts, "EGL_MESA_platform_surfaceless"))
- 		piglit_report_result(PIGLIT_SKIP);
- 
--	dpy = eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA,
--				    EGL_DEFAULT_DISPLAY, NULL);
-+	dpy = piglit_egl_get_default_display(EGL_PLATFORM_SURFACELESS_MESA);
- 
- 	ok = eglInitialize(dpy, &major, &minor);
- 	if (!ok) {
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 2839f1d..b936ad8 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
-           file://0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-# From 2017-07-03
-SRCREV = "c8f4fd9eeb298a2ef0855927f22634f794ef3eff"
+# From 2018-02-26
+SRCREV = "4ce0887e2f7f848d2be2e435a2d0f3c80e44ea3b"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.4.0


