Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A219F779B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:07:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v35C7smb019677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 05:07:54 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Apr 2017 05:07:53 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Apr 2017 15:06:51 +0300
Message-ID: <1491394011-5609-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ghostscript: CVE-2017-7207
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
X-List-Received-Date: Wed, 05 Apr 2017 12:07:55 -0000
Content-Type: text/plain

The mem_get_bits_rectangle function in Artifex Software, Inc.
Ghostscript 9.20 allows remote attackers to cause a denial
of service (NULL pointer dereference) via a crafted PostScript
document.

Reference:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7207

Upstream patch:
http://git.ghostscript.com/?p=ghostpdl.git;h=309eca4e0a31ea70dcc844812691439312dad091

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../ghostscript/ghostscript/CVE-2017-7207.patch    | 39 ++++++++++++++++++++++
 .../ghostscript/ghostscript_9.20.bb                |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
new file mode 100644
index 0000000..a05dc02
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
@@ -0,0 +1,39 @@
+From 0e88bee1304993668fede72498d656a2dd33a35e Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Mon, 20 Mar 2017 09:34:11 +0000
+Subject: [PATCH] Ensure a device has raster memory, before trying to read it.
+
+Bug #697676 "Null pointer dereference in mem_get_bits_rectangle()"
+
+This is only possible by abusing/mis-using Ghostscript-specific
+language extensions, so cannot happen in a general PostScript program.
+
+Nevertheless, Ghostscript should not crash. So this commit checks the
+memory device to see if raster memory has been allocated, before trying
+to read from it.
+
+Upstream-Status: Backport
+CVE: CVE-2017-7207
+
+Author: Ken Sharp <ken.sharp@artifex.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ base/gdevmem.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/base/gdevmem.c b/base/gdevmem.c
+index 41108ba..183f96d 100644
+--- a/base/gdevmem.c
++++ b/base/gdevmem.c
+@@ -605,6 +605,8 @@ mem_get_bits_rectangle(gx_device * dev, const gs_int_rect * prect,
+             GB_PACKING_CHUNKY | GB_COLORS_NATIVE | GB_ALPHA_NONE;
+         return_error(gs_error_rangecheck);
+     }
++    if (mdev->line_ptrs == 0x00)
++        return_error(gs_error_rangecheck);
+     if ((w <= 0) | (h <= 0)) {
+         if ((w | h) < 0)
+             return_error(gs_error_rangecheck);
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index 210e9a7..e8fc5df 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.02-genarch.patch \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
+           file://CVE-2017-7207.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.10.2


