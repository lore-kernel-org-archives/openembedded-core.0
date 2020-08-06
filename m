Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.3036.1596707180669197707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 0ogc+ow6K1xuK0s1vgH2RwpBLxPPf8Waefyvdtuzo4M4GngelJXPsC32SETytC1RdcB0qAbJTc
 2ElipUAvAE9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="170836657"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="170836657"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 02:46:19 -0700
IronPort-SDR: TUOqp2HCVDNQMCgsDrE3uqnxx2cRkVvNYSL/PX5hED8CP2MY9rZr/J+nClw3STaI+WsaDc3lEU
 UoHAHa6PQTvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="493610325"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2020 02:46:19 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ghostscript: fix CVE-2020-15900
Date: Thu,  6 Aug 2020 17:46:17 +0800
Message-Id: <20200806094618.31973-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../ghostscript/CVE-2020-15900.patch          | 54 +++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
new file mode 100644
index 0000000000..d7c5f034e5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
@@ -0,0 +1,54 @@
+From 5d499272b95a6b890a1397e11d20937de000d31b Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Wed, 22 Jul 2020 09:57:54 -0700
+Subject: [PATCH] Bug 702582, CVE 2020-15900 Memory Corruption in Ghostscript
+ 9.52
+
+Fix the 'rsearch' calculation for the 'post' size to give the correct
+size.  Previous calculation would result in a size that was too large,
+and could underflow to max uint32_t. Also fix 'rsearch' to return the
+correct 'pre' string with empty string match.
+
+A future change may 'undefine' this undocumented, non-standard operator
+during initialization as we do with the many other non-standard internal
+PostScript operators and procedures.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5d499272b95a6b890a1397e11d20937de000d31b]
+CVE: CVE-2020-15900
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ psi/zstring.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/psi/zstring.c b/psi/zstring.c
+index 33662dafa..58e1af2b3 100644
+--- a/psi/zstring.c
++++ b/psi/zstring.c
+@@ -142,13 +142,18 @@ search_impl(i_ctx_t *i_ctx_p, bool forward)
+     return 0;
+ found:
+     op->tas.type_attrs = op1->tas.type_attrs;
+-    op->value.bytes = ptr;
+-    r_set_size(op, size);
++    op->value.bytes = ptr;				/* match */
++    op->tas.rsize = size;				/* match */
+     push(2);
+-    op[-1] = *op1;
+-    r_set_size(op - 1, ptr - op[-1].value.bytes);
+-    op1->value.bytes = ptr + size;
+-    r_set_size(op1, count + (!forward ? (size - 1) : 0));
++    op[-1] = *op1;					/* pre */
++    op[-3].value.bytes = ptr + size;			/* post */
++    if (forward) {
++        op[-1].tas.rsize = ptr - op[-1].value.bytes;	/* pre */
++        op[-3].tas.rsize = count;			/* post */
++    } else {
++        op[-1].tas.rsize = count;			/* pre */
++        op[-3].tas.rsize -= count + size;		/* post */
++    }
+     make_true(op);
+     return 0;
+ }
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 4cdb6e00d8..65135f5821 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -34,6 +34,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
 SRC_URI = "${SRC_URI_BASE} \
            file://ghostscript-9.21-prevent_recompiling.patch \
            file://cups-no-gcrypt.patch \
+           file://CVE-2020-15900.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.17.1

