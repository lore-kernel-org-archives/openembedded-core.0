Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13640.1794905504750019198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 00:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=Wx3/0QY+;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+mikko.rapeli.linaro.org@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B06DA422C1;
	Tue, 17 Nov 2026 08:51:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794905503;
	b=SZ/uArSmTTuQ8REEI6dnu8mnrn7mmmvMiBm+dI42iEj3LOHQR40cT0kS8cmKYnqyIxhx
	 5SYkiCGCWKnammPM/IY2BOEwW8P8VoFl39U9A9nNmFtPOhFepCYaP2wx3u34vGPpQ15RD
	 0EDXBUUHde1VE6NjKpG7muZysnTVkjrtCS/Dn/Uz/hvlwlpvBu6lzFF+rj/tx/IapEStu
	 L+6z6n/qbqe8kTURHk7qGWI6WyFtThdQ058wgQb7eLuDdIw2PBIL7hO3/MzNSqpuljdnh
	 xgRwPTwDIzDFBqiMNby7vT2h33/DqmTxPCQuw92/KOdPNFI9xMeeKPTcYrHqx5cKSqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794905503;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GZ6Jvq1anEmBAAO7Hajoj7VJDr7NrJApt0Z4w+e9PWk=;
	b=09RWstn8ryZDdaQFp9nUgZ+caDecEmSePCW7vjGFpBSXGu8c/pz99/B8M42wKUtjzhx3
	 mA76LBRG5gnKV8NojSW4CvArABveQpsre3NuInIh6Ma4fG1WsQQUt1KSFyZhgDtx+ebVh
	 x7YRbiRccVlOLN8+TpZ+xqn8m1C9q28VkOxmpUOdykKzDoUDuNSobsiLfMdNpdYfu4lb7
	 kKykeRRYb4mgEtp5kE26S4MoP4aQS3jtBsEQuQzmBztMYvO7BMBuslnTBPNdiVxe4UvI9
	 cFMet3AVsIcar/hwRuAC2vsOF/MZZo1p3oH+62kIOqq0bQfOe0sPkxYYaJNTMQU2QgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECA381F000C4;
	Tue, 17 Nov 2026 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905503;
	bh=GZ6Jvq1anEmBAAO7Hajoj7VJDr7NrJApt0Z4w+e9PWk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Wx3/0QY+AGKHTfc/w/me08Mcb29TyeYL+KRAtcSXHUsDAVKt3+zyEqWhSjfPXv81H
	 M7j95IR8UWDoJg9aCFy1+wmz0zUrFuZdScjJ1cR+TH58AkqKxNicnSawkhJzoXfxok
	 8ANqIzcpI6p7E1sVRufCOClkGltGH3drKKK/+Vyo6QjWUtGO7NAAkhPRp46eOn0aVR
	 tAkPSTe5hvYWmbSWrgZ4LqhbbebaBHjkrLt/F/CM266zrNfll1+k/ocvV9eQKSlXKH
	 MVZy3v+6mq/+HGUpFRo1LhG48IWeV6YrrUeP4FfX2cJE3BMr06IXquLT3fJkb1b/d+
	 ZMHavfJBN1OGw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 812AC4A758;
	Tue, 17 Nov 2026 08:51:42 +0000 (UTC)
From: Mikko Rapeli via B4 Relay <devnull+mikko.rapeli.linaro.org@kernel.org>
Date: Tue, 17 Nov 2026 10:51:37 +0200
Subject: [PATCH] lttng-modules: fix build with kernel 7.4-rc2 and newer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-lttng-modules_fix_new-v1-1-6140fe249a6b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfTbQjdKCVxEpTTLWlZpKNrWF0
 rsb9fFjmH8jRRIonauNEt6iMsUCPlTk730cYCQUk61tw8ytGXOOg3lOYR6h3U3WLmIxfHKuZ49
 wtA2V7yuhTL/u5fq3zu4Bn78x2vcPiLg3znkAAAA=
X-Change-ID: 20261117-lttng-modules_fix_new-14bba1ced326
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905502; l=3879;
 i=mikko.rapeli@linaro.org; s=20261117; h=from:subject:message-id;
 bh=AZk0kaXbyoytOhkO0HUOQUStW3Cr7dk1az8kHCeWFC0=;
 b=dM+WmlCpBJMkT5Ywi7AHvYQYipHK8kZ498TWV114aJOZYRXo2OnepxIDx1mNmtoagWH+2U8JQ
 TGmyGAyzl/GCKG8xrDFcIwFD8NU62aRQx3bRkdOg90ftSIeEJSCv5jB
