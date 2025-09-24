Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9047CAC59A
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:43:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7136.1758699818373252483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V3ua9QDm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362c8159d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O6pqAM485614
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 07:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uyfsc//kEVcDO3JaMLg3
	kQb97fhMOeDC7LDPODVKBYQ=; b=V3ua9QDmUa7IRrntC8Ic2tE32nKOUh5Z9zJN
	+OMTqbDJKVbSOcqyMPS7mXyRGEF/XmNLctEI27aClIcWgA27rKrUzd/aoTQBJ/I2
	p7upZkT9ttuiA0xl2rm2VD4fxYYAHlxNfpm3w7c6wd9npPezcqmqgQHUxTR2HSva
	gTLW36cXO5F2msp7m7W4tUTTE10zM+kNi3Ye/nj4d1aHV65JYCUclUokkDARKRs4
	TN+9gQ/7t68DKpAgjFrPiOe1fkUh3DXtf7mvAA3lEVxXDRxMsyxpcPSp6tZwWyTj
	5C9q/B/AEy6SN0dCqSDZo1dfb/U4v34tzRORWiVcCPv4CL9uRw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1mgbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 07:43:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 24 Sep 2025 00:43:37 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 24 Sep 2025 00:43:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] apt: fix reproducibility issue occasionally
Date: Wed, 24 Sep 2025 00:43:43 -0700
Message-ID: <20250924074343.1611960-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xnalw4h8sdOkEgrhbQ7M9jKxKuZo7qfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA2NCBTYWx0ZWRfXyx3PQKVfdxzf
 r7x1iV92oNgaktzUHGUeCbqZVxfslgcjojtqRTdKZOCCh7W+3HEgyjpLUOjwiWmmg61mK/ErCJQ
 WSJK7bCaT1FGnG9xdarJxJ2I4VOcykjIzl3KkCBn7Au7ax6u3AXytGxS5wBd9q7bv94SwLJkGUS
 G4uDpfsendEz1O92+u4EI5TKWN/2u50tXH6av8hoeiu6kQbEM7ACicmSoyq08aTAdboiZUgagl7
 EpPMoVuxP+lxqY2TXtwTX5e+zh7/kTDhrISQfsgUaF4yYwVgoqRa5Fq66agtU94wHlWokNvsux+
 L0uRME7cTSPexyJ6o5m4yYiLul9INPFdHVHsbqwfNPT49h3Ku7mL76NpV7AQyA=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d3a129 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=m_jJ5hz90OCu74i8ZqMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xnalw4h8sdOkEgrhbQ7M9jKxKuZo7qfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 07:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223949

In oe-selftest of reproducibility, recipe apt has reproducibility issue
occasionally
...
2025-09-20 17:09:18,986 - oe-selftest - INFO - ======================================================================
2025-09-20 17:09:18,986 - oe-selftest - INFO - FAIL: test_reproducible_builds (reproducible.ReproducibleTests)
2025-09-20 17:09:18,986 - oe-selftest - INFO - ----------------------------------------------------------------------
2025-09-20 17:09:18,986 - oe-selftest - INFO - Traceback (most recent call last):
  File "/buildarea5/hjia/contrib/openembedded-core-contrib/meta/lib/oeqa/selftest/cases/reproducible.py", line 406, in test_reproducible_builds
    self.fail('\n'.join(fails))
AssertionError: The following deb packages are different and not in exclusion list:
build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/apt-dbg_3.0.3-r0_amd64.deb
build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/apt_3.0.3-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/apt-dbg_3.0.3-r0_x86-64-v3.ipk
build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/apt_3.0.3-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/apt-3.0.3-r0.x86_64_v3.rpm
build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/apt-dbg-3.0.3-r0.x86_64_v3.rpm
...

Due to upstream apt commit [1], it calls `id -gn root' in cmake
to set ROOT_GROUP if not define. The output of `id -gn root' may
differ in the compared builds which caused reproducibility issue
...
|build-st/reproducibleB-extended/tmp/work/x86-64-v3-oe-linux/apt/
3.0.3/temp/log.do_configure:124:-- Found root group: wheel
...
|build-st/reproducibleA/tmp/work/x86-64-v3-oe-linux/apt/3.0.3/
temp/log.do_configure:124:-- Found root group: root
...

Explicitly set ROOT_GROUP = "root" for cmake other than call `id -gn root'
to support reproducibility

[1] https://salsa.debian.org/apt-team/apt/-/commit/6f1f3c9afdb6ade6a7be110b90c8fc9e603254cf

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/apt/apt_3.0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
index 75d85dbbce..7f0a38ab29 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -51,6 +51,7 @@ EXTRA_OECMAKE:append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True \
     -DWITH_TESTS=False \
     -DCOMMON_ARCH=${DPKG_ARCH} \
+    -DROOT_GROUP="root" \
 "
 
 PACKAGECONFIG ??= ""
-- 
2.49.0


