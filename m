Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFDAC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 23:58:39 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.2.1639699119020834577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=3IyyDAfY;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=798487a089=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BGFDSmd023555
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 17:58:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=PPS11062020;
 bh=d2XSz3E/9gRfG0bbbBFoQQjOqySL42t4r1qL4PEZj70=;
 b=3IyyDAfY6kay4lvo++g1JrU6V0lqVxl58czhK18Tp3vAXYyHHp7aWLuXpSd4gOaYjq3I
 Ki+2Z+c7apPChL+JK4E//PAi57Rmkc6g+BvH7we10LpRBrXfnoYc+ALrtDiB5GlGBKkK
 Uj1YLpqDTmPN1d2fuvfTjyHmtmD2y9fNmGohSMgsRB3hvH67La1a417pCUiIXbZsd8cC
 WqRwo0JLuo2hdCczOgC8FNf/Hy0eiQu8a3bQQbPcrX9BjLxDFEMtpnbvjt6ucvoC5TkV
 /hI5UuOlfVxZB+9VZ+ulILDTqqJxsFL2XNW/YVSYUrvRW9HiWR7zE/Zs5mTv85dRIf39 qg==
Received: from ni.com ([130.164.80.23])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3cyjrh3ddg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 17:58:38 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com
 (us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 1BGNwbXa012890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 17:58:37 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 16 Dec 2021 17:58:37 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
 us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 16 Dec 2021 17:58:37 -0600
Received: from cvadrevu-linux.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 id 15.0.1497.26 via Frontend Transport; Thu, 16 Dec 2021 17:58:37 -0600
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [PATCH v2] python3-pyelftools: Depend on debugger, pprint
Date: Thu, 16 Dec 2021 17:58:25 -0600
Message-ID: <20211216235825.32536-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PmtH2IFdL27BCHdhiY8XnX1Q_5ica2PW
X-Proofpoint-GUID: PmtH2IFdL27BCHdhiY8XnX1Q_5ica2PW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_09,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 23:58:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159811

python3-pyelftools uses python3-debugger, python3-pprint.
So add dependencies on these packages.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
index 0cfd99504b..e2d0e18277 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
@@ -11,3 +11,5 @@ PYPI_PACKAGE = "pyelftools"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS:${PN} += "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"
-- 
2.17.1


