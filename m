Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CE4C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 13:22:50 +0000 (UTC)
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8895.1784553767800386069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 06:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=LxmZN93E;
 spf=pass (domain: 0leil.net, ip: 185.125.25.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4h3h5d1HdJzNF0;
	Mon, 20 Jul 2026 15:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1784553765;
	bh=Zlm/SrM+FtqZSnidTLpaWeWxIGBeTtHqYDZVEgIZcZQ=;
	h=From:Date:Subject:To:Cc:From;
	b=LxmZN93EpJS90KWd62GrtAgHO1VmxcWpk7E/th37CTMkqcxZynrSEqIdtR0NmBxyg
	 J+2vktfmQLmShQjhdClpDra9amY7VHj+3ZR3yfuqWRmMCESqddtb2FXfIsGzvi9jyo
	 0YyLLhu78g1ao2hGnl+KvrbRPqKcKTXdGb0UWBS2zvZ0dzfgEZirmQ3vpIlnJvl1zD
	 oqh5KA4GEXQtDsLebvIzBPk9k1pLYvlNrfbiPMiW2pu4GRmdJ7QjHr6eDy9ETbBgWy
	 RhVd5P9zRsZNfrsiUt4yYJWZKjAyv+LQ+xekk8Y7c+D6uDZ54o+h6TwYvgQXM0NVwo
	 v+Q/5W/jbOvyg==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4h3h5c2SYYzlcS;
	Mon, 20 Jul 2026 15:22:44 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 20 Jul 2026 15:22:31 +0200
Subject: [PATCH] kernel.bbclass: pass args instead of tuple of args to
 runstrip()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-runstrip-not-tuple-arg-v1-1-e07764fe3f41@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDuQRvGnVykuUh11SolhJpGCe
 PemuvwW7+2gJEwKj2IHoY2VV59xvxUwLM7PhDxmgzW2No01KMlrFA7o14gxhQ+hkxm7pmpLW1d
 ubDvIcRCa+HuOn/1lTa83DfF/g+P4AYMHEp96AAAA
X-Change-ID: 20260720-runstrip-not-tuple-arg-97483264ad89
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: b4 0.16-dev
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 13:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241397

From: Quentin Schulz <quentin.schulz@cherry.de>

Since commit 7c99f90079e7 ("lib/package/utils: Improve
multiprocess_launch argument passing"), runstrip() now expects arguments
individually instead as a big tuple so let's fix the one user in OE-Core
of that function which we forgot to migrate.

Fixes: 7c99f90079e7 ("lib/package/utils: Improve multiprocess_launch argument passing")
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Closes: https://lore.kernel.org/openembedded-core/319bb00c-9712-4aa7-38b0-e1ad2bab840b@crashcourse.ca/
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Not tested. Just read the code and found an issue. Robert, can you give
this a try maybe?
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 48e394b650..91248467be 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -750,7 +750,7 @@ python do_strip() {
     if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
         kernel_image_stripped = kernel_image + ".stripped"
         shutil.copy2(kernel_image, kernel_image_stripped)
-        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
+        oe.package.runstrip(kernel_image_stripped, 8, strip, extra_sections)
         bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
             extra_sections)
 }

---
base-commit: aa33c4317dbe3e46e903d5350771413959462b37
change-id: 20260720-runstrip-not-tuple-arg-97483264ad89

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


