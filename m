Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 21A0B719E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 14:09:42 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cEzOJ-0003Sl-VT from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2016 06:09:44 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 8 Dec 2016 14:09:42 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2016 19:09:39 +0500
Message-ID: <1481206179-20877-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master][morty] grub2: fix some quirks and div by zero
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2016 14:09:43 -0000
Content-Type: text/plain

Rather than erroring out on a single attempt while
terminating EFI services, make a few retries because
such quirks are found in a few implementations.
Also fix a div by zero issue in the same framework
which causes an infinite reboot on the target.
Both patches included here are backports.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 ...ern-efi-mm.c-grub_efi_finish_boot_service.patch | 79 ++++++++++++++++++++++
 ...ern-efi-mm.c-grub_efi_get_memory_map-Neve.patch | 43 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  2 +
 3 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch

diff --git a/meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch b/meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
new file mode 100644
index 0000000..abf08e1
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
@@ -0,0 +1,79 @@
+From b258761d11946b28a847dff0768c3f271e13d60a Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Thu, 8 Dec 2016 18:21:12 +0500
+Subject: [PATCH 1/2] * grub-core/kern/efi/mm.c
+ (grub_efi_finish_boot_services):  Try terminating EFI services several times
+ due to quirks in some  implementations.
+
+Upstream-status: Backport [ http://git.savannah.gnu.org/cgit/grub.git/patch/?id=e75fdee420a7ad95e9a465c9699adc2e2e970440 ]
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+ grub-core/kern/efi/mm.c | 46 ++++++++++++++++++++++++++++++----------------
+ 1 file changed, 30 insertions(+), 16 deletions(-)
+
+diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
+index 461deb0..b00e0bc 100644
+--- a/grub-core/kern/efi/mm.c
++++ b/grub-core/kern/efi/mm.c
+@@ -167,27 +167,41 @@ grub_efi_finish_boot_services (grub_efi_uintn_t *outbuf_size, void *outbuf,
+ 			   apple, sizeof (apple)) == 0);
+ #endif
+ 
+-  if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
+-			       &finish_desc_size, &finish_desc_version) < 0)
+-    return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
++  while (1)
++    {
++      if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
++				   &finish_desc_size, &finish_desc_version) < 0)
++	return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
+ 
+-  if (outbuf && *outbuf_size < finish_mmap_size)
+-    return grub_error (GRUB_ERR_IO, "memory map buffer is too small");
++      if (outbuf && *outbuf_size < finish_mmap_size)
++	return grub_error (GRUB_ERR_IO, "memory map buffer is too small");
+ 
+-  finish_mmap_buf = grub_malloc (finish_mmap_size);
+-  if (!finish_mmap_buf)
+-    return grub_errno;
++      finish_mmap_buf = grub_malloc (finish_mmap_size);
++      if (!finish_mmap_buf)
++	return grub_errno;
+ 
+-  if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
+-			       &finish_desc_size, &finish_desc_version) <= 0)
+-    return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
++      if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
++				   &finish_desc_size, &finish_desc_version) <= 0)
++	{
++	  grub_free (finish_mmap_buf);
++	  return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
++	}
+ 
+-  b = grub_efi_system_table->boot_services;
+-  status = efi_call_2 (b->exit_boot_services, grub_efi_image_handle,
+-		       finish_key);
+-  if (status != GRUB_EFI_SUCCESS)
+-    return grub_error (GRUB_ERR_IO, "couldn't terminate EFI services");
++      b = grub_efi_system_table->boot_services;
++      status = efi_call_2 (b->exit_boot_services, grub_efi_image_handle,
++			   finish_key);
++      if (status == GRUB_EFI_SUCCESS)
++	break;
+ 
++      if (status != GRUB_EFI_INVALID_PARAMETER)
++	{
++	  grub_free (finish_mmap_buf);
++	  return grub_error (GRUB_ERR_IO, "couldn't terminate EFI services");
++	}
++
++      grub_free (finish_mmap_buf);
++      grub_printf ("Trying to terminate EFI services again\n");
++    }
+   grub_efi_is_finished = 1;
+   if (outbuf_size)
+     *outbuf_size = finish_mmap_size;
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch b/meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
new file mode 100644
index 0000000..0e735ff
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
@@ -0,0 +1,43 @@
+From 630de45f3d5f9a2dda7fad99acd21449b8c4111d Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Thu, 8 Dec 2016 18:27:01 +0500
+Subject: [PATCH 2/2] * grub-core/kern/efi/mm.c (grub_efi_get_memory_map):
+ Never  return a descriptor_size==0 to avoid potential divisions by zero.
+
+Upstream-status: Backport [ http://git.savannah.gnu.org/cgit/grub.git/commit/?id=69aee43fa64601cabf6efa9279c10d69b466662e ]
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+ grub-core/kern/efi/mm.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
+index b00e0bc..9f1d194 100644
+--- a/grub-core/kern/efi/mm.c
++++ b/grub-core/kern/efi/mm.c
+@@ -235,6 +235,7 @@ grub_efi_get_memory_map (grub_efi_uintn_t *memory_map_size,
+   grub_efi_boot_services_t *b;
+   grub_efi_uintn_t key;
+   grub_efi_uint32_t version;
++  grub_efi_uintn_t size;
+ 
+   if (grub_efi_is_finished)
+     {
+@@ -264,10 +265,14 @@ grub_efi_get_memory_map (grub_efi_uintn_t *memory_map_size,
+     map_key = &key;
+   if (! descriptor_version)
+     descriptor_version = &version;
++  if (! descriptor_size)
++    descriptor_size = &size;
+ 
+   b = grub_efi_system_table->boot_services;
+   status = efi_call_5 (b->get_memory_map, memory_map_size, memory_map, map_key,
+ 			      descriptor_size, descriptor_version);
++  if (*descriptor_size == 0)
++    *descriptor_size = sizeof (grub_efi_memory_descriptor_t);
+   if (status == GRUB_EFI_SUCCESS)
+     return 1;
+   else if (status == GRUB_EFI_BUFFER_TOO_SMALL)
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b10f633..677d860 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,6 +32,8 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
            file://fix-texinfo.patch \
            file://0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch \
+           file://0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch \
+           file://0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch \
             "
 
 DEPENDS = "flex-native bison-native autogen-native"
-- 
1.9.1


