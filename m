Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F188AC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 20:48:42 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7233.1782766121390251683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 13:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm2 header.b=bSn64OeN;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=VqH0ToKH;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.149, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 67461EC01E5;
	Mon, 29 Jun 2026 16:48:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 29 Jun 2026 16:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1782766120; x=
	1782852520; bh=p79Sg4AK3Z2jnZu4A2t1yemYS6xtctcaj3+73b8wijk=; b=b
	Sn64OeNIGM3/qsUVcCLELh1Ucjb+Eq8daEIdQLeH+DmA/TsKUGngS0ieNPQwo5E1
	Vc3R2a+BVyPG4p/b3rxMzU0n3q60eXxpHWv79Z37OT2+kWpqhNQEdrUKCfnLN+zH
	u+q0G+1A3oLhJuh0sGRVQrPf+l4o/tSgf11evPrkVSNBwzLramTRNoOIBHeWiY4q
	5bDMFXcAmzh7uj85a1AjcQKGrYSJXTOa4t2Ke6OKUm9HlMvm6Zade/3Deefhc4gt
	5kIQOc3i0SoC5qSHzbqTSitzkoOdWZYbJr8jOwbWfV9n5obIuFsbkTmvWWXE5j+v
	t0ztyuIj1Emkyl3Qg3/Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1782766120; x=1782852520; bh=p79Sg4AK3Z2jnZu4A2t1yemYS6xt
	ctcaj3+73b8wijk=; b=VqH0ToKHIfMDu2zgKPgGsx5YZAgkPyLjoPKBAz8O8ZoI
	Uu4e7xGzrcDzKZnIXRba9CG4Ub9dkKFfVrMTLRqkw4N7hiuFKxARwHA7A2cdkNkR
	ojsYNYOV1SQcqgOUhm9qS6sHol9l3ha908SQf+6OazFWphAo0daLmr2NAMqvKXzT
	Gmi3JfDG2vdPQp8//KGFxdm3twR+5Q83iZNxsou3XAXMRkb5P+KO8REmWyc4fOI8
	mhpIJBZrt3Nb47TGAtZcFVHnHrAb4gJPsrJIbes5w6N0l6et5LigMCrd7qbRVr4a
	9M/A4aU1/T7Sp60U0+QTfqVpXV32CVI5f58xJpqBAg==
X-ME-Sender: <xms:J9pCamR40UmyaBAdGCItBVVmzG7BRhGhSWEDdi-aChkhDSTka0XSsg>
    <xme:J9pCavdb-0sXUQlO37135osOL7yHVckHnOpDSG_m6tWJT6WpS7QgL_LPGDlOPvt2N
    Sk0LaCYtQfU2MVm38rHRPH7LCcxiLEhJdPi3yVCF-GWyzKbiPkLRg>
X-ME-Received: <xmr:J9pCatpsHXH_zQyA1bMttMT5O9TpLGCnK0goRmLxN8FeKL74EsDmPJzac8FRZZ8>
X-ME-Proxy-Cause: dmFkZTGDcTrpCjttAgZmWFC2jT4PNCCb+CWM+yLnYE7ydiT5L0emw9jiozUuglxNXzhhw1
    bVtIT/CE/LBHbDanETdfRxcQObrBnYn52AS0//I+hyJSMpPlRLTaUoPDcw4BQ6yaH56nPR
    uknTGtOf3k/gWIt8uSgCvFl5x85ImQA7dpxJQe9bSxsvKyeZpumhYPSp7ZfD8wY1JVDhtH
    U/nqPaI6+/xf4UlLB0GLIqCcOcW8SNYn72uqHP/viiJ3zm/8NzHLh4Q/hQNzKVZyAN8Ssn
    C/WNnxnZ/OItvPCFKOACtTd+YVVpaSb3PrOX7rxbMQR8OaeOgRs9PsUJy3QsFMk8143dkd
    KGKj2g/+yoPkLJWK9Q7tv2wP8si9P1xoHcQWzGrjxoJN9TbKL2oJ0YNB6of2IU7xHYKVd1
    iXhMB2HDpdMSyV0i/jqsxTTYUtJ2PLV+Qf+N5QwJpNLoU4bFMIyfTwQyfOBt2qgTDm51CU
    LvBTNhNAXIVWc+GOhW8Ew3ZQSDLWHzgsO3KY33SxS/+TM463pkVW0Wu3ktDrnjX9RiqVrs
    R1G8vZ9bJshNLzqTM+16XdTXrH+SoTdTsrcJjdZBi5kDGfdCrBjEh6NOpcCvrBKMwB0zR9
    bAFW4d9/xui3EwFF4SGSa7NvQhrGYimad3ydV1WvGseLMaVybxE4PMV5tK0w
