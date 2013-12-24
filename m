Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9B22C61005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 14:37:59 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VvT7Q-0001I6-Tu from Fahad_Arslan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Dec 2013 06:38:00 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 24 Dec 2013 06:38:00 -0800
From: Fahad Arslan <fahad_arslan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Dec 2013 19:37:42 +0500
Message-Id: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 24 Dec 2013 14:38:00.0894 (UTC)
	FILETIME=[BEE73DE0:01CF00B5]
Subject: [PATCH] pulseaudio: rescale input being passed to float method of speex
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
X-List-Received-Date: Tue, 24 Dec 2013 14:37:59 -0000

From: Fahad Arslan <Fahad_Arslan@mentor.com>

Pulseaudio uses Speex to do resampling. Default Pulseaudio resampler
is speex-float-1. However, Speex recipe in poky configures speex in
fixed point. This scenario creates a situation in which audio streams
that need to be resampled are not playedback since input to speex is
zeroed out when flaot input in range of +/-1 is converted to int.
So we are rescaling the input before invoking speex flaot method.

Upstream-Status: Submitted [pulseaudio-discuss@lists.freedesktop.org]

Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>
---
 .../pulseaudio/rescale_input_to_speex_float.patch  |   24 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_4.0.bb                   |    3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch
new file mode 100644
index 0000000..fe5e6a7
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_speex_float.patch
@@ -0,0 +1,24 @@
+diff -Naur a/src/pulsecore/resampler.c b/src/pulsecore/resampler.c
+--- a/src/pulsecore/resampler.c	2013-12-24 18:25:08.164787401 +0500
++++ b/src/pulsecore/resampler.c	2013-12-24 18:24:43.056787026 +0500
+@@ -1347,7 +1347,7 @@
+ 
+ static void speex_resample_float(pa_resampler *r, const pa_memchunk *input, unsigned in_n_frames, pa_memchunk *output, unsigned *out_n_frames) {
+     float *in, *out;
+-    uint32_t inf = in_n_frames, outf = *out_n_frames;
++    uint32_t inf = in_n_frames, outf = *out_n_frames, i;
+ 
+     pa_assert(r);
+     pa_assert(input);
+@@ -1357,6 +1357,11 @@
+     in = pa_memblock_acquire_chunk(input);
+     out = pa_memblock_acquire_chunk(output);
+ 
++    /* Speex float API scale range is +/-32768 instead of +/-1.
++       So rescale input before passing it to Speex. */
++    for (i = 0; i < inf; i++)
++        in[i] = 32768.*in[i];
++
+     pa_assert_se(speex_resampler_process_interleaved_float(r->speex.state, in, &inf, out, &outf) == 0);
+ 
+     pa_memblock_release(input->memblock);
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
index b419c54..5afa20b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
@@ -1,7 +1,8 @@
 require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
-           file://volatiles.04_pulse"
+           file://volatiles.04_pulse \
+           file://rescale_input_to_speex_float.patch"
 
 SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
 SRC_URI[sha256sum] = "35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae"
-- 
1.7.9.5


