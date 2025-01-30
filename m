Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7885C02195
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.7683.1738205501243893217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YWKePFIj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21bc1512a63so5347155ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205500; x=1738810300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8y8HeHktV3FLWcvoOOtcnC0slrtDxWbgrzGl0cbXCM=;
        b=YWKePFIjbooc1KYX2R6sSv8vTKiffZJqp5QxYP0C7j6mlgHvjseUTk2JpZYZPQhkpE
         yV2JjXpVWfrKOTvc5II++D3tNRcgWrbGSDJaqf9Yn+RYBlM+oxaQdnEu3H5LbewuvhCW
         6DbIgPKiUHJ1Fan0eBY+n2VbOFhl/sRRsHBShze3G+ItsaEJkXNEmiuJaKtF3g29iS4S
         VIQf+xAsthkYDIwfeF5l7tUeEwSgcmkEUpHLvoC7KI6CZium77I0FMZ9Lo9TwRAmwO07
         KtRzq0yxAOzKaSOvqhrE98qCmCz3h8W7cKkOnekiJkXI7+4mkM7EtLcs68jVHxOJ1oMy
         hQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205500; x=1738810300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8y8HeHktV3FLWcvoOOtcnC0slrtDxWbgrzGl0cbXCM=;
        b=M0hNbpE8ZYht12DOOBbjbsATZ+lT/LOo4YnhGQcnwrxOdnm/Hm/oj5mM41vEDJ6J6+
         GCymvECZ+hsm/VJW8Cbbti0w2eou/UgBWvCW8Cswh8fXn2jrn/1OfYUA1M9eWV5fJChL
         xv6V+hvV1ZyRb82gdvRTs64orGYBA6xbH6TrErTL25pZv8kV09uc5HSToL533bxdD9sn
         ZX+4Njwak9/dU48bBQWwzHsOOcYcpkVDKGmwiemWFMpGBGS3ajjxaHuUchX3Dp+ePQff
         viuMa+qCEQGflP1rufBVIdNyuTFHn+CC1BuDFEiWxWWPHQ9F4Ww/9/+4aH594yn7HN0X
         Koog==
X-Gm-Message-State: AOJu0YyT1UItgkhMAfczb0hRmdcjhvsdhhl0yfriuwQ6VLexrxq3lJrY
	s0Ney9t6D50zu44yVjAqAuRxYTREN2UW+VOMCC3vQ68sPRwpm0ts6VyrdxGAtILE4DW3K2Qu2Pn
	UbRg=
X-Gm-Gg: ASbGncuHRfn/hqpVAN85StL9kA8/cLwOzocTAjF73czx9vJ8LOAB+kUOtHePQFuu1kQ
	mQz09Zj4+05CzF2obd/1+y91gHKISqekvBOQi5x6mCGyyGAe5l5GNoFGAlz9psGcc3TydzaNUAg
	qOZrm1Cdxr4rEHxUFnVPCZ4mPx/HpeOADLe7CZYO39LtKhVTqfFR8KlCJc+NYd9C5Geg0jiwVIK
	3BJrGnvM+SqweAMKJZfCQNz2EqWI1FBptcQTAkORiCpPO8ISVwpZN3lORpH2aX9awxTDHgJWms+
	W7it
X-Google-Smtp-Source: AGHT+IHS7on8TCmVfsxeL0Abo1dcfFQlRJ2iEIu8027aZZ253mePLm0EcgFnuZdQC99CZteh/MlbSA==
X-Received: by 2002:a17:903:11cd:b0:215:7719:24f6 with SMTP id d9443c01a7336-21dd7d788ffmr77711175ad.23.1738205500519;
        Wed, 29 Jan 2025 18:51:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/12] uboot-config: fix devtool modify with kernel-fitimage
Date: Wed, 29 Jan 2025 18:51:13 -0800
Message-ID: <37835788d0772568f3551532eacbf810a4a6e47b.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210433

From: Adrian Freihofer <adrian.freihofer@siemens.com>

How to reproduce:
- UBOOT_CONFIG must be used. With UBOOT_MACHINE it works fine.
  A simple example based on oe-core is to modify the
  beaglebone-yocto.conf file like this:
  -UBOOT_MACHINE = "am335x_evm_defconfig"
  +UBOOT_CONFIG = "foo"
  +UBOOT_CONFIG[foo] = "am335x_evm_defconfig"
- A build configuration which inherits the kernel-fitimage.bbclass is
  needed. For example:
  MACHINE = "beaglebone-yocto"
  KERNEL_IMAGETYPE = "Image"
  KERNEL_IMAGETYPES += " fitImage "
  KERNEL_CLASSES = " kernel-fitimage "

devtool modify linux-yocto
devtool build linux-yocto
...
| cp: cannot stat '.../linux-yocto-6.6.21+git/am335x_evm_defconfig/.config':
  No such file or directory
| WARNING: .../linux-yocto/6.6.21+git/temp/run.do_configure.2081673:172 exit 1
  from 'cp .../linux-yocto-6.6.21+git/am335x_evm_defconfig/.config
  .../build/workspace/sources/linux-yocto/.config.baseline'

The reason for this problem is that the uboot-config.bbclass sets the
variable KCONFIG_CONFIG_ROOTDIR to a path that makes sense for u-boot,
but not for other recipes. However, the kernel-fitimage.bbclasse, for
example, inherits the uboot-config.bbclass, which brings the
u-boot-specific path into the kernel build context.

This change removes the uboot-specific KCONFIG_CONFIG_ROOTDIR path from
recipes other than u-boot itself.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from b23581a22619c52724c8e078f29e871e2ee74259)
Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-config.bbclass | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index e55fc38b7c..bf21961977 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -101,12 +101,12 @@ python () {
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
     ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
+    recipename = d.getVar("PN")
 
     if not ubootmachine and not ubootconfig:
-        PN = d.getVar("PN")
         FILE = os.path.basename(d.getVar("FILE"))
         bb.debug(1, "To build %s, see %s for instructions on \
-                 setting up your machine config" % (PN, FILE))
+                 setting up your machine config" % (recipename, FILE))
         raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
     if ubootmachine and ubootconfig:
@@ -140,9 +140,12 @@ python () {
             if not found:
                 raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
 
-            if len(ubootconfig) == 1:
-                d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
-            else:
-                # Disable menuconfig for multiple configs
-                d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
+            # This recipe might be inherited e.g. by the kernel recipe via kernel-fitimage.bbclass
+            # Ensure the uboot specific menuconfig settings do not leak into other recipes
+            if 'u-boot' in recipename:
+                if len(ubootconfig) == 1:
+                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
+                else:
+                    # Disable menuconfig for multiple configs
+                    d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
 }
-- 
2.43.0


