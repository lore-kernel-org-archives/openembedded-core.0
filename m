Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D3BC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 09:02:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.9020.1667552572279792758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 02:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SVTIqFY3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8307ea74cb=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A48SI2D025300
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Nov 2022 09:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=hO+QXxfC5yvzWm9LkgmXQZMKFYPDXUrBDkVpTc+BPv4=;
 b=SVTIqFY3eqCxjE95xAcl9xJwZ8TBl8hPQzaQGAtzk1ykVwX3KNCq7uFEhqQUEyzqsu8/
 lrkfxEhldIvDWmWRgaV/frkKomDg2zJlsit2+zuAgo2nEJ2kIna5h+1QFPECODuvvXzU
 TPLrdq8h6bXJp3jIu95ajhxNIhqjO3dpSwjHRyvps9pneWiMB5zBF76XsiwAf30KX1Fc
 bzqPwK4HUEmgTyQ1j2U67HCkNTQ5qQTmTSFNcfDpnht7IdGFP9hjWrtYHYqzljlozQ6E
 vmMpdTZppf2CJ79SA7JcwCIkhzxiu/mkiIYzd5hlusgEH2pLJgbDYl5s3kox6sci6+wq wA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kmpemrbg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 09:02:51 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 4 Nov 2022 02:02:50 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 4 Nov 2022 02:02:49 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libuv: fixup SRC_URI
Date: Fri, 4 Nov 2022 17:02:45 +0800
Message-ID: <20221104090245.23113-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: efhJgWeVP_wbsQ0lBjvT4UOBfpdkHmSv
X-Proofpoint-GUID: efhJgWeVP_wbsQ0lBjvT4UOBfpdkHmSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=856 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 09:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172703

From: Kai Kang <kai.kang@windriver.com>

Add the trailing '.git' to git repo uri in SRC_URI then it could share
source code repo on premirror with grpc which uses libuv as a git
submodule with fixed revision.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/libuv/libuv_1.44.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
index 4c1b8eed56..27e79276b5 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
 
 SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


