Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281A6C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 15:43:37 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.72])
 by mx.groups.io with SMTP id smtpd.web10.26613.1677858209370884426
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 07:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=F2MBFhQa;
 spf=pass (domain: witekio.com, ip: 40.107.249.72, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA97mhts7r6yqTB0YwieF/HOLVD+xmze/9uFyDar2cA7JSFFo5+Naz2qniMhJKIrCJYkfN5FIOG4X8p3mdIadrIS/Tu5PvTuWv4+o2bYYz0izI37TA/pEgiPW4zu+EqU9weYgPeI5Eds578+TpvLqvWWU5FLP/g5qrlEbZnYQXZnQ/UjuB9G1K7HpTy/5DU0pGchH0CbWm6n1D4jxD7aLo8bDaUihjmtidlJJvB98ZGCTIOY21LPBVBtamT1KgPa2iFyO9/AprZPmVEiBR2t4y4pZeAhfLSZfez5norGFWQOkB49m7EeCtZDTZitELO4xw/bezK5W+HSeOGF9pqHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtSTbwvHoImQAsVgPcNom1F6UWfV+ff38HT8sMVDIiI=;
 b=fMDC2WzG/ciqN5VC3eu1g1kGycaGTUqoTqcGB95p/KguyfNN2vtrMbfakn/zbKl5BVcTWtRvc8dPDCNVviEEQijYnZHRqdiGW1R/fV/sazQuZfuOPMhRG5zXzzARDbmL75i7RHapbOWLg+Ad8Ghs4gXWEZrS06ui0Q25f0JMx8PGXAO3kFqYxrHTYf6+UtW37+rS9DUB1iMZIJGxyzVN+CF1mSw89L83HJidtvplLuEcgH6dnZ/POYXUEe5jLADYdWxbMIzfLAKb4+L7FXVt/gl/OefgsgLsowovjWVqFxZ63ip2NjgmWyd6toUk6rf/ynlYZdS5/A8f5cxZ1Q+c2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtSTbwvHoImQAsVgPcNom1F6UWfV+ff38HT8sMVDIiI=;
 b=F2MBFhQaczreMCuCkNjJ0S1Tmv1PjtQM273bUpDOO+hRBxdWHV69t+dtxCTkfi/hnc1/U4m4HKJN0GIWuGRFOwSzs5NEQna+8naXRFb3YVWqFNyLTgFcN1TslyzqCf0HS1qpIGhjgimF61+nxUc7Nc1OejAc6c9KNTM0+o7uUZsP9iWv/7KWOqqNaRaBaUVtwq8RHjZ3nGEmfU4Fj9aiXen8yn2YatiZnL+4Su3LBiMD/bGJZJi6wW9rsRYAxeCSJL6Z3b2ut90thTTvx/HxAWnfrMJ5TRkHEiQPfCRAfIhe9K3cDbqvJXmDuoWOJUJzG+gYeok3he7OtO+6+kJdPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by PAWP192MB2274.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:361::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 15:43:26 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%4]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 15:43:26 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [OE-core][dunfell][PATCH V2] openssl: upgrade 1.1.1s to 1.1.1t
