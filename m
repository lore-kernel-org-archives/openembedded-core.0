Return-Path: <sergio.prado@e-labworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A30C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 19:29:58 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3096.1786994994730859867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 12:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e-labworks-com.20251104.gappssmtp.com header.s=20251104 header.b=dZ0O9MO7;
 spf=none, err=permanent DNS error (domain: e-labworks.com, ip: 209.85.214.179, mailfrom: sergio.prado@e-labworks.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d58efc7356so16956495ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 12:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=e-labworks-com.20251104.gappssmtp.com; s=20251104; t=1786994994; x=1787599794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdOZTzDL8d6p8ZitaOaX/ojdmwvnulWzdR28JSLvXjU=;
        b=dZ0O9MO7ttfl6/tdW4L8FQUBl10Zr1R1Ti8aKaa0z/T+D+qH1ol//nVFdf+Sl2c5vh
         qO+gBSRzqoC5dTcxAH+RUPsa9bnppr1Z2sNNgUEUrJq4bhPbRrx7KDi/Ld0+1bC3NRgm
         sC79EI4He6zQAXhRt6JMGV7Zo/YLHqE+7WXD1jtQrtTRVw95lF8ux+y5thsJ0f/AQtgh
         SIhzESdMx9fenaO4ZcQa8fvquuQ1dNUZIL8fcPKURTTzJEL9m/OLGr1NtJb39zXBjlTh
         Xf28P6fVzvVB9ZJ5S3pPMDSw1Cwr9IY6+1alfB7bTJuHbn6J2ypmmjssf0jzt7LW27tH
         ghQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994994; x=1787599794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdOZTzDL8d6p8ZitaOaX/ojdmwvnulWzdR28JSLvXjU=;
        b=Amt8Zv4edfjyraxFr2CzEYKlg0EGvBZ1HG0jESdu7mQH1s12Ttg984PWQfYYrymfUz
         GS4SUQH1Qija6CX+0E8Ll+JMxqpdoLFB9nXZHT0z41fQ3J2ha2KdhJ3c0fDLXBtd3Dcz
         qxspyclL8b0YtPfbPnyEaPvsRKttSI2coLgLHIQdKqMPyKZlqUvkNBLOT67TlIPRZzka
         8KTIR72W5Kobgy6xIWH/4ntkSA/HuJ2YdEfL46uz/lyKJysQngXFZjWO0zw9Bjk6UoHP
         Mza0Wcjb3PxlE7VmFz0S+nvNHjhAHoaoyuXq/tEPGtYYR/ZtlMdA/OR9TocXHBNg4ygy
         9KTQ==
X-Gm-Message-State: AOJu0Yzgk+VgXHZ4PvKkpZbkyfaOkuiXMf7bhJDoDComjsQ2/LtX/Iak
	BA3Vino0OPwpy5t55unz5Iw9B3ukfkc9LKfUOJq5Rs/Ul4H1zMVGoPvzqi1XPUJkiG+gnMTlL/a
	DBroZWLw=
X-Gm-Gg: AR+sD12ffUpkL1uNBQXg9qausDyrRZss+zOQQfULc+zg4Deks1fk9Dq8BvDOfWz/Jb2
	BPrwMntHIyDkgUwJnci9Sqf9jyiYZecrLLgkIRzkV1+9OQlJYAG9EUaVClFZ3zlqZeaYqQ5sUvp
	esZdB7x8HQef1tEflG+HSbbpW/443vGKZFB2o2kB1CL2aYRiAEEIGP1e81QGjQ6RmHWnhFDjmT/
	+QipYkh4W8mHb7//nIbnhuidrE6sgEE2Kw2g62iHmHijTMwoHApLmCaUfCEyT9fjqhIeLEMJb9p
	kUCfcUj5sZhEHDdBKRo9zz0xgo5SfcY9aq4JGxC+mAV6qFbUhfGw/W+vnJ9kHpPPb0/nBdIVxmt
	MhRl9qtxsTWoVQ68WiHWn2RqXcrzBc5jqlDZ3S7Yusq1v3PhfzBZhLUce6tGKPFg+W/leKfMC0q
	jDYW6Xu2P8LZ+i4YY0LcJJzYBja6jR7TYHbOHkvPy7hxdXC2pFk+Dg3MPj8WDWhYOzWJY=
X-Received: by 2002:a17:903:1a10:b0:2d5:ccb7:12c3 with SMTP id d9443c01a7336-2d5ccb713dfmr8155595ad.2.1786994994045;
        Mon, 17 Aug 2026 12:29:54 -0700 (PDT)
Received: from desktop.. ([2804:7f0:6402:934:c6a2:ede1:b425:a595])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd22f7sm12723418eec.1.2026.08.17.12.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:29:52 -0700 (PDT)
From: Sergio Prado <sergio.prado@e-labworks.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
	Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH] kernel-fit-image: reference the boot script as "script"
