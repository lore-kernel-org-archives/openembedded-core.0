Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.80])
 by mx.groups.io with SMTP id smtpd.web08.7859.1614339248655038024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 03:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=NcRt9xxA;
 spf=pass (domain: spinetix.com, ip: 40.107.14.80, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZUSaqGtETLzkQLexzUgyttlJ4UUczUU1FUC6Tb6omu4uNTxAoglsr9ADjAfKmi+FsPZpyifxxVMO/0seHu5jM5qPwc4e9jaZaXf23jvLLkD0kBVqaz+yrRbwHICSEnYB2hrbb89eaK2PjMhXh9VdyJuDoHhpc2oEX69/+jeoRtLq/PmJAHKC4qGr/saBVS+Ei7jcSTHzpFJF7yEF+vy6+D51034kTqPNlr1rJsnk7CL2UUx4k1RfpKUHKrsZJuXkFjxrclP0NHIv5ijRgm0vUNf4u5d1Gei1r+GklsW+Jrdrc8yOFLR15x8xH9rITaADOKZYbFFw5gcnAm6cHgd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JGVymJz89NWQLEOAfYIaOwtorQpzLqlT2Ws6L/Il+M=;
 b=oWCb9JHi4tNxI5m3TwNPVuM/AcOFDQcgiEx+9MAON3Fe12xoKazsHc+RAi0KtP5zO3J1RU906KuUswJdWEIlFwI4j4n3rYw3+/xHMaV1Iy3cIBbB8gi5/a2uRov9obKDzzEKZwh2uu3i3OaHcQfZ1RrWHZ+wOp7aDs0Y70kGazga3kW92vuSYvadoBAtUn6ttvYo80zYCKftpJAPN3oUIfmOWeNwIT0gc9KDSwBGdtuLwYwdXxurTmiF/yG75Lz3PxEa/q14Ldo3KO2223mpckZ0gMsk4cbqXs0nEw+AXzYxCajtf0wNQkmKMHx22Vm9WXX+8Y7FdmQu2/Tqpb8kXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JGVymJz89NWQLEOAfYIaOwtorQpzLqlT2Ws6L/Il+M=;
 b=NcRt9xxAFtF1zUvDXlDsgYKTRxMDwXBtZFy+CS/Qfv3TBcVajqigt3TOfL54/I7TyfyMBxwGODGVAHWb8beh0l2xUKQZ1rp8HBI9lbNqiol1lRKLntZacNgI9ThHgndz3LpyT5+iKZECnCJZpUtq7QLXIeYlnsdnWtVRE7IK8S8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from AM5PR0102MB2628.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:f::22) by AM6PR01MB4198.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:26::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 11:34:06 +0000
Received: from AM5PR0102MB2628.eurprd01.prod.exchangelabs.com
 ([fe80::18dd:710b:528:23f9]) by
 AM5PR0102MB2628.eurprd01.prod.exchangelabs.com ([fe80::18dd:710b:528:23f9%6])
 with mapi id 15.20.3868.033; Fri, 26 Feb 2021 11:34:05 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-core@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [PATCH] createrepo-c: set path to magic database for native and nativesdk
