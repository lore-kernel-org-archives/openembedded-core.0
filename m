Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030A2C54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.70870.1724736240243578442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gi5jrmum;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so651124566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736238; x=1725341038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dmTKzNX9j5L1uVVGv7ZWMPaVEQvHoCvZA8C4qumviw=;
        b=Gi5jrmumt7xtCUBcmJTWxBf3xQtZequoz//0JQk7LqypeVpFZeW5ImjOu2MKNMFOVF
         gr7ytB3gPw9Ky7c9cwFLffYvG030iYnBi6YDbeyj8pztQshsUKmsMdl7g0Rd0hb7uKgu
         FmcSdK94X8/oG3OEYn8idp4swdgl8apCuLFDbAd3mKJUvybsHTTFkhHNROBYDLc3UXyf
         S30g+pYzXFsG7t0fNkyNvVLa0J+QLGn1a6F63Xk41yILwtB3kNBiLuIZU6MzM4xU/6vs
         xsZ6FDCDZEmiuj8eBGrR5otx/AWkofJLPLrVyd+hAR8HeWDLOKVXjuDTSC7SmOi02v4+
         sWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736238; x=1725341038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dmTKzNX9j5L1uVVGv7ZWMPaVEQvHoCvZA8C4qumviw=;
        b=eM/VEWqRT+pA0xHGIPpyfzBH9Q9TRBrlq+SfBw8aDMR/kMaDlUa2++tw+1qW9aOE6B
         3fKrPTmBCWV9HFJq3mg50m6C/jjZI08Tikiyjf/s0zkRnQfPzFkGRl8yxstjwOzwuh5P
         Lph0zaNpuyO2BQwGDTPdPF2sfQV8ZXCD67lBKGO3FWYp9LshraXI89mYOTRMWjxmD6QQ
         yBa6G+dZUE96YNwqvSHB+EQOYZiUel7UNx9jHh+nEAeueoZRoCu568Mp3Jts3WLf8Yxj
         zbIZQ+La/QFqD2rlM/Sr5/vJPr5iXNufLFQK/Zx0IGFfX1NStjvVSR+K5XZpLF/JV6vk
         WfFA==
X-Gm-Message-State: AOJu0Yz1HcxVXsl0niPQfSpPp8N31Rq2FcMK4ppVN+/WI2WiAcFxM07K
	0qfBW/iLXBkFuAhB8uWuKNcXP1nTKR5+rm4sGwEf2on/gHbcOKR4VJZTyQ==
X-Google-Smtp-Source: AGHT+IGAfa3YCfH2ILPKk6Cwr9snyNmmSAW2zjEUj9iCmB/f5g3r0uqaPqVdudXugsefpiQlM1kvwg==
X-Received: by 2002:a17:907:96ab:b0:a7a:af5d:f312 with SMTP id a640c23a62f3a-a86a54b9e3amr865741166b.46.1724736238016;
        Mon, 26 Aug 2024 22:23:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:23:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/34] selftest: always tweak ERROR_QA/WARN_QA per package
Date: Tue, 27 Aug 2024 07:23:21 +0200
Message-Id: <20240827052354.1319810-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203777

From: Alexander Kanavin <alex@linutronix.de>

Globally changing it completely destroys sstate reuse, as seen for example here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3763/steps/14/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py     | 6 +++---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 31dafaa9c50..4b6f89d8cb6 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -84,7 +84,7 @@ class SanityOptionsTest(OESelftestTestCase):
 
         self.write_config("INHERIT:remove = \"report-error\"")
         if "packages-list" not in get_bb_var("ERROR_QA"):
-            self.append_config("ERROR_QA:append = \" packages-list\"")
+            self.append_config("ERROR_QA:append:pn-xcursor-transparent-theme = \" packages-list\"")
 
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
         self.add_command_to_tearDown('bitbake -c clean xcursor-transparent-theme')
@@ -94,8 +94,8 @@ class SanityOptionsTest(OESelftestTestCase):
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_recipeinc('xcursor-transparent-theme', 'PACKAGES += \"${PN}-dbg\"')
-        self.append_config('ERROR_QA:remove = "packages-list"')
-        self.append_config('WARN_QA:append = " packages-list"')
+        self.append_config('ERROR_QA:remove:pn-xcursor-transparent-theme = "packages-list"')
+        self.append_config('WARN_QA:append:pn-xcursor-transparent-theme = " packages-list"')
         res = bitbake("xcursor-transparent-theme -f -c package")
         self.delete_recipeinc('xcursor-transparent-theme')
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 439c1b9f0ec..be5484bca49 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -114,7 +114,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 
     def test_bash_and_license(self):
         self.disable_class("create-spdx")
-        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"\nERROR_QA:remove = "license-exists"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"\nERROR_QA:remove:pn-bash = "license-exists"')
         error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
 
         result = bitbake('core-image-minimal', ignore_status=True)
@@ -123,12 +123,12 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 
     def test_bash_or_license(self):
         self.disable_class("create-spdx")
-        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " | SomeLicense"\nERROR_QA:remove = "license-exists license-file-missing"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " | SomeLicense"\nERROR_QA:remove:pn-bash = "license-exists"\nERROR_QA:remove:pn-core-image-minimal = "license-file-missing"')
 
         bitbake('core-image-minimal')
 
     def test_bash_license_exceptions(self):
-        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0-or-later"\nERROR_QA:remove = "license-exception"')
+        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0-or-later"\nERROR_QA:remove:pn-core-image-minimal = "license-exception"')
 
         bitbake('core-image-minimal')
 
-- 
2.39.2


