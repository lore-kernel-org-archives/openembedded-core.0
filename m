Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A63C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:35:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.14866.1682580936782471914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GkVvJ2d0;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-2f4214b430aso5064918f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580935; x=1685172935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83n04SOHuZEp1nNmaQVjQvrdyN8elF/dTdwG8GljROA=;
        b=GkVvJ2d0otVIJbLBpfVyaNfLrYJEzZOpit4S6y++HxfRBawuYoKjg5BmzvZCKBiB8t
         xSHFOnyDv1aaC0cE7qDh5Rly02styi2M6RYOGxApeVfVHHvh9enbLqJFPs/14bWvU24u
         J8hpwFy42Z5EyC+AY897Cd5sJhdwMC9KRqb1bPxF6CBJvLPWyiN7fCxbZ53YHSE+YYjl
         Yx7o3T8PMJ6joUELS24Ic6Z/3HhaxjcSgmcPfFzotSNUrQLVtKsWHPa8WjRs4rWKbF8W
         wqv+5ZIVfcW/ePwluoQLzXxlhPOQJeoDnzjTIHe91DOX4KZ0XCMm4VQosBLGozZkd5VH
         Q/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580935; x=1685172935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83n04SOHuZEp1nNmaQVjQvrdyN8elF/dTdwG8GljROA=;
        b=InSceB6xAtqrCn9hWRFq2chlxcPfXx7nU8P0udHd0as4kA9vmOGhnfIN6Tetsww6GU
         9d3HLQa/Fbe9DGs0k4MB1NHwCgSuD3jD1hp98LX1IkMlwurl81QUCNmqmOZ8/0dh1tbz
         U3MvzCbpERiO75wNCEe7hj3v/+er47kcQMt3f/+CntI61NgEtaWwiYxtS3lcEhL6Ae/7
         U7xLAWYqx9UJ7qb0WapbsGkYWOemT1ggaix/aJNA94CFnzIU8Sd5S5+RSrjBn4B433lR
         oevvOZy5JqQil+wZTNwDWmThv6eOb4tKWewYeoWKrz6ZVoGpoVOc/sb/er9gHBYiiE49
         b6Ng==
X-Gm-Message-State: AC+VfDyL3M556LI0cbydSd5NaFWoMq3rZ0+rY39Q9PLDzd39bLkDeOGt
	n+j+zL+Zs8ZdE3obl4k6NYkg67f+fjE=
X-Google-Smtp-Source: ACHHUZ727lRmRJBL4hDDyLvVD32+IVkaEjMHJgP3sAa8ShB/R+2DKhrJfzpdHxUiNb3FJuhCm8WLkg==
X-Received: by 2002:a5d:6884:0:b0:2f2:b71a:40cb with SMTP id h4-20020a5d6884000000b002f2b71a40cbmr506729wru.56.1682580935095;
        Thu, 27 Apr 2023 00:35:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b002f598008d50sm17678411wrj.34.2023.04.27.00.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:35:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] selftest/distrodata: clean up exception lists in recipe maintainers test
Date: Thu, 27 Apr 2023 09:35:25 +0200
Message-Id: <20230427073528.3956414-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230427073528.3956414-1-alex@linutronix.de>
References: <20230427073528.3956414-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180476

Specifically:
- add missing maintainer.inc entries for initramfs-module-*, systemd-machine-units and
target-sdk-provides-dummy and drop them from exception list.

- remove rust from exception list for unbuildable-by-default recipes as it is now buildable.

- add missing maintainer.inc entry for libx11-compose-data and cve-update-nvd2-native;
as they are also unbuildable by default, they needs to be in exception list as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc   | 7 +++++++
 meta/lib/oeqa/selftest/cases/distrodata.py | 6 +++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 682ec2cfdfb..66f8eb6af3e 100644
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
index b443f2d3af6..fd262fe3c9e 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -48,15 +48,15 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
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
2.30.2


