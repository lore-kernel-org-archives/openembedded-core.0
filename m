Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAF5B79803
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 07:22:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8A7M2KN006166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2018 00:22:33 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 10 Sep 2018 00:22:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 10 Sep 2018 03:21:01 -0400
Message-ID: <1536564061-127648-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] ghostscript: fix CVE-2018-15908 & CVE-2018-15909 & CVE-2018-15910 & CVE-2018-15911
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
X-List-Received-Date: Mon, 10 Sep 2018 07:22:58 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...Bug-699665-memory-corruption-in-aesdecode.patch | 56 +++++++++++++
 ...Handle-LockDistillerParams-not-being-a-bo.patch | 53 +++++++++++++
 ...660-shading_param-incomplete-type-checkin.patch | 91 ++++++++++++++++++++++
 .../0004-Hide-the-.shfill-operator.patch           | 35 +++++++++
 ...properly-apply-file-permissions-to-.tempf.patch | 54 +++++++++++++
 .../ghostscript/ghostscript_9.23.bb                |  5 ++
 6 files changed, 294 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch
new file mode 100644
index 0000000..df654f7
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-699665-memory-corruption-in-aesdecode.patch
@@ -0,0 +1,56 @@
+From b9fa1157e1f4982d42241146c9b7c6c789d6f076 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Thu, 23 Aug 2018 15:42:02 +0100
+Subject: [PATCH 1/5] Bug 699665 "memory corruption in aesdecode"
+
+The specimen file calls aesdecode without specifying the key to be
+used, though it does manage to do enough work with the PDF interpreter
+routines to get access to aesdecode (which isn't normally available).
+
+This causes us to read uninitialised memory, which can (and often does)
+lead to a segmentation fault.
+
+In this commit we set the key to NULL explicitly during intialisation
+and then check it before we read it. If its NULL we just return.
+
+It seems bizarre that we don't return error codes, we should probably
+look into that at some point, but this prevents the code trying to
+read uninitialised memory.
+
+CVE: CVE-2018-15911
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ base/aes.c  | 3 +++
+ base/saes.c | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/base/aes.c b/base/aes.c
+index a6bce93..e86f000 100644
+--- a/base/aes.c
++++ b/base/aes.c
+@@ -662,6 +662,9 @@ void aes_crypt_ecb( aes_context *ctx,
+     }
+ #endif
+ 
++    if (ctx == NULL || ctx->rk == NULL)
++        return;
++
+     RK = ctx->rk;
+ 
+     GET_ULONG_LE( X0, input,  0 ); X0 ^= *RK++;
+diff --git a/base/saes.c b/base/saes.c
+index 6db0e8b..307ed74 100644
+--- a/base/saes.c
++++ b/base/saes.c
+@@ -120,6 +120,7 @@ s_aes_process(stream_state * ss, stream_cursor_read * pr,
+         gs_throw(gs_error_VMerror, "could not allocate aes context");
+         return ERRC;
+       }
++      memset(state->ctx, 0x00, sizeof(aes_context));
+       if (state->keylength < 1 || state->keylength > SAES_MAX_KEYLENGTH) {
+         gs_throw1(gs_error_rangecheck, "invalid aes key length (%d bytes)",
+                 state->keylength);
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch b/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
new file mode 100644
index 0000000..a16f215
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
@@ -0,0 +1,53 @@
+From 1b516be5f6829ab6ce37835529ba08abd6d18663 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 21 Aug 2018 16:42:45 +0100
+Subject: [PATCH 2/5] Bug 699656: Handle LockDistillerParams not being a
+ boolean
+
+This caused a function call commented as "Can't fail" to fail, and resulted
+in memory correuption and a segfault.
+
+CVE: CVE-2018-15910
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ devices/vector/gdevpdfp.c | 2 +-
+ psi/iparam.c              | 7 ++++---
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/devices/vector/gdevpdfp.c b/devices/vector/gdevpdfp.c
+index 522db7a..f2816b9 100644
+--- a/devices/vector/gdevpdfp.c
++++ b/devices/vector/gdevpdfp.c
+@@ -364,7 +364,7 @@ gdev_pdf_put_params_impl(gx_device * dev, const gx_device_pdf * save_dev, gs_par
+      * LockDistillerParams is read again, and reset if necessary, in
+      * psdf_put_params.
+      */
+-    ecode = param_read_bool(plist, "LockDistillerParams", &locked);
++    ecode = param_read_bool(plist, (param_name = "LockDistillerParams"), &locked);
+     if (ecode < 0)
+         param_signal_error(plist, param_name, ecode);
+ 
+diff --git a/psi/iparam.c b/psi/iparam.c
+index 68c20d4..0279455 100644
+--- a/psi/iparam.c
++++ b/psi/iparam.c
+@@ -822,10 +822,11 @@ static int
+ ref_param_read_signal_error(gs_param_list * plist, gs_param_name pkey, int code)
+ {
+     iparam_list *const iplist = (iparam_list *) plist;
+-    iparam_loc loc;
++    iparam_loc loc = {0};
+ 
+-    ref_param_read(iplist, pkey, &loc, -1);	/* can't fail */
+-    *loc.presult = code;
++    ref_param_read(iplist, pkey, &loc, -1);
++    if (loc.presult)
++        *loc.presult = code;
+     switch (ref_param_read_get_policy(plist, pkey)) {
+         case gs_param_policy_ignore:
+             return 0;
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch b/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
new file mode 100644
index 0000000..174f79e
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
@@ -0,0 +1,91 @@
+From 759238fd904aab1706dc1007826a13a670cda320 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Thu, 23 Aug 2018 14:12:48 +0100
+Subject: [PATCH 3/5] Fix Bug 699660 "shading_param incomplete type checking"
+
+Its possible to pass a t_struct parameter to .shfill which is not a
+shading function built by .buildshading. This could then lead to memory
+corruption or a segmentation fault by treating the object passed in
+as if it were a shading.
+
+Its non-trivial to check the t_struct, because this function can take
+7 different kinds of structures as a parameter. Checking these is
+possible, of course, but would add a performance penalty.
+
+However, we can note that we never call .shfill without first calling
+.buildshading, and we never call .buildshading without immediately
+calling .shfill. So we can treat these as an atomic operation. The
+.buildshading function takes all its parameters as PostScript objects
+and validates them, so that should be safe.
+
+This allows us to 'hide' the .shfill operator preventing the possibility
+of passing an invalid parameter.
+
+CVE: CVE-2018-15909
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Resource/Init/gs_init.ps  | 4 ++--
+ Resource/Init/gs_ll3.ps   | 7 ++++++-
+ Resource/Init/pdf_draw.ps | 3 +--
+ 3 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index 6c8da53..1956ed5 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -2181,8 +2181,8 @@ SAFER { .setsafeglobal } if
+ /.getiodevice /.getdevparms /.putdevparams /.bbox_transform /.matchmedia /.matchpagesize /.defaultpapersize
+ /.oserrno /.setoserrno /.oserrorstring /.getCPSImode
+ /.getscanconverter /.setscanconverter /.type1encrypt /.type1decrypt/.languagelevel /.setlanguagelevel /.eqproc /.fillpage /.buildpattern1 /.saslprep
+-/.buildshading1 /.buildshadin2 /.buildshading3 /.buildshading4 /.buildshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
+-/.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
++/.buildshading1 /.buildshading2 /.buildshading3 /.buildshading4 /.buildshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
++%/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
+ /.localvmarray /.localvmdict /.localvmpackedarray /.localvmstring /.systemvmarray /.systemvmdict /.systemvmpackedarray /.systemvmstring /.systemvmfile /.systemvmlibfile
+ /.systemvmSFD /.settrapparams /.currentsystemparams /.currentuserparams /.getsystemparam /.getuserparam /.setsystemparams /.setuserparams
+ /.checkpassword /.locale_to_utf8 /.currentglobal /.gcheck /.imagepath
+diff --git a/Resource/Init/gs_ll3.ps b/Resource/Init/gs_ll3.ps
+index 5aa56a3..1d37e53 100644
+--- a/Resource/Init/gs_ll3.ps
++++ b/Resource/Init/gs_ll3.ps
+@@ -440,6 +440,11 @@ systemdict /.reuseparamdict mark
+     /shfill .systemvar /undefined signalerror
+   } ifelse
+ } bind def
++
++/.buildshading_and_shfill {
++  .buildshading .shfill
++} bind def
++
+ systemdict /.reuseparamdict undef
+ 
+ /.buildpattern2 {	% <template> <matrix> .buildpattern2
+@@ -464,7 +469,7 @@ systemdict /.reuseparamdict undef
+         % Currently, .shfill requires that the color space
+         % in the pattern be the current color space.
+         % Disable overprintmode for shfill
+-  { dup gsave 0 .setoverprintmode .buildshading .shfill } stopped
++  { dup gsave 0 .setoverprintmode .buildshading_and_shfill } stopped
+   grestore {
+     /$error .systemvar /errorinfo 2 copy known {
+       pop pop
+diff --git a/Resource/Init/pdf_draw.ps b/Resource/Init/pdf_draw.ps
+index e8ca213..a7144d3 100644
+--- a/Resource/Init/pdf_draw.ps
++++ b/Resource/Init/pdf_draw.ps
+@@ -1365,9 +1365,8 @@ drawopdict begin
+     { dup /.shading .knownget {
+         exch pop
+       } {
+-       .buildshading
++       .buildshading_and_shfill
+       } ifelse
+-      .shfill
+     } stopped {
+       pop
+       (   **** Error: Ignoring invalid smooth shading object, output may be incorrect.\n)
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch b/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch
new file mode 100644
index 0000000..7c6d002
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0004-Hide-the-.shfill-operator.patch
@@ -0,0 +1,35 @@
+From ee9e8065e7d7b3adbc25fd655727ca72861ee032 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Fri, 24 Aug 2018 12:44:26 +0100
+Subject: [PATCH 4/5] Hide the .shfill operator
+
+Commit 0b6cd1918e1ec4ffd087400a754a845180a4522b was supposed to make
+the .shfill operator unobtainable, but I accidentally left a comment
+in the line doing so.
+
+Fix it here, without this the operator can still be exploited.
+
+CVE: CVE-2018-15909
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Resource/Init/gs_init.ps | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Resource/Init/gs_init.ps b/Resource/Init/gs_init.ps
+index 1956ed5..955b843 100644
+--- a/Resource/Init/gs_init.ps
++++ b/Resource/Init/gs_init.ps
+@@ -2182,7 +2182,7 @@ SAFER { .setsafeglobal } if
+ /.oserrno /.setoserrno /.oserrorstring /.getCPSImode
+ /.getscanconverter /.setscanconverter /.type1encrypt /.type1decrypt/.languagelevel /.setlanguagelevel /.eqproc /.fillpage /.buildpattern1 /.saslprep
+ /.buildshading1 /.buildshading2 /.buildshading3 /.buildshading4 /.buildshading5 /.buildshading6 /.buildshading7 /.buildshadingpattern
+-%/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
++/.shfill /.argindex /.bytestring /.namestring /.stringbreak /.stringmatch /.globalvmarray /.globalvmdict /.globalvmpackedarray /.globalvmstring
+ /.localvmarray /.localvmdict /.localvmpackedarray /.localvmstring /.systemvmarray /.systemvmdict /.systemvmpackedarray /.systemvmstring /.systemvmfile /.systemvmlibfile
+ /.systemvmSFD /.settrapparams /.currentsystemparams /.currentuserparams /.getsystemparam /.getuserparam /.setsystemparams /.setuserparams
+ /.checkpassword /.locale_to_utf8 /.currentglobal /.gcheck /.imagepath
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch b/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch
new file mode 100644
index 0000000..ccd4021
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch
@@ -0,0 +1,54 @@
+From f4f50ceea8e8852b8c3ac73f5807d8b54b735c3e Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 21 Aug 2018 20:17:05 +0100
+Subject: [PATCH 5/5] Bug 699657: properly apply file permissions to .tempfile
+
+CVE: CVE-2018-15908
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ psi/zfile.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/psi/zfile.c b/psi/zfile.c
+index a0acd5a..19996b0 100644
+--- a/psi/zfile.c
++++ b/psi/zfile.c
+@@ -134,7 +134,7 @@ check_file_permissions_reduced(i_ctx_t *i_ctx_p, const char *fname, int len,
+     /* we're protecting arbitrary file system accesses, not Postscript device accesses.
+      * Although, note that %pipe% is explicitly checked for and disallowed elsewhere
+      */
+-    if (iodev != iodev_default(imemory)) {
++    if (iodev && iodev != iodev_default(imemory)) {
+         return 0;
+     }
+ 
+@@ -734,7 +734,23 @@ ztempfile(i_ctx_t *i_ctx_p)
+     }
+ 
+     if (gp_file_name_is_absolute(pstr, strlen(pstr))) {
+-        if (check_file_permissions(i_ctx_p, pstr, strlen(pstr),
++        int plen = strlen(pstr);
++        const char *sep = gp_file_name_separator();
++#ifdef DEBUG
++        int seplen = strlen(sep);
++        if (seplen != 1)
++            return_error(gs_error_Fatal);
++#endif
++        /* strip off the file name prefix, leave just the directory name
++         * so we can check if we are allowed to write to it
++         */
++        for ( ; plen >=0; plen--) {
++            if (pstr[plen] == sep[0])
++                break;
++        }
++        memcpy(fname, pstr, plen);
++        fname[plen] = '\0';
++        if (check_file_permissions(i_ctx_p, fname, strlen(fname),
+                                    NULL, "PermitFileWriting") < 0) {
+             code = gs_note_error(gs_error_invalidfileaccess);
+             goto done;
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb b/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
index 019d99b..898b6cd 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.23.bb
@@ -26,6 +26,11 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://remove-direct-symlink.patch \
+                file://0001-Bug-699665-memory-corruption-in-aesdecode.patch \
+                file://0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch \
+                file://0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch \
+                file://0004-Hide-the-.shfill-operator.patch \
+                file://0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.8.1


