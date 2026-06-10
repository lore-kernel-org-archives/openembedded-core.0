Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4267DCD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 12:33:36 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19475.1781094807378279082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 05:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm2 header.b=SUa5mtIm;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=iAmRFN1H;
 spf=pass (domain: schnwalter.eu, ip: 202.12.124.153, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5B6B97A00D2;
	Wed, 10 Jun 2026 08:33:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 10 Jun 2026 08:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1781094806; x=
	1781181206; bh=C0KmYTjSanhcw0OGDnRh6dZHAfUdYjLXSfIPA7v/w8E=; b=S
	Ua5mtIm3BL954nvaccX6o5Z/EqM83m+o1xOZQcPzT3BN6J83EBrmNf6IIvNooMJJ
	+sUVg8IdUF0MeAB7Qbs6UgFPYYcNOoL2RaP8U2y1NFRuogUjA1AfB4/eVc/ZkQT5
	L4oHQzjtm0uwqvBd8lAwQObJ8bDeHucXVpq73+xjaImLDe5DDG9glIRUoehYmxeW
	dDayc60iE44XWkD7+252JnbDoOGzWDuIB976uTvoFp/l9Dd1SFgq8GPIcNOnufHK
	gNtUB9ziXVHY0HARQ6LimD0Kao7T24gudfOSJ8FBgD8XCTq+CAAwYwSme5Z6VUpr
	m4Ej7BhitbVQTvp8+fRbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781094806; x=1781181206; bh=C0KmYTjSanhcw0OGDnRh6dZHAfUd
	YjLXSfIPA7v/w8E=; b=iAmRFN1HdklSEhNvVBPZz4+1IfrqdXiWD6DsdV76GVGB
	9BRLGRMUz1T4x4DGt6OllnpGBH1bLZzrfZUkFVl4OhZ4HB2KYlqDl//4JFZD5Qnn
	PBwzmSea6tBr0+NJahma4cLomSvI45souW315i8gpGcBBxS7ovjQcgnkAMqk4yXe
	gygjd3v12ySA+O/6/F7spNHtjFpdZLg02wEgG6BZ3nFvLeHB+0ZGlbHwKSOq/Jkn
	44F/hSeMQO5CYejLb9ex09FI0ROBoPMTkHv9LWxC04BYRxsqful4CeLwHgKv8Ywr
	93rnwJ9cAT/ibeQrEzenkuE7RoqChLmQKSK8pRcmDg==
X-ME-Sender: <xms:lVkpajL-rf1CC1HomXgBTPTGWfub6oe5LtHr_9fWltB2PwhBajYPfA>
    <xme:lVkpauLnvGqy5i11djWzA99ziEQgVmEAfzs-3ug9O6ugs3fKGP0s06JNbzzulaDYk
    oDzXWawH8qGnad2m3upUsLSd899qQZ2dwOc-OzZKg0d0cAUOwcysOM>
X-ME-Received: <xmr:lVkpagvVBVmMGFed3Rz9vWHZQKMbaGEs2l8lg3vBWenXtbvpTazxC31XDIiBjkt7Dc3WVw>
X-ME-Proxy-Cause: dmFkZTESoYrgX+e6hFu9dLjhELTIyAUmM6Vs5pUaejoqiAeMB9hF69qlL2lGfm2lHG2jCR
    g6cSFbsjmML2aIcng1r5nic1dVmfcqZ2TdT8AMuYfYFOjeJmtLr1NG6Q0Xa/WQmkbrn5Ie
    Vo852yrSzAqmxzPTQTrK46shT2UQ15FfM1+xcvfoswDiMq5xC2fLNy5NP9aDgQA+23NTzR
    HWUcP20gN7TE+U9E5hPXCFl6ydVxkVbY//nIQbwHdDgAjr58QZu0Dzor8ucpy5akoj3gUW
    5jDtQUz2z7+xPaGB9NUoVyPPJZgoEt4oglDK81q2Sg1/x32HpYD8c1Ec41mv8V20PaxGIt
    sUtsEPEvBbDBV+MckE2sSeTjeuYLYS/wTywpqyqwjNOznpdJvnQDK2aTW1pq8jwXevNKv1
    s+kzoIXVoxywzubh8tJQZdy/X5ZD7FviSw/Heqajh9a1oeUpIT9bglWuXkHCKDjr7X/GIW
    NmZoSdbhwb3osKdGaFeU+3PxcmOMlzk8U2adWnC8LvBt1Qo3ntG/QPgmEv2W/TAZc+IJgz
    WgtfFXBO9t1bXpSUKKFUGwccszn30te0KaZ5GHYu47ZiSdndEHvTqxZpV38rjdlKJ/Nk74
    2FtISOpb2xlNquTPHDljGYIe1ZYjZ37cXw4X+5aNOWHs+Q0Sdd/bZAzPsNNg
X-ME-Proxy: <xmx:lVkparSlJ-5nYriUC3aZkXbjq89G0JoJGqRXlPAywwkkwQ8Ff-c2Bg>
    <xmx:lVkpamN78oyCqCbqjoj6FNI5yszwIO_XThQpVEuy0hWW92h08EVP0A>
    <xmx:lVkpagbJ88Xzii65vzhc1pthNGb3tTptWSyR_G5usgZGCK-7VbSJHQ>
    <xmx:lVkpagwP21yyja0dIU1FCXm6mfDhWIse-XDF4GezEIgQtjyI1WaR9g>
    <xmx:llkpai9EnAWWLCvCHcBWgpvUQn40Up2Tnn_433uo3BifDJRaSoOU6XKy>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 08:33:24 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Wed, 10 Jun 2026 15:33:09 +0300
Subject: [PATCH] meson: remove -mcpu from bindgen_clang_arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-fix-rust-bindgen-for-big-little-arch-v1-1-c3146ce76ea2@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBBFryKz7kAUq+JVShdRf+KAxDKJpSDe3
 aG79xbv/5MyVJBprE5SfCXLnkzqR0Xz6lMEy2JOjWs617mWg/xYj1x4krREJA67GkfepJQN7HV
 euR/QPjEEBF+TTX0U1v1vXu/rugGp+aJQdgAAAA==
X-Change-ID: 20260604-fix-rust-bindgen-for-big-little-arch-78e45e8fefa1
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781094804; l=2225;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=nNDJMTjSe8ZHemvIr+b4CIm2hEIIRVEtlFrrerdm8bo=;
 b=QAD97fbmszu6Z0QF6momdfHgvum/VR8KSlXHkOT9G88KfSM/1DuZ2z/rVWoGLOBR25TO2G5X1
 KwWM9QQzYdxBcOmfwZf0gUuVQe+KhgfB3Qykybp3UuWgQGjNA/MRedl
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 12:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238356

bindgen uses libclang to parse target headers, so the arguments passed in
bindgen_clang_arguments must be valid clang arguments. Some GCC toolchains
emit -mcpu values for big.LITTLE Arm CPUs that clang/llvm does not support,
which breaks recipes using bindgen, for example Mesa with Rusticl enabled.

The -mcpu option only selects CPU-specific tuning/code generation and is not
required when generating Rust bindings. The target triple is sufficient for
clang to select the correct target ABI and parse the headers.

Drop -mcpu from the bindgen arguments and rely on the target triple instead.

Note that the target attribute depends on the system beeing built for,
it is either the host system, the target system or the SDK system.

Fixes: a647a0ff4c4e ("meson: correct bindgen_clang_argments")
Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
 meta/classes-recipe/meson.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 9bed293603..d99a93e7d4 100644
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
     items = d.expand(args).split()
+    # Use the LLVM Linux target triple for all toolchains instead of -mcpu.
+    # Note: The big.LITTLE CPU architectures are not supported by llvm/clang.
+    items = [item for item in items if not item.startswith('-mcpu')]
     return repr(items[0] if len(items) == 1 else items)
 
 addtask write_config before do_configure

---
base-commit: 1e86aa039108621b2af734ef358a1e9d3c4d88d8
change-id: 20260604-fix-rust-bindgen-for-big-little-arch-78e45e8fefa1

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


