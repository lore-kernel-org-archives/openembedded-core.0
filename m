Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80A1C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 01:42:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.89938.1701740518120181524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 17:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oLtNmBrl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0703390de8=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B50L7k3031188
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 17:41:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=DvTLX
	RlCmd2MgTlDW53uWkiM87nq3OgM2vSBAy5fWbE=; b=oLtNmBrljAE3laMmYHNzi
	T0Kd8mZbbUstBF+Gc0WiR4iE3HsLmdUMeze4mC8RAaSYuMRgd3ERfrHBz/br3F2W
	f9hco688tr1NOaiCfwuisnZWA+LBx51tgvf3U1gbB9yksa5rxK+evNhc2rYpO+Dg
	0bPNDlUYmHmpL7eCQb6A8wIGenbEQw3N3ofm8xqzuNZSSojMuWyVjidqu0m1Bie5
	52EEm9bH+2yk/aDOXq/eaLKex+4WsNTmjw+ppbqKkzzc3QDQa+XjS4XtZAOsqYt1
	fvYFZfDwuwt1qhFID/HtRpAXKPpIn9caKQh4SbQlw24v7R6Sq7ic/5KALlnhl0ut
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur4ym201a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 17:41:57 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:42:00 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 17:41:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libxcrypt.inc: use alternatives to resolve crypt.3 conflict
Date: Tue, 5 Dec 2023 09:41:55 +0800
Message-ID: <20231205014155.3991250-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fJbDs9o8HmqpMko_W0G5DqInJSZy-UYm
X-Proofpoint-ORIG-GUID: fJbDs9o8HmqpMko_W0G5DqInJSZy-UYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=846
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 01:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191771

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
index ba93d91aef..fe90ef4762 100644
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
 
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE:${PN}-doc = "crypt.3 crypt_r.3"
+ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
+ALTERNATIVE_LINK_NAME[crypt_r.2] = "${mandir}/man3/crypt_r.3"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


