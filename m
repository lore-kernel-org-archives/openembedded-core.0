Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56E256612D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 11:24:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4TBOnP4017214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 04:24:49 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 29 May 2017 04:24:48 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 May 2017 14:23:08 +0300
Message-ID: <1496056988-5754-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ghostscript: CVE-2016-7977, CVE-2016-7978, CVE-2016-7979, CVE-2017-9216
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
X-List-Received-Date: Mon, 29 May 2017 11:24:49 -0000
Content-Type: text/plain

Ghostscript before 9.21 might allow remote attackers to bypass the SAFER
mode protection mechanism and consequently read arbitrary files via the
use of the .libfile operator in a crafted postscript document.

Use-after-free vulnerability in Ghostscript 9.20 might allow remote
attackers to execute arbitrary code via vectors related to a reference
leak in .setdevice.

Ghostscript before 9.21 might allow remote attackers to bypass the SAFER
mode protection mechanism and consequently execute arbitrary code by
leveraging type confusion in .initialize_dsc_parser.

libjbig2dec.a in Artifex jbig2dec 0.13, as used in MuPDF and Ghostscript,
has a NULL pointer dereference in the jbig2_huffman_get function in
jbig2_huffman.c. For example, the jbig2dec utility will
crash (segmentation fault) when parsing an invalid file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2016-7977
https://nvd.nist.gov/vuln/detail/CVE-2016-7978
https://nvd.nist.gov/vuln/detail/CVE-2016-7979
https://nvd.nist.gov/vuln/detail/CVE-2017-9216

Upstream patches:
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=8abd22010eb4db0fb1b10e430d5f5d83e015ef70
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=6f749c0c44e7b9e09737b9f29edf29925a34f0cf
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=875a0095f37626a721c7ff57d606a0f95af03913
http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=3ebffb1d96ba0cacec23016eccb4047dab365853

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../ghostscript/ghostscript/CVE-2016-7977.patch    | 33 +++++++++++++++
 .../ghostscript/ghostscript/CVE-2016-7978.patch    | 30 ++++++++++++++
 .../ghostscript/ghostscript/CVE-2016-7979.patch    | 48 ++++++++++++++++++++++
 .../ghostscript/ghostscript/CVE-2017-9216.patch    | 36 ++++++++++++++++
 .../ghostscript/ghostscript_9.20.bb                |  4 ++
 5 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7978.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7979.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
