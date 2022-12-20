Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC081C4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 04:41:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.43417.1671511284143519904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 20:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=O9eFKw9t;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso15343253pjt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 20:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GbbMtQ+3fUF4MZXUbLVm4124+StYsjWqTpI3HMk0Py0=;
        b=O9eFKw9t/NeBNJdutPbSrDwZxZ2G7kdnoDAIzRqkP+c+KF6b3MrUnC24RBSB0zn64J
         iZfCRtSmS6/+NO1xbQkhgbswNlZCWx6alj3+rnD80vJf7Iv+lH/DL3YzOUSn6aPQwjhU
         gDlJd6nBA/qNuQidUujBP17lS7T+SLkjV+27U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbbMtQ+3fUF4MZXUbLVm4124+StYsjWqTpI3HMk0Py0=;
        b=NuQ1hHWnhEaYOQeNkBGIxt+X58oJl580xzgIeyRrdkv+2RXf/tP7LUChOohRKiR5MP
         ovXFi5iehngyUgYkKTTCPpYgXjw7yE4sbh5dY1zb2iOVHzR3pnERHG0Aqj8JTeVjOwBT
         2tDWf8u5Ib2Q2UUjDpO3ZSi9JPP91wYp1SGfi62CyrGQoh0Ww5wtaj2g85A+YMgF3jMv
         z2Iw4irghD2bFHuTyDtYF10jWpZhNyb6jDhdzkfoxkN/frrjHa9poAhIAcvK+KqFaIpN
         E3MQlaJDdf+SPaC15TvtMRIzqCyXPWngb5kDqbuTYZ7Znqp1VD39M6yHYiNYoRQYpWYu
         349A==
X-Gm-Message-State: ANoB5plvL2v2W7ICxYc1MzvnKP1+T2xxe4f+3kGx+fjshbAd6m57YD4q
	kxj+kAxIONxVlZ45HW+bl/SrBQJp+/wMefxh
X-Google-Smtp-Source: AA0mqf4D7sfH1O+Vo8SWpqCPPOYu0YwdzxnZywcgD2iEaeeH5AoZD9sCYZy1GNIGmdDxgK2CgENA6g==
X-Received: by 2002:a17:90a:ad81:b0:219:64d0:9e39 with SMTP id s1-20020a17090aad8100b0021964d09e39mr47069632pjq.12.1671511283236;
        Mon, 19 Dec 2022 20:41:23 -0800 (PST)
Received: from MVIN00024 ([27.121.101.101])
        by smtp.gmail.com with ESMTPSA id p21-20020a63f455000000b004767bc37e03sm7230247pgk.39.2022.12.19.20.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 20:41:22 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 20 Dec 2022 10:11:17 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] grub2: CVE-2022-28735 shim_lock verifier allows non-kernel files to be loaded
Date: Tue, 20 Dec 2022 10:11:16 +0530
Message-Id: <20221220044116.34479-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 04:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174837

