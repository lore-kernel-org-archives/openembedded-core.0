Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7584FCD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 12:49:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20692.1779194987296453924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 05:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qmKe/HOn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599714d05=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9KjpU3427944
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 12:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=sN1/uuWh+/xU109HxRWe
	JTfWW0SCs7F/LmTlo5WoD0I=; b=qmKe/HOns5g+n8TMZ99q/BYCb/3PLlBQFatV
	LID6K0VcuHZMeFws9MKOZ9QBPLJYyAQ5KAkHJuM1AsDDO1z61tsAL3fYFE8b3LJ7
	v0RkqSlNDS823LP8zdRc4gaQvQeWDiicsYAITk4VqmayY5LDMpBrKcdxakTg4+h+
	sNCVKbql/3zW4P/xmKVWr0C5BVFaLXfLS+z4DD1/VHmIrfUIb6Aw4Ml9aaEyztRz
	+nsN5rAiMJ1mQeJVGcT9pbal4aahHb/EPB4YkinM1LkuFdA9gihRphz8hB7jHyi3
	5QxclcKwRLjsAffP1SPCRke4aqocNxccJyUTLvHxYD6Z9fKJIg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3ujyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 12:49:45 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 19 May 2026 05:49:44 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 19 May 2026 05:49:44 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V2] python3-cython: make generated _cyutility.c be reproducible
Date: Tue, 19 May 2026 20:49:42 +0800
Message-ID: <20260519124943.497200-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ODwfZJhw5oP14Ia53IMzo-9H1NemlybK
X-Proofpoint-ORIG-GUID: ODwfZJhw5oP14Ia53IMzo-9H1NemlybK
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0c5c69 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=SsMK-6ewAAAA:8 a=t7CeM3EgAAAA:8
 a=PZIaBnDZ8qn-SF1NGUkA:9 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEyNiBTYWx0ZWRfX/ptM9fEpAdmU
 /Hqlv8aXPpSyYjEtYNLDtwrZRSNK9o5HH/hcu8n2xwsz/OTywm6fw0c/o2oGUGI+cwoK1b4Hfrm
 gtH9gEI/ez8UAY1H6i5AlNYfRDNXBHxjQQbAs+8xfykkeM91X4iZyN7dpb/76qBasyrJ5N/Oc2U
 ZBB+U40UpzkRc9VHRnOIR6itvm6hJkWabjrjzu9qKbBIuJAYYGDRyjM/u3kuk7JbFsBBJVZmv2a
 tsU8LV84lKsvedK4I8Fyc/sARbdVjxis3uUg+D33QZuICiaSR4AXx1+GCkQdWPMvVq3lMPAjPki
 QzRY46fNldcx5YOAO7+ghjM6my8mUpJi9dyPR48jdQmL6oWQZs5Pz/gHW7x4JeQC8c6KMHeKHVI
 +m+26SzafgrBZq4mYdygwI+7jQflLGAYY6eR7hHCdywOKl7JEU2I2Z0RTlemMHEUEMnZoUjCb8r
 k3lBOVCmQbYZgiOeQLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 12:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237321

While python3 module use cython to build shared moudle utility library,
the generated source file _cyutility.c is not stable at each build and
made the generated library not be reproducible.

This commit use the fixed relative buildpath instead of the original
unpredictable tmpdir in the generated source file to assure the file
_cyutility.c should be reproducible.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...ve-dstdir-instead-of-the-unpredictab.patch | 93 +++++++++++++++++++
 .../python/python3-cython_3.2.4.bb            |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cython/0001-Use-fixed-relative-dstdir-instead-of-the-unpredictab.patch

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Use-fixed-relative-dstdir-instead-of-the-unpredictab.patch b/meta/recipes-devtools/python/python3-cython/0001-Use-fixed-relative-dstdir-instead-of-the-unpredictab.patch
new file mode 100644
index 0000000000..68c21d82f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/0001-Use-fixed-relative-dstdir-instead-of-the-unpredictab.patch
@@ -0,0 +1,93 @@
+From 1a97d877e9fa9856c55db73bb5fbdcd3e86cada1 Mon Sep 17 00:00:00 2001
+From: Zhixiong Chi <zhixiong.chi@windriver.com>
+Date: Thu, 23 Apr 2026 00:19:59 -0700
+Subject: [PATCH] Use fixed relative dstdir instead of the unpredictable tmpdir
+ for sharedmodule
+
+When the option "--generated-shared" is used to generated __cyutility as the
+link https://github.com/scikit-learn/scikit-learn/pull/31151/files, the path
+for filename_table in the generated pyx/c file contains tmp dir which is not
+predictable though it has been updated to the relative path, and it caused
+the generated output file is not stable at each build and made the generated
+library is not reproducible [1] between builds.
+
+example as python3_pandas:
+
+vim build/_cyutility.c
+......
+/* #### Code section: filename_table ### */
+
+static const char* const __pyx_f[] = {
+  "../../../../../../../../../../../../tmp/tmpXXXXXX/_cyutility.pyx",
+  "<stringsource>",
+};
+
+Replace with the fixed path based dest directory provided by the option
+"--generated-shard", and don't use the tmpdir anymore.
+
+After applied this commit, vim build/_cyutility.c
+......
+/* #### Code section: filename_table ### */
+
+static const char* const __pyx_f[] = {
+  "shared_buildpath/_cyutility.pyx",
+  "<stringsource>",
+};
+
+[1] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [https://github.com/cython/cython/pull/7634]
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ Cython/Build/SharedModule.py | 30 +++++++++++++++++-------------
+ 1 file changed, 17 insertions(+), 13 deletions(-)
+
+diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule.py
+index b466e57ed..171f8180f 100644
+--- a/Cython/Build/SharedModule.py
++++ b/Cython/Build/SharedModule.py
+@@ -72,23 +72,27 @@ def generate_shared_module(options):
+     Errors.open_listing_file(None)
+ 
+     dest_c_file = options.shared_c_file_path
++    dest_c_dir = os.path.dirname(dest_c_file)
++    dest_tmp_buildpath = os.path.join(dest_c_dir, "shared_buildpath")
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
++    os.makedirs(dest_tmp_buildpath, exist_ok=True)
++    pyx_file = os.path.join(dest_tmp_buildpath, f'{module_name}.pyx')
++    c_file = os.path.join(dest_tmp_buildpath, f'{module_name}.c')
++    with open(pyx_file, 'w'):
++        pass
++    source_desc = FileSourceDescriptor(pyx_file)
++    comp_src = Main.CompilationSource(source_desc, EncodedString(module_name), os.getcwd())
++    result = Main.create_default_resultobj(comp_src, options)
++
++    pipeline = create_shared_library_pipeline(context, scope, options, result)
++    err, enddata = Pipeline.run_pipeline(pipeline, comp_src)
++    if err is None:
++        shutil.copy(c_file, dest_c_file)
++
++    shutil.rmtree(dest_tmp_buildpath)
+ 
+     return err, enddata
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.4.bb b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
index 3e889857e1..d380489b78 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
@@ -13,6 +13,7 @@ inherit pypi setuptools3 cython
 
 SRC_URI += " \
     file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch \
+    file://0001-Use-fixed-relative-dstdir-instead-of-the-unpredictab.patch \
 "
 
 # No need to depend on self
-- 
2.43.0


