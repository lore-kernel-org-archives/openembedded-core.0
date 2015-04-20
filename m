Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBDF738F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 19:45:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2015 12:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="558983478"
Received: from alt-mobl.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.26.110])
	by orsmga003.jf.intel.com with ESMTP; 20 Apr 2015 12:45:46 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 22:45:43 +0300
Message-Id: <1429559143-2827-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] alsa-lib: 1.0.28 -> 1.0.29
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
X-List-Received-Date: Mon, 20 Apr 2015 19:45:52 -0000

Release notes:
http://alsa-project.org/main/index.php/Changes_v1.0.28_v1.0.29

Dropped the backported patches.

Dropped also fix-tstamp-declaration.patch. It's unclear whether the
ancient patch is needed by anyone any more. The original commit
message[1] wasn't very clear on what specific conditions triggered the
build failure that the patch fixes, so it's hard to try to reproduce
the failure.

[1] http://cgit.openembedded.org/openembedded/commit/?id=f61f3efe2389249c001107ccd55dac39e79ef2a1

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 ...al.h-include-time.h-to-enable-CLOCK_MONOT.patch |  32 --
 ...1-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch |  34 --
 ...se-get32-for-multi-source-route-calculati.patch | 345 ---------------------
 .../alsa/alsa-lib/fix-tstamp-declaration.patch     |  21 --
 meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb    |  54 ----
 meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb    |  50 +++
 6 files changed, 50 insertions(+), 486 deletions(-)
 delete mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch
 delete mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch
 delete mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/fix-tstamp-declaration.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch
