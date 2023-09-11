Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB04AEE801F
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 08:37:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.54143.1694421467115301742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 01:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CDJzbMUn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761878e5db=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38B5ZI8d032702
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 01:37:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=H3r9I6Jy1/5rLnW6HoKEHa88w1Cv1z4xT0v/Mw74hzg=; b=
	CDJzbMUnIXikdCMAp9CQG4IB9QSGE13nNFEcFOhBoUNpGiIhjaSfQfCNBeNokNTK
	vcAilD7NOOaWpah/ENOm+xoN9JQ0Tdzu45enotZ/6TDm2MDhHRsukW97lGIOgUBq
	B0GKL1LlJiuT9TeuOWsM4BIcetbYZgjIytB9ogwy7xPSO95uuVm0ijrJ6uhaHayx
	LxdELE2yAwkR9zJ3Ca5vTvVrQ8rUNLuic8r+LWlb4A2Sqrf85aotW8xEgFNkyXr1
	M5ktxWs/fZClqvW+BX4EtEig6yaimfGZ2zLDwZQRRHCHP09q3YsfPeOJGYJ0BMs3
	bwPI4qcrwxNRf/ZBRuIFAw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0r7fs62a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 01:37:46 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 11 Sep 2023 01:37:45 -0700
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 11 Sep 2023 01:37:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] libxcrypt-compat: Remove libcrypt.so to fix conflict with libcrypt
Date: Mon, 11 Sep 2023 01:37:45 -0700
Message-ID: <206e50b37c850b2345f304cb95f7b736744d7024.1694421409.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1694421409.git.liezhi.yang@windriver.com>
References: <cover.1694421409.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: s5h9Cv9_YDSTZK6tZm6rQ4HtpRBF0ApU
X-Proofpoint-ORIG-GUID: s5h9Cv9_YDSTZK6tZm6rQ4HtpRBF0ApU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=584 suspectscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309110078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 08:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187485

Fixed:
IMAGE_INSTALL:append = " libxcrypt-compat"

$ bitbake <image> -cpopulate_sdk
file /usr/lib/libcrypt.so from install of libxcrypt-compat-dev-4.4.33-r0.0.aarch64 conflicts with file from package libcrypt-dev-4.4.33-r0.2.aarch64

Remove libcrypt.so like other files to fix the error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
index ec9f9f4fa3..d5546ce9ba 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
@@ -13,6 +13,6 @@ API = "--enable-obsolete-api"
 do_install:append () {
 	rm -rf ${D}${includedir}
 	rm -rf ${D}${libdir}/pkgconfig
+	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
-
-- 
2.39.0


