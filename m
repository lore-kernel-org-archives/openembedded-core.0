Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4518C35FF3
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.17565.1741716923043416534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 11:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Yo+WOtot;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202503111815283906134a0f33a2e7aa-7yir8x@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202503111815283906134a0f33a2e7aa
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 19:15:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7gloa8ISbM2rtVBixlZYD+g7etLvt/7a9eaWTaCiDHc=;
 b=Yo+WOtotrFLF8v9TO/ht44kA+S2zxeA5jna3o8qrA5gjsbq5ESiG72gzZdJj/AelrCpI4k
 SaM1oRakuUPLS3Ms3JXYqWWnMmz/QDayll9J9gW3SSDEDMHUW1CXqUAHJOU8YtOhIyYPfH1y
 vLCIHOyHdwkY/gv4f4WOgNAOBh5PMK181aPbOKgQ/oMwpUNhslRcQOW9WdyxuyncEyvkh+GM
 QbGuDyZwd1jy+30dz3t92bax+bP5C1ylXWeCIThUK0TlFpZu+5F2l6SPOTFOkvvGsFt6kiH7
 adc6JGiEGAmF6WkENpb5WI/hp4jObGBONnt5DI6/r6IkdIDZ89wsFX0w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 06/17] grub: patch CVE-2024-45783
Date: Tue, 11 Mar 2025 19:14:13 +0100
Message-Id: <20250311181424.8837-6-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212600

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../grub/files/CVE-2024-45783.patch           | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45783.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45783.patch b/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
new file mode 100644
index 0000000000..99c769961b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
@@ -0,0 +1,39 @@
+From f7c070a2e28dfab7137db0739fb8db1dc02d8898 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 06:22:51 +0100
+Subject: [PATCH] fs/hfsplus: Set a grub_errno if mount fails
+
+It was possible for mount to fail but not set grub_errno. This led to
+a possible double decrement of the module reference count if the NULL
+page was mapped.
+
+Fixing in general as a similar bug was fixed in commit 61b13c187
+(fs/hfsplus: Set grub_errno to prevent NULL pointer access) and there
+are likely more variants around.
+
+Fixes: CVE-2024-45783
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45783
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f7c070a2e28dfab7137db0739fb8db1dc02d8898]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/hfsplus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
+index 295822f69..de71fd486 100644
+--- a/grub-core/fs/hfsplus.c
++++ b/grub-core/fs/hfsplus.c
+@@ -405,7 +405,7 @@ grub_hfsplus_mount (grub_disk_t disk)
+ 
+  fail:
+ 
+-  if (grub_errno == GRUB_ERR_OUT_OF_RANGE)
++  if (grub_errno == GRUB_ERR_OUT_OF_RANGE || grub_errno == GRUB_ERR_NONE)
+     grub_error (GRUB_ERR_BAD_FS, "not a HFS+ filesystem");
+ 
+   grub_free (data);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 01d9be6bc2..05aea4cc6a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45781.patch \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45780.patch \
+           file://CVE-2024-45783.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"

