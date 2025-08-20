Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CEBCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.419.1755700647046546091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 07:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LpytK5Yy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=032775ee6d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KCfoWk3885578
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 14:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/wy2d/tsarfoDruP7Q4u
	G+YY4xxgtPwHL983i/VKOj0=; b=LpytK5YypQb57ymHmLlNzCw6qKPWenYoeS/T
	SnWXUjZa0nL5O+5IwDVABHLCiCPsYcrpC+0gc+nLTAtBnEC5QbpDZd3G31PKAIn8
	WXY6uLImGMnRr/48iMxKzRx3f06rDR8gOl8vBVr2JU4Hcna0vQyJJMQ7w24IyZv4
	BurWVrwhHqhPFi6ddoGcx5t1uCy57FntZjOvMLu74IV4HQ7kE3PPGcNExcr4XAJx
	wSGH7GF6Ae1k2rj27q3AzT1v8Zpc46BuV3rKqpn1bx90+jmuDpmtxaPDPlBDUZcJ
	oa/kfwe7ZlI3LRtrpZUzzQxUunliXGS3ErJ1yNndYpGBn2TWiQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjr483-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 14:37:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 20 Aug 2025 07:37:15 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 20 Aug 2025 07:37:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] nativesdk-openssl: support multlib libdir
Date: Wed, 20 Aug 2025 22:37:22 +0800
Message-ID: <20250820143722.4153909-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEyOSBTYWx0ZWRfX3DI8c8ZnStGN
 AawVqQZZ5+4Dg+NYG1TUBacHf8pM4XkHDGJMdQRxfUw0wOveLJ+RhuAarELmjWPB/kuk52MjP+9
 Hgdkc6z7VDfKO7VZlAt4TrDTj4M2F6424+FtTmjMUSBUyBKPDySxpmleT6WWoqEryg0bfPO3RvJ
 gDJqUzx9cFywPwADUoy2h3IAxHWuPzIGTdF8mLSpFZdrirs5fOJSsFKb45tqaWeZ+y22ZzQjsn1
 ijWJqBWEG5gR0k13Qpm4keUpwTNX+uwqpkS0CkNYAWwfNBu6XQD9bTQjQTUVfsJeXuiMZ9DTDm3
 P3HANGulobbLjxCgD9KkguUqtWXgMzOnoHUXVdJ5I8chMlPUIiF61X9l/ru9YkBrTmLAzWv0E4a
 3HBus+EvuhSd0UjDLCM3kjdB1yGPcA==
X-Proofpoint-ORIG-GUID: r8Hu7dtsOeeIpfYo6YR2QTggycS1hsPL
X-Proofpoint-GUID: r8Hu7dtsOeeIpfYo6YR2QTggycS1hsPL
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a5dda5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=fsxV291xFtgljZ6ddgkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 14:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222187

Make nativesdk-openssl to support multlib libdir (such as
sdk-relocation-dir/usr/lib64 or sdk-relocation-dir/usr/lib)
other than hard code `relocation-dir/usr/lib', add environment
variable OPENSSL_LIBDIR in environment-setup.d script for
OPENSSL_CONF, OPENSSL_MODULES and OPENSSL_ENGINES

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssl/files/environment.d-openssl.sh             | 10 +++++-----
 meta/recipes-connectivity/openssl/openssl_3.5.2.bb     |  4 +++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 71d378734c2..108937e2cd2 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,6 +1,6 @@
-export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
-export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
-export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
+export OPENSSL_CONF="$OPENSSL_LIBDIR/ssl-3/openssl.cnf"
+export OPENSSL_MODULES="$OPENSSL_LIBDIR/ossl-modules/"
+export OPENSSL_ENGINES="$OPENSSL_LIBDIR/engines-3"
 export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
@@ -9,7 +9,7 @@ if [ -z "$SSL_CERT_FILE" ]; then
 	if [ -n "$CAFILE" ];then
 		export SSL_CERT_FILE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
+		export SSL_CERT_FILE="$OPENSSL_LIBDIR/ssl-3/certs/ca-certificates.crt"
 	fi
 fi
 
@@ -17,7 +17,7 @@ if [ -z "$SSL_CERT_DIR" ]; then
 	if [ -n "$CAPATH" ];then
 		export SSL_CERT_DIR="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
+		export SSL_CERT_DIR="$OPENSSL_LIBDIR/ssl-3/certs"
 	fi
 fi
 
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
index 396e69d7e7f..b650767f4c3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.2.bb
@@ -201,7 +201,9 @@ do_install:append:class-native () {
 
 do_install:append:class-nativesdk () {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-	install -m 644 ${UNPACKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	echo "export OPENSSL_LIBDIR=\"${libdir}\"" > ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	cat ${UNPACKDIR}/environment.d-openssl.sh >> ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	chmod 0644 ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
 PTEST_BUILD_HOST_FILES += "configdata.pm"
-- 
2.34.1


