Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF04EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:17:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9553.1687861057951033356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 03:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hamnsDLH;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so3934866f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687861056; x=1690453056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SII40r2p5F0qV9wb18AsnZ5voiQK6N0SqqMJWuvAy90=;
        b=hamnsDLHZ6NDyjN2VJeXau0WPXGTmqp8mscZCxaAGGV+jdtmDdOkgrC6qR7PTbSLtv
         wH/QbrKnWzIyGazG1UxD93OR7eRtl2JVlbI2FsgC7zlKeD2fJmg/FAJJE4MilvgUxo7s
         9THAUZ2bDzZNfQTADyXonOINpemiRlLGUx4iKGVbKXnbgzjH6I82eRlAkdMshSg3iVjU
         cSQr2/uJuzdOr3PUgBZYtqGAToLgAZEbjQ7jFf+6wcogfz0VcLcbqOqJWZtNbpyBMvsQ
         0+3NF56ZAQ5CjhmC0vgFbYSJWgKdW3fWjp8GqyoNw5qAy3tV2Z3DtDefW2OvduAJ8Kz3
         Xy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687861056; x=1690453056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SII40r2p5F0qV9wb18AsnZ5voiQK6N0SqqMJWuvAy90=;
        b=dUYuBlwExu3kDVUf7qPxMIIcpHFxZPkNHA5NgPRxoioRkGimsDGJYndXSyJCR8iuLg
         K2Fel74oEvxbTBKkgY8bxMpum8I2eKdxCDkNU3wm3UR8vvseleWh2BMR41Kcj274vG2s
         +7XXhYtCQiMvIgRH07n+ht0SkrXFA1lINBIZMUGNPzWNuc0vVMwG0k2aX57Z2nEOhdiZ
         XjEASnv48XcN3YWvjQarSILwuqCxVDN65wNbEiuMJSutP1Bi4xZwvkRnpS3SBV8R1qF/
         oY+Bp5jFBXUNCYs6wXjqBnHM5oL2oENYcFoiuMOEn8mUXgLL0ehl6YsqY5P92FKHsZl7
         0/PQ==
X-Gm-Message-State: AC+VfDxE1ipINd1KUl6OZH7emTclBqAdsC24BQrKgO41Uimt4WF9gUeY
	iy5hJgOAc/ea8W4EFuvY5UiVMB3FxEI=
X-Google-Smtp-Source: ACHHUZ7VfpHylo6wo0w5Ao/YeF/rvr+qTiGxva/x+ZJC6XKTzDfvgc8mJEQQ8G9yxNxUJVmeK6xu6Q==
X-Received: by 2002:a5d:5410:0:b0:313:ef24:6fe6 with SMTP id g16-20020a5d5410000000b00313ef246fe6mr4438855wrv.1.1687861056041;
        Tue, 27 Jun 2023 03:17:36 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0030ae849c70csm9961436wrv.37.2023.06.27.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:17:35 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 2/5] kernel-module-split: install config modules directories only when they are needed
Date: Tue, 27 Jun 2023 10:16:41 +0000
Message-Id: <20230627101644.881715-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627101644.881715-1-jose.quaresma@foundries.io>
References: <20230627101644.881715-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 10:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183480

Instaed of allways create the directories and removing it at the if they are
not used, we can just do it when there are modules configuration to be created.
So the best thing to do is install the directories only when necessary.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v5: introduced in v5

 .../kernel-module-split.bbclass               | 35 +++++++------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 50882c31a7..9467a28208 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -30,10 +30,6 @@ fi
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
-do_install:append() {
-	install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
-}
-
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
 
@@ -102,7 +98,9 @@ python split_kernel_module_packages () {
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
-            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
+            conf = '/etc/modules-load.d/%s.conf' % basename
+            name = '%s%s' % (dvar, conf)
+            os.makedirs(os.path.dirname(name), exist_ok=True)
             f = open(name, 'w')
             if autoload:
                 for m in autoload.split():
@@ -110,6 +108,9 @@ python split_kernel_module_packages () {
             else:
                 f.write('%s\n' % basename)
             f.close()
+            conf2append = ' %s' % conf
+            d.appendVar('FILES:%s' % pkg, conf2append)
+            d.appendVar('CONFFILES:%s' % pkg, conf2append)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
                 bb.fatal("pkg_postinst:%s not defined" % pkg)
@@ -120,21 +121,19 @@ python split_kernel_module_packages () {
         modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
         modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
-            name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
+            conf = '/etc/modprobe.d/%s.conf' % basename
+            name = '%s%s' % (dvar, conf)
+            os.makedirs(os.path.dirname(name), exist_ok=True)
             f = open(name, 'w')
             f.write("%s\n" % modconf)
             f.close()
+            conf2append = ' %s' % conf
+            d.appendVar('FILES:%s' % pkg, conf2append)
+            d.appendVar('CONFFILES:%s' % pkg, conf2append)
+
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
-        files = d.getVar('FILES:%s' % pkg)
-        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
-        d.setVar('FILES:%s' % pkg, files)
-
-        conffiles = d.getVar('CONFFILES:%s' % pkg)
-        conffiles = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (conffiles, basename, basename)
-        d.setVar('CONFFILES:%s' % pkg, conffiles)
-
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
             d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["description"])
@@ -184,14 +183,6 @@ python split_kernel_module_packages () {
     modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
         d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
-
-    # If modules-load.d and modprobe.d are empty at this point, remove them to
-    # avoid warnings. removedirs only raises an OSError if an empty
-    # directory cannot be removed.
-    dvar = d.getVar('PKGD')
-    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
-        if len(os.listdir(dir)) == 0:
-            os.rmdir(dir)
 }
 
 do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
-- 
2.34.1


