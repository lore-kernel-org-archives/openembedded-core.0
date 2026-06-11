Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D52CD98C6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 06:50:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39809.1781160645262217380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 23:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DCnApsTu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0622bf43b4=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B54Ujh3157295
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 23:50:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SBdxoebjrTrAQ0aJJExs
	3h5HXIDjjXUrKBwDBLPg/mc=; b=DCnApsTu8syaveR9HF048M7u57pSNPVfe1UW
	v13j+wBI/Ea4MwnbnH7b0vn1UE+pp0lWFGjRIaRViwirYw6vngnLd4R6ieO9mNEE
	oMaRwu4gcLMqlEv3eRrQxwnScVXpTF7TCW2pxLN3C9PpD7o1fK9cKGDXZnF0+Vdz
	kB6m+rxh5syvLjSdKnq5R58WBX40umNXt/GzREiGIjPTmalyxwjmHI9zuKoEiTuL
	DU6kM52AR10j6cMR6gtfKWXJAdE9VbB8usyQkcQR/cIcJy/dw4iIakT3+MvNEYE1
	CKe+HisVi774YrB8dGzBpDB4VB74AU0jYGEfYvUNU/x+Wvrelw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7agm18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 23:50:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 10 Jun 2026 23:50:44 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 10 Jun 2026 23:50:43 -0700
From: <Shilong.Jiao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2] python3-six: fix test_lazy failure in ptest
Date: Thu, 11 Jun 2026 14:50:42 +0800
Message-ID: <20260611065042.2223999-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KgBmW6Q65QLpx7v1X-KapR1-P5f_8Zl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2NSBTYWx0ZWRfX30Q/AhERE7dM
 Im/12/ul12yKizX4gCvlPSk6DugVZpShI53xxOCccR8ON3pHikSFCc/vZeFiAQ53SbNUoRtgX4w
 b6rRDOyPeCe7mc6hgencr3JBXGt91SPHHiIk5lIH3i+g5OZd1y+/2u2Ui5nL5W/xLB6Hhh0QJa5
 vBTize4oswAiuWunZwgQDWTxkKBvwX7gWex6fEAx+QC37/DphaqUFfXeYG0QOyaFv3JsEFd4eNo
 otW86GLqh2drpZ1Dfx9L5dmATuHb+qnTSZOIEDE2FP4CiJeEHiRQpM2pr1bvH2tncAGdg34y2wn
 BBCLfmSzocpxKZcce/nuNEWspxdvg6XytHHDhVSEH+EG4iVOfIe6WVMHdvHFKmCw6SmMOUPd4er
 ug/IDeSWy9pVBE+7GPyWHsWznkdNpsyqJrR6GBVF8dH2JYXwxwAlGuDS/HlNzN0EnSapm9pMvRB
 7Rl38jgoJacfCE5di8w==
X-Proofpoint-GUID: KgBmW6Q65QLpx7v1X-KapR1-P5f_8Zl4
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a2a5ac4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=U9mKMZQizFDwuit0HYQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2NSBTYWx0ZWRfX2JW4sNp706yc
 FbGfqUTtvIvqRV096s7E6E3D+k7IlYgCLW+GuRDcqpK9zFplqc9cxgb6bXARjeVMhbWenuBW+wR
 Tivlk2NrHbvLn55lWwTnv1EIC3NGrpB7jlobrvi81cId2miYlukP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 06:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238425

From: Shilong Jiao <Shilong.Jiao@windriver.com>

The test_lazy function requires html.parser to not be in sys.modules,
but if test_move_items runs first (which happens in pytest's execution
order), it imports the module causing test_lazy to fail.

Add fix-test-lazy-order.patch to clean up module state before testing
to avoid test order dependency.

Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
---
 .../python3-six/fix-test-lazy-order.patch     | 23 +++++++++++++++++++
 .../python/python3-six_1.17.0.bb              |  5 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-six/fix-test-lazy-order.patch

diff --git a/meta/recipes-devtools/python/python3-six/fix-test-lazy-order.patch b/meta/recipes-devtools/python/python3-six/fix-test-lazy-order.patch
new file mode 100644
index 0000000000..9c22872e1f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-six/fix-test-lazy-order.patch
@@ -0,0 +1,23 @@
+Ensure test_lazy runs with clean module state
+
+The test_lazy function requires html.parser to not be in sys.modules,
+but if test_move_items runs first, it imports the module causing 
+test_lazy to fail. Clean up the module state before testing.
+
+Upstream-Status: Pending
+Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
+
+--- a/test_six.py
++++ b/test_six.py
+@@ -89,6 +89,9 @@ def test_maxsize():
+ 
+ def test_lazy():
+     if six.PY3:
+         html_name = "html.parser"
+     else:
+         html_name = "HTMLParser"
++    # Ensure clean state for lazy import test
++    sys.modules.pop(html_name, None)
++    six._MovedItems.__dict__.pop("html_parser", None)
+     assert html_name not in sys.modules
+     mod = six.moves.html_parser
diff --git a/meta/recipes-devtools/python/python3-six_1.17.0.bb b/meta/recipes-devtools/python/python3-six_1.17.0.bb
index 213b3dc593..2a12831bea 100644
--- a/meta/recipes-devtools/python/python3-six_1.17.0.bb
+++ b/meta/recipes-devtools/python/python3-six_1.17.0.bb
@@ -3,7 +3,10 @@ require python-six.inc
 
 SRC_URI[sha256sum] = "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += " \
+    file://run-ptest \
+    file://fix-test-lazy-order.patch \
+"
 
 RDEPENDS:${PN}-ptest += " \
     bash \
-- 
2.34.1


