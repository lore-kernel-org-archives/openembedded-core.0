Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7372CFD0065
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 12:26:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136983.1772367976080476906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 04:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lQXokIY4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75206bce17=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621CKmI63942698;
	Sun, 1 Mar 2026 04:26:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JzopL/xJyHLVewOLl1/Hf3EuBNsrodrMsZMmftm5Flk=; b=
	lQXokIY4+KUdEiu4hVCBKTqPIEnQxgQctg41wMWYueU9VlzCCFDEpxUNlnNqwMEb
	5yT4zR0+fYYiYPU+qbHTWFKBFGXvxnjMj/wKhiZ19Mo6lWuJItnI3AZgX5qrB2Qf
	5Csn+qlUx2S3RWuMRN/0IaUGOG5I7kuSftD5CpVaFG2KKui8Jzu16mAdJgxFraaN
	bsuiLmgrZhACJbvrFpK3PUAlOuPp/27yNEgjY/XpR8a5OZrbgk30DMTv1UIVO1jR
	IYK69nbF5fsVqXv/Mrp9PwjCx+vGdZOX9nbfM9JSynKQrN9aCWwvqpTexUtY9fXM
	1gMe9c8tl86PIxWguHBqtw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41456-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 01 Mar 2026 04:26:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 1 Mar 2026 04:26:05 -0800
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 1 Mar 2026 04:26:05 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v7 2/7] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Sun, 1 Mar 2026 04:25:59 -0800
Message-ID: <53352bc5606d0c3862afec1836f4e2ae901718a0.1772367692.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1772367692.git.liezhi.yang@windriver.com>
References: <cover.1772367692.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qJXlumCEmurwZUMZlT-ATBbqUxpyI053
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDExMiBTYWx0ZWRfXwdP003mJOLr5
 6knTKvnZ56sDrMxG1qRRDoE7ryWTZicB+KkqIFmd9Jf54lrSJU/rWUDRwzdVz44k3M/UIzfssSg
 kiSKsnSCnp+dOn6jaDgdQ+FrxNcHyrseWcMdnNCtdt99OmUv4rNi8YSCU0yeIKQFLHr4YUDUUjj
 jKvBg9cJoQmPLYut6XKVssmBlC9WUb6J7zaTHJlz85yrS9b+MFWOtPcsRwM+6o3BHRKvTA70hyX
 MRhjK3Ij6Z3Y4/cpzw7iN0x5C8FZmDCbxvb1QYmZnoNIBJYiCKvwOGloswB8pi3TfajJ9uvo3aM
 TIAXHa0A6FTLIVfD48BzaOa7p91zPRW5xyTa/0QzzwlFRcpWzo4Q2UgPfI6OnH5MimfbgGG/FLY
 TqWSqyaGehnq/WFCQ4CKtxpNO/GUKHOBb8BXsEgqxIphB1L5xlFmQGdoZ1DURE9/929R71SctId
 uiVyOoQu22JsNNiQnBw==
X-Proofpoint-GUID: qJXlumCEmurwZUMZlT-ATBbqUxpyI053
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a4305d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=H-NycbhAXwVI0mX1kDIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 12:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232135

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
2.49.1


