Return-Path: <B50113@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0183.outbound.protection.outlook.com [207.46.163.183])
	by mail.openembedded.org (Postfix) with ESMTP id A477865D5F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 03:21:06 +0000 (UTC)
Received: from BY2PR03CA041.namprd03.prod.outlook.com (10.141.249.14) by
	BL2PR03MB276.namprd03.prod.outlook.com (10.255.231.25) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Mon, 4 Aug 2014 03:21:05 +0000
Received: from BL2FFO11FD038.protection.gbl (2a01:111:f400:7c09::122) by
	BY2PR03CA041.outlook.office365.com (2a01:111:e400:2c5d::14) with
	Microsoft
	SMTP Server (TLS) id 15.0.995.14 via Frontend Transport; Mon, 4 Aug 2014
	03:21:05 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD038.mail.protection.outlook.com (10.173.161.134) with
	Microsoft
	SMTP Server (TLS) id 15.0.990.10 via Frontend Transport; Mon, 4 Aug 2014
	03:21:05 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s743Kvms007250;
	Sun, 3 Aug 2014 20:21:02 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Aug 2014 11:21:12 +0800
Message-ID: <1407122473-16439-3-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407122473-16439-1-git-send-email-b50113@freescale.com>
References: <1407122473-16439-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(104016003)(6806004)(44976005)(31966008)(68736004)(88136002)(2351001)(46102001)(99396002)(33646002)(50986999)(97736001)(69596002)(81542001)(95666004)(85306004)(74662001)(105606002)(80022001)(106466001)(229853001)(62966002)(89996001)(21056001)(4396001)(84676001)(92726001)(81342001)(50466002)(102836001)(79102001)(83322001)(19580405001)(81156004)(36756003)(20776003)(85852003)(76176999)(575784001)(48376002)(87286001)(107046002)(86362001)(87936001)(110136001)(50226001)(93916002)(64706001)(47776003)(74502001)(77982001)(83072002)(92566001)(77156001)(76482001)(26826002)(104166001)(19580395003)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB276;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0293D40691
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B50113@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/3] alsa-lib: use get32_labels for multi-source
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
X-List-Received-Date: Mon, 04 Aug 2014 03:21:07 -0000
Content-Type: text/plain

The PCM route plugin can assign the destination value from average of
multiple sources with attenuation. This requires the read of each
channel value, sums and writes the resultant value in the requested
format.

get_labels gives the value as is only with endianness and signedness
conversions, but put32_labels assumes that the value is normalized to
32bit int and it shifts down to the dest format. In addition, the
current code lacks get_labels entries for the 24bit formats.

For fixing these bugs, this patch replaces the read with get32_labels
and use always 64bit int for sum.

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 ...se-get32-for-multi-source-route-calculati.patch |  345 ++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb  |    3 +-
 2 files changed, 347 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch
new file mode 100755
index 0000000..89363d5
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch
@@ -0,0 +1,345 @@
+From 3f179d6cc7c222dfa42fe094b7ef1e21685a05bc Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Tue, 22 Jul 2014 11:55:40 +0200
+Subject: [PATCH] pcm: route: Use get32 for multi-source route calculation
+
+The PCM route plugin can assign the destination value from average of
+multiple sources with attenuation. This requires the read of each
+channel value, sums and writes the resultant value in the requested
+format.
+
+Currently, get_labels is used for reading source values while
+put32_labels is used for writing the dest value.  This is, however,
+a buggy implementation; get_labels gives the value as is only with
+endianness and signedness conversions, but put32_labels assumes that
+the value is normalized to 32bit int and it shifts down to the dest
+format.  In addition, the current code lacks get_labels entries for
+the 24bit formats, as Shengjiu Wang spotted out.
+
+For fixing these bugs, this patch replaces the read with
+get32_labels and use always 64bit int for sum.  This simplifies the
+code a lot and drops many lines.
+
+Commit fd84adc63e307572d05274be44c782a787087cda in master branch
+
+Upstream Status: Backported
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ src/pcm/pcm_route.c  |  128 +++++++++-----------------------------------------
+ src/pcm/plugin_ops.h |   81 --------------------------------
+ 2 files changed, 23 insertions(+), 186 deletions(-)
+
+diff --git a/src/pcm/pcm_route.c b/src/pcm/pcm_route.c
+index 2beedf6..1ed9c5f 100644
+--- a/src/pcm/pcm_route.c
++++ b/src/pcm/pcm_route.c
+@@ -60,7 +60,7 @@ typedef struct {
+ typedef struct snd_pcm_route_ttable_dst snd_pcm_route_ttable_dst_t;
+ 
+ typedef struct {
+-	enum {UINT32=0, UINT64=1, FLOAT=2} sum_idx;
++	enum {UINT64, FLOAT} sum_idx;
+ 	unsigned int get_idx;
+ 	unsigned int put_idx;
+ 	unsigned int conv_idx;
+@@ -232,55 +232,34 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
+ 					const snd_pcm_route_ttable_dst_t* ttable,
+ 					const snd_pcm_route_params_t *params)
+ {
+-#define GETS_LABELS
++#define GET32_LABELS
+ #define PUT32_LABELS
+ #include "plugin_ops.h"
+-#undef GETS_LABELS
++#undef GET32_LABELS
+ #undef PUT32_LABELS
+-	static void *const zero_labels[3] = {
+-		&&zero_int32, &&zero_int64,
++	static void *const zero_labels[2] = {
++		&&zero_int64,
+ #if SND_PCM_PLUGIN_ROUTE_FLOAT
+ 		&&zero_float
+ #endif
+ 	};
+ 	/* sum_type att */
+-	static void *const add_labels[3 * 2] = {
+-		&&add_int32_noatt, &&add_int32_att,
++	static void *const add_labels[2 * 2] = {
+ 		&&add_int64_noatt, &&add_int64_att,
+ #if SND_PCM_PLUGIN_ROUTE_FLOAT
+ 		&&add_float_noatt, &&add_float_att
+ #endif
+ 	};
+-	/* sum_type att shift */
+-	static void *const norm_labels[3 * 2 * 4] = {
+-		0,
+-		&&norm_int32_8_noatt,
+-		&&norm_int32_16_noatt,
+-		&&norm_int32_24_noatt,
+-		0,
+-		&&norm_int32_8_att,
+-		&&norm_int32_16_att,
+-		&&norm_int32_24_att,
+-		&&norm_int64_0_noatt,
+-		&&norm_int64_8_noatt,
+-		&&norm_int64_16_noatt,
+-		&&norm_int64_24_noatt,
+-		&&norm_int64_0_att,
+-		&&norm_int64_8_att,
+-		&&norm_int64_16_att,
+-		&&norm_int64_24_att,
++	/* sum_type att */
++	static void *const norm_labels[2 * 2] = {
++		&&norm_int64_noatt,
++		&&norm_int64_att,
+ #if SND_PCM_PLUGIN_ROUTE_FLOAT
+-		&&norm_float_0,
+-		&&norm_float_8,
+-		&&norm_float_16,
+-		&&norm_float_24,
+-		&&norm_float_0,
+-		&&norm_float_8,
+-		&&norm_float_16,
+-		&&norm_float_24,
++		&&norm_float,
++		&&norm_float,
+ #endif
+ 	};
+-	void *zero, *get, *add, *norm, *put32;
++	void *zero, *get32, *add, *norm, *put32;
+ 	int nsrcs = ttable->nsrcs;
+ 	char *dst;
+ 	int dst_step;
+@@ -322,9 +301,9 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
+ 	}
+ 
+ 	zero = zero_labels[params->sum_idx];
+-	get = gets_labels[params->get_idx];
++	get32 = get32_labels[params->get_idx];
+ 	add = add_labels[params->sum_idx * 2 + ttable->att];
+-	norm = norm_labels[params->sum_idx * 8 + ttable->att * 4 + 4 - params->src_size];
++	norm = norm_labels[params->sum_idx * 2 + ttable->att];
+ 	put32 = put32_labels[params->put_idx];
+ 	dst = snd_pcm_channel_area_addr(dst_area, dst_offset);
+ 	dst_step = snd_pcm_channel_area_step(dst_area);
+@@ -335,9 +314,6 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
+ 
+ 		/* Zero sum */
+ 		goto *zero;
+-	zero_int32:
+-		sum.as_sint32 = 0;
+-		goto zero_end;
+ 	zero_int64: 
+ 		sum.as_sint64 = 0;
+ 		goto zero_end;
+@@ -351,21 +327,14 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
+ 			const char *src = srcs[srcidx];
+ 			
+ 			/* Get sample */
+-			goto *get;
+-#define GETS_END after_get
++			goto *get32;
++#define GET32_END after_get
+ #include "plugin_ops.h"
+-#undef GETS_END
++#undef GET32_END
+ 		after_get:
+ 
+ 			/* Sum */
+ 			goto *add;
+-		add_int32_att:
+-			sum.as_sint32 += sample * ttp->as_int;
+-			goto after_sum;
+-		add_int32_noatt:
+-			if (ttp->as_int)
+-				sum.as_sint32 += sample;
+-			goto after_sum;
+ 		add_int64_att:
+ 			sum.as_sint64 += (int64_t) sample * ttp->as_int;
+ 			goto after_sum;
+@@ -389,48 +358,10 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
+ 		
+ 		/* Normalization */
+ 		goto *norm;
+-	norm_int32_8_att:
+-		sum.as_sint64 = sum.as_sint32;
+-	norm_int64_8_att:
+-		sum.as_sint64 <<= 8;
+-	norm_int64_0_att:
+-		div(sum.as_sint64);
+-		goto norm_int;
+-
+-	norm_int32_16_att:
+-		sum.as_sint64 = sum.as_sint32;
+-	norm_int64_16_att:
+-		sum.as_sint64 <<= 16;
++	norm_int64_att:
+ 		div(sum.as_sint64);
+-		goto norm_int;
+-
+-	norm_int32_24_att:
+-		sum.as_sint64 = sum.as_sint32;
+-	norm_int64_24_att:
+-		sum.as_sint64 <<= 24;
+-		div(sum.as_sint64);
+-		goto norm_int;
+-
+-	norm_int32_8_noatt:
+-		sum.as_sint64 = sum.as_sint32;
+-	norm_int64_8_noatt:
+-		sum.as_sint64 <<= 8;
+-		goto norm_int;
+-
+-	norm_int32_16_noatt:
+-		sum.as_sint64 = sum.as_sint32;
+-	norm_int64_16_noatt:
+-		sum.as_sint64 <<= 16;
+-		goto norm_int;
+-
+-	norm_int32_24_noatt:
+-		sum.as_sint64 = sum.as_sint32;
+-	norm_int64_24_noatt:
+-		sum.as_sint64 <<= 24;
+-		goto norm_int;
+-
+-	norm_int64_0_noatt:
+-	norm_int:
++		/* fallthru */
++	norm_int64_noatt:
+ 		if (sum.as_sint64 > (int64_t)0x7fffffff)
+ 			sample = 0x7fffffff;	/* maximum positive value */
+ 		else if (sum.as_sint64 < -(int64_t)0x80000000)
+@@ -440,16 +371,6 @@ static void snd_pcm_route_convert1_many(const snd_pcm_channel_area_t *dst_area,
+ 		goto after_norm;
+ 
+ #if SND_PCM_PLUGIN_ROUTE_FLOAT
+-	norm_float_8:
+-		sum.as_float *= 1 << 8;
+-		goto norm_float;
+-	norm_float_16:
+-		sum.as_float *= 1 << 16;
+-		goto norm_float;
+-	norm_float_24:
+-		sum.as_float *= 1 << 24;
+-		goto norm_float;
+-	norm_float_0:
+ 	norm_float:
+ 		sum.as_float = rint(sum.as_float);
+ 		if (sum.as_float > (int64_t)0x7fffffff)
+@@ -644,7 +565,7 @@ static int snd_pcm_route_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
+ 		return err;
+ 	route->params.use_getput = snd_pcm_format_physical_width(src_format) == 24 ||
+ 		snd_pcm_format_physical_width(dst_format) == 24;
+-	route->params.get_idx = snd_pcm_linear_get_index(src_format, SND_PCM_FORMAT_S16);
++	route->params.get_idx = snd_pcm_linear_get32_index(src_format, SND_PCM_FORMAT_S32);
+ 	route->params.put_idx = snd_pcm_linear_put32_index(SND_PCM_FORMAT_S32, dst_format);
+ 	route->params.conv_idx = snd_pcm_linear_convert_index(src_format, dst_format);
+ 	route->params.src_size = snd_pcm_format_width(src_format) / 8;
+@@ -652,10 +573,7 @@ static int snd_pcm_route_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
+ #if SND_PCM_PLUGIN_ROUTE_FLOAT
+ 	route->params.sum_idx = FLOAT;
+ #else
+-	if (snd_pcm_format_width(src_format) == 32)
+-		route->params.sum_idx = UINT64;
+-	else
+-		route->params.sum_idx = UINT32;
++	route->params.sum_idx = UINT64;
+ #endif
+ 	return 0;
+ }
+diff --git a/src/pcm/plugin_ops.h b/src/pcm/plugin_ops.h
+index 21535c9..eb8c2c4 100644
+--- a/src/pcm/plugin_ops.h
++++ b/src/pcm/plugin_ops.h
+@@ -668,87 +668,6 @@ getu_1234_C321: sample = bswap_32(as_u32c(src) ^ 0x80); goto GETU_END;
+ }
+ #endif
+ 
+-#ifdef GETS_LABELS
+-/* width endswap sign_toggle */
+-static void *const gets_labels[4 * 2 * 2] = {
+-	&&gets_1_1,		/*  8h ->  8h */
+-	&&gets_1_9,		/*  8h ^>  8h */
+-	&&gets_1_1,		/*  8s ->  8h */
+-	&&gets_1_9,		/*  8s ^>  8h */
+-	&&gets_12_12,		/* 16h -> 16h */
+-	&&gets_12_92,		/* 16h ^> 16h */
+-	&&gets_12_21,		/* 16s -> 16h */
+-	&&gets_12_A1,		/* 16s ^> 16h */
+-	&&gets_0123_0123,	/* 24h -> 24h */
+-	&&gets_0123_0923,	/* 24h ^> 24h */
+-	&&gets_1230_0321,	/* 24s -> 24h */
+-	&&gets_1230_0B21,	/* 24s ^> 24h */
+-	&&gets_1234_1234,	/* 32h -> 32h */
+-	&&gets_1234_9234,	/* 32h ^> 32h */
+-	&&gets_1234_4321,	/* 32s -> 32h */
+-	&&gets_1234_C321,	/* 32s ^> 32h */
+-};
+-#endif
+-
+-#ifdef GETS_END
+-while (0) {
+-gets_1_1: sample = as_s8c(src); goto GETS_END;
+-gets_1_9: sample = (int8_t)(as_s8c(src) ^ 0x80); goto GETS_END;
+-gets_12_12: sample = as_s16c(src); goto GETS_END;
+-gets_12_92: sample = (int16_t)(as_s16c(src) ^ 0x8000); goto GETS_END;
+-gets_12_21: sample = (int16_t)bswap_16(as_s16c(src)); goto GETS_END;
+-gets_12_A1: sample = (int16_t)bswap_16(as_s16c(src) ^ 0x80); goto GETS_END;
+-gets_0123_0123: sample = sx24((int32_t)(as_s32c(src) << 8) >> 8); goto GETS_END;
+-gets_0123_0923: sample = sx24((int32_t)((as_s32c(src) ^ 0x800000) << 8) >> 8); goto GETS_END;
+-gets_1230_0321: sample = sx24((int32_t)(bswap_32(as_s32c(src)) << 8) >> 8); goto GETS_END;
+-gets_1230_0B21: sample = sx24((int32_t)(bswap_32(as_s32c(src) ^ 0x8000) << 8) >> 8); goto GETS_END;
+-gets_1234_1234: sample = as_s32c(src); goto GETS_END;
+-gets_1234_9234: sample = (int32_t)(as_s32c(src) ^ 0x80000000); goto GETS_END;
+-gets_1234_4321: sample = (int32_t)bswap_32(as_s32c(src)); goto GETS_END;
+-gets_1234_C321: sample = (int32_t)bswap_32(as_s32c(src) ^ 0x80); goto GETS_END;
+-}
+-#endif
+-
+-#ifdef PUT_LABELS
+-/* width endswap sign_toggle */
+-static void *const put_labels[4 * 2 * 2] = {
+-	&&put_1_1,		/*  8h ->  8h */
+-	&&put_1_9,		/*  8h ^>  8h */
+-	&&put_1_1,		/*  8h ->  8s */
+-	&&put_1_9,		/*  8h ^>  8s */
+-	&&put_12_12,		/* 16h -> 16h */
+-	&&put_12_92,		/* 16h ^> 16h */
+-	&&put_12_21,		/* 16h -> 16s */
+-	&&put_12_29,		/* 16h ^> 16s */
+-	&&put_0123_0123,	/* 24h -> 24h */
+-	&&put_0123_0923,	/* 24h ^> 24h */
+-	&&put_0123_3210,	/* 24h -> 24s */
+-	&&put_0123_3290,	/* 24h ^> 24s */
+-	&&put_1234_1234,	/* 32h -> 32h */
+-	&&put_1234_9234,	/* 32h ^> 32h */
+-	&&put_1234_4321,	/* 32h -> 32s */
+-	&&put_1234_4329,	/* 32h ^> 32s */
+-};
+-#endif
+-
+-#ifdef PUT_END
+-put_1_1: as_s8(dst) = sample; goto PUT_END;
+-put_1_9: as_u8(dst) = sample ^ 0x80; goto PUT_END;
+-put_12_12: as_s16(dst) = sample; goto PUT_END;
+-put_12_92: as_u16(dst) = sample ^ 0x8000; goto PUT_END;
+-put_12_21: as_s16(dst) = bswap_16(sample); goto PUT_END;
+-put_12_29: as_u16(dst) = bswap_16(sample) ^ 0x80; goto PUT_END;
+-/* this always writes the unused byte in 24-bit formats as 0x00 */
+-put_0123_0123: as_s32(dst) = sx24(sample & 0x00ffffff); goto PUT_END;
+-put_0123_0923: as_u32(dst) = sx24((sample & 0x00ffffff) ^ 0x800000); goto PUT_END;
+-put_0123_3210: as_s32(dst) = sx24s(bswap_32(sample) & 0xffffff00); goto PUT_END;
+-put_0123_3290: as_u32(dst) = sx24s((bswap_32(sample) & 0xffffff00) ^ 0x8000); goto PUT_END;
+-put_1234_1234: as_s32(dst) = sample; goto PUT_END;
+-put_1234_9234: as_u32(dst) = sample ^ 0x80000000; goto PUT_END;
+-put_1234_4321: as_s32(dst) = bswap_32(sample); goto PUT_END;
+-put_1234_4329: as_u32(dst) = bswap_32(sample) ^ 0x80; goto PUT_END;
+-#endif
+-
+ #ifdef PUT32F_LABELS
+ /* type (0 = float, 1 = float64), endswap */
+ static void *const put32float_labels[2 * 2] = {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index cbe0448..d46f7a0 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -18,7 +18,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://fix-tstamp-declaration.patch \
            file://Update-iatomic.h-functions-definitions-for-mips.patch \
-          "
+           file://0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch \
+"
 SRC_URI[md5sum] = "69129a7c37697f81ac092335e9fa452b"
 SRC_URI[sha256sum] = "690ed393e7efd4fc7e3a2d2cda5449298ca0c895197e5914e350882012430d19"
 
-- 
1.7.9.5