deleted file mode 100755
index 06cdcb9..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f6b879e7cc87d83343f5004369146881d1d1e335 Mon Sep 17 00:00:00 2001
-From: Shengjiu Wang <shengjiu.wang@freescale.com>
-Date: Wed, 23 Jul 2014 15:09:58 +0800
-Subject: [PATCH] pcm: pcm_local.h: include <time.h> to enable CLOCK_MONOTONIC
-
-CLOCK_MONITONIC is defined in <bits/time.h>, add <time.h> before <sys/time.h>.
-
-Commit f6b879e7cc87d83343f5004369146881d1d1e335 in master branch
-
-Upstream Status: Backported
-
-Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- src/pcm/pcm_local.h |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
-index 2206afe..80bbe59 100644
---- a/src/pcm/pcm_local.h
-+++ b/src/pcm/pcm_local.h
-@@ -24,6 +24,7 @@
- #include <stdlib.h>
- #include <limits.h>
- #include <sys/uio.h>
-+#include <time.h>
- #include <sys/time.h>
- 
- #define _snd_mask sndrv_mask
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch
deleted file mode 100755
index 8be3d75..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 035f196bcdc1e9903ed52ad1859dc23d3aa74e72 Mon Sep 17 00:00:00 2001
-From: Shengjiu Wang <shengjiu.wang@freescale.com>
-Date: Mon, 14 Jul 2014 16:55:48 +0800
-Subject: [PATCH] pcm: rate: fix hw_ptr exceed the boundary
-
-For long time test case, the hw_ptr will exceed the boundary, then cause
-the avail size wrong.
-
-Commit is 035f196bcdc1e9903ed52ad1859dc23d3aa74e72 in master branch
-
-Upstream Status: Backported
-
-Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- src/pcm/pcm_rate.c |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
-index 7f667d4..2563d82 100644
---- a/src/pcm/pcm_rate.c
-+++ b/src/pcm/pcm_rate.c
-@@ -574,6 +574,8 @@ static inline void snd_pcm_rate_sync_hwptr(snd_pcm_t *pcm)
- 	rate->hw_ptr =
- 		(slave_hw_ptr / rate->gen.slave->period_size) * pcm->period_size +
- 		rate->ops.input_frames(rate->obj, slave_hw_ptr % rate->gen.slave->period_size);
-+
-+	rate->hw_ptr %= pcm->boundary;
- }
- 
- static int snd_pcm_rate_hwsync(snd_pcm_t *pcm)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch
deleted file mode 100755
index 89363d5..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch
+++ /dev/null
@@ -1,345 +0,0 @@
-From 3f179d6cc7c222dfa42fe094b7ef1e21685a05bc Mon Sep 17 00:00:00 2001
-From: Takashi Iwai <tiwai@suse.de>
-Date: Tue, 22 Jul 2014 11:55:40 +0200
-Subject: [PATCH] pcm: route: Use get32 for multi-source route calculation
-
-The PCM route plugin can assign the destination value from average of
-multiple sources with attenuation. This requires the read of each
-channel value, sums and writes the resultant value in the requested
-format.
-
-Currently, get_labels is used for reading source values while
-put32_labels is used for writing the dest value.  This is, however,
-a buggy implementation; get_labels gives the value as is only with
-endianness and signedness conversions, but put32_labels assumes that
-the value is normalized to 32bit int and it shifts down to the dest
-format.  In addition, the current code lacks get_labels entries for
-the 24bit formats, as Shengjiu Wang spotted out.
-
-For fixing these bugs, this patch replaces the read with
-get32_labels and use always 64bit int for sum.  This simplifies the
-code a lot and drops many lines.
-
-Commit fd84adc63e307572d05274be44c782a787087cda in master branch
-
-Upstream Status: Backported
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- src/pcm/pcm_route.c  |  128 +++++++++-----------------------------------------
- src/pcm/plugin_ops.h |   81 --------------------------------
- 2 files changed, 23 insertions(+), 186 deletions(-)
-
-diff --git a/src/pcm/pcm_route.c b/src/pcm/pcm_route.c
-index 2beedf6..1ed9c5f 100644
---- a/src/pcm/pcm_route.c
-+++ b/src/pcm/pcm_route.c
-@@ -60,7 +60,7 @@ typedef struct {
- typedef struct snd_pcm_route_ttable_dst snd_pcm_route_ttable_dst_t;
- 
- typedef struct {
--	enum {UINT32=0, UINT64=1, FLOAT=2} sum_idx;
-+	enum {UINT64, FLOAT} sum_idx;
- 	unsigned int get_idx;
- 	unsigned int put_idx;
- 	unsigned int conv_idx;
-@@ -232,55 +232,34 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
- 					const snd_pcm_route_ttable_dst_t* ttable,
- 					const snd_pcm_route_params_t *params)
- {
--#define GETS_LABELS
-+#define GET32_LABELS
- #define PUT32_LABELS
- #include "plugin_ops.h"
--#undef GETS_LABELS
-+#undef GET32_LABELS
- #undef PUT32_LABELS
--	static void *const zero_labels[3] = {
--		&&zero_int32, &&zero_int64,
-+	static void *const zero_labels[2] = {
-+		&&zero_int64,
- #if SND_PCM_PLUGIN_ROUTE_FLOAT
- 		&&zero_float
- #endif
- 	};
- 	/* sum_type att */
--	static void *const add_labels[3 * 2] = {
--		&&add_int32_noatt, &&add_int32_att,
-+	static void *const add_labels[2 * 2] = {
- 		&&add_int64_noatt, &&add_int64_att,
- #if SND_PCM_PLUGIN_ROUTE_FLOAT
- 		&&add_float_noatt, &&add_float_att
- #endif
- 	};
--	/* sum_type att shift */
--	static void *const norm_labels[3 * 2 * 4] = {
--		0,
--		&&norm_int32_8_noatt,
--		&&norm_int32_16_noatt,
--		&&norm_int32_24_noatt,
--		0,
--		&&norm_int32_8_att,
--		&&norm_int32_16_att,
--		&&norm_int32_24_att,
--		&&norm_int64_0_noatt,
--		&&norm_int64_8_noatt,
--		&&norm_int64_16_noatt,
--		&&norm_int64_24_noatt,
--		&&norm_int64_0_att,
--		&&norm_int64_8_att,
--		&&norm_int64_16_att,
--		&&norm_int64_24_att,
-+	/* sum_type att */
-+	static void *const norm_labels[2 * 2] = {
-+		&&norm_int64_noatt,
-+		&&norm_int64_att,
- #if SND_PCM_PLUGIN_ROUTE_FLOAT
--		&&norm_float_0,
--		&&norm_float_8,
--		&&norm_float_16,
--		&&norm_float_24,
--		&&norm_float_0,
--		&&norm_float_8,
--		&&norm_float_16,
--		&&norm_float_24,
-+		&&norm_float,
-+		&&norm_float,
- #endif
- 	};
--	void *zero, *get, *add, *norm, *put32;
-+	void *zero, *get32, *add, *norm, *put32;
- 	int nsrcs = ttable->nsrcs;
- 	char *dst;
- 	int dst_step;
-@@ -322,9 +301,9 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
- 	}
- 
- 	zero = zero_labels[params->sum_idx];
--	get = gets_labels[params->get_idx];
-+	get32 = get32_labels[params->get_idx];
- 	add = add_labels[params->sum_idx * 2 + ttable->att];
--	norm = norm_labels[params->sum_idx * 8 + ttable->att * 4 + 4 - params->src_size];
-+	norm = norm_labels[params->sum_idx * 2 + ttable->att];
- 	put32 = put32_labels[params->put_idx];
- 	dst = snd_pcm_channel_area_addr(dst_area, dst_offset);
- 	dst_step = snd_pcm_channel_area_step(dst_area);
-@@ -335,9 +314,6 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
- 
- 		/* Zero sum */
- 		goto *zero;
--	zero_int32:
--		sum.as_sint32 = 0;
--		goto zero_end;
- 	zero_int64: 
- 		sum.as_sint64 = 0;
- 		goto zero_end;
-@@ -351,21 +327,14 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
- 			const char *src = srcs[srcidx];
- 			
- 			/* Get sample */
--			goto *get;
--#define GETS_END after_get
-+			goto *get32;
-+#define GET32_END after_get
- #include "plugin_ops.h"
--#undef GETS_END
-+#undef GET32_END
- 		after_get:
- 
- 			/* Sum */
- 			goto *add;
--		add_int32_att:
--			sum.as_sint32 += sample * ttp->as_int;
--			goto after_sum;
--		add_int32_noatt:
--			if (ttp->as_int)
--				sum.as_sint32 += sample;
--			goto after_sum;
- 		add_int64_att:
- 			sum.as_sint64 += (int64_t) sample * ttp->as_int;
- 			goto after_sum;
-@@ -389,48 +358,10 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
- 		
- 		/* Normalization */
- 		goto *norm;
--	norm_int32_8_att:
--		sum.as_sint64 = sum.as_sint32;
--	norm_int64_8_att:
--		sum.as_sint64 <<= 8;
--	norm_int64_0_att:
--		div(sum.as_sint64);
--		goto norm_int;
--
--	norm_int32_16_att:
--		sum.as_sint64 = sum.as_sint32;
--	norm_int64_16_att:
--		sum.as_sint64 <<= 16;
-+	norm_int64_att:
- 		div(sum.as_sint64);
--		goto norm_int;
--
--	norm_int32_24_att:
--		sum.as_sint64 = sum.as_sint32;
--	norm_int64_24_att:
--		sum.as_sint64 <<= 24;
--		div(sum.as_sint64);
--		goto norm_int;
--
--	norm_int32_8_noatt:
--		sum.as_sint64 = sum.as_sint32;
--	norm_int64_8_noatt:
--		sum.as_sint64 <<= 8;
--		goto norm_int;
--
--	norm_int32_16_noatt:
--		sum.as_sint64 = sum.as_sint32;
--	norm_int64_16_noatt:
--		sum.as_sint64 <<= 16;
--		goto norm_int;
--
--	norm_int32_24_noatt:
--		sum.as_sint64 = sum.as_sint32;
--	norm_int64_24_noatt:
--		sum.as_sint64 <<= 24;
--		goto norm_int;
--
--	norm_int64_0_noatt:
--	norm_int:
-+		/* fallthru */
-+	norm_int64_noatt:
- 		if (sum.as_sint64 > (int64_t)0x7fffffff)
- 			sample = 0x7fffffff;	/* maximum positive value */
- 		else if (sum.as_sint64 < -(int64_t)0x80000000)
-@@ -440,16 +371,6 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
- 		goto after_norm;
- 
- #if SND_PCM_PLUGIN_ROUTE_FLOAT
--	norm_float_8:
--		sum.as_float *= 1 << 8;
--		goto norm_float;
--	norm_float_16:
--		sum.as_float *= 1 << 16;
--		goto norm_float;
--	norm_float_24:
--		sum.as_float *= 1 << 24;
--		goto norm_float;
--	norm_float_0:
- 	norm_float:
- 		sum.as_float = rint(sum.as_float);
- 		if (sum.as_float > (int64_t)0x7fffffff)
-@@ -644,7 +565,7 @@ static int snd_pcm_route_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
- 		return err;
- 	route->params.use_getput = snd_pcm_format_physical_width(src_format) == 24 ||
- 		snd_pcm_format_physical_width(dst_format) == 24;
--	route->params.get_idx = snd_pcm_linear_get_index(src_format, SND_PCM_FORMAT_S16);
-+	route->params.get_idx = snd_pcm_linear_get32_index(src_format, SND_PCM_FORMAT_S32);
- 	route->params.put_idx = snd_pcm_linear_put32_index(SND_PCM_FORMAT_S32, dst_format);
- 	route->params.conv_idx = snd_pcm_linear_convert_index(src_format, dst_format);
- 	route->params.src_size = snd_pcm_format_width(src_format) / 8;
-@@ -652,10 +573,7 @@ static int snd_pcm_route_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
- #if SND_PCM_PLUGIN_ROUTE_FLOAT
- 	route->params.sum_idx = FLOAT;
- #else
--	if (snd_pcm_format_width(src_format) == 32)
--		route->params.sum_idx = UINT64;
--	else
--		route->params.sum_idx = UINT32;
-+	route->params.sum_idx = UINT64;
- #endif
- 	return 0;
- }
-diff --git a/src/pcm/plugin_ops.h b/src/pcm/plugin_ops.h
-index 21535c9..eb8c2c4 100644
---- a/src/pcm/plugin_ops.h
-+++ b/src/pcm/plugin_ops.h
-@@ -668,87 +668,6 @@ getu_1234_C321: sample = bswap_32(as_u32c(src) ^ 0x80); goto GETU_END;
- }
- #endif
- 
--#ifdef GETS_LABELS
--/* width endswap sign_toggle */
--static void *const gets_labels[4 * 2 * 2] = {
--	&&gets_1_1,		/*  8h ->  8h */
--	&&gets_1_9,		/*  8h ^>  8h */
--	&&gets_1_1,		/*  8s ->  8h */
--	&&gets_1_9,		/*  8s ^>  8h */
--	&&gets_12_12,		/* 16h -> 16h */
--	&&gets_12_92,		/* 16h ^> 16h */
--	&&gets_12_21,		/* 16s -> 16h */
--	&&gets_12_A1,		/* 16s ^> 16h */
--	&&gets_0123_0123,	/* 24h -> 24h */
--	&&gets_0123_0923,	/* 24h ^> 24h */
--	&&gets_1230_0321,	/* 24s -> 24h */
--	&&gets_1230_0B21,	/* 24s ^> 24h */
--	&&gets_1234_1234,	/* 32h -> 32h */
--	&&gets_1234_9234,	/* 32h ^> 32h */
--	&&gets_1234_4321,	/* 32s -> 32h */
--	&&gets_1234_C321,	/* 32s ^> 32h */
--};
--#endif
--
--#ifdef GETS_END
--while (0) {
--gets_1_1: sample = as_s8c(src); goto GETS_END;
--gets_1_9: sample = (int8_t)(as_s8c(src) ^ 0x80); goto GETS_END;
--gets_12_12: sample = as_s16c(src); goto GETS_END;
--gets_12_92: sample = (int16_t)(as_s16c(src) ^ 0x8000); goto GETS_END;
--gets_12_21: sample = (int16_t)bswap_16(as_s16c(src)); goto GETS_END;
--gets_12_A1: sample = (int16_t)bswap_16(as_s16c(src) ^ 0x80); goto GETS_END;
--gets_0123_0123: sample = sx24((int32_t)(as_s32c(src) << 8) >> 8); goto GETS_END;
--gets_0123_0923: sample = sx24((int32_t)((as_s32c(src) ^ 0x800000) << 8) >> 8); goto GETS_END;
--gets_1230_0321: sample = sx24((int32_t)(bswap_32(as_s32c(src)) << 8) >> 8); goto GETS_END;
--gets_1230_0B21: sample = sx24((int32_t)(bswap_32(as_s32c(src) ^ 0x8000) << 8) >> 8); goto GETS_END;
--gets_1234_1234: sample = as_s32c(src); goto GETS_END;
--gets_1234_9234: sample = (int32_t)(as_s32c(src) ^ 0x80000000); goto GETS_END;
--gets_1234_4321: sample = (int32_t)bswap_32(as_s32c(src)); goto GETS_END;
--gets_1234_C321: sample = (int32_t)bswap_32(as_s32c(src) ^ 0x80); goto GETS_END;
--}
--#endif
--
--#ifdef PUT_LABELS
--/* width endswap sign_toggle */
--static void *const put_labels[4 * 2 * 2] = {
--	&&put_1_1,		/*  8h ->  8h */
--	&&put_1_9,		/*  8h ^>  8h */
--	&&put_1_1,		/*  8h ->  8s */
--	&&put_1_9,		/*  8h ^>  8s */
--	&&put_12_12,		/* 16h -> 16h */
--	&&put_12_92,		/* 16h ^> 16h */
--	&&put_12_21,		/* 16h -> 16s */
--	&&put_12_29,		/* 16h ^> 16s */
--	&&put_0123_0123,	/* 24h -> 24h */
--	&&put_0123_0923,	/* 24h ^> 24h */
--	&&put_0123_3210,	/* 24h -> 24s */
--	&&put_0123_3290,	/* 24h ^> 24s */
--	&&put_1234_1234,	/* 32h -> 32h */
--	&&put_1234_9234,	/* 32h ^> 32h */
--	&&put_1234_4321,	/* 32h -> 32s */
--	&&put_1234_4329,	/* 32h ^> 32s */
--};
--#endif
--
--#ifdef PUT_END
--put_1_1: as_s8(dst) = sample; goto PUT_END;
--put_1_9: as_u8(dst) = sample ^ 0x80; goto PUT_END;
--put_12_12: as_s16(dst) = sample; goto PUT_END;
--put_12_92: as_u16(dst) = sample ^ 0x8000; goto PUT_END;
--put_12_21: as_s16(dst) = bswap_16(sample); goto PUT_END;
--put_12_29: as_u16(dst) = bswap_16(sample) ^ 0x80; goto PUT_END;
--/* this always writes the unused byte in 24-bit formats as 0x00 */
--put_0123_0123: as_s32(dst) = sx24(sample & 0x00ffffff); goto PUT_END;
--put_0123_0923: as_u32(dst) = sx24((sample & 0x00ffffff) ^ 0x800000); goto PUT_END;
--put_0123_3210: as_s32(dst) = sx24s(bswap_32(sample) & 0xffffff00); goto PUT_END;
--put_0123_3290: as_u32(dst) = sx24s((bswap_32(sample) & 0xffffff00) ^ 0x8000); goto PUT_END;
--put_1234_1234: as_s32(dst) = sample; goto PUT_END;
--put_1234_9234: as_u32(dst) = sample ^ 0x80000000; goto PUT_END;
--put_1234_4321: as_s32(dst) = bswap_32(sample); goto PUT_END;
--put_1234_4329: as_u32(dst) = bswap_32(sample) ^ 0x80; goto PUT_END;
--#endif
--
- #ifdef PUT32F_LABELS
- /* type (0 = float, 1 = float64), endswap */
- static void *const put32float_labels[2 * 2] = {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/fix-tstamp-declaration.patch b/meta/recipes-multimedia/alsa/alsa-lib/fix-tstamp-declaration.patch
deleted file mode 100644
index 32b84b7..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/fix-tstamp-declaration.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-# Author: Michael Lauer <mickey@vanille-media.de>
-# Date:   Thu Jan 18 00:27:21 2007 +0000
-# alsa-lib: fix "error: field 'tstamp' has incomplete type" when including alsa headers with strict compilation options
-#
-# Acquired from OpenEmbedded
-
-Upstream-Status: Pending
-
-Index: alsa-lib-1.0.13/include/global.h
-===================================================================
---- alsa-lib-1.0.13.orig/include/global.h
-+++ alsa-lib-1.0.13/include/global.h
-@@ -29,6 +29,8 @@
- #define __ALSA_GLOBAL_H_
- 
- /* for timeval and timespec */
-+#define __need_timeval
-+#define __need_timespec
- #include <time.h>
- 
- #ifdef __cplusplus
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
deleted file mode 100644
index 9a4aab4..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.28.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-SUMMARY = "ALSA sound library"
-HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
-SECTION = "libs/multimedia"
-LICENSE = "LGPLv2.1 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# configure.in sets -D__arm__ on the command line for any arm system
-# (not just those with the ARM instruction set), this should be removed,
-# (or replaced by a permitted #define).
-#FIXME: remove the following
-ARM_INSTRUCTION_SET = "arm"
-
-SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
-           file://Check-if-wordexp-function-is-supported.patch \
-           file://fix-tstamp-declaration.patch \
-           file://0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch \
-           file://0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch \
-           file://0001-pcm-pcm_local.h-include-time.h-to-enable-CLOCK_MONOT.patch \
-"
-SRC_URI[md5sum] = "c9e21b88a2b3e6e12ea7ba0f3b271fc3"
-SRC_URI[sha256sum] = "3c074b85dde1b30e78ef4995579765833e5b693fbbd8f834c335e080cb734a6d"
-
-inherit autotools pkgconfig
-
-require alsa-fpu.inc
-EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
-
-EXTRA_OECONF = "--disable-python"
-
-EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
-
-PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
-FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
-FILES_${PN}-dbg += "${libdir}/${BPN}/smixer/.debug"
-FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
-FILES_libasound = "${libdir}/libasound.so.*"
-FILES_alsa-server = "${bindir}/*"
-FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-conf-base = "\
-${datadir}/alsa/alsa.conf \
-${datadir}/alsa/cards/aliases.conf \
-${datadir}/alsa/pcm/default.conf \
-${datadir}/alsa/pcm/dmix.conf \
-${datadir}/alsa/pcm/dsnoop.conf"
-
-RDEPENDS_libasound = "alsa-conf-base alsa-conf"
-# upgrade path
-RPROVIDES_${PN}-dev = "alsa-dev"
-RREPLACES_${PN}-dev = "alsa-dev"
-RCONFLICTS_${PN}-dev = "alsa-dev"
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
new file mode 100644
index 0000000..fc6ba69
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
@@ -0,0 +1,50 @@
+SUMMARY = "ALSA sound library"
+HOMEPAGE = "http://www.alsa-project.org"
+BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# configure.in sets -D__arm__ on the command line for any arm system
+# (not just those with the ARM instruction set), this should be removed,
+# (or replaced by a permitted #define).
+#FIXME: remove the following
+ARM_INSTRUCTION_SET = "arm"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
+           file://Check-if-wordexp-function-is-supported.patch \
+"
+SRC_URI[md5sum] = "de67e0eca72474d6b1121037dafe1024"
+SRC_URI[sha256sum] = "73043c35eb9636be0f4af6a240235c213f12a25feb1f04aeeac8cb7e30fcbdd0"
+
+inherit autotools pkgconfig
+
+require alsa-fpu.inc
+EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
+
+EXTRA_OECONF = "--disable-python"
+
+EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
+
+PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
+FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
+FILES_${PN}-dbg += "${libdir}/${BPN}/smixer/.debug"
+FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
+FILES_libasound = "${libdir}/libasound.so.*"
+FILES_alsa-server = "${bindir}/*"
+FILES_alsa-conf = "${datadir}/alsa/"
+FILES_alsa-conf-base = "\
+${datadir}/alsa/alsa.conf \
+${datadir}/alsa/cards/aliases.conf \
+${datadir}/alsa/pcm/default.conf \
+${datadir}/alsa/pcm/dmix.conf \
+${datadir}/alsa/pcm/dsnoop.conf"
+
+RDEPENDS_libasound = "alsa-conf-base alsa-conf"
+# upgrade path
+RPROVIDES_${PN}-dev = "alsa-dev"
+RREPLACES_${PN}-dev = "alsa-dev"
+RCONFLICTS_${PN}-dev = "alsa-dev"
-- 
1.9.3


