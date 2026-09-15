Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCD9C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 16:18:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.720.1789489089641530635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 09:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A54340C79;
	Tue, 15 Sep 2026 16:18:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bx8yoE5EtSwT; Tue, 15 Sep 2026 16:18:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D26C940BA9;
	Tue, 15 Sep 2026 16:18:02 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id B92B3174ABC;
	Tue, 15 Sep 2026 12:18:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Jonas Juffinger <jonas.juffinger@liebherr.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [wrynose][PATCH] kernel-fit-image: Don't add hash node when signing is enabled
Date: Tue, 15 Sep 2026 12:16:45 -0400
Message-Id: <20260915161645.45456-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 16:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245862

From: Jonas Juffinger <jonas.juffinger@liebherr.com>

When fit image signing is enabled, mkimage does not fill
the configuration hash node even if it is present. This causes
the verification to fail in U-Boot with a "Bad Data Hash" error
because the hash node exists but is empty.

This patch adds a check to only add the configuration hash node
if signing is not enabled and fixes the respective test cases.

The example FIT from the official documentation also shows
the configuration field with only the signature, without the
hash field:
https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configu=
rations

To further ensure that this change is valid, I also checked
the U-Boot source for the hash and signature generation code:
https://github.com/u-boot/u-boot/blob/main/tools/image-host.c#L1593
The function fit_config_add_verification_data only adds the
signature and no hash. Compare with fit_image_add_verification_data
which adds both.

Signed-off-by: Jonas Juffinger <jonas.juffinger@liebherr.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7346ffe190482ee4932728ba8d8741be8bed1d5b)
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta/lib/oe/fitimage.py                  | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index d7e21171ab..a1040181a2 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -480,7 +480,7 @@ class ItsNodeRootKernel(ItsNode):
             f"{default_flag} {', '.join(conf_desc)}",
             opt_props=3Dopt_props
         )
-        if self._hash_algo:
+        if self._hash_algo and not self._sign_enable:
             ItsNodeHash(
                 "hash-1",
                 conf_node,
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/sel=
ftest/cases/fitimage.py
index b35dda6674..84e21346ab 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -627,9 +627,10 @@ class KernelFitImageBase(FitImageTestCase):
             if uboot_sign_enable =3D=3D "1" and fit_sign_individual =3D=3D=
 "1":
                 req_its_paths.append(['/', 'images', image, 'signature-1=
'])
         for configuration in configurations:
-            req_its_paths.append(['/', 'configurations', configuration, =
'hash-1'])
             if uboot_sign_enable =3D=3D "1":
                 req_its_paths.append(['/', 'configurations', configurati=
on, 'signature-1'])
+            else:
+                req_its_paths.append(['/', 'configurations', configurati=
on, 'hash-1'])
=20
         not_req_its_paths =3D []
         for image in not_images:
@@ -792,14 +793,15 @@ class KernelFitImageBase(FitImageTestCase):
         # Add signing related properties if needed
         if uboot_sign_enable =3D=3D "1":
             for section in req_sections:
-                req_sections[section]['Hash algo'] =3D fit_hash_alg
                 if section.startswith(bb_vars['FIT_CONF_PREFIX']):
-                    req_sections[section]['Hash value'] =3D "unavailable=
"
                     req_sections[section]['Sign algo'] =3D "%s,%s:%s" % =
(fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
                     num_signatures +=3D 1
                 elif fit_sign_individual =3D=3D "1":
+                    req_sections[section]['Hash algo'] =3D fit_hash_alg
                     req_sections[section]['Sign algo'] =3D "%s,%s:%s" % =
(fit_hash_alg, fit_sign_alg, uboot_sign_img_keyname)
                     num_signatures +=3D 1
+                else:
+                    req_sections[section]['Hash algo'] =3D fit_hash_alg
         return (req_sections, num_signatures)
=20
     def _check_signing(self, bb_vars, sections, num_signatures, uboot_to=
ols_bindir, fitimage_path):
--=20
2.35.3


