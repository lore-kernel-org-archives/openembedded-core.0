Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524D1C10F1B
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.4576.1670539390403713244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2BahmLhI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d7so2966799pll.9
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aN9OXZmVfS/qZWcCCbZ71dDvtqHHnAIpuMFxmt0jDWU=;
        b=2BahmLhINoxPsTb8AMaAZvAx11HN6Y40NC73QyyiiFHKwIyvINZEenvuZXxfnMZYBW
         cMJyOQkH9nqZulzq6lYOb+RNVmS6c4uX3y2R8OKLoxEpL8FSvZGNWkK5xERhiUYVObCa
         B9mjzWyewosDFz45PwW/8EDexFpX4+TYcL90QOI6DLlTxnX9dp70pwtwSSE96qyOYEbh
         NJxwP4lY4GexyIgxm2Y/ejLnZ0xcG0u3fNDFmRdyxnm04j3gl0mswfT/kx3NVAb6wioe
         rFYSNN7nByHeVwyjPG3jM8PLQxXHC24ragJTgN2pQJ8kmvU6SFOTpqeL/Pe+FKiFVkKt
         gtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aN9OXZmVfS/qZWcCCbZ71dDvtqHHnAIpuMFxmt0jDWU=;
        b=JrO5jC+AHkhhifEcNGAAL48dNEEguoIfMh+HQn8nRSLKUXmIgWcOXh2nVy0rcFVU++
         VdE/QRJv+CEFjnOsZvKYAduZ3ODIpq8xhkG0G3NKLoHAPsyFPw+3A3MP70hpk2grmUJC
         jLae7cxfoN4bxrQyu4+UhE3YYxnFVOspcyi4foz30M+RCPOrVqe0gKXourn+GAtBlMOj
         NYAGcwjxIPaG4Xd9f2EapINBMi2af5wXJclPx9e44+mJaXcFgZ6B7c416QbdZAORen1c
         EROJL7W2VHSUmtGcIvNbZ3TEmP3rdDQF9X0x6N4mNq+Ta/Kmlg5f6kAlMpW65lSCmAJP
         FpIw==
X-Gm-Message-State: ANoB5pnqhBA+oLtTqdCRaIs6VHRXjI7zGS8CmFasPC4myuADs+2aXIYk
	9c0+Zo5LcWE2eG3YZ6SeweITQuGDgSVBy2tW7xALGg==
X-Google-Smtp-Source: AA0mqf68TOIZzQ3l3S60hP9gIjqTJWGDIjth/8phHR1Robr9jcijynBcjj8vXvzpVqvmwVfpzXBJYg==
X-Received: by 2002:a17:902:9a0a:b0:185:441e:90dd with SMTP id v10-20020a1709029a0a00b00185441e90ddmr3419505plp.67.1670539389236;
        Thu, 08 Dec 2022 14:43:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/12] grub: backport patches to fix CVE-2022-28736
Date: Thu,  8 Dec 2022 12:42:45 -1000
Message-Id: <01be69264e4bf66cd1cb5acf949263d955171fc4.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174417

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...i-chainloader-Use-grub_loader_set_ex.patch |  86 +++++++++
 ...ot-Add-API-to-pass-context-to-loader.patch | 168 ++++++++++++++++++
 ...hainloader-Simplify-the-loader-state.patch | 129 ++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 4 files changed, 386 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
 create mode 100644 meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
 create mode 100644 meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch b/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
