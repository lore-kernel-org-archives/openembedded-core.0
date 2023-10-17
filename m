Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C9CCDB485
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:27:08 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.214674.1697549217556090878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=a1j0zVNs;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.69, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq6uE1su8Sbqe4toRfaNsOsFXNL2kp5gn9Rbsr8R4xPtGdZkZHnB6h5DXaPirZhIsHy2yK9z/eLw5ZGefprFKsu0p8ElxDT69wyCYrGMFSbflqZiJmqYEhYKI+upgoJIPMgUsHWC9cEsEnnx9Qdctdrhmx4MD8+uGMiDXnxw8E4BdzvMhvZEdRBUwLlZgxzvcu9Ut2aAlbdef6qC+dVT9jg1MMWsCfKm3DEegAY8YrmrvAJ0K3sn8UtrKAzTQKSssaXBt7oVIa+Y6P1MGpOwutqImz3pFxTtozaK5BJqraVybyR1H/SxunQCY59h3FxrdCevlEGOSfOTgjX/+G2QGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7LTMVL3y5KvcqM1eit0/rcSMWgre56MO2DD0PPlSPY=;
 b=cADIiX1Eegaxed0HemEQa7tUY0XVXgDliDrSON8kGqaYO3CUH6WmiUy9NV0ADBkDTBVJ3SMrxPOK19GJItm3tPLBoeWBTi7J6Xt2BZXWlu9XfMuY0xF/K1GdQlleqCZOtsgssLBo/AXN9uwGsRowjJ5dYZoaFdUatqSgK/LVzy5LXVbUs/Jvul1yenivHZqrZe0OohafS7ebHYslNlkw+EQG4fxJ8OJWjh4X8Uo/j4UO5pcRf4ciwflVPBzLxoN40qm7N9IULFVBnjCG0WwyDKc9J3YCy5CYnU0RaWWMIHUjE3YyZTWC9IONaHIuOv/kkO4vTd7Hh4EY/dKRU4JAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7LTMVL3y5KvcqM1eit0/rcSMWgre56MO2DD0PPlSPY=;
 b=a1j0zVNsyDn5MkC99vSmHluyW+sU0TqijuHDYLfmch3Y5tcVW+G4Zc62wmjq19wDHUq9Vi1VP5UF85SwPdI1CjJz9e21sGfyD4oev3IvWr+MiZYrL0PUiVXfUtbFJGWPWp6hvXYsBwy1j2HMcx3qZYkxbvFgFRvzkSfmfWnTCQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 13:26:54 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 13:26:54 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v2 3/4] recipetool: Ignore *.go files while scanning for licenses
Date: Tue, 17 Oct 2023 15:26:46 +0200
Message-ID: <20231017132647.352938-4-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS4PR08MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a170fb3-daf3-4fa9-4b6a-08dbcf14bac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nTdwgmL0DqbBqQHJGKge2YNE21Ahy5IW9GDl5bQEjPywRktYuhQHYHQluhiITseQc52xsbqpEgoZCAifzqOUn5hLSzzdVtxh0o7og0PlJszMzMSzTH5ieKfz9TSx7vmotSnm7b+1iu0GLSmTz4mbtL1uhZiLBJh2/YK0PP4RCWjxCJTliLQS4PDAq20YYpcqc+kMTF2JjeGAUZi68TLwdmJeL3LGvMSyhzc6dNkxNrgKc2Hy8BJLIu/XPhbobJKXNM3OD78ZVSSQlfg/ygY81oEtgYEHP8P/TUQjTTDGCG4BSwPSxco1/6ILHpX9FrQxsHUK9uDm3l58TTKdjueeDWqZIGr5y6wG9UmrWANtQZgSsudhkdBxQVFE496Ama7RndTDiPnyzn8oEvOWiE/AfTQ8VtYpxOHnK7RI/WJm+uQlY0f/987FBOno8MNJmgItHWEf5LPCFulz+g8vnYLv5awRw1brwiQRWBvkArp8SVjYpyRsTJHnjMHCs0cZOoN19hSn24qu0zrmNRXtLXg4blgEZwr2gc9BBP0AKCIVa+n5vDlbCIYxC99/sIstV1QTTNqZtJvtL6PHMkDEZCvve34CZTIbviwkHbRFyY/AY1dQmNGRkoGpoGMR6IsAFqXY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(6512007)(107886003)(6666004)(2616005)(6506007)(1076003)(9686003)(83380400001)(52116002)(54906003)(41300700001)(5660300002)(478600001)(4744005)(8676002)(8936002)(6916009)(66476007)(2906002)(6486002)(4326008)(316002)(66556008)(86362001)(66946007)(38100700002)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jybyBgSI4L1Z0W/l6Hx/SN96deFxbxRCvNSSBv0t8zpvrbPVezt0V2YTEOIz?=
 =?us-ascii?Q?VKwV9yuqSonDMm3abTcUbZ0kP+IpTb7kxytIXV5YUK0bAsZw30hlEwW1vzAI?=
 =?us-ascii?Q?SImYNKbjHjGk5xZhGqBEWQB/HSlpc6EmOm22a3RUmVPr0MBk7+SM0EpqvCkY?=
 =?us-ascii?Q?5fqvf5tdO4L5Fl2BXql1wK0UkOFDM1no1gYGf5r/UvuwX3y7QIefU10sYvc6?=
 =?us-ascii?Q?CiXOXP7I+Ia3ZBKEKg7sO1N2wEPSkKE2uXLQHXNihBpnkS8kOhytc4QutvYb?=
 =?us-ascii?Q?iSsVgt432lHxqh2gBhZoafSsb38QIwmjT1+X6oCuWjJVHAWmnPEAZkkRgefG?=
 =?us-ascii?Q?h7csZzuBmu6YbV93nRkCV5MNWvJ30OwfDnhR2Xo/fljDEa8O446Qq1uzD662?=
 =?us-ascii?Q?Y6CTJcKejes1t4cUHG+2VXO/3Zh4px7jwWBJ7Drkmf1piWlahXXlEDCiHvHu?=
 =?us-ascii?Q?1cQkFVR4cpnQFqLCEuBq8K3DeAPNwZajSuPPmH1dDKE97u58GF68yhG0gzXH?=
 =?us-ascii?Q?oWe32Am67lCx1W5UPUBfCvM1estTo/BJW8DwsMnGwtAsZ1z3nz+W0qxIGU3W?=
 =?us-ascii?Q?Gb7n4nwx8CxbULnJWqifceT7QPgOcB2Sk50/HKaErrR+jeMGdyqXRh8zfgUJ?=
 =?us-ascii?Q?bvMHqEgc8s3F2eW2JSUFuZbJS3pOVODZsKh/I5QevevPh0b/jvCIAm2c11pe?=
 =?us-ascii?Q?gZ5u1JDMgNrkoTaq8zjBRwUN06YWFpjnVa4Ei9arO3ZdQmli7fL/zYS7TTxa?=
 =?us-ascii?Q?sU+I/Ql7tTHi+ndAqvX7DM3s31fwVOb/NlvNkSE3Riarh7xGcz2zuFL6BY5w?=
 =?us-ascii?Q?x6sJrJtJkws+O1XJLnRcWuLYYYKlSGlTrsNpXszwk9QMLdDA+KotW6ZiP5sN?=
 =?us-ascii?Q?anbOOcyfgaH99553iSPSKQAVwHZgai4ANPOH1doTfFUcmzIJGHjWxTKJKrd7?=
 =?us-ascii?Q?zuwhM85cZSZE5nD8/cYDKTkPRb7PIwgRTy4aG7A0RbgjiMGBopEbdLzueLFt?=
 =?us-ascii?Q?vLBTIqwWEh7bPBLvnRd5v1lTi+xxf5Yt87p7Pyi77KI/Zh+SGnCfDRqCk4Lh?=
 =?us-ascii?Q?TiIWdTgXJcAXrwVJVfkdjZDf70318/ZlFqaEx5C+jvPWmVAVgGUovo4XQXQ9?=
 =?us-ascii?Q?RiX0q2ry3E+kUuQznDKdK3ngIpToe/GVk6oYa2/N2EysL5Lj0SAClREV/CHF?=
 =?us-ascii?Q?7FbipYhPKlkxGkhn2jCTPrZ94UWuaqyXOwGzU4gHUQIvz2AJQwgMkr6OP6/M?=
 =?us-ascii?Q?F0i701AiXKK3uhWFMaDkqbXfN1aoz1TNOeIevyYWwsPDigJUZZPEFek/zW1a?=
 =?us-ascii?Q?chM/77eSKLXOcVacxCvYj1qJQGF5jnzVa+DvdCDBCbIj9Z6SD97WKUMxIE5O?=
 =?us-ascii?Q?WsD0orRKiM8LSwZkT673j08sMIxhS3APR+rm/ZGybfQnSGtDTqncK6HTzKY8?=
 =?us-ascii?Q?g2WPbeJ5Qo6iO4ucuDlAdr/+q4NeZxNAkRwwv1+uS0dbfcB671bpShJK/VEk?=
 =?us-ascii?Q?hNloG3P6g/gdLthR2PJPPBNMj1VAEmAolw7xQdAH4DIi73tz9luk/TuW+AuX?=
 =?us-ascii?Q?FvVUVVE3mGfyzjUqpCFXh8d4UlroqZbTRzp5JbyS/5jLQmbSMrLU9cjeSapo?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a170fb3-daf3-4fa9-4b6a-08dbcf14bac6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:26:54.3918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +65Zl2u6PMTt8NxvulCuoa7HNKF4H6oXEF2LLj5amjQ1u9YdrRRtSn9sO1p/2NtOznzZ1aHPSix7/tG8JMbQgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189327

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 143bc63e9d..293198d1c8 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1212,7 +1212,7 @@ def guess_license(srctree, d):
=20
     licenses =3D []
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
-    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts")
+    skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts", ".go")
     licfiles =3D []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
--=20
2.30.2


