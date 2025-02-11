Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDD0C021AC
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:04 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.114])
 by mx.groups.io with SMTP id smtpd.web11.1129.1739286053053355666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=VAgs/tte;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.114, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOys26NMIroE/SM1bH+Xt5E6lf48db9JrkDR6qSvP75koKj8GXRNtSwq8Pz7Kln8NGakkv0eGI+RKWFkC5uNmWGDM/ESz91k3AeB9AjJvh3bmu2XuzXUj0Y+O2k02FLKiMhOi+aAhyIt6bhLVkpaRYO+laU/56Ug79pdCDRBKxd4kKmiKUCO84UiYKq/1aIq/cyoMvd8Si/JoFLUUGSJSiKmdUFmkkN4ujj3t7Gb3jM4xI9N1HlDF3UvUsqwDpZ8tgUG8FhJGNAYM/g8JP7d4Yhy+K+StAvSxoc0aD2DU8a9cYam0HgXi1ur0KiJR/tGahu7/zY1II6rPgBSmjwTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ55PI5H64MUtPfX4t/YJbK54wWQoDFUwGUw5MGExwQ=;
 b=B41KBYY6st97ByOUiNH+1ecgE1O1IUgGh+jJkdGz2JUvA8094bCp/q/YajU+MpHs5A9WHUHtkSPGlBXd8LHJWGtZ4Upwm6MK+bALNk5j9/VyH3Y0KaB4en7FgSFnlQ/JnDJDDUaAdOUT9DHzqpzE3AH8K2Rdk1uPopSZ9rhO9Lr9+jPmOWDOePUIOGDf4mZAWPlNl0w7ROoKn+h9wpyv6nY2fSbPXcd8/yV4TX+XWjrmVX1xlmpVge9slEyKZTonuR7eGXd53r63luj59PEEivZRc7ldv765sr9r9rzrtP46Ob42dhQn+KuM/DLlVpraPDIiWWjiXlQUGbtXlotd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ55PI5H64MUtPfX4t/YJbK54wWQoDFUwGUw5MGExwQ=;
 b=VAgs/tteGeRaMRkTcfwV7I+HACvAUyzmtCHAr8zxM6qikysBmen+DDN8VBJNpWJxYDULb24oveGZd9cKu+CoXq99FS/WSFDchiQWt07tBopa3fvq03qlk8due5sRWZC1VbNFzsurMCIn72p6SKQzmXYtqVYq0itouwkHPEpknPZSQtnSWsktWdK+sb1U3rlJ38CerYwi0V19ONUpmjE/hZ0bnH9KngEMbqBWLM2+H1iPYp0gX0Hi15n5ABmlL6Aw5bTAH8HhiLFf2vax5Ph7x+l5P83gAqQjfC8FPo908Qqm7lCkF0yMF3ZfVwH7PSpHEIHnw/LFsll9EgzehYEMIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AS8PR08MB9840.eurprd08.prod.outlook.com (2603:10a6:20b:613::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Tue, 11 Feb
 2025 15:00:47 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:47 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 01/30] classes: create-spdx-2.2: use expanded FetchData for downloaded packages
