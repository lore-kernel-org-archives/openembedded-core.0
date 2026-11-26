Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12918.1795770123183944930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=O9fVXl/t;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA9AD62405;
	Fri, 27 Nov 2026 08:54:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795769662;
	b=MSCCAh3VLl5Q+7bnGPRbADEOJProa/dUjDa0XdLntub+m+dM0vhSQ9RGtnzyOF9T0AuO
	 mxkWktKUhBEyqpAWPxsgXrXu+OJSG1SSJMyvnHWR/qP8SmRAN96KloTGs3WA15lF5zg/G
	 B+L63EtSmSf+/yfhnxUpbViwWf/K9U/9chnkBYsgvki/ZLxeuDgYqyp5kzTXb22vyNC4M
	 8SKbcnsPGpeNd1hqB6S3zIh/uLfFTDALX7lqWCg3bVPCOUAYJbaqxGhtOy7N5kg/OgxjT
	 ce/OKPkUy8MRMJcfM8oyjSRC/kU/i0hnbkywtLZzxuGhZif2cmIKmHcXDZqhsh4qZvA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769662;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k/njkePIP+OnKSL2AYqG6n/Nk09vkGutVrjgjq2bMV0=;
	b=zEqHd8AMkLZbB/QiOR+HjPPz+xw20NaWz9blPgkG+rmYo8XsrXPIpvr/jaPjo/z+ENQP
	 mBxs1mkHpffbGKcfRy7/s0/skFVJe9QFQBNIn5F7DicuKpXQ73IN4uK31fFPc7ty7AhPN
	 RxlJ51jjJiGvHZFzf7PD1lGuEag/q9WV8/zTTU/qw1v6+I57B+I9AdjCVLGtoVZewYrpZ
	 xB8D0JcsL4xsERASxZV+AohQ3idBSLyI2J6kPN1kOTMY8qr+TuG0faBJT3N0q5v7xXa0w
	 3N1lpdnGuUFBN+BoyfaPIJqbCn+fOh34pXa90opNb8R6uck1jVWn5mNRswZ40wDHngQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3169B1F00897;
	Fri, 27 Nov 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769662;
	bh=k/njkePIP+OnKSL2AYqG6n/Nk09vkGutVrjgjq2bMV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=O9fVXl/tZ2FwD7G8Ip3WKUNEmalsKy6MotIpN/jtEs5TmmignD7WegU1Ojl4A159c
	 xtbKDd9cuhDpxSdNUl7/CCPZ45PSS9sSMT6xWKeXs8PoaSFFYmLUdteQ1iOPEhoDnX
	 iYcnA9h92oxaEMF0k2XyQ5XtPfd8/xGux+OSDSYcasJnnzIBm6rLBVwv0A4fa9+hrT
	 2nUjs9wFCgJVdxl/hBNCQtuImTny+WiN6r9u9sp1PD+8xqPWL8BHf9Ir80ugrPz4TJ
	 siCTi7CzaiVtGBt66Iz0dOSFHyBHUfNQwg8VM74NaFwEeMtkiBX7XITuthBBeJMgDp
	 R/ExPY3n+vH5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4ADA4B67D;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261127-yoc1s-ffmpeg-v1-6-f01fec79468b@certik.com>
References: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
In-Reply-To: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Thu, 26 Nov 2026 23:02:05 +0000
Subject: [scarthgap][PATCH 6/7] ffmpeg: fix CVE-2026-135738
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769565; l=3924;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=uvqx9OEiKnuHymVoNT1op4kL9F/mtTaEnrhCOi2ujoI=;
 b=rGcmMUFYAqty6J4JiPTaVhGHgptgSia4gDuAJh285ahzqO1xnTPzLCewP9Pk9ozcSUPNB/Pi1
 oG7SvHwGiS1ArslO6LdMkIVhjzHNVK5HYuhPTTwSLV+WKXuzpBH5GbJ
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251362

From: Dickson Wu <dickson.wu@certik.com>

The signalstats histograms did not cover the full 16-bit sample range,
allowing out-of-bounds writes and an invalid float-to-integer
conversion. Backport the upstream fix.

https://github.com/FFmpeg/FFmpeg/commit/04955e8b148f

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-135738.patch       | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135738.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135738.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135738.patch
new file mode 100644
index 00000000..e01db76d
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135738.patch
@@ -0,0 +1,52 @@
+From 04955e8b148fa3e7ab022cbb9f5e35c49165ae21 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 14 Nov 2026 01:58:22 +0100
+Subject: [PATCH] avfilter/vf_signalstats: allocate the histograms for all 16
+ bit sample values
+
+Fixes: out of array write
+Fixes: 91956.4 is outside the range of representable values of type 'unsigned short'
+Fixes: 3DKcZFM0ZaFw
+Fixes: AISLE-2026-0166-00233
+
+Found-by: Joshua Rogers (AISLE)
+
+Out of array write Replicated through UnModified FFmpeg with ASAN
+Float to integer overflow Replicated through UnModified FFmpeg with UBSAN
+
+CVE: CVE-2026-135738
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/04955e8b148fa3e7ab022cbb9f5e35c49165ae21]
+
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+ libavfilter/vf_signalstats.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libavfilter/vf_signalstats.c b/libavfilter/vf_signalstats.c
+index 5859b46478c16..a69773c20831b 100644
+--- a/libavfilter/vf_signalstats.c
++++ b/libavfilter/vf_signalstats.c
+@@ -161,10 +161,10 @@ static int config_output(AVFilterLink *outlink)
+     s->vsub = desc->log2_chroma_h;
+     s->depth = desc->comp[0].depth;
+     s->maxsize = 1 << s->depth;
+-    s->histy = av_malloc_array(s->maxsize, sizeof(*s->histy));
+-    s->histu = av_malloc_array(s->maxsize, sizeof(*s->histu));
+-    s->histv = av_malloc_array(s->maxsize, sizeof(*s->histv));
+-    s->histsat = av_malloc_array(s->maxsize, sizeof(*s->histsat));
++    s->histy = av_calloc(1 << (s->depth > 8 ? 16 : 8), sizeof(*s->histy));
++    s->histu = av_calloc(1 << (s->depth > 8 ? 16 : 8), sizeof(*s->histu));
++    s->histv = av_calloc(1 << (s->depth > 8 ? 16 : 8), sizeof(*s->histv));
++    s->histsat = av_calloc(1 << (s->depth > 8 ? 16 : 8), sizeof(*s->histsat));
+ 
+     if (!s->histy || !s->histu || !s->histv || !s->histsat)
+         return AVERROR(ENOMEM);
+@@ -520,7 +520,7 @@ static int compute_sat_hue_metrics16(AVFilterContext *ctx, void *arg, int jobnr,
+         for (i = 0; i < s->chromaw; i++) {
+             const int yuvu = p_u[i];
+             const int yuvv = p_v[i];
+-            p_sat[i] = hypotf(yuvu - mid, yuvv - mid); // int or round?
++            p_sat[i] = (int)hypotf(yuvu - mid, yuvv - mid); // int or round?
+             ((int16_t*)p_hue)[i] = fmodf(floorf((180.f / M_PI) * atan2f(yuvu-mid, yuvv-mid) + 180.f), 360.f);
+         }
+         p_u   += lsz_u;
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 4f2a1ec1..2c06762b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -37,6 +37,7 @@ SRC_URI = " \
     file://CVE-2026-135722.patch \
     file://CVE-2026-135725.patch \
     file://CVE-2026-135734.patch \
+    file://CVE-2026-135738.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
-- 
2.43.0


