Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED23EA3F0F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 07:10:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15026.1770707444843971757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 23:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FotMjxyb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6dUMb1796014
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 23:10:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=JzopL/xJyHLVewOLl1/Hf3EuBNsrodrMsZMmftm5Flk=; b=FotMjxybwldC
	zJkk84cgTydduTEp/sH8o77K/3d/cEqQGjm3vGVOyrJqa8kbTDzLUyWYiSi1k5OC
	YtiTIU+6b7tDqbj9dJ18LsrntVvh8yoEp3Oo94TNYi2sh2nLETF8lS1ied00ByRR
	26oNyRDGM09o1MqfMY+0aV0CRigKLdLQlrIGTDlt9of/vW8U+OeS2xYXzRO1c1mf
	tE07offrZPWcOKQS9l7HWIfdTroPttB1DIFizpEcsPafJeTBrPXv+Rz4+NsCbYjT
	yVN2jfu2CjNUDAwR292vH9z6tB+JfISCYrfwp8W40HmUAzaK79dADq29GsZl6lye
	2REkUq7ybg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj2m0n-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:10:44 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 23:10:43 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 23:10:43 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 2/7] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Mon, 9 Feb 2026 23:10:37 -0800
Message-ID: <fdd2a7cf847b382e95c614f3b2f07f2ded3bd4d9.1770707181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770707181.git.liezhi.yang@windriver.com>
References: <cover.1770707181.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CXrSAHE80mCRz6SdbMAid3N66Xq-8oeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1OSBTYWx0ZWRfX3P0blMf77YiW
 pvRx2pYQjqUnsD3vgwtFYyTkvgJolqPjCJh7J6hXWj9oax5/7aC9heo8eMrW/i9xXnLxbKheWZS
 B0WMUPu0ZU0bjbLmAgGHClBesYBFYPoD6OqRpM9462yHCmlQfQde1fnb9kFqQql8U/BTajxKNtu
 quXJ0H4dgMyc0Cxb7i1DdEwvW79qzKFzp7zopR/gzoUUueVyWXygZ41K6AM9g5q/XiV8tu9w/KP
 f3kun23Oo6nyDdA1XqtWYYPUXqw9S2y+3W1d28NEO86pE73quvyAFh/8uNv24Dro0lTgdKe4BR3
 3DLquHGxQXMZw/CVxEjBXDWg63782sleCBesKmJIM3SgTAsto/X6+htONbatKqKQdsuvnpTu3fS
 DgQP2BPIvdK5LFpYOVs43CUkT7WUWfKlSxBbulsgUVI7dxX6q5NCtxrrXsCYokV84ZH18y78zC6
 qOIufYN3EzxNVbhWOsA==
X-Proofpoint-GUID: CXrSAHE80mCRz6SdbMAid3N66Xq-8oeb
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698ad9f4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=H-NycbhAXwVI0mX1kDIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230853

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


