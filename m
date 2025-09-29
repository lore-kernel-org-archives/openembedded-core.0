Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64095CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 07:31:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.48217.1759131109920193708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 00:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=M0ZDZG67;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B90AC8EC65
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 07:31:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9ED88606AE;
	Mon, 29 Sep 2025 07:31:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5702102F183C;
	Mon, 29 Sep 2025 09:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759131107; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XZO//qz79GRpOv+4MNhwfO4iWowgGLVIChqD1ARSE20=;
	b=M0ZDZG67NJGJ4ywp+AjmPaf3ZzN53liH+qAzhXU2FEomr4cPS5QmpNJDZ2Ch6+7NUcGsqh
	6v4S2vS7rV4vRAOFuQQempClkjcPZ3/YaxN57txizrauEEl2ef41wLLZqpK7qU/69k347w
	PCHcg4pWtrnQNMlCxljtaexOJaQjrVon8I11E77CS+IHOAbDcnCMVp9anajwvX/9oJLNH0
	uHddu3MUDSFRBeL5oRL4LTls4/0liX/xSFQdTjDltYcUc7skOtefBvQ9N+7q5qZxf12pwz
	CmvohKo8TGTqX9PMEcEEiIm2Kn8Mmci9VgZ2vvT0DBlm7AXu1R3yyX4rOULu5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Sep 2025 09:31:24 +0200
Subject: [PATCH] sanity: Update minimum gcc version to 10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-min-gcc-version-v1-1-c93d7f5a4f49@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMw12mgC/yXM0QpAQBCF4VfRXJsaW5vWq8gFazDK0i5S8u52u
 fzqnP+GwF44QJXd4PmUIKuLKPIM7NS6kVH6aFCkNBllcBGHo7V4sk9b1J1WTJqIhhLia/M8yPU
 V6+Z3OLqZ7Z4y8DwvhW4T03MAAAA=
X-Change-ID: 20250929-min-gcc-version-5b52e05000f7
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Yoann Congal <yoann.congal@smile.fr>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3Ip9yLxABjA6kkrBByby/sKCkBbgtyBIvsvUfhYiyO8=;
 b=owEBbAKT/ZANAwAKAdGAQUApo6g2AcsmYgBo2jXgpHVsNfKTp22IcavvFY4AaF00yYm+oiIbC
 hn88Sw+5/uJAjIEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNo14AAKCRDRgEFAKaOo
 NlMoD/Yz+EicnJzsmg18Nuw1r2C3U0rynZZJZKe8lvsCZdXjgURh9ZuaC7BGekBi4j+J5RJl2KE
 9XHNLbIHhXwHEr+4kPzaq4KxCYZxlQM5d56nkRtb4BF87zsI/w+cvSLgQ/SU3LHknaWtQhUvadX
 KV8Qx8VxQr/aPWaEIY+68ooRqHXIPvg4CtQoc4aTRIfQCNzRazJ7QSNbixJ5jikUlNHSATyd8sF
 U1WCQp9lfPZ0kCtHlgzUg13hPGNLUJpA4Kg79Oa+64ZW0PB9K+pTGYvgWJ4uQ2WRKr6wrahrF//
 PZPCLSx8kmAj/fhwL3uuFf1vbn6w+dj5Usb33hxC20u3mWh5mRqcjkLyW2rciAk08AeK8zpURAh
 5JjzESGkNHu2YrVFi4nWsSaBRe8dBQDoOWnjXCzgDXPy+F5RcXy5OwQ1u9I6Ohvcew1v/3va2gC
 XkswX3tEvVpPvG02KKlA3OtmOFZu7O7E1aII5PlBnKbwXgTbdGbxTT2mbMnVw0pZpIfsRmvLfbm
 IqrFhneW2JerYI8ivCM0RroIK3YmltRDfxUJdsJkPSp0tz7nLeZDsEhEHabAjUvtyAYwDsDh5Td
 /tHcZPWuf/ZzNBbnWS9t8tLi0bJNwWQN9gXSunwfunnouwSMyJ8yQ5Q5i6OrVJGhFqhTgMXxDg/
 PIYDxaoGZcb10
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 07:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224118

Since commit 19004950ad56 ("sanity: Check if the C++ toolchain supports
--std=gnu++20") host GCC must support "--std=gnu++20", which became
available in 10.1. This is already reflected in the documentation [1]
but not here.

Update the sanity check on GCC and raise the minimum version to 10.1.
Remove the dead link to www.softwarecollections.org.

[1]: https://git.yoctoproject.org/yocto-docs/commit/?id=0e538c102bfcb7184c76c2401e8cb878168c4434

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes-global/sanity.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index d875a022db..439dc5ad75 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -505,18 +505,15 @@ def check_userns():
                  "See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions for more information.")
 
 
-# Require at least gcc version 8.0
-#
-# This can be fixed on CentOS-7 with devtoolset-6+
-# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
+# Require at least gcc version 10.1
 #
 # A less invasive fix is with scripts/install-buildtools (or with user
 # built buildtools-extended-tarball)
 #
 def check_gcc_version(sanity_data):
     version = oe.utils.get_host_gcc_version(sanity_data)
-    if bb.utils.vercmp_string_op(version, "8.0", "<"):
-        return "Your version of gcc is older than 8.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+    if bb.utils.vercmp_string_op(version, "10.1", "<"):
+        return "Your version of gcc is older than 10.1 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly

---
base-commit: 07747aa7390e98bf2853154e5fd473e4984a1d3d
change-id: 20250929-min-gcc-version-5b52e05000f7

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