Upstream-Status: Backport from https://git.savannah.gnu.org/cgit/grub.git/commit/?id=6fe755c5c07bb386fda58306bfd19e4a1c974c53

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../grub/files/CVE-2022-28735.patch           | 271 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 272 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28735.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28735.patch b/meta/recipes-bsp/grub/files/CVE-2022-28735.patch
new file mode 100644
index 0000000000..89b653a8da
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28735.patch
@@ -0,0 +1,271 @@
+From 6fe755c5c07bb386fda58306bfd19e4a1c974c53 Mon Sep 17 00:00:00 2001
+From: Julian Andres Klode <julian.klode@canonical.com>
+Date: Thu, 2 Dec 2021 15:03:53 +0100
+Subject: kern/efi/sb: Reject non-kernel files in the shim_lock verifier
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=6fe755c5c07bb386fda58306bfd19e4a1c974c53]
+CVE: CVE-2022-28735
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+We must not allow other verifiers to pass things like the GRUB modules.
+Instead of maintaining a blocklist, maintain an allowlist of things
+that we do not care about.
+
+This allowlist really should be made reusable, and shared by the
+lockdown verifier, but this is the minimal patch addressing
+security concerns where the TPM verifier was able to mark modules
+as verified (or the OpenPGP verifier for that matter), when it
+should not do so on shim-powered secure boot systems.
+
+Fixes: CVE-2022-28735
+
+Signed-off-by: Julian Andres Klode <julian.klode@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ grub-core/kern/efi/sb.c | 221 ++++++++++++++++++++++++++++++++++++++++
+ include/grub/verify.h   |   1 +
+ 2 files changed, 222 insertions(+)
+ create mode 100644 grub-core/kern/efi/sb.c
+
+diff --git a/grub-core/kern/efi/sb.c b/grub-core/kern/efi/sb.c
+new file mode 100644
+index 0000000..89c4bb3
+--- /dev/null
++++ b/grub-core/kern/efi/sb.c
+@@ -0,0 +1,221 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2020  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ *
++ *  UEFI Secure Boot related checkings.
++ */
++
++#include <grub/efi/efi.h>
++#include <grub/efi/pe32.h>
++#include <grub/efi/sb.h>
++#include <grub/env.h>
++#include <grub/err.h>
++#include <grub/file.h>
++#include <grub/i386/linux.h>
++#include <grub/kernel.h>
++#include <grub/mm.h>
++#include <grub/types.h>
++#include <grub/verify.h>
++
++static grub_efi_guid_t shim_lock_guid = GRUB_EFI_SHIM_LOCK_GUID;
++
++/*
++ * Determine whether we're in secure boot mode.
++ *
++ * Please keep the logic in sync with the Linux kernel,
++ * drivers/firmware/efi/libstub/secureboot.c:efi_get_secureboot().
++ */
++grub_uint8_t
++grub_efi_get_secureboot (void)
++{
++  static grub_efi_guid_t efi_variable_guid = GRUB_EFI_GLOBAL_VARIABLE_GUID;
++  grub_efi_status_t status;
++  grub_efi_uint32_t attr = 0;
++  grub_size_t size = 0;
++  grub_uint8_t *secboot = NULL;
++  grub_uint8_t *setupmode = NULL;
++  grub_uint8_t *moksbstate = NULL;
++  grub_uint8_t secureboot = GRUB_EFI_SECUREBOOT_MODE_UNKNOWN;
++  const char *secureboot_str = "UNKNOWN";
++
++  status = grub_efi_get_variable ("SecureBoot", &efi_variable_guid,
++				  &size, (void **) &secboot);
++
++  if (status == GRUB_EFI_NOT_FOUND)
++    {
++      secureboot = GRUB_EFI_SECUREBOOT_MODE_DISABLED;
++      goto out;
++    }
++
++  if (status != GRUB_EFI_SUCCESS)
++    goto out;
++
++  status = grub_efi_get_variable ("SetupMode", &efi_variable_guid,
++				  &size, (void **) &setupmode);
++
++  if (status != GRUB_EFI_SUCCESS)
++    goto out;
++
++  if ((*secboot == 0) || (*setupmode == 1))
++    {
++      secureboot = GRUB_EFI_SECUREBOOT_MODE_DISABLED;
++      goto out;
++    }
++
++  /*
++   * See if a user has put the shim into insecure mode. If so, and if the
++   * variable doesn't have the runtime attribute set, we might as well
++   * honor that.
++   */
++  status = grub_efi_get_variable_with_attributes ("MokSBState", &shim_lock_guid,
++						  &size, (void **) &moksbstate, &attr);
++
++  /* If it fails, we don't care why. Default to secure. */
++  if (status != GRUB_EFI_SUCCESS)
++    {
++      secureboot = GRUB_EFI_SECUREBOOT_MODE_ENABLED;
++      goto out;
++    }
++
++  if (!(attr & GRUB_EFI_VARIABLE_RUNTIME_ACCESS) && *moksbstate == 1)
++    {
++      secureboot = GRUB_EFI_SECUREBOOT_MODE_DISABLED;
++      goto out;
++    }
++
++  secureboot = GRUB_EFI_SECUREBOOT_MODE_ENABLED;
++
++ out:
++  grub_free (moksbstate);
++  grub_free (setupmode);
++  grub_free (secboot);
++
++  if (secureboot == GRUB_EFI_SECUREBOOT_MODE_DISABLED)
++    secureboot_str = "Disabled";
++  else if (secureboot == GRUB_EFI_SECUREBOOT_MODE_ENABLED)
++    secureboot_str = "Enabled";
++
++  grub_dprintf ("efi", "UEFI Secure Boot state: %s\n", secureboot_str);
++
++  return secureboot;
++}
++
++static grub_err_t
++shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
++			 enum grub_file_type type,
++			 void **context __attribute__ ((unused)),
++			 enum grub_verify_flags *flags)
++{
++  *flags = GRUB_VERIFY_FLAGS_NONE;
++
++  switch (type & GRUB_FILE_TYPE_MASK)
++    {
++    /* Files we check. */
++    case GRUB_FILE_TYPE_LINUX_KERNEL:
++    case GRUB_FILE_TYPE_MULTIBOOT_KERNEL:
++    case GRUB_FILE_TYPE_BSD_KERNEL:
++    case GRUB_FILE_TYPE_XNU_KERNEL:
++    case GRUB_FILE_TYPE_PLAN9_KERNEL:
++    case GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE:
++      *flags = GRUB_VERIFY_FLAGS_SINGLE_CHUNK;
++      return GRUB_ERR_NONE;
++
++    /* Files that do not affect secureboot state. */
++    case GRUB_FILE_TYPE_NONE:
++    case GRUB_FILE_TYPE_LOOPBACK:
++    case GRUB_FILE_TYPE_LINUX_INITRD:
++    case GRUB_FILE_TYPE_OPENBSD_RAMDISK:
++    case GRUB_FILE_TYPE_XNU_RAMDISK:
++    case GRUB_FILE_TYPE_SIGNATURE:
++    case GRUB_FILE_TYPE_PUBLIC_KEY:
++    case GRUB_FILE_TYPE_PUBLIC_KEY_TRUST:
++    case GRUB_FILE_TYPE_PRINT_BLOCKLIST:
++    case GRUB_FILE_TYPE_TESTLOAD:
++    case GRUB_FILE_TYPE_GET_SIZE:
++    case GRUB_FILE_TYPE_FONT:
++    case GRUB_FILE_TYPE_ZFS_ENCRYPTION_KEY:
++    case GRUB_FILE_TYPE_CAT:
++    case GRUB_FILE_TYPE_HEXCAT:
++    case GRUB_FILE_TYPE_CMP:
++    case GRUB_FILE_TYPE_HASHLIST:
++    case GRUB_FILE_TYPE_TO_HASH:
++    case GRUB_FILE_TYPE_KEYBOARD_LAYOUT:
++    case GRUB_FILE_TYPE_PIXMAP:
++    case GRUB_FILE_TYPE_GRUB_MODULE_LIST:
++    case GRUB_FILE_TYPE_CONFIG:
++    case GRUB_FILE_TYPE_THEME:
++    case GRUB_FILE_TYPE_GETTEXT_CATALOG:
++    case GRUB_FILE_TYPE_FS_SEARCH:
++    case GRUB_FILE_TYPE_LOADENV:
++    case GRUB_FILE_TYPE_SAVEENV:
++    case GRUB_FILE_TYPE_VERIFY_SIGNATURE:
++      *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
++      return GRUB_ERR_NONE;
++
++    /* Other files. */
++    default:
++      return grub_error (GRUB_ERR_ACCESS_DENIED, N_("prohibited by secure boot policy"));
++    }
++}
++
++static grub_err_t
++shim_lock_verifier_write (void *context __attribute__ ((unused)), void *buf, grub_size_t size)
++{
++  grub_efi_shim_lock_protocol_t *sl = grub_efi_locate_protocol (&shim_lock_guid, 0);
++
++  if (!sl)
++    return grub_error (GRUB_ERR_ACCESS_DENIED, N_("shim_lock protocol not found"));
++
++  if (sl->verify (buf, size) != GRUB_EFI_SUCCESS)
++    return grub_error (GRUB_ERR_BAD_SIGNATURE, N_("bad shim signature"));
++
++  return GRUB_ERR_NONE;
++}
++
++struct grub_file_verifier shim_lock_verifier =
++  {
++    .name = "shim_lock_verifier",
++    .init = shim_lock_verifier_init,
++    .write = shim_lock_verifier_write
++  };
++
++void
++grub_shim_lock_verifier_setup (void)
++{
++  struct grub_module_header *header;
++  grub_efi_shim_lock_protocol_t *sl =
++    grub_efi_locate_protocol (&shim_lock_guid, 0);
++
++  /* shim_lock is missing, check if GRUB image is built with --disable-shim-lock. */
++  if (!sl)
++    {
++      FOR_MODULES (header)
++	{
++	  if (header->type == OBJ_TYPE_DISABLE_SHIM_LOCK)
++	    return;
++	}
++    }
++
++  /* Secure Boot is off. Do not load shim_lock. */
++  if (grub_efi_get_secureboot () != GRUB_EFI_SECUREBOOT_MODE_ENABLED)
++    return;
++
++  /* Enforce shim_lock_verifier. */
++  grub_verifier_register (&shim_lock_verifier);
++
++  grub_env_set ("shim_lock", "y");
++  grub_env_export ("shim_lock");
++}
+diff --git a/include/grub/verify.h b/include/grub/verify.h
+index cd129c3..672ae16 100644
+--- a/include/grub/verify.h
++++ b/include/grub/verify.h
+@@ -24,6 +24,7 @@
+ 
+ enum grub_verify_flags
+   {
++    GRUB_VERIFY_FLAGS_NONE		= 0,
+     GRUB_VERIFY_FLAGS_SKIP_VERIFICATION	= 1,
+     GRUB_VERIFY_FLAGS_SINGLE_CHUNK	= 2,
+     /* Defer verification to another authority. */
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a248af0073..777839d0b6 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -102,6 +102,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-28733.patch \
            file://CVE-2022-28734.patch \
            file://CVE-2022-28736.patch \
+           file://CVE-2022-28735.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


