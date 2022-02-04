Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B979BC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:02:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.11590.1643994123195167652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q0XxC1L/;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214GOe1l023764
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Feb 2022 09:02:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=0lvj7B3FfmBLY+C0jzUZ08FjMZ7jD2X3vx6i0AM0dOI=;
 b=Q0XxC1L/05/twGh9K1iXsX5WK1y1deW9POBXuuzhpHvaj6eqlFkWR9W1duFXj4mB0f/3
 jYXkbJVu/AbvL1pV+osTQj8maO6rKHumRjRhggO9mmEjyChcbhqVbbqa0bojtPkcSQ+e
 3KT7HUtrsD7D6VRy4dSDP65ksSDZmfVB/3O1TPtYyrLMwZz1ro9splHF1P8P8VQ+aNWw
 mT7vFXEp/XfUWnAhS9brLVwP+QOXd7i1FAaSRKl6BN2a8llj3xy8VLbk1nvlcvBXmgWj
 UXTmU1yGzHO+fPU1dbFqi4Rl3C019Qww6jFRo5VjfIkCmSmQuCkZWH9sCe4EeSxeVD8v RA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgguu6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb2YiNEAFFT53zJ/XcfMkJsCdNOt1dkqZ7VGYgKWmE5AGWQ/NAJKYEHaBhg8kFlswz9NgeMKLJ5AdM6j2nsvvKjwx7yOFJ1Vht3hqfoDg7lNPxKtJdZo6GYAeYIqQDmeYUiKTUZiZ+S6oi888GlGW0kZ66X+Dy/rv/7V/WGAECY6ppv0DijcPtapqlVZ5adkxGGM5DJWFpI+2vbHCbsj+9fnYH/gJt/vOj5p0ABA+1EtOgzJvGGCbE1EXOBOAcbDwJ/uXAsX/wuY6bdefoyDS3KOEmL2qy35/QTBqUSkBzrHPvt146QGLw2Pke+EXAJIl/AIWGFp1BK4ZqtUETLDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lvj7B3FfmBLY+C0jzUZ08FjMZ7jD2X3vx6i0AM0dOI=;
 b=GLQipN+QzRAUWEZhB7hi+NrhqVY1/Z9eqNe85vUKS86DKL5IgiK1kVIwBJ0hukJirMSBOFER0B1bkD8Vyz6VWLv9Kw03GSYUlTmHtgH9gsdtcEvxPQX63lrPHSQ/CQuBYQuUthXsNjhykNlXZeuw0pdjvfTf6X27pI6SLFDzXJAZ4PgGdkTqm//GXyI4camKKSMyL3AmAUhqBnNY8c8MDmUQhQg6iEQzoraNqWnRDJoU0LDHa3igR0EVagJIoZqwEvv7ykidm+YulEHZV7lufchoH2/c/ktx6utZjgXMK2JYhxQ2n/8Ty2Y8ck8VLDEFErPXj2Q8AZxyzcASh711wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 17:02:01 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 17:02:01 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 1/5] skip_recipe: remove old class and rename VarFlag to
 SKIP_RECIPE
