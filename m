Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12937.1795770235738650405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=KxAf7+3O;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12399438D0;
	Fri, 27 Nov 2026 08:54:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795769656;
	b=iZKkA5V2boQa0QO8xeRXRQ5+ctvyElTePOiebd2MD4dSy+yHQhuhjLjDxon/p3dIv42z
	 3gwr8KX5AiqJ+SwyO+x8gT70HCydpnovcxexNYDADDoqgT7XrNcEuQc58YJvhb21/Qa03
	 ZZxTN1peCedBooe18qjZ6tMO8YB+FAAKWO8t5C6qRjoy5MrNWF5iHdkt+TvUZcnoflDk4
	 5qUnHqQrpS17/9fH6SGxv+Jft07az7OEshcEBaInYM8lZCTj24Csd++sXuwrF6VZqztdq
	 iYQfzjKfWGf+Cf1vX6g49jrYe5vTq2QO2YDk8TMpxVEtXoY8b+RBFtC5WPxsQUo/k4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769656;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FnGiQ1FSQXimCqjwOd2UVxIRbyfdYn8o3wgRoqd2xfQ=;
	b=XVEG285p0XyDrAAJb9FKw0uMlvDRrKOm45yHmjPmcf6IWsUww5mwOjAvGCqClADtYSke
	 cwu+tgaV3rSYGKJi5HgAzPqQ1uYLN55zgnK4qBrtpOzVKY0XX3dXw6YMA2zQFHy9qPp1b
	 7y25SXnl8frhpYikXlH2hQyCIMZD/cSm+neemoEmiC8aGJu7Z+uzarc8EBa2+6jlA3y6f
	 qekAi+rlXE95kqHDQ5iQH10tZKW8xSG4FsqEWr5mgGV677ZQzGdxzqwfFdqfGHbml5D3x
	 bOwTruf/cSYShcuzbBtMSM8LUe/5cOEwY5Wg6IxaqMR1yzKCMS8Uii7MI0dQVq37H2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B675A1F0089B;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769656;
	bh=FnGiQ1FSQXimCqjwOd2UVxIRbyfdYn8o3wgRoqd2xfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=KxAf7+3OSk7x5xtSMM1cTughMd5yFPO05k/RX4xNqCv18yqYce70Sh2vdL847Y5Pm
	 nVjWXt9o++2eihFoMcvTK1yfZAt6Mn0RrCpnIjISjz4wBagPt52ezKknYJsBvbSLVd
	 X7CAEwURvowUx8D0uwIX+998JqkRfZyBjZGKMGu1o9LSU+OycBzoy+yuQQvY6SiSNc
	 QY7aOr7dqHfzTbu6lp6j0/iJonXahNqJWOABNONqwljfm3chXAmemZO+un/+P8uUWj
	 FFeh5xxWIY0QZqt1c/EGu/E/uQ+9wnzTjsR5EdkVvElDsIuA8wHv9+POTylTcP2BGP
	 J7uQ6cg4dWp0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 458194B66D;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261127-yoc1s-ffmpeg-v1-2-f01fec79468b@certik.com>
References: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
In-Reply-To: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Thu, 26 Nov 2026 23:02:05 +0000
Subject: [scarthgap][PATCH 2/7] ffmpeg: fix CVE-2026-135743
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769564; l=3448;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=Yvwta390KcGjewvsNg2wwIiE2FTnqbt31WzPyeMoquE=;
 b=MfmRBOmarNIxsgcW1CNr/MlTDW+VGMnk01nFQcyaCr9jIGlJNhrK/w7SSaarMCoNzyktkxDv/
 F/0NPDo33MmBvW2fhaRbEMyqAo+2886MMFnJEiK2uiw9UdmBIXoewqZ
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251365

From: Dickson Wu <dickson.wu@certik.com>

The dynamic audio normalizer could resize gain-history buffers
incorrectly when its filter size changed, causing invalid memmove sizes
and out-of-bounds access. Backport the upstream fix.

https://github.com/FFmpeg/FFmpeg/commit/3dd257f99b5c

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-135743.patch       | 49 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135743.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135743.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135743.patch
new file mode 100644
index 00000000..46d6284a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135743.patch
@@ -0,0 +1,49 @@
+From 3dd257f99b5cdc1bf38e1cadff1e34ec559c7b7c Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 14 Nov 2026 05:14:09 +0100
+Subject: [PATCH] avfilter/af_dynaudnorm: resize the gain histories by the
+ change of the filter size
+
+Fixes: out of array access (memmove with negative size)
+Fixes: out of array write
+Fixes: ArUvqAYbevNM
+Fixes: AISLE-2026-0166-00680
+
+Found-by: Joshua Rogers (AISLE)
+The out of array write was found during triage of the security report
+
+Out of array access Replicated through UnModified FFmpeg with ASAN
+Out of array write Replicated through UnModified FFmpeg with ASAN
+no further issues found with 3000 iterations of a random gausssize command sequence generator
+
+CVE: CVE-2026-135743
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/3dd257f99b5cdc1bf38e1cadff1e34ec559c7b7c]
+
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+ libavfilter/af_dynaudnorm.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libavfilter/af_dynaudnorm.c b/libavfilter/af_dynaudnorm.c
+index 1af6a3ed9f04f..e00405995c17b 100644
+--- a/libavfilter/af_dynaudnorm.c
++++ b/libavfilter/af_dynaudnorm.c
+@@ -261,14 +261,14 @@ static void cqueue_resize(cqueue *q, int new_size)
+     av_assert2(q->max_size >= new_size);
+     av_assert2(MIN_FILTER_SIZE <= new_size);
+ 
+-    if (new_size > q->nb_elements) {
+-        const int side = (new_size - q->nb_elements) / 2;
++    if (!cqueue_empty(q) && new_size > q->size) {
++        const int side = (new_size - q->size) / 2;
+ 
+         memmove(q->elements + side, q->elements, sizeof(double) * q->nb_elements);
+         for (int i = 0; i < side; i++)
+             q->elements[i] = q->elements[side];
+-        q->nb_elements = new_size - 1 - side;
+-    } else {
++        q->nb_elements += side;
++    } else if (!cqueue_empty(q)) {
+         int count = (q->size - new_size + 1) / 2;
+ 
+         while (count-- > 0)
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index a44b407b..9d92115b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://CVE-2025-25473.patch \
     file://CVE-2025-22921.patch \
     file://CVE-2026-135736.patch \
+    file://CVE-2026-135743.patch \
 "
 
 SRC_URI[sha256sum] = "a231e3d5742c44b1cdaebfb98ad7b6200d12763e0b6db9e1e2c5891f2c083a18"
-- 
2.43.0


