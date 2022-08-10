Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3FBC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:31 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.1034.1660170745374897924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kYcr3aJx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id z187so14936027pfb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=bF7OTwSd6FC4IO7RpM54x3lf1rlPV8FAYtQVegr7KfA=;
        b=kYcr3aJxAke7RByZopirAZQOuIKoqw6AYJET0OT/cstrxFo0SmQTx4PWPZqZXg0lMo
         7DxejgfG9e8lsOQhfV52V0mvArSzRjgOcw3mwfvOK+FggvSuFH241tGNnR6YQPc6crgZ
         OukMbZbKkeHv4s5L9VJZABrOvaXkS86Geq2RwVdPJXAeeNqVma0pvanLyDC/PbkiG7iP
         z0j29GyStx8BFE43UZ6zbbZ/lLAEaKtJzhdRzSprbNml/5bwZmeoDpF6WYGh9dLlvFer
         Ok8xobpxkP4gfn75RPkb/Q8GObbLEQfeyIQeX/yocqPzHDOAfDgYtW3hn2JwwtVZtC/2
         IIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=bF7OTwSd6FC4IO7RpM54x3lf1rlPV8FAYtQVegr7KfA=;
        b=pizA7MRfFopVAFr85MrDVwLzYISBtl5LxqZ5D1r0vbuOO00N73hEcreW965aDGBWoj
         NbbJUEfOk0xvVTU+5kjwe01gp3sd7iIBbUVoMw0ZvwOxzXjfRopSoAaBEFsn4iKE00hL
         ZPT+brg2OBZcJ2Wr0VKp4BQHMWIVE2OPgIu9AF+8SsdN0VgHrOAxVpQjnfCAk5NtY74x
         qFDCJ+63rbm7YUJJ+0PipF3ZSu+mda6viDk/wL9Cg43ji81BJwu2Zfw+caY8otLvsEUS
         RZWYP1LAgLV9HHTEyJYN4sXti80ascIXMyWrMWCGip8wHvXp1uaHxl5DCcoFKqH2DzxF
         mJww==
X-Gm-Message-State: ACgBeo0PWhMxcSJo2wVFcy2K1wXtw5MqXawEa14n0wnduFRHzfvX/zGC
	tCjVHjSrgomM819H/NGMpu5zbhkdwP/iOGJm
X-Google-Smtp-Source: 
 AA6agR5KhnQKnJsYsnqdZ3yijx/H8SzdUb07S84DcQOYHS7MiIigcx1/fuw3dtHThvbolvDsrvJfSw==
X-Received: by 2002:a63:5f09:0:b0:41c:da4f:e498 with SMTP id
 t9-20020a635f09000000b0041cda4fe498mr25006773pgb.276.1660170744110;
        Wed, 10 Aug 2022 15:32:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] grub2: Fix several security issue of integer
 underflow
Date: Wed, 10 Aug 2022 12:31:59 -1000
Message-Id: 
 <4608413d460fa351d583c357fbc9b1957cb3d1d6.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169214

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://git.savannah.gnu.org/gitweb/?p=grub.git
MR: 119763, 119779, 119807
Type: Security Fix
Disposition: Backport from https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=3e4817538de828319ba6d59ced2fbb9b5ca13287 && https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4 && https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=04c86e0bb7b58fc2f913f798cdb18934933e532d
ChangeID: ef7c28bc7b4eb32550df2cf49082791dac64ef1b
Description:
Fix CVEs:
	CVE-2022-28733
	CVE-2022-28734
	CVE-2022-28736

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2022-28733.patch           |  60 ++++
 .../grub/files/CVE-2022-28734.patch           |  67 +++++
 .../grub/files/CVE-2022-28736.patch           | 275 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 4 files changed, 405 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28733.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28733.patch b/meta/recipes-bsp/grub/files/CVE-2022-28733.patch