Date: Fri,  4 Feb 2022 09:01:40 -0800
Message-Id: <20220204170144.105536-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220204170144.105536-1-saul.wold@windriver.com>
References: <20220204170144.105536-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40a31f63-7778-4de3-cc65-08d9e8000ff4
X-MS-TrafficTypeDiagnostic: CO1PR11MB5042:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB504254AF1F37C59A4E7A2B3CEE299@CO1PR11MB5042.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t77eQUQbNGMXsvM4UhVzfBel0rbCSO6na01Rf7/gvBDOI/vgLi29UMF3WRxk7w4Onky/aQFt6izcwfRzmOUo8gL/3AnRLSfnSjQ1dRmLWOKgOjQq4bVjsPXaOfNCtP0enIiCSflgExBRGUTXTwa2s+EceL6CQbrah+/ZZUh8prXLpVLOM+7Q8wdFQq7pXqvIaiPrLpP2HN/hUD6IjsN/FZVDecxKJ5LfdQOxpRTk9lIEUKWF+K2NjdvvKICliYNO/qMaDUpU1lA+6gTiqQSG0sdOxK5+Pxeh3LEX4JkWp9aNIf9TH3aiO++sfwsNT+yVg41LuAUvpnBb02l+QLoDkWz69cYvijl++UYL3suXTRB4LTqi7fbgfJ3pc5DWZ8pFdTL59+CbJDMNun04QtwWhD8vOOqJa+7gdyOhAYDQ0cDtQhFRngz0gZTUSQb5i5e5bQWUDbcBwJHbS96TGM0mauOlt7F6g0fYAzxFy75Xa4eg2zEe+6CB/ablDnWdoy10VKy2WI3vPyFMfSIwVV8Yy4jswWlwfxDa09wEJJmkNtKhGbm7FzqGD8TFml8HeQzVPJVqlEIpn1sw+ieNz4PeYLG5KHxOtZ3V7xakByPTA26Pr9GZD7y6RDc5grzHfr7TvIyyaUAiXsokF9FHfLhetivSXkyZcZES5BjxoT+Fp1bZIShHT4VL0jdBnySUX3/R/KoIM13DncX2e0BirDCnZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(8936002)(4326008)(66476007)(66556008)(107886003)(66946007)(83380400001)(5660300002)(6512007)(26005)(2616005)(186003)(1076003)(36756003)(52116002)(6666004)(6506007)(508600001)(86362001)(316002)(6916009)(6486002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uUQNs1+f1/SaHQJzHuqgq+2N8wfWlDT1iMFEVj1fTtOzJzudPNUnhXTGxgRY?=
 =?us-ascii?Q?PscEcE5yll+HF7V4I2QEOVbZ7+Gj4ph6rFCjH+QX6GaiY8ZgDdrriXxEk8Qu?=
 =?us-ascii?Q?U6Fa2oOYroOA/QOh5jtyr8sLkJMAh29BQelqwISD4Cocn+fqmzLLEHU3KvoG?=
 =?us-ascii?Q?n50gWrhiOqZsQkujoZNBae3uynDezuWktMAvlqCwtWcC3Us+8JEixrP0ErVx?=
 =?us-ascii?Q?vaaKwyfdfC6jAkr8kKjVGSFI/n2DwWbbG7QIxCQGoBZ908DEzVbV3FHsxfUV?=
 =?us-ascii?Q?hrMomIh7CXjYY6hn/J3uGgEQmFC/BuylAbpDGLU5GgU4GLvIoOM3IOd0CWsC?=
 =?us-ascii?Q?u8jyFjuCX+WEE5+03fsSFj5YvXN7rAxlIomRbFs8fKYIoTwdYqHa6hub8Sqq?=
 =?us-ascii?Q?AQFyS1CI22HVHa/pDatlmwZ7FVZ6G1GgDgQ9kS1u3bBPCGQ/hnqLX/OD7Fia?=
 =?us-ascii?Q?eYvCDX9IW29mC8vtTrj+cMvrH3epUGIFk3rKVpboPNAYf6uLBQFArtEY1yfN?=
 =?us-ascii?Q?d2tYESUepzwU7KDxDzGa73c9Biz15D0GDZcDYCX3bQEMWh0pjSxazYyqCxSk?=
 =?us-ascii?Q?xueLu97hsDD5ok2Au2073490J8tnv0T05MKifYr6vx5yDMxzuFMSyzyeczo1?=
 =?us-ascii?Q?YHH09RgLoCDpStAFHWhs6LaVe1r2hk58FlTTEXiBC1VdLEoJUjHj1L4nuGnC?=
 =?us-ascii?Q?9qtiPGnQprcI6o8QkvewmFCDXXzX04tH82J0oPR2LKljbulVI7Zaun/Vupwi?=
 =?us-ascii?Q?/8jF0FEJTPvbRJey9WrjPIIieWbmq95GGpd18RRlFUzfv4WNbvWF7hT/kVJY?=
 =?us-ascii?Q?jjjZLMXnXj9jlQAtRt0zOo0aqZ3lXazAMzmZmfiiyu5HUk1fJeI5OlE6YCkN?=
 =?us-ascii?Q?BDRVTXmoh10ka7Q6qeyd6sJru0Y1jbalTIYnfyq69t97GKdBtucS3J1X0Rkp?=
 =?us-ascii?Q?1aovtmDTQr5TZ8miip5uVheucW9Tgo0Ca+KvbIcDd0KBXw8BeZrvPv7E6a8l?=
 =?us-ascii?Q?S4CJIowQZUi//bjkJYpsZj2mSg2aeTNlyNSQ/RZLvBncXHtRfojmlXEFE8XJ?=
 =?us-ascii?Q?yz/6q6BWHReckHiTomO5RsaxikifH78yjGfGXdi14FyrzDFzIxd4YUs2pKLf?=
 =?us-ascii?Q?BfpirHBJdtUHxZzo25L1HoZWDiyl2nqhZJkV1hYJaZfiR7n7AhUQBg/AlQl/?=
 =?us-ascii?Q?pEG4pLQusEjZkDpkH6AVBHypjhpw5rbccR1+qn8X5GNvOhGUlZzmFpNDJF6r?=
 =?us-ascii?Q?QYfsV8i15JLRb3mVnaJHF6NPQb6xBouyVxE7yPHET0RlV/sAQQZ7k0y67Gta?=
 =?us-ascii?Q?xbxmIWyNz1KigHQxAbARkEfnWz46TDdSUz+kGkp5BehNYI0dcnfZNIaPpQ3d?=
 =?us-ascii?Q?KPXtR53jvRY2BXVU2CbPw/XzuLcYjKG1dDhKmZudqrwt9+IKsOBP0S/vPwOg?=
 =?us-ascii?Q?nwmsnClxpxdmJAeCDKWxj71lLm9CMpXJVnQ1bBA10eYT8rsClNVGbYJOibik?=
 =?us-ascii?Q?J5NQzEcF3vYWcZIciuPj4NJmazAYeKubFOU9btCr5k6Yp9WMCvDZobpFaoIt?=
 =?us-ascii?Q?79O88VWQe4ZW2xRyRjGSRfcGBreuTv0cjYHBAyYIUgFdptVFwdcO8I1SaLa5?=
 =?us-ascii?Q?avi4u22Q/ZRX9qyDkimmCZY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 40a31f63-7778-4de3-cc65-08d9e8000ff4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:02:01.7480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ktgfPVIvUFt7gt6TlhsTV/vrWC7VLYdRUtIN4anEqRy0/ABKm20eSuFX+dSKA2pnBdjBk6NTYk6dDsK7xypwLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-Proofpoint-GUID: WdvPyMTwuq9AxynR0lDKM7qzYJ4OFsP5
X-Proofpoint-ORIG-GUID: WdvPyMTwuq9AxynR0lDKM7qzYJ4OFsP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161371

This change better describes what the VarFlag is doing since it
is implemeted with the SkipRecipe() function.

By moving this into base.bbclass we simplify the distro inherit.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/base.bbclass          | 10 ++++++++++
 meta/classes/blacklist.bbclass     | 20 --------------------
 meta/conf/distro/defaultsetup.conf |  3 +--
 3 files changed, 11 insertions(+), 22 deletions(-)
 delete mode 100644 meta/classes/blacklist.bbclass

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5f4956a1d31..854d14d8a51 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -438,6 +438,16 @@ python () {
     if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("B")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
 
+    # To add a recipe to the skip list , set:
+    #   SKIP_RECIPE[pn] = "message"
+    pn = d.getVar('PN')
+    if d.getVarFlag('PNBLACKLIST', pn) is not None:
+        bb.error("PNBLACKLIST is deprecated, please convert to SKIP_RECIPE[%s]" % (pn))
+    skip_msg = d.getVarFlag('SKIP_RECIPE', pn)
+    if skip_msg:
+        bb.debug(1, "Skipping %s %s" % (pn, skip_msg))
+        raise bb.parse.SkipRecipe("Recipe will be skipped because: %s" % (skip_msg))
+
     # Handle PACKAGECONFIG
     #
     # These take the form:
diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
deleted file mode 100644
index dc794228ffe..00000000000
--- a/meta/classes/blacklist.bbclass
+++ /dev/null
@@ -1,20 +0,0 @@
-# anonymous support class from originally from angstrom
-# 
-# To use the blacklist, a distribution should include this
-# class in the INHERIT_DISTRO
-#
-# No longer use ANGSTROM_BLACKLIST, instead use a table of
-# recipes in PNBLACKLIST
-#
-# Features:
-#
-# * To add a package to the blacklist, set:
-#   PNBLACKLIST[pn] = "message"
-#
-
-python () {
-    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN'))
-
-    if blacklist:
-        raise bb.parse.SkipRecipe("Recipe is blacklisted: %s" % (blacklist))
-}
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index b36a4ffffe5..f6894f3ab56 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -14,9 +14,8 @@ TMPDIR .= "${TCLIBCAPPEND}"
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
-INHERIT_BLACKLIST = "blacklist"
 INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
 
 INIT_MANAGER ??= "none"
 require conf/distro/include/init-manager-${INIT_MANAGER}.inc
-- 
2.31.1


