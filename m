Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12910.1795770235750884091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=lk2N88jw;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 122FA43781;
	Fri, 27 Nov 2026 08:54:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795769656;
	b=LQIHig6tw1psb8+y5Fz9fHIgphqXLiIpigySKTriTUK4T9ZxswT39IafmwqDXLinD7/2
	 K9Vh8j5DAvzfojv9QDYPE+bgzbH6sE7sZRIU67j4fmFB1+K2Cl/kiSiyyagkD5rnkC8UO
	 kTI2z0IDT0BGQKfRgrk+X/1QnVkyeA6eC9BWBzelu+TgMQ8kaiCGro/OxiPclZqqF3ddJ
	 O06grocP4GlkBzy8/FO19We8bp81YFWg//pNM43RnW6nSP8OKvZkiE8wYF812Y1QHzOfl
	 VDru5i2FyE57dL4piIW4nEfG3qUCXKdad5VjVomcCkC52iodNaVFQ9uQ01RpDjT4NZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769656;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rAfplAyAFqfLSQVdo/aUh7Sa4Sa46n6UAjM3VBWCs3M=;
	b=UxPImcALHMpvEat3z20UGq8+eVnSUzHvRhVPaOSIQ0yH4k7ziTW1s/+dNDW1KCLohZfU
	 RLQfHgUuonKPiCBsCQVvcmy7ZSQBv4/zEDygtrVg64t+3brDpdAdPkczp2i3gOB+34Ezv
	 yFOXBcet5RPXGAJIKJMxJcblWtKuBWWxGe1Fyv0xnYNmuNx+x5bNyx4YwzwUy6fWiF17t
	 wSi83K+fJwdhLj68qljbdPKUxvH3DA6eRFYVsw0lxjEE5uSSSfBaqPAw0aX8tstzWjRO1
	 yojyLn2M72ynKyiywBZ90YQRKjIcHkGeZiPgsoFt/3PZHZOIhOLbGUVgPXcLaFeCjVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00FB61F008A0;
	Fri, 27 Nov 2026 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769656;
	bh=rAfplAyAFqfLSQVdo/aUh7Sa4Sa46n6UAjM3VBWCs3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=lk2N88jwEPjtCtiTQZWuR4VYYrtWWwYDAybl+hqwlgIc8oymECN3Ie0FfoC9EQdOx
	 UjDppx9xwvCalp8T6b3u0429tNmhVFVUdsoR/IB3X0ZqT0cDkkrolm0E8QOUmeUm+v
	 1cqnv06DuWQiiQqktedhPa2TIODlMw28xyQLBlk6SRm3AEayyxB6/bKkb/JwDuI7XZ
	 3NQLMownmtxACJkW8q+MS4NHeRPq8xOtbi3Zj4O54xNnn5AjBN1L1SUFcFqZ+ptWwA
	 0KJ6ALa/QvoRwqJMrkSrbzSwfoSB3pX8PI/P665e21zbh7vz4+QzHCohZWKXKZcRzt
	 stnlEqREYJsgw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 839004B675;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261127-yoc1s-ffmpeg-v1-4-f01fec79468b@certik.com>
References: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
In-Reply-To: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Thu, 26 Nov 2026 23:02:05 +0000
Subject: [scarthgap][PATCH 4/7] ffmpeg: fix CVE-2026-135725
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769565; l=2686;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=HWcqlx1vXCOUWCWD91ivCLqslU3Hsq846IOO0wpUCrQ=;
 b=p9N6cfuwBdtPbkcGn1wOmEyHBxJZDQtjNC+urkPaqzrXOYaKUfMzGX15+wa59sDg81QrLEya+
 rO7mtg8dIXQCUSAcCxO/dOjxrFQftLk8gVnNchFhChBdbhxOWe1DjxW
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251364

From: Dickson Wu <dickson.wu@certik.com>

The RTMP packet header buffer was too small for the generated header,
allowing a stack out-of-bounds write. Backport the upstream fix.

https://github.com/FFmpeg/FFmpeg/commit/041098a1a3be

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-135725.patch       | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135725.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135725.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135725.patch
new file mode 100644
index 00000000..9f481c75
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135725.patch
@@ -0,0 +1,34 @@
+From 041098a1a3bee481a1c8e905257ba04dad0c60a1 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 6 Oct 2026 06:53:14 +0200
+Subject: [PATCH] avformat/rtmppkt: Make the packet header buffer large enough
+
+The fix is the one recommended in the report.
+
+Fixes: out of array write
+Fixes: BvkwW4Yd19HN
+Fixes: AISLE-2026-0111-00462
+Stack out of array write Replicated through UnModified FFmpeg with ASAN
+Found-by: Joshua Rogers <joshua.rogers@aisle.com>
+
+CVE: CVE-2026-135725
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/041098a1a3bee481a1c8e905257ba04dad0c60a1]
+
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+ libavformat/rtmppkt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/rtmppkt.c b/libavformat/rtmppkt.c
+index e52307c5d63c5..ee687d4791568 100644
+--- a/libavformat/rtmppkt.c
++++ b/libavformat/rtmppkt.c
+@@ -314,7 +314,7 @@ int ff_rtmp_packet_write(URLContext *h, RTMPPacket *pkt,
+                          int chunk_size, RTMPPacket **prev_pkt_ptr,
+                          int *nb_prev_pkt)
+ {
+-    uint8_t pkt_hdr[16], *p = pkt_hdr;
++    uint8_t pkt_hdr[18], *p = pkt_hdr;
+     int mode = RTMP_PS_TWELVEBYTES;
+     int off = 0;
+     int written = 0;
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index a9b42303..789beed0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2026-135736.patch \
     file://CVE-2026-135743.patch \
     file://CVE-2026-135722.patch \
+    file://CVE-2026-135725.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
-- 
2.43.0


