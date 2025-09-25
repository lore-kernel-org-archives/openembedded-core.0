Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43E7CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 08:45:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6587.1758789903458642566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 01:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l/SEfn3D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=136376ca7b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P7o4T23742146
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jIP3hSvDQkBuoyEisAQx
	eoum1meTyr5FGfYs4OrBm8A=; b=l/SEfn3D9im3xGS1a33vlacN6KOODjSWukqd
	fITHxZ3TbiCQnQzEz9hzGW+Tyn5jWDsfzIQpyVeR8qqpTrcRcP7cSgAuoY+wDp5Q
	H6Ii1JyR1urJd5/W/7a+MdjzvpowuL48xL51Y9fCWlXE2+sBk0740ncaCe4J0yPx
	umtEpFmbfX4e7+FgnBAEwciYLrgB5ZQXuCeFgYzR5ZzMGGlzAt/hm8Q7tFSUbG+7
	n641zKhenP46F6ObeDRqvE4V+zV3PB0oF71GiX1fhquapzMuN4cOOpe4v9WFcylr
	rCFXlU2jCZ3M8TThdIjcoLxhhIHOZpv0Q6DCv/4I1bWvnaCmuQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1p3d5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:45:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 25 Sep 2025 01:44:21 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 25 Sep 2025 01:44:21 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] baremetal-helloworld: set UPSTREAM_CHECK_COMMITS
Date: Thu, 25 Sep 2025 16:44:20 +0800
Message-ID: <20250925084420.722043-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Q_9tuzT9p3QOuolhNicpiP0teNvFTVMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA4MiBTYWx0ZWRfX7zAx9Ap2v21v
 6gHJ6sKy18AWLZELW+H5nnxzKMhcCA20bj2B+mNZDR4Ip9rQQaQLIDNyuHbXKGrPJR8Z7aDW7lv
 lTRwdEu2m2dxbdEwUtjdPBV0ZeJ3j/uelvOUlH9AAWzoO9VDdArQnc3JMhQSrK2p5tHuNW59tt0
 qcSlYD/s8p/uTea8egYWXZYKigZT1VykwqjkgOR5LcWOluUwxJE0Owuqwte0VVzvvkSwcq0vWqd
 NuwFdNKowTjrSn2wmqkNx65KEPanyj5lyLelacaQIwzphdcxJrovEOrL1jY3/ntfTeJfrWZp5T2
 /Q6fvfR6FDT38PoR0c+7/Kd+yAbAe3Vjp9nhm9oZxDwEurOMCqiN5U1x1xdEUk=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d5010e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8 a=NEAV23lmAAAA:8
 a=-RnI8MH2oE29oGWyvqEA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-ORIG-GUID: Q_9tuzT9p3QOuolhNicpiP0teNvFTVMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224007

From: Changqing Li <changqing.li@windriver.com>

set UPSTREAM_CHECK_COMMITS to make new commit is reported

Test result(change SRCREV to an old one):
$devtool check-upgrade-status baremetal-helloworld
baremetal-helloworld      0.1             new commits     Alejandro Hernandez <alejandro@enedino.org> db2bf750eaef7fc0832e13ada8291343bbcc3afe

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 80fdf26c05..4307716069 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -8,7 +8,7 @@ SRCREV = "db2bf750eaef7fc0832e13ada8291343bbcc3afe"
 PV = "0.1+git"
 
 SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 # The following variables should be set to accomodate each application
 BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
-- 
2.34.1