Date: Mon, 17 Aug 2026 16:29:23 -0300
Message-Id: <20260817192923.4159278-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 19:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243637

The boot script added to a fitImage through FIT_UBOOT_ENV is referenced
from the configuration nodes with a "bootscr" property. U-Boot does not
know that name. It looks the boot script up through the "script"
property, defined as FIT_SCRIPT_PROP in include/image.h and used by
image_locate_script() in boot/image-board.c. The same name is used in
the example image tree source in the documentation of the source
command in [1]:

    configurations {
        default = "conf-2";
        conf-1 { script = "script-1"; };
        conf-2 { script = "script-2"; };
    };

As a result the boot script cannot be reached through a configuration:

    source <addr>#<conf>   fails with "Could not find script in <conf>"

    source <addr>          falls back to the image named by the "default"
                           property of the /images node, which is not
                           generated either, and fails with "No FIT
                           subimage unit name"

    source <addr>:<image>  works, as the name of the image node is not
                           affected, but addresses the script directly
                           and therefore cannot tie it to a configuration,
                           which is a problem when one wants to boot
                           exclusively from a signed configuration as
                           part of a verified boot chain.

To fix it, rename the property to "script". The entries of "sign-images"
are property names of the configuration node, so rename that entry as well
to keep the boot script covered by the configuration signature, and update
the expected value in the fitimage selftest to match.

Verified on an i.MX95 board with U-Boot 2025.04 booting a fitImage built
with FIT_UBOOT_ENV. Before the change, 'source <addr>#conf-<dtb>' stopped
at "Could not find script in conf-<dtb>". With the change, the
configuration form runs the script and boots.

[1] https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 meta/lib/oe/fitimage.py                  | 4 ++--
 meta/lib/oeqa/selftest/cases/fitimage.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index d4dacdd508c8..c84eda4672e6 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -458,9 +458,9 @@ class ItsNodeRootKernel(ItsNode):
 
         if self._bootscr:
             conf_desc.append("u-boot script")
-            opt_props["bootscr"] = self._bootscr.name
+            opt_props["script"] = self._bootscr.name
             if self._sign_enable:
-                sign_entries.append("bootscr")
+                sign_entries.append("script")
 
         if self._setup:
             conf_desc.append("setup")
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 451878aafd85..4b7407282c7f 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -965,7 +965,7 @@ class KernelFitImageBase(FitImageTestCase):
         if bb_vars['INITRAMFS_IMAGE'] and bb_vars['INITRAMFS_IMAGE_BUNDLE'] != "1":
             sign_images += ', "ramdisk"'
         if bb_vars['FIT_UBOOT_ENV']:
-            sign_images += ', "bootscr"'
+            sign_images += ', "script"'
         if bb_vars.get('KERNEL_SETUP_BIN'):
             sign_images += ', "setup"'
         req_sigvalues_config = {
-- 
2.34.1


