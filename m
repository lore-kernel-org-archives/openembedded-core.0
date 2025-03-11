Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45D8C35FF4
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.17565.1741716923043416534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D3faXvLb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250311181526e0ae8d3f4ecc25d91b-2byvms@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250311181526e0ae8d3f4ecc25d91b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8JWt3s15EafF3cMbbpQb0dg29nm/KHvDOI5jOTyCW+g=;
 b=D3faXvLb7H1muUYeLfqzOzrCcV2mfqwjuoRJvr3Dpim/jcuINkk8yxVlnejEDw0DKn6g3E
 Him2SP5jHzJ2GsIyxTMoL2N1in6jSKyV577MkPxdZyUHIxE6PxN3Sk9MpaIINiF0KDz+ovGD
 Hl67+wljf1OTpzZWfJdTwP0NUDLZdmJXycGvA7usCWYD9JtTeXWMjB50mbILnjv2tJ66SntK
 RozLaU0lZlsjW97lIZveB6xM+x6eQpWHXlfrXtXwSpl3XTw3GiNE1H4AgNdCNwM3c2eZWpMv
 qlqYRPPO/piXUcelGCygFS0PcrG9snjWfqriuT8xq2i/OAoRT/pjAtGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 05/17] grub: patch CVE-2024-45780
Date: Tue, 11 Mar 2025 19:14:12 +0100
Message-Id: <20250311181424.8837-5-peter.marko@siemens.com>
In-Reply-To: <20250311181424.8837-1-peter.marko@siemens.com>
References: <20250311181424.8837-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212599

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2024-45780.patch           | 93 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45780.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45780.patch b/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
new file mode 100644
index 0000000000..1de0099f94
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45780.patch
@@ -0,0 +1,93 @@
+From 0087bc6902182fe5cedce2d034c75a79cf6dd4f3 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:58 +0000
+Subject: [PATCH] fs/tar: Integer overflow leads to heap OOB write
+
+Both namesize and linksize are derived from hd.size, a 12-digit octal
+number parsed by read_number(). Later direct arithmetic calculation like
+"namesize + 1" and "linksize + 1" may exceed the maximum value of
+grub_size_t leading to heap OOB write. This patch fixes the issue by
+using grub_add() and checking for an overflow.
+
+Fixes: CVE-2024-45780
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45780
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=0087bc6902182fe5cedce2d034c75a79cf6dd4f3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/tar.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
+index 646bce5eb..386c09022 100644
+--- a/grub-core/fs/tar.c
++++ b/grub-core/fs/tar.c
+@@ -25,6 +25,7 @@
+ #include <grub/mm.h>
+ #include <grub/dl.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -76,6 +77,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ {
+   struct head hd;
+   int reread = 0, have_longname = 0, have_longlink = 0;
++  grub_size_t sz;
+ 
+   data->hofs = data->next_hofs;
+ 
+@@ -97,7 +99,11 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	{
+ 	  grub_err_t err;
+ 	  grub_size_t namesize = read_number (hd.size, sizeof (hd.size));
+-	  *name = grub_malloc (namesize + 1);
++
++	  if (grub_add (namesize, 1, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("name size overflow"));
++
++	  *name = grub_malloc (sz);
+ 	  if (*name == NULL)
+ 	    return grub_errno;
+ 	  err = grub_disk_read (data->disk, 0,
+@@ -117,15 +123,19 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	{
+ 	  grub_err_t err;
+ 	  grub_size_t linksize = read_number (hd.size, sizeof (hd.size));
+-	  if (data->linkname_alloc < linksize + 1)
++
++	  if (grub_add (linksize, 1, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("link size overflow"));
++
++	  if (data->linkname_alloc < sz)
+ 	    {
+ 	      char *n;
+-	      n = grub_calloc (2, linksize + 1);
++	      n = grub_calloc (2, sz);
+ 	      if (!n)
+ 		return grub_errno;
+ 	      grub_free (data->linkname);
+ 	      data->linkname = n;
+-	      data->linkname_alloc = 2 * (linksize + 1);
++	      data->linkname_alloc = 2 * (sz);
+ 	    }
+ 
+ 	  err = grub_disk_read (data->disk, 0,
+@@ -148,7 +158,10 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	  while (extra_size < sizeof (hd.prefix)
+ 		 && hd.prefix[extra_size])
+ 	    extra_size++;
+-	  *name = grub_malloc (sizeof (hd.name) + extra_size + 2);
++
++	  if (grub_add (sizeof (hd.name) + 2, extra_size, &sz))
++	    return grub_error (GRUB_ERR_BAD_FS, N_("long name size overflow"));
++	  *name = grub_malloc (sz);
+ 	  if (*name == NULL)
+ 	    return grub_errno;
+ 	  if (hd.prefix[0])
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f5112d773d..01d9be6bc2 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-misc-Implement-grub_strlcpy.patch \
            file://CVE-2024-45781.patch \
            file://CVE-2024-45782_CVE-2024-56737.patch \
+           file://CVE-2024-45780.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

