Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20548C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:26:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.47933.1680240406967191737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vn0SvKmJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id m2so21189222wrh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PGP7TR3dliRGV9nzuFkfUHpF1Ujpa4mHA/9tFhw328=;
        b=Vn0SvKmJ/5HPgyNOE8zXkEI0clkcJzf+WfGNAa4MJzMcbmGdCEmIHsch+Y3waZglsf
         M32Navd2t/vIH9MVOouOESjWwY58HkC1hIJaONMo1hcxu+5+IpNAcK6y2w1FeONCi2hV
         iJPsuKW8Hi1ksiRK40qy9QDE4sn9uI5qYzDMBpTm9r0kXfakJ843YjftTagL7WpaOh7L
         dzRd5NGHLr3v4RFVdf3sXJQYbo/fb7AZN1Sq0Dg3+nZ37SvrN2xdApCECOO+3x+me3BO
         r3//gRau4uXZgx8siWZGv7GHhs3XS6lAD8ZsVnZMJ4TjTn1FneTMTc3hLCS/Jm4/Fvao
         VdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PGP7TR3dliRGV9nzuFkfUHpF1Ujpa4mHA/9tFhw328=;
        b=xeKoTcWK5oxlJXLcen9cmga6lekrBQVrYUUCRbU+lX/t4+7O9KyWaNeV/z9yinbf9H
         4bq0CiOOzb+JzAu5JABymgHmI5eZJ1qeDMRQ1oB33vvvWV+Vj0mKebgONIwWAGlJD/AV
         amUT/p29boiZoSL5HVH0MUktMFkpkQZnD//dVqWBo/LSKzowF9vBoo173hwA281iSW9c
         01nkne9fGQ4ANfm1hoKBc2ZDIUOrfvmu3An2YQHnwzQ5d5dQPCXbgSngnwnIZwgPgWbJ
         3fRGYsAXShq4i/n7/XYSR6U8rHQDlKTpFOc3jWQJilZNwFh8/DVM+tuALvrEHHWG9+Um
         83Ww==
X-Gm-Message-State: AAQBX9cEZOolE2vmM7oMVR33gkN/ALs6PfDA3YDWewdx8UtiZEIJ3ul7
	8gdLVwO49n3ejw2uRO2ce0j5u5lc+Rs=
X-Google-Smtp-Source: AKy350ZJ1EXi/BEcEV+JNDMBJUKpb4GiLbRiO6SsSxa37j64kCt633NSLTm3tPfbC2j92hO/qtPjzA==
X-Received: by 2002:a5d:4848:0:b0:2ce:a9e9:490b with SMTP id n8-20020a5d4848000000b002cea9e9490bmr18608843wrs.31.1680240405383;
        Thu, 30 Mar 2023 22:26:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5265000000b002e55cc69169sm1146902wrc.38.2023.03.30.22.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:26:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] insane.bbclass: add a RECIPE_MAINTAINER check (oe-core recipes only)
Date: Fri, 31 Mar 2023 07:26:36 +0200
Message-Id: <20230331052636.978578-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331052636.978578-1-alex@linutronix.de>
References: <20230331052636.978578-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179390

Absent maintainer entries are as well a frequent source of friction, as they are checked
only in selftest, and so aren revealed until autobuilder runs.

The selftest is retained as it also checks for obsolete entries in maintainers.inc
(not possible to do in insane class).

The insane check also looks up entries in a different way than selftest (from actual filenames),
and so additional lines in maintainer.inc are needed; I took the opportunity
to adjust and clean up exception lists in selftest to match.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass         | 12 ++++++++++++
 meta/conf/distro/include/maintainers.inc   | 16 ++++++++++++++++
 meta/lib/oeqa/selftest/cases/distrodata.py |  6 +++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 64ad76c48e9..dacbd431e53 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1499,7 +1499,19 @@ python do_qa_fetch() {
             else:
                 oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
 
+    def test_missing_maintainer(d):
+        fn = d.getVar("FILE")
+        if not '/meta/recipes-' in fn:
+            # We are only interested in OE-Core
+            return
+        # PN or BPN are not suitable as they are tweaked to match class variants, and it's not possible
+        # to map them back to the actual original item in recipe filename.
+        pn = os.path.splitext(os.path.basename(d.getVar('FILE')))[0].split('_')[0]
+        if not d.getVar('RECIPE_MAINTAINER:pn-{}'.format(pn)):
+            oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc.".format(pn, fn), d)
+
     test_missing_metadata(d)
+    test_missing_maintainer(d)
     oe.qa.exit_if_errors(d)
 }
 
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 682ec2cfdfb..1af6ccdbb71 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -62,9 +62,12 @@ RECIPE_MAINTAINER:pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER:pn-bc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-bind = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-binutils-cross = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-binutils-cross-canadian = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-testsuite = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-binutils-crosssdk = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
@@ -188,12 +191,15 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-source-12.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr3 = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gdb-cross = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gdb-cross-canadian = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gdbm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdk-pixbuf = "Ross Burton <ross.burton@arm.com>"
@@ -221,8 +227,11 @@ RECIPE_MAINTAINER:pn-gnupg = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-gnutls = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-go = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-binary-native = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-go-cross = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-cross-${TUNE_PKGARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-go-cross-canadian = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-go-crosssdk = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-helloworld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-native = "Khem Raj <raj.khem@gmail.com>"
@@ -278,6 +287,9 @@ RECIPE_MAINTAINER:pn-initramfs-live-install = "Anuj Mittal <anuj.mittal@intel.co
 RECIPE_MAINTAINER:pn-initramfs-live-install-efi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-initramfs-live-install-efi-testfs = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-initramfs-live-install-testfs = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-initramfs-module-install = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-initramfs-module-install-efi = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-initramfs-module-setup-live = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-initscripts = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
@@ -419,6 +431,7 @@ RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-libwebp = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libwpe = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libx11-compose-data = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxau = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcvt = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -729,6 +742,7 @@ RECIPE_MAINTAINER:pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-cross-canadian = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
@@ -774,6 +788,7 @@ RECIPE_MAINTAINER:pn-systemd-bootchart = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-bootconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-conf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-machine-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
@@ -783,6 +798,7 @@ RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sysvinit-inittab = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-taglib = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-tar = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-target-sdk-provides-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-tcf-agent = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-tcl = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-tcp-wrappers = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index b443f2d3af6..464d76244d7 100644
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
+                          "cve-update-db-native", "gdb-cross", "binutils-cross", "go-cross", "gcc-source","rust-cross",]
             for i in exceptions:
                  if i in entry:
                      return True
-- 
2.30.2


