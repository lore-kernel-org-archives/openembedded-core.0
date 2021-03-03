Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.47])
 by mx.groups.io with SMTP id smtpd.web12.11.1614795433137985624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 10:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=btuSwrg0;
 spf=pass (domain: spinetix.com, ip: 40.107.0.47, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXaBK8n07wLQpBXcdiBD28vXSLPPjR65YPyXk+l2CPaQrLppy5HlK8LWYnLeuWlWKrXugPHoglKjirZpJfCTFwilsI0PVfRexTyMDdl3l82sFRvciWIOkRfOJdjJA7RmEshWg1QrrYjPaVFzKNkV2yaYUgy+8wu/VNJ34KHq29pNNEgMCH8M6OwoAugU3V/orLFpgQaWaBSeuWsYx+bTtm/n7aylkqsqdehC0+tSrzDkuFHjgv/NLrpxl62LAf2IbENCZy3TyWyy6+z4ATSypBcIAlP8XE/947sMULRk7IoardyvRtUtFdno6M6TPhSDSh47ikURJRACQcG3Uttw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6eQ8nnIaThEsP053UQak8qBn0aTw4hwb518vsePODc=;
 b=ngftfK7fvw1U9TgsyTHmxhuxOHD0KXSNYYdNJ5dUCJP9YvqZ7DTGZkWQy/0C1iiZYuevQP8t2zuUzMOT25xJlY6GEB4Kyuldsbap2/Vjw0S744ghCiGhMhXYD9vMwP6z+7b09NcSRz/P+KWHpdJFqJteYfF8WOOFhXArBk5uIQHxEdBI2g9yXIkBHcpn3Vl8ZVsF5lVrRH3c1zhqSBEoqFbUIsAWS2WYPAWoDC9xpHjzy3+Z9pChLLuFMmqVZKj5P1Uuw4DpJn34WJg8yKqQtA7BD/TmXj26hP87blxppPpHbTj+ClT3PB3Ok09dc9ZLgwy+ZHx8wjuhqJGV2DS0TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6eQ8nnIaThEsP053UQak8qBn0aTw4hwb518vsePODc=;
 b=btuSwrg0YD5+6TgPut2f7d2smQjJP4PtyzxRbpauRPfWtVzdi2Dv8v6IcQ9BBzDKpeVnutr2t8xU9idqzZySDT6Tu0klEUysGMzO1Fn3qw2g9dVJABTEGBQyAxJsyIMjFTYiyLvsVJzLka0cnGfXfKI15krm3FEw9ui/2KtIuGg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB7PR01MB4092.eurprd01.prod.exchangelabs.com
 (2603:10a6:5:2c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 18:17:09 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::a979:e5e4:3b20:ba6b%7]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 18:17:09 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [PATCH] rpm: split build and extra functionality into separate packages
Date: Wed,  3 Mar 2021 19:09:04 +0100
Message-Id: <20210303180904.25592-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0131.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::10) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0131.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 18:17:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d9e58fe-386a-4fa1-6786-08d8de708f69
X-MS-TrafficTypeDiagnostic: DB7PR01MB4092:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR01MB40925D59F08ED6F2AE606B0D88989@DB7PR01MB4092.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CPyX/jzAAconALOTnck+kWgF01jKIsEmL4E8bZr/ne76GeflzeBEHoK5pMtriNrAK+A5oayciXX/tK8P5YOkNJRaPjr2LhYyI+fBHMceNf4vM5vTI25kFX2o9E+ikYwW53SjpaVHI5e5z76XFZUrpEAn6Vp7/BAWeeQLGQzeDxq93KDLzhHCFc/1mcU5PlvVUNPvugvDwqUOq0Wk52m6jMdnTrczle0n8oUv1lQFhdxNkOQbUaWEXDx57B5WTN8ogIR/P0vzzKQYmGWuBG1KUZH9R0phc6Ya0coOPXyf0cJfH40A/p+D9MXY5E99sxIAOANCQfhyvSJAdahRO1caTvRe1qj0Bc1M/wbqFx8OAhspqbyPnFBRYE7OfIYFcL5cM+HMTJ9rlGGCqXGkL5Hxo8/69blydQLZfFG0J9kGeFhIpiVKUVqYkj+BrV6zVtqQ+0IzWHLMM6dm28ASrmzxvTA8UwKYGxedI0EBHEtuCULvJgPdkpxCt1ARpfGRLyR781vJvV5nldb7mpWSJ1TQkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39830400003)(346002)(376002)(366004)(396003)(86362001)(478600001)(66556008)(83380400001)(6666004)(36756003)(6486002)(6506007)(4326008)(8936002)(2616005)(107886003)(6916009)(1076003)(316002)(2906002)(6512007)(186003)(16526019)(26005)(5660300002)(52116002)(956004)(66946007)(66476007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?W4qguV8/X+i+TkTDtmB9z+V6uxcs4A1xcNSN4cNNx1tm6zLoxIlzkR1UzYRh?=
 =?us-ascii?Q?nS1G2UEUdutbXMLHph/0jctiDQjg5j8Kr7flpOLPf8jHXlSxXaC/Y4xUpvy/?=
 =?us-ascii?Q?iBz2evBRPJu/2WzP5rGPa82bzhuQuJNZak0Ad9ryVlTXusVDsHBzNht8rtOR?=
 =?us-ascii?Q?cwZO7/JEBV2DwW08tDze+NcFUgSR9WZzuH70OrB3D8G+Bk1pb0YhBQ+MTmq/?=
 =?us-ascii?Q?VNePUHXVweVjguen4B0kp0spidy5hae/LP1zqPAUSFbcnjagDk+K//ncBtar?=
 =?us-ascii?Q?OE8dq3ktdB6Y9YsJgnNtWM46ajEqkoyUXLH5LRUb+qY8pD+EdehkXcZq6TDd?=
 =?us-ascii?Q?IidHa4aSPjqQI6VoolL37WIo/N7hWHJE+NDzjAV98pgP8YFViiCXWLj9BHTc?=
 =?us-ascii?Q?M6UmkILfmg0c9T3BhlJ8H6hpTJk0KSf2hEi4I+T+tfLf0Vd8+8doLEonAm2T?=
 =?us-ascii?Q?Ze2w+BxTiOCBoCiCjWlhpi869o7DF0rbMMncfS5w9rXeRvU+e+bRv0nMesPs?=
 =?us-ascii?Q?4AszMcjLdRRjbMWycn4vAKMKzDkAjuDLZhA9sXgV3aJpwd9y28ckj4wzyNPY?=
 =?us-ascii?Q?Rn/9klwijsB31FqH8uhqYRcUAslyVPAOH00vWDbTM2O57xb1xjti0ThmQBHX?=
 =?us-ascii?Q?xq9B6K9CARPYK2Rl1zMtc/0PqYQY4p/GwrJPdWWBxSIePtW2cm9bkyUlaXyf?=
 =?us-ascii?Q?yJUshiZSUTXMn0h/B6/EVJs+DruHdT3Db1dDOG/He41n0L7pHNYZcBISwqFF?=
 =?us-ascii?Q?ORRIRDAGcLnQSXhDmlSLGQ9Ak7KzDTT0IxmHDWMLpTFuQwqg294rfBJ/zqwU?=
 =?us-ascii?Q?h5wX8sWkmfvR2sh+FyBV/q401Qwdv0FWjkGe6+fXUwE2nOwdBnc+lX+OMiHB?=
 =?us-ascii?Q?YeicMA6ZsXylfO2zCd3FycIzt58JHRe7n5QCu57TgslCSD3jkgmiXbdUPGSQ?=
 =?us-ascii?Q?buiF3qZcLGvpY+wsEDjPkHsWuJaprESZJ8o3JEzLnNgZMLOXNOVO05Lz9Y84?=
 =?us-ascii?Q?2NwrOuX9DrNiB0nNIQsGzMHvrZAvUkHulBM0gKTVNdCp8BGOIjwxyhos/6Ej?=
 =?us-ascii?Q?OvSCzu62K7d/tAn3ZKrnfcpMtRP8IwdWU5/OvGTYZREDX0JUgc1TlYb5aEiQ?=
 =?us-ascii?Q?k/0mdYzGxeL4qzcRjZNhFHv3+K0z4ZZgM1kW4Ny80jczQD71o3WbDiWaidJn?=
 =?us-ascii?Q?cdSGW82wGB65W23GYysE7UFsPBOW4apkCbWn0wjNvm2IcvIpL3uHM8s9r3fO?=
 =?us-ascii?Q?hZ82nSIn48njUe5XZI+achFWLU1MXRlECZAtcfcHOtp2mKPXmilhAMSUq0YV?=
 =?us-ascii?Q?4wzc+8K08M6nPkTp9Hhm7Q9F?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9e58fe-386a-4fa1-6786-08d8de708f69
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 18:17:09.7847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rePYc00t99F7UFPxPP4MponbWxSMTP8/dUblN/66kQzB2Txt2ezG67i688svzmNaKmOj95gROfw/qzuAW/Qg/qaUNdm3U0dLBL9dNPH+jks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4092
Content-Type: text/plain

Having all the rpm build related tools in the main package requires
adding runtime dependencies on perl and python3-core, so adding
rpm to a target image can pull quite many unneeded packages to satisfy
the dependencies.

This splits all the build related tools into rpm-build and moves the
bash, perl and python3-core runtime dependencies to that package.

Also, the rpmsign tool is split into rpm-sign and rpm2archive (only
built if archive is in PACKAGECONFIG) into rpm-archive. These are
separate packages since they are not really related to building, so
do not belong in rpm-build, but are not necessarily wanted in
target images when rpm is included.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 meta/recipes-devtools/rpm/rpm_4.16.1.2.bb | 39 ++++++++++++++++++++---
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
index 9195d66dd1..d369c706a2 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
@@ -145,15 +145,46 @@ FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/rpm.
 
 FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
+PACKAGE_BEFORE_PN += "${PN}-build ${PN}-sign ${PN}-archive"
+
+RRECOMMENDS_${PN} += "rpm-build rpm-sign rpm-archive"
+
+FILES_${PN}-build = "\
+    ${bindir}/rpmbuild \
+    ${bindir}/gendiff \
+    ${bindir}/rpmspec \
+    ${libdir}/librpmbuild.so.* \
+    ${libdir}/rpm/brp-* \
+    ${libdir}/rpm/check-* \
+    ${libdir}/rpm/debugedit \
+    ${libdir}/rpm/sepdebugcrcfix \
+    ${libdir}/rpm/find-debuginfo.sh \
+    ${libdir}/rpm/find-lang.sh \
+    ${libdir}/rpm/*provides* \
+    ${libdir}/rpm/*requires* \
+    ${libdir}/rpm/*deps* \
+    ${libdir}/rpm/*.prov \
+    ${libdir}/rpm/*.req \
+    ${libdir}/rpm/config.* \
+    ${libdir}/rpm/mkinstalldirs \
+    ${libdir}/rpm/macros.p* \
+    ${libdir}/rpm/fileattrs/* \
+"
+
+FILES_${PN}-sign = "\
+    ${bindir}/rpmsign \
+    ${libdir}/librpmsign.so.* \
+"
+
+FILES_${PN}-archive = "\
+    ${bindir}/rpm2archive \
+"
 
 PACKAGES += "python3-rpm"
 PROVIDES += "python3-rpm"
 FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
-# rpm 5.x was packaging the rpm build tools separately
-RPROVIDES_${PN} += "rpm-build"
-
-RDEPENDS_${PN} = "bash perl python3-core"
+RDEPENDS_${PN}-build = "bash perl python3-core"
 
 PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
 
-- 
2.18.4

