Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8556093F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:05:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3LC5UXR004660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:05:31 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Apr 2017 05:05:30 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Apr 2017 15:04:17 +0300
Message-ID: <1492776257-25263-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ghostscript : CVE-2016-10219, CVE-2016-10220, CVE-2017-5951
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
X-List-Received-Date: Fri, 21 Apr 2017 12:05:32 -0000
Content-Type: text/plain

The intersect function in base/gxfill.c in Artifex Software, Inc. Ghostscript
9.20 allows remote attackers to cause a denial of service (divide-by-zero
error and application crash) via a crafted file.

The gs_makewordimagedevice function in base/gsdevmem.c in Artifex Software, Inc.
Ghostscript 9.20 allows remote attackers to cause a denial of service (NULL
pointer dereference and application crash) via a crafted file that is
mishandled in the PDF Transparency module.

The mem_get_bits_rectangle function in base/gdevmem.c in Artifex Software, Inc.
Ghostscript 9.20 allows remote attackers to cause a denial of service (NULL
pointer dereference and application crash) via a crafted file.

References:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10219
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10220
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5951

Upstream patches:
http://git.ghostscript.com/?p=ghostpdl.git;h=4bef1a1d32e29b68855616020dbff574b9cda08f
http://git.ghostscript.com/?p=ghostpdl.git;h=daf85701dab05f17e924a48a81edc9195b4a04e8
http://git.ghostscript.com/?p=ghostpdl.git;h=bfa6b2ecbe48edc69a7d9d22a12419aed25960b8

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../ghostscript/ghostscript/CVE-2016-10219.patch   | 49 +++++++++++++++++++
 .../ghostscript/ghostscript/CVE-2016-10220.patch   | 55 ++++++++++++++++++++++
 .../ghostscript/ghostscript/CVE-2017-5951.patch    | 44 +++++++++++++++++
 .../ghostscript/ghostscript_9.20.bb                |  3 ++
 4 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
