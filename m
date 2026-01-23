Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E7FD6CFDC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:13:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62038.1769148799924654906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 22:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lA8Ivf+S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548316c7e7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5rMOh3266032;
	Thu, 22 Jan 2026 22:13:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=zyvWSeyBd
	qcuNUerdpX1Trk6oKoiyI5VZ3a+ouQ9FlQ=; b=lA8Ivf+SqV/rzk3R380Du798a
	tC/giju2+KIMvZRRhOWcUYZYy3xP/KbnqWOD+iHI9N1IbwotfFstijK/CKHwv0A2
	0UYaMz8AB9yFVyZp5qxPjxZnebnpPvXCPOSQCUJjYVxya2LVOcU2w9MsFhSOkQA5
	Au3DYovt7x6de/INL8On0gNs/J9+Y7e9U9cooT6KOwTTRNU2J7uKnHNqS/SPu2/z
	PbihNuBD39diC5VnQNyxtRdqUqQ5EyBOrpfDjCrSMu+SkYc6Odg2hE+Us3OPSx9K
	RTXiHUWXK7F8uWquWDMWZDXt04aSrVZ2V7ffnACUGm+vzNM+HUK+hQ82JS/PA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75us0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Jan 2026 22:13:15 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 22 Jan 2026 22:13:14 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 22 Jan 2026 22:13:14 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <mark.hatle@kernel.crashing.org>
Subject: [PATCH v3 0/2] rpm: 4.20.1 -> 6.0.1
Date: Thu, 22 Jan 2026 22:13:12 -0800
Message-ID: <cover.1769148163.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3ct7VGFzjqVino746Chgx1GpRQYGsnv2
X-Proofpoint-GUID: 3ct7VGFzjqVino746Chgx1GpRQYGsnv2
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=6973117b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=THngvZuacdX5GzmN6LMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA0NSBTYWx0ZWRfX10rzd+/D+pLI
 z2E6a6Msj8ObxhDd5+MkJlHvS2AEKwbi8dHh5mYqPSuO1+P2QqKHWonRG1EMNRDRNl1DBmERZgX
 GPVekTqRH5GnEMk0vepcj+HhUw5GGPoBnBgltNqHHhhLEMLg7NPnrFQax0B97F5j0zARkmMWCgG
 VrZCNZT5mbFcarzR9lmT8f7HnUFhVg6EmSRODRkK5mMukh5Z70u7nwZ3lE+C9ru8j5tuOFYxcyT
 LzlAaswpq9Gx/jcZL9P5F/PDjY+ph5onkGWirdTQIusZx6bPXpIU6EXPZhhoXoTEU9Z1Pudlkrb
 52rZtM0ZjXArS0MA/ilmKsKwyimqXT+E2ZPGtg7XzjUHjy0FmnvMIDNK0IGehJG9F6Ga+Gm1MHN
 axgRO+L+xDNGcDUKwBgS4vUJQeyEaKmWrgkGwhFNWZWOiV3KpqDEa9m6fUDFg3TKt2zlvVOyBmT
 aXgs1/lVg0je/GWSHiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 06:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229870

From: Robert Yang <liezhi.yang@windriver.com>

* V1 & V2
  - Initial version

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

// Robert


The following changes since commit 831fcbebf3ddbcf3b84eb9b0540cc9ac4d0b0635:

  flac: fix compile failed on musl (2026-01-22 14:21:21 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

for you to fetch changes up to 212239fdc34e812c1e827917d5db83fecac2a3f3:

  rpm: 4.20.1 -> 6.0.1 (2026-01-22 22:01:58 -0800)

----------------------------------------------------------------

Robert Yang (2):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  rpm: 4.20.1 -> 6.0.1

 meta/classes-global/package_rpm.bbclass       | 84 +------------------
 ...olor-setting-for-mips64_n32-binaries.patch | 21 +++--
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 46 ----------
 ...satisfiable-dependency-when-building.patch | 17 ++--
 ...1-Do-not-read-config-files-from-HOME.patch | 17 ++--
 ...-PATH-environment-variable-before-ru.patch | 15 ++--
 ...lling-execute-package-scriptlets-wit.patch | 11 +--
 ...not-insert-payloadflags-into-.rpm-me.patch | 17 ++--
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 17 ++--
 ...kgverify_level-to-digest-as-RCPM-4.2.patch | 34 ++++++++
 ...ools-elfdeps.cc-Remove-format-module.patch | 37 ++++++++
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 25 +++---
 ...avoid-using-GLOB_BRACE-if-undefined-.patch | 13 +--
 ...ge-logging-level-around-scriptlets-t.patch | 13 +--
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb}       | 13 +--
 15 files changed, 178 insertions(+), 202 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (95%)

-- 
2.49.0


