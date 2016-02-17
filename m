Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id D8A746012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 16:56:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C37CB20761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:29 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 17 Feb 2016 11:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=PY2pl/nJbpntulp6rq5gDeWqqKo=; b=SRk9k
	l6mGvHLlbSJ1SXYs5LODQm7wUn5FFSwW08LM6/yFDNz5V+BUXMhQ18fHMSJhzi94
	C7l47QSnA5lrK0H43dDZzgp1u2zcJf6TNWnXOst4I8EJ1EX601D/Wz35eoegcFxt
	u++EO3NcI/vmTuVwnh/jv1KQOZ2Y37b93CeC38=
X-Sasl-enc: phKTjSNh782CsyVGQ3uvIzEyUElOsEhu8N9qry64SGX4 1455728189
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 16373C00012
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:28 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 18:56:15 +0200
Message-Id: <38387330fe16c85506737381064ce64cfb56178a.1455727967.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
Subject: [PATCH 3/4] alsa-plugins: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Wed, 17 Feb 2016 16:56:29 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.0.29_v1.1.0

The licensing of the libsamplerate plugin was relaxed a bit: if the
licensee has a commercial license for libsamplerate, the plugin can be
used under the terms of LGPL instead of GPL.

Both old patches are included in the new release, so dropped them.

Added a new patch to fix building against libspeexdsp 1.2rc3.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...nclude-sys-select.h-for-fd_set-definition.patch | 31 ----------
 ...nclude-speexdsp_types.h-not-speex_types.h.patch | 71 ----------------------
 ...ph-include-config.h-from-rate_speexrate.c.patch | 35 +++++++++++
 ...lsa-plugins_1.0.29.bb => alsa-plugins_1.1.0.bb} | 16 ++---
 4 files changed, 44 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam-av-Include-sys-select.h-for-fd_set-definition.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.0.29.bb => alsa-plugins_1.1.0.bb} (87%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam-av-Include-sys-select.h-for-fd_set-definition.patch b/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam-av-Include-sys-select.h-for-fd_set-definition.patch
deleted file mode 100644
index c70c72c..0000000
--- a/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam-av-Include-sys-select.h-for-fd_set-definition.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d28c655be3ac4fcb8024555983884f832ee18787 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 May 2015 15:17:30 -0700
-Subject: [PATCH] arcam-av: Include sys/select.h for fd_set definition
-
-fixes build errors on non-glibc based systems
-
-arcam-av/arcam_av.c:389:2: error: unknown type name 'fd_set'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- arcam-av/arcam_av.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arcam-av/arcam_av.c b/arcam-av/arcam_av.c
-index 0491fc6..fff96f9 100644
---- a/arcam-av/arcam_av.c
-+++ b/arcam-av/arcam_av.c
-@@ -31,6 +31,7 @@
- #include <unistd.h>
- 
- #include <sys/ipc.h>
-+#include <sys/select.h>
- #include <sys/shm.h>
- #include <sys/stat.h>
- #include <sys/stat.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch b/meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch
deleted file mode 100644
index e5199fb..0000000
--- a/meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From ca41e96a49a568128354f65f90a769debf5435f1 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
-Date: Thu, 9 Jul 2015 11:58:12 +0300
-Subject: [PATCH] include speexdsp_types.h, not speex_types.h
-
-Speexdsp was separated from speex in 1.2rc2. speex_types.h is not
-shipped by speexdsp, so alsa-plugins shouldn't use that file. speexdsp
-has speexdsp_types.h, which has the same contents as speex_types.h.
-
-speexdsp_types.h is a new file introduced in 1.2rc2, so this change
-bumps the minimum supported speexdsp version. The version check in
-configure.ac will actually break if speexdsp 1.2 ever gets released,
-because pkg-config thinks that "1.2" < "1.2rc2", but I think it's
-useful to fail if the installed speexdsp version is 1.2rc1 (which I
-believe is very common on current distributions). If a non-rc version
-of speexdsp will ever get released, I hope version number 1.2 will be
-skipped for this reason. (A non-rc version seems unlikely, since
-1.2rc1 was released years ago, so it's pretty likely that the project
-is stuck on so called "release candidates" forever...)
-
-Upstream-Status: Submitted (http://thread.gmane.org/gmane.linux.alsa.devel/141149)
-
-Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
----
- configure.ac          | 2 +-
- pph/arch.h            | 2 +-
- pph/speex_resampler.h | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 902a6d7..c554d22 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -108,7 +108,7 @@ AC_SUBST(AVCODEC_CFLAGS)
- AC_SUBST(AVCODEC_LIBS)
- AC_SUBST(AVCODEC_HEADER)
- 
--PKG_CHECK_MODULES(speexdsp, [speexdsp >= 1.2], [HAVE_SPEEXDSP="yes"], [HAVE_SPEEXDSP=""])
-+PKG_CHECK_MODULES(speexdsp, [speexdsp >= 1.2rc2], [HAVE_SPEEXDSP="yes"], [HAVE_SPEEXDSP=""])
- AM_CONDITIONAL(HAVE_SPEEXDSP, test "$HAVE_SPEEXDSP" = "yes")
- 
- AC_ARG_WITH([speex],
-diff --git a/pph/arch.h b/pph/arch.h
-index e2d731a..a07d0d9 100644
---- a/pph/arch.h
-+++ b/pph/arch.h
-@@ -36,7 +36,7 @@
- #define ARCH_H
- 
- #ifndef OUTSIDE_SPEEX
--#include "speex/speex_types.h"
-+#include "speex/speexdsp_types.h"
- #endif
- 
- #define ABS(x) ((x) < 0 ? (-(x)) : (x))      /**< Absolute integer value. */
-diff --git a/pph/speex_resampler.h b/pph/speex_resampler.h
-index c44fbcd..aa85abb 100644
---- a/pph/speex_resampler.h
-+++ b/pph/speex_resampler.h
-@@ -82,7 +82,7 @@
-       
- #else /* OUTSIDE_SPEEX */
- 
--#include "speex/speex_types.h"
-+#include "speex/speexdsp_types.h"
- 
- #endif /* OUTSIDE_SPEEX */
- 
--- 
-1.9.3
-
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch b/meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
new file mode 100644
index 0000000..8e5b6a2
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
@@ -0,0 +1,35 @@
+From 4350314c941489833a8baa930e16512e55f72a13 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Wed, 27 Jan 2016 13:22:38 +0200
+Subject: [PATCH] pph: include config.h from rate_speexrate.c
+
+Fixes compilation against libspeexdsp 1.2rc3.
+
+rate_speexrate.c includes speex_resampler.h, which depends on config.h
+by referencing the HAVE_SPEEX_SPEEXDSP_TYPES_H macro. AFAIK it's not
+a good idea to include config.h from headers (I don't know/remember
+why, though), which is why I include config.h from rate_speexrate.c
+instead of speex_resampler.h.
+
+Upstream-Status: Accepted [expected in 1.1.1]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ pph/rate_speexrate.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pph/rate_speexrate.c b/pph/rate_speexrate.c
+index 0a1325c..8fc4cef 100644
+--- a/pph/rate_speexrate.c
++++ b/pph/rate_speexrate.c
+@@ -28,6 +28,7 @@
+    POSSIBILITY OF SUCH DAMAGE.
+ */
+ 
++#include "config.h"
+ #include <stdio.h>
+ #include <alsa/asoundlib.h>
+ #include <alsa/pcm_rate.h>
+-- 
+2.7.0.rc3
+
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
similarity index 87%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
index d7c42ce..fec6575 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
@@ -8,21 +8,23 @@ SECTION = "multimedia"
 # build system, and doesn't affect the licensing of the build result.
 #
 # The samplerate plugin source code is licensed under GPLv2+ to be consistent
-# with the libsamplerate license.
+# with the libsamplerate license. However, if the licensee has a commercial
+# license for libsamplerate, the samplerate plugin may be used under the terms
+# of LGPLv2.1 like the rest of the plugins.
 LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "\
         file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
         file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
         file://m4/attributes.m4;endline=33;md5=b25958da44c02231e3641f1bccef53eb \
-        file://rate/rate_samplerate.c;endline=19;md5=f3d3ce0b189846a486517d97a854b276 \
+        file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
 "
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2 \
-           file://0001-arcam-av-Include-sys-select.h-for-fd_set-definition.patch \
-           file://0001-include-speexdsp_types.h-not-speex_types.h.patch \
+SRC_URI = "\
+        ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2 \
+        file://0001-pph-include-config.h-from-rate_speexrate.c.patch \
 "
-SRC_URI[md5sum] = "a66797b4471e3cbe96575207bfbe252c"
-SRC_URI[sha256sum] = "325d85cac285f632b83e0191ae3f348bad03c1f007b937042f164abb81ea6532"
+SRC_URI[md5sum] = "b123e42ed881b9adbc99e4040f257c39"
+SRC_URI[sha256sum] = "3b83c329953bef99f5fe25ae04ec4a455fe6514939f3b45a5321966652b2c9ee"
 
 DEPENDS += "alsa-lib"
 
-- 
2.7.0


