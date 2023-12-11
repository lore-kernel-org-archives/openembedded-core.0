Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4405CC46CA3
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 15:13:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10674.1702307598355764732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 07:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=faSOLNIP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07098ab644=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBBYr4T001912
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:13:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=vt+ig
	LiEr/+qrH4qro+OawkN54NjvXF3OJ5ZVF8+XDg=; b=faSOLNIP6g7r/9f1D9fq7
	Iw+pwg2s2T/3vklcXH60h6jY2CHTSNfRI32G0jYMu/g7GLiNE+ye7OgosB0q6azY
	W4vKtvL8gxk/zCD858MlKhZ3pErDnulfygRMQiqSRZ1gW5xflEaWSl29MLJTQEZc
	1lfOg4n8kDiDLnJXBwDXCdINR6khHjm6l0DcpPQf9NSpQm4t6rCN2ib2o/FRqZj/
	LsjrReTQEndfr8yO6W1vfT180njBzVz81ZRuLl+u+4Z+iA/i54pZelbylar8j3uz
	/eTHyU3lLpYLHR6C6QUne81odYJrWibwBqUlKIfMMVxIy7MJtEZznZVJntDhpdDf
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd49m02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:13:17 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 07:13:21 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 07:13:21 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] archiver.bbclass: Improve work-shared checking
Date: Mon, 11 Dec 2023 07:13:16 -0800
Message-ID: <cover.1702307359.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ubywqOwzI_uAZyL4tErxnijE73rGm7kr
X-Proofpoint-ORIG-GUID: ubywqOwzI_uAZyL4tErxnijE73rGm7kr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=585 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192174

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 564339afb73fc52a66c1a08437587cad1c4d46e7:

  useradd: Fix useradd do_populate_sysroot dependency bug (2023-12-10 09:23:58 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/archiver
  https://github.com/robertlinux/yocto/tree/rbt/archiver

Robert Yang (1):
  archiver.bbclass: Improve work-shared checking

 meta/classes/archiver.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.42.0