new file mode 100644
index 0000000..574abe0
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10219.patch
@@ -0,0 +1,49 @@
+From 4bef1a1d32e29b68855616020dbff574b9cda08f Mon Sep 17 00:00:00 2001
+From: Robin Watts <Robin.Watts@artifex.com>
+Date: Thu, 29 Dec 2016 15:57:43 +0000
+Subject: [PATCH] Bug 697453: Avoid divide by 0 in scan conversion code.
+
+Arithmetic overflow due to extreme values in the scan conversion
+code can cause a division by 0.
+
+Avoid this with a simple extra check.
+
+  dx_old=cf814d81
+  endp->x_next=b0e859b9
+  alp->x_next=8069a73a
+
+leads to dx_den = 0
+
+Upstream-Status: Backport
+CVE: CVE-2016-10219
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ base/gxfill.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/base/gxfill.c b/base/gxfill.c
+index 99196c0..2f81bb0 100644
+--- a/base/gxfill.c
++++ b/base/gxfill.c
+@@ -1741,7 +1741,7 @@ intersect(active_line *endp, active_line *alp, fixed y, fixed y1, fixed *p_y_new
+     fixed dx_old = alp->x_current - endp->x_current;
+     fixed dx_den = dx_old + endp->x_next - alp->x_next;
+ 
+-    if (dx_den <= dx_old)
++    if (dx_den <= dx_old || dx_den == 0)
+         return false; /* Intersection isn't possible. */
+     dy = y1 - y;
+     if_debug3('F', "[F]cross: dy=%g, dx_old=%g, dx_new=%g\n",
+@@ -1750,7 +1750,7 @@ intersect(active_line *endp, active_line *alp, fixed y, fixed y1, fixed *p_y_new
+     /* Do the computation in single precision */
+     /* if the values are small enough. */
+     y_new =
+-        ((dy | dx_old) < 1L << (size_of(fixed) * 4 - 1) ?
++        (((ufixed)(dy | dx_old)) < (1L << (size_of(fixed) * 4 - 1)) ?
+          dy * dx_old / dx_den :
+          (INCR_EXPR(mq_cross), fixed_mult_quo(dy, dx_old, dx_den)))
+         + y;
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
new file mode 100644
index 0000000..5e1e8ba
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-10220.patch
@@ -0,0 +1,55 @@
+From daf85701dab05f17e924a48a81edc9195b4a04e8 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Wed, 21 Dec 2016 16:54:14 +0000
+Subject: [PATCH] fix crash with bad data supplied to makeimagedevice
+
+Bug #697450 "Null pointer dereference in gx_device_finalize()"
+
+The problem here is that the code to finalise a device unconditionally
+frees the icc_struct member of the device structure. However this
+particular (weird) device is not setup as a normal device, probably
+because its very, very ancient. Its possible for the initialisation
+of the device to abort with an error before calling gs_make_mem_device()
+which is where the icc_struct member gets allocated (or set to NULL).
+
+If that happens, then the cleanup code tries to free the device, which
+calls finalize() which tries to free a garbage pointer.
+
+Setting the device memory to 0x00 after we allocate it means that the
+icc_struct member will be NULL< and our memory manager allows for that
+happily enough, which avoids the problem.
+
+Upstream-Status: Backport
+CVE: CVE-2016-10220
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ base/gsdevmem.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/base/gsdevmem.c b/base/gsdevmem.c
+index 97b9cf4..fe75bcc 100644
+--- a/base/gsdevmem.c
++++ b/base/gsdevmem.c
+@@ -225,6 +225,18 @@ gs_makewordimagedevice(gx_device ** pnew_dev, const gs_matrix * pmat,
+ 
+     if (pnew == 0)
+         return_error(gs_error_VMerror);
++
++    /* Bug #697450 "Null pointer dereference in gx_device_finalize()"
++     * If we have incorrect data passed to gs_initialise_wordimagedevice() then the
++     * initialisation will fail, crucially it will fail *before* it calls
++     * gs_make_mem_device() which initialises the device. This means that the
++     * icc_struct member will be uninitialsed, but the device finalise method
++     * will unconditionally free that memory. Since its a garbage pointer, bad things happen.
++     * Apparently we do still need makeimagedevice to be available from
++     * PostScript, so in here just zero the device memory, which means that
++     * the finalise routine won't have a problem.
++     */
++    memset(pnew, 0x00, st_device_memory.ssize);
+     code = gs_initialize_wordimagedevice(pnew, pmat, width, height,
+                                          colors, num_colors, word_oriented,
+                                          page_device, mem);
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
new file mode 100644
index 0000000..62cc134
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
@@ -0,0 +1,44 @@
+From bfa6b2ecbe48edc69a7d9d22a12419aed25960b8 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 6 Apr 2017 16:44:54 +0100
+Subject: [PATCH] Bug 697548: use the correct param list enumerator
+
+When we encountered dictionary in a ref_param_list, we were using the enumerator
+for the "parent" param_list, rather than the enumerator for the param_list
+we just created for the dictionary. That parent was usually the stack
+list enumerator, and caused a segfault.
+
+Using the correct enumerator works better.
+
+Upstream-Status: Backport
+CVE: CVE-2017-5951
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ psi/iparam.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/psi/iparam.c b/psi/iparam.c
+index 4e63b6d..b2fa85f 100644
+--- a/psi/iparam.c
++++ b/psi/iparam.c
+@@ -770,12 +770,13 @@ ref_param_read_typed(gs_param_list * plist, gs_param_name pkey,
+                 gs_param_enumerator_t enumr;
+                 gs_param_key_t key;
+                 ref_type keytype;
++                dict_param_list *dlist = (dict_param_list *) pvalue->value.d.list;
+ 
+                 param_init_enumerator(&enumr);
+-                if (!(*((iparam_list *) plist)->enumerate)
+-                    ((iparam_list *) pvalue->value.d.list, &enumr, &key, &keytype)
++                if (!(*(dlist->enumerate))
++                    ((iparam_list *) dlist, &enumr, &key, &keytype)
+                     && keytype == t_integer) {
+-                    ((dict_param_list *) pvalue->value.d.list)->int_keys = 1;
++                    dlist->int_keys = 1;
+                     pvalue->type = gs_param_type_dict_int_keys;
+                 }
+             }
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index e8fc5df..3c8a2e6 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -32,6 +32,9 @@ SRC_URI = "${SRC_URI_BASE} \
            file://objarch.h \
            file://cups-no-gcrypt.patch \
            file://CVE-2017-7207.patch \
+           file://CVE-2016-10219.patch \
+           file://CVE-2016-10220.patch \
+           file://CVE-2017-5951.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.10.2


