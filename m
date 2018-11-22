Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id A42796C570
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 12:13:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id wAMC43X6001951
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 13:13:53 +0100
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx08-00178001.pphosted.com with ESMTP id 2nw2st7h6y-1
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 13:13:51 +0100
Received: from zeta.dmz-ap.st.com (ns6.st.com [138.198.234.13])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 713AF6F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 12:13:14 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by zeta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A6987B2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 12:13:12 +0000 (GMT)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 22 Nov 2018 13:13:11 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 22 Nov 2018 13:13:11 +0100
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][master][thud][PATCH] openssl: correct bad path on
	package preprocess
Thread-Index: AQHUgly86XSnb2o7LE2mSGcXoyEIjg==
Date: Thu, 22 Nov 2018 12:13:11 +0000
Message-ID: <1542888789-31720-1-git-send-email-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-11-22_07:, , signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [master][thud][PATCH] openssl: correct bad path on package preprocess
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 12:13:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In case of SDK generation, /usr/bin/ path are not correct
and must be replaced by ${bindir}.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb b/meta/r=
ecipes-connectivity/openssl/openssl10_1.0.2p.bb
index 4325940..42f9bcf 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
@@ -354,8 +354,8 @@ openssl_package_preprocess () {
         for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; =
do
                 rm $file
         done
-        rm ${PKGD}/usr/bin/openssl
-        rm ${PKGD}/usr/bin/c_rehash
-        rmdir ${PKGD}/usr/bin
+        rm ${PKGD}${bindir}/openssl
+        rm ${PKGD}${bindir}/c_rehash
+        rmdir ${PKGD}${bindir}
=20
 }
--=20
2.7.4

