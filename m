Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BC9CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 04:58:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.253.1782277099539337111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 21:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Shbzg8ZK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0635550fb3=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O2kD9c1368353
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 21:58:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZtNYMWutJ32KO46+VnTz
	GClb4rYFfn3Q5Agzf7ybqVE=; b=Shbzg8ZKVxJr4XmMmPlbXFwpgdaoLmVdQJ9v
	7GH8DontBE9dzHyjycUfYdyNjtTu+MXLpvRnXaVJuHQBNilJk7B4PVxGaWhhfPoi
	Sw7eeGwecaXh27ma6IDl7U8hfgV9+G3lDiQqR0SRuBLiYupAd/teQKMQ84nb76sr
	v8mMlC3nt+TaQ8LBlJUpwuZzmXhuim10rW8z38Pm1wPFbyNgWXTy8LDysaQxSz5p
	n8aQXZSNxPBbOuMr7CU8OvhsRZKlEYOYQtWZVnb6HQyIKyANAz26Ckl7PHOWuhTB
	AoNyqCaDVmy+/JcMbPpXwnC61jDfkels6Sw26ezbOGoKtP7UvQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eykj1hrrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 21:58:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 23 Jun 2026 21:58:18 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 23 Jun 2026 21:58:17 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V3] python3-cython: make generated _cyutility.c be reproducible
Date: Wed, 24 Jun 2026 12:58:16 +0800
Message-ID: <20260624045816.477228-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAzNyBTYWx0ZWRfXyUktN0xL8Nvh
 HOqc/ogwUil/X8qB5b+ytkvwtMQkDslXX/Nz1rwhQvVTKSt4VojlA8LgwiqoM3n2z6tAiSeKEOR
 mcDaVoULnIW/CjNVOZiA9r6agUt0nzQuVAIRM49liQhTNCZbvowFuKnKVc6q6/1cE/MsSBefI66
 /SORbS4lznmdKMFEUssvGr8OfzHtsQnmpvRsv/zjgtXMi44322udqZMNgFddublrGJmKBkosTBE
 spXpiI5JqXSlxi/UDwxA0tx35/xQVecSWnpECieHnUKepbwGcBJ66luzG2BWOARvbI8nQGa76/Y
 B0leDvgOIbKeoAd8jT7QkwsO5D05hVxgnJOoIIqDz3rYB1VP/8H0BhZkBLG5hNubAKpTXcMY2Oh
 ioQvyqbzlnd3GbZKVa1EJf1mK9q7PPVKiZDNAWDyT+VI9O/anHkSx78u34eny6S6PvDY5/sPmpl
 M2zqTj2r6yk7L9zSINw==
X-Proofpoint-ORIG-GUID: jdUptcpQFpgOPvT08skj-X5nfRRfOo3x
X-Authority-Analysis: v=2.4 cv=JNILdcKb c=1 sm=1 tr=0 ts=6a3b63ea cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8 a=SsMK-6ewAAAA:8 a=t7CeM3EgAAAA:8
 a=u3yaudG2xz5xCbVMCF8A:9 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAzNyBTYWx0ZWRfX42KOKq2c6RTY
 y1YdcQas/OMSeYkspzFR2XeqpZNpEz09BY1nWrAEI2Wap/6AJ10ewuE20xxZSuM5yo6cmGVgAEc
 HxWFDeJfmo5A1YmN3eDmMcJODfcOIdurRGp3ZJOivkI9eeT35Q/a
X-Proofpoint-GUID: jdUptcpQFpgOPvT08skj-X5nfRRfOo3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 04:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239465

While python3 module use cython to build shared moudle utility library,
the generated source file _cyutility.c is not stable at each build and
made the generated library not be reproducible.

When the option "--generated-shared" is used to generated __cyutility as the
link https://github.com/scikit-learn/scikit-learn/pull/31151/files, the path
for filename_table in the generated pyx/c file contains tmp dir which is not
predictable though it has been updated to the relative path, and it caused
the generated output file is not stable at each build and made the generated
library is not reproducible [1] between builds.

example as python3_pandas:

vim build/_cyutility.c
......
/* #### Code section: filename_table ### */

static const char* const __pyx_f[] = {
  "../../../../../../../../../../../../tmp/tmpXXXXXX/_cyutility.pyx",
  "<stringsource>",
};

After applied this commit, vim build/_cyutility.c
......
/* #### Code section: filename_table ### */

static const char* const __pyx_f[] = {
  "_cyutility.pyx",
  "<stringsource>",
};

This commit use SharedUtilitySourceDescriptor instead of unpredictable
temporary directory unpredictable tmpdir in the generated source file
to assure the file _cyutility.c should be reproducible.

[1] https://reproducible-builds.org/

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...ule-Use-SharedUtilitySourceDescripto.patch | 94 +++++++++++++++++++
 .../python/python3-cython_3.2.5.bb            |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch

