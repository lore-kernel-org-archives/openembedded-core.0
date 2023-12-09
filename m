Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEA7C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 15:33:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.11566.1702136034594036752
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 07:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R39vz707;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33610bf5facso1098795f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 07:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702136033; x=1702740833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aN73C9e6ncxTvuocijON/tb/ZPimSVNaPe+y7+k9p4g=;
        b=R39vz707Va7MeurE7aI7b2JhE1KOWyMAFteQ7QID1k+4YQ75vPrTUbZhC2BYJgQ0g/
         whTGeAsUFnON0k0xLHjcuialAVKn5pb+0UQUOeDWbWU/gS0QTnbKruK7vwSaqOiUBw1I
         isQXt+PnY0me+ni+25HP2xqSLqMa64jEg4Apc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702136033; x=1702740833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aN73C9e6ncxTvuocijON/tb/ZPimSVNaPe+y7+k9p4g=;
        b=BT632Q/xlML/V6dmVcHXn+Z3j0wiE/vmJRRJ6xLxJt3AyFAR6P1onk48lTHCQGcP38
         WThS9C1CO+u3Eof4js4iDmDF59MJTv6v7OLn0h0KWANk5pGFwk9V+ii3VG4K5MQZBLlM
         U4r6xuQJ+am1EIZSppLbQ04yH5SfsbQLhJR0Y0EENbaZpBqGOW9DXBuSfXBnxxaa6ORS
         pKX7zYQ99iGku+KK9BEbHZ/LexCOOPzvzEnqqlNK5t9b+w4xHJx89ALYaLTxcurbWvMD
         HunfUE8FaVbDgRLJQdZBIMc3YaG0FBzp5LDFXEOfjH/EeMPg1wk1YeQU9Pq0dIPQ8CHN
         KuiQ==
X-Gm-Message-State: AOJu0YwA8e/cKR3YAkD87kFEe6jTuGPw/9TSUEVsxr+HtnU1k/fOwj46
	A2lWCtaEyUA7UBHM6VBloOWamiF0T1LlpSdTPoY=
X-Google-Smtp-Source: AGHT+IHO4RjqJZ956jER72CxFxFOSIhhiaodm1hZI7ceVt0ZZ1Ql+rrRP7YIaa4XMsw2h1GgQ/jE6g==
X-Received: by 2002:adf:ee0f:0:b0:336:1a2d:2f36 with SMTP id y15-20020adfee0f000000b003361a2d2f36mr250498wrn.54.1702136032483;
        Sat, 09 Dec 2023 07:33:52 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:30e:3cdc:729a:15fb])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4850000000b003334926fb81sm4541520wrs.90.2023.12.09.07.33.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 07:33:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] useradd: Fix useradd do_populate_sysroot dependency bug
Date: Sat,  9 Dec 2023 15:33:51 +0000
Message-Id: <20231209153351.2260728-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 15:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192104

If a task is adde which has a dependency on the do_populate_sysroot task of
the recipe, it will cause it to be installed into the sysroot (similar to
do_addto_recipe_sysroot). This fails since the postinst script is an overlapping
file:

Exception: FileExistsError: [Errno 17] File exists:
'tmp/sysroots-components/all/useraddbadtask/usr/bin/postinst-useradd-useraddbadtask'
  ->
'tmp/work/all-poky-linux/useraddbadtask/1.0/recipe-sysroot/usr/bin/postinst-useradd-useraddbadtask'

The copy written out at do_prepare_recipe_sysroot time is just for debug so
rename it, meaning there are no longer overlapping files and the installation
can be successful, removing the error.

[YCOTO #14961]

With the bug fixed, enable the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/useradd.bbclass                   | 6 +++++-
 meta/lib/oeqa/selftest/cases/usergrouptests.py | 8 +++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a4b8a2d6d60..0997b3da7a5 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -154,7 +154,11 @@ python useradd_sysroot_sstate () {
         bb.build.exec_func("useradd_sysroot", d)
     elif task == "prepare_recipe_sysroot":
         # Used to update this recipe's own sysroot so the user/groups are available to do_install
-        scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}")
+
+        # If do_populate_sysroot is triggered and we write the file here, there would be an overlapping
+        # files. See usergrouptests.UserGroupTests.test_add_task_between_p_sysroot_and_package
+        scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}-recipedebug")
+
         bb.build.exec_func("useradd_sysroot", d)
     elif task == "populate_sysroot":
         # Used when installed in dependent task sysroots
diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index f6a40b21e78..a331ca9f2c4 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -18,11 +18,9 @@ class UserGroupTests(OESelftestTestCase):
         self.logger.info("Packaging creategroup2")
         self.assertTrue(bitbake(' creategroup2 -c package'))
 
-    def _test_add_task_between_p_sysroot_and_package(self):
-        self.logger.info("Cleaning sstate for useraddbadtask")
-        self.logger.info("Building useraddbadtask")
-        # fails due to bug #14961
-        self.assertTrue(bitbake(' useraddbadtask -C fetch'))
+    def test_add_task_between_p_sysroot_and_package(self):
+        # Test for YOCTO #14961
+        self.assertTrue(bitbake('useraddbadtask -C fetch'))
 
     def test_static_useradd_from_dynamic(self):
         metaselftestpath = get_test_layer()
-- 
2.39.2


