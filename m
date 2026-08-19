Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF59C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:03:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2469.1787127969951334075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 01:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bpk9gEsS;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+jonas.juffinger.liebherr.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF9CA41A7F;
	Wed, 19 Aug 2026 08:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0E1AC19425;
	Wed, 19 Aug 2026 08:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787127968;
	bh=HQsjOv+KXxI2G7JwC68GWqvxH4EjtzfCdsq/1/ywn3U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bpk9gEsSclHMX5S+DU7ZpLeKPMxPSZpNoQD2aa757jZKGbLuBf3FcCK7mOY/Ulrj0
	 TM2V0l9xMlA+bJcd0pBoVvrxEY3SN5PKRYGeQjA/FmkBgTPLo2o5sKqWtBs9Oythhv
	 nb093YE1ZCK8d6DNormK9vtab98c8245Fj3R0UiQncV6d47873mNcJ9r2HCHfz+B2l
	 JmxZfWbJzKjGO5i6GfF5O3sB74omgE8X5ojAGL1whSsQeqvT4HNi8j4P6eZlDhJST9
	 W8gE+7yiVfIDCYocgbogrkOmkCOeEPTslbPrGirKzThq0ZYbbv0StcoAfLPEZxLsG7
	 Pfc8j6+IN11Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4D6C5DF6D;
	Wed, 19 Aug 2026 08:26:08 +0000 (UTC)
From: "Jonas Juffinger via B4 Relay" <jonas.juffinger@liebherr.com>
Date: Wed, 19 Aug 2026 10:26:05 +0200
Subject: [PATCH] kernel-fit-image: Skip sign key check for PKCS #11 URI
MIME-Version: 1.0
Message-Id: <20260819-bugfix-run_mkimage_sign_pkcs11_support-v1-1-363fbbf2ff66@liebherr.com>
X-B4-Tracking: v=1; b=H4sIAJxohWoC/x2NywqDMBAAf0X2bCCxUB+/IhI0buIixrDblIL47
 w0e5zAzFwgyocBQXcD4JaEzFjB1BW6bY0BFa2FodPPWnenVkoOnn+Ic7bHTMQe0QiHatDsxxkp
 O6eSPevl28eh69J2GEkuMRXtG43Tff+HfXfh4AAAA
To: openembedded-core@lists.openembedded.org
Cc: Jonas Juffinger <jonas.juffinger@liebherr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787127967; l=2079;
 i=jonas.juffinger@liebherr.com; s=20260615; h=from:subject:message-id;
 bh=64TTPyeT/WKSI9SQsD72c8pXRB7TuV60zpFV/nppFYg=;
 b=ZrD4GUCxg+aPulWcKgEG19Jg+iKRYHuWPQQsGmE13O28678bBVGuXCQ7hCVhZ80rGVX7Ts6YN
 s15w6dX5InFBvwTEXBuxe1G7dHWRM8PN2u4STC78xkGTDQKhPtQgHvJ
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
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 09:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243720

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



