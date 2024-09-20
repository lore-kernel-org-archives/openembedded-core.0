Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FBFCF58F4
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 08:53:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13748.1726822405704937666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 01:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999393e395=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K3swlG022587
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 01:53:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mpb53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 01:53:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 01:53:15 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 01:53:15 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <david.reyna@windriver.com>
Subject: [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for CVE scanners
Date: Fri, 20 Sep 2024 01:53:13 -0700
Message-ID: <cover.1726821150.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: A4CDTdkgcVpaYfT24QccDdF3IKUakZmt
X-Authority-Analysis: v=2.4 cv=d6+nygjE c=1 sm=1 tr=0 ts=66ed3805 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=TCbaq5QuucA_afEiskQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: A4CDTdkgcVpaYfT24QccDdF3IKUakZmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-20_04,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=811 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2408220000
 definitions=main-2409200063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 08:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204726

From: Robert Yang <liezhi.yang@windriver.com>

The VENDOR_REVISION is for cve scanners to know the CVEs have been fixed in a
lower version, CVE scanners such as Trivy can know the CVEs have been fixed in
a higher version, but it can't know the CVE is fixed in a lower version without
a helper, we have the following ways to set the helper:
1) Use PR server
   This doesn't work since the server updates PR for any changes.

2) Update PR manually when add a CVE patch
   This is doesn't work either since:
   - This is very trivial and people may forget to update the PR
   - The PR may be updated for other reasons except CVE patches

So we need a specific part such as VENDOR_REVISION for cve scanners.
The VENDOR_REVISION is designed as part of PR:
  PR:append = ".vr51"
- ".vr51": The VENDOR_REVISION
- "vr": Vendor Revision, can be set to other values such as oe or poky
- "51": Convert from DISTRO_VERSION (Yocto 5.1), it can be customized with
        a function defined in GET_CURRENT_VENDOR_REVISION.
- The VENDOR_REVISION will only append to the recipes which have patches

There are two bbclasses to manage the VENDOR_REVISION automatically:
- gen-vendor-revision.bbclass: This is used for generating VENDOR_REVISION
  automatically, and save all the recipes' VENDOR_REVISION in
  vendor-revision.conf, it is like:
  VENDOR_REVISION[meta_recipes-support_libssh2_libssh2_1.11.0.bb] ??= '${VENDOR_REVISION_PREFIX}51 \
   CVE-2023-48795:CVE-2023-48795.patch:b6c68cd1f0631180914ff112ac0c29c4 \
   notcve:0001-disable-DSA-by-default.patch:61b6368d4a969d187805393d8b8fee85'

  And in the second release such as Yocto 5.1.1, the bbclass will update the
  vr51 to vr511 when both of the following 2 conditions are met:
  - The DISTRO VERSION is updated, for example, from 5.1 to 5.1.1
  - The recipe's patches are changed (Patches added, removed or updated),
    otherwise, it will still be "51" when Yocto updated to 5.1.1, this can avoid
    unnecessary PR bump.

- enable-vendor-revision.bbclass: Append VENDOR_REVISION to PR
  After the VR is appended, the rpm package is like:
  openssl-3.3.1-r0.vr51.core2_64.rpm

  There is no change if the recipe doesn't have patches, for example:
  base-files-3.0.14-r0.qemux86_64.rpm

Check the comments in the header of gen-vendor-revision.bbclass for more details.

// Robert

The following changes since commit 161c5b311f1aeb8f254dca96331b31d5b67fc92d:

  build-appliance-image: Update to master head revision (2024-09-17 12:31:45 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/vr
  https://github.com/robertlinux/yocto/tree/rbt/vr

Robert Yang (2):
  enable-vendor-revision.bbclass: Add it to append VENDOR_REVISION to PR
  gen-vendor-revision.bbclass: Add it to update VENDOR_REVISION
    automatically

 .../enable-vendor-revision.bbclass            | 125 +++++++++
 .../gen-vendor-revision.bbclass               | 243 ++++++++++++++++++
 2 files changed, 368 insertions(+)
 create mode 100644 meta/classes-global/enable-vendor-revision.bbclass
 create mode 100644 meta/classes-global/gen-vendor-revision.bbclass

-- 
2.25.1


