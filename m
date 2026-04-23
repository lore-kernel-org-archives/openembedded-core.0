Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5507F99375
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:15:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16105.1776938656654974369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 03:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NlhchLgY;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: zizuzacker@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f351ca23cso3306138b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776938656; x=1777543456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk0qKtqQpBNFCl2n1XH/HW29hDYIDRhwJN3jJT1on9Q=;
        b=NlhchLgYNeg6uIJCf/b/zA3DJ5/pymq86D4NA8XJkQgUDQJPu4xCRbHXrlsfw76yq9
         txd6YuzQ+tU/lLUO1yiGwkd1R/PKgapk915AjKb7U4XtOKuYxeOlDVBvxUu+IeUhMZWb
         AE5p5lS8F5/Gn9nDuIHeUW3cFzmLqzI3mMLdRaIGIaP+ehHe6907mIXiOX96QdVcnxSA
         vOcOvSoDC3YhUuxAShuoMAsxnKYPhN3BWr8cr30M/+GlfxqNBe975yePHp5wX2yvAv+S
         mIP2ibiXgNX59bxI81saCtEhOukfuLuCxbhIZ/k7VoAG3EfOhvYZM492+y0dvlxYSkpJ
         onGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938656; x=1777543456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vk0qKtqQpBNFCl2n1XH/HW29hDYIDRhwJN3jJT1on9Q=;
        b=rWpClNVKyJlak4kd/hERaq6ryZQEm1x3Mld5a+iT65JWAY6GqKP2CTb8edugsj6T9U
         lRP9VP6WhrerLqfHt0RVS5nav3zSMy4SJekNKIMjcI2HeU6ZPmeMkxhEYR1gZMDwoWWA
         olJMCz0PZ2+F9iayuotyGenEiY2REq9/SDgiAvPWovYTwAUtoWd3hjRZ0RYn8DBWL2dr
         q2KclRALZ9XVO5c0pthjoNYfw1cKO8NFhdRCQkB0ybkxAQ8jRUcsLovSQGzIyrvE49V4
         2itHGlK216I8QQsogoNaFR7bYM/zDzt+lvpvUYAJACLqdIwZ39YcsuZJBaE4vOyUbFVR
         mzNQ==
X-Gm-Message-State: AOJu0Yx0tFRUQhOqkTqs0NATY1QdfCmEhWt+6KvNMNX1k15h5HMZU7Ru
	sm2rFXF3OpAvpWtMk3tyYvg0F9loXQYZ8uE/8lIDKG7oxGKbyFXXfjzrhbritdno
X-Gm-Gg: AeBDietRCCid4xg0moT45pg+z5HExWMqbLVqo3KrbNjkCA2i4wD8aLwa41xJVfc7MtE
	cbefz9jeRSdwY5WMIeymVvEkZDKSDrAwrcquubN1NLC0z5Hzr6k014jGFd+l7mFh6UApbm6sdEy
	GvJ3ixdcgP/CPa9vqO+oJ+8aFtofxBpDcDJRHS7rXnhGbut0oLasDpL1SkIPnOVRVdyQs0ESDqW
	OHXePPQLLrc6EGetr9ap9ce4Z8yRjN4hBqqhaHErJSrEMfcs4aqmMpdWILCOxlbTlkzJ5ZkcuY1
	LdrlgdFbZuMMA4jaG/iiJEf3wfl8DejOXfWC6fytTmulE0trUDn3QvEo5VuGl54v8TVyGYCcl6W
	ij1/vUe2pJvTEZ/d1xB5BDqoBORJoh98DLLtLOGU1MZsOtlaqLxK0kquGqiOxIQ90PDMf0D6eeL
	7wPS2cO00k47lFYf76S3TOG26C
X-Received: by 2002:a05:6a00:a241:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-82f8c3f017cmr26450819b3a.0.1776938655690;
        Thu, 23 Apr 2026 03:04:15 -0700 (PDT)
Received: from ltu.. ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm21540801b3a.17.2026.04.23.03.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:04:15 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	mathieu.dubois-briand@bootlin.com,
	Nguyen Minh Tien <zizuzacker@gmail.com>
Subject: [PATCH v3 3/3] oe-selftest: add test for useradd with only USERADD_DEPENDS
Date: Thu, 23 Apr 2026 17:04:05 +0700
Message-Id: <20260423100405.25255-4-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423100405.25255-1-zizuzacker@gmail.com>
References: <DI0BXNU5HAFH.348GL3QVI6JL3@bootlin.com>
 <20260423100405.25255-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235758

Add a test case to verify that a recipe inheriting useradd with only
USERADD_DEPENDS set (and no USERADD_PACKAGES) parses and builds
successfully. This validates the fix in useradd.bbclass for
[YOCTO #15863].

Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/usergrouptests.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index 3c59b0f290..69025a59aa 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -55,3 +55,9 @@ class UserGroupTests(OESelftestTestCase):
         self.write_config("USERADD_GID_TABLES += \"files/static-group\"")
         self.logger.info("Rebuild with other staticids")
         self.assertTrue(bitbake(' core-image-minimal'))
+
+    def test_useradd_depends_only(self):
+        # Test that a recipe inheriting useradd with only USERADD_DEPENDS
+        # (and no USERADD_PACKAGES) parses and builds successfully. [YOCTO #15863]
+        self.logger.info("Building usegroup-deponly to test USERADD_DEPENDS only")
+        self.assertTrue(bitbake(' usegroup-deponly'))
-- 
2.34.1


