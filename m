Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDF9C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:06 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.40826.1684291502436156124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hAeXiT2Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53202149ae2so106143a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291501; x=1686883501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kokcE84cMNQ7/oMXsAHE8yZ01v/f/AZ6vON5RrtBkLw=;
        b=hAeXiT2QhwmU66E7rztS50AIg5KSptBCC9z2hmXMZjyHUbUkOONJdkGBAI4F4ekDg6
         P6ISjJBY22XZxdzc3CRugc7WYF99OeCPgjU7TecZGHvEQYtApL7O3L5gyVN/qT6LpXel
         ruwuwHJMpeR2SsbZu7hfO4GLcHE68SZfjiM7BKRLZQixOtni6U/pSKTK1vTV1cOV0UW0
         dMaDjtosswdosaVf7N7CUqxdNQLfkWIXYOrHfAicxZ3aCqESu1Dez1BKUt+AIzqyuPoP
         xQnzHY/DNdP8Mrc0ol3AvWOxu9ZdPiBMKZ3my+svADEb5H5fjUKh+Y3JU8KYYHh50i+o
         F79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291501; x=1686883501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kokcE84cMNQ7/oMXsAHE8yZ01v/f/AZ6vON5RrtBkLw=;
        b=i01Wbd6ZVlRElhPIAhpadpmw7usj2TWg4Qid0JyR2hlscPTh+ihD3lkTeo6cYb3rBZ
         9oaLkWQaonErSaGQk3ypUJHm864/dgpNGtfCCrWJRb/Qfzv7UvG9gewENmeNQTprm3Lh
         MSxREZGzW+vOYWiomDU+lG8Dpj+7UiTBY3ttbytJaUJosbeil7odyQeqPndfPPBA37vO
         wsw4jtyOCmh4hV+ZPJrGAec/yqP8hpg23PwyTSewx7yUEcASYXEu2eYdfIEJY6CleZ95
         dpaFYHeeIHKYyJ1uN7XcC7iabtIyVFDWZr2yLjVi0czPVxn4hyV7o7rMaDQXtxzBVKbs
         xt+A==
X-Gm-Message-State: AC+VfDyRum6bkRcSRCQTB89kLcyPkLWAZ/UNWjXxbklEFuOk81nVhAap
	3md75S/Q96P8W5pucskrw4WBASUl9q3p2FWSVsY=
X-Google-Smtp-Source: ACHHUZ6L6I8l1zn3E5pCucSJ2gDa2HHebQYAebBvIJmDjfqntYAYLqlR1IPgO5qsS0ba4d95fOdVdw==
X-Received: by 2002:a17:902:bc45:b0:1ad:b857:148a with SMTP id t5-20020a170902bc4500b001adb857148amr23685171plz.15.1684291501363;
        Tue, 16 May 2023 19:45:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.45.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:45:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/13] selftest/distrodata: clean up exception lists in recipe maintainers test
Date: Tue, 16 May 2023 16:44:32 -1000
Message-Id: <d1ad59bb7a5360433403733de71b66ff3e1484ef.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181438

From: Alexander Kanavin <alex.kanavin@gmail.com>

Specifically:
- add missing maintainer.inc entries for initramfs-module-*, systemd-machine-units and
target-sdk-provides-dummy and drop them from exception list.

- remove rust from exception list for unbuildable-by-default recipes as it is now buildable.

- add missing maintainer.inc entry for libx11-compose-data and cve-update-nvd2-native;
as they are also unbuildable by default, they needs to be in exception list as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9158b191c1cfc16f97abed6c05891aa84fe9463)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc   | 7 +++++++
 meta/lib/oeqa/selftest/cases/distrodata.py | 6 +++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 94b0e8432e..b4ce618ca0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -129,6 +129,7 @@ RECIPE_MAINTAINER:pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-curl = "Robert Joslyn <robert.joslyn@redrectangle.org>"
 RECIPE_MAINTAINER:pn-cve-update-db-native = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-cve-update-nvd2-native = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-cwautomacros = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-db = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
@@ -278,6 +279,9 @@ RECIPE_MAINTAINER:pn-initramfs-live-install = "Anuj Mittal <anuj.mittal@intel.co
 RECIPE_MAINTAINER:pn-initramfs-live-install-efi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-initramfs-live-install-efi-testfs = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-initramfs-live-install-testfs = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-initramfs-module-install = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-initramfs-module-install-efi = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-initramfs-module-setup-live = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-initscripts = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
@@ -419,6 +423,7 @@ RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-libwebp = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libwpe = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libx11-compose-data = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxau = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcvt = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -774,6 +779,7 @@ RECIPE_MAINTAINER:pn-systemd-bootchart = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-bootconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-conf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-machine-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
@@ -783,6 +789,7 @@ RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sysvinit-inittab = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-taglib = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-tar = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-target-sdk-provides-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-tcf-agent = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-tcl = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-tcp-wrappers = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index b5554a6c3c..c83a3a7bd6 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -84,15 +84,15 @@ The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIP
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
         def is_exception(pkg):
-            exceptions = ["packagegroup-", "initramfs-", "systemd-machine-units", "target-sdk-provides-dummy"]
+            exceptions = ["packagegroup-",]
             for i in exceptions:
                  if i in pkg:
                      return True
             return False
 
         def is_maintainer_exception(entry):
-            exceptions = ["musl", "newlib", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran",
-                          "cve-update-db-native", "rust"]
+            exceptions = ["musl", "newlib", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
+                          "cve-update-db-native","cve-update-nvd2-native",]
             for i in exceptions:
                  if i in entry:
                      return True
-- 
2.34.1


