Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CB2EDF025
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 03:47:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37473.1770868059383326668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 19:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VXxvknHy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503d7ee58=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C2NRlR1894051
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 03:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=y8eel8BDdz8UAuJ5jZd9
	LKDUkkgs0/L+r1T6sWDZ9Mw=; b=VXxvknHypJNisGLU7KK7E6kpYl8s1VdH49O9
	MX0g8mQ7ZjvJf1LKv3knwhoqqUSwW1nkgXsPS4cE7WkyUmDj/lpFoR3c0wytZUnZ
	Hq/mqmc+Ci4dH7/GgW1PTAQfllHhlDm1fDlljK6pOg+w2SdZcqyT3jPP9Q51m+BD
	OzKjng23Cc1P2sZq5sCRPi5u3vJnHCsEW0ebrD4+BTDEBTYe9hyH/Pk2YUli5Ngt
	7JU9WutaTvBTk1cXqQAdB3sS+gPG7N7OLkGmUcYtzfD71tQHxX5fyx3+VqV9A1Iy
	L2c+nn6A8NS1a39RGFx2S+gPEagCmW9RQuQ38tkY/GwdvbvV3w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwnn0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 03:47:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 11 Feb 2026 19:47:36 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 11 Feb 2026 19:47:36 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] iso-codes: upgrade from 4.19.0 to 4.20.1
Date: Thu, 12 Feb 2026 03:47:36 +0000
Message-ID: <20260212034736.2094153-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698d4d5a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8
 a=3KP4BJ4H6UstPxQLEQgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wGytYoImNb0J32fAkm7GxGpNrh1MKp4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAyMyBTYWx0ZWRfX56jMC9F+hp98
 vTryhC8v09VxHoay8yyL6zTQZCHS1YR2J06n/W9vIiofoZQ/sQ51ZqdYfVdDZFseU84GmdgTpCR
 f38XYn6ZXgzwQ4E23L7deCGi3Jp/D7o9y59vna17W/c3x68w+RJrhsSsoTGr14utw/fJEbu6JMm
 TLHzft8hWTSi6wYNqwyS2wc3bWNawXngl2OGbJDq09uS51WMlOB89m334M8E5j4OUPFURaKL/Ks
 yGwNi0MSaOGHqxemq0SfSwLyMWzC+sSnNiAfYR1J/DJrDQtK/FgQTlkV+LolWn6KH9ku57R6VRB
 d6Bv8p8OGVG0MW72SnE38jrIOz1z6tMUdr5Nr/czRxRLAgfHKDZzCPpBrnV9cj9BK/aTW03dwI/
 mf1OlrV1SJGLsYfQmqqBbnR6aSAmZ1+ySaqmQzDlJYqaXl8D5D+3dGa7meRXI2b8+ot78p4e27V
 vgbD8nDl7FSv3oeD9mw==
X-Proofpoint-ORIG-GUID: wGytYoImNb0J32fAkm7GxGpNrh1MKp4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 03:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231004

From: Chen Qi <Qi.Chen@windriver.com>

Changes:
https://salsa.debian.org/iso-codes-team/iso-codes/-/blob/main/CHANGELOG.md

License-Update: update license to LGPL-2.1-or-later.

The build system is switched from autotools to meson. Note that
meson is now the only supported build system for iso-codes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{iso-codes_4.19.0.bb => iso-codes_4.20.1.bb}         | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.19.0.bb => iso-codes_4.20.1.bb} (72%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb
similarity index 72%
rename from meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.20.1.bb
index 413c7991d6..1423d8136b 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb
@@ -5,17 +5,18 @@ than repeated in many programs throughout the system."
 HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
 BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=310c7c93cf5181c6b0cc8229a1f3c6f6 \
+                    file://REUSE.toml;md5=222088771af8590daba65c39e4747321"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "0f3a862394265a31d8465fc5e627d6429bbd8394"
+SRCREV = "74623235ae99f6e835e1e465017ce4c544ae6b53"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
 DEPENDS = "gettext-native"
 
-inherit allarch autotools
+inherit allarch meson
 
 FILES:${PN} += "${datadir}/xml/"
 
-- 
2.43.0


