Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842A6D277D1
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 07:54:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5053.1768031681453030897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 23:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LDNFU9fg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=547008fcc5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A7okY23668989;
	Sat, 10 Jan 2026 07:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=HDq0fHO3olzWwycSvlg6GVIUJZwIjAX0EYxl9MldN1k=; b=LDNFU9fgsou7
	VpFLsN77+1fJiwhlKU1U4bQ+6wDLgJWjk2fmqiNafEqU7SwovgtlvERhajLjKSHg
	V++cVg6T9eVNaJ4ABwMBy2m+HOLSeGSfBBQ4H+rrf/I8nwdRPvVPJKUGzVc4aMwc
	2T5A9eXqyZOGcydy6b6Dw6TlqWOpVy1YF2MiI2ybj8OqQ0nrH4FQbTnCo2FLTfQO
	kubDQ1eyRCB4msaGft1OA5EXyZN6aodnDdtiJumkpFnp6PijdiPG1kxVo3/7mDFB
	ylwCiviab+nf5bcVLgldbiXxP1Yo925nut+Po4oQ57YSniXDIxxlPiL7aUfmwFW2
	H6jy2g/k0A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytg6fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 10 Jan 2026 07:54:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 9 Jan 2026 23:54:31 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 9 Jan 2026 23:54:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>, <adrian.freihofer@gmail.com>
Subject: [PATCH v2] devtool: clean up debug build
Date: Sat, 10 Jan 2026 15:54:29 +0800
Message-ID: <20260110075429.2119759-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <18880B4F565039AF.2355985@lists.openembedded.org>
References: <18880B4F565039AF.2355985@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XOMOaAOggDrH-0LeGFxeTWa284Pb4R40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDA2NCBTYWx0ZWRfXxkqTVfgq0LDs
 0nzO8MTrLY5QwfEQyFDMQPioXPrUuGIjj3hjfW2Uy3VKU4gIhc5MIQZ5C7hUBE3DR2w0lrheZgF
 jDN4a2u431SLUWaAqAV1AfwENE6JlVVpM3BsmdDpU0ejHS51POKvbGBsztD6qhV+nj4XQKr/qMc
 4nde4QjXhBUU8HJw/nFBkYrOaNzrBsjA4/VTBbFl4Kw25Nfw9ZvBlnjHkg9ce6k/wBNJb26xuhW
 hPOx+Gmne7rpa7bQc9HSCPPY5dxTGuIhxFHU+BwuoBv77EHd+NHVqi7sk3lSK5z5FA46dQ9udOg
 1/ykC8RPaDD612nmCbEGKxNI4DUdu6yFaQ1AmOcBE2jywmm9xrvHFQDT8asCtlPOhcp1cdmgxl9
 AzblQt8ceTuMOhaZwlrzUj+o9WoBCde3P7ZxRfySruXlVZTqX8Q60YcUtI7ZZp9EzuiclZsukr/
 7Zp3Owp2506BBeZWyJQ==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=696205b8 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=do0Ikte13isWAMj54fEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XOMOaAOggDrH-0LeGFxeTWa284Pb4R40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 07:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229146

Due to we rework debug friendly optimization, rename DEBUG_BUILD
to DEBUG_OPTIMIZE. Then:

- s/DEBUG_BUILD/DEBUG_OPTIMIZE/g

- s/debug-build/debug-optimize/g

- s/debug_build/debug_optimize/g

Note, for specific recipe, we do not use
  OE_FRAGMENTS += "core/yocto/debug-optimize"
in recipe

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/fragments/yocto/devtool-ide-sdk.conf |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py        |  2 +-
 scripts/lib/devtool/ide_sdk.py                 | 10 +++++-----
 scripts/lib/devtool/standard.py                |  6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/fragments/yocto/devtool-ide-sdk.conf b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
index ca0269543b..f451b47713 100644
--- a/meta/conf/fragments/yocto/devtool-ide-sdk.conf
+++ b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
@@ -5,7 +5,7 @@ Example usage: \
   1. bitbake-config-build enable-fragment core/yocto/devtool-ide-sdk \
      bitbake-config-build enable-fragment core/yocto/root-login-with-empty-password \
   2. The recipe (my-recipe in this case) must be in IMAGE_INSTALL. \
-  3. Devtool modify --debug-build my-recipe \
+  3. Devtool modify --debug-optimize my-recipe \
   4. devtool ide-sdk my-recipe core-image-full-cmdline --target root@192.168.7.2' \
   5. runqemu snapshot \
   6. code $BUILDDIR/workspace/sources/my-recipe \
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0446b46598..03a0bd0ddc 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2590,7 +2590,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
 
-        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir), output_log=self._cmd_logger)
+        result = runCmd('devtool modify %s -x %s --debug-optimize' % (recipe_name, tempdir), output_log=self._cmd_logger)
         self.assertExists(os.path.join(tempdir, build_file),
                           'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf',
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index ba225f20b9..9040eee88d 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -398,7 +398,7 @@ class RecipeModified:
         self.bitbakepath = None
         self.bpn = None
         self.d = None
-        self.debug_build = None
+        self.debug_optimize = None
         self.reverse_debug_prefix_map = {}
         self.fakerootcmd = None
         self.fakerootenv = None
@@ -469,7 +469,7 @@ class RecipeModified:
         self.bpn = recipe_d.getVar('BPN')
         self.cxx = recipe_d.getVar('CXX')
         self.d = recipe_d.getVar('D')
-        self.debug_build = recipe_d.getVar('DEBUG_BUILD')
+        self.debug_optimize = recipe_d.getVar('DEBUG_OPTIMIZE')
         self.fakerootcmd = recipe_d.getVar('FAKEROOTCMD')
         self.fakerootenv = recipe_d.getVar('FAKEROOTENV')
         self.libdir = recipe_d.getVar('libdir')
@@ -1178,11 +1178,11 @@ def ide_setup(args, config, basepath, workspace):
             ide.setup_modified_recipe(
                 args, recipe_image, recipe_modified)
 
-            if recipe_modified.debug_build != '1':
+            if recipe_modified.debug_optimize != '1':
                 logger.warn(
                     'Recipe %s is compiled with release build configuration. '
-                    'You might want to add DEBUG_BUILD = "1" to %s. '
-                    'Note that devtool modify --debug-build can do this automatically.',
+                    'You might want to add DEBUG_OPTIMIZE = "1" to %s. '
+                    'Note that devtool modify --debug-optimize can do this automatically.',
                     recipe_modified.name, recipe_modified.bbappend)
     else:
         raise DevtoolError("Must not end up here.")
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f4d5d7cd3f..51edd08d92 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -970,9 +970,9 @@ def modify(args, config, basepath, workspace):
                     if branch == args.branch:
                         continue
                     f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
-            if args.debug_build:
+            if args.debug_optimize:
                 f.write('\n# Optimize for debugging. Use e.g. -Og instead of -O2\n')
-                f.write('DEBUG_BUILD = "1"\n')
+                f.write('DEBUG_OPTIMIZE = "1"\n')
                 f.write('\n# Keep the paths to the source files for remote debugging\n')
                 f.write('# DEBUG_PREFIX_MAP = ""\n')
                 f.write('# WARN_QA:remove = "buildpaths"\n')
@@ -2325,7 +2325,7 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
-    parser_modify.add_argument('--debug-build', action="store_true", help='Add DEBUG_BUILD = "1" to the modified recipe')
+    parser_modify.add_argument('--debug-optimize', action="store_true", help='Add DEBUG_OPTIMIZE = "1" to the modified recipe')
     parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.34.1


