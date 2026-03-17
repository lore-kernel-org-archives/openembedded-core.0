Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368C6FD8755
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 12:13:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74512.1773749591346345129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 05:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V2uIvQHa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b49819938so574955f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773749589; x=1774354389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqBFXNLotwpuLUjHJyj2SJSFKd5hCBpM4jxvF+8rzdQ=;
        b=V2uIvQHavT3/f5yfmEaVjJsIUqdXExmM0sPGq6Q1zd9nhCTRg1wsbrT+cXe0X7z7w2
         WF8MBcb0/dyqJsAN1+2JNc8gbw23BSSon49J50G2TielJKqxtEW08HOfQlJfKHNlGtHP
         L5vssqs2u8Y/MzHdsjOOq/A6K15zCETc+ZVwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749589; x=1774354389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqBFXNLotwpuLUjHJyj2SJSFKd5hCBpM4jxvF+8rzdQ=;
        b=iEm99VmOvYU4N2hrS0FgSKEF1QqThpShVwBp4hT0PGP4uzntoEeneUEwfigt86aSHa
         VYR1wKtDxtOe/iCJ/7gdYSGwCcyhblKT9WluWKC28HW+A4VBj9pyNv5/2Or8na2HzK56
         5PAGI0t7mt4VhW3dPxi8+4NrPJFkLlVDlfES1Er/KTu11g6gs55vPyUvQRz9rSxiWWCs
         BQX+17i/VBVYxzTRJcgfAxiT2XaqDgQZhGKTbvas8JTEVM4i/ewy/4eiJjakEJgz1Mtp
         OqSk67hSSTpGmi9VMJXD4J1nJri3yvcDf58DD6+vZVZJEHd66uYcuzeoSyaJBTavDvag
         X/EA==
X-Gm-Message-State: AOJu0Yzqjx9ATwMSdRurSq6f6few3FTdZOcnTHPIj4yiNKFqge9olwLF
	S0Ac/kO1zY82mDXY2Zy83Hmx2elH5HtiwF3eFisG1tCfP+b/rx0yYxn23ZfaH12WZiL7WqqOcN+
	1uhxxHfc=
X-Gm-Gg: ATEYQzxLIkk9fPAD2O4vvZBiBx+Cmwf0FeyHdHHWdhJP2q8ae/XkLiDCLc0A7wWGQAW
	JCyNWNYdg+5Uh7a+0b35hbbYkaYa82a1oonmx9vTCxq2u1+/P2te+/NxdVFR49ppZWZmcxZrDCY
	cOZk4c0Vzu8Ya3gDvbWKmkmdQuI37Lg0RGR4lwEhzHvATc/Ap127GUNNvGzNoRHXuZS8tk2QhwM
	RXOBNytKeevcwUMFJIoJOl+Me0ZMdR9T8E69/Q0txMxQLJmdWtWXjXI85QSFeuMP8OfSKacyGuA
	Cb0PrX2pvUyR/mjs9+HkCib74vW0fn9QJ88+n5evOQawQdgb0xzlOuRyrDHJG80WwyCPnuB41Er
	M9R6M2unAPIkDvM3umCs1TbhsTs9YE6ynkt8VYd8slV4ELzgzE8o3RUvgOwCuKwN/d55d32wppk
	CxyKUMU2M2cwoTpANviewYCyMoXOoWB24unHXytcZFWJMYDm4qAXc=
X-Received: by 2002:a05:600c:8b6f:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-48556700bcemr278129715e9.21.1773749588913;
        Tue, 17 Mar 2026 05:13:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:183c:b889:ee72:b492])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6ce2fsm114689195e9.25.2026.03.17.05.13.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:13:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] license: Fix sstate hash conflict issues
Date: Tue, 17 Mar 2026 12:13:07 +0000
Message-ID: <20260317121307.935437-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 12:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233320

Currently, SSTATE_PKGARCH is injected into the sstate packages themselves but
the output of do_populate_lic is meant to be architecture invariant.

Instead of putting it into the package, use that part of the path as the
installation location. This makes the sstate packages architecture invariant
and avoids hash mismatch issues.

Since the sstate install path isn't part of the task checksums, we can just
remove all the LICENSE_DEPLOY_PATHCOMPONENT code entirely. do_populate_lic doesn't
run for native/cross.

I suspect this was what I'd originally intended when I added SSTATE_PKGARCH to
the path but things weren't quite done correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/license.bbclass | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index af5f1ed41df..2d4ad6df267 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -18,14 +18,8 @@ LICENSE_CREATE_PACKAGE ??= "0"
 LICENSE_PACKAGE_SUFFIX ??= "-lic"
 LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
 
-LICENSE_DEPLOY_PATHCOMPONENT = "${SSTATE_PKGARCH}"
-LICENSE_DEPLOY_PATHCOMPONENT:class-cross = "native"
-LICENSE_DEPLOY_PATHCOMPONENT:class-native = "native"
-# Ensure the *value* of SSTATE_PKGARCH is captured as it is used in the output paths
-LICENSE_DEPLOY_PATHCOMPONENT[vardepvalue] += "${LICENSE_DEPLOY_PATHCOMPONENT}"
-
 addtask populate_lic after do_patch before do_build
-do_populate_lic[dirs] = "${LICSSTATEDIR}/${LICENSE_DEPLOY_PATHCOMPONENT}/${PN}"
+do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
 python do_populate_lic() {
@@ -35,7 +29,7 @@ python do_populate_lic() {
     lic_files_paths = find_license_files(d)
 
     # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('LICENSE_DEPLOY_PATHCOMPONENT'), d.getVar('PN'))
+    destdir = os.path.join(d.getVar('LICSSTATEDIR'),  d.getVar('PN'))
     copy_license_files(lic_files_paths, destdir)
     info = get_recipe_info(d)
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:
@@ -256,7 +250,7 @@ def find_license_files(d):
 
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
-do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
+do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/${SSTATE_PKGARCH}/"
 
 IMAGE_CLASSES:append = " license_image"
 

