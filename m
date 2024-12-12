Return-Path: <ernst.persson@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC30E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:37:21 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by mx.groups.io with SMTP id smtpd.web11.20995.1734014239744785567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fYKs/blr;
 spf=pass (domain: kernel.org, ip: 147.75.193.91, mailfrom: devnull+ernst.persson.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4165A42831;
	Thu, 12 Dec 2024 14:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D85BC4CECE;
	Thu, 12 Dec 2024 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734014238;
	bh=TDhhHF6QzjVHaIZVNNzv6qhfZiTejWNSUnZrSZD07p4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fYKs/blrEA8JjmRqj2hs6k9Cir87ALZsbwrTa66FRvd5a2fWiGvSpmf0i/lJml1oC
	 RdTJa5muVaUziqrw1hKMFeJ2CRa3u3Z2RgYICS2J1tyiAqTlwlO/HXyRFYg+pm3ocL
	 Jjwy7HCbxmqhKuq/R/GfgWrZMviyqCcx51c+vGFtlLId0rtDvAMQ87wdK0MK3uDAw6
	 HybOnj9yRRe3wW0mbBg1IwTL0aZmoPSRTDfR7Z6Orh0lgHd7C/Gaycm450AC2geZ5W
	 mJeIk1dOsthsAdJph1cYaQ5IfUwW0Kmh0AWxVxjKd3zbiJN1EVF3RqjUlX0hcfB48+
	 QvMjpCEY/wGsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9414CE7717F;
	Thu, 12 Dec 2024 14:37:18 +0000 (UTC)
From: Ernst Persson via B4 Relay <devnull+ernst.persson.non.se.com@kernel.org>
Date: Thu, 12 Dec 2024 15:36:59 +0100
Subject: [PATCH OE-core kirkstone] package.bbclass: Use shlex instead of
 deprecated pipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-package-shlex-kirkstone-v1-1-27e5f76049b8@non.se.com>
X-B4-Tracking: v=1; b=H4sIAAr1WmcC/z2MQQrCMBBFr1Jm7YAJwaJ71x5AXEyTqR0iSZkpU
 ii9u9GFy/c/721grMIGl24D5beY1NLAHTqIE5Uno6TG4I8+OO88DgFnipnaY9OLV8yi2ZZaGE9
 9oDTQ2MdzghaYlUdZf/E73K4Yq/J3/xvw2PcPcUpTsIIAAAA=
X-Change-ID: 20241212-b4-package-shlex-kirkstone-674adbaf7c9d
To: openembedded-core@lists.openembedded.org
Cc: Ernst Persson <ernst.persson@non.se.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=ernst.persson@non.se.com; h=from:subject:message-id;
 bh=pOWG8/NAjjVhQAcB8v1I3LsMBWvK7F5TrcY04gl3v9U=;
 b=owEB7QES/pANAwAKAbrk269F2n0DAcsmYgBnWvUdF5QAav9F/DwIqWM1wQNIfZEwONV9/lz4y
 2S4onj1Z0SJAbMEAAEKAB0WIQRqWagaLrShCohIFwi65NuvRdp9AwUCZ1r1HQAKCRC65NuvRdp9
 A7HqDADUBl4dHHuUlRmf3j1P2N+T9zW8Ya+o3V0PrMEnCwxwMF+h0zr5RFp2HG5Qg08x9Yp3eHS
 ayICAOtJ69sxpfMzKfLtgknlbsMU+P+Q5Il7B0dH3xG4U+u+JXQN+EHtI7SE8qH1lZIHKnRy36r
 q4rFzTetBuJsEhR7XyPOPYZoP02i3e/sPeh4C8hLSNxvtCF36Npae3QhnWI0pmHp3zGxAGGbDWV
 5E/fEyZgyiYFo5SWh4K9E8iJkOg3S3NIjDwJ5LAC+Rbo99/IA2adLou/4AXzqYLrfJ6CkiZDztG
 BvpqOPem3/BWs7Vbth3P5ZUJrWvK2PWBYL0E8iXtwGf3SArWDQBjcNC/BAfZFiNbmVt5CkBDjCr
 6UcfaJpGbWS9B+LxhFV4hrHLTqA1j98I23eRish2qAOxBW+uuAVXiOnKAI5mOfiZAiAl9rLqt46
 WeRm4CZTbfcCUEBsyWNddr3HKwHSQup4dZuu6JIepGl4tc0B1f035x4oqc/zVc3Hw2UDc=
X-Developer-Key: i=ernst.persson@non.se.com; a=openpgp;
 fpr=6A59A81A2EB4A10A88481708BAE4DBAF45DA7D03
X-Endpoint-Received: by B4 Relay for ernst.persson@non.se.com/default with
 auth_id=297
X-Original-From: Ernst Persson <ernst.persson@non.se.com>
Reply-To: ernst.persson@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208649

From: Ernst Persson <ernst.persson@non.se.com>

The pipes library is deprecated in Python 3.11 and will be removed in
Python 3.13. pipes.quote is just an import of shlex.quote anyway.

Signed-off-by: Ernst Persson <ernst.persson@non.se.com>
---
This patch is only for Kirkstone, the code has changed
in later versions.
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 07bf5eb426e2561512e762729144dfcb5d0bda15..e6ba79346c4468ede9da4bf35be2aebbb261b311 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1850,7 +1850,7 @@ SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs2"
 
 python package_do_shlibs() {
     import itertools
-    import re, pipes
+    import re, shlex
     import subprocess
 
     exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', False)
@@ -1894,7 +1894,7 @@ python package_do_shlibs() {
         sonames = set()
         renames = []
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
-        cmd = d.getVar('OBJDUMP') + " -p " + pipes.quote(file) + " 2>/dev/null"
+        cmd = d.getVar('OBJDUMP') + " -p " + shlex.quote(file) + " 2>/dev/null"
         fd = os.popen(cmd)
         lines = fd.readlines()
         fd.close()

---
base-commit: ccf5b0a8896eba43f59151885aeb30b6cfc0573f
change-id: 20241212-b4-package-shlex-kirkstone-674adbaf7c9d

Best regards,
-- 
Ernst Persson <ernst.persson@non.se.com>



