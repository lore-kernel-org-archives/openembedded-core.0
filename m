Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41AFCD0439
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 04:54:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83876.1767675288878735736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 20:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P5MSEiHQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5466db0b4c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6061ogWG2284087;
	Mon, 5 Jan 2026 20:54:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=OfP5Ri5sOS71wN/Ovigp5J2oNCQTajLVR7nB0CW7Tv4=; b=P5MSEiHQhjs1
	1k1etXW2UAABaHRObibxJc+K2mWXSTEQxLgaJAxu7A4rptmVRqZuRdPPjMgFpDHl
	dKFD4zjXjMoMA1l6CTrDiVPgPedNMBs62RtONRflls5CRqVa/aZ9V7/hlDhBe0uf
	yj0l4eanyK6tLufafn0cvmi50CM36+BzbiIetXgjNb/I38fMHuCUZwiRujnYFbFh
	4v4C4N9wx9Xvs6Vx0MO5ojZoFFyrDOvVW843PJJf+nZ60QlqH5uzuI1C1xkeukAv
	XhV82Eq7Ce9Z+D1M4jNDjq+gXCVbjdXG2gwwgYgyM0Yr8kBOt2nbUybF2I84qYzt
	fvdz1hAPYg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bf3gka432-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 05 Jan 2026 20:54:39 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 5 Jan 2026 20:54:38 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 5 Jan 2026 20:54:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <adrian.freihofer@gmail.com>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH] devtool: clean up debug build
Date: Tue, 6 Jan 2026 12:54:36 +0800
Message-ID: <20260106045436.1836525-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8de5abb6a9506f76032d2427e8a3d62a1e18ed23.camel@gmail.com>
References: <8de5abb6a9506f76032d2427e8a3d62a1e18ed23.camel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzOCBTYWx0ZWRfX7GEzo8VtjDGA
 3LTQeOQJoE19zRA5aaAf5bYjXPRzoWUdpQXzWegEQGtMwn6WvSor2sBo4nHo6C02npyaH5d+WV7
 pwA8yEECGIuF7I9ZY337lAXAWeINz6DUN9QOmTOal/Ze9lu7uzNtv2v06fDE2xx/qEqPb4asxhi
 3WS5segO1Lw/WJTmHv546i2eDA5xS76c3J7hLd/aRdRMd1p9WJ79vbE5ZrLvqScW06M6Y1/5+y1
 BItqIGecR5dOFeTJGfPobxSTc/00TJQLGUjL50anYTUCWEnh8AYLBRVIhTkhzo30drkk2CSeQx1
 nzR7/DYxIWTTKhdVaWNZloX597CQuTGeBdi4CSWC7pimuUp3rZ3BjsuOoqFj0qeuCv9DiHdHoJd
 L5In2S6+dvzOVLjrf0pRba+MVA1o2wPkme7nbDR5Tk5majZIcr+YNKPHZwXpa1ZdbHDQ5LyQrgx
 qvoRnzBvEaQ+HpEFOsA==
X-Proofpoint-ORIG-GUID: rqgT_CfQvL7f70KgPi9JtXUOs8O9Sh8A
X-Authority-Analysis: v=2.4 cv=TYubdBQh c=1 sm=1 tr=0 ts=695c958f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=nsNtdgi4M8s4LHqQ4AQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rqgT_CfQvL7f70KgPi9JtXUOs8O9Sh8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 04:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228880

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
 meta/lib/oeqa/selftest/cases/devtool.py |  2 +-
 scripts/lib/devtool/ide_sdk.py          | 10 +++++-----
 scripts/lib/devtool/standard.py         |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index cf5ac6e9d7..fc7f119063 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2563,7 +2563,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
 
-        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir))
+        result = runCmd('devtool modify %s -x %s --debug-optimize' % (recipe_name, tempdir))
         self.assertExists(os.path.join(tempdir, build_file),
                           'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf',
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 87a4c13ec5..06e2a6f9d8 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -289,7 +289,7 @@ class RecipeModified:
         self.bitbakepath = None
         self.bpn = None
         self.d = None
-        self.debug_build = None
+        self.debug_optimize = None
         self.fakerootcmd = None
         self.fakerootenv = None
         self.libdir = None
@@ -351,7 +351,7 @@ class RecipeModified:
         self.bpn = recipe_d.getVar('BPN')
         self.cxx = recipe_d.getVar('CXX')
         self.d = recipe_d.getVar('D')
-        self.debug_build = recipe_d.getVar('DEBUG_BUILD')
+        self.debug_optimize = recipe_d.getVar('DEBUG_OPTIMIZE')
         self.fakerootcmd = recipe_d.getVar('FAKEROOTCMD')
         self.fakerootenv = recipe_d.getVar('FAKEROOTENV')
         self.libdir = recipe_d.getVar('libdir')
@@ -917,11 +917,11 @@ def ide_setup(args, config, basepath, workspace):
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
index 1fd5947c41..a7685401e9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -970,8 +970,8 @@ def modify(args, config, basepath, workspace):
                     if branch == args.branch:
                         continue
                     f.write('# patches_%s: %s\n' % (branch, ','.join(branch_patches[branch])))
-            if args.debug_build:
-                f.write('\nDEBUG_BUILD = "1"\n')
+            if args.debug_optimize:
+                f.write('\nDEBUG_OPTIMIZE = "1"\n')
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
@@ -2320,7 +2320,7 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
     parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
-    parser_modify.add_argument('--debug-build', action="store_true", help='Add DEBUG_BUILD = "1" to the modified recipe')
+    parser_modify.add_argument('--debug-optimize', action="store_true", help='Add DEBUG_OPTIMIZE = "1" to the modified recipe')
     parser_modify.set_defaults(func=modify, fixed_setup=context.fixed_setup)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.34.1


