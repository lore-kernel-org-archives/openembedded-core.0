Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.81])
 by mx.groups.io with SMTP id smtpd.web11.5809.1586152830057754008
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 23:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=AuckdlQs;
 spf=pass (domain: xevo.com, ip: 40.107.237.81, mailfrom: jbroadus@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZZ+BUA+zDv2UQNJ7GiOyr6s9omr9x0v+YUwqpqxPr1G9fZa7yOnwmz6ZSDClDvAUi2JbJTXZTWaLPaE5MoO/5bPAaB3oFAxvi1MaFp6qE400SsfJDmC4sSvpqapT8qT3FwiuAWCaGXtBs703HcmX++6hRf2MNWs/FgNHufd0A84Lc3iu+EEScCdwgWKV3rqoGYrSHaNBw/E3wsyX1AhiSrq5WKqPe7QYxaPzmXDwuXEi24ronOBI5c8dATq1YhKWENvleMdmHc7xfQv58i/ZfiCjJS+cEtPAcJDpgEDp1h+ya/u0a35K0AnMf0Md7FLQYBXblTjk57Iz/phQCSCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4leSgYB6CQcEl0wEMl2psN6BqqRAEJMKf8unroTpaZg=;
 b=aP784gB1qRjgReXXclZutZBgYzRQZTVGXhReslHi2J5w7yh0f9fYUEuPWtsM+G0GbTxzfWyJq+YaeXNyJVUPyRDGx23b2w2WPfmhs/JgmV4+b5drrB4+45G0F9MLAWpQaTkvE/gc8Ck6PaklZ7M2T0bSxwrMsOD8WY4eoyDtNKZyuW4DElNKC6B8WVsyIh0Sr8YrGu3/LPijdo+PxlCBk9fLYQSiR01ZWzpSUPurcWC+hy5ZZ0eJZyPohIZToqtWDsoUq5IuXIeAO2pr6A0WMPd8yEYv0zNrDZu6/Rrr+tU6w0mJypYCvGmm0ak610r2pq/ILRx6Qdh9oKokJZePhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4leSgYB6CQcEl0wEMl2psN6BqqRAEJMKf8unroTpaZg=;
 b=AuckdlQsobV9/ZrKy7i8Gr8e1ETnCc8X2VbLtsTL4i3Dll+htxvDI2LXt4+dF7XALA3amIsesEN98VeeIY3dgg1WQV36NLmMO8GOcqLgbSMOglFpqt64jHXcRhzu8WCzI4qGe8h/N42UTDPBSO+M7pv7E1I73hugBMlqrmVJUO0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jbroadus@xevo.com; 
Received: from MW2PR18MB2188.namprd18.prod.outlook.com (2603:10b6:907:d::31)
 by MW2PR18MB2347.namprd18.prod.outlook.com (2603:10b6:907:10::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Mon, 6 Apr
 2020 06:00:26 +0000
Received: from MW2PR18MB2188.namprd18.prod.outlook.com
 ([fe80::152e:c63c:5575:6586]) by MW2PR18MB2188.namprd18.prod.outlook.com
 ([fe80::152e:c63c:5575:6586%7]) with mapi id 15.20.2878.021; Mon, 6 Apr 2020
 06:00:26 +0000
From: "Jim Broadus" <jbroadus@gmail.com>
To: openembedded-core@lists.openembedded.org
CC: Jim Broadus <jbroadus@xevo.com>
Subject: [OE-core][PATCH] curl: allow configuration of default CA bundle location
Date: Sun,  5 Apr 2020 23:00:14 -0700
Message-ID: <20200406060014.78150-1-jbroadus@xevo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: CO2PR06CA0065.namprd06.prod.outlook.com
 (2603:10b6:104:3::23) To MW2PR18MB2188.namprd18.prod.outlook.com
 (2603:10b6:907:d::31)
Return-Path: jbroadus@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (73.169.153.56) by CO2PR06CA0065.namprd06.prod.outlook.com (2603:10b6:104:3::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend Transport; Mon, 6 Apr 2020 06:00:26 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [73.169.153.56]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d004ebc4-cbf9-4523-07b1-08d7d9efcd68
X-MS-TrafficTypeDiagnostic: MW2PR18MB2347:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2347B3B347A83E8CAE63B627A7C20@MW2PR18MB2347.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0365C0E14B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR18MB2188.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(376002)(366004)(396003)(136003)(39830400003)(36756003)(26005)(1076003)(52116002)(8676002)(6506007)(16526019)(8936002)(5660300002)(69590400007)(6666004)(6916009)(81156014)(81166006)(6486002)(2906002)(66556008)(66946007)(6512007)(2616005)(478600001)(186003)(956004)(4326008)(66476007)(107886003)(86362001)(316002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cDH8706i1pNxYFVIVsPuyGkCryWlWVHlYm5vT8dgQGM1FPrJvVAkNXS5aMZpPhwEKRxIP/8KXUz9Qg+MyO26y6HRGgTJXwyAggns2No6LTSlIGZlWr7GY1ZeX+8uWD1a3XC4uxjMBvhm5djio5zdu9doUmHsqtcTlDEflcVB6NYFEWJCoPIr8Q6dzKDoyTA0VS49p91RugTwVwMTTIh4JvCD7ZSQ1kKgYtx7aFiuXO8SadTX7mTQ0DA95mNQIk/unSpGtIY/K9YrbnV8Oup25QQo89e/KVuYRdXVUk4jdhxQy7wEFQEkZGLbvd5Cz3X0BTmXwpuBiVv8HSZY2g9pA/rvHqDMaot8GB8g/GrCwMSxkFY7bECddNAdI4HLMvQxYzg9aKRZitBxvGMQVE7/Lp/sPSl4g9b/xXGrBJryQkFATAWQS5LErMAnnt7WHTneSsmUbXJuY1RxwUG0N4I4Z26bhrFvomYfx4lkZLPA4VLoPGsBaabEF/FbIZYP/wdW
X-MS-Exchange-AntiSpam-MessageData: 
	SO/CwVbJtEJ/vRUmqMAbJdvVXAy/PX1RjEGS40DqzLo17ODoJxF5XkidLpzli2jkWQXoqRfb4HlPzyOZkqjoD8HGQy1sE5Kpk/qSINkUmK2EsQM8lD1PhXBorrUpiCTwu15EU6I7ben/CapC/0ZYoQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d004ebc4-cbf9-4523-07b1-08d7d9efcd68
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2020 06:00:26.6370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCQpdoo0bT7OT3QWD2a2OmCg9a9zS0wa73TZiywbvTqZY8dhxFOFNyO3coygV1wlb/rk05xxuMCUskZeZoCOhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add a CA_BUNDLE variable to set the built-in CA bundle location. By default=
,
don't set anything for curl-native since that target's sysconfdir is a
location in the recipe's native sysroot directory.

Signed-off-by: Jim Broadus <jbroadus@xevo.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index e854e8d4bd..a291227db1 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -49,11 +49,15 @@ PACKAGECONFIG[threaded-resolver] =3D "--enable-threaded=
-resolver,--disable-threade
 PACKAGECONFIG[verbose] =3D "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] =3D "--with-zlib=3D${STAGING_LIBDIR}/../,--without-zli=
b,zlib"
=20
+DEFAULT_CA_BUNDLE =3D "${sysconfdir}/ssl/certs/ca-certificates.crt"
+DEFAULT_CA_BUNDLE_class-native =3D ""
+CA_BUNDLE ?=3D "${DEFAULT_CA_BUNDLE}"
+
 EXTRA_OECONF =3D " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
     --enable-crypto-auth \
-    --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
+    --with-ca-bundle=3D${CA_BUNDLE} \
     --without-libmetalink \
     --without-libpsl \
 "
--=20
2.25.1

