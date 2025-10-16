Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C279DCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 14:28:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10212.1760624877085395178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 07:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bSXbm/ch;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23844c9b6c=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G8Iqs61368055
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 14:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=B1tL31ORjNFmN6nkgjzO
	oGVX7PhRnQMi4TasNps93iQ=; b=bSXbm/chPmFEHPLiHgik99YnW+G98KpjNFGC
	tp+BvOZe79QOy4+lzPDWqZPUmPcMPp6HKY/X9Y4vMgdcg7WQVgrQTzbQHzR9UB5S
	cFoI2tO4zJsikaQ5aWqtUJ2AJT9GwsvNRsNhckpAiO7bHAXsO8wj3Qel4OnW2hWY
	4gVNKXOqZt0TDDKy/0S7+81VWiLBb5x3gGIioyGyR18njOX1W5xcLRQghV7A85wu
	nfDaEGhlyTHEVQYHTDFnvsapWVVbVYsifz8KhX+uM+/ElfPJTzzwO6mJK4co2JNn
	zxDN+Fm4KZh68ePi/P9P6TO72D2/vqKfg+k4PePOOsllwjaU2A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewpevf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 14:27:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 16 Oct 2025 07:27:54 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 16 Oct 2025 07:27:53 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] cmake: fix CVE-2025-9301
Date: Thu, 16 Oct 2025 19:57:52 +0530
Message-ID: <20251016142752.2283060-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: piwLP-LwNIlvu8LxjuguQ1GUIkt79Zbu
X-Proofpoint-ORIG-GUID: piwLP-LwNIlvu8LxjuguQ1GUIkt79Zbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDEwNSBTYWx0ZWRfX5h19DXkxsYkl
 gKg113ds/TTuZRgkW5KuzQi2jwCPNpZeFEDDKZlGNugKepbufLJbYtrcDYtzbRoxYNvyTtaI5EX
 Kwfass334gWzOpv2YoWG8DrBSvwvKf8BDBiesxVvMyPBD3YnsbvTO5W98fqvzd3dt1NwlN/Jy8a
 2K6CW7dT4gEyl0ykERkGvNi6IoTjzCUjwcdyHT+clSc3S3rbCQNCrwZ9st6169U1xGAZazfs3hZ
 Nx7IqA/ug/eiHoojKjDR/dSDOwUFHM6/4qaLOthgFobx7Nuj1hru9cKacoQLVbiqEMloqNb29Pg
 pbVEiL/4f8gw0JxvDEk4wCrVtoLyr69P3+EP6MXfHq6tJTJZFescNf03mxYHRXlfTgn2N8U42tu
 Kky6X0BAFOtgRzdwDgPUXMsn4TBZ9g==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68f100ec cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=Ud-fGmwBAAAA:8
 a=t7CeM3EgAAAA:8 a=Sy7bPN1xXRUIE74_xK8A:9 a=H0_BfbLtyfsadj6IJfz3:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 14:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224970

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-9301
	https://gitlab.kitware.com/cmake/cmake/-/issues/27135

Upstream-patch:
	https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../cmake/cmake/CVE-2025-9301.patch           | 71 +++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.22.3.bb   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch

diff --git a/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
new file mode 100644
index 0000000000..08137ae503
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
@@ -0,0 +1,71 @@
+From 37e27f71bc356d880c908040cd0cb68fa2c371b8 Mon Sep 17 00:00:00 2001
+From: Tyler Yankee <tyler.yankee@kitware.com>
+Date: Wed, 13 Aug 2025 15:22:28 -0400
+Subject: [PATCH] foreach: Explicitly skip replay without iterations
+
+As written, foreach loops with a trailing `IN` (i.e., no loop
+variable(s) given) lead to an assertion error. Handle this case by
+exiting early when we know the loop won't execute anything.
+
+Fixes: #27135
+
+CVE: CVE-2025-9301
+
+Upstream-Status: Backport
+https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8
+
+Signed-off-by: Tyler Yankee <tyler.yankee@kitware.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ Source/cmForEachCommand.cxx                  | 3 +++
+ Tests/RunCMake/foreach/RunCMakeTest.cmake    | 1 +
+ Tests/RunCMake/foreach/TrailingIn-result.txt | 1 +
+ Tests/RunCMake/foreach/TrailingIn.cmake      | 5 +++++
+ 4 files changed, 10 insertions(+)
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn-result.txt
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn.cmake
+
+diff --git a/Source/cmForEachCommand.cxx b/Source/cmForEachCommand.cxx
+index dcb36265..35b59960 100644
+--- a/Source/cmForEachCommand.cxx
++++ b/Source/cmForEachCommand.cxx
+@@ -100,6 +100,9 @@ bool cmForEachFunctionBlocker::ArgumentsMatch(cmListFileFunction const& lff,
+ bool cmForEachFunctionBlocker::Replay(
+   std::vector<cmListFileFunction> functions, cmExecutionStatus& inStatus)
+ {
++  if (this->Args.size() == this->IterationVarsCount) {
++    return true;
++  }
+   return this->ZipLists ? this->ReplayZipLists(functions, inStatus)
+                         : this->ReplayItems(functions, inStatus);
+ }
+diff --git a/Tests/RunCMake/foreach/RunCMakeTest.cmake b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+index 15ca4770..acfc742e 100644
+--- a/Tests/RunCMake/foreach/RunCMakeTest.cmake
++++ b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+@@ -22,3 +22,4 @@ run_cmake(foreach-RANGE-invalid-test)
+ run_cmake(foreach-RANGE-out-of-range-test)
+ run_cmake(foreach-var-scope-CMP0124-OLD)
+ run_cmake(foreach-var-scope-CMP0124-NEW)
++run_cmake(TrailingIn)
+diff --git a/Tests/RunCMake/foreach/TrailingIn-result.txt b/Tests/RunCMake/foreach/TrailingIn-result.txt
+new file mode 100644
+index 00000000..573541ac
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn-result.txt
+@@ -0,0 +1 @@
++0
+diff --git a/Tests/RunCMake/foreach/TrailingIn.cmake b/Tests/RunCMake/foreach/TrailingIn.cmake
+new file mode 100644
+index 00000000..e2b5b2f2
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn.cmake
+@@ -0,0 +1,5 @@
++foreach(v IN)
++endforeach()
++
++foreach(v1 v2 IN)
++endforeach()
+-- 
+2.35.5
+
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.3.bb b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
index 04a0f0e793..e5e279c07f 100644
--- a/meta/recipes-devtools/cmake/cmake_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.22.3.bb
@@ -12,6 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
     file://0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch \
 "
+SRC_URI += "file://CVE-2025-9301.patch"
 
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \
-- 
2.35.5


