Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501B2CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 21:05:46 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1041.1758315943979166786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 14:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TSIUe4oH;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso2592376f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 14:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758315942; x=1758920742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySeBrdXV14Y5TreHIdfqxjUFTF/VOsRTlUR5gogQmys=;
        b=TSIUe4oHD07A/Ny/yXMcwjknPllG2ZcoSFxitCdK/334MGB6QMI6gun0ioXeLn0duV
         2bLYzkzMcTZ6cGWKxWJ3O0/d2adwITGHOttrok8/yUQDsp062rQ+W8I0APCX4k5SfowA
         XRzQaH6+7zNoQABWvQ/UrqgN7yXPTQhi+gnTvQgVLKA/2OGati6usZ8ojWbOLHx5Patz
         LiAReJ/yVobQHW8oT7KFW9kj755dTEEUEfn8iT+PdbbJkGulSqfsOLtWeimOz10VJqxV
         /TucEt8KKVkSiw1TEFuK7XU0gPuf/Wy+at1WS6NuFYYntamlTP5yLr6PnCtTPUH2/rR7
         TLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758315942; x=1758920742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySeBrdXV14Y5TreHIdfqxjUFTF/VOsRTlUR5gogQmys=;
        b=uHpDlGB/RzDQEAqUmHbLnmgtHlU55iQpraA2x0LE/gsNORhIRS6g1aP8SJI9wWAGF+
         P8wrCIScWmZBxy9/QEHVjaJXSStpdl0v34SiVAoVhLcMW2BjujUIXPUbpcaLFZNmm4KC
         q31fxV/64sG77/6bVXSLWi1qLm2RrFEnvhV9G1fzZVJprsUCxGT8yfpeP/zSulCftvpG
         vAGu6mhnvjHLDvZ58XgsCu2n5MIpkJwPNLEUbOzymuTUuqJ/pSFcl2fEJ9u2b11HqHfc
         u1H/TfGPfXN3kRqXugJMCBbl3QiBFCb/wucehSEFkXBD4XNs8sSJPSaxEygJhTBT6r5k
         +xGA==
X-Gm-Message-State: AOJu0YyIoBeDwyUJD3G/U0eWTcIXuONEavYmVXkclxjcn0WVY8qzOO6M
	4wknIN7fYLKmdsGoH0RZNoPoQ6IFVoP3JpIje1FOLM/hVeat0WfsleVqTcetRg==
X-Gm-Gg: ASbGncv4r7/AqJBouVRvbT03VZOikNjkr15sul5B4MHhzD1ZMsD2ZJLjc4npJ0JU+Ai
	gXmiIdbe2aMCct5BP2I1rXhv5D+vz3uCuJ+q7AKQagtiVT3gHyaOZKI3cU7h9k+deXxBs75mR9v
	YgP4BipImy0LziWJD9E+HjCcKf4mUiqw83JQYrDXBY0dwLTMKhiTvuvfBU76c4oQPbTq3b1ujtz
	nyp0gvScnVEqMMzzxwWVn09qI0Wmk1snYjb8HV5HmzQw5gSNmueqf2E2fNCZJMfx/PXHkJRQ7Xv
	OKZwrruhOd6h3d7cjifAcEqv7j2OtV5N473IHn3zQb16DrcC8sHg3BLC2mxAr4jluqlDe3Y+4mk
	Ob1x0z0tgexyeC2aY75jVDCqJJDZ9IQNHTqgmWZcSv14T+O8=
X-Google-Smtp-Source: AGHT+IHCf6vdXRC9skpEqM4HR4oI4enguD6huVCb3AQL1EvpnTmrACtKiln+oJqnTYUdf+fOsiN7Rw==
X-Received: by 2002:a05:6000:22c7:b0:3eb:df84:62e with SMTP id ffacd0b85a97d-3ee7c5535d9mr4330486f8f.3.1758315941626;
        Fri, 19 Sep 2025 14:05:41 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad359sm119939425e9.22.2025.09.19.14.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:05:40 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.83 -> 5.84
Date: Fri, 19 Sep 2025 21:05:33 +0000
Message-ID: <20250919210533.1528001-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 21:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223773

* Enable aics tests again as the issue with them has been fixed
* Remove threads package config as the option is removed

Changelog:
* Fix issue with AVRCP and handling invalid UTF-8 item name.
* Fix issue with exposing coordinate sets if LE Audio is disabled.
* Fix issue with BAP and not responding to SetConfiguration.
* Add support for BAP unicast endpoint reconfiguration.
* Add support for BASS and encrypted broadcast source.
* Add support for HFP and Call Line Identification.

Full changelog:
https://github.com/bluez/bluez/compare/5.83...5.84

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 -
 .../0001-bluez5-disable-aics-tests.patch      | 40 -------------------
 ...et-for-building-tests-without-runnin.patch |  6 +--
 .../bluez5/{bluez5_5.83.bb => bluez5_5.84.bb} |  2 +-
 4 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.83.bb => bluez5_5.84.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 48aeff0aee..24a41f92df 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,7 +54,6 @@ PACKAGECONFIG[csip-profiles] = "--enable-csip,--disable-csip"
 PACKAGECONFIG[asha-profiles] = "--enable-asha,--disable-asha"
 PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
-PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
 PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh, json-c ell"
 PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient, ell"
@@ -65,7 +64,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0001-bluez5-disable-aics-tests.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
deleted file mode 100644
index 3f01843ea3..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 182545f2504255d67d9ec2071fd5c82ab53c5a2e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
-Date: Sun, 30 Mar 2025 02:20:24 +0000
-Subject: [PATCH] bluez5: disable aics tests
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Temporarily disable aics tests as they can fail
-depending on how the tests are executed. Sometimes they pass,
-sometimes they fail. The issue has been observed since BlueZ 5.72 to 5.80
-
-Starting with BlueZ 5.80, the tests began failing when using the
-ptest-runner script. This is not a new issue in BlueZ 5.80 which is
-why the test is disabled with this commit until a solution is found.
-
-See discussion on Github:
-https://github.com/bluez/bluez/issues/726
-https://github.com/bluez/bluez/issues/683
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
----
- unit/test-vcp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/unit/test-vcp.c b/unit/test-vcp.c
-index 6a61ea2..04b92e4 100644
---- a/unit/test-vcp.c
-+++ b/unit/test-vcp.c
-@@ -2754,7 +2754,7 @@ int main(int argc, char *argv[])
- 	tester_init(&argc, &argv);
- 
- 	test_vocs_unit_testcases();
--	test_aics_unit_testcases();
-+	//test_aics_unit_testcases();
- 
- 	return tester_run();
- }
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index a9af56f141..cea7c10c3d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From fa5da30786837b437707cea921056e9c1c22ffba Mon Sep 17 00:00:00 2001
+From d8bbdd8e7166f481429b4999f520cd8306685f03 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 02ad23c..169269d 100644
+index 94f625d..a3c3512 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -722,6 +722,9 @@ endif
+@@ -725,6 +725,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.83.bb b/meta/recipes-connectivity/bluez5/bluez5_5.84.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.83.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.84.bb
index 8af6bdb67e..874db9df64 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.83.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.84.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "108522d909d220581399bfec93daab62035539ceef3dda3e79970785c63bd24c"
+SRC_URI[sha256sum] = "5ba73d030f7b00087d67800b0e321601aec0f892827c72e5a2c8390d8c886b11"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.43.0


