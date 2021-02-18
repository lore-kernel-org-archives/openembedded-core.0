Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.81])
 by mx.groups.io with SMTP id smtpd.web08.4388.1613638725237996801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 00:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nNWTUG5E;
 spf=pass (domain: windriver.com, ip: 40.107.100.81, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI7Iy+/ipGCmyfdXsW0l6TcFkq6Z8fueCALLgUInpIHzBYDEFntO/ldh4h3GlsLn42hGGDMVWmkhF+V8R8CkMjemk5DLeHxvDTw/AsHQ2D+Xg4L2tr1VnZnztr6xswvrnhN6aViRIe0e/Sy5jnOrxecNqDroiw5LvaMdLfaLg+QSXVYq5g1XIijbcOT/gDwXG3b44skt/KDOc6getl1AAuuA+HWtYkyJw79yF1zLX2XlM/o78Q2kPu31x7RqUPM5QIbf5X8VLq3JtgKGKVe3j5TxeWCTArWkVWVxjmNgRlr7PuaeeXLuL9vXU6caQfd5T9jql0Gq5Z3G/oENi7op9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr0YUZPYLcxg9DO67cXOnl+2mSTKhI7hsXsREsqHgPY=;
 b=QqxjG9wFzy6ou2+wkYzOYHcMbTcAERp4+RLrn86b3wRpQ2Nj+8WO7elBHe41aVaKMGB1WqVQ5kbxMlF7yO67OCjMSuvMh17lowlnYc5NIZlC1lMXTPdxAwyfCqQxLhT3cFcFQoIpBRvfAS7GmUTAjZgnJ3i8oyceLf406nFpzd/v5Bqs3s0dppoqkq+JXvhueJTUQUdrbyQfkfEGT9kRXy76nYdwy3yYIwMbodIENzi+DgGOiDLlwarOHqzgs89hiQHCxEaXZr0zWA9O+aeSPSWLgmdH1wxxxJ6L5hHN0mV0mbzRaZVudf13TL6HNpvlsloWpFT5eYx4WwkA8NJlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr0YUZPYLcxg9DO67cXOnl+2mSTKhI7hsXsREsqHgPY=;
 b=nNWTUG5E+rg/VqsnwY0gLwMTTz9nTTlAJdUvIyaaIKSn8e6gGXhLSkKQ+9noVV+uQng32drYUcSrQeIonTQJ7nF4U2xxRpAEyK89Z2I5ycfpEVQ8uEGAw2T6FpKvMQ9YyBPgr5IUw1JV6QysqXccvX/JLtc40nmfcbcTwR0Ydhk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 08:58:42 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::8c9c:1dc9:353:8eba]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::8c9c:1dc9:353:8eba%7]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 08:58:42 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [OE-core][PATCH] mesa: Allow building the iris driver
Date: Thu, 18 Feb 2021 16:56:17 +0800
Message-Id: <20210218085617.11205-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.5
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To PH0PR11MB5175.namprd11.prod.outlook.com
 (2603:10b6:510:3d::8)
