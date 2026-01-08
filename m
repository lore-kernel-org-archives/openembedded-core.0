Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD17D185FC
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 13:54:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6761.1767880466891395597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 05:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U2novTN8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62A881A2705
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 13:54:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31633606B6
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 13:54:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79DE3103C8189;
	Thu,  8 Jan 2026 14:54:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767880464; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=h0876AoKlicStv1ucdjmE9mdbxd2jitUXTi6YtsfitI=;
	b=U2novTN8QEacSviGjYPB1EGjbM+d5ttcwMMxJkswVmo7CTaTuoajJCe7ErlPrzW7923n1c
	ji3fhe9DSmEROUq0v3Gsii9p4qrBY4+IPkkND0vukBEq/wiL1b5f4F/9aTiY/2vKsZMFDZ
	bGr3L0oB3otD3tYyV+OaZCLY17sA/rIst11N4iBcEl30UNe1WwotY4tDvpksnuMa2TF9JJ
	okte0HIKYfO4yl7Vo8XoMNtiCXo++XH3nPswTtwsuJptsFOVc+i2DIAZzAe+R4DJo6wu9U
	mU1aGyfF1L5qgBk4zXVkLrSBVjSLBra+y4a3T2EjrGufJsExPjWvP5OxQcu/8A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 08 Jan 2026 14:54:04 +0100
Subject: [PATCH v2] testimage: Print last lines of kernel log on test fail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mathieu-oeqa-15999-fixes-v2-1-8a8bc2d3ec7b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPu2X2kC/42NQQ6CMBBFr0Jm7Rg6SUnrynsYFgMMMolQbYFoC
 He3cgKX7/+8/zdIElUSXIoNoqyaNEwZ6FRAO/B0F9QuM1BJ1hB5HHkeVBYM8mI01nuPvb4loXO
 WbWepZ+cg688oR5HtW5150DSH+DmeVvNL/xhdDZbYlJUzPZP1XF2bEOaHTuc2jFDv+/4FiUppp
 cIAAAA=
X-Change-ID: 20251229-mathieu-oeqa-15999-fixes-885a5d52fa88
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767880464; l=1886;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=ZQkApw3P+0TwF12VdBSVOxyD9+UzybRhmVtwtaqvXgs=;
 b=dIaumJIUw+SkCDuh8bVfG22Rh9HnIsRufiFfLBEwqV5q/vLdMncHbqxPJvGL9/wrNPJgrfFpa
 TYqOr3HKYDqBZWuDwinDG5ip2GDnM8r+KZQkMaXQhv+dmrKCzPCIRZJ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 13:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229073

Testimage test fails are often a consequence of issues inside of the
virtual machine, such as the OOM killer firing. Showing the last kernel
log lines on the main log output should help to debug these fails.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
These two patches have been sitting in my branch for a few weeks now,
trying to address a test timeout bug entry [1].

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15999
---
Changes in v2:
- Fixing the kernel log patch, so the failure message is printed last.
- v1 of the test timeout patch was merged, so this series is down to
  only 1 patch.
- Link to v1: https://lore.kernel.org/r/20251229-mathieu-oeqa-15999-fixes-v1-0-b0681fa259a6@bootlin.com
---
 meta/classes-recipe/testimage.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 844c0f19ad02..b8685bc2b136 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -412,6 +412,9 @@ def testimage_main(d):
     if not results or not complete:
         bb.error('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
     if results and not results.wasSuccessful():
+        with open(bootlog, 'r') as bootlogfile:
+            bootlines = "".join(bootlogfile.readlines()[-20:])
+        bb.plain('%s - FAILED - Last lines of QEMU boot log:\n%s' % (pn, bootlines))
         bb.error('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
 def get_runtime_paths(d):

---
base-commit: 235e6d49e5888ad04416219e10b6df91a738661a
change-id: 20251229-mathieu-oeqa-15999-fixes-885a5d52fa88

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