Date: Fri, 26 Feb 2021 12:33:32 +0100
Message-Id: <20210226113332.7392-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::14) To AM5PR0102MB2628.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:f::22)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 11:34:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c91b8ea-a649-4723-c447-08d8da4a6c70
X-MS-TrafficTypeDiagnostic: AM6PR01MB4198:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR01MB4198417348E005E4681CFB9F889D9@AM6PR01MB4198.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dk63CO2MzPPbgalmV6fesQRbk4tRrb6ihpcCe0cZVuofPJd/zKvBr7nEBzbV+fK4LbElL9wTFLYso4Xhx6bHDosET//PhbvBWrb32ZkPQHc/mugPHxVHNiSVIlbIECLchWq4fJyG5stXQDWOZCVOJ7ds16Yt6SpqQNU50CGMdBOOr9JQ//6RtT9sZEyOpEKfKGz3xpQuJ+DPWWSpM2NphOCeUA1gDbnrQaaWI/lqU9Rrq6ZtImMSBKnbwcHVNHoZ3SNvk819I8fToTRtF+hhhglefNEKewQGk1JN6kdSmXpYdjpDqo+L+fDgqexI79X5vrSHV/fqruLdh5oaxEtSbEAl2+STAyl4mzK7sejNMo7WCuhedxEQrBEbc1G8xnHW3cR68I9ZShmOu5q1f+qOndAt4dRZsE0QUTFP1ldQYA3ZkW9Nlcp0vw92+xAHdOBgGdEOqC6YjV7tlnxAqbeYcPZ3nvBsfSPtek+xJB9DWPss0P3MTTM4ioVVI2IXWBnVyv9FwTJSy+I0WVkqDnvHeCD8X3/S6qmuZIejp4ASHcXiGM5+JKcEGVXcGdPBzUzAwchDuwYtW4Jg+XHKvXtUdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0102MB2628.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(366004)(136003)(396003)(346002)(376002)(36756003)(8936002)(316002)(2616005)(6512007)(6506007)(1076003)(83380400001)(6916009)(478600001)(4326008)(52116002)(186003)(66476007)(956004)(16526019)(2906002)(26005)(5660300002)(66946007)(6666004)(86362001)(107886003)(66556008)(8676002)(6486002)(130980200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?zWF5N7rxhMxgQ4t6RFUtWLaohB4EERMOGgPQ7CtBZYDkVqXmM/b21whmZDGx?=
 =?us-ascii?Q?5SxiWJIb+hh3HwDbn2NCyvRBnVBSofp/KKhhrcr706rRcMllCwCH2Q7jmmnw?=
 =?us-ascii?Q?tivL6Y/2KRsyDj8DM12/F5FdPBDS/f24fPWOlUqHG7taXjbufFvuzQOAxZlB?=
 =?us-ascii?Q?HIETcawRmOauuJugfLGNZwPj/le63F0bshUpDliyrG5+Sz3Ntj2H8QH3dRiJ?=
 =?us-ascii?Q?buTbhHn4TUopCxAYqDSldBDJJsHUhRNLkw+0bwjm7yGQfc7ZMj3e03hHIOXd?=
 =?us-ascii?Q?/HbMlSI4BOgkGz1cSSE9dDC6Pjiw2n/8mOw3htg01FWn5gTa1k0SPy49ieQM?=
 =?us-ascii?Q?aAfy7Tb3a8WBfHrJQM5u5onTAXxTPY/7WJyR0+SdoqsBU6W8RpjRojfbh3ax?=
 =?us-ascii?Q?Y+YUA7yjOspGzYy0rk7qL1kvzBfG+o5Dcogq6SCaNaT5dkmPQTuRKQobEU6z?=
 =?us-ascii?Q?c7EZpj/9AFmxTWddkjoTQtJw+msVuPBfIozDx4uhRVyJN2wYbuUkRW8gh2Vv?=
 =?us-ascii?Q?Jv3tv+1MOCu84FAp8T1gafUC3pn1LRo4mt0pLgSZbigC3rqM/KhnEu8CDR4t?=
 =?us-ascii?Q?/8HpaYqQRfdtgEuEy1AkHfDRpDkj8EA35sk5odERkVZ0MNW+iWVGldbUasvH?=
 =?us-ascii?Q?DN6ZZtPJfsA+5PChYY+3kCvtn202sz+MEQxpAFROX+pO5LYNXkn8eRjRuFuE?=
 =?us-ascii?Q?OiZmhrP1+g7IupERemZhyI2tPi//QhiCRRJqg8d3x84mmJ/VwIdQ/hBlQC5w?=
 =?us-ascii?Q?+mPem3Tt6Pye7Shk4pTeqOLMDWXRtdHuUA9n9puatjhBF8THT+UtiQe1K0Tk?=
 =?us-ascii?Q?QxGPxKfZFrkJlsuYulZFZJ4daDwWXveGQwbtRY6kXXc+9+iNJuH8k7x+/OU3?=
 =?us-ascii?Q?fp6C27g7IThuhAhDjXyN7bheWZrqa/3niXXVgkGJzgC6d6aByYjWyCrpj/MW?=
 =?us-ascii?Q?44AAq7rZL6290PytnpvOKaCz2gH7WgPZF/ckyUrbKLiRX4bqlFjzU5LXrPbI?=
 =?us-ascii?Q?0lKwm1MTFetJPVikbg9UzvVMIUZAxX96HhTXPAvTod8tjhr0MDruXONHAG2+?=
 =?us-ascii?Q?vKaS/LVaZq4a0Hnkvxd3MdBVxqzwdbC1M9odrkJf73BhXmib0FINgkRlRU5i?=
 =?us-ascii?Q?xjQmJaiN0ISxlAMKHgdJyZW84q/Gu0HEtAF6EXi38vV6HGE/Stl7DaaRExh6?=
 =?us-ascii?Q?92WdTnaP+5TzvIHKSjV+RakwI+UPfQfr9qgMeMQuthkpUncv2mIJv3gTZt/N?=
 =?us-ascii?Q?ZYqJ5kNZ0uxDf4q8Sk4qG0gC5FSeFOjZwfgd4bLe+lPI8b/PUhmcveVsFJa1?=
 =?us-ascii?Q?51921/7GcH/QtLWK9PszqMwc?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c91b8ea-a649-4723-c447-08d8da4a6c70
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0102MB2628.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 11:34:05.8907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2e3Jr5SP2FYTqIz9YziT2fXEF2TMdaPLXVxqFj/pbSROE7oIkfnOgzGojy8GFeLossPluMu0zJfScWbgKggY/MDIYkhIIaZFoiBZYR58gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR01MB4198
Content-Type: text/plain

The modifyrepo_c tool can use the magic database for input files
(e.g., if the file has no recognized extension) and fails if none
can be found.

This adds a wrapper that sets MAGIC to point to the proper place,
it also sets up MAGIC in the createrepo_c wrapper since that tool
also takes input files.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 .../createrepo-c/createrepo-c_0.17.0.bb                | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
index 350b183542..e0433806b2 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
@@ -24,11 +24,17 @@ BBCLASSEXTEND = "native nativesdk"
 # Direct createrepo to read rpm configuration from our sysroot, not the one it was compiled in
 do_install_append_class-native() {
         create_wrapper ${D}/${bindir}/createrepo_c \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc
+        create_wrapper ${D}/${bindir}/modifyrepo_c \
+                MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc
 }
 
 do_install_append_class-nativesdk() {
         create_wrapper ${D}/${bindir}/createrepo_c \
-                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm
+                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
+                MAGIC=${SDKPATHNATIVE}${datadir}/misc/magic.mgc
+        create_wrapper ${D}/${bindir}/modifyrepo_c \
+                MAGIC=${SDKPATHNATIVE}${datadir}/misc/magic.mgc
         rm -rf ${D}/etc
 }
-- 
2.18.4

