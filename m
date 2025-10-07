Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D505ACCD183
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 22:11:59 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.2615.1759875118382986124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 15:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UM/gFKVz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202510072211561de7ad0a460002072e-aogfvp@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202510072211561de7ad0a460002072e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 00:11:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DLUntsI4mTJnmvz/7ZomNIQVaWiWphS2SPDRw/Nv94c=;
 b=UM/gFKVzxslS3DDyefvl4xppaeZnuOvFycOjiBfr3a4dfQ3liIGNDG7QzTI4Wd/KNldmam
 aIv142FXM9gHghxiokn5ivZk4m61UtWX+jeYMMbn0tRCKl7O3vJ9G/d5+RgO0eio5DT/F4pW
 tDcT6RnQtclnHv/d2SpTr3YfGhit5YvF/Z8ut9GINUcQ0AadWn3JBdauCjHLnfEnOy2rJOan
 5DSwVxDRgGbtu1zmQaZKONtbY8yvEB8bDDP1f4TgDUldllGVSlPUNqHupIBNYPf9B8UCufTQ
 8QpegZ8u63nCUlpw7h/cVOTpuEDvR9j1G3lKKcE1XG5y+z6G+lcS7xRg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/3] ghostscript: patch CVE-2025-59799
Date: Wed,  8 Oct 2025 00:11:41 +0200
Message-Id: <20251007221142.2772021-2-peter.marko@siemens.com>
In-Reply-To: <20251007221142.2772021-1-peter.marko@siemens.com>
References: <20251007221142.2772021-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 22:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224572

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ghostscript/CVE-2025-59799.patch          | 41 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
new file mode 100644
index 0000000000..3badd82f22
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
@@ -0,0 +1,41 @@
+From 6dab38fb211f15226c242ab7a83fa53e4b0ff781 Mon Sep 17 00:00:00 2001
+From: Piotr Kajda <petermasterperfect@gmail.com>
+Date: Thu, 8 May 2025 11:37:09 +0100
+Subject: [PATCH] pdfwrite - bounds check some strings
+
+Bug #708517
+
+This differs very slightly from the proposed patch in the bug report, I
+had a quick scout through the C file and found another similar case.
+
+Both fixed here.
+
+CVE: CVE-2025-59799
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/6dab38fb211f15226c242ab7a83fa53e4b0ff781]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ devices/vector/gdevpdfm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/devices/vector/gdevpdfm.c b/devices/vector/gdevpdfm.c
+index 5aa3644e2..4b1d7d89c 100644
+--- a/devices/vector/gdevpdfm.c
++++ b/devices/vector/gdevpdfm.c
+@@ -199,6 +199,8 @@ pdfmark_coerce_dest(gs_param_string *dstr, char dest[MAX_DEST_STRING])
+ {
+     const byte *data = dstr->data;
+     uint size = dstr->size;
++    if (size > MAX_DEST_STRING)
++        return_error(gs_error_limitcheck);
+     if (size == 0 || data[0] != '(')
+         return 0;
+     /****** HANDLE ESCAPES ******/
+@@ -848,6 +850,8 @@ pdfmark_put_ao_pairs(gx_device_pdf * pdev, cos_dict_t *pcd,
+             char buf[30];
+             int d0, d1;
+ 
++            if (Action[1].size > 29)
++                return_error(gs_error_rangecheck);
+             memcpy(buf, Action[1].data, Action[1].size);
+             buf[Action[1].size] = 0;
+             if (sscanf(buf, "%d %d R", &d0, &d1) == 2)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index c9fcaa7a16..349c007e94 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -77,6 +77,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27836-2.patch \
                 file://CVE-2025-48708.patch \
                 file://CVE-2025-59798.patch \
+                file://CVE-2025-59799.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \

