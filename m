Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA87C1075286
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:26:22 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7196.1773912373279086532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=pBUTH2a2;
 spf=pass (domain: navimatix.de, ip: 40.107.159.130, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzVUeYMMGvKyQ88/GNB8n5TkXMibPr6vMVqWdZRiHwCBNuW9x1chi0stMbOilndvzJX4RISrXPfCWbAgeeOA/pwmXLH7Myal/+rWjy4Y69VTsB1Bj49/m1u4qNwIXbRwwmrRtiAbjDq8I8z+/bFzdx7uLiXH30rRt+l23taAZ6zY28t0Q35+pSQ+RBrkT5c96/7MTFupqFI/Lro3u/0Ln/Ifq/Qg0me1eBflVlDZt3lQnSs9GyqbF5VGNhAwWCyQs+g3KGhxeKpE2iWPgUZV3iOtYGBCDdIeD/yP5hOq8vQ/nvat68ZhvYnp1X8/VGkuSPWNRWH47/v67xazoeTq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0IkWMt1tMmYnrzHCJpC3LHWYuSVf5dlcM5XOD5PqyA=;
 b=QA5vZRgNXBPqM9f1xNk1aKactw6CiNSaskenDb5HTbT7M7BOO/uRlQBRMNAGexNPGqpCAT3b6ELX7nOmtlDCssDT3HHzoNM1Lpw27a0Y+QePfH5QcoOkEwnWSHX7VLlkLyh5Y3xhr39S4VUx6YBwJ4Dg/NyWqU11r/vL4CwBmrKDShSL9pgRABSHkYpKsldJrk/AG2x3GlmAyHKhcwsu9+YUhWGZLlMV50WA0BG4uJhHR9hyZwHoosCCHx7Po2Ggl6TTHJO4CHCiWiw44/N6bMGWUDxhqnrJ22lwXhvoC6v8T9Bl3GiPYRWvzZkKhWEoArWeTyVs+ehFWoodVXKnVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0IkWMt1tMmYnrzHCJpC3LHWYuSVf5dlcM5XOD5PqyA=;
 b=pBUTH2a2hy01jDKWwyC+FIZ0STfUyxW3wBQlOro78tujskA28MWjB0xm8Ilpg4bAaMZ5rksWM9D/h4AXeB/40JsQV4fEbPlnN5wHK28WsSs37P9d09VTxU1MSPrS42tl7fWNAe0ZK0VMjC8wbgNl8FlsZX7cZEkUx2+Fo+rbIxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM8PR01MB8002.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:320::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:26:08 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.018; Thu, 19 Mar 2026 09:26:08 +0000
Date: Thu, 19 Mar 2026 10:26:07 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] nfs-utils: Add RDEPENDS netbase
Message-ID: <8c4681811ebba43537328a9b620c6dcb489654a6.1773912366.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM8PR01MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d788355-ebd9-48cc-38a9-08de85998d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	wRwW3R2nQRcdCokzo91th56JtF38gTYN1fh7XQcxXxIs1pvj3yzMZ/r3HfeNLGzdmqMx1gdrlUyS8DMl3vgB64FJWBD/84PmJkBGvikKdbL6l8ZDkatctJDvUEK8EFBMQ9f4sETeeVcvTKIiX/993/CGoYz6v90iFYO23pXPL+YFtFN7RoM8HyB5GISaMFWcqQVX4igW22ayI9S7Z/TwFux/n8e3GNs6XyaY7AWohn4poU+E7Ud0vC9cJnUq613YmRackLAj7Mp1q1WWcJa2JTCLTQB/zR41VUYBkztkklLCAR8LS2QGkxvJPh10M3DNrxHTiwG0HxqfUqWw2hF52p3ekSZtJWNLDlM8p9ilsa17ddK1FBvvtAFM4iZ2579j5mYAGUWYZcxR2C2FKH1rlgU2zBzGAfqL6gPfiLZNs9Q3agxK1YRaKvKV5KWdJQKJgze5ceCQFJy90l1UFzA9xTg7fOpUyDQShUWYOM9EO+ooXNslr8wZqYyxeCnDiDmvSKSuf9mTiEzYYmCo/EZX4lMjYkJxkR8IZqPZYAFxDpEn6fpExD217ZVSKy7Y/avfeR8EEZzgvvzAtYZ8tGlId38s7avKgi+EmyB8VJVACn6V2xGkEOl0Sed4HiJmL/lxq1/tdE5zxGLV+hfMOWQ2J/6f9fZR9xd9Bu8X4W7BCwNU5Psm+1F/nsdxIXEA1hoXRUHhZVCOBCoGUtO8Qq63Yf9vsRWCIPG7QUbl1GTKxY4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kgZE2TW5xfmJrrqICfgGFcmTs7AOq3F7qeeGIgwd2Scl98miV13W+j0efRws?=
 =?us-ascii?Q?w2NmzTqxdVo2MQ1EBKAAL93U8vMcZ1gCj2+EhDrVDFPDqhsLs3/DxtGf1iVF?=
 =?us-ascii?Q?789sJrGgZAPgUvbwj045aILuCpnbTf8nouk0OwoZCBx3FZHAwIG7SQ0EaXiQ?=
 =?us-ascii?Q?zRcuLVXLsOJdbTeQ3lLwAszkFbOT7KgrR3G9wft9peQDjC1XQtzSsMqXMB47?=
 =?us-ascii?Q?8XMZuXlinVBSHgO8A0VwxARqh4V3HRejHfJdNh4B5Fiu/732YHCASi7/GmZh?=
 =?us-ascii?Q?76aHGyvonLYwdLHH+z3NcoIeoaAk7tMhtRC324/RjYakbmbyW7Qx9n3qSFQk?=
 =?us-ascii?Q?3SmO27nB/BHEk1FJddzbYiRfn7dewuvgwkAXNWY45N7rzaaFYiLTkKh15Aj0?=
 =?us-ascii?Q?/hoI7rsFBdORsq6/ycWK7JWb08JkoZ/+5Cvh7jVZ6rtrUD2yPrI/Kw7Z7FvI?=
 =?us-ascii?Q?ZNIeHazUrQ9E0BWsrJv3Gru4qMwPIIL56q8fLPs//i28AiddKgV6wf7SZudk?=
 =?us-ascii?Q?dpTVCYcspMr2tOIqY4F53LFGie1EQbqMhJvY4PjKqYhgm6NEXT7pYZ4U8NxO?=
 =?us-ascii?Q?YX4wxD2fpt9zxfZnYWFsV5G7EKlEZLeHH91XrODn5c8R6VoL+phABjzXeHp+?=
 =?us-ascii?Q?zqaXyZ3wEErP3b6nOG43xNrJllascCZDAYV4lubbJDgyN0Jp6YNml/5Yqcsv?=
 =?us-ascii?Q?BuN8DYUINXPmg02n+7NzDounm0uWJHl7Fvc5AFH4YRE2h0pYoJ3Hp9XVzwNz?=
 =?us-ascii?Q?8tC7djl6nP0n9ki0HQwHJlVtrMZRrFuCSZgb4d7OMGA8HM7g1829uvdL2egr?=
 =?us-ascii?Q?ynpPCFjfbTxeJpLAb7hXScfQrXuze0mNfJ/pRIDANvDl+jRLjMquSbpXuwbC?=
 =?us-ascii?Q?A1Vr2Gmeqv3jMqU0I4Y1RzO3zd/m7LqTErkDrW+FcEK6h1pM8gLgBZpn6CCR?=
 =?us-ascii?Q?UdpGTf7R388NPSlkue35o64bNQujj1T5sw1gizRt/drxTXOBfyFPnaXgmmHF?=
 =?us-ascii?Q?TvqQNRr8EyO85AfUVCdy4QUnvvQfIimMoO/Jv8pUsWrgWHkdAuENHhVm9AFZ?=
 =?us-ascii?Q?XYEhqAJ8lLLzLMYNIYAse4umbkPgDsgbC+NklM1k9JMD5YvT3WwQ4z+nbNPN?=
 =?us-ascii?Q?U6GWTYIYWMASViddpSQVQuucXAO8rCdQUJz/3FXOtlOyZuVMgVQhchK71EqM?=
 =?us-ascii?Q?IkKzLxVQmypRkd1An8LQEAopr1t7gesZMrl5bOeSIQ5h5RARjLvbmt2DEgIR?=
 =?us-ascii?Q?87j/wdMFZOtslp0YE1qhtCSVjyFC18KCM4yajEdIIXnZy98pANC1sRyjPIU9?=
 =?us-ascii?Q?c/ELNtSInowfRLKLD6vlWMEIgFve4KimUGrZ1MwgNcVuxPkeBM2DH2vyLRWu?=
 =?us-ascii?Q?hidXYo+U3rX0rvx7VGK4yVnjh4gqRejkRMetD4ifTj5pFo8mjvDZCnHOwUAh?=
 =?us-ascii?Q?6rKn1VsdpG8vGuweBtur9OTUvNFGDTMZfViLTNSoWbVWXtfstoPE37nrLMiy?=
 =?us-ascii?Q?ghflDouNyE7gekBBiyYJ0RA6WTkpkb8AXyK5M/c0LyfAmaMm6ioVH5FBBZ97?=
 =?us-ascii?Q?zYECc1aN+OCCdopWLAOZOhQYR4DuFv08HjAAsHe2LVIlDJKaH3wslbM6Hsqq?=
 =?us-ascii?Q?hii4DcK02XMZPZcm5Y3NCtwlajK0wCdTN3d/ryUdMhLm5MXjxNyhY/xPjEB0?=
 =?us-ascii?Q?Slq2i5M0ufkOxMMKzjgia2vhqcjG24OTrmqrIy5majRodCrkqZEVJ7Ay531T?=
 =?us-ascii?Q?3hMBBf8TLsEbABcU/1v+v0MYxAeuZrs=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d788355-ebd9-48cc-38a9-08de85998d5e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:26:08.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kbZgXe81eBH1zWXAVH/aT6docttguvLJ1tnVOFnRbjxmXAQlQbTXvJBm01AeJSf9HhTZaAdTDWFHn8hdP+9nOp6k77C6aBqDMV3M5l7MFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB8002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233471

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The package netbase has to be installed. Otherwise nfs-server.service fails
to start, because /etc/services is missing:

  sh[584]: nfsdctl: getaddrinfo of "(null)" failed: Servname not supported =
for ai_socktype
  sh[584]: nfsdctl: Error: Protocol not supported
  sh[584]: nfsdctl: Error: Invalid argument
  sh[583]: rpc.nfsd: unable to resolve ANYADDR:nfs: Servname not supported =
for ai_socktype
  sh[583]: rpc.nfsd: Unable to request RDMA services: Protocol not supporte=
d
  sh[583]: rpc.nfsd: unable to set any sockets for nfsd
  systemd[1]: nfs-server.service: Main process exited, code=3Dexited, statu=
s=3D1/FAILURE

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb b/meta/=
recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
index 119e49e2a2..b75a48d60d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D95f3a93a5c3c7888=
de623b46ea085a84"
=20
 # util-linux for libblkid
 DEPENDS =3D "libcap libevent util-linux sqlite3 libtirpc libxml2"
-RDEPENDS:${PN} =3D "${PN}-client"
+RDEPENDS:${PN} =3D "netbase ${PN}-client"
 RRECOMMENDS:${PN} =3D "kernel-module-nfsd"
=20
 inherit useradd
--=20
2.53.0


