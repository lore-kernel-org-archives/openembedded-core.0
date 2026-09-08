Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82114C79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:39:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8867.1788877933079250352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 07:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=SsQ2rOos;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+jonas.juffinger.liebherr.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6E714177A;
	Tue,  8 Sep 2026 14:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87CF8C2BCB8;
	Tue,  8 Sep 2026 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788877932;
	bh=HQsjOv+KXxI2G7JwC68GWqvxH4EjtzfCdsq/1/ywn3U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SsQ2rOos/OQFBGSW0YaS7FYLd2TMhsBiOpJG9BLyRGX/2LXTwM/AsXW+k7kzjgs2Z
	 bjYyUjaTiKxda3+aaovzwgSodKvANTHnMqFV1HktBwURc6wBR2yhNU7x57RBp8fXgd
	 fYm7wa3SZhdPzpY+daNUfIVVNel2zNXGZCkotgK791PR6N7tYiKRyhsywzfM5kjcLu
	 6UdtFTatZknxVERaQi/Y+37UAAfe273RNfKm20CJJiN3jS2LQODRDNc+zpKS+SsnVS
	 7Qgu95CFQAisS/gDvUE62oJHPqzkxqY7melA1Kpt4HGvxZ5v6ipYcb6RUvyNQCbirV
	 onyTXf0AOR9Wg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74314C79F82;
	Tue,  8 Sep 2026 14:32:12 +0000 (UTC)
From: "Jonas Juffinger via B4 Relay" <jonas.juffinger@liebherr.com>
Date: Tue, 08 Sep 2026 16:32:07 +0200
Subject: [PATCH RESEND] kernel-fit-image: Skip sign key check for PKCS #11 URI
MIME-Version: 1.0
Message-Id: <20260908-bugfix-run_mkimage_sign_pkcs11_support-v1-1-f10d19f1daa4@liebherr.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonas Juffinger <jonas.juffinger@liebherr.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788877931; l=2079;
 i=jonas.juffinger@liebherr.com; s=20260615; h=from:subject:message-id;
 bh=64TTPyeT/WKSI9SQsD72c8pXRB7TuV60zpFV/nppFYg=;
 b=Yw3Zc3XdkcwJHEQ8kdeDvsfioe+SfiS3kK6Oqyt5VNQ+WeY3DZ1QuqloY/NOMxLgKkzdJEk1t
 0Cl8Gn+nT6QDwxq8DeZe+wnPA6Hs9fgNUbbKfFxOrciyi9/dyP7aqe/
X-Developer-Key: i=jonas.juffinger@liebherr.com; a=ed25519;
 pk=57Vzs2aKTP3E7TDrBuZMQibGR+Koattc4oIhiMOs3FI=
X-Endpoint-Received: by B4 Relay for jonas.juffinger@liebherr.com/20260615
 with auth_id=821
X-Original-From: Jonas Juffinger <jonas.juffinger@liebherr.com>
Reply-To: jonas.juffinger@liebherr.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245369

From: Jonas Juffinger <jonas.juffinger@liebherr.com>

The run_mkimage_sign function checks if the required keys exist
in the keydir because mkimage does not return with an error if
the keys do not exist. This check fails if the keydir is a PKCS
 #11 URI.

This patch skips the check if the keydir is a PKCS #11 URI by
checking if it starts with "pkcs11:".

Signed-off-by: Jonas Juffinger <jonas.juffinger@liebherr.com>
---
 meta/lib/oe/fitimage.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index d4dacdd508..195edbb8e3 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -601,12 +601,14 @@ class ItsNodeRootKernel(ItsNode):
             bb.debug(1, "FIT image signing is disabled. Skipping signing.")
             return
 
-        # Some sanity checks because mkimage exits with 0 also without needed keys
-        sign_key_path = os.path.join(self._sign_keydir, self._sign_keyname_conf)
-        self._check_sign_key_files(sign_key_path, self._sign_algo)
-        if self._sign_individual:
-            sign_key_img_path = os.path.join(self._sign_keydir, self._sign_keyname_img)
-            self._check_sign_key_files(sign_key_img_path, self._sign_algo)
+        # Some sanity checks because mkimage exits with 0 also without needed keys.
+        # If the keydir is a PKCS#11 URI, skip this check.
+        if not self._sign_keydir.startswith('pkcs11:'):
+            sign_key_path = os.path.join(self._sign_keydir, self._sign_keyname_conf)
+            self._check_sign_key_files(sign_key_path, self._sign_algo)
+            if self._sign_individual:
+                sign_key_img_path = os.path.join(self._sign_keydir, self._sign_keyname_img)
+                self._check_sign_key_files(sign_key_img_path, self._sign_algo)
 
         cmd = [
             self._mkimage_sign,

---
base-commit: 6f7a806ece411ab32e4b1c08a0299400bdf3b588
change-id: 20260819-bugfix-run_mkimage_sign_pkcs11_support-3f7bfec9ef80

Best regards,
-- 
Jonas Juffinger <jonas.juffinger@liebherr.com>



