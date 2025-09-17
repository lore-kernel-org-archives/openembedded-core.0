Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A74CAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 13:50:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23552.1758117050913088910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 06:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lQ09Q2Jp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1355165e2e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58HAc8hw576337;
	Wed, 17 Sep 2025 06:50:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ipX9R0gG5
	aX2qAuBT98bLR9EyQYBWw7j/kzn927kY7Q=; b=lQ09Q2JpyI9sygF9QYVXkIJMq
	CareLKcwZjFhcWdPrGYbIDncG3EptkNYetSqGBs0MPho5bUO8RQUWVET+f0OvZHP
	ID8lsVkhdVlzTy17/kccDlHCSrBm+o/KTpGqqtJV4qNLeXBXRXDArWq9alNfafqj
	HgW8qocnNxor7l7aFiejTznJAcZViOgTIF5j1G1pubzDN1BK3vXmKyZ4HSdmxMtQ
	gUdzdzQvk+f6GG4/OysjbVd19dXvcuxgcPqAD5/fY0r29t8jas0x2xtUPqcxStMi
	37NAOcdISrzIwZhLXlyYBjYWLEBQ6dUYeGHMJIxXXan+GtOuRP0o2Y5sOPAZw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr0r4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Sep 2025 06:50:49 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 06:50:48 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 17 Sep 2025 06:50:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <skandigraun@gmail.com>
Subject: [PATCH v2] python3-cython: make generated source file be reproducible
Date: Wed, 17 Sep 2025 21:50:47 +0800
Message-ID: <20250917135047.2957170-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Jay8rVKV c=1 sm=1 tr=0 ts=68cabcb9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=SsMK-6ewAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=ZYyfB17y-bkqDIpY4i4A:9 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEzNSBTYWx0ZWRfX3Xu4NzXLEQqx
 jR9ZEDni94nwmrfl4arbvjgjs8K7XtApjqqMPO3ppOJWgIlEdo5VJUjAQAFrpXekI2dozmf3Brr
 m5r7ZJBt9XOTRC/Un2IIFrOEiMgiuWhnKvti8YybPX6ef72H7wvzAUSlrLbD8GHw7zfRMJowow8
 /JV1LBjzrqmGoHvB8QO0plNQBvK1jIcBRz+PAgWfV5ElCYQI3aDlQN6DTlcuFzIMoA5SoYfZosB
 O6BEx+nu8NHbHZbv0rpwGYlmyLI0lVWkYr8+LmUdGPbkMJScUkKLZFILe2TwEj2l3F0U32nGaH6
 LJmm3ZC930x/jEk6iP8KANuYRtTv0Nx7/CPCnK5jCmzAoYuChZPb/EssKANKn0=
X-Proofpoint-GUID: I4FFcrVG8AmtTb8r61GXb45qhKDOZ0BB
X-Proofpoint-ORIG-GUID: I4FFcrVG8AmtTb8r61GXb45qhKDOZ0BB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223604

While python3 module use cython to build library, the generated source file
is not stable at each build and made the generated library not be reproducible

This commit replaces un-predictable string with hardcode string in generated
source file to assure the generated library should be reproducible

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ictable-build-path-prefix-with-hardc.patch | 72 +++++++++++++++++++
 .../python/python3-cython_3.1.3.bb            |  4 ++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
new file mode 100644
index 0000000000..1fbbd8fd48
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -0,0 +1,72 @@
+From 1690c505f1387e1884565021991a162e2f88f2b9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Sep 2025 01:42:08 -0700
+Subject: [PATCH] Replace not predictable build path prefix with hardcode
+ string in the generated output file
+
+The build path may contain tmp dir which is not predictable, it caused
+the generated output file is not stable at each build and made
+the generated library is not reproducible [1] between builds
+
+vim frozenlist/_frozenlist.cpp
+...
+/* BEGIN: Cython Metadata
+{
+    "distutils": {
+        "depends": [],
+        "language": "c++",
+        "name": "frozenlist._frozenlist",
+        "sources": [
+            "/tmp/.tmp-frozenlist-pep517-cfdvygni/src/frozenlist/_frozenlist.pyx"
+        ]
+    },
+    "module_name": "frozenlist._frozenlist"
+}
+END: Cython Metadata */
+...
+
+Replace build path prefix with hardcode `build_path', it is no harm to
+tweak comments in source file, after applied this commit,
+vim frozenlist/_frozenlist.cpp
+...
+/* BEGIN: Cython Metadata
+{
+    "distutils": {
+        "depends": [],
+        "language": "c++",
+        "name": "frozenlist._frozenlist",
+        "sources": [
+            "build_path/frozenlist/_frozenlist.pyx"
+        ]
+    },
+    "module_name": "frozenlist._frozenlist"
+}
+END: Cython Metadata */
+...
+
+[1] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [https://github.com/cython/cython/pull/7162]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Cython/Compiler/ModuleNode.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
+index 6672cb986..b1123515e 100644
+--- a/Cython/Compiler/ModuleNode.py
++++ b/Cython/Compiler/ModuleNode.py
+@@ -779,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+         code.put_generated_by()
+         if metadata:
+             code.putln("/* BEGIN: Cython Metadata")
+-            code.putln(json.dumps(metadata, indent=4, sort_keys=True))
++            _metadata = json.dumps(metadata, indent=4, sort_keys=True)
++            _metadata = _metadata.replace(os.getcwd(), 'build_path')
++            code.putln(_metadata)
+             code.putln("END: Cython Metadata */")
+             code.putln("")
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/python/python3-cython_3.1.3.bb b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
index dcb61a3634..3b2835d9c5 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
@@ -11,6 +11,10 @@ SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d59
 
 inherit pypi setuptools3 cython
 
+SRC_URI += " \
+    file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch \
+"
+
 # No need to depend on self
 DEPENDS:remove = "python3-cython-native"
 
-- 
2.34.1


