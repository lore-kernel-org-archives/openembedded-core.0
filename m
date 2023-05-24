Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6969CC77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 09:24:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4703.1684920242429581041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 02:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k+82k6Vj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4508ae51b1=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O78pnI014443
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 02:24:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=mvJq2CezdKhLJP8S9aZ+ddTwmMR22kpKt3tliyWOA+k=;
 b=k+82k6VjwqzzSAzB2Ue1MOj2Xn5SdliGLOsE6Atf5uhMxdS0k6RrLAPKABcp8fZ41JLk
 ljaHj+1Gt/xKd0v7sVr4CDWACE17fmIJ4MTBgI6C4Y2hy1+5psYY0+RyBXGvEbfjkrSC
 bFchE3U32jHsVBobN9C1XU9Q1DI1PVRdA2K648eqGzD8uEWXaUMNCpydNCBb1/MXCiiD
 CiiIkd7ls9NXDLcfFwSQBeBkWTh0+izfFmRQ/orSyV/cCWkd7hzumySa0FpYy3BtJ3pT
 QFLPkhQYBkRZHRvQZhEVeYBGB7Rjn4Ri/JtdRkITv0soqpLeLRlA5VZjfYzFUeVE8chb Yg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhbhgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 02:24:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 02:24:01 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 02:24:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pm-utils: fix multilib conflictions
Date: Wed, 24 May 2023 17:23:58 +0800
Message-ID: <20230524092358.3722526-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iggQ_4UYkmf7eJxdwhzpkrl7n0yyQZez
X-Proofpoint-ORIG-GUID: iggQ_4UYkmf7eJxdwhzpkrl7n0yyQZez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_05,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=689
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 09:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181668

From: Kai Kang <kai.kang@windriver.com>

It fails to instal pm-utils and lib32-pm-utils at same time:

Error: Transaction test error:
  file /usr/bin/pm-is-supported conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-hibernate conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-powersave conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-suspend conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64
  file /usr/sbin/pm-suspend-hybrid conflicts between attempted installs of lib32-pm-utils-1.4.1-r1.corei7_32 and pm-utils-1.4.1-r1.corei7_64

All of the conflicted files either is script which source a file in
${libdir}, or a link file to some file in ${libdir}. Compare the content
of installed files in ${libdir} exclude binaries, only the paths of
${libdir} diff. So re-define libdir with ${nonarch_libdir} to fix the
conflicts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index c6a4bc4932..dcc09f279e 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -19,9 +19,12 @@ PACKAGECONFIG[manpages] = "--enable-doc, --disable-doc, libxslt-native xmlto-nat
 
 RDEPENDS:${PN} = "grep bash"
 
+EXTRA_OECONF = "--libdir=${nonarch_libdir}"
+
 do_configure:prepend () {
 	( cd ${S}; autoreconf -f -i -s )
 }
 
-FILES:${PN} += "${libdir}/${BPN}/*"
+FILES:${PN} += "${nonarch_libdir}/${BPN}/*"
 FILES:${PN}-dbg += "${datadir}/doc/pm-utils/README.debugging"
+FILES:${PN}-dev += "${nonarch_libdir}/pkgconfig/pm-utils.pc"
-- 
2.34.1


