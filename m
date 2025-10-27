Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97617CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:58:14 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.2482.1761598689361104414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=iZAbF221;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20251027205807b110c7520300020750-zknul5@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20251027205807b110c7520300020750
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 21:58:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Jh0+WE2VZ0YyK9gMdFuzhhyeyquDjismwrvyCEMHa0k=;
 b=iZAbF221n3TJWexkJWP1LRABCSX5dfBoTR+/wUFpd6kA3qCOKnZp0eITZEW+I1xbnkGPNa
 b2UKZfDtJ1bx+/cYA60XAX/z7XrsFncLkwQ+JF2zpS6stYySskmgC2Kf2oBk9hQLVRSzXxYK
 1bfi3jt49BIBJEcZEkRme0te15VmolTWFIuzPhtIUp7T3btve5hRHJ/uI+9ZEMJnKt4XbymJ
 xNJs3EMdesS19zfQcqkqjmjNXLc/h1nSVNlivmwOr4VGWfu8QC0qRONHVHgJzN+OaCjkFBmg
 brF7OJv1oBMAFG+0QA8mbl+ZZFDcrS0ENQUm3I6XKSmdnWfsaOHthvrw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: kavinaya@qti.qualcomm.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] Revert "kernel-fit-image: control kernel section with FIT_LINUX_BIN"
Date: Mon, 27 Oct 2025 21:56:48 +0100
Message-ID: <20251027205741.2452251-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251027205741.2452251-1-adrian.freihofer@siemens.com>
References: <20251027205741.2452251-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225359

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This reverts the commit (Oe-core 0d17c4fb514f0b9f2117a844cdf00ed52631380a)
which recently introduced the FIT_LINUX_BIN variable to control kernel
section inclusion in FIT images.

The original change aimed to provide flexibility by:
- Enabling FIT images without kernel sections for specific use cases
  by setting FIT_LINUX_BIN to an empty value.
- Supporting alternative kernel binary filenames instead of hardcoding
  "linux.bin" in multiple places.

However, the current implementation is incomplete. The filename
customization is not implemented - the code still hardcodes "linux.bin"
and doesn't actually use the variable in a consistent way.
There is also no test coverage for this new functionality.

Rather than completing the partial implementation, Qualcomm decided to
develop a solution that better aligns with their specific requirements
and may be independent of the kernel-fit-image class.

The revert restores the previous consistent behavior with unconditional
kernel section inclusion. This saves us from adding test coverage,
documentation and maintenance for this new but currently known to be
unused and incomplete feature. This feature can be reintroduced later
if there is a clear need and a complete implementation.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 16b6ab7b2fd..fd0d21ceeee 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -63,14 +63,12 @@ python do_compile() {
     )
 
     # Prepare a kernel image section.
-    linux_bin = d.getVar('FIT_LINUX_BIN')
-    if linux_bin:
-        shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
-        with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
-            linux_comp = linux_comp_f.read()
-        root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
-            d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
-            d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
+    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"), "linux.bin")
+    with open(os.path.join(kernel_deploydir, "linux_comp")) as linux_comp_f:
+        linux_comp = linux_comp_f.read()
+    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin", linux_comp,
+        d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
+        d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'), d.getVar("UBOOT_ENTRYSYMBOL"))
 
     # Prepare a DTB image section
     kernel_devicetree = d.getVar('KERNEL_DEVICETREE')
-- 
2.51.0


