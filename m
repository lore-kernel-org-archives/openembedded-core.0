Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12938.1795770235750751828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=Iu1ehLKv;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C2E440270;
	Fri, 27 Nov 2026 08:54:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795769659;
	b=uRLjKXSI4izq46Kc7jBY7lpr7RcKvig4/mUPRlmvGjy9eX87JInVpIxEpOYH7ycqXsBp
	 +azQT72NkwwM2oWCRZFIBRaYzdgHpNKI16Z/SZwp39mMi0vAff+z9cUpIcfwHg13fHWqP
	 ce8VO76gfZt11Hbnx7MYbrzJPJQr6CT3AMWozVMyD2mRRzvxe1jtJFcRjgkJMYi6h95lb
	 RTybg6/LTjTsdW/rgIBsItPwgR4JapeWCcKYlKesIjSQ+VFTT1xqe+cqU/4dD6uyxbb/a
	 3kHiyw3lDHkhzZ1g5yvKVbidZkct6pgPOvgPqxerGdyNsrlw1HJqtnCeDVrmDTLRumQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769659;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JoYRuZylV9LTxO1qe4iwwkjcNEz9cJDBOYYW2GuMQsw=;
	b=UFYeieIdZRUEBxNcoKRK/oomCTmyuH7Y0ZVhhBSK81JwkegamPFqLXUfy/otH7MvLNWM
	 IfS6eRRf7TRBFeQWMfgaZJfgj1WKF7f5xNNKBKPxIXpGRAOga0eRze3SXmuL4C57dTwJl
	 CQUBV6vVzQra/ZLQLTTkdSYCcYipQiLNqZQtoGhD8MxjjEInE+scRQ6M8itxYh+JvzlQA
	 9bjaFTfAmUX41xAOo1N7KdCSk5QNVLAGmla8prgP6va2PNcEA9e5sNXJ4xAW9G95TVByr
	 pL5n5n8aOccm8ZzSy2rblpw3yffepc3CY4ZFmDSgIk8c1eXpkdF7vJsgYHh8X3KqApg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 315F41F000C1;
	Fri, 27 Nov 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769659;
	bh=JoYRuZylV9LTxO1qe4iwwkjcNEz9cJDBOYYW2GuMQsw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=Iu1ehLKvTyODDGUOVrgiD1TUovws3argGH6kxImLKuaLRXPgkT5rnXR8iHk9sVQfh
	 /J8jcHn5AG8VVmvtFiDW6RVMISVjPLUCSgbd8g5u0EQNYi0Et/ylM6KNl5WrxrRAgz
	 bGN3HnHJX6OrEvzU3YvL8qnkMVI4BzzN5shBJx9+bkd3A4Dv5LMjGxkGmSUyvF7DbY
	 Qd/mLXIJy/Ldz/fuKxnqLQEArXKFvE6QWCl+e/rWNV8oi9RQuWAuvR+11b3X/XUi/M
	 YRIi0sb5C7f5p10gsyy9x34TzmFbCr0BCxrNvbopUmFNbWuRxpIakdG87gqxzvRWDq
	 +a9OCKChb609Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2EED4B679;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261127-yoc1s-ffmpeg-v1-5-f01fec79468b@certik.com>
References: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
In-Reply-To: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Thu, 26 Nov 2026 23:02:05 +0000
Subject: [scarthgap][PATCH 5/7] ffmpeg: fix CVE-2026-135734
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769565; l=2657;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=pwCQ7RZf8N/57MZhqhKvdJggxKSOYWfC6RzFI8SPz0U=;
 b=j4z3XSU6lPR/d+XSuX6EJj63jT+vQKtAtm83XK5FHK6oL40fAVjlLkjk+jucEH9s71IrpmXm1
 MYaj1AXR4oJD7fPceCUwkRw2Ige8GaQes3GpqtTVEM5nxrfDZM1xMs2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251363

From: Dickson Wu <dickson.wu@certik.com>

The deflicker histogram was too small for all 16-bit sample values,
allowing an out-of-bounds write. Backport the upstream fix.

https://github.com/FFmpeg/FFmpeg/commit/fa10042f748f

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-135734.patch       | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135734.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135734.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135734.patch
new file mode 100644
index 00000000..0d722501
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135734.patch
@@ -0,0 +1,36 @@
+From fa10042f748f20fad0cc0ee8fdcebe96b76603af Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 14 Nov 2026 01:57:50 +0100
+Subject: [PATCH] avfilter/vf_deflicker: allocate the histogram for all 16 bit
+ sample values
+
+Fixes: out of array write
+Fixes: QvFnGUZttUck
+Fixes: AISLE-2026-0166-00061
+
+Found-by: berrob14 (#24121)
+Found-by: Joshua Rogers (AISLE)
+
+Out of array write Replicated through UnModified FFmpeg with ASAN
+
+CVE: CVE-2026-135734
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/fa10042f748f20fad0cc0ee8fdcebe96b76603af]
+
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+ libavfilter/vf_deflicker.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavfilter/vf_deflicker.c b/libavfilter/vf_deflicker.c
+index 38f838f088ca5..8bab1211c20ea 100644
+--- a/libavfilter/vf_deflicker.c
++++ b/libavfilter/vf_deflicker.c
+@@ -333,7 +333,7 @@ static int config_input(AVFilterLink *inlink)
+         s->calc_avgy = calc_avgy16;
+     }
+ 
+-    s->histogram = av_calloc(1 << s->depth, sizeof(*s->histogram));
++    s->histogram = av_calloc(1 << (s->depth > 8 ? 16 : 8), sizeof(*s->histogram));
+     if (!s->histogram)
+         return AVERROR(ENOMEM);
+ 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 789beed0..4f2a1ec1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2026-135743.patch \
     file://CVE-2026-135722.patch \
     file://CVE-2026-135725.patch \
+    file://CVE-2026-135734.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
-- 
2.43.0


