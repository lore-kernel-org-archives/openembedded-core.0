Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEDFC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 12:57:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.14369.1721307422136654893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 05:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HLlZrKTK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4272738eb9eso2465625e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721307420; x=1721912220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh7qBLyPE+60s9dJ+ScqxMApHU3PXRSlRx0EoF+ajbk=;
        b=HLlZrKTKpV6Bhk2NSJbQtOTCmj3MEWomMecvF49xFJ0D7z+vz2ineywXAi7pEYev7B
         9pPGzEIQ7HdLXGHjpdKSmVKMHkJvCJbeI4bWDMleY7PfIr0rMaI9BG2PviKTPmDEkmTQ
         AG/2xWXeZ9IYpohRsPbOIifYYsCThWz6yV0As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721307420; x=1721912220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh7qBLyPE+60s9dJ+ScqxMApHU3PXRSlRx0EoF+ajbk=;
        b=eLBJoYzcz9jn0Zosggg6/E42gqGpwX2I/DiYzVb/gAcqkPdPs760/+O/Ghn+tGRodv
         vZBu2WODtF8tBkO7aMRJn0k8kAWM+wGP1PqG4RRNrt1q7CnOYu7TQO1DgeKM9ToO+HRl
         gI2IaifahwoofZJHBACgn/4Uj/8hjYmLNNqNCg1LYdVjy6pO5ZHL90tC+UUaFtaGChuS
         NyoUjvWY92r8M51TIaK0WvEDNkyUdFLBleY789lyQioTkvTODE7GWYL2Liwz4Mw3aWYY
         NlTK6hhX10nJG5vPb5KAFZMBiUjGBDkdy8yv4q8qwh8D0DI0zoXyfkTUOsWtg80PgGQQ
         pNyQ==
X-Gm-Message-State: AOJu0YysYKHNM+pjyeCG+OGii1I2r5V8zCaA7QvP37OMyQpIUo8N8BNv
	YPs1clbwWy/YQj5HJo5CdBRa+Od9Ra9ieZj/Cy8LKf54+uAsYCRNETpq3o1FCW0VsF0RXKDoPRh
	m
X-Google-Smtp-Source: AGHT+IF10grtnj49t9bdkBV0p64A1t7it511M6I0kW+PhmdaOl28orp6bh8HinmDll9owbd3O99LaA==
X-Received: by 2002:a05:600c:3b0c:b0:426:67df:31e6 with SMTP id 5b1f17b1804b1-427c2cc283dmr32397915e9.17.1721307419979;
        Thu, 18 Jul 2024 05:56:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:490f:365a:34f5:8141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a635cdsm13375165e9.13.2024.07.18.05.56.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:56:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: Drop mips workaround
Date: Thu, 18 Jul 2024 13:56:57 +0100
Message-ID: <20240718125658.4067198-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 12:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202209

In local testing this appears to not be needed any more. Since the bash dependency
is painful in many different ways, particularly being injected at do_package time,
drop it all.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6a5ab56436e..4a15c97d938 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -155,20 +155,6 @@ do_install () {
 	rm ${D}${datadir}/qemu/hppa* -f
 }
 
-# The following fragment will create a wrapper for qemu-mips user emulation
-# binary in order to work around a segmentation fault issue. Basically, by
-# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
-# This will trigger a MMU access fault in the virtual CPU. With this change,
-# the qemu-mips works fine.
-# IMPORTANT: This piece needs to be removed once the root cause is fixed!
-do_install:append() {
-	if [ -e "${D}/${bindir}/qemu-mips" ]; then
-		create_wrapper ${D}/${bindir}/qemu-mips \
-			QEMU_RESERVED_VA=0x0
-	fi
-}
-# END of qemu-mips workaround
-
 # Disable kvm/virgl/mesa on targets that do not support it
 PACKAGECONFIG:remove:darwin = "kvm virglrenderer epoxy gtk+"
 PACKAGECONFIG:remove:mingw32 = "kvm virglrenderer epoxy gtk+ pie"
@@ -258,9 +244,6 @@ python split_qemu_packages () {
     subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
     if subpackages:
         d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
-    mipspackage = d.getVar('PN') + "-user-mips"
-    if mipspackage in ' '.join(subpackages):
-        d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
 }
 
 # Put the guest agent in a separate package

