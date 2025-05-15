Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D033BC3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 16:56:55 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web11.17841.1747328211019036527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=KzHFJqPJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=4230c9aaef=rajendra.desai@emerson.com)
Received: from pps.filterd (m0144092.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FFY3rI001662
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=email; bh=LEEI1ktMgTWNaFFP98/PN/FZ6w
	DS77mFZlT6IGUAp08=; b=KzHFJqPJ0V73JN1wvyHxqYN9AYJlk63RiZ7AKX4GtT
	zCuM2gbuCFbc2L312cWenmzSzBybQugkPMJYB3vIt17ThxpTx5EIpTV53SeP1m9R
	acekVMKaR3kA1Lb/pmgS4udpfpnrT6ncdlXA3zALsh4t94ABCeDWxFficScLptWs
	v7IkVCu6AeR83w81JrPQ/wPTPKfpgMw9HJ9EJu08+Ir7mKo/7FgdscgRe7OkuxUb
	TbMFDKIM7ry0kYY9uMv8ZfOiCES4wO2yyO//sT4CYCEXvAlvfaxLh09/CMyujeKV
	tOE1lO/HvOWkTU79lkQWpRBtaZpbqDOxIbzKp2Ssctug==
Received: from us-aus-excas-p1.ni.corp.natinst.com ([130.164.94.73])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46nk19sk24-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:56:49 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 15 May 2025 11:56:20 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 15 May 2025 11:56:18
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH 0/5] perl-ptest: fix 5 of the ExtUtils ptests
Date: Thu, 15 May 2025 22:20:04 +0530
Message-ID: <20250515165010.242349-1-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UK/dHDfy c=1 sm=1 tr=0 ts=68261cd1 cx=c_pps a=cVKeW2pxJVqlUTLH3Z+MUA==:117 a=cVKeW2pxJVqlUTLH3Z+MUA==:17 a=dt9VzEwgFbYA:10 a=szYsWX-kwx3WJiQRI6kA:9
X-Proofpoint-GUID: 09KI_p6qzq9z-A-h6tYNDmItI7WcLXTU
X-Proofpoint-ORIG-GUID: 09KI_p6qzq9z-A-h6tYNDmItI7WcLXTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2OSBTYWx0ZWRfXykoTRWGgvNMg a6up5j/pKEFVWofW9MAEj9IvC90+jDyYDP9N1DH5GW39jrZGwYmPGNRipZuRLzkLDvAzrg0rFtz PkynDl+j6dgoyOLKpmPEZIKfBo4XiTKbicg4yaWKwytGVLD0I52gxQAF6KAs6pbzX51qHDNENbb
 RbkAtz71YH8oYx3DAimGoCvrYJTw82q7vOesHXTZ2AQdbBm5FniteOQJTH2mcwK7pgitpu9d7HG Fae9ohcrL355DOkdE1A3D99JevUOyI9JafLI08x+jfmaSFVi61SGonl1jgTIDZUhNvPJZYqjZQO zU4hk061asIu3rOIUw/XlOZAqBniLPnbloP0d7aDSvUND7zlx8UrLJpI4eqixbEAMVIsIstY+k/
 DEeRoech7TYr/yHhqNCF+N/CLYNlYo2C4eSe4Nwzyot6N4C9GuYx2RKQ8QZGqOBnUiIqHUv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=613 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216693

This patch series fixes 5 of the perl ExtUtils ptests which
were skipping or giving out the warning due to missing packages.
The fix consists of 5 patches which combinely adds missing
packages and resolves missing file error. More details about the
changes have been explained in each of the patches.

Rajendra Desai (5):
  perl-ptest: include gcc as a recommended package
  perl-ptest: include libxcrypt-dev as recommended
  perl-ptest: include g++ as a recommended package
  perl-ptest: include make as a recommended package
  perl-ptest: copy xconfig data from perl source directory

 meta/recipes-devtools/perl/perl-ptest.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.34.1


