Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 383 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Nov 2016 15:45:38 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id E471171B01
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:45:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B9E632076C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:39:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 02 Nov 2016 11:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=x-me-sender:x-sasl-enc:from:to:subject
	:date:message-id:in-reply-to:references:in-reply-to:references;
	s=smtpout; bh=dUethquqOpt7lE3FoIWy0lOoo7U=; b=rJWl06jvO3t+jEpwT
	cBJDysJYWrqwLiT1SH79gOErV8qEUVSz7ejxiAe4dNa5GJd5w18F/UKUjWtRk2+9
	0y4cTxCIioFV5dLsdeQ2Zykap0Eo4SUMmif2v4YoZqs/kbALZmp5VDZc6pIUuIrX
	t6nvFmNNMdvtoa3F1IizKIPfiA=
X-ME-Sender: <xms:rAgaWIYwvNYqwmwS5zxr1hWA3pwXpow1MkwBRMgtGOZ0Gqbfq3XL8Q>
X-Sasl-enc: SyTkDSkEwjUAHBgF9ow9DR54J27Tv/8TmkmB/pedZuyK 1478101162
Received: from localhost.localdomain (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 05076CC02B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:39:21 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 17:39:09 +0200
Message-Id: <fe6e2b1b878cd89c05d48650caae3a8d33db0f72.1478101052.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1478101052.git.tanuk@iki.fi>
References: <cover.1478101052.git.tanuk@iki.fi>
In-Reply-To: <cover.1478101052.git.tanuk@iki.fi>
References: <cover.1478101052.git.tanuk@iki.fi>
Subject: [PATCH 2/2] libsamplerate0: clean up dependencies
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
X-List-Received-Date: Wed, 02 Nov 2016 15:45:39 -0000

The flac dependency was completely bogus. Flac isn't used at all.

FFTW is only used by tests, so we don't need to provide a packageconfig
for that.

ALSA is only used by example code that isn't part of the packaged files,
so even if ALSA is enabled, it doesn't affect the build result.
Nevertheless, I prefer to disable it explicitly to be extra sure.

--disable-alsa resulted in a warning about an unsupported configure
option, although by some magic it seemed to actually work as expected.
A patch is added to get rid of that warning.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../0001-configure.ac-improve-alsa-handling.patch  | 62 ++++++++++++++++++++++
 .../libsamplerate/libsamplerate0_0.1.9.bb          | 11 ++--
 2 files changed, 70 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch
new file mode 100644
index 0000000..d19b514
--- /dev/null
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch
@@ -0,0 +1,62 @@
+From 957ebce3837588f71016e37ffaf9aad0a9d41cec Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Fri, 23 Sep 2016 12:02:06 +0300
+Subject: [PATCH] configure.ac: improve alsa handling
+
+Three improvements:
+
+1) "--enable-alsa" or "--disable-alsa" caused a warning about an
+unsupported configure option, because AC_ARG_ENABLE was not used.
+
+2) If alsa was disabled, the "Have ALSA" item in the summary would print
+an empty string instead of "no".
+
+3) If "--enable-alsa" was passed to configure, but the headers were not
+found, configure would still succeed (with alsa disabled). It's better
+to fail and abort configure if a feature that was explicitly requested
+can't be enabled.
+
+Upstream-Status: Submitted [sent to src@mega-nerd.com]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 474c6ab..bad597e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -101,6 +101,9 @@ AC_ARG_ENABLE(cpu-clip,
+ 		AC_HELP_STRING([--disable-cpu-clip], [disable tricky cpu specific clipper]),
+ 		ac_arg_cpu_clip="N", ac_arg_cpu_clip="Y")
+ 
++AC_ARG_ENABLE(alsa,
++                AC_HELP_STRING([--disable-alsa], [disable ALSA support in the varispeed-play example program]))
++
+ #====================================================================================
+ # Check types and their sizes.
+ 
+@@ -194,6 +197,10 @@ if test x$enable_alsa != xno ; then
+ 	if test x$ac_cv_header_alsa_asoundlib_h = xyes ; then
+ 		ALSA_LIBS="-lasound"
+ 		enable_alsa=yes
++        elif test x$enable_alsa = xyes ; then
++                AC_MSG_ERROR(["ALSA headers not found"])
++        else
++                enable_alsa=no
+ 		fi
+ 	fi
+ 
+@@ -340,7 +347,7 @@ AC_MSG_RESULT([
+     Have FFTW : ................... ${ac_cv_fftw3}])
+ 
+ AC_MSG_RESULT([    Have libsndfile : ............. ${ac_cv_sndfile}])
+-AC_MSG_RESULT([    Have ALSA : ................... ${ac_cv_header_alsa_asoundlib_h}
++AC_MSG_RESULT([    Have ALSA : ................... ${enable_alsa}
+ ])
+ 
+ AC_MSG_RESULT([  Installation directories :
+-- 
+2.9.3
+
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index a24b8c7..5473bff 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -4,10 +4,12 @@ SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
                     file://src/samplerate.c;beginline=1;endline=7;md5=5b6982a8c2811c7312c13cccbf55f55e"
-DEPENDS = "flac libsndfile1"
+DEPENDS = "libsndfile1"
 PR = "r1"
 
-SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
+SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
+           file://0001-configure.ac-improve-alsa-handling.patch \
+"
 
 SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
 SRC_URI[sha256sum] = "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
@@ -18,4 +20,7 @@ S = "${WORKDIR}/libsamplerate-${PV}"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG[fftw] = ",--disable-fftw,fftw"
+# FFTW and ALSA are only used in tests and examples, so they don't affect
+# normal builds. It should be safe to ignore these, but explicitly disabling
+# them adds some extra certainty that builds are deterministic.
+EXTRA_OECONF = "--disable-fftw --disable-alsa"
-- 
2.9.3