X-Developer-Key: i=mikko.rapeli@linaro.org; a=ed25519;
 pk=O/vKh6bzDKoUD69mWlhfQ7Q15tHYZkbu91i+XwMsm/o=
X-Endpoint-Received: by B4 Relay for mikko.rapeli@linaro.org/20261117 with
 auth_id=1547
X-Original-From: Mikko Rapeli <mikko.rapeli@linaro.org>
Reply-To: mikko.rapeli@linaro.org
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 08:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250413

From: Mikko Rapeli <mikko.rapeli@linaro.org>

With upstream patch.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
Tested with genericarm64, linux-yocto-dev and kernel tree at
Linus master branch 7.4-rc3.
---
 ...x-splice-remove-pipe-buffer-stealing-v7.4.patch | 56 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb  |  1 +
 2 files changed, 57 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-splice-remove-pipe-buffer-stealing-v7.4.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-splice-remove-pipe-buffer-stealing-v7.4.patch
new file mode 100644
index 0000000000..14cf110904
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-splice-remove-pipe-buffer-stealing-v7.4.patch
@@ -0,0 +1,56 @@
+From a03326efb3ae2f3ebc6c8016535f34aa58b1623c Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 16 Nov 2026 08:54:42 -0500
+Subject: [PATCH] fix: splice: remove pipe buffer stealing (v7.4)
+
+See upstream commit:
+
+  commit 0f76da93e5c7d41ccf1376e715278c1d474ed181
+  Author: Kiryl Shutsemau (Meta) <kas@kernel.org>
+  Date:   Tue Nov 10 14:52:38 2026 +0000
+
+    splice: remove pipe buffer stealing
+
+    Nothing calls pipe_buf_try_steal() any more.  Remove ->try_steal() from
+    struct pipe_buf_operations, its implementations and the exported
+    generic_pipe_buf_try_steal().
+
+    PIPE_BUF_FLAG_LRU and PIPE_BUF_FLAG_GIFT were set only for stealing, and
+    go too.  page_cache_pipe_buf_release() did nothing but drop the page and
+    the LRU flag, so page cache and user page buffers use
+    generic_pipe_buf_release().
+
+    vmsplice() still accepts SPLICE_F_GIFT, and splice() SPLICE_F_MOVE.
+    Both were hints, and nothing acts on them now.
+
+Upstream-Status: Backport [24b630e62dfe3465ac9a2bb19c89fdd10f5bd1c7]
+
+Change-Id: Ie1d0bddc3aa7d1af186e195c712746c0d3b358c0
+Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ src/lib/ringbuffer/ring_buffer_splice.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/ringbuffer/ring_buffer_splice.c b/src/lib/ringbuffer/ring_buffer_splice.c
+index f34bc355..7e470cfc 100644
+--- a/src/lib/ringbuffer/ring_buffer_splice.c
++++ b/src/lib/ringbuffer/ring_buffer_splice.c
+@@ -47,7 +47,12 @@ static void lib_ring_buffer_pipe_buf_release(struct pipe_inode_info *pipe,
+ 	__free_page(pbuf->page);
+ }
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,8,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,4,0))
++static const struct pipe_buf_operations ring_buffer_pipe_buf_ops = {
++	.release = lib_ring_buffer_pipe_buf_release,
++	.get = generic_pipe_buf_get
++};
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,8,0))
+ static const struct pipe_buf_operations ring_buffer_pipe_buf_ops = {
+ 	.release = lib_ring_buffer_pipe_buf_release,
+ 	.try_steal = generic_pipe_buf_try_steal,
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb
index bc1d50a8b3..1d4dba73f7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb
@@ -16,6 +16,7 @@ inherit upstream-stable-release-point
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-fix-splice-remove-pipe-buffer-stealing-v7.4.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream

---
base-commit: 34991d0ce3cc5f38dd29e824af7579512d2b917e
change-id: 20261117-lttng-modules_fix_new-14bba1ced326

Best regards,
--  
Mikko Rapeli <mikko.rapeli@linaro.org>


