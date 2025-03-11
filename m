Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D6CC35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:19:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.17697.1741717148854679521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=d+ZNdc2Q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025031118190627e5f53f36e5c0ef5a-jkfbol@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025031118190627e5f53f36e5c0ef5a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:19:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=W4PJibjXZr7Uqt6n/gEWkl4pk7Gr/uTR7YU8g8puu0w=;
 b=d+ZNdc2Q6wiIWEjVBIzuBwDID4eeJ6ZB7XDp0RNCJEBOSUqQO2/JDmeJJZXhPaXiyJvp3O
 KyE1TtW1Fhv2JXma5z8takckGnbJYJcgtcVh61Yhl24IYG4ztEoSoudzd4Fq1LmAYLBpe3cP
 AhNYlLC+GT90TrpH+NCDynObiL/CPImtnR9/pX9yp6kmNCuD5+z1xrXhS57Sqi0PuPFTCaBP
 qqWEJie/mhoTUgz2p2ZtSxU6PIiJ/JuSFGE5U8qhSAGGidrwuUmCGDequb11+yC3avUXs5bM
 RtXyqGvKEROb+YZ2jKvBBGOq4qIeUi2U8lUShdQvw+cjq9RgQur5Zf/Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 12/17] grub: patch CVE-2024-45777
Date: Tue, 11 Mar 2025 19:17:20 +0100
Message-Id: <20250311181725.8986-12-peter.marko@siemens.com>
In-Reply-To: <20250311181725.8986-1-peter.marko@siemens.com>
References: <20250311181725.8986-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 18:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212624

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2024-45777.patch           | 57 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45777.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45777.patch b/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
new file mode 100644
index 0000000000..0305a95fd5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
@@ -0,0 +1,57 @@
+From b970a5ed967816bbca8225994cd0ee2557bad515 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:57 +0000
+Subject: [PATCH] gettext: Integer overflow leads to heap OOB write
+
+The size calculation of the translation buffer in
+grub_gettext_getstr_from_position() may overflow
+to 0 leading to heap OOB write. This patch fixes
+the issue by using grub_add() and checking for
+an overflow.
+
+Fixes: CVE-2024-45777
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45777
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b970a5ed967816bbca8225994cd0ee2557bad515]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 63bb1ab73..9ffc73428 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -26,6 +26,7 @@
+ #include <grub/file.h>
+ #include <grub/kernel.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -99,6 +100,7 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
+   char *translation;
+   struct string_descriptor desc;
+   grub_err_t err;
++  grub_size_t alloc_sz;
+ 
+   internal_position = (off + position * sizeof (desc));
+ 
+@@ -109,7 +111,10 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
+   length = grub_cpu_to_le32 (desc.length);
+   offset = grub_cpu_to_le32 (desc.offset);
+ 
+-  translation = grub_malloc (length + 1);
++  if (grub_add (length, 1, &alloc_sz))
++    return NULL;
++
++  translation = grub_malloc (alloc_sz);
+   if (!translation)
+     return NULL;
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index e4dca6613c..fb33c2bd98 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-02.patch \
            file://CVE-2025-0622-03.patch \
            file://CVE-2024-45776.patch \
+           file://CVE-2024-45777.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

