Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B29F1067031
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22562.1773324605629734616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZWZ9h524;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAkDEq133876;
	Thu, 12 Mar 2026 14:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=g2ooslPFy
	F+IsLgchqZGa79hovHaDDKuqdNwnVOqCmk=; b=ZWZ9h524Rqfe6MUuNY6vwawBR
	DRaNBE2Xycf59hMrDIsFqAs/hWNVeGYATn+nlSsiIBCOvhpGEd1UlFyVO1Qkn4fs
	orrBzl4KOpUSij2nUFn6+Bt58KBOUu7dx/y52XpXcgLqd7c7fzvXoWRA14tD4Hnn
	gB4NH84tWY/O/JcJixPtFUYlt9D8onbutOEKvTlGqxhjesjxwUZqIPPuw93tTB5O
	M6BlUFoDJdRSeWRtJo5/N0we3Kdo7aWYxujin4W+EHkTHK8+wzGMm48x3TZWDVNP
	XMI1vGsPKAPstD6de4jaT8yPS5jDeTJ2nlSp1vcmUjLyZi4N1SvEAnd8+dGEw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqr9qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 14:09:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 12 Mar 2026 07:09:39 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 12 Mar 2026 07:09:39 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>
Subject: [PATCH v8 0/9] rpm: 4.20.1 -> 6.0.1
Date: Thu, 12 Mar 2026 07:09:30 -0700
Message-ID: <cover.1773324129.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GBBkRHePuQxQdDktkItasX70uG943lbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfX7g89Wwm8jXZz
 t1sJhFdbeyNIC628WhqxnS1k8ojpx1aI8tQ6PNko41qEwitvMzjp/Yd4gJU5EZU1A5Dkfldn/mL
 iRT9BcKMjnoJuEmvl3cvVOckgCceL0ugw+9w6yf4EFyig34lQIIRsK/Iib6vu/fEukuv5mkTmIH
 sKwtiwp5bQ0b8Xzr86e3LStQTGE9hkSQZxcYhHb4xZTMFAQPMX08JcWwa9GSpvb5SsKdi6/8lq5
 X1IyaFIOfqpffa8Pz36meNY/GxsqcN95FlHPIelbuLpGaIWcnUP0dYV8oJV3CP0PWVqTP9LnHuG
 ECrj06lOhl4W1OSdu2kCjr5tbcGnptOaw00Q9IWj22nl9HFjQAWo046QUoOHisg+f5U3hR1MUL2
 D+T+Gdm/4CEhfdJMPhqp8UOuw6hnWEq0sO39tpWcCftqrrNXpIsDkw2BUiodmGdiKarn+H0zz6Q
 f7yT104DRMLfPvzQZZQ==
X-Proofpoint-GUID: GBBkRHePuQxQdDktkItasX70uG943lbV
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2c924 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=HOs6V_RkPBJJhvKOG78A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232960

From: Robert Yang <liezhi.yang@windriver.com>

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version

// Robert

The following changes since commit 7e75ec7a66c8c5f06c264784b0b6daaca37a9381:

  bitbake.conf: Set PACKAGECONFIG vardepvalue (2026-03-12 12:02:30 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

for you to fetch changes up to 9ee544efe319d8a002a88c0401da0a2e5ae007a9:

  libarchive: Make it work with rpm 6 (2026-03-12 07:00:10 -0700)

----------------------------------------------------------------

Peter Marko (1):
  libarchive: upgrade 3.8.5 -> 3.8.6

Robert Yang (8):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  glib/python3/acl: Add pkgconfig to RDEPENDS
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.1
  libarchive: Make it work with rpm 6

 meta/classes-global/package_rpm.bbclass       |   90 +-
 meta/lib/oe/package.py                        |    5 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/nativesdk-sdk-provides-dummy.bb      |    1 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    5 +
 .../recipes-devtools/python/python3_3.14.3.bb |    2 +
 ...olor-setting-for-mips64_n32-binaries.patch |   21 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   17 +-
 ...lib-rpm-as-the-installation-path-for.patch |   23 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   17 +-
 ...-PATH-environment-variable-before-ru.patch |   15 +-
 ...lling-execute-package-scriptlets-wit.patch |   11 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   17 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   17 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   34 +
 ...nfigdeps.sh-Use-pkg-config-from-PATH.patch |   42 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   37 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   25 +-
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   13 +-
 ...ge-logging-level-around-scriptlets-t.patch |   13 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb}       |   15 +-
 ...end_filter-Keep-iterating-even-if-na.patch |   48 +
 ...egister_bidder-Allow-ARCHIVE_STATE_H.patch |   45 +
 ...er-into-a-proper-format-supporting-b.patch | 1723 +++++++++++++++++
 ...ibarchive_3.8.5.bb => libarchive_3.8.6.bb} |    5 +-
 meta/recipes-support/attr/acl_2.3.2.bb        |    2 +
 30 files changed, 2074 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (94%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (90%)

-- 
2.49.0


