Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73B9C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:34:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.842.1689374043697343370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=g5p9Twf6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b8ad8383faso18528855ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374042; x=1691966042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wotN4kMeNFtpN+Jdwd9Uv5jl9H+HIXulRazOCmKN9XY=;
        b=g5p9Twf6y/hqia/jlRYrQewGIr9QMwDZHxA2lBg2t5hcvKbWO5/UhGVlXOMIpvN98k
         XVlqB/I8rxt7C+yJezq4ekDEMRAo/FvPNPejQeY94IgG1nt1Kx56NuuvLN8UogNVetJO
         FIxt3z2JU7z4X0KTv9jjPGTKmrPwihTy8gU4oFre3691zjblY8fKKaFEwWMpgho9o+os
         4NSOMzROUyG7BcHfBOztRRBjLycJazygDtrVFbVofcHyFDKimRAosglI14ObfPRnEQ+O
         Buzjyh0zsoJBKtrAgGcdTJPxVLJCclVlbY4CfMcmKzIIGPJJFCDnFnhD29WNZZ2C1uhY
         p5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374042; x=1691966042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wotN4kMeNFtpN+Jdwd9Uv5jl9H+HIXulRazOCmKN9XY=;
        b=Zni4TvN4vcc1d9HSlJ4shwm5yz6+76lJafie3LteRwzHwglFF0y9AWWkm0wFansjAk
         OpVRQY61vtDj/yjvf8bJeSjyWmbAh4/9srR72h8BWEDkFEtiwBS8gdVWFrKH8sH75Aaa
         VYVlrX7wiWM9FLQ+RNwXALRw4w2X92w2vBq5Td/ChdBq4EEkNQt6qSOHkO9UbLFbG2Bm
         oNjf5MaMDipA3qz2Z6Ag1tehX8tP1UH3Tn7Pp/fM4KFEF7PH6eGSIBMMr06CqEhFSH87
         N7XKe2B7z0c7E80bfWvRB7xzSKwfW5citqDh+Tw1yJ9IbJ5YVeqVopjyBs7CdhC1lAzt
         TjGg==
X-Gm-Message-State: ABy/qLalO+VzFqYl+jmPNmWBGP6aJXhISlDqHw2rpccK4W1Gq48pk4Dj
	5xriK7D5a8hUIbJx3XcgaQ9qzZrb0zNkFuMBdqA=
X-Google-Smtp-Source: APBJJlFIGLaHYcAY52mOEbZbo3RzLJC14jRS80LpyRSt7IlANlIo/TTNQg3odsE2xuEIKWz4TBHr+g==
X-Received: by 2002:a17:903:2351:b0:1b8:a31b:ac85 with SMTP id c17-20020a170903235100b001b8a31bac85mr6051173plh.41.1689374042484;
        Fri, 14 Jul 2023 15:34:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.34.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:34:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/26] kernel-module-split: make autoload and probeconf distribution specific
Date: Fri, 14 Jul 2023 12:32:57 -1000
Message-Id: <6725922eadd093e8ee6a41898b596b5563eab0f3.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184305

From: Jose Quaresma <quaresma.jose@gmail.com>

The modules-load.d [1] - Configure kernel modules to load at boot
should install their configuration files in /usr/lib/modules-load.d.

The modprobe.d [2] - Configuration directory for modprobe
should install their configuration files in /lib/modprobe.d

[1] https://man7.org/linux/man-pages/man5/modules-load.d.5.html
[2] https://man7.org/linux/man-pages/man5/modprobe.d.5.html

[YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12212

CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 347830e67c5ad72b4da165d644e3add69c20acb8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-module-split.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index c59e10adcd..0e4f9a6ec3 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -30,6 +30,9 @@ fi
 
 PACKAGE_WRITE_DEPS += "kmod-native depmodwrapper-cross"
 
+modulesloaddir ??= "${sysconfdir}/modules-load.d"
+modprobedir ??= "${sysconfdir}/modprobe.d"
+
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
 
@@ -88,7 +91,7 @@ python split_kernel_module_packages () {
 
         dvar = d.getVar('PKGD')
 
-        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
+        # If autoloading is requested, output ${modulesloaddir}/<name>.conf and append
         # appropriate modprobe commands to the postinst
         autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
         autoload = d.getVar('module_autoload_%s' % basename)
@@ -97,7 +100,7 @@ python split_kernel_module_packages () {
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
         if basename in autoloadlist:
-            conf = '/etc/modules-load.d/%s.conf' % basename
+            conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
             name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
@@ -119,7 +122,7 @@ python split_kernel_module_packages () {
         modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
         modconf = d.getVar('module_conf_%s' % basename)
         if modconf and basename in modconflist:
-            conf = '/etc/modprobe.d/%s.conf' % basename
+            conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
             name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
@@ -165,8 +168,8 @@ python split_kernel_module_packages () {
     postrm = d.getVar('pkg_postrm:modules')
 
     if splitmods != '1':
-        etcdir = d.getVar('sysconfdir')
-        d.appendVar('FILES:' + metapkg, '%s/modules-load.d/ %s/modprobe.d/ %s/modules/' % (etcdir, etcdir, d.getVar("nonarch_base_libdir")))
+        d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
+            (d.getVar('modulesloaddir'), d.getVar('modprobedir'), d.getVar("nonarch_base_libdir")))
         d.appendVar('pkg_postinst:%s' % metapkg, postinst)
         d.prependVar('pkg_postrm:%s' % metapkg, postrm);
         return
-- 
2.34.1


