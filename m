Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C09C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 05:35:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.24992.1701840896086390131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 21:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lChx0I7k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=070488d77e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B65BZhv014568
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 05:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=sJQIOI39l5FbhkiBuuyx5siL7tYQ8bqfIv1YSzfzM5M=; b=
	lChx0I7k8k6YFrCW9fuE0G9ucamprGNLZ/xVly2f2IJfEM76bCtUbBIGtBMqt77x
	bIN5lqt02TVMl4ywQ4Bqkd/8lnK5THnzkShbW7jXECxpDY0ChO4XGPK+C/Vbx/lT
	WY36h2b7LGWWGLGSeA9KCnX4fJC1PRjsrplYgfSHh/hC69Bv5gy5cltitAXc1NJD
	kbMWQAzUx8Ybi7G88VUmCS6Sz91cvedXgSauf4HAHjoEopyXmvT/2VYSrniR7G81
	nqL9JRGFFYoX9+R1bFaY6FKahJKnL/tEL8FRkkxBqE2BsrLAeRWy2heYJNVELBFi
	r2KXK5ilcH4oB+RSoV5ZOg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53g74d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:34:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 21:34:57 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 21:34:56 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] libxcrypt.inc: use alternatives to resolve crypt.3 conflict
Date: Wed, 6 Dec 2023 13:34:52 +0800
Message-ID: <20231206053452.3565237-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179E2737483C0885.1352@lists.openembedded.org>
References: <179E2737483C0885.1352@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: E33c4Tl3XKShDAxmzRh0olgENbPBhEML
X-Proofpoint-GUID: E33c4Tl3XKShDAxmzRh0olgENbPBhEML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=862 mlxscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191868

From: Changqing Li <changqing.li@windriver.com>

To fix:

Error: Transaction test error:
  file /usr/share/man/man3/crypt.3 from install of
  libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
  man-pages-6.04-r0.x86_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index ba93d91aef..1a45df2618 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig update-alternatives
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
 SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
@@ -26,4 +26,9 @@ CPPFLAGS:append:class-nativesdk = " -Wno-error"
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
+ALTERNATIVE_PRIORITY = "200"
+ALTERNATIVE:${PN}-doc = "crypt.3 crypt_r.3"
+ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
+ALTERNATIVE_LINK_NAME[crypt_r.3] = "${mandir}/man3/crypt_r.3"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


