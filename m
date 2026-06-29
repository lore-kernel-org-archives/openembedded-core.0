Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4244CC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 21:42:03 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8298.1782769317626672658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 14:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm2 header.b=RKEvoAvO;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=gviixnHR;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.156, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AA109140013A;
	Mon, 29 Jun 2026 17:41:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 29 Jun 2026 17:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1782769316; x=
	1782855716; bh=wi/wYBQDJYCnPBtyulJrLS6VshBwaNSr/tdav2d9lkE=; b=R
	KEvoAvOhuJmc0bf3fEPmlFOQAq3J2eR/cVFiHYC9onwJMhigoXCHAmL2rcU3NMIV
	Wv0eS3lqjKY0SbU/K+JlN29WQ6YbonFp0xqAVcgpQEL8kQtWmEciUEAEGKFH9R8C
	lFDtyRJTlWVpIAvhD0QZYn+oWVOO36MmIGmzIChFgOfzraITq9iZl/4aag8mf+lb
	7dg+5xJsrao4Qw++6PUKyZTIUXd9QzhO3uIQLDV00uO1nxQaPav0JaIVQqk96wXK
	5AMJy22N9d8U6xhIMmEY6GGia9Z2a91n+O8J2V0MAta3zYkSaWa4OflpYTEAnT+U
	81V2j/7idNZAzO4gj/jPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1782769316; x=1782855716; bh=wi/wYBQDJYCnPBtyulJrLS6VshBw
	aNSr/tdav2d9lkE=; b=gviixnHRO59hOA7d11EgcUbCDa4tzCfbK1jcrf79R/tG
	lU+TI/BQZ0fwMnOReCM8XRZXyOk5L2dSMJrQo435BnqNyglien/aaBQP1zBF+3gf
	yCZYgIqRAcWWD2E2LVoRqUmwTU3mSdTU8ZjRNGWTdSE5far+RVk3hAWkTqbar2+1
	oQwkNsvNWxUN+BMzn5SOu17DcfNNJ4zuqNJ4APfjZunW+YgOaz/jttcw8UrPQyb2
	spD8eCZXPldacHu2wnObt72j/h1D/3VoH4p/xdM1ZC9CMI2e6y5P5KWZXcTScpHy
	gS+ZQ0wGjVp7zCepjU5MAyxRWfrb9LB50ivhU338vw==
X-ME-Sender: <xms:pOZCaldERxd1qtadcFIDY69T16eEfIA8TaHysHNvQg9CiI0Pea2qSA>
    <xme:pOZCam6EY1pO1iOXhRch9lbs2iwfeN0gV-1eSoNax3AcgPfUtXBu8BWo3Lyu6UsSf
    R959RfOinsQP7SroyH9eA3VO97hbSNjvH2-h9bVolJnkXE67H4>
X-ME-Received: <xmr:pOZCaoWRhackMkD4vP1apVhOktqrM3pIYakNykqklQ7hzU5nn5w-ytxjQ-jWPMo>
X-ME-Proxy-Cause: dmFkZTEyZeexhPn1Gf5uHrIPut7zciX1HWhKd1fAh3/APP3CWLX44Ic8zelbe0LTSYd4dP
    qSt8/kmjolLCSRoX+XluvC+AYQJ0V2Yk796tRXkubi5NVIzlAzwp2Srr557Ffhhe3IcspN
    KbtuIgi3ZxJhFfDLzu6fH6CiDGUjblNfzQHYkxFzDdRH6SwKMge1x4MyJW3qeTgSRB8MaQ
    JPIs1DDa2iAqjsufou+wtl5b3XZ14nMMKNQxguHNMJDzxjHWZvKTS8weTp8eE7B3B416vB
    4tW/BmbhlP2O/QrAU2GSVAdu43e7vDncwrlPMdzjlF2u/2btwwRh1JbiOnmm92n5Aow8S4
    JrpXd/zoUDTZay0VbcdM0jvkGQRPPVMwEfiLhZmC6p8oqvPrBoTTv5DDnPf6DefWKBduQA
    /FH6LuV6EHX2ZJKn29UJR8wwLInDmT7Pp6U9mgVp5+9Ik7PwbH8vJAtEksJLG1dRRfNQ9m
    EfZWbQ3tgu2XAXt5LEZt8yM3kcqXvTz3HR7EKNdhNhPryBrB013FcgpGb1Z8zjvNg3dnZY
    Pch7GELsXXzm8AfoikLMQSNp7WcmKCTs2OTVlqC3dR4918/5zu/a5MC3hAGn8579mYc6aS
    U66Xt0Ye8bQRtvh+CboTrB63XeFXMTGlK6Cy/7+3wXZfQIRnWUS6YMEijr2g