diff --git a/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch b/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
new file mode 100644
index 0000000000..b57acb6969
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
@@ -0,0 +1,94 @@
+From f3cfdebd75374a29a930687c1f126282c51b7a92 Mon Sep 17 00:00:00 2001
+From: mv-python <matusvalo@users.noreply.github.com>
+Date: Fri, 12 Jun 2026 10:32:42 +0200
+Subject: [PATCH] [3.2.x] Shared module: Use `SharedUtilitySourceDescriptor`
+ instead of temporary directory (#7723) (GH-7739)
+
+This PR uses `SharedUtilitySourceDescriptor` instead of an empty pyx
+file in the temp dir. This simplifies the logic and also assures that
+`__pyx_f` is unchanged across builds.
+
+Backport of https://github.com/cython/cython/pull/7723
+Alternative to https://github.com/cython/cython/pull/7634
+
+Upstream-Status: Backport [https://github.com/cython/cython/commit/f3cfdebd75374a29a930687c1f126282c51b7a92]
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ Cython/Build/SharedModule.py | 25 ++++++++-----------------
+ Cython/Compiler/Scanning.py  |  9 +++++++++
+ 2 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule.py
+index fed6263cd..45da4b462 100644
+--- a/Cython/Build/SharedModule.py
++++ b/Cython/Build/SharedModule.py
+@@ -1,13 +1,10 @@
+ import os
+-import re
+-import shutil
+-import tempfile
+ 
+ from Cython.Compiler import (
+     MemoryView, Code, Options, Pipeline, Errors, Main, Symtab
+ )
+ from Cython.Compiler.StringEncoding import EncodedString
+-from Cython.Compiler.Scanning import FileSourceDescriptor
++from Cython.Compiler.Scanning import SharedUtilitySourceDescriptor
+ 
+ 
+ def create_shared_library_pipeline(context, scope, options, result):
+@@ -72,23 +69,17 @@ def generate_shared_module(options):
+     Errors.open_listing_file(None)
+ 
+     dest_c_file = options.shared_c_file_path
++    pyx_file = os.path.splitext(dest_c_file)[0] + '.pyx'
+     module_name = os.path.splitext(os.path.basename(dest_c_file))[0]
+ 
+     context = Main.Context.from_options(options)
+     scope = Symtab.ModuleScope('MemoryView', parent_module = None, context = context, is_package=False)
+ 
+-    with tempfile.TemporaryDirectory() as tmpdirname:
+-        pyx_file = os.path.join(tmpdirname, f'{module_name}.pyx')
+-        c_file = os.path.join(tmpdirname, f'{module_name}.c')
+-        with open(pyx_file, 'w'):
+-            pass
+-        source_desc = FileSourceDescriptor(pyx_file)
+-        comp_src = Main.CompilationSource(source_desc, EncodedString(module_name), os.getcwd())
+-        result = Main.create_default_resultobj(comp_src, options)
+-
+-        pipeline = create_shared_library_pipeline(context, scope, options, result)
+-        err, enddata = Pipeline.run_pipeline(pipeline, comp_src)
+-        if err is None:
+-            shutil.copy(c_file, dest_c_file)
++    source_desc = SharedUtilitySourceDescriptor(pyx_file)
++    comp_src = Main.CompilationSource(source_desc, EncodedString(module_name), os.getcwd())
++    result = Main.create_default_resultobj(comp_src, options)
++
++    pipeline = create_shared_library_pipeline(context, scope, options, result)
++    err, enddata = Pipeline.run_pipeline(pipeline, comp_src)
+ 
+     return err, enddata
+diff --git a/Cython/Compiler/Scanning.py b/Cython/Compiler/Scanning.py
+index 2a8cb5a93..4cec7d1ed 100644
+--- a/Cython/Compiler/Scanning.py
++++ b/Cython/Compiler/Scanning.py
+@@ -281,6 +281,15 @@ class StringSourceDescriptor(SourceDescriptor):
+         return "<StringSourceDescriptor:%s>" % self.name
+ 
+ 
++class SharedUtilitySourceDescriptor(FileSourceDescriptor):
++    """
++    A specialized source descriptor for shared utility code only. Not part of public API.
++    """
++
++    def get_file_object(self, encoding=None, error_handling=None):
++        from io import StringIO
++        return StringIO('')
++
+ #------------------------------------------------------------------
+ 
+ class PyrexScanner(Scanner):
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.5.bb b/meta/recipes-devtools/python/python3-cython_3.2.5.bb
index 373387576a..8bd68bd4df 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.5.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.5.bb
@@ -13,6 +13,7 @@ inherit pypi setuptools3 cython
 
 SRC_URI += " \
     file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch \
+    file://0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch \
 "
 
 # No need to depend on self
-- 
2.43.0


