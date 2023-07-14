Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7AFC0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:34:08 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.828.1689374039038930205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WzOXhQrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1843070a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374038; x=1691966038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03Mgy1gBQC1hBR/8tCRPID+MRtWI/DLl5gjUhJf3Q28=;
        b=WzOXhQrLktzpc1hzO7FhtgXYrHWHb3xAOirriAZNrpE2krf/1oXX+7QCgs9eiB2GlF
         fPFw0cPYUEg6KO0Kp1k7WnnrST3wP+IRQhbZNBb9j5D9V6B+gXRDkywZR92Xgt8GOyGy
         eEQvBcqm1jwKHkVPcZ4yOssqSv2vYJcdYC/LEzXSVybUcWiMFlzJuJwh+oq4sKI4U41t
         cv5q52lHGs7OyLZLPqFdwyOivsH5u99UfLT7JmF1kA4wvtZ3gwTYL8CCAwst2OwL35K7
         TYRAkSIgBPrlAofIMrAVwvDGri8JofR2Ye6BmsgkUiDFKm3h0xe+0XteH9UQzWK83BWL
         hzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374038; x=1691966038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03Mgy1gBQC1hBR/8tCRPID+MRtWI/DLl5gjUhJf3Q28=;
        b=KR28uVzQtL3Ow/9SE2+AtHRLRvzfr+c7OOFjEO9/I7V3ciP3wKAzJz4Ttn4jIdtbrD
         IKHpirGuQ70Mtq2JSlC1HI8rpEeWVcsDsj3vhq4eAWeSqKLmI4hPlbShg1i4goYp6YTI
         NpbbkN8qrv4GCBtrHGLsV0PCUf73p4GcQIdGXrnlvcjItKLSoTjNFlcUvdIr7jJOF8BZ
         Rx0BYKirvmKbM+MFWtXhGo0n8h0bmq8b2MK2RRG0sQVeJ4Pe9/G24m+qp4OCRYkdQllB
         ZKrm2/ZSxvgUg5/X9ACgWmH8v1MG12xMEh6yBOUkHo7BzElaJAt3aVyRdphhxw07UCla
         pSQg==
X-Gm-Message-State: ABy/qLbxZGqDN2vgdWlcjRLJfTn6cAUN99o/MgTxF+mIQgQy6qvAY4Nu
	48+LnKjrRS96bAiWkhY0lApDhJsphd8B+E6Txl8=
X-Google-Smtp-Source: APBJJlFKaSWcPcBUSI7kPzCDc4Z6FixkV2xtQvwDm1q6CRHKAxTNqeSW9o/0cVSVw8Al0SQCNM6p7w==
X-Received: by 2002:a17:902:6b4c:b0:1b8:400a:48f2 with SMTP id g12-20020a1709026b4c00b001b8400a48f2mr5205931plt.62.1689374037958;
        Fri, 14 Jul 2023 15:33:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/26] kernel-module-split: install config modules directories only when they are needed
Date: Fri, 14 Jul 2023 12:32:55 -1000
Message-Id: <455baf41550431c22047fe718c8eaae71924b23f.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184303

From: Jose Quaresma <quaresma.jose@gmail.com>

Instaed of allways create the directories and removing it at the if they are
not used, we can just do it when there are modules configuration to be created.
So the best thing to do is install the directories only when necessary.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71460993f350bca3d5a22115fd5551696f955c9f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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


