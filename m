Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F77CA0EE6
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 04:19:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1592.1755749951890328906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 21:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DwXKnTX7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03289c17de=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L3bfIZ1595088
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 21:19:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=cZVARcc3fkeQawvxG9x18mlEn7pXwFX7z7gL2+la52Q=; b=DwXKnTX7Gf0y
	Bg9c0feAFbRT8ucdcrAow103a6l6xyKUhJ0nkicAYG+jGfy8nqiEToIOt+Pk76Zx
	GkxtgeolrpPeoYfmLtndLybv5k2xfjH9IkSzFyFJubtFV+HP/WSLEHhLaEdkWn0z
	9ST2YAWE1Xofis+RNEI4E5TZXBPkc1oHUW3WjKqwQ4kW5SY9Bg7d6+kDY5bpo1Jh
	G/w7UyAMrlwzwy7sE33SOQBGEbu5rQIH763upobHVmJtUHOcp5jrx9h2/pZXvzuu
	3iHGSdWPcd8dcPAkgO+Ouyr3kCmjoBCiX6kKAjcJFWBQyG+tmQawkuX8NznRe5Gu
	RzTPmeWi1A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq9pcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 21:19:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 20 Aug 2025 21:18:51 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 20 Aug 2025 21:18:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] nativesdk-openssl: support multlib libdir
Date: Thu, 21 Aug 2025 12:19:09 +0800
Message-ID: <20250821041909.1693041-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820143722.4153909-1-hongxu.jia@windriver.com>
References: <20250820143722.4153909-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDAzMSBTYWx0ZWRfX7c4+4ldqar9F
 DvA4Xqdx/X+G7Ymlcobk0Qi4Bs7nFbQKbrvAYkmQFftSL6w66YinLbUtYBz6FkfZIN6Xo7+4LJl
 4QIqhaOUSC/XpyO4D4jj113sFqBRiPUX5Ertq6/nGl8YEphzqx4o4lYjZRnPhkSVx9c0ctudcYv
 /O0N5r/qJLevFSmhB0vTC+Od1aS725GZZTranggl7mUvo2vpuvwumwRuVjYfzzbzSHfzdfIqjmN
 CImZk6+Tw5/BRklwZDscY4NYdp4Jh87C6PjsScMntb2YJW0g/iYvgRJ2eDk5gu4Aii2ZSAa0253
 QUP2dyX47SikFDGJVMIcMoRKMUGxts2vP1nYu64MKiAyObwBCBdZpUUcZ+sqVq94gOhNAjC5nqe
 SNy9jruqgk3m2lR3er+kyZygu80AKA==
X-Proofpoint-GUID: Y1XeSboKVmqLC-y9Vos-zJeEeZEY2JZy
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a69e3f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=d1J6T8FsrKNdEwjZhzcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Y1XeSboKVmqLC-y9Vos-zJeEeZEY2JZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 04:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222203

Make nativesdk-openssl to support multlib libdir (such as
sdk-relocation-dir/usr/lib64 or sdk-relocation-dir/usr/lib)
other than hard code `relocation-dir/usr/lib', add environment
variable OPENSSL_LIBDIR in environment-setup.d script for
OPENSSL_CONF, OPENSSL_MODULES and OPENSSL_ENGINES

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssl/files/environment.d-openssl.sh            | 11 ++++++-----
 meta/recipes-connectivity/openssl/openssl_3.5.2.bb    |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 71d378734c2..945151e1e2c 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,6 +1,7 @@
-export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
-export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
-export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
+export OPENSSL_LIBDIR="@OPENSSL_LIBDIR@"
+export OPENSSL_CONF="$OPENSSL_LIBDIR/ssl-3/openssl.cnf"
+export OPENSSL_MODULES="$OPENSSL_LIBDIR/ossl-modules/"
+export OPENSSL_ENGINES="$OPENSSL_LIBDIR/engines-3"
 export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
@@ -9,7 +10,7 @@ if [ -z "$SSL_CERT_FILE" ]; then
 	if [ -n "$CAFILE" ];then
 		export SSL_CERT_FILE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
+		export SSL_CERT_FILE="$OPENSSL_LIBDIR/ssl-3/certs/ca-certificates.crt"
 	fi
 fi
 
@@ -17,7 +18,7 @@ if [ -z "$SSL_CERT_DIR" ]; then
 	if [ -n "$CAPATH" ];then
 		export SSL_CERT_DIR="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
+		export SSL_CERT_DIR="$OPENSSL_LIBDIR/ssl-3/certs"
 	fi
 fi
 
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
index 396e69d7e7f..23cc9b6f450 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
@@ -202,6 +202,7 @@ do_install:append:class-native () {
 do_install:append:class-nativesdk () {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	install -m 644 ${UNPACKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	sed -i 's#@OPENSSL_LIBDIR@#${libdir}#g' ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
 PTEST_BUILD_HOST_FILES += "configdata.pm"
-- 
2.34.1


