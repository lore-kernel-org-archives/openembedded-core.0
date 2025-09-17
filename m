Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97091CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 12:10:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21023.1758111020692387620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 05:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mRWzbeMt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1355165e2e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58HAFXIS531897
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 12:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=AHbWczOwM95ARCzXCp+X
	vnR0voNiyj+CfOGR/QgFycQ=; b=mRWzbeMtXPKQZkANLc0zLaV4rTcnlWQczBpo
	wZQur8U2uu6Y/R5SVpEdGd9lmP6OinFtx0a95az08F5r5/DvDgUHsWSmfgZWN/fK
	t7t0WOs7x0WsTDYw/KPJYB+JZ48pR77FAV/ubHUEpEBbXHlLOSu3LRZotjotkp2X
	9gdheslmmqhHshoir36YVXMOU7RASlFrE4ptlApl9+edT+j0YzKOjGGN3azyeyfj
	2wRWWs/SWtTcuhr2xehlgmfXM7qZI2xZk2mXwS4UkOvvGTMfOHG7DwN62NdvyrOb
	sX172xHhibBOeHKWDtL6rIMHA2UGUv+V4bnEB5N2hwimy1jKRA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwrrk9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 12:10:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 05:10:18 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 17 Sep 2025 05:10:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-cython: make generated source file be reproducible
Date: Wed, 17 Sep 2025 20:10:16 +0800
Message-ID: <20250917121016.15784-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZOjOgFFOUhGM7Iit1p9sLtfIri7sXweF
X-Authority-Analysis: v=2.4 cv=Sdr3duRu c=1 sm=1 tr=0 ts=68caa52b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=SsMK-6ewAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=g7mk2kwgWIfPHEv9AUkA:9 a=49hUO6naoDravHwzbBTq:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExOCBTYWx0ZWRfX1CKcqt3x9isD
 CcMtm2yXf7Rr4P6D0Wbpi8UOawBQUn6eHrlR3EfDUJnhnUSqaG1Lq0h7UtJk3Alx6Btp28Xldt4
 lSrRTntSJQ35mvLNdhk28YFydIgCqzqZrOURT93QwOZOHZjj5Q0Yxo8He26cStbipiMF3oGibAy
 e2/fy1oaf29SPiNFiCai6DnYvuvInSRqrw74pZFIU03euP0+heZYb5nj4ZblvItZOhGlTuT0JFz
 4N4j2D89zJnverYrBzIK5fCjZbrVwhCS1SDsIpWBicXX532lvpKnKIK03QF9TQeCdc2RSJNfCj0
 apOucP6mToc3RCJFd2tKHKd+Ey9rE4pkaQeRfNXuGvdkTCpO+CeiqUQUtidCf0=
X-Proofpoint-GUID: ZOjOgFFOUhGM7Iit1p9sLtfIri7sXweF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 12:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223598

While python3 module use cython to build library, the generated source file
is not stable at each build and made the generated library not be reproducible

This commit remove un-predictable string from generated source file,
thus the generated library should be reproducible

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...h-prefix-from-metadata-in-the-genera.patch | 70 +++++++++++++++++++
 .../python/python3-cython_3.1.3.bb            |  4 ++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cython/0001-Remove-build-path-prefix-from-metadata-in-the-genera.patch

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Remove-build-path-prefix-from-metadata-in-the-genera.patch b/meta/recipes-devtools/python/python3-cython/0001-Remove-build-path-prefix-from-metadata-in-the-genera.patch
new file mode 100644
index 0000000000..b560e9d020
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cython/0001-Remove-build-path-prefix-from-metadata-in-the-genera.patch
@@ -0,0 +1,70 @@
+From f33847ca55e508106999471c1d6a2f7371503a1a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 17 Sep 2025 01:42:08 -0700
+Subject: [PATCH] Remove build path prefix from metadata in the generated output file
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
+Remove build path prefix from metadata, after applied this commit,
+vim frozenlist/_frozenlist.cpp
+...
+/* BEGIN: Cython Metadata
+{
+    "distutils": {
+        "depends": [],
+        "language": "c++",
+        "name": "frozenlist._frozenlist",
+        "sources": [
+            "frozenlist/_frozenlist.pyx"
+        ]
+    },
+    "module_name": "frozenlist._frozenlist"
+}
+END: Cython Metadata */
+...
+
+[1] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [https://github.com/cython/cython/pull/7161]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Cython/Compiler/ModuleNode.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
+index 6672cb986..ae1625ea2 100644
+--- a/Cython/Compiler/ModuleNode.py
++++ b/Cython/Compiler/ModuleNode.py
+@@ -779,7 +779,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+         code.put_generated_by()
+         if metadata:
+             code.putln("/* BEGIN: Cython Metadata")
+-            code.putln(json.dumps(metadata, indent=4, sort_keys=True))
++            _metadata = json.dumps(metadata, indent=4, sort_keys=True)
++            _metadata = _metadata.replace(os.getcwd()+'/', '')
++            code.putln(_metadata)
+             code.putln("END: Cython Metadata */")
+             code.putln("")
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/python/python3-cython_3.1.3.bb b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
index dcb61a3634..1e0b28b12b 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
@@ -11,6 +11,10 @@ SRC_URI[sha256sum] = "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d59
 
 inherit pypi setuptools3 cython
 
+SRC_URI += " \
+    file://0001-Remove-build-path-prefix-from-metadata-in-the-genera.patch \
+"
+
 # No need to depend on self
 DEPENDS:remove = "python3-cython-native"
 
-- 
2.34.1