Return-Path: yongxin.liu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK2PR04CA0059.apcprd04.prod.outlook.com (2603:1096:202:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 08:58:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d45105dc-2f33-47dd-b2db-08d8d3eb6429
X-MS-TrafficTypeDiagnostic: PH0PR11MB4824:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB4824540930F6A225D722C92AE5859@PH0PR11MB4824.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sp8r2ifG8IVoPJmn2y5HUNy6TEk8cokwV8EtOQST2mx7cVlfM8LiVBU8uBYvdSDPo3rrc6e5CgeN+LLLkZucViXzZ/PtRHLXCMYFc9so2HtKFbOnGFQ/OIHvat2qusRHmEfpCDUENAinB7mlW9/Es3bUAmPPhVd1cRL7b3Tk27GqxwbPwhMHiJmLT6ZTBbgEp9MlQdFUbuY6NII7OXU655pE+S0PwXBRcuA8lsRlAMaQbQ2Ac9MIPTiJwtG54rWnLJBVi9YfqWFVbeQbGJ+qIQ+Knu5VC/5l83jPA+i0uj7vlMjAKf8Mm/xmExmpBwpV8kIAOU3kBHTpkk+aWRw+sqBcdF1BtYIA5o28FbmqNIIHfew0AMH3ksik6Mjqkq60RR+rAx4EkLpbQICrfwC9YEww9pBpTVCO4/1nk/FdDA1NwwXvZn2O9RtvJqalQ/KHZlsY/m8gJ8A4MBmEo5DH+rj0WTTX9fieP5f46vcj2giq5azSJr7njqZTEQvWQY587clzGycW3gF/+eXJPhukZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(316002)(8676002)(16526019)(52116002)(36756003)(26005)(5660300002)(4744005)(86362001)(956004)(6486002)(8936002)(186003)(6506007)(2616005)(6512007)(66476007)(1076003)(66946007)(66556008)(44832011)(478600001)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?QgslOONfThRCIvUO5hNyVT/MhaUjEvziM6qWyBGyEwnjnt7rQ9VgB9AAYSLc?=
 =?us-ascii?Q?OyGb0gUqX+Tjw+M7ziCBYYCp1+XJ13/WSkbfjgsKP2WMjh1LekmZGn6JqCQ+?=
 =?us-ascii?Q?03/ZngBsQ9f9CXZ+it4z7BOI6aqBwLKdGOnr85dObSaUfsxheZMj57mTr4UR?=
 =?us-ascii?Q?egSHVwFGfwRvFQiyzNuuS/FXAKzhoUrPZj+nZetNDWAPOnaTsX56Hcjq6yOA?=
 =?us-ascii?Q?rhsFkPSlflmI7eYZCn0dOV0wYhw52ncMMCr0uJNDHaKYEC/htIizWBJYxpcv?=
 =?us-ascii?Q?TiELftcspyxzSFAS/VbAhsfIe2TBqWIAV7dIxiA14LV3IiQ+vw1TKDXhmYkM?=
 =?us-ascii?Q?vh02FkacMncZD+UvZtBGFBINOsJ66PMaki51Lg7ee1+T99r2jAgNilWsaXf/?=
 =?us-ascii?Q?r3Pv/5IphxSQ63vdKVSwOwTu5TQNj/SjVu04wNGzPxFKwgsP5yEQpi2TIVgU?=
 =?us-ascii?Q?ipBKGQfUk+dOndrBWM2obWCBsa/DXHDF/G2kjjWzw+FdzePYBzT5Ch6K8qmw?=
 =?us-ascii?Q?frscrvkzntOycXOYCabCCSVJQ57GhxJCqFov/3k18K9V8oH6cWs5WQCyxrTF?=
 =?us-ascii?Q?HZ2hwYZtu7p022GnF+MRFVw+3QqsCq/KDzbOUtqjsPSePR22jkk8tOPJJTdR?=
 =?us-ascii?Q?J0UelweR0s++POGFkTfzPg7tvPLoI3tumK2oeolZZj1NcIbSyrLS/UVRTI1a?=
 =?us-ascii?Q?8mKGzukyi7RXn0PIC2WR2qRvRi+zvIl+BusWYMtpqU63W33C87D7TDsjVFLw?=
 =?us-ascii?Q?Jxk01AHpK80+Zx5v/AT2bybkcIdNYDY4iBzkFBPp1UHwLdGGeWGekM9picNM?=
 =?us-ascii?Q?4YWt1Przc1dGyvzM0PnPBNyFMpeePzAJxfzRisNZg/I21ZDY+xzdZWNb+swG?=
 =?us-ascii?Q?VgmCXRpsMfVCVg+u0PGUr9sEiYdT1N3sNaVn9n09LpfwrFptmyhaiYDzRFtI?=
 =?us-ascii?Q?hDKUiU4OaAD8Wb1RivU5AP6QoO5V8V5lvn5vKhjKztuuceQxq7ArEvPiOyo5?=
 =?us-ascii?Q?XYR+iIBaYSruebVduidyemy0q8I7YDFUIjNsfS2UvunOXoPt/Wb8PqQKIX30?=
 =?us-ascii?Q?lSatfClB7YRKTNrhwuj+LjEN2eQx/cUtI0InS0OCKDOVvHAyYREGz4T3Ko9H?=
 =?us-ascii?Q?VOm9bW9MWrvvSw+9s1GW4+VbWmuGMay7ql8TPOv0oorDQB9dhAasqH0lSjlL?=
 =?us-ascii?Q?aOWn8TPWFt4nCQWS4RHhoXgrr1uUOcgSPeHn3Bi1DDJ+d9f/3lRk7QMcRff1?=
 =?us-ascii?Q?O3ma5hrmbtoBKaIx94EPp1qUK07TmHtmBw7msXoMN994DE/TXNBHdTBZokJO?=
 =?us-ascii?Q?AArydv9dzBkHCK7c0jV2NWEG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45105dc-2f33-47dd-b2db-08d8d3eb6429
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 08:58:42.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVoPWdp/KO+PTJFaeBibDkftJpAuvC+J+8VKO0FMrPmH6BAmXq4v/T8x0/Gg04/FvFm7qZYMpZJElSqX8mPVJBHRb+mJ92Z0n2t05LRt4Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
Content-Type: text/plain

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cb075a8b89..72e22d654e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -168,6 +168,9 @@ GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '
 PACKAGECONFIG[panfrost] = ""
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
+PACKAGECONFIG[iris] = ""
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'iris', ',iris', '', d)}"
+
 OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium', 'classic', d)}"
 PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
 
-- 
2.14.5

