Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id EF87B719A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 07:13:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 99AC12089D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:09 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Wed, 15 Feb 2017 02:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=WbKDOz4zdjEu6iDLnaGP91+tYnA=; b=kspXA
	ClDITpd29SZNVbdsj2TjewLYbbQ4tSvUeC5AhWL3EFxB22XuGb2ESOhebTJykqH/
	hxy1I/8nQ1B+3DSxGb/aajSQr6BEPMK3tVXrsX447mqAJ1CU3tQVHG8QsShRUbCc
	z1iP+3mVkiSwkodqjM//wrvLVUoycwmqnMeqhA=
X-ME-Sender: <xms:hf-jWHwO8jAaooKzZdpiZdUm1qNonzcjKBsMtuhaigOfnC-Di2s16A>
X-Sasl-enc: juGYYWjewZ1j4d5923k2G8Ht/i/CeLgR+YHBSmKImcAw 1487142789
Received: from localhost.localdomain (unknown [192.40.95.8])
	by mail.messagingengine.com (Postfix) with ESMTPA id 260157E0F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:09 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 09:13:01 +0200
Message-Id: <20170215071303.3244-2-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170215071303.3244-1-tanuk@iki.fi>
References: <20170215071303.3244-1-tanuk@iki.fi>
Subject: [PATCH 1/3] alsa-lib: 1.1.2 -> 1.1.3
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
X-List-Received-Date: Wed, 15 Feb 2017 07:13:09 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.1.2_v1.1.3

Added a patch to fix a build failure with musl (cherry-picked from
upstream).

The new release doesn't any more install the smixer modules when Python
support is disabled. The modules weren't usable without Python support
before either, so this change does not constitute a loss of
functionality [1].

alsa-lib-dev has automatic dependencies on alsa-lib and libasound, but
since the smixer modules were the only thing in the alsa-lib package,
the alsa-lib package doesn't get generated any more. alsa-lib-dev still
has an automatic dependency on alsa-lib, however, so I had to override
the RDEPENDS of alsa-lib-dev to only include libasound.

[1] http://mailman.alsa-project.org/pipermail/alsa-devel/2016-November/114682.html

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  | 33 ++++++++++++++++++++++
 .../alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb}  | 12 +++++---
 2 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} (77%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
new file mode 100644
index 0000000000..4edaf4d961
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
@@ -0,0 +1,33 @@
+From 005ac9d2fa000912c8fb8257020a0471b1c6176c Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 21 Dec 2016 19:46:34 -0300
+Subject: [PATCH] ucm: parser needs limits.h
+
+It's using PATH_MAX which is defined there, otherwise the build fails on
+musl libc.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+Upstream-Status: Accepted [expected in 1.1.4]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ src/ucm/parser.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ucm/parser.c b/src/ucm/parser.c
+index c98373a9..f520abc5 100644
+--- a/src/ucm/parser.c
++++ b/src/ucm/parser.c
+@@ -32,6 +32,7 @@
+ 
+ #include "ucm_local.h"
+ #include <dirent.h>
++#include <limits.h>
+ 
+ /** The name of the environment variable containing the UCM directory */
+ #define ALSA_CONFIG_UCM_VAR "ALSA_CONFIG_UCM"
+-- 
+2.11.0
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
similarity index 77%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
index e313da78e4..5c213bebde 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
@@ -11,9 +11,10 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
+           file://0001-ucm-parser-needs-limits.h.patch \
 "
-SRC_URI[md5sum] = "1946e6438b8262a7b8fdadacd0e06ba7"
-SRC_URI[sha256sum] = "d38dacd9892b06b8bff04923c380b38fb2e379ee5538935ff37e45b395d861d6"
+SRC_URI[md5sum] = "eefe5992567ba00d6110a540657aaf5c"
+SRC_URI[sha256sum] = "71282502184c592c1a008e256c22ed0ba5728ca65e05273ceb480c70f515969c"
 
 inherit autotools pkgconfig
 
@@ -25,8 +26,6 @@ EXTRA_OECONF = "--disable-python"
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
 PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
-FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
-FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
@@ -38,6 +37,11 @@ ${datadir}/alsa/pcm/dmix.conf \
 ${datadir}/alsa/pcm/dsnoop.conf"
 
 RDEPENDS_libasound = "alsa-conf-base alsa-conf"
+
+# alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
+# alsa-lib package doesn't exist. libasound is the real library package.
+RDEPENDS_${PN}-dev = "libasound"
+
 # upgrade path
 RPROVIDES_${PN}-dev = "alsa-dev"
 RREPLACES_${PN}-dev = "alsa-dev"
-- 
2.11.0