X-ME-Proxy: <xmx:pOZCal7jJbUK0964x1q7UDO7jCkoFb4mso59tkJfb-ya-vTRR8OAdg>
    <xmx:pOZCajoShrBu5HCRBsO4Job_oNeR08KFhpIBD-9CjbxWpt4QLRJerw>
    <xmx:pOZCaon9HUbhNK9jY5Aq43jKo8IG0AkUzBd2YNifX2_MEVOdrNKunw>
    <xmx:pOZCavN_4mIAxAejGjIyVx7nFpr5F3MdaiXFOYF1CciLUL3VUkgrSw>
    <xmx:pOZCalP9vmR2pFQsuu-jeCUMUGumgy5IYBPkNmXbdOX6eWwU4eOw-Ext>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jun 2026 17:41:54 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Tue, 30 Jun 2026 00:41:46 +0300
Subject: [PATCH v2] meson: Apply clang specific OVERRIDES for bindgen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-rust-bindgen-for-big-little-arch-v2-1-e6262b34d069@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAJnmQmoC/42NQQ6CMBBFr0K6dkwp2Ior72FY1HaASUgx04Iaw
 t2txAO4++8n/79VRGTCKC7FKhgXijSFDOpQCDfY0COQzyyUVFpqWUNHL+A5JrhT8D0G6CbOuYe
 RUhoRLLsBqtqcz1JrV1sU+erBmHe75tZmHiimid+7dSm/7U+gmv8ESwklmM54I13jT011jW4IT
 zsm5CPOot227QO9/2II3AAAAA==
X-Change-ID: 20260604-fix-rust-bindgen-for-big-little-arch-34788066c4ae
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782769314; l=2205;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=JevdaXnQpMFYjbGLmWbZ9ai4+6f/cHyr8+HtkFx1d20=;
 b=z19KDrO7SLY3oRgN3+LghKoHpvkeNjlXU5lIeneg1Aum1yNzkMGiz4kpW+49GN1OeQ9f9ilTy
 UlalUagxqI6BQd28A5IaxrJzia6UHL7f4tZb6izTqkSbqO2dahATgoX
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 21:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239827

The Rust bindgen uses libclang to parse target headers, so the arguments
passed to bindgen_clang_arguments must be valid clang arguments.

Changing TCOVERRIDE to toolchain-clang applies various fixes to those
arguments, including big.LITTLE architecture values fix for -mcpu.

Note that the target attribute depends on the system beeing built for,
it is either the host system, the target system or the SDK system.

Fixes: a647a0ff4c4e ("meson: correct bindgen_clang_argments")
Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
I'm testing in a different repo clone, so I botched the code before
sending to the mailing list.

Changes in v2:
- Fixed new line escape.
- Link to v1: https://lore.kernel.org/r/20260629-fix-rust-bindgen-for-big-little-arch-v1-1-7f7d70c9d593@schnwalter.eu
---
 meta/classes-recipe/meson.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 9bed293603..238c418e26 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -59,11 +59,15 @@ def rust_tool(d, target_var):
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
+    localdata = d.createCopy()
+    localdata.setVar('TCOVERRIDE', 'toolchain-clang');
+    items = localdata.expand(args).split()
     return repr(items[0] if len(items) == 1 else items)
 
 addtask write_config before do_configure

---
base-commit: 4a72f62d32e3fd3a88c2b92671f6dd75ef35fc44
change-id: 20260604-fix-rust-bindgen-for-big-little-arch-34788066c4ae

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


