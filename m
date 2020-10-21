Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.66])
 by mx.groups.io with SMTP id smtpd.web08.9108.1603272262190861185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 02:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YsuzAxaB;
 spf=pass (domain: windriver.com, ip: 40.107.94.66, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALnU/SfNWxdB8ZQRVM8Y777Xd0UV90FFXy4NT/87WRweLe+xamawfDyNIyNYX0Ubph3RbOGlubMUxmaOM72wyCNb0SkOMvYnMpmPDmBjrzqn3VLQfgCaaOY5SDW/LINlpRcGfK2bvt18iR0V1UpPxjEArFP3MjcIHcmgvKUzhhI185N05+KmHAHuBTCMRbsNS7aHB0jKfY6h5JmkF4oWnVS80inKB9beEsRpxYs+Fz6ZQRe4S9eiSt2DcVwd6llsjyX+PqrjlwtIccZldslXJVKLam0x8QgdaKJh01sOBeia+tzXtJLBlxiOHAPDvnAEUw2rd2RPNqvCsLMgiB7bXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGPZj4SAf8ZeswXVOtGlfQbOwgyCmLotSnqg9tBjuEk=;
 b=nSD8Nu/8G7+zVcxGJox66zJI94TZ4eWolIwX6ebzKLg1Lg1iQuRCKW+mqIPgA76Qt+35J6bQmsIn9m+Q9mugqfPv/qi75Ps6e28FWmnT3bR1Btb7HqFl1Zn+BkxG4cycD3GT25JevfQJ/fJCD33jP9WL74Y98+2Ci3G6WLoKTS2nu/5DL1kcIwLrsVuDoFe0jUmcd4MlxX30E2EueinHMpkbuZYG38WYFcIkTrICFmt5+Q3fr2M58GDd9nvy9gtjOLQqT4wsPVUy6YYYC59aTn7VXYJeknb6J1GemA1riF/lbLhHfeCBAUSJLPjpiusHbcHwEMhqEAaO+HGCVJ3ugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGPZj4SAf8ZeswXVOtGlfQbOwgyCmLotSnqg9tBjuEk=;
 b=YsuzAxaBENXaRsEFoi2HerRyWbnZSVf3j3+IR+NX/nTHcu7piclVW3cHodRYG6AabYoEfzz2h7wB5A95t+CZsc/5daw4ILmOznZ2KOsAW1By2IAtQrfrdN5bRjFuNZGAB31m4yGYz1Mz/ALvVss5DzXoqz1DBinECNhcRSRLnZ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3399.namprd11.prod.outlook.com (2603:10b6:a03:79::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 09:24:19 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::c400:8b2e:c0f8:55bc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::c400:8b2e:c0f8:55bc%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 09:24:19 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcl: adapt to potential psuedo changes
Date: Wed, 21 Oct 2020 17:24:01 +0800
Message-Id: <20201021092401.41424-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:202:2e::26) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR06CA0014.apcprd06.prod.outlook.com (2603:1096:202:2e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 09:24:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 589a13d6-03d3-4507-dd59-08d875a3169e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3399:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3399C6D108C29D2CCA06B976F11C0@BYAPR11MB3399.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GhpO+5yLWBGYjUm9Lt4Vc4KivVCSAJxkMy9yJFTMDmy0J1lUS7JjyPYrpWJfw521heFkaHSzL68w6TQArY2RjH+J5JmrgORmyGD1X2u8Txgfy+reMsZCaj6QU+oSqSDh5k22jDevTOBhQxejR8kd0/FoVxvda20xkm795hW4IM0KShydw3ERVi5xhyNAoa9r1Kl6bLv8vC7Dk6oNlqdQ+vfRAS4Mv9wilawM8Ex0zqc+BR5s5qa/k8SYyb80SP0nKmSF40m4M2eu0gQyuKotoQ6o6joKtwMlfiA47SbnmyoMgSkEE89DJXMFnvARL1+e9A0UFLwWpSzP4nrS0WCeCGX1bYvejUyTxDqbpBOvboz3b1MyrlHLEBL8tGXL6OF8MiMC/AWTC3gPTb23BwamAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39850400004)(966005)(316002)(6506007)(6666004)(16526019)(478600001)(36756003)(26005)(52116002)(6512007)(186003)(9686003)(2616005)(956004)(5660300002)(83380400001)(66556008)(66476007)(66946007)(1076003)(2906002)(6916009)(8936002)(6486002)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bO4SD0fW6AYYKKQddDYQxtYf8eQrPrLWfJ2QAQO4TVtJVGuaksh6Vy/hu6BsUglNnc/WTNb1t8v0KcbTk2vbJ/FHn+OgC+SzHjs+dzYU7ZaOSU3NyuYq1ItJ1KV/VgnS8al/1TKpe68+EZLXS5zG+VyHfExpx2k8DfTTW5+BM3OEIh99m4pzhNiZos0klfZp7kenajQyNtHdLwDyo/ba5dSfjn0ZsnZv/7oi/gs9QQiUdbuGscT+uKMhyNyzKJxS0AA+QA9v7So1sIrsAPCmrgmh3xmryYrU0kS8ZbZIuq/gKyF6S6B0jWoe+ZLwgD1747Y0hGGrmteP1yo3g+6FI52W2wO9HknrZFxR4FWhdBSa6Ar0a8PCVpD21+TotvCOkFaPdwtQcZ0Jah9dLwoJf0CESIsSG1h8XOuUpCvs+B9ODQIom39fpiOqCzTBNEUgG5xHZjzBEpwKUs2KfHHkQq+Cy+6vPZJBpH/Xh0fs3oiWR0N6e+90uWHnxMg6ihbKztGhR04OQ2DYdKjnVAC9JC+JpQ4Tm9C5z2f1OqhoyfPqElObViyYOzZmmVsu7rNPjacTYVvNxhK23+cj41kUeorlfuGIZHfdqFpsAwqVzFmRZ1LUKwYhFe2SxFwvkqZj/71ENbuVlRTnqDsq/nhk/A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589a13d6-03d3-4507-dd59-08d875a3169e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 09:24:19.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwFD3/32WdcI9RnhEtg1KSXV8XTPQnQ26yHBU0PugenL/wmszrvb0WdprmP3u0gQN8GqB3pj/AbbXKxXEuEGBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3399
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

It failed as below when rerun do_install for tcl:
 $ bitbake tcl
 $ bitbake tcl -f -cinstall
[snip]
 | NOTE: make -j 72 DESTDIR=/build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/image install
 | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
 | /build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/temp/run.do_install.3490694: line 184: 3499214 Aborted                 (core dumped) make -j 72 "$@"

Though unpack tcl source to ${WORKDIR}/${BPN}${PV}, but we set
S as below:
 S = "${WORKDIR}/${BPN}${PV}/unix"

Exclude ${WORKDIR}/${BPN}${PV} from pseudo database to fix the
above do_install failure.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
index aedd96b021..e6feb25a7e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
@@ -32,6 +32,7 @@ SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 VER = "${PV}"
 
 inherit autotools ptest binconfig update-alternatives
-- 
2.17.1

