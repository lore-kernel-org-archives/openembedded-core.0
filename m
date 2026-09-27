Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC0BCA5FA8
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:56 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33581.1790495022531761895
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V41Qp6E8;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so1807952f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495021; x=1791099821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lY6HYo6u5HEiyok9gJ4pBuUaJXvZPiTN5wt2jCTWDOY=;
        b=V41Qp6E86Md09woX0fUVTT1RL5hF2c5hlRO4xNWTK5mP1AYlvYEY/2MP4s0hYi+j/q
         Yh72i3B9LkGgcOZ9w1GeTiKjAt8yMIil9JKH7jrz4CPz9OVaZcRVSHTV7Dd6GsxENJ4A
         vxZL3CqliricOV9WM01y8Rtp2jk1er5gQC2jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495021; x=1791099821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lY6HYo6u5HEiyok9gJ4pBuUaJXvZPiTN5wt2jCTWDOY=;
        b=pXcOIm8NS+c5IdFnbV07Jwjlzk5c0BjxLJo8zJen4zeKMb1MCpc7R0h44HkvcaEzRJ
         r9j+Aux+z4F+LATmPtTUu1su049n9b17mWoi7XWQd+KJKK/zqsGy+B8x3/FMT5GUXvUc
         ERmZdD+6wGVCeQnUSkCu6ejrBOH9aoIBc9JDEawfnFovSJ/+Y3HmmybRR4/1f2iIh4FL
         nE3B68hDx/1q77BAkgm+eJqYb8U53axA2INC1vRAm4RCF62HtNznpszZsba8nk5+N1Hw
         IPhnvVgdZbzEInht6OlOSspfiVrmq+Xk8UqK0TLlGTyy6c/CzR0BiBfBKbSQAPOSQeAf
         zL9g==
X-Gm-Message-State: AFq9FYIRvU638vLa01U1UtyJtacyNAXl9EzSibIoB0/yIyv3yONGl1BW
	sMDnT6BRYhYkQq/+SuEUiZIs4ScOu1CgdSWQ1wTbW7zscTrAO3AU6EHGZDcw84lNp2xQnZprgNR
	vrISiHaU=
X-Gm-Gg: AYBFou0+dkuv6AlX9t7pO9BRV7f43/SOcLNwFhPxB//QypVFdWVRaAVQUWwSAihPKxM
	BCWC8iSPas7wGLJT7orVrjpR+4p5r8/i72cepeIjVP2t0toNATIa69CGnCLpf0eLhdveX+0fx7E
	7WfouSuVgx0vIwh8MfjgwoZRwfiHdUy+qCfPQEwb58+kq09NxIHUjQUM1Qyw9K3lZ4mN/Bjh+v0
	H1zm3IwYQj/e73z8A/yqB/RqyTfjvLkNuKKABPOs7EuCYl/FbJ6ePSL03yEMRCDdQRXZZIU9HZ1
	srujHl4ZSBsMwE210xJKOgmSH07IGokQQ6bH0YYq0gXuqBVC9/Is7HHPkKZfuTPCCao5T78W9gx
	jDKY3sa232zctfu/sdiULdo17h7MF0gCZ1ixu5Kkh71lZAo+JpBFTfZii4d1/zNE6A/tgRYB4UY
	iO99G7KUxzD8e6jTkFJds0Pu2qYA3kRuJESwwfoBOiWlRYGgpfc4aqKVJtebwj7d/GckKI490hh
	pU8ULPLovCZrmAmDcs967dlITZRfEhwmi4FLzBJmOCJeSeUyKUzXq20bB75+/+aMLDoZLRvoQ==
X-Received: by 2002:a5d:5c87:0:b0:488:7dc6:4ea with SMTP id ffacd0b85a97d-4887dc60806mr8387837f8f.10.1790495020777;
        Sun, 27 Sep 2026 00:43:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/28] kernel-fit-image: Don't add hash node when signing is enabled
Date: Sun, 27 Sep 2026 09:42:55 +0200
Message-ID: <9b41949a431661ad5c6e01955734c2d83fef732d.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246654

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
https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configurations

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/fitimage.py                  | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index d7e21171ab9..a1040181a23 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -480,7 +480,7 @@ class ItsNodeRootKernel(ItsNode):
             f"{default_flag} {', '.join(conf_desc)}",
             opt_props=opt_props
         )
-        if self._hash_algo:
+        if self._hash_algo and not self._sign_enable:
             ItsNodeHash(
                 "hash-1",
                 conf_node,
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index b35dda6674a..84e21346abe 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -627,9 +627,10 @@ class KernelFitImageBase(FitImageTestCase):
             if uboot_sign_enable == "1" and fit_sign_individual == "1":
                 req_its_paths.append(['/', 'images', image, 'signature-1'])
         for configuration in configurations:
-            req_its_paths.append(['/', 'configurations', configuration, 'hash-1'])
             if uboot_sign_enable == "1":
                 req_its_paths.append(['/', 'configurations', configuration, 'signature-1'])
+            else:
+                req_its_paths.append(['/', 'configurations', configuration, 'hash-1'])
 
         not_req_its_paths = []
         for image in not_images:
@@ -792,14 +793,15 @@ class KernelFitImageBase(FitImageTestCase):
         # Add signing related properties if needed
         if uboot_sign_enable == "1":
             for section in req_sections:
-                req_sections[section]['Hash algo'] = fit_hash_alg
                 if section.startswith(bb_vars['FIT_CONF_PREFIX']):
-                    req_sections[section]['Hash value'] = "unavailable"
                     req_sections[section]['Sign algo'] = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
                     num_signatures += 1
                 elif fit_sign_individual == "1":
+                    req_sections[section]['Hash algo'] = fit_hash_alg
                     req_sections[section]['Sign algo'] = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_img_keyname)
                     num_signatures += 1
+                else:
+                    req_sections[section]['Hash algo'] = fit_hash_alg
         return (req_sections, num_signatures)
 
     def _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):

