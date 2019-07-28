Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D882E7BD97
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 23:21:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2019 16:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,320,1559545200"; d="scan'208";a="346424859"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 28 Jul 2019 16:21:05 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 07:20:54 +0800
Message-Id: <1564356060-13772-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [thud][PATCH 1/7] libsdl: CVE fixes
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
X-List-Received-Date: Sun, 28 Jul 2019 23:21:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes CVE-2019-7572, CVE-2019-7574, CVE-2019-7575, CVE-2019-7576,
CVE-2019-7577, CVE-2019-7578, CVE-2019-7635, CVE-2019-7637,
CVE-2019-7638.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsdl/libsdl-1.2.15/CVE-2019-7572.patch       | 114 ++++++++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7574.patch       |  68 ++++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7575.patch       |  81 +++++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7576.patch       |  80 +++++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7577.patch       | 123 +++++++++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7578.patch       |  64 +++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7635.patch       |  63 +++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7637.patch       | 192 +++++++++++++++++++++
 .../libsdl/libsdl-1.2.15/CVE-2019-7638.patch       |  38 ++++
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   9 +
 10 files changed, 832 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch

diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch
new file mode 100644
index 0000000..c41c2de
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7572.patch
@@ -0,0 +1,114 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560182231 25200
+#      Mon Jun 10 08:57:11 2019 -0700
+# Branch SDL-1.2
+# Node ID a8afedbcaea0e84921dc770195c4699bda3ccdc5
+# Parent  faf9abbcfb5fe0d0ca23c4bf0394aa226ceccf02
+CVE-2019-7572: Fix a buffer overwrite in IMA_ADPCM_decode
+If data chunk was longer than expected based on a WAV format
+definition, IMA_ADPCM_decode() tried to write past the output
+buffer. This patch fixes it.
+
+Based on patch from
+<https://bugzilla.libsdl.org/show_bug.cgi?id=4496>.
+
+CVE-2019-7572
+https://bugzilla.libsdl.org/show_bug.cgi?id=4495
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560041863 25200
+#      Sat Jun 08 17:57:43 2019 -0700
+# Branch SDL-1.2
+# Node ID e52413f5258600878f9a10d2f92605a729aa8976
+# Parent  4e73be7b47877ae11d2279bd916910d469d18f8e
+CVE-2019-7572: Fix a buffer overread in IMA_ADPCM_nibble
+If an IMA ADPCM block contained an initial index out of step table
+range (loaded in IMA_ADPCM_decode()), IMA_ADPCM_nibble() blindly used
+this bogus value and that lead to a buffer overread.
+
+This patch fixes it by moving clamping the index value at the
+beginning of IMA_ADPCM_nibble() function instead of the end after
+an update.
+
+CVE-2019-7572
+https://bugzilla.libsdl.org/show_bug.cgi?id=4495
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7572
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r faf9abbcfb5f -r a8afedbcaea0 src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Mon Jun 10 08:54:29 2019 -0700
++++ b/src/audio/SDL_wave.c	Mon Jun 10 08:57:11 2019 -0700
+@@ -346,7 +346,7 @@
+ static int IMA_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
+ {
+ 	struct IMA_ADPCM_decodestate *state;
+-	Uint8 *freeable, *encoded, *encoded_end, *decoded;
++	Uint8 *freeable, *encoded, *encoded_end, *decoded, *decoded_end;
+ 	Sint32 encoded_len, samplesleft;
+ 	unsigned int c, channels;
+ 
+@@ -373,6 +373,7 @@
+ 		return(-1);
+ 	}
+ 	decoded = *audio_buf;
++	decoded_end = decoded + *audio_len;
+ 
+ 	/* Get ready... Go! */
+ 	while ( encoded_len >= IMA_ADPCM_state.wavefmt.blockalign ) {
+@@ -392,6 +393,7 @@
+ 			}
+ 
+ 			/* Store the initial sample we start with */
++			if (decoded + 2 > decoded_end) goto invalid_size;
+ 			decoded[0] = (Uint8)(state[c].sample&0xFF);
+ 			decoded[1] = (Uint8)(state[c].sample>>8);
+ 			decoded += 2;
+@@ -402,6 +404,8 @@
+ 		while ( samplesleft > 0 ) {
+ 			for ( c=0; c<channels; ++c ) {
+ 				if (encoded + 4 > encoded_end) goto invalid_size;
++				if (decoded + 4 * 4 * channels > decoded_end)
++					goto invalid_size;
+ 				Fill_IMA_ADPCM_block(decoded, encoded,
+ 						c, channels, &state[c]);
+ 				encoded += 4;
+
+diff -r 4e73be7b4787 -r e52413f52586 src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Sat Jun 01 18:27:46 2019 +0100
++++ b/src/audio/SDL_wave.c	Sat Jun 08 17:57:43 2019 -0700
+@@ -264,6 +264,14 @@
+ 	};
+ 	Sint32 delta, step;
+ 
++	/* Clamp index value. The inital value can be invalid. */
++	if ( state->index > 88 ) {
++		state->index = 88;
++	} else
++	if ( state->index < 0 ) {
++		state->index = 0;
++	}
++
+ 	/* Compute difference and new sample value */
+ 	step = step_table[state->index];
+ 	delta = step >> 3;
+@@ -275,12 +283,6 @@
+ 
+ 	/* Update index value */
+ 	state->index += index_table[nybble];
+-	if ( state->index > 88 ) {
+-		state->index = 88;
+-	} else
+-	if ( state->index < 0 ) {
+-		state->index = 0;
+-	}
+ 
+ 	/* Clamp output sample */
+ 	if ( state->sample > max_audioval ) {
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch
new file mode 100644
index 0000000..9fd53da
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7574.patch
@@ -0,0 +1,68 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560181859 25200
+#      Mon Jun 10 08:50:59 2019 -0700
+# Branch SDL-1.2
+# Node ID a6e3d2f5183e1cc300ad993e10e9ce077e13bd9c
+# Parent  388987dff7bf8f1e214e69c2e4f1aa31e06396b5
+CVE-2019-7574: Fix a buffer overread in IMA_ADPCM_decode
+If data chunk was shorter than expected based on a WAV format
+definition, IMA_ADPCM_decode() tried to read past the data chunk
+buffer. This patch fixes it.
+
+CVE-2019-7574
+https://bugzilla.libsdl.org/show_bug.cgi?id=4496
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7574
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r 388987dff7bf -r a6e3d2f5183e src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Sat Jun 08 18:02:09 2019 -0700
++++ b/src/audio/SDL_wave.c	Mon Jun 10 08:50:59 2019 -0700
+@@ -331,7 +331,7 @@
+ static int IMA_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
+ {
+ 	struct IMA_ADPCM_decodestate *state;
+-	Uint8 *freeable, *encoded, *decoded;
++	Uint8 *freeable, *encoded, *encoded_end, *decoded;
+ 	Sint32 encoded_len, samplesleft;
+ 	unsigned int c, channels;
+ 
+@@ -347,6 +347,7 @@
+ 	/* Allocate the proper sized output buffer */
+ 	encoded_len = *audio_len;
+ 	encoded = *audio_buf;
++	encoded_end = encoded + encoded_len;
+ 	freeable = *audio_buf;
+ 	*audio_len = (encoded_len/IMA_ADPCM_state.wavefmt.blockalign) * 
+ 				IMA_ADPCM_state.wSamplesPerBlock*
+@@ -362,6 +363,7 @@
+ 	while ( encoded_len >= IMA_ADPCM_state.wavefmt.blockalign ) {
+ 		/* Grab the initial information for this block */
+ 		for ( c=0; c<channels; ++c ) {
++			if (encoded + 4 > encoded_end) goto invalid_size;
+ 			/* Fill the state information for this block */
+ 			state[c].sample = ((encoded[1]<<8)|encoded[0]);
+ 			encoded += 2;
+@@ -384,6 +386,7 @@
+ 		samplesleft = (IMA_ADPCM_state.wSamplesPerBlock-1)*channels;
+ 		while ( samplesleft > 0 ) {
+ 			for ( c=0; c<channels; ++c ) {
++				if (encoded + 4 > encoded_end) goto invalid_size;
+ 				Fill_IMA_ADPCM_block(decoded, encoded,
+ 						c, channels, &state[c]);
+ 				encoded += 4;
+@@ -395,6 +398,10 @@
+ 	}
+ 	SDL_free(freeable);
+ 	return(0);
++invalid_size:
++	SDL_SetError("Unexpected chunk length for an IMA ADPCM decoder");
++	SDL_free(freeable);
++	return(-1);
+ }
+ 
+ SDL_AudioSpec * SDL_LoadWAV_RW (SDL_RWops *src, int freesrc,
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch
new file mode 100644
index 0000000..a3e8416
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7575.patch
@@ -0,0 +1,81 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560183905 25200
+#      Mon Jun 10 09:25:05 2019 -0700
+# Branch SDL-1.2
+# Node ID a936f9bd3e381d67d8ddee8b9243f85799ea4798
+# Parent  fcbecae427951bac1684baaba2ade68221315140
+CVE-2019-7575: Fix a buffer overwrite in MS_ADPCM_decode
+If a WAV format defines shorter audio stream and decoded MS ADPCM data chunk
+is longer, decoding continued past the output audio buffer.
+
+This fix is based on a patch from
+<https://bugzilla.libsdl.org/show_bug.cgi?id=4492>.
+
+https://bugzilla.libsdl.org/show_bug.cgi?id=4493
+CVE-2019-7575
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7575
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r fcbecae42795 -r a936f9bd3e38 src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Mon Jun 10 09:06:23 2019 -0700
++++ b/src/audio/SDL_wave.c	Mon Jun 10 09:25:05 2019 -0700
+@@ -122,7 +122,7 @@
+ static int MS_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
+ {
+ 	struct MS_ADPCM_decodestate *state[2];
+-	Uint8 *freeable, *encoded, *encoded_end, *decoded;
++	Uint8 *freeable, *encoded, *encoded_end, *decoded, *decoded_end;
+ 	Sint32 encoded_len, samplesleft;
+ 	Sint8 nybble, stereo;
+ 	Sint16 *coeff[2];
+@@ -142,6 +142,7 @@
+ 		return(-1);
+ 	}
+ 	decoded = *audio_buf;
++	decoded_end = decoded + *audio_len;
+ 
+ 	/* Get ready... Go! */
+ 	stereo = (MS_ADPCM_state.wavefmt.channels == 2);
+@@ -149,7 +150,7 @@
+ 	state[1] = &MS_ADPCM_state.state[stereo];
+ 	while ( encoded_len >= MS_ADPCM_state.wavefmt.blockalign ) {
+ 		/* Grab the initial information for this block */
+-		if (encoded + 7 + (stereo ? 7 : 0) > encoded_end) goto too_short;
++		if (encoded + 7 + (stereo ? 7 : 0) > encoded_end) goto invalid_size;
+ 		state[0]->hPredictor = *encoded++;
+ 		if ( stereo ) {
+ 			state[1]->hPredictor = *encoded++;
+@@ -179,6 +180,7 @@
+ 		coeff[1] = MS_ADPCM_state.aCoeff[state[1]->hPredictor];
+ 
+ 		/* Store the two initial samples we start with */
++		if (decoded + 4 + (stereo ? 4 : 0) > decoded_end) goto invalid_size;
+ 		decoded[0] = state[0]->iSamp2&0xFF;
+ 		decoded[1] = state[0]->iSamp2>>8;
+ 		decoded += 2;
+@@ -200,7 +202,8 @@
+ 		samplesleft = (MS_ADPCM_state.wSamplesPerBlock-2)*
+ 					MS_ADPCM_state.wavefmt.channels;
+ 		while ( samplesleft > 0 ) {
+-			if (encoded + 1 > encoded_end) goto too_short;
++			if (encoded + 1 > encoded_end) goto invalid_size;
++			if (decoded + 4 > decoded_end) goto invalid_size;
+ 
+ 			nybble = (*encoded)>>4;
+ 			new_sample = MS_ADPCM_nibble(state[0],nybble,coeff[0]);
+@@ -223,8 +226,8 @@
+ 	}
+ 	SDL_free(freeable);
+ 	return(0);
+-too_short:
+-	SDL_SetError("Too short chunk for a MS ADPCM decoder");
++invalid_size:
++	SDL_SetError("Unexpected chunk length for a MS ADPCM decoder");
+ 	SDL_free(freeable);
+ 	return(-1);
+ invalid_predictor:
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch
new file mode 100644
index 0000000..d9a5052
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7576.patch
@@ -0,0 +1,80 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560182783 25200
+#      Mon Jun 10 09:06:23 2019 -0700
+# Branch SDL-1.2
+# Node ID fcbecae427951bac1684baaba2ade68221315140
+# Parent  a8afedbcaea0e84921dc770195c4699bda3ccdc5
+CVE-2019-7573, CVE-2019-7576: Fix buffer overreads in InitMS_ADPCM
+If MS ADPCM format chunk was too short, InitMS_ADPCM() parsing it
+could read past the end of chunk data. This patch fixes it.
+
+CVE-2019-7573
+https://bugzilla.libsdl.org/show_bug.cgi?id=4491
+CVE-2019-7576
+https://bugzilla.libsdl.org/show_bug.cgi?id=4490
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7573
+CVE: CVE-2019-7576
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r a8afedbcaea0 -r fcbecae42795 src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Mon Jun 10 08:57:11 2019 -0700
++++ b/src/audio/SDL_wave.c	Mon Jun 10 09:06:23 2019 -0700
+@@ -44,12 +44,13 @@
+ 	struct MS_ADPCM_decodestate state[2];
+ } MS_ADPCM_state;
+ 
+-static int InitMS_ADPCM(WaveFMT *format)
++static int InitMS_ADPCM(WaveFMT *format, int length)
+ {
+-	Uint8 *rogue_feel;
++	Uint8 *rogue_feel, *rogue_feel_end;
+ 	int i;
+ 
+ 	/* Set the rogue pointer to the MS_ADPCM specific data */
++	if (length < sizeof(*format)) goto too_short;
+ 	MS_ADPCM_state.wavefmt.encoding = SDL_SwapLE16(format->encoding);
+ 	MS_ADPCM_state.wavefmt.channels = SDL_SwapLE16(format->channels);
+ 	MS_ADPCM_state.wavefmt.frequency = SDL_SwapLE32(format->frequency);
+@@ -58,9 +59,11 @@
+ 	MS_ADPCM_state.wavefmt.bitspersample =
+ 					 SDL_SwapLE16(format->bitspersample);
+ 	rogue_feel = (Uint8 *)format+sizeof(*format);
++	rogue_feel_end = (Uint8 *)format + length;
+ 	if ( sizeof(*format) == 16 ) {
+ 		rogue_feel += sizeof(Uint16);
+ 	}
++	if (rogue_feel + 4 > rogue_feel_end) goto too_short;
+ 	MS_ADPCM_state.wSamplesPerBlock = ((rogue_feel[1]<<8)|rogue_feel[0]);
+ 	rogue_feel += sizeof(Uint16);
+ 	MS_ADPCM_state.wNumCoef = ((rogue_feel[1]<<8)|rogue_feel[0]);
+@@ -70,12 +73,16 @@
+ 		return(-1);
+ 	}
+ 	for ( i=0; i<MS_ADPCM_state.wNumCoef; ++i ) {
++		if (rogue_feel + 4 > rogue_feel_end) goto too_short;
+ 		MS_ADPCM_state.aCoeff[i][0] = ((rogue_feel[1]<<8)|rogue_feel[0]);
+ 		rogue_feel += sizeof(Uint16);
+ 		MS_ADPCM_state.aCoeff[i][1] = ((rogue_feel[1]<<8)|rogue_feel[0]);
+ 		rogue_feel += sizeof(Uint16);
+ 	}
+ 	return(0);
++too_short:
++	SDL_SetError("Unexpected length of a chunk with a MS ADPCM format");
++	return(-1);
+ }
+ 
+ static Sint32 MS_ADPCM_nibble(struct MS_ADPCM_decodestate *state,
+@@ -495,7 +502,7 @@
+ 			break;
+ 		case MS_ADPCM_CODE:
+ 			/* Try to understand this */
+-			if ( InitMS_ADPCM(format) < 0 ) {
++			if ( InitMS_ADPCM(format, lenread) < 0 ) {
+ 				was_error = 1;
+ 				goto done;
+ 			}
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
new file mode 100644
index 0000000..92e40ae
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7577.patch
@@ -0,0 +1,123 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560182051 25200
+#      Mon Jun 10 08:54:11 2019 -0700
+# Branch SDL-1.2
+# Node ID 416136310b88cbeeff8773e573e90ac1e22b3526
+# Parent  a6e3d2f5183e1cc300ad993e10e9ce077e13bd9c
+CVE-2019-7577: Fix a buffer overread in MS_ADPCM_decode
+If RIFF/WAV data chunk length is shorter then expected for an audio
+format defined in preceeding RIFF/WAV format headers, a buffer
+overread can happen.
+
+This patch fixes it by checking a MS ADPCM data to be decoded are not
+past the initialized buffer.
+
+CVE-2019-7577
+Reproducer: https://bugzilla.libsdl.org/show_bug.cgi?id=4492
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560182069 25200
+#      Mon Jun 10 08:54:29 2019 -0700
+# Branch SDL-1.2
+# Node ID faf9abbcfb5fe0d0ca23c4bf0394aa226ceccf02
+# Parent  416136310b88cbeeff8773e573e90ac1e22b3526
+CVE-2019-7577: Fix a buffer overread in MS_ADPCM_nibble and MS_ADPCM_decode
+If a chunk of RIFF/WAV file with MS ADPCM encoding contains an invalid
+predictor (a valid predictor's value is between 0 and 6 inclusive),
+a buffer overread can happen when the predictor is used as an index
+into an array of MS ADPCM coefficients.
+
+The overead happens when indexing MS_ADPCM_state.aCoeff[] array in
+MS_ADPCM_decode() and later when dereferencing a coef pointer in
+MS_ADPCM_nibble().
+
+This patch fixes it by checking the MS ADPCM predictor values fit
+into the valid range.
+
+CVE-2019-7577
+Reproducer: https://bugzilla.libsdl.org/show_bug.cgi?id=4492
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7577
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r a6e3d2f5183e -r 416136310b88 src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Mon Jun 10 08:50:59 2019 -0700
++++ b/src/audio/SDL_wave.c	Mon Jun 10 08:54:11 2019 -0700
+@@ -115,7 +115,7 @@
+ static int MS_ADPCM_decode(Uint8 **audio_buf, Uint32 *audio_len)
+ {
+ 	struct MS_ADPCM_decodestate *state[2];
+-	Uint8 *freeable, *encoded, *decoded;
++	Uint8 *freeable, *encoded, *encoded_end, *decoded;
+ 	Sint32 encoded_len, samplesleft;
+ 	Sint8 nybble, stereo;
+ 	Sint16 *coeff[2];
+@@ -124,6 +124,7 @@
+ 	/* Allocate the proper sized output buffer */
+ 	encoded_len = *audio_len;
+ 	encoded = *audio_buf;
++	encoded_end = encoded + encoded_len;
+ 	freeable = *audio_buf;
+ 	*audio_len = (encoded_len/MS_ADPCM_state.wavefmt.blockalign) * 
+ 				MS_ADPCM_state.wSamplesPerBlock*
+@@ -141,6 +142,7 @@
+ 	state[1] = &MS_ADPCM_state.state[stereo];
+ 	while ( encoded_len >= MS_ADPCM_state.wavefmt.blockalign ) {
+ 		/* Grab the initial information for this block */
++		if (encoded + 7 + (stereo ? 7 : 0) > encoded_end) goto too_short;
+ 		state[0]->hPredictor = *encoded++;
+ 		if ( stereo ) {
+ 			state[1]->hPredictor = *encoded++;
+@@ -188,6 +190,8 @@
+ 		samplesleft = (MS_ADPCM_state.wSamplesPerBlock-2)*
+ 					MS_ADPCM_state.wavefmt.channels;
+ 		while ( samplesleft > 0 ) {
++			if (encoded + 1 > encoded_end) goto too_short;
++
+ 			nybble = (*encoded)>>4;
+ 			new_sample = MS_ADPCM_nibble(state[0],nybble,coeff[0]);
+ 			decoded[0] = new_sample&0xFF;
+@@ -209,6 +213,10 @@
+ 	}
+ 	SDL_free(freeable);
+ 	return(0);
++too_short:
++	SDL_SetError("Too short chunk for a MS ADPCM decoder");
++	SDL_free(freeable);
++	return(-1);
+ }
+ 
+ struct IMA_ADPCM_decodestate {
+
+
+diff -r 416136310b88 -r faf9abbcfb5f src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Mon Jun 10 08:54:11 2019 -0700
++++ b/src/audio/SDL_wave.c	Mon Jun 10 08:54:29 2019 -0700
+@@ -147,6 +147,9 @@
+ 		if ( stereo ) {
+ 			state[1]->hPredictor = *encoded++;
+ 		}
++		if (state[0]->hPredictor >= 7 || state[1]->hPredictor >= 7) {
++			goto invalid_predictor;
++		}
+ 		state[0]->iDelta = ((encoded[1]<<8)|encoded[0]);
+ 		encoded += sizeof(Sint16);
+ 		if ( stereo ) {
+@@ -217,6 +220,10 @@
+ 	SDL_SetError("Too short chunk for a MS ADPCM decoder");
+ 	SDL_free(freeable);
+ 	return(-1);
++invalid_predictor:
++	SDL_SetError("Invalid predictor value for a MS ADPCM decoder");
++	SDL_free(freeable);
++	return(-1);
+ }
+ 
+ struct IMA_ADPCM_decodestate {
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch
new file mode 100644
index 0000000..7028890
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7578.patch
@@ -0,0 +1,64 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560042129 25200
+#      Sat Jun 08 18:02:09 2019 -0700
+# Branch SDL-1.2
+# Node ID 388987dff7bf8f1e214e69c2e4f1aa31e06396b5
+# Parent  e52413f5258600878f9a10d2f92605a729aa8976
+CVE-2019-7578: Fix a buffer overread in InitIMA_ADPCM
+If IMA ADPCM format chunk was too short, InitIMA_ADPCM() parsing it
+could read past the end of chunk data. This patch fixes it.
+
+CVE-2019-7578
+https://bugzilla.libsdl.org/show_bug.cgi?id=4494
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7578
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r e52413f52586 -r 388987dff7bf src/audio/SDL_wave.c
+--- a/src/audio/SDL_wave.c	Sat Jun 08 17:57:43 2019 -0700
++++ b/src/audio/SDL_wave.c	Sat Jun 08 18:02:09 2019 -0700
+@@ -222,11 +222,12 @@
+ 	struct IMA_ADPCM_decodestate state[2];
+ } IMA_ADPCM_state;
+ 
+-static int InitIMA_ADPCM(WaveFMT *format)
++static int InitIMA_ADPCM(WaveFMT *format, int length)
+ {
+-	Uint8 *rogue_feel;
++	Uint8 *rogue_feel, *rogue_feel_end;
+ 
+ 	/* Set the rogue pointer to the IMA_ADPCM specific data */
++	if (length < sizeof(*format)) goto too_short;
+ 	IMA_ADPCM_state.wavefmt.encoding = SDL_SwapLE16(format->encoding);
+ 	IMA_ADPCM_state.wavefmt.channels = SDL_SwapLE16(format->channels);
+ 	IMA_ADPCM_state.wavefmt.frequency = SDL_SwapLE32(format->frequency);
+@@ -235,11 +236,16 @@
+ 	IMA_ADPCM_state.wavefmt.bitspersample =
+ 					 SDL_SwapLE16(format->bitspersample);
+ 	rogue_feel = (Uint8 *)format+sizeof(*format);
++	rogue_feel_end = (Uint8 *)format + length;
+ 	if ( sizeof(*format) == 16 ) {
+ 		rogue_feel += sizeof(Uint16);
+ 	}
++	if (rogue_feel + 2 > rogue_feel_end) goto too_short;
+ 	IMA_ADPCM_state.wSamplesPerBlock = ((rogue_feel[1]<<8)|rogue_feel[0]);
+ 	return(0);
++too_short:
++	SDL_SetError("Unexpected length of a chunk with an IMA ADPCM format");
++	return(-1);
+ }
+ 
+ static Sint32 IMA_ADPCM_nibble(struct IMA_ADPCM_decodestate *state,Uint8 nybble)
+@@ -471,7 +477,7 @@
+ 			break;
+ 		case IMA_ADPCM_CODE:
+ 			/* Try to understand this */
+-			if ( InitIMA_ADPCM(format) < 0 ) {
++			if ( InitIMA_ADPCM(format, lenread) < 0 ) {
+ 				was_error = 1;
+ 				goto done;
+ 			}
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch
new file mode 100644
index 0000000..78af1b0
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7635.patch
@@ -0,0 +1,63 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1560259692 25200
+#      Tue Jun 11 06:28:12 2019 -0700
+# Branch SDL-1.2
+# Node ID f1f5878be5dbf63c1161a8ee52b8a86ece30e552
+# Parent  a936f9bd3e381d67d8ddee8b9243f85799ea4798
+CVE-2019-7635: Reject BMP images with pixel colors out the palette
+If a 1-, 4-, or 8-bit per pixel BMP image declares less used colors
+than the palette offers an SDL_Surface with a palette of the indicated
+number of used colors is created. If some of the image's pixel
+refer to a color number higher then the maximal used colors, a subsequent
+bliting operation on the surface will look up a color past a blit map
+(that is based on the palette) memory. I.e. passing such SDL_Surface
+to e.g. an SDL_DisplayFormat() function will result in a buffer overread in
+a blit function.
+
+This patch fixes it by validing each pixel's color to be less than the
+maximal color number in the palette. A validation failure raises an
+error from a SDL_LoadBMP_RW() function.
+
+CVE-2019-7635
+https://bugzilla.libsdl.org/show_bug.cgi?id=4498
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7635
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r a936f9bd3e38 -r f1f5878be5db src/video/SDL_bmp.c
+--- a/src/video/SDL_bmp.c	Mon Jun 10 09:25:05 2019 -0700
++++ b/src/video/SDL_bmp.c	Tue Jun 11 06:28:12 2019 -0700
+@@ -308,6 +308,12 @@
+ 				}
+ 				*(bits+i) = (pixel>>shift);
+ 				pixel <<= ExpandBMP;
++				if ( bits[i] >= biClrUsed ) {
++					SDL_SetError(
++						"A BMP image contains a pixel with a color out of the palette");
++					was_error = SDL_TRUE;
++					goto done;
++				}
+ 			} }
+ 			break;
+ 
+@@ -318,6 +324,16 @@
+ 				was_error = SDL_TRUE;
+ 				goto done;
+ 			}
++			if ( 8 == biBitCount && palette && biClrUsed < (1 << biBitCount ) ) {
++				for ( i=0; i<surface->w; ++i ) {
++					if ( bits[i] >= biClrUsed ) {
++						SDL_SetError(
++							"A BMP image contains a pixel with a color out of the palette");
++						was_error = SDL_TRUE;
++						goto done;
++					}
++				}
++			}
+ #if SDL_BYTEORDER == SDL_BIG_ENDIAN
+ 			/* Byte-swap the pixels if needed. Note that the 24bpp
+ 			   case has already been taken care of above. */
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
new file mode 100644
index 0000000..c95338e
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
@@ -0,0 +1,192 @@
+# HG changeset patch
+# User Petr Písař <ppisar@redhat.com>
+# Date 1552788984 25200
+#      Sat Mar 16 19:16:24 2019 -0700
+# Branch SDL-1.2
+# Node ID 9b0e5c555c0f5ce6d2c3c19da6cc2c7fb5048bf2
+# Parent  4646533663ae1d80c2cc6b2d6dbfb37c62491c1e
+CVE-2019-7637: Fix in integer overflow in SDL_CalculatePitch
+If a too large width is passed to SDL_SetVideoMode() the width travels
+to SDL_CalculatePitch() where the width (e.g. 65535) is multiplied by
+BytesPerPixel (e.g. 4) and the result is stored into Uint16 pitch
+variable. During this arithmetics an integer overflow can happen (e.g.
+the value is clamped as 65532). As a result SDL_Surface with a pitch
+smaller than width * BytesPerPixel is created, too small pixel buffer
+is allocated and when the SDL_Surface is processed in SDL_FillRect()
+a buffer overflow occurs.
+
+This can be reproduced with "./graywin -width 21312312313123213213213"
+command.
+
+This patch fixes is by using a very careful arithmetics in
+SDL_CalculatePitch(). If an overflow is detected, an error is reported
+back as a special 0 value. We assume that 0-width surfaces do not
+occur in the wild. Since SDL_CalculatePitch() is a private function,
+we can change the semantics.
+
+CVE-2019-7637
+https://bugzilla.libsdl.org/show_bug.cgi?id=4497
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2019-7637
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/SDL_pixels.c
+--- a/src/video/SDL_pixels.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/SDL_pixels.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -286,26 +286,53 @@
+ 	}
+ }
+ /* 
+- * Calculate the pad-aligned scanline width of a surface
++ * Calculate the pad-aligned scanline width of a surface. Return 0 in case of
++ * an error.
+  */
+ Uint16 SDL_CalculatePitch(SDL_Surface *surface)
+ {
+-	Uint16 pitch;
++	unsigned int pitch = 0;
+ 
+ 	/* Surface should be 4-byte aligned for speed */
+-	pitch = surface->w*surface->format->BytesPerPixel;
++	/* The code tries to prevent from an Uint16 overflow. */;
++	for (Uint8 byte = surface->format->BytesPerPixel; byte; byte--) {
++		pitch += (unsigned int)surface->w;
++		if (pitch < surface->w) {
++			SDL_SetError("A scanline is too wide");
++			return(0);
++		}
++	}
+ 	switch (surface->format->BitsPerPixel) {
+ 		case 1:
+-			pitch = (pitch+7)/8;
++			if (pitch % 8) {
++				pitch = pitch / 8 + 1;
++			} else {
++				pitch = pitch / 8;
++			}
+ 			break;
+ 		case 4:
+-			pitch = (pitch+1)/2;
++			if (pitch % 2) {
++				pitch = pitch / 2 + 1;
++			} else {
++				pitch = pitch / 2;
++			}
+ 			break;
+ 		default:
+ 			break;
+ 	}
+-	pitch = (pitch + 3) & ~3;	/* 4-byte aligning */
+-	return(pitch);
++	/* 4-byte aligning */
++	if (pitch & 3) {
++		if (pitch + 3 < pitch) {
++			SDL_SetError("A scanline is too wide");
++			return(0);
++		}
++		pitch = (pitch + 3) & ~3;
++	}
++	if (pitch > 0xFFFF) {
++		SDL_SetError("A scanline is too wide");
++		return(0);
++	}
++	return((Uint16)pitch);
+ }
+ /*
+  * Match an RGB value to a particular palette index
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/gapi/SDL_gapivideo.c
+--- a/src/video/gapi/SDL_gapivideo.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/gapi/SDL_gapivideo.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -733,6 +733,9 @@
+ 	video->w = gapi->w = width;
+ 	video->h = gapi->h = height;
+ 	video->pitch = SDL_CalculatePitch(video); 
++	if (!current->pitch) {
++		return(NULL);
++	}
+ 
+ 	/* Small fix for WinCE/Win32 - when activating window
+ 	   SDL_VideoSurface is equal to zero, so activating code
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/nanox/SDL_nxvideo.c
+--- a/src/video/nanox/SDL_nxvideo.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/nanox/SDL_nxvideo.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -378,6 +378,10 @@
+         current -> w = width ;
+         current -> h = height ;
+         current -> pitch = SDL_CalculatePitch (current) ;
++        if (!current->pitch) {
++            current = NULL;
++            goto done;
++        }
+         NX_ResizeImage (this, current, flags) ;
+     }
+ 
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/ps2gs/SDL_gsvideo.c
+--- a/src/video/ps2gs/SDL_gsvideo.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/ps2gs/SDL_gsvideo.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -479,6 +479,9 @@
+ 	current->w = width;
+ 	current->h = height;
+ 	current->pitch = SDL_CalculatePitch(current);
++	if (!current->pitch) {
++		return(NULL);
++	}
+ 
+ 	/* Memory map the DMA area for block memory transfer */
+ 	if ( ! mapped_mem ) {
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/ps3/SDL_ps3video.c
+--- a/src/video/ps3/SDL_ps3video.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/ps3/SDL_ps3video.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -339,6 +339,9 @@
+ 	current->w = width;
+ 	current->h = height;
+ 	current->pitch = SDL_CalculatePitch(current);
++	if (!current->pitch) {
++		return(NULL);
++	}
+ 
+ 	/* Alloc aligned mem for current->pixels */
+ 	s_pixels = memalign(16, current->h * current->pitch);
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/windib/SDL_dibvideo.c
+--- a/src/video/windib/SDL_dibvideo.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/windib/SDL_dibvideo.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -675,6 +675,9 @@
+ 	video->w = width;
+ 	video->h = height;
+ 	video->pitch = SDL_CalculatePitch(video);
++	if (!current->pitch) {
++		return(NULL);
++	}
+ 
+ 	/* Small fix for WinCE/Win32 - when activating window
+ 	   SDL_VideoSurface is equal to zero, so activating code
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/windx5/SDL_dx5video.c
+--- a/src/video/windx5/SDL_dx5video.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/windx5/SDL_dx5video.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -1127,6 +1127,9 @@
+ 		video->w = width;
+ 		video->h = height;
+ 		video->pitch = SDL_CalculatePitch(video);
++		if (!current->pitch) {
++			return(NULL);
++		}
+ 
+ #ifndef NO_CHANGEDISPLAYSETTINGS
+ 		/* Set fullscreen mode if appropriate.
+diff -r 4646533663ae -r 9b0e5c555c0f src/video/x11/SDL_x11video.c
+--- a/src/video/x11/SDL_x11video.c	Sat Mar 16 18:35:33 2019 -0700
++++ b/src/video/x11/SDL_x11video.c	Sat Mar 16 19:16:24 2019 -0700
+@@ -1225,6 +1225,10 @@
+ 		current->w = width;
+ 		current->h = height;
+ 		current->pitch = SDL_CalculatePitch(current);
++		if (!current->pitch) {
++			current = NULL;
++			goto done;
++		}
+ 		if (X11_ResizeImage(this, current, flags) < 0) {
+ 			current = NULL;
+ 			goto done;
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch
new file mode 100644
index 0000000..dab9aae
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7638.patch
@@ -0,0 +1,38 @@
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1550504903 28800
+#      Mon Feb 18 07:48:23 2019 -0800
+# Branch SDL-1.2
+# Node ID 19d8c3b9c25143f71a34ff40ce1df91b4b3e3b78
+# Parent  8586f153eedec4c4e07066d6248ebdf67f10a229
+Fixed bug 4500 - Heap-Buffer Overflow in Map1toN pertaining to SDL_pixels.c
+
+Petr Pisar
+
+The reproducer has these data in BITMAPINFOHEADER:
+
+biSize = 40
+biBitCount = 8
+biClrUsed = 131075
+
+SDL_LoadBMP_RW() function passes biBitCount as a color depth to SDL_CreateRGBSurface(), thus 256-color pallete is allocated. But then biClrUsed colors are read from a file and stored into the palette. SDL_LoadBMP_RW should report an error if biClrUsed is greater than 2^biBitCount.
+
+CVE: CVE-2019-7638
+CVE: CVE-2019-7636
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+diff -r 8586f153eede -r 19d8c3b9c251 src/video/SDL_bmp.c
+--- a/src/video/SDL_bmp.c	Sun Jan 13 15:27:50 2019 +0100
++++ b/src/video/SDL_bmp.c	Mon Feb 18 07:48:23 2019 -0800
+@@ -233,6 +233,10 @@
+ 	if ( palette ) {
+ 		if ( biClrUsed == 0 ) {
+ 			biClrUsed = 1 << biBitCount;
++		} else if ( biClrUsed > (1 << biBitCount) ) {
++			SDL_SetError("BMP file has an invalid number of colors");
++			was_error = SDL_TRUE;
++			goto done;
+ 		}
+ 		if ( biSize == 12 ) {
+ 			for ( i = 0; i < (int)biClrUsed; ++i ) {
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 3680ea9..d61ee0f 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -18,6 +18,15 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://libsdl-1.2.15-xdata32.patch \
            file://pkgconfig.patch \
            file://0001-build-Pass-tag-CC-explictly-when-using-libtool.patch \
+           file://CVE-2019-7577.patch \
+           file://CVE-2019-7574.patch \
+           file://CVE-2019-7572.patch \
+           file://CVE-2019-7578.patch \
+           file://CVE-2019-7575.patch \
+           file://CVE-2019-7635.patch \
+           file://CVE-2019-7637.patch \
+           file://CVE-2019-7638.patch \
+           file://CVE-2019-7576.patch \
           "
 
 UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.7.4