new file mode 100644
index 0000000..b7eed12
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
@@ -0,0 +1,33 @@
+From 8abd22010eb4db0fb1b10e430d5f5d83e015ef70 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 3 Oct 2016 01:46:28 +0100
+Subject: [PATCH] Bug 697169: Be rigorous with SAFER permissions
+
+Once we've opened our input file from the command line, enforce the SAFER
+rules.
+
+Upstream-Status: Backport
+CVE: CVE-2016-7977
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ psi/zfile.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/psi/zfile.c b/psi/zfile.c
+index b6caea2..2c6c958 100644
+--- a/psi/zfile.c
++++ b/psi/zfile.c
+@@ -1081,6 +1081,9 @@ lib_file_open(gs_file_path_ptr  lib_path, const gs_memory_t *mem, i_ctx_t *i_ctx
+     gs_main_instance *minst = get_minst_from_memory(mem);
+     int code;
+ 
++    if (i_ctx_p && starting_arg_file)
++        i_ctx_p->starting_arg_file = false;
++
+     /* when starting arg files (@ files) iodev_default is not yet set */
+     if (iodev == 0)
+         iodev = (gx_io_device *)gx_io_device_table[0];
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7978.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7978.patch
new file mode 100644
index 0000000..668f205
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7978.patch
@@ -0,0 +1,30 @@
+From 6f749c0c44e7b9e09737b9f29edf29925a34f0cf Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 5 Oct 2016 09:59:25 +0100
+Subject: [PATCH] Bug 697179: Reference count device icc profile
+
+when copying a device
+
+Upstream-Status: Backport
+CVE: CVE-2016-7978
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ base/gsdevice.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/base/gsdevice.c b/base/gsdevice.c
+index 778106f..aea986a 100644
+--- a/base/gsdevice.c
++++ b/base/gsdevice.c
+@@ -614,6 +614,7 @@ gx_device_init(gx_device * dev, const gx_device * proto, gs_memory_t * mem,
+     dev->memory = mem;
+     dev->retained = !internal;
+     rc_init(dev, mem, (internal ? 0 : 1));
++    rc_increment(dev->icc_struct);
+ }
+ 
+ void
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7979.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7979.patch
new file mode 100644
index 0000000..9e930d3
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7979.patch
@@ -0,0 +1,48 @@
+From 875a0095f37626a721c7ff57d606a0f95af03913 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Wed, 5 Oct 2016 10:10:58 +0100
+Subject: [PATCH] DSC parser - validate parameters
+
+Bug #697190 ".initialize_dsc_parser doesn't validate the parameter is a dict type before using it."
+
+Regardless of any security implications, its simply wrong for a PostScript
+operator not to validate its parameter(s).
+
+No differences expected.
+
+Upstream-Status: Backport
+CVE: CVE-2016-7979
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ psi/zdscpars.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/psi/zdscpars.c b/psi/zdscpars.c
+index c05e154..9b4b605 100644
+--- a/psi/zdscpars.c
++++ b/psi/zdscpars.c
+@@ -150,11 +150,16 @@ zinitialize_dsc_parser(i_ctx_t *i_ctx_p)
+     ref local_ref;
+     int code;
+     os_ptr const op = osp;
+-    dict * const pdict = op->value.pdict;
+-    gs_memory_t * const mem = (gs_memory_t *)dict_memory(pdict);
+-    dsc_data_t * const data =
+-        gs_alloc_struct(mem, dsc_data_t, &st_dsc_data_t, "DSC parser init");
++    dict *pdict;
++    gs_memory_t *mem;
++    dsc_data_t *data;
+ 
++    check_read_type(*op, t_dictionary);
++
++    pdict = op->value.pdict;
++    mem = (gs_memory_t *)dict_memory(pdict);
++
++    data = gs_alloc_struct(mem, dsc_data_t, &st_dsc_data_t, "DSC parser init");
+     if (!data)
+         return_error(gs_error_VMerror);
+     data->document_level = 0;
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch
new file mode 100644
index 0000000..1caeb3e
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch
@@ -0,0 +1,36 @@
+From 3ebffb1d96ba0cacec23016eccb4047dab365853 Mon Sep 17 00:00:00 2001
+From: Shailesh Mistry <shailesh.mistry@hotmail.co.uk>
+Date: Wed, 24 May 2017 19:29:57 +0100
+Subject: [PATCH] Bug 697934: Fix SEGV due to error code being ignored.
+
+The return code from jbig2_decode_text_region was being ignored so the
+code continued to try and parse the invalid file using incomplete/empty
+structures.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9216
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ jbig2dec/jbig2_symbol_dict.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/jbig2dec/jbig2_symbol_dict.c b/jbig2dec/jbig2_symbol_dict.c
+index 3cc1731..672425d 100644
+--- a/jbig2dec/jbig2_symbol_dict.c
++++ b/jbig2dec/jbig2_symbol_dict.c
+@@ -493,8 +493,10 @@ jbig2_decode_symbol_dict(Jbig2Ctx *ctx,
+                         }
+ 
+                         /* multiple symbols are handled as a text region */
+-                        jbig2_decode_text_region(ctx, segment, tparams, (const Jbig2SymbolDict * const *)refagg_dicts,
++                        code = jbig2_decode_text_region(ctx, segment, tparams, (const Jbig2SymbolDict * const *)refagg_dicts,
+                                                  n_refagg_dicts, image, data, size, GR_stats, as, ws);
++                        if (code < 0)
++                            goto cleanup4;
+ 
+                         SDNEWSYMS->glyphs[NSYMSDECODED] = image;
+                         refagg_dicts[0]->glyphs[params->SDNUMINSYMS + NSYMSDECODED] = jbig2_image_clone(ctx, SDNEWSYMS->glyphs[NSYMSDECODED]);
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index 30591c9..2e6feff 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -37,6 +37,10 @@ SRC_URI = "${SRC_URI_BASE} \
            file://CVE-2017-5951.patch \
            file://CVE-2016-8602.patch \
            file://CVE-2017-7975.patch \
+           file://CVE-2016-7977.patch \
+           file://CVE-2016-7978.patch \
+           file://CVE-2016-7979.patch \
+           file://CVE-2017-9216.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.10.2


