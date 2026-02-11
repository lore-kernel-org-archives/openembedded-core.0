Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B07EB5964
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:20:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10720.1770780016622252175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rZHZCI51;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e9d17b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B1U2KN3781698
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=JzopL/xJyHLVewOLl1/Hf3EuBNsrodrMsZMmftm5Flk=; b=rZHZCI51klny
	OejBvZYWB57JmMsE6IU/tukHYdCb7NAhk/7u/d7+lvTgoznLE/cgP11Ev6O11orf
	O4TkC21/VbztRPo3A0yzQhJabk/VPmyuzHp0NTOG9qascd7Wy0fixVAw8T/1bi+q
	0JHhw6CikzHkvPmPHZBFB8NWx7+aZgQVQ3O/CEHIMjcsBbk3J1SRErG6G+/YHLss
	tCJhMCBhoNSHLD5Rr70KAqCPlujs94YjMztXq/SmsXOrdxqu+InKC+GqUiqdl+rO
	Y2uOAeCQs/vUBQ9lK69e5mLJBxYSqNjM+0a7gAJFadEJHUB0rjneiU2YazbFFX6f
	KHxBzGefjw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4uyx9-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:20:16 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 19:20:14 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 19:20:14 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5 2/7] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Tue, 10 Feb 2026 19:20:09 -0800
Message-ID: <fdd2a7cf847b382e95c614f3b2f07f2ded3bd4d9.1770779786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770779786.git.liezhi.yang@windriver.com>
References: <cover.1770779786.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698bf570 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=H-NycbhAXwVI0mX1kDIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wLMR3yr5GLMWERhVwpnXHizyaO2wwcEe
X-Proofpoint-GUID: wLMR3yr5GLMWERhVwpnXHizyaO2wwcEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNSBTYWx0ZWRfXzsJvmyiL5EB1
 zM+tKbicUQN7i8yUhk12Vl1Bh6/n5zm3JebNeaDvRARorW951XDJp/UwinUaz+pp70IlcA6Ke0u
 zj5bO9CgkfsG4pVKwmfMxujfttxYYKOj1tSQLzvSU5sP8Vo8rhu7d6N6/4uhQxDro1sOGbuXPpj
 AKgbH2SkkhK4h+AQ2aChn4h7Zgt94TitfX3cL6cdRdM4S++Ywqfa30N0ySlX1HOLz0LopaEj7n8
 NGKxDOThN7Q6p952N0Sn12byOHh6XOA35wUT1w6M70vG9micOdUldmyhNiRdAA1CZ7pMNmnMmBi
 cqsEofpfYfK7KQkKmBGuTzC7Nk5EHwfXQY7oI4aFDTFl9IMde7QElXILf2odHGraWbHsa6iBD6X
 CYugCNBDh18Y68EAYXZmTlGOitbfYkKxaP+7ECtkMC6rxCvBaiAvVUSv0+DByUDaPCm6oK6nQa5
 LcM9rXXFeEoVfdQQG4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230952

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