X-ME-Proxy: <xmx:J9pCao-kOOKZs1-PLVt9R8HvvKRgB76YxgfyybwbxoluipT2MMfOog>
    <xmx:J9pCahdaQFJSKLu3TmZg-RuR7Q2Y_j84PNYbdX4_W1rp8YiK2yn98w>
    <xmx:J9pCaqIku2TtnUEajOt3kY8L7B6cI9t55nR9hxVa5_an2fl6xZVFeg>
    <xmx:J9pCapib-FUYUmZ_0uQGpxB6e7DkGWya5dQ6ghj_o2VHrv6bZp9b5w>
    <xmx:KNpCamydnSWmNB5r0ocUqS97q5hxPFAFXZihHx8ievlmk0g0RJ8G0vod>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jun 2026 16:48:38 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Mon, 29 Jun 2026 23:48:25 +0300
Subject: [PATCH] meson: Apply clang specific OVERRIDES for bindgen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-fix-rust-bindgen-for-big-little-arch-v1-1-7f7d70c9d593@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIABjaQmoC/x2NQQqEMAxFryJZT6BqqeJVZBa1xhqQKmlnEMS7G
 9y9t3j/X5BJmDIM1QVCf868J5X6U0FYfYqEPKtDYxpnnLG48InyywUnTnOkhMsuyhE3LmUj9BJ
 WbG3X98a5YD2BTh1C2r034/e+H9k3H9R2AAAA
X-Change-ID: 20260604-fix-rust-bindgen-for-big-little-arch-34788066c4ae
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782766118; l=1936;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=u3FlakQzP0nfKUxMg5g24+GSS8DSWeN82xaNQob0no0=;
 b=y0V1JXwHLouyCeBDXYC9YZ02LcVbjac9Y7hq86PMUIED6NjyM+3tLBEPMDHeepF9vjOobrLiv
 hWyiCFsihC4CdAnawxL7dQ2un+82yTPY2SeWSw2g0ig3dWiBZV81YMo
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 20:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239826

The Rust bindgen uses libclang to parse target headers, so the arguments
passed to bindgen_clang_arguments must be valid clang arguments.

Changing TCOVERRIDE to toolchain-clang applies various fixes to those
arguments, including big.LITTLE architecture values fix for -mcpu.

Note that the target attribute depends on the system beeing built for,
it is either the host system, the target system or the SDK system.

Fixes: a647a0ff4c4e ("meson: correct bindgen_clang_argments")
Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
 meta/classes-recipe/meson.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 9bed293603..8a37aa45ed 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -59,11 +59,14 @@ def rust_tool(d, target_var):
     return "rust = %s" % repr(cmd)
 
 def bindgen_args(d):
-    args = '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}'
+    args = '${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} --target=${HOST_SYS}'
     # For SDK packages TOOLCHAIN_OPTIONS don't contain full sysroot path
     if bb.data.inherits_class("nativesdk", d):
         args += ' --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}${prefix_nativesdk}'
-    items = d.expand(args).split()
+    # Rust bindgen uses libclang under the hood. Apply variable overrides for
+    # clang; Fixes big.LITTLE -mcpu values.
+    localdata = d.createCopy()\n    localdata.setVar('TCOVERRIDE', 'toolchain-clang');
+    items = localdata.expand(args).split()
     return repr(items[0] if len(items) == 1 else items)
 
 addtask write_config before do_configure

---
base-commit: 4a72f62d32e3fd3a88c2b92671f6dd75ef35fc44
change-id: 20260604-fix-rust-bindgen-for-big-little-arch-34788066c4ae

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