new file mode 100644
index 0000000000..6cfdf20e2d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28733.patch
@@ -0,0 +1,60 @@
+From 415fb5eb83cbd3b5cfc25ac1290f2de4fe3d231c Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 1 Aug 2022 10:48:34 +0530
+Subject: [PATCH] CVE-2022-28733
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=3e4817538de828319ba6d59ced2fbb9b5ca13287]
+CVE: CVE-2022-28733
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+net/ip: Do IP fragment maths safely
+
+We can receive packets with invalid IP fragmentation information. This
+can lead to rsm->total_len underflowing and becoming very large.
+
+Then, in grub_netbuff_alloc(), we add to this very large number, which can
+cause it to overflow and wrap back around to a small positive number.
+The allocation then succeeds, but the resulting buffer is too small and
+subsequent operations can write past the end of the buffer.
+
+Catch the underflow here.
+
+Fixes: CVE-2022-28733
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ grub-core/net/ip.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/net/ip.c b/grub-core/net/ip.c
+index ea5edf8..74e4e8b 100644
+--- a/grub-core/net/ip.c
++++ b/grub-core/net/ip.c
+@@ -25,6 +25,7 @@
+ #include <grub/net/netbuff.h>
+ #include <grub/mm.h>
+ #include <grub/priority_queue.h>
++#include <grub/safemath.h>
+ #include <grub/time.h>
+ 
+ struct iphdr {
+@@ -512,7 +513,14 @@ grub_net_recv_ip4_packets (struct grub_net_buff *nb,
+     {
+       rsm->total_len = (8 * (grub_be_to_cpu16 (iph->frags) & OFFSET_MASK)
+ 			+ (nb->tail - nb->data));
+-      rsm->total_len -= ((iph->verhdrlen & 0xf) * sizeof (grub_uint32_t));
++
++      if (grub_sub (rsm->total_len, (iph->verhdrlen & 0xf) * sizeof (grub_uint32_t),
++		    &rsm->total_len))
++	{
++	  grub_dprintf ("net", "IP reassembly size underflow\n");
++	  return GRUB_ERR_NONE;
++	}
++
+       rsm->asm_netbuff = grub_netbuff_alloc (rsm->total_len);
+       if (!rsm->asm_netbuff)
+ 	{
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28734.patch b/meta/recipes-bsp/grub/files/CVE-2022-28734.patch
new file mode 100644
index 0000000000..577ec10bea
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28734.patch
@@ -0,0 +1,67 @@
+From f03f09c2a07eae7f3a4646e33a406ae2689afb9e Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 1 Aug 2022 10:59:41 +0530
+Subject: [PATCH] CVE-2022-28734
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4]
+CVE: CVE-2022-28734
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+net/http: Fix OOB write for split http headers
+
+GRUB has special code for handling an http header that is split
+across two packets.
+
+The code tracks the end of line by looking for a "\n" byte. The
+code for split headers has always advanced the pointer just past the
+end of the line, whereas the code that handles unsplit headers does
+not advance the pointer. This extra advance causes the length to be
+one greater, which breaks an assumption in parse_line(), leading to
+it writing a NUL byte one byte past the end of the buffer where we
+reconstruct the line from the two packets.
+
+It's conceivable that an attacker controlled set of packets could
+cause this to zero out the first byte of the "next" pointer of the
+grub_mm_region structure following the current_line buffer.
+
+Do not advance the pointer in the split header case.
+
+Fixes: CVE-2022-28734
+---
+ grub-core/net/http.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/grub-core/net/http.c b/grub-core/net/http.c
+index 5aa4ad3..a220d21 100644
+--- a/grub-core/net/http.c
++++ b/grub-core/net/http.c
+@@ -68,7 +68,15 @@ parse_line (grub_file_t file, http_data_t data, char *ptr, grub_size_t len)
+   char *end = ptr + len;
+   while (end > ptr && *(end - 1) == '\r')
+     end--;
++
++  /* LF without CR. */
++  if (end == ptr + len)
++    {
++      data->errmsg = grub_strdup (_("invalid HTTP header - LF without CR"));
++      return GRUB_ERR_NONE;
++    }
+   *end = 0;
++
+   /* Trailing CRLF.  */
+   if (data->in_chunk_len == 1)
+     {
+@@ -190,9 +198,7 @@ http_receive (grub_net_tcp_socket_t sock __attribute__ ((unused)),
+ 	  int have_line = 1;
+ 	  char *t;
+ 	  ptr = grub_memchr (nb->data, '\n', nb->tail - nb->data);
+-	  if (ptr)
+-	    ptr++;
+-	  else
++	  if (ptr == NULL)
+ 	    {
+ 	      have_line = 0;
+ 	      ptr = (char *) nb->tail;
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28736.patch b/meta/recipes-bsp/grub/files/CVE-2022-28736.patch
new file mode 100644
index 0000000000..4fc9fdaf05
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28736.patch
@@ -0,0 +1,275 @@
+From 431a111c60095fc973d83fe9209f26f29ce78784 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 1 Aug 2022 11:17:17 +0530
+Subject: [PATCH] CVE-2022-28736
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=04c86e0bb7b58fc2f913f798cdb18934933e532d]
+CVE: CVE-2022-28736
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+loader/efi/chainloader: Use grub_loader_set_ex()
+
+This ports the EFI chainloader to use grub_loader_set_ex() in order to fix
+a use-after-free bug that occurs when grub_cmd_chainloader() is executed
+more than once before a boot attempt is performed.
+
+Fixes: CVE-2022-28736
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ grub-core/commands/boot.c          | 66 ++++++++++++++++++++++++++----
+ grub-core/loader/efi/chainloader.c | 46 +++++++++++----------
+ include/grub/loader.h              |  5 +++
+ 3 files changed, 87 insertions(+), 30 deletions(-)
+
+diff --git a/grub-core/commands/boot.c b/grub-core/commands/boot.c
+index bbca81e..6151478 100644
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
+diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
+index a8d7b91..93a028a 100644
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -44,33 +44,28 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+ static grub_dl_t my_mod;
+ 
+-static grub_efi_physical_address_t address;
+-static grub_efi_uintn_t pages;
+-static grub_efi_device_path_t *file_path;
+-static grub_efi_handle_t image_handle;
+-static grub_efi_char16_t *cmdline;
+-
+ static grub_err_t
+-grub_chainloader_unload (void)
++grub_chainloader_unload (void *context)
+ {
++  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
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
+@@ -139,7 +134,7 @@ make_file_path (grub_efi_device_path_t *dp, const char *filename)
+   char *dir_start;
+   char *dir_end;
+   grub_size_t size;
+-  grub_efi_device_path_t *d;
++  grub_efi_device_path_t *d, *file_path;
+ 
+   dir_start = grub_strchr (filename, ')');
+   if (! dir_start)
+@@ -215,11 +210,15 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
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
++  grub_efi_handle_t image_handle = NULL;
+ 
+   if (argc == 0)
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
+@@ -227,11 +226,6 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
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
+@@ -401,7 +395,11 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
+   grub_file_close (file);
+   grub_device_close (dev);
+ 
+-  grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
++  /* We're finished with the source image buffer and file path now. */
++  efi_call_2 (b->free_pages, address, pages);
++  grub_free (file_path);
++
++  grub_loader_set_ex (grub_chainloader_boot, grub_chainloader_unload, image_handle, 0);
+   return 0;
+ 
+  fail:
+@@ -412,11 +410,15 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
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
++    efi_call_1 (b->unload_image, image_handle);
++
+   grub_dl_unref (my_mod);
+ 
+   return grub_errno;
+diff --git a/include/grub/loader.h b/include/grub/loader.h
+index 7f82a49..3071a50 100644
+--- a/include/grub/loader.h
++++ b/include/grub/loader.h
+@@ -39,6 +39,11 @@ void EXPORT_FUNC (grub_loader_set) (grub_err_t (*boot) (void),
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
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0b7ca6d3d6..a248af0073 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -99,6 +99,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2021-3695.patch \
            file://CVE-2021-3696.patch \
            file://CVE-2021-3697.patch \
+           file://CVE-2022-28733.patch \
+           file://CVE-2022-28734.patch \
+           file://CVE-2022-28736.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


