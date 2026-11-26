Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12899.1795770123207800400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=fqmJSbhK;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDD9C61132;
	Fri, 27 Nov 2026 08:54:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795769651;
	b=iRUKfJf6/E3drvOvpKhQKbLLDdP5v991xf2GMzlaLLrcyJbajB6kFMXlT76peY927JFl
	 4Xdawkoo3Eu27bQjJwCgkpnDc0/nAE3zPeBGJkh+O86l7olKZAVlNEJWxPn5CqPEGJP1Q
	 yjPUBRBzi2etuHmolS13+Edomoi2f+pFwUfhtTLHFNgFg9TY9doaTw2NiY/LlUPeE9fVc
	 keuArJhXUk4V9ppq+TdecDvaDTWvLJG7ntbJ2h3yF2ez8Kde7/2Pcp3geHSoL4micseGL
	 q4j+nIZExoj7hkwjr4ktACluljLLY9Q+kX+zxPhF0qdVEnXDp+6VLrjNWdaCJxDfPSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769651;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MozgWAmJiYZelXYhRlQQS57cavLfGnfmbdl0C8Y8WkA=;
	b=r4+KZk32gZOV5Mfj3PyVh1S1XsdTfPoVgXU7rOsldG04/h+aZWJQHBik5TxM9lL1rq19
	 t5r44XebcAaijhablh3a1tiK9m/N7uRp7L7H11kswPavBysynYGsHk6zcHdMC1tO+x1FS
	 jDnu2qxyEHni4ZTeytXHnY9YN+4pDHlwPZJtSV8NCnPGGmhdbDnRLHJxwQlUd9OLFffip
	 duN2AosG5Q+XCqiIjXwDvt1Hxnksf5LplIpYiNF2khCx6Vw7h3zt1IYDD0fSypAcEhdN2
	 Y1o1R7S8a6I8Go2yjznEFxKZcU61vavQGLXdNnqe3iEy9YZR987De2des0iI0Pd3Feg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AE001F0089A;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769651;
	bh=MozgWAmJiYZelXYhRlQQS57cavLfGnfmbdl0C8Y8WkA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=fqmJSbhKqn+A1eNR9bROOOAr2exT8ZcmYqClmdZiEXzR9u2OXNqkJ7rjt+AucVbam
	 woNsySZ2Th4t2CvTI9SknMgwppm6M8UEQW6tGIFghAzRJkXeEauWrjtvew87sRYmq2
	 /9kGXWBL0wp77QsyKLzGGj5EU0DpLDVEX0BGbEYIuXYOL9aGOoM36SV8tlt+DSXXUo
	 kxP6MOhlVcMrM/8kKqeWDXObTaUjrJgRi2UkInbyvMp8sjXzoGPy6FzCzWbY6efnmB
	 NalQ0zTv8ZjtESG0eNh+HcfY3LTaYDxip8cfU8PRuq1GktkjTd4AIeGlJlfNHKbVTy
	 QPu9gpdUitcQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 293DF4B64E;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261127-yoc1s-ffmpeg-v1-1-f01fec79468b@certik.com>
References: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
In-Reply-To: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Thu, 26 Nov 2026 23:02:05 +0000
Subject: [scarthgap][PATCH 1/7] ffmpeg: fix CVE-2026-135736
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769564; l=2986;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=GuxqvwhgVspx+ChWbJMq5zFQuumStwuxwgjYy0uKo0M=;
 b=Vnm50eIBmXI/K4HU+lRY3Qts8bT2U2tUsOuP6B9zieKkAqDEhJMrzdCgPlxo9FZyPLDUS2Qlz
 xyqETFIbPd6BpjVAAWLUdf+cE+w1UmqM1BuMZtjF6cvDAj25k9trQQG
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251359

From: Dickson Wu <dickson.wu@certik.com>

The deband filter allowed the runtime coupling option for subsampled
pixel formats, which could access outside chroma planes. Backport the
upstream fix.

https://github.com/FFmpeg/FFmpeg/commit/24ad423d908c

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-135736.patch       | 45 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135736.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135736.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135736.patch
new file mode 100644
index 00000000..6abf259f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135736.patch
@@ -0,0 +1,45 @@
+From 24ad423d908cd595c983b6c503ddb0ee94901ba2 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 14 Nov 2026 05:23:08 +0100
+Subject: [PATCH] avfilter/vf_deband: reject the coupling command for
+ subsampled formats
+
+Fixes: out of array access
+Fixes: QJKTLuAvDBVR
+Fixes: AISLE-2026-0166-00123
+
+Found-by: Joshua Rogers (AISLE)
+
+Out of array read and write Replicated through UnModified FFmpeg with ASAN
+
+CVE: CVE-2026-135736
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/24ad423d908cd595c983b6c503ddb0ee94901ba2]
+
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+ libavfilter/vf_deband.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libavfilter/vf_deband.c b/libavfilter/vf_deband.c
+index 2ff4fca6fa4de..6dd08dd10f80e 100644
+--- a/libavfilter/vf_deband.c
++++ b/libavfilter/vf_deband.c
+@@ -438,11 +438,18 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
+ static int process_command(AVFilterContext *ctx, const char *cmd, const char *args,
+                            char *res, int res_len, int flags)
+ {
++    DebandContext *s = ctx->priv;
+     int ret = ff_filter_process_command(ctx, cmd, args, res, res_len, flags);
+ 
+     if (ret < 0)
+         return ret;
+ 
++    if (s->coupling && (s->shift[0] || s->shift[1])) {
++        av_log(ctx, AV_LOG_ERROR, "coupling needs a pixel format without chroma subsampling\n");
++        s->coupling = 0;
++        return AVERROR(EINVAL);
++    }
++
+     return config_input(ctx->inputs[0]);
+ }
+ 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 849835c8..a44b407b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2026-135736.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
-- 
2.43.0


