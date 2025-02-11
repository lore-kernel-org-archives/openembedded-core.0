Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B003C021B6
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.127])
 by mx.groups.io with SMTP id smtpd.web10.1101.1739286068172146538
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=8HeG65gE;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.127, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy3zMRq4P0lF8BUNYTwZTw8fVvHr+spH9vgxePaKI0xFxrOQSBV7mHu1YylY+j7eDsmB2DGO1eV5TiN4DjxLqCQIhiMduqqxoJDKHQGBrPNOyGztnr56KVv4TWOHZAAD1nY1eFq3ybmaFEsPph9yH9dYVxPY/s5Zk38L7AcQg+GWqUB5q3kGsEz0NnoWHaVEFU+a1UuygiCo9Coo1vPfelg6KbXdBmzZ5EcKBKtxfpPjc1oYVmAWfJq/7a41fPyvcPlakn2yQYtRqWQ2emmpSp3stg3w+Ke46D6mLLrGxKuxqMYPcrdv1wz4QwUNGyZMLt8WN12cv5LRVGE96Wi8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNQSq2TZ5fHV3TglKJy56roaGAubbivjiHE5kUTXXiQ=;
 b=qSSwQFrN0iyG2izL1UyteG1tnM2SA7LksFCTql3BtvYzprbH6PZPpNbWkwtg71Oa7+NYBPKv1llWyjMXcTrnZTyzbDJPUOUE0AW2OZdUBmV/3H1uHOElgDgtLx/eXA/RwjGvgQ+opQuqu2lx4Lh0dXqZ1ElxNUAS0CgcLy/By7756GKK0KFbwuJk31rL6/pYJ73Sr8VU3aSsp3Okx+ttgvtYgzIh8SjN8nL2VpWKof+jGiov8sw5g8lBbxLOXGmP5q5/ZpXC4uglxXcpwWeu5FY8QPTEw3qUApTXaKpw2cexqZvjnUXjS/uiSTI9tXN0e5OzWx8VI7YlHxDG9xKhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNQSq2TZ5fHV3TglKJy56roaGAubbivjiHE5kUTXXiQ=;
 b=8HeG65gEEopfpsMRW5vCJNUyikRquvl2fzii5AVfGvQNfgcwQEXAgSL8zqofxMK1lF4OGKoGdmGmp/M5k5v9zrw5DS83EWbhk16bPn7z2B0HAUuLm0hmVWFxGe6o4JSv/2VqflwKz6JoC45mfn2PRi5EmfKTsc1V63zxPGjdp5iu5l6ys37Mnmkm7xNIFoy+NymslTK/du515cpLaKmNNbRy/erkSefmJAa97Lt//VBcnHWHSmNslJFvLrbHWkNYQ6l6mTCblQHa18HOPpx/wAfCRrqJgUo830hfPYeFBS6uZnfOvepaQage9qpUVG5FXSTa9fiO2nMSbvlJNzrUYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:06 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:06 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 29/30] [DO NOT MERGE] recipes: add nucleoidai npm demo