new file mode 100644
index 0000000000..5741e53f42
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
@@ -0,0 +1,86 @@
+From 04c86e0bb7b58fc2f913f798cdb18934933e532d Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 5 Apr 2022 11:48:58 +0100
+Subject: [PATCH] loader/efi/chainloader: Use grub_loader_set_ex()
+
+This ports the EFI chainloader to use grub_loader_set_ex() in order to fix
+a use-after-free bug that occurs when grub_cmd_chainloader() is executed
+more than once before a boot attempt is performed.
+
+Fixes: CVE-2022-28736
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-28736
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=04c86e0bb7b58fc2f913f798cdb18934933e532d
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/loader/efi/chainloader.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
+index d1602c89b..7557eb269 100644
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -44,11 +44,10 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+ static grub_dl_t my_mod;
+ 
+-static grub_efi_handle_t image_handle;
+-
+ static grub_err_t
+-grub_chainloader_unload (void)
++grub_chainloader_unload (void *context)
+ {
++  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
+   grub_efi_loaded_image_t *loaded_image;
+   grub_efi_boot_services_t *b;
+ 
+@@ -64,8 +63,9 @@ grub_chainloader_unload (void)
+ }
+ 
+ static grub_err_t
+-grub_chainloader_boot (void)
++grub_chainloader_boot (void *context)
+ {
++  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
+   grub_efi_boot_services_t *b;
+   grub_efi_status_t status;
+   grub_efi_uintn_t exit_data_size;
+@@ -225,6 +225,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   grub_efi_physical_address_t address = 0;
+   grub_efi_uintn_t pages = 0;
+   grub_efi_char16_t *cmdline = NULL;
++  grub_efi_handle_t image_handle = NULL;
+ 
+   if (argc == 0)
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
+@@ -405,7 +406,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   efi_call_2 (b->free_pages, address, pages);
+   grub_free (file_path);
+ 
+-  grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
++  grub_loader_set_ex (grub_chainloader_boot, grub_chainloader_unload, image_handle, 0);
+   return 0;
+ 
+  fail:
+@@ -423,10 +424,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+     efi_call_2 (b->free_pages, address, pages);
+ 
+   if (image_handle != NULL)
+-    {
+-      efi_call_1 (b->unload_image, image_handle);
+-      image_handle = NULL;
+-    }
++    efi_call_1 (b->unload_image, image_handle);
+ 
+   grub_dl_unref (my_mod);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch b/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
new file mode 100644
index 0000000000..a2c0530f04
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
@@ -0,0 +1,168 @@
+From 14ceb3b3ff6db664649138442b6562c114dcf56e Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 5 Apr 2022 10:58:28 +0100
+Subject: [PATCH] commands/boot: Add API to pass context to loader
+
+Loaders rely on global variables for saving context which is consumed
+in the boot hook and freed in the unload hook. In the case where a loader
+command is executed twice, calling grub_loader_set() a second time executes
+the unload hook, but in some cases this runs when the loader's global
+context has already been updated, resulting in the updated context being
+freed and potential use-after-free bugs when the boot hook is subsequently
+called.
+
+This adds a new API, grub_loader_set_ex(), which allows a loader to specify
+context that is passed to its boot and unload hooks. This is an alternative
+to requiring that loaders call grub_loader_unset() before mutating their
+global context.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=14ceb3b3ff6db664649138442b6562c114dcf56e
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/commands/boot.c | 66 ++++++++++++++++++++++++++++++++++-----
+ include/grub/loader.h     |  5 +++
+ 2 files changed, 63 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/commands/boot.c b/grub-core/commands/boot.c
+index bbca81e94..61514788e 100644
+--- a/grub-core/commands/boot.c
++++ b/grub-core/commands/boot.c
+@@ -27,10 +27,20 @@
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+-static grub_err_t (*grub_loader_boot_func) (void);
+-static grub_err_t (*grub_loader_unload_func) (void);
++static grub_err_t (*grub_loader_boot_func) (void *context);
++static grub_err_t (*grub_loader_unload_func) (void *context);
++static void *grub_loader_context;
+ static int grub_loader_flags;
+ 
++struct grub_simple_loader_hooks
++{
++  grub_err_t (*boot) (void);
++  grub_err_t (*unload) (void);
++};
++
++/* Don't heap allocate this to avoid making grub_loader_set() fallible. */
++static struct grub_simple_loader_hooks simple_loader_hooks;
++
+ struct grub_preboot
+ {
+   grub_err_t (*preboot_func) (int);
+@@ -44,6 +54,29 @@ static int grub_loader_loaded;
+ static struct grub_preboot *preboots_head = 0,
+   *preboots_tail = 0;
+ 
++static grub_err_t
++grub_simple_boot_hook (void *context)
++{
++  struct grub_simple_loader_hooks *hooks;
++
++  hooks = (struct grub_simple_loader_hooks *) context;
++  return hooks->boot ();
++}
++
++static grub_err_t
++grub_simple_unload_hook (void *context)
++{
++  struct grub_simple_loader_hooks *hooks;
++  grub_err_t ret;
++
++  hooks = (struct grub_simple_loader_hooks *) context;
++
++  ret = hooks->unload ();
++  grub_memset (hooks, 0, sizeof (*hooks));
++
++  return ret;
++}
++
+ int
+ grub_loader_is_loaded (void)
+ {
+@@ -110,28 +143,45 @@ grub_loader_unregister_preboot_hook (struct grub_preboot *hnd)
+ }
+ 
+ void
+-grub_loader_set (grub_err_t (*boot) (void),
+-		 grub_err_t (*unload) (void),
+-		 int flags)
++grub_loader_set_ex (grub_err_t (*boot) (void *context),
++		    grub_err_t (*unload) (void *context),
++		    void *context,
++		    int flags)
+ {
+   if (grub_loader_loaded && grub_loader_unload_func)
+-    grub_loader_unload_func ();
++    grub_loader_unload_func (grub_loader_context);
+ 
+   grub_loader_boot_func = boot;
+   grub_loader_unload_func = unload;
++  grub_loader_context = context;
+   grub_loader_flags = flags;
+ 
+   grub_loader_loaded = 1;
+ }
+ 
++void
++grub_loader_set (grub_err_t (*boot) (void),
++		 grub_err_t (*unload) (void),
++		 int flags)
++{
++  grub_loader_set_ex (grub_simple_boot_hook,
++		      grub_simple_unload_hook,
++		      &simple_loader_hooks,
++		      flags);
++
++  simple_loader_hooks.boot = boot;
++  simple_loader_hooks.unload = unload;
++}
++
+ void
+ grub_loader_unset(void)
+ {
+   if (grub_loader_loaded && grub_loader_unload_func)
+-    grub_loader_unload_func ();
++    grub_loader_unload_func (grub_loader_context);
+ 
+   grub_loader_boot_func = 0;
+   grub_loader_unload_func = 0;
++  grub_loader_context = 0;
+ 
+   grub_loader_loaded = 0;
+ }
+@@ -158,7 +208,7 @@ grub_loader_boot (void)
+ 	  return err;
+ 	}
+     }
+-  err = (grub_loader_boot_func) ();
++  err = (grub_loader_boot_func) (grub_loader_context);
+ 
+   for (cur = preboots_tail; cur; cur = cur->prev)
+     if (! err)
+diff --git a/include/grub/loader.h b/include/grub/loader.h
+index b20864282..97f231054 100644
+--- a/include/grub/loader.h
++++ b/include/grub/loader.h
+@@ -40,6 +40,11 @@ void EXPORT_FUNC (grub_loader_set) (grub_err_t (*boot) (void),
+ 				    grub_err_t (*unload) (void),
+ 				    int flags);
+ 
++void EXPORT_FUNC (grub_loader_set_ex) (grub_err_t (*boot) (void *context),
++				       grub_err_t (*unload) (void *context),
++				       void *context,
++				       int flags);
++
+ /* Unset current loader, if any.  */
+ void EXPORT_FUNC (grub_loader_unset) (void);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch b/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
new file mode 100644
index 0000000000..a43025d425
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
@@ -0,0 +1,129 @@
+From 1469983ebb9674753ad333d37087fb8cb20e1dce Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 5 Apr 2022 10:02:04 +0100
+Subject: [PATCH] loader/efi/chainloader: Simplify the loader state
+
+The chainloader command retains the source buffer and device path passed
+to LoadImage(), requiring the unload hook passed to grub_loader_set() to
+free them. It isn't required to retain this state though - they aren't
+required by StartImage() or anything else in the boot hook, so clean them
+up before grub_cmd_chainloader() finishes.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=1469983ebb9674753ad333d37087fb8cb20e1dce
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ grub-core/loader/efi/chainloader.c | 38 +++++++++++++++++-------------
+ 1 file changed, 21 insertions(+), 17 deletions(-)
+
+diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
+index 2bd80f4db..d1602c89b 100644
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -44,25 +44,20 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+ static grub_dl_t my_mod;
+ 
+-static grub_efi_physical_address_t address;
+-static grub_efi_uintn_t pages;
+-static grub_efi_device_path_t *file_path;
+ static grub_efi_handle_t image_handle;
+-static grub_efi_char16_t *cmdline;
+ 
+ static grub_err_t
+ grub_chainloader_unload (void)
+ {
++  grub_efi_loaded_image_t *loaded_image;
+   grub_efi_boot_services_t *b;
+ 
++  loaded_image = grub_efi_get_loaded_image (image_handle);
++  if (loaded_image != NULL)
++    grub_free (loaded_image->load_options);
++
+   b = grub_efi_system_table->boot_services;
+   efi_call_1 (b->unload_image, image_handle);
+-  efi_call_2 (b->free_pages, address, pages);
+-
+-  grub_free (file_path);
+-  grub_free (cmdline);
+-  cmdline = 0;
+-  file_path = 0;
+ 
+   grub_dl_unref (my_mod);
+   return GRUB_ERR_NONE;
+@@ -140,7 +135,7 @@ make_file_path (grub_efi_device_path_t *dp, const char *filename)
+   char *dir_start;
+   char *dir_end;
+   grub_size_t size;
+-  grub_efi_device_path_t *d;
++  grub_efi_device_path_t *d, *file_path;
+ 
+   dir_start = grub_strchr (filename, ')');
+   if (! dir_start)
+@@ -222,11 +217,14 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   grub_efi_status_t status;
+   grub_efi_boot_services_t *b;
+   grub_device_t dev = 0;
+-  grub_efi_device_path_t *dp = 0;
++  grub_efi_device_path_t *dp = NULL, *file_path = NULL;
+   grub_efi_loaded_image_t *loaded_image;
+   char *filename;
+   void *boot_image = 0;
+   grub_efi_handle_t dev_handle = 0;
++  grub_efi_physical_address_t address = 0;
++  grub_efi_uintn_t pages = 0;
++  grub_efi_char16_t *cmdline = NULL;
+ 
+   if (argc == 0)
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
+@@ -234,11 +232,6 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+ 
+   grub_dl_ref (my_mod);
+ 
+-  /* Initialize some global variables.  */
+-  address = 0;
+-  image_handle = 0;
+-  file_path = 0;
+-
+   b = grub_efi_system_table->boot_services;
+ 
+   file = grub_file_open (filename, GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE);
+@@ -408,6 +401,10 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   grub_file_close (file);
+   grub_device_close (dev);
+ 
++  /* We're finished with the source image buffer and file path now. */
++  efi_call_2 (b->free_pages, address, pages);
++  grub_free (file_path);
++
+   grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
+   return 0;
+ 
+@@ -419,11 +416,18 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   if (file)
+     grub_file_close (file);
+ 
++  grub_free (cmdline);
+   grub_free (file_path);
+ 
+   if (address)
+     efi_call_2 (b->free_pages, address, pages);
+ 
++  if (image_handle != NULL)
++    {
++      efi_call_1 (b->unload_image, image_handle);
++      image_handle = NULL;
++    }
++
+   grub_dl_unref (my_mod);
+ 
+   return grub_errno;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 270efd30ef..c14fe315d3 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -35,6 +35,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
            file://CVE-2022-2601.patch \
            file://CVE-2022-3775.patch \
+           file://loader-efi-chainloader-Simplify-the-loader-state.patch \
+           file://commands-boot-Add-API-to-pass-context-to-loader.patch \
+           file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.25.1


