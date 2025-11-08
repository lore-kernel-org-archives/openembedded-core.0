Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5CACCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 10:26:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2975.1762597569088227314
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 02:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D62mDiyE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDB254E415BE
	for <openembedded-core@lists.openembedded.org>; Sat,  8 Nov 2025 10:26:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9106860710
	for <openembedded-core@lists.openembedded.org>; Sat,  8 Nov 2025 10:26:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34D611185219E;
	Sat,  8 Nov 2025 11:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762597566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UyBTPaZDkzQF8ymGVX7KIy7Dr5xcDL1VkhGO3vSF1jY=;
	b=D62mDiyE9SLNT+ZhdpxFImqAxz07rF21LRFOna/Cfg20IOcIdwtHdRw86tyRjQjuumk6hl
	OB7ElxTu9m1J0cFhcTr8m1JNpv7+DyWj1lCgPnZQgJOEF4ob02hs2xx01XQUDREe2cywk0
	nDs3ZNd9SA/L3YNT3xy/5fIPtdONE1UNAz+Tcf4HbButyYAFguk+Lw7WbEnKZOT0mTLUSb
	MTYl46sVj8v+ieC7cf/REQMXnJqlCLzuS2r9+y8zJ3OFmyNY+VZGk6a1HEVKddm7bW2aZ8
	2xoWOhh2hy5p3cGG08dOXEevF+4hoFZ2K246v/loeWCQna0DpUoKEXjiyXz85A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 08 Nov 2025 11:25:47 +0100
Subject: [PATCH] oeqa: devtool: Fix mbedtls branch in
 test_devtool_add_git_style1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-mathieu-mbedtls-branch-selftest-v1-1-1fe07a307051@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKoaD2kC/x3NQQrCMBBG4auUWTuQRGvFq4iLNPlrBtoomSiF0
 rs3uPw2722kKAKle7dRwU9U3rnBnjoKyecXWGIzOeN6a82NF1+T4MvLiFhn5bH4HBIr5qlCK/c
 X5wYT/XUIZ2qVT8Ek6//weO77AfP2P0pxAAAA
X-Change-ID: 20251108-mathieu-mbedtls-branch-selftest-542270da67c3
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762597565; l=1489;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=1GJOdTLFNmHtaxl1PBB7gtXvZ1V0kDFfrA1gnGsbN88=;
 b=NxiCmjjUXjPrf0dRBLGDhsUKqKamc+u/I7SQleE1p2Xmruj7mzreFWkgPU9tpJvbnlPO15drX
 z1KMrpWkvnuBIqFe1bwwLmglbTbYo/UURMKlOvmVen7vi0AIFxxobxr
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 10:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226076

MbedTLS project renamed mbedtls-2.28 branch as archive/mbedtls-2.28:
update the name of the branch used in tests.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b92f017b8111..dde6cae2d56e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -469,8 +469,8 @@ class DevtoolAddTests(DevtoolBase):
         version = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
-        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https'"
-        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https"
+        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;branch=archive/mbedtls-2.28;protocol=https'"
+        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;branch=archive/mbedtls-2.28;protocol=https"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
 
     def test_devtool_add_git_style2(self):

---
base-commit: b9d761c06350020e14e09c5bfa7b92eded43d889
change-id: 20251108-mathieu-mbedtls-branch-selftest-542270da67c3

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