Date: Tue, 11 Feb 2025 16:00:33 +0100
Message-ID: <20250211150034.18696-29-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 301ee0ed-3c91-4458-9fcf-08dd4aace59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+8+ELaMJXmpAuxlVTqoIMSy5eObHDb73x0RjEdgwuzW2SSjSSdXexwQT304c?=
 =?us-ascii?Q?s35Inmt2n18rgbcbxHfv6EnmcDX8DTxflahfANxvNpYVI1ruSsRijH1uqb6U?=
 =?us-ascii?Q?E0i1SW81DAq+nFCd5Qu51lesuhOdMaNUqAb1XEIO7AfPDgxsbWum6L4BcCTU?=
 =?us-ascii?Q?NP5AI1EXIXD1IK+qBGND5hxHv5jQKaCcee4vGOdWbtSxs24Qbymry7dr5oub?=
 =?us-ascii?Q?KkVd2DqVzHQk0hngmsYeNDezZsFZjPj3sAy2yftp9zJvS6on8rzGec1UPy1L?=
 =?us-ascii?Q?q+2aZs6eF03BPLfZ563JsQb0FYfNduQY3BaI8MrsWgLrsXw53WbC4Mpup77z?=
 =?us-ascii?Q?HekcOmvkXiiE0MDrhTFsXBDPyr+1eUJesXQuQag6StsVrIGxithn00gyWWl8?=
 =?us-ascii?Q?gwEDd+5iUz2kMnNapBjZdACk92dlt1/lhh6fjrqbYZcbDoIX0e4OvvPiTXsp?=
 =?us-ascii?Q?tSyVBwzwATO9pA3Pko/T/MvseBcQHzISGsQ8VHrfo/A9UArnJXAtbCqwXqCl?=
 =?us-ascii?Q?0jF+67yyz0B4myPYhwh/m81Oubp/BlyhSvc4eYugauY03rieovsyGI4Vlz+2?=
 =?us-ascii?Q?utk0BZ/yi5GbbcEemxjMhn6Ykl4csij3xWdgnZ1iQE178AnxZUl1fE3inkRD?=
 =?us-ascii?Q?YgbbYh1m/J/kOcX9iYkoTUrYxyFeFOHb+RxPPWc0KjuNGlFx9BKmycrS0rqb?=
 =?us-ascii?Q?wx8tVQJxeiALGK4l2p0rGQYQ3z5G98+59/AFbyDksneF4M9ayRwZokvHpqZN?=
 =?us-ascii?Q?UW0pRBRHRGrPR/UR+2RIPxzl1Upq9eTUt9gIzSHrhHaB817rn9GjYrB8N5Vj?=
 =?us-ascii?Q?fAY+WIetSN0iqdpVH/LIWukIW4+Cr4FtstDX99On1CGKdgEpJGuo0izuqMeH?=
 =?us-ascii?Q?PuO+vGbX7ICyhl67Z4dILoJn5V8HfVF2taTehdE4Yi6qLQs/95WZpxzfbqvS?=
 =?us-ascii?Q?yTwhtyTBVbVUJWV5SBPwHu8mAXprnaizuT3IV+TAKl/Q77yp67lZtw/JH3+U?=
 =?us-ascii?Q?5JsdWWUhOyLTf0tblb1GJ9uOt8sH16rSUAJ1lMi0NxvkiA0KzVlWrpumvWIB?=
 =?us-ascii?Q?6lMyfB0uUXRgN7yJuMhRsBNOUl+FXhoJexS1JnMl/K+Gu859nFdOyj6NvNik?=
 =?us-ascii?Q?kgHYJwbkOMhcaPssjxvG7IxyDlU9PAH3myV2I4e6vesNJrvsQbqGa3H/WRor?=
 =?us-ascii?Q?fDz5ZiGADAUun5MeCffExr6NvSFbcLybOHiRjD0S1p6J+T6sJc89VUgBrYaI?=
 =?us-ascii?Q?V+Nzhawg7Ut1ydGpnDW+tiH+qRACghm5GHIFajPKcSswyHwLbMbHvNoE1E7z?=
 =?us-ascii?Q?wgQwcYuOKUC/CdOuejH71S76OzwsvPW0fgWiNH5MChPVKELyQNSUl2JV8umO?=
 =?us-ascii?Q?kCbf+oWmKRKJEFOYpiC22Rop2GQc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GOKp+iMEHFAq++Dj4PlulbgHNZGVe4N6b1nYvsCjUgwIHh6hrUHr5M9ScSur?=
 =?us-ascii?Q?tRF6fkiuepEOvuCMoukNcySWgxnHd3ZJcas58i15owqJAmc2A4sfhiHweVsI?=
 =?us-ascii?Q?um3beFZ1j/uBXABQjWvGqa9WpXBNd9eVd2DppKKmVtjOg9n2sWu5tz73PzPg?=
 =?us-ascii?Q?j3mwOK113wxuiNCOv63LrnVNNOT6hZu/Yc3EhIXYq8fs8355YOWliJEQ5LnJ?=
 =?us-ascii?Q?6lq8g3ObjivwZCXzKJ10CesKw0aQdZE7G+ZIJR3jESsl3z0j7mNJX1WCV86E?=
 =?us-ascii?Q?Z7VIZ5z5kUEq4HPpPoMS3nA/1/tZBH0i9iabEP5QAc5Ho90t+ji+94Om9q7s?=
 =?us-ascii?Q?1k9w4R5IbzAJ5tD3pfH58zY8aM93KwHqW0SSOWE5qQTJ/L7mzjlbZztNqOSO?=
 =?us-ascii?Q?AUL7eAzKmJbwm4Rfvz2b0vp2KvBYIdqHVSeH6zalYviU4eErkixHC1Q4JqUc?=
 =?us-ascii?Q?GT8a4OEXSAnZJy4DudjLHS4ONzd6LUWZHrsRWhbeIQG6BpXcgkXc7dRXM22g?=
 =?us-ascii?Q?GHrLAZwg5aTvEeV/hLUTV4GthEX4c7KzmD9AGc4NbINSak4TGvie96sx6E1W?=
 =?us-ascii?Q?ciyPrLDLjNd41zpZZcUdy0GfrT8+HCPjsH8xtHZVW67DMcoQaNXaGDAZxs7q?=
 =?us-ascii?Q?HdF0Cgf1/nh0H5xao89asuIOzKMHX/q9tpvVM9OKZhQVqVmiD/ZS8WPW7qXv?=
 =?us-ascii?Q?8cp2l5F5/Mp7mANZVFenuDK9ZoigZpRM1bQMzj1obXm/9/BfKRx86jF99sqm?=
 =?us-ascii?Q?57IZLiZCTz/wMFMFze0y8R1LnKIsr0ps2shzs3+vLKGud+9zrVTr9tPhMcpq?=
 =?us-ascii?Q?dpVXWqYHSXdH0APjhfbuxLWJv6owjWasSRPXVMu8xk3vJm2RcYiRyyAGCIIR?=
 =?us-ascii?Q?yqtGZknANCEEzvjXVcdA+XnfRUOGY1vc9wIXa3K0sb8GtI13mp/i/g0I3yNk?=
 =?us-ascii?Q?WKuRc0UPPfJgWrwzzUBafiPn44iZUmt8Sl26J88/usytmw6ARPLx6oOB0Kvt?=
 =?us-ascii?Q?K/F5Mk5xtP/2UNm+1JOncCZsLXmdLMBlb7a6XvPKL7uJBgWGv4ebngt1PwGb?=
 =?us-ascii?Q?CugLl7oOiVJftc/vYM6nfPH5j+qjJ5cGPByadPzCEzm8bEsp3feJuQbaokZk?=
 =?us-ascii?Q?h6YwPbHGnv1PPSIZJ05yz1znqcSG1CQ3m22G/qnyyd7j7Vi4qXiexyL6Wn+D?=
 =?us-ascii?Q?LIe4aBzMmsNUAqECWB9X0p7cuG9lukc04Vz1TzlD44gfVv0xFjdytffCM/Rv?=
 =?us-ascii?Q?hkF5hxAQte5tkqSlHfAzx7uXM/TuZV8VwYhPJ5u3kjWwhNN3HO68BeZehQza?=
 =?us-ascii?Q?LxE3qcub9StpNDMCvkZrMMQxeXxAXYYfO1KASyfTkNH+g3EqEpXzywbClIBj?=
 =?us-ascii?Q?gFTToOLdQ84B10cPcyVirjXxM+7Q+VWUcbFLsvJimgqyJ0gJJejNJ3KKOPLs?=
 =?us-ascii?Q?W67vDn4OWCu9GOYbD9ALUtGCGIHTUi6vv6C6aBiGmG6FDYWuoEgHO5Bk9aZ+?=
 =?us-ascii?Q?d+pwB8VZyrxx5q4ohffxWXDpaCLY6ul0RTKx7BCVFZKpk7rsU9pHOSRVpBTT?=
 =?us-ascii?Q?T8FqsPMd1q132eIQwIVG+St8bPcqE5PCETMKSulq+HpInfPKuHy0NYcnQz36?=
 =?us-ascii?Q?Rw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301ee0ed-3c91-4458-9fcf-08dd4aace59b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:01:00.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UybCQx/kBRvBBGtumdGmR/f7JzFjHnIx2lsYEylIwvIxCXt0Ue81wn+3qEJTiQ4/MydbLTPZKGwd3idPMyq4AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211154

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../recipes-support/nucleoidai/nucleoidai_0.7.10.bb   | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-selftest/recipes-support/nucleoidai/nucleoidai_0.7=
.10.bb

diff --git a/meta-selftest/recipes-support/nucleoidai/nucleoidai_0.7.10.bb =
b/meta-selftest/recipes-support/nucleoidai/nucleoidai_0.7.10.bb
new file mode 100644
index 0000000000..c4645a73d1
--- /dev/null
+++ b/meta-selftest/recipes-support/nucleoidai/nucleoidai_0.7.10.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Declarative (Logic) Runtime Environment"
+HOMEPAGE =3D "https://nucleoid.com/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db60cddf6d0f2277da4bda65332fe232=
e"
+
+SRC_URI =3D "git://github.com/NucleoidAI/Nucleoid.git;protocol=3Dhttps;nob=
ranch=3D1"
+SRCREV =3D "f1d480bce6e13a64cba29e31d904c5559a0b8f82"
+
+S =3D "${WORKDIR}/git"
+
+inherit vendor_npm
--=20
2.39.5