Date: Fri,  3 Mar 2023 16:42:46 +0100
Message-ID: <20230303154246.2016-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAYP264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::22) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|PAWP192MB2274:EE_
X-MS-Office365-Filtering-Correlation-Id: 7065c297-f1a7-4364-b7bd-08db1bfe074a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I6zSe51ESwIDIERXY439xtH2FVVhzH5sx3vzYeiUYj1ojplfVacoxdjvmeKFR3ep4vqS2IwD8mXu1YRcfAPhSpUZfac/G2TPRSN+rW3VLTn9ulVcS3aAwyslp3ecI4J2x9i/w3ngLbutj5hkBLJRGy6WjIBC7BMnbGIaKNRLCGGI3GBEHtLFocwXKyV4CViNAdbmf97QLSUUdC/oxSgO21dykE0abJ4SOmGnRNTJX71hldLTTHQyZizoJNDaQgtBrX5JMfK/JBG/XzRwMJ6T2FAH3XlqaryUmPeNIhJjy+V7dGJhmgMRrhlq/BchX3iZ751lwzVEnNvltYZka17D1k3Mg8LlYdl5uRswVoe9kRDY3DfBayoMWiaijkn1Qgux6AR/FMHt0a6lP0/sVCL3o45KjUI0bFHFbETxgz62nSvpoF8Uy7vX0bYQznnQMMg/SHBEvhDMoIS4NG5t+Y/3R2Uk2VB4Wx1/IbwQNfPX/LSWk+btQoRiRdDkv9lNUl/FnzOtL5nnF3q2Nnjm8uY/BKSm7a57QVeONdxAgCT79hdvJm9I+Ivx5GBuJ1HjZnV8SJqMc9g1kH8HqF2Xd47dI+nTZCal1SlBEQXgxLFhZKb2CLDVrUx3W1isPWMQ28AUApwX37gnKJg4DYCodWJGBF+ANzmCPF/jymu5S6xdG5UfECerXwve0PC+Hk8oupcRA+p3rzblNHumplRWsszd1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39840400004)(451199018)(38350700002)(38100700002)(5660300002)(41300700001)(8936002)(36756003)(8676002)(4326008)(2906002)(66556008)(66476007)(6916009)(66946007)(6506007)(186003)(6512007)(83380400001)(2616005)(26005)(1076003)(9686003)(107886003)(316002)(6666004)(478600001)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?49NL/Xj72DhAn2sga3lOCF9iRQ+sruqHq3WXTPas6rUnKj5A77VKcW0JfCYB?=
 =?us-ascii?Q?ihQ0ZkN+pfRzAtNDCNlG5y8SQ6pK7CLq2JRi/Tea6Zs3LnT3uW1t8VL2ZYZa?=
 =?us-ascii?Q?GUPCbWaiTwH0i+RSnFryUE797PsYbFGV3JYN36z6Mwoy8qQI+A/Jz3LJwEtc?=
 =?us-ascii?Q?Tq2Yh6q+nthiaYr7IL/txu7ULsq2jiq4NROzOtgmINAyEFYVmDET+oaCeRby?=
 =?us-ascii?Q?04zEM4I+BQ6nKjWG9WxEh5NlhWNMV2EKZjZ6PuZmUai6fELDig0fiEuK/GFP?=
 =?us-ascii?Q?VwsPoiD0Is75Rx36B0hrD6B4N84qI7evopNMIknQ09V/YBTImzoKwB+zHH1w?=
 =?us-ascii?Q?sFWTyt4/w32uoGAm1ypVhBVx98+IwNp/msMgThs5WnWHLGGREXEg0wzCp3IL?=
 =?us-ascii?Q?+Ii27WyyIfdKK9PhmUi/E9n2KkHidSQW4bmNfQTqYpYWFJTUH5yhSUBsbpgv?=
 =?us-ascii?Q?DNGeviy/FC1kHumrhQq/WavhZbiA1dDa0K3tpilYP62R5PZaIZAU2oxMcF9V?=
 =?us-ascii?Q?J4l9qMum65wv7R0dMGpJqK0H2douKDSnx2ZosasGaEY52q8DLK0LF07Ltozr?=
 =?us-ascii?Q?Ogndi4um3k3xmO4FE8WXCVacwecNiy6knN7KoncEEH4ZkE9HMOZ9gczB+jmQ?=
 =?us-ascii?Q?jHGDrq/EnHWqzrMCkzUvRFgqyWRIR2HKPD5wWO8/hmLiu5Mt76Vsj7NOKAQK?=
 =?us-ascii?Q?kUSuy5XrHh82Gwk6/jqoHlW2M8oA3ettkNBATwNgw9kr6LfQIFn2YTCa34mB?=
 =?us-ascii?Q?AhXI6TD40Mttvhydda7f2k6STqA3uhUOUXDJXg1UJYvpJpaoGinS6ncN6f6E?=
 =?us-ascii?Q?e0emMalZ4JoKU1wwtGU/cR9/araP3Jx7zFo0tVdPvsShXR4Loc7u9CFqE7OO?=
 =?us-ascii?Q?V+23tOo6QP4FFUYxRtW/XuSCsm5uzqfh2OmOHYR5GWFQsjpF0ayu+9YNGILZ?=
 =?us-ascii?Q?Pv08QLya3CicrlzS25W3EOpm8M9aHLCS/2sOtDa9snIeue6lwJnuMy5Y3oZf?=
 =?us-ascii?Q?3a2a/0yw+d6t7DB6FhhJ2xD7nFDq1DHN0Uqa7NB0L8PAKleY7RBbI0ywcXRf?=
 =?us-ascii?Q?oKi/Mta3cTtR9Akdo/KKN/JGOwrKnueTEjmi+BXlqwkMVL93DHLqNEwxQuKg?=
 =?us-ascii?Q?Z+5wFXQtoc3F13SBYXLOmbNRMhP00jf10f9m2+c41AyQjHsbqzfJPJuExFOt?=
 =?us-ascii?Q?HP8vyPJFYtZNB/rnbTJjY9mF7M1I+967wjFEHgAF3YcBqEuJ5894LhG01kQV?=
 =?us-ascii?Q?CBlZoUQiaB4KWuvGnvtVLzfzrOhnQRSgJTFkEWQR7s3ATe4tFiIX+pnlwBcE?=
 =?us-ascii?Q?sJFQi/xf2XtENUHhRp8y5w/5GxdIYDw3l6lX+i8dAgAK1sC2barLkNmuDTZ9?=
 =?us-ascii?Q?DiDxfTBnSBfOKQ2uW3T1ij1GM2scufMlFx0INaUCaUbo6y0MDo042XOsILih?=
 =?us-ascii?Q?zk9P1RIJvl7G5wyLHhtkGC0s1cC+7IV/MxDDaiqt1IzQbgj6R9jY7GwCwA4o?=
 =?us-ascii?Q?HCUqzQdrZfcXNv+8LyfTcJcmqTuP1ffTGPhL4f+qMkh3jSN60tMACagnVt4f?=
 =?us-ascii?Q?D3O9lqI9y5Y9uu04axDxjnADKVvP6F6e0MKoM9gKGOrjMmHojgz1UAXdC1td?=
 =?us-ascii?Q?kg=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7065c297-f1a7-4364-b7bd-08db1bfe074a
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 15:43:26.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZdJmxD0VGfZJIxSYj0TaNJWjRUT53/6uni69GA1Fn6C9HhpLzLuQy7fBSI/nPdeQ1iP5ox/RbsrobCbm0uTHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 15:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177988

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
* Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286)
* Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
* Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450)
* Fixed Timing Oracle in RSA Decryption (CVE-2022-4304)

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../openssl/{openssl_1.1.1s.bb =3D> openssl_1.1.1t.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1s.bb =3D> openssl_1=
.1.1t.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1t.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 6c8f285996..a1956ad8c2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6=
f18a6f74e4b6aa"
+SRC_URI[sha256sum] =3D "8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45adeb7=
c9677536859d3b"
=20
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
--=20
2.25.1


