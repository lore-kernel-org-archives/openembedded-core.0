Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13158.1795772141085148907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=Q7P5KQI0;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+paul.pbarker.dev@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E26644717;
	Fri, 27 Nov 2026 09:35:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795772140;
	b=PKxHNKoxarJ9qGIATTXDMlceDBq5N4oDO3TfA43+5ech1lLhKsO6ED+HiOh483oHLYHW
	 SlcGm9qsG4NB6Vn8fnrAgZzI1Jkv6OW6ib9RHd4I9XLNeRE913Mk60zIRgMSweGpN7mYt
	 mJCXLPth5X3XF/ejpYfqwJEXpMovvi3P3Mo0S2PadKudyBZqGT3XFSfQc7hiCR/DQbwVn
	 SKJPc9GlxZnjA7YHpZrvxIYLHVSdHagHbbfgQVnlDrDB8xMvN87zT/ddkuk6ziQ8yDMkO
	 cQQpPyb62+UdA1k/qZ1yBNMVD0/fBBEMlzS4qskwnZsEsQPFNg5lyG+roCM7lEXN7Fw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795772140;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8AwRX1ZLKwh3r/wu3job9mJ2Ezmg97RbN0+houRbSYo=;
	b=2UZrWIiRUmZvgbCnVNbKtdER7EEa0GNPj5lSXVB/Rf2IhncKFyAgX5BwiQSByhamz+2/
	 dQlr+SFxdkjkGYJvcHldtN3K44IoJllwY6uaV1pt9p7ooPFRlymsfXLc8deBk36INO+9g
	 PjYK+kA0WxDKbqU/05Yevx9tjH2y9FlEsVgQUaaS+XB1IhQ28jFFcobDaQAA2lL90ebsz
	 QISk9dBiyt1WcrtzlsMsLpJLjSqWgPDQ/Em1taU2W93FWrGaxtm/3xxGBaKVnx5X/RXLj
	 815jqhELgc00ykJxwR5kwBENrhOzhsSa0wU1etXxvQCZFLoR0a4Mz7qBL8/Fe03U/XA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EE701F00899;
	Fri, 27 Nov 2026 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772140;
	bh=8AwRX1ZLKwh3r/wu3job9mJ2Ezmg97RbN0+houRbSYo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Q7P5KQI0TlTVjch4MSV5krhOUHAiBTeEhlI8GBm5uiRPbVZVCFGX+fBi+fXNWywg6
	 eR1ohwwQQwl2TRO9pFwHIKQH+rbS9p9PCVBsr8gp2WVhWJ0BzSn75+0q4ag6FBIMQt
	 meU0p16Z6wGXJ191q5vc72esxJYhaVblhbiu5BMDky/Suka4dRI7gic7ty1orZL+h5
	 Omm8NxRtbkneuQxFUekFDXTQF13m/Y6cVYgowt3QPKg2+RuK4d6+zUR7euwoj39KcZ
	 yCnrC53Q7V0s0up+Km0w+FqYgaAWamY/B5ZUDx+fsIKCir/G/GUm2HMYIGN5rhlfVN
	 iCvUtdB10Vhtg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 97AFD4B691;
	Fri, 27 Nov 2026 09:35:29 +0000 (UTC)
From: Paul Barker via B4 Relay <devnull+paul.pbarker.dev@kernel.org>
Date: Fri, 27 Nov 2026 09:35:17 +0000
Subject: [PATCH] Revert "oeqa: selftest: signing: Fix use of gnupg-native
 sysroot"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-revert-v1-1-27e7fff6c17a@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIANROCWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNzXaCi1KISXQsDA0MzQ6NkE4u0RCWg4oKi1LTMCrBB0bEQfnFpUlZ
 qcglIt1JtLQAtfv2+agAAAA==
X-Change-ID: 20261127-revert-8001612c48fa
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795772129; l=2588;
 i=paul@pbarker.dev; s=20261127; h=from:subject:message-id;
 bh=21sPu30c4Lw69OmhHcZFv7CMjRjiCodWQi/tO/5H/WA=;
 b=EKKjVqCAaW2cI/BvSEfA//yJuCqiUzBTbLhoV3od5nslk5pQlZ2hvoYdKZe/s5Y3+L/nwOqNY
 x5qA+r/2fPNC086rkaL16t2LDURQMo+zUnHWEyQ2nxAxnY9AKvJ4nUK
X-Developer-Key: i=paul@pbarker.dev; a=ed25519;
 pk=WqW1DI8ojKsslrA2FOhJuBZUdddRnjQP2xjPNaop5PU=
X-Endpoint-Received: by B4 Relay for paul@pbarker.dev/20261127 with
 auth_id=1665
X-Original-From: Paul Barker <paul@pbarker.dev>
Reply-To: paul@pbarker.dev
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251367

From: Paul Barker <paul@pbarker.dev>

This reverts commit 89daeb7edf0bbc76bdde40ba0381ad75d242945f.

We can't use the native_sysroot argument of runCmd() to run gpg here
because we are within a self.create_new_builddir() context block. i.e.
we are in a different build environment to the one where gnupg-native
was built and so its sysroot doesn't exist in this build environment.

Modification of os.environ in a test case should actually be safe, there
are several other test cases which do this.

This should fix [YOCTO #16483].

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/selftest/cases/signing.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 6269536d1d61..e36a5cd0f671 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -37,7 +37,7 @@ class Signing(OESelftestTestCase):
             f.write("auto-expand-secmem\n")
 
         runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
-        return nsysroot
+        return nsysroot + get_bb_var("bindir_native")
 
 
     @contextmanager
@@ -158,6 +158,7 @@ class Signing(OESelftestTestCase):
 
         with self.create_new_builddir(os.environ['BUILDDIR'], builddir):
 
+            os.environ["PATH"] = nsysroot + ":" + os.environ["PATH"]
             self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
             self.add_command_to_tearDown('rm -rf %s' % sstatedir)
             self.add_command_to_tearDown('rm -rf %s' % builddir)
@@ -171,7 +172,7 @@ class Signing(OESelftestTestCase):
             self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
             self.assertEqual(len(recipe_archive), 1, 'Failed to find .tar.zst file.')
 
-            ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_archive[0]), native_sysroot=nsysroot)
+            ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_archive[0]))
             # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
             # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
             self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')

---
base-commit: 39019629a4ad25557f120ec98305a4a2ad6a8558
change-id: 20261127-revert-8001612c48fa

Best regards,
--  
Paul Barker <paul@pbarker.dev>


