Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABE6106702C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22426.1773324626764434390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kTfCG34d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDEs133876;
	Thu, 12 Mar 2026 14:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nh7/VDUSnEy9imMvFydq2SInJRX5N4eKqo6fgsQG/XA=; b=
	kTfCG34dwscbUeu89YTKXTn3LqYgtKIV0HYys7zwza2riAB5qQ0wwdgrafHpzcBW
	U87tYWfL8ihlesUv4uc+KKrwKwPD5rkn5G00WdcNb/cRhKfUGlJL9/Aas2xOzZ+3
	iwHa0v4j0GlfJoBhvuRtENKALEIuDKFoaPCqg2CCCxdmPnpuqdOLKafBnMTF52lg
	FoQ4xlm5Tx6EA1aHpK1RwD6XeE1+6WkM9sBenDoktjzSvE8UbqorgQYnF7e9vdbd
	deZ7DiIKkTy7YOZHpl7c9eKY/2E30Iz3ZD2hr519ERIhm9QS8paTfyViSghX2b4A
	wMKDMfYlPvGJUAnQlyztVw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 07:09:40 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 07:09:39 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>
Subject: [PATCH v8 2/9] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Thu, 12 Mar 2026 07:09:32 -0700
Message-ID: <1f56dc871910414ca7f263788ce14225c29f8137.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1773324129.git.liezhi.yang@windriver.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: azUMhPSGGuo_htYeAQ43jBL5FjPcFmpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfX1wpeOCso8GRi
 DuuG4sOPvE64slREArjudakXujfNf5nMKR43+eshh97GRtn426Rf7tuIXXctdsnusQ9cOc6yDE9
 1/j43R8HFCZVhoo1A66Jivf9FRQ5SKhO/cFAJlhiW2JEtwqwx9uDP3HbRO72qksFD9rihaRBe/H
 ESdZCSQ0sBPeGgc477KhOe4SiQSRw36NaZ8ZTUPTHrTdXyCKz/SdCmvft3Fq05KUePvFfnMFkJr
 1a7D/ZHxStZmrOmQhCAA/3KREEl1hRN6doG48/k+D9t9tOTfA+c62F4YBRe5aMlmi0J90CobzTl
 1kqHwVULC9CCJjedzK9UrnQYks1JmkdNFwRD35Jiobzu/UVG3PQBcKfOb7SZAwzIquaZrsrWo9x
 O5Zf5Jpp6sxNAACrCDzyfmvjThTAYXgug8bzgxngJtw80kU8uZS88IjFlMSVsZ4KM9hIiq7ImOM
 iFh9ry/8CS1Dz9Z06fA==
X-Proofpoint-GUID: azUMhPSGGuo_htYeAQ43jBL5FjPcFmpo
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c925 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=H-NycbhAXwVI0mX1kDIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232965

From: Robert Yang <liezhi.yang@windriver.com>

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.1:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib, this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.1.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index bb3b8f830a..f4dd779a52 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -620,6 +620,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
-- 
2.49.0