Date: Tue, 11 Feb 2025 16:00:05 +0100
Message-ID: <20250211150034.18696-2-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AS8PR08MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: b989f475-19e5-4a39-067a-08dd4aacdd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MjnIFxe3fRQgc09ojxTPrhqKI67zdx4JPfIrd3eB1MlDPo5fi20goaySPPxU?=
 =?us-ascii?Q?tdvsDQxyapI2mBCj7ravGyWX+FWcqW4u/uq8cIwO2eSNK0nhkTG2uLc/OscJ?=
 =?us-ascii?Q?G2UaRkVFhyELudyyMSJheS4cpguH6tfFzdoGSS9i90qxSWzKU9EG1BwkOtXB?=
 =?us-ascii?Q?ldaGEoocit8Yxn2bFovScXlIiiYMv0gOpwAHmqctkVQGjGMYk657OiKLL6eV?=
 =?us-ascii?Q?hkOjZX3jLEMB+jxHp3EAUEbnsFqldjVCGxQCs8RaW/NpGdJX7cRqQUF6002S?=
 =?us-ascii?Q?WnK0gGqAHebnHEe9KBSTNQ7oZTkCnuL2bmd7nFghjOqe+2k3shwgGyltfnIw?=
 =?us-ascii?Q?L6xZxbjXU4qoTSGywiDUj7td7kqduo+n4I2Fw6X9ge8FHkI6uDCuzmB+X5om?=
 =?us-ascii?Q?VkGk1GU5ySJ2MHzr2KAxbsbsK72hS5r8PSTg5wXeEWd3kQRzFfOE98Kwn7Fl?=
 =?us-ascii?Q?3ZKnX8ogdWsVZFF8BD79NZoTsZ7aGsd97IW16RU9WU0PPlh6dvGaHzb1Wj9Y?=
 =?us-ascii?Q?WvnOrjXgPU17lkvvwzoV4MLolhCI6iKNasMD1hAwmWAUPkjP87FZ8bw7fr+a?=
 =?us-ascii?Q?IyFeeGfVuxIl5w3XWHJesC3R9gXXdOVRAQX34v1aj4bYTpvk+2YlcB3QrwJ+?=
 =?us-ascii?Q?h4MXEmeNEgfwLN6Ut5wDEac6ZsTvPADotXvmA2hjyAsNtMl7NI/t+qAIQuW2?=
 =?us-ascii?Q?fGuAGA7ny59VfL/bml8iQox4wIc27C/0gyMLmPSEgWu60GIwn7Tmr9tG/W8f?=
 =?us-ascii?Q?mSQn7zzmYoFygkSBWKnS+N5KhcIFY1Prx0xzKEQQkkRIWmW9ifAQSZsYmkXB?=
 =?us-ascii?Q?gj81Ht0xKv4mOjXWuGhP0JEALvT/IONdpM6jfYxXsuyVwHu+qHmo94moNDr6?=
 =?us-ascii?Q?fOi2VchW5IMMchTTdzr4hvp7xWqhI+3K2tQFoY4RkvoXijrmdL4a5uG79OvH?=
 =?us-ascii?Q?bx5QazRetjMYo3333AdO8oMsT9gnsAMq4SJTmEFsd2LTeO7Ne7i9ClS+IT5R?=
 =?us-ascii?Q?1Jbq9pGFSZZAkwNNHae0pHjbJzVIi4a9m4haGyeNyW7RUb9iNH1xdovnwy1c?=
 =?us-ascii?Q?HOSUjh4LcElrr2BrTGpNapfkrkJuiA13QYmtlVRyME2djxMDXmd/V2ht3sUG?=
 =?us-ascii?Q?y9G7/H8Z9Gza6dCSeGeK2QXwYIA6Z7WF4pAEVNNRomwUjRYUbUMKUI7GiU50?=
 =?us-ascii?Q?ckIRkcJgVluxuXTK4SH6w5xcqgeOkHvabvsoYZ3tAQBsUa0TGFYm5aTY/ied?=
 =?us-ascii?Q?ZQJWcBNaOOIDgsRhJQUVCKlkz/LfKFrlycgEN3DdyJT/mQu4uOMseHTqRy3T?=
 =?us-ascii?Q?SVsAbBBwURVFC1Kil/bnVN1yd1fSnwq2md/qmdJ/O0KolqDThjA4JMR5U42W?=
 =?us-ascii?Q?CmLHFh5QtgQSK/8+VN7K0uzZ1qw7En+QTaA6jvFFQLnYywcUdmWOe8DyOjKM?=
 =?us-ascii?Q?2Y+t7QsE3l8I+fz2TMkhMM9T726hLsBI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g7D6tupjw811vA6KUtxdahgDvNIzdlN8g4kWLVQwrT5FUONiXef7m7A9dUeU?=
 =?us-ascii?Q?0DOCHUCO5Zp6ib/xfDJ9bIg/HNPO9J33OfDD+22/KXHkBkyo0QyL+zXzTezN?=
 =?us-ascii?Q?xYOi4uZzTrn0JrBcI1dqkAmih5jLgKnxUiGHAt3Cu9GOGPM30LVsa3uAzi5C?=
 =?us-ascii?Q?nlnikRo57MMqSQG8mfO/abxJHKosnrWAVUdNMkZKznPoh/nFsE6Dx7XRICka?=
 =?us-ascii?Q?2/qwIrJnx/AWXPrnm6uvn9+KTLRC7gO1I+hH860PagM22LuHV8XCnrH5Yc7e?=
 =?us-ascii?Q?lbGCMepaaEUei9izgFyoGfh0wPki1I+9e7Jxh6DsgBn4eVRR6CBmmk+/RmSe?=
 =?us-ascii?Q?XXLABLaXEB5Dm/8it6PPNFOufbNcgQ6+UzAlmbe+YxjqySHBWizVQocEQQOS?=
 =?us-ascii?Q?/AlqFteFCerRub7Fbr6SVwtbjLizckv1IMDJ1kS3yXP1JgnvZZCJo/gTeO8Y?=
 =?us-ascii?Q?HzDDmY9Z5Tna7QjbAOPz9khQvbgyfoEkg5A9F8Qms2x6QWdi659ffyFzIzH9?=
 =?us-ascii?Q?x1ZGYK+TdXMzySx5zax2/8YCG7r6CsJNjfIgkCbT7bbA4S+KxYZ0zETxlZXo?=
 =?us-ascii?Q?CLVcq2TUX9vkAB/1kn+vs80nUbQ4mWkZ9UTzrI9boBX377hyXo3L/cUZmszX?=
 =?us-ascii?Q?fFsNXdQ61Uy5TwzYsCOSMaFSoVzv7O6uHGeRjjcR6DuyMaIl2lKC2Whv7UA+?=
 =?us-ascii?Q?F5eBhI829P2dRtcZDAzNE7K2Lt5Bhca7lB0bUs7ymcTDZyjOeEVh8IQIZEpC?=
 =?us-ascii?Q?WCmmyH2Krb4pBlSGzvWhU7idVFe50YWmywX4fCP5fcBs6o0bpLSaY4BggXC2?=
 =?us-ascii?Q?/j8m7lbYVYm3RFQBMR2DI78M7O4yabrswDfuH7HgvdBxDZKe0Ra9AAOzzCkw?=
 =?us-ascii?Q?1MZacFvqwXrxTDtatUDMox2zoPghU/IuO0yKAHn2mDVm2ju7xVAchPeIjuge?=
 =?us-ascii?Q?X6c/XgU2fz2bKuqUxgLJ02xf26hERG5OUS1h3gAwlFDPwu/14c/tjfrmCGK3?=
 =?us-ascii?Q?UFbydzJdSq2w9wj9fPwFdbWFFbvPhVs6ldrv8gj1Juq/MUWtHHGk7e04KqK5?=
 =?us-ascii?Q?IWqiUqN2vJvpn3oWU8VY0+M5UVcbpFd/juPrO7Rc97sKvZc8SPcZ6uuyGg69?=
 =?us-ascii?Q?KDVnfFfOsG4mKPAfEufjkNkzieA8WZ9xAM+1VRjCWJiUMlph2Vd09EOytkzq?=
 =?us-ascii?Q?50BF3J1Z41bI3FnPHDW1Nw9a2CTtQCtF580MXav8aii4+BXeoUyQ2VQ6DTHd?=
 =?us-ascii?Q?uq5Jk/KcWkV/rzquD4gG+eUyOviCX6WxFFxCyRXmv1iUojdtFZN/6h7wyFhO?=
 =?us-ascii?Q?5WpWhxqzT2sg/5gX1UGKWU3ZSDr+AjguBmVedrAu1bMPWQlDU66WgKdZeF7E?=
 =?us-ascii?Q?B548TQW/iuYxQfJlir7deqR/zD5q3wvAhEZD3VGepKNsiXnp7WAmREkcdath?=
 =?us-ascii?Q?Tg+WD2tT/lahYVwFkBHet6yiUggeU+RIlsYDD3Ig5VbQTDhfLFSsf+WomsKh?=
 =?us-ascii?Q?sV1Z1fB0hkVEV3d5xvyep0tXx2azQ7ywFXC9lg9BcWXIB6OvA8Gql51h1jSY?=
 =?us-ascii?Q?CU0OD+fjACulEyAl9NXTDQEyArJXCyA2efyHXw9diaD3yoqr5bBLvND2RVF/?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b989f475-19e5-4a39-067a-08dd4aacdd04
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:46.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP7Ht/d/5Nd0IWYVH8RXUqfsr/d0uk7WTCLsDjt12rG+VjrDAKdHnaocspT+ah6GFG934Ti1bWs6rfDw3X2z0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211130

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Use the expanded list of FetchData objects covering both the given
SRC_URLs and any additional implicit URLs that are added automatically
by the appropriate FetchMethod.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/create-spdx-2.2.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index 494bde117f..de993ff5bf 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -349,9 +349,10 @@ def add_download_packages(d, doc, recipe):
     import oe.spdx
     import oe.sbom
=20
-    for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
-        f =3D bb.fetch2.FetchData(src_uri, d)
+    urls =3D d.getVar("SRC_URI").split()
+    fetcher =3D bb.fetch2.Fetch(urls, d)
=20
+    for download_idx, f in enumerate(fetcher.expanded_urldata()):
         for name in f.names:
             package =3D oe.spdx.SPDXPackage()
             package.name =3D "%s-source-%d" % (d.getVar("PN"), download_id=
x + 1)
--=20
2.39.5


