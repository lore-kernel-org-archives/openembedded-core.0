Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED68D3E18A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:34:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web11.30514.1729280090647400152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=LwWMw9ud;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.66, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOPZ09j9KYl5cK0SE0p8EBE1y1caPa0ooNILo7F2lhKW70+ljJdyClX/FdBYV1hkAlfuMpemYfkIRl0pwUQSr3oMxC4BhXMwMKK2SyRhHb9GNGI1a8+PG/sEhH3fXbJRGvuSLVSR3qOcLF6wlW4FnOoTkU9iT/hrETGBtKZzqiEzP69sFuo3xTtLkuCnRjNw1R7dz7iN8OjgJzy483T7Eqd4Asyjtla41dF3htu8WGpIN8bdFDDg7Ts+12RsiOSaw5S0A87IywfwaErep+cOrw/ack6vL7OX8nNk5b74Dn02fcgt1OJ4WyCOF/LlEaleGuj8ByjBTjftrWRrVge3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6BWVRJ7JIZh0xawMriJb39CXoowki8KfGBLSqQYLgY=;
 b=aJXF09Pglus4kV+dRGL8KDuf1G7z/CU7E11vu3QAU2Qzp16OSHHRSBfVLptCd4mlgTdPpPuQWKiyML5thPVxc51qKYBDXuMLvBKF3woOo8qmzqROGFKOYSrkxn3+5tEHLsfRy1Xwll3iXAht7eeK63JZ4mTnSWWIn3ke1vvA0T5rblzp4Sj8/YQ8X00SeGSlo8qZSm8NO1a8YCd2rJ2PJUbeSFpG2OErERn3vZWT9gih3KonqrKdG7+CdxLD8p0ezvTQ0Dq6Nx3joCwR99ko4Feg5SxQIpw9rxxa5QZpuH23p8Eyd/ZIBic3/qmqA/mLGMQJaQVumBpy4auFiyFBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6BWVRJ7JIZh0xawMriJb39CXoowki8KfGBLSqQYLgY=;
 b=LwWMw9udUYHmwTz4iVvUUhPrUXU+v7h7otT/0GiJ4V2MCfCf6WZBElaJFIX3LeIJlVKNv4sZmaNhxjaHs3UAg+kdsUI8tkPgbK2uZEayU/t+m1VoWLz770W4FWg58AXpXjnG/IQATKJjiW9n3XxUMwwvII6V/9P210ugldfWAygLy+vkzmln3PQ6W4xFMvIXzJCa66XiiheWnBjDMKM+YBf38qrafqeWo9t1oTOwJfOUdxpLwnqY+ZC7Guvkd7ZgLBGjC+xltBskDntn9ntNjYLxLzZWs6xXKJRGqxtAZ1bIQP1Kq/mCpEWNQC7IA20kcl/O2qIrEvxsGLSCiDm8iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 19:34:46 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:34:46 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH] weston: Add missing runtime dependency on freerdp
Date: Fri, 18 Oct 2024 14:34:27 -0500
Message-ID: <20241018193427.3703201-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:180::49) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 558cb686-0a53-4656-51ea-08dcefabec1d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WAVrttJ1lC1p2mk6lxavK6cazTlOIGEQ/PbMBEIFQH5/3gybgWowM/wAYlIU?=
 =?us-ascii?Q?H99yzgQRo6YcuR+UTXEMtJOZh8TxNXEg13/Maqis/A7hP18Bj7uO54bFY/TS?=
 =?us-ascii?Q?tS4t4qtMxR+OuzOjpCIWNMGoPaR/Ig0Bl7o0EX38xnMDwqHzpQWp5+BZaUez?=
 =?us-ascii?Q?WXHEVhupmMoNabQKC2ROtzE8j4UFjSXfcrKDi+4u7SxfTwfRnjmsrrx1CWAb?=
 =?us-ascii?Q?WjjQJtQDJNNCSWlzh2AteQ/OjaD4OsG0J9Cgih3RGAxkQVNYhGLIN2f3Zxht?=
 =?us-ascii?Q?DCDSCeot9si/EfeQQ9VoSrygIAKSTRw5MK34v/qb0N0UrraZEXyAOnSDr6hm?=
 =?us-ascii?Q?sd9HT9ARM4w0bQobA+DtNXUdySxoCWItEy5n5nWyCv2zJgsS2z2pTEa5GbIB?=
 =?us-ascii?Q?bqb01vNmxhqEkjKUFd7KGJRIrlAF2bnx6uRwzz/i94aY49EMU2yEiXb63gzA?=
 =?us-ascii?Q?MzexIZmxIyd+eF1tCKAHnyNB8cmrqL3C/ckdsksNe2DnxTAPtvFbUaTxFXfD?=
 =?us-ascii?Q?VTUf4AE/tR6udzvpnQKiUsE7zDKxdGEMnnVs0VtSR34SYjBYa2G4kBbG4hFV?=
 =?us-ascii?Q?ykLRvTsP3Dml2jTDmEyZaSN7FW6QULKrtqZJI22hL+Ht8HQQ/SeBZ8l6JtrP?=
 =?us-ascii?Q?N8Jn5m3TtLVYHvrAJZTNNd9KGkLSSaFiPqonMxVXJZ6aZq6GdIaZ58+3lI2i?=
 =?us-ascii?Q?dX3+uJoKymTlnNF/YJ3SoT3h7tlAF7nHWX04BkciKay5XqvBQIZdqQ2GI+Oa?=
 =?us-ascii?Q?p34v/3QIDZRbMtpCaQh6qtPROM99V/77q8Z1IEzOtVmzvK3ZZaa/cvcFMFDm?=
 =?us-ascii?Q?MnPJtndxEIOL7sgm1XtDbgPn7OYMQO6BFkY2yfn5esyfgosy1Fr/OzB++uWh?=
 =?us-ascii?Q?4NfDzonMkX8Qxzy7o+beMtIIsnVNDg0ftBxyv0Ojs6kPRrZ5KxsHKmbOO7OC?=
 =?us-ascii?Q?GMYRpYNG6mkVcG0LaSHw828uZSPw9chn65uXoUqnQ7R9mDofDitE/Ih/G+q0?=
 =?us-ascii?Q?9gjt5iDcL0V4r8okWwzItUZQoTuhNc8oYZKyUoLnmnxWVvCxWhzMfAZ3LTX6?=
 =?us-ascii?Q?3m71z47EX65Jm/vRAeFv5vjoKT5RtYXA6kAycot87foZROlnVxMMusDT9yog?=
 =?us-ascii?Q?/7Rdp/19D79x1KyL20ytRX/u6HHqyciqnAi/l/w5TR23AU5wRHaxXeR/Vz5E?=
 =?us-ascii?Q?FEqvoZAX5+yBgIWMSxLMXTrhmWGuAAoLh0QkZALSkyLBk6KU2PbEOBSR19Cs?=
 =?us-ascii?Q?VjMZTPudVNAaM4Kankn8T2ZQ7YhqoiLzumteAsfWeBITnvK4yIeH+DmgkG9m?=
 =?us-ascii?Q?dKmWtBOHuelRXheNi44V5lzHq4rPzN0WKvheaYjp1nFNq5eGTgCaWWxeXoYj?=
 =?us-ascii?Q?d49Dcz8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sIWvb0A+H1l0QT3Y7dbWV+WqovcKuVGhZXRYOx0scuL3WDZLULUdHePfcD7W?=
 =?us-ascii?Q?hSFGDLH0+l6wfzHPRC3/905mJWGnp8g6QxJK7Tc+K88vDSziFJWGaNLpCYoF?=
 =?us-ascii?Q?ZSjZXBgC+OyG//cz5yElC9WOwp5E3sAg8DVQ/+wXTGhfZW2x5vWurCNwEhgt?=
 =?us-ascii?Q?SSWJNIrm+N45iDubGxrefjKp7RQo72A2/u+30fyWezhXWpOELgFFgBCSMroJ?=
 =?us-ascii?Q?ATwBBvgauWICD5pszrF49uFfHS74ivClDbAhwWeoDizhZ2wo1sz/LWebsWkv?=
 =?us-ascii?Q?EbAfqfoQGIe5IasGJ1EY7AUzQ12K7PJ7MwoO96Amww4ig1yYo4mw/2DyRMlj?=
 =?us-ascii?Q?zw18739tF3FZ+87I8OKV4HjFI4H9GOYmAUuCNulv5ecBY0K7MI3LDNFomuCf?=
 =?us-ascii?Q?CWDl0zaUr7wHuLwtR7tAa++hDv81RecwWAMcPBr8tzhJ5KuXo4FBy//pSj9u?=
 =?us-ascii?Q?ACnhXFK7i74z4rZ/KqzJYjNcpIMjeHs5k0cCf5kZ3ielFppk03wCviMdv+lH?=
 =?us-ascii?Q?bcnUDWJdOm6NreQH4cVez87SMLKXbMZA0KQPjD5Gjyiz9y7Q2bcK7GRC5ngM?=
 =?us-ascii?Q?mF28KBN3sFqKnpHAs6CUY3gYMoiiPBICCxELJibHNoFY9fFqT9pEklrNucjs?=
 =?us-ascii?Q?WrIpLSUzu8UFKaDU1ZycU+JVr3Z9WiR0WODWPeR8noAVvgVYi1DFHVOBqLft?=
 =?us-ascii?Q?ZyWMR9iEYU96i0AMiVN2cqufj7lIOWGX6bzgiRZUQoSAseP/MQe8h8GN4vE3?=
 =?us-ascii?Q?XW0ZtKQQNPNzQejKVcbOerGrGzTEPutNwgu0/7bnv58gtqziCN+yM1NmqW6m?=
 =?us-ascii?Q?TERyibBoV6W5FkAoYDLEKs6qgJFiWt+xxW5GHfFQpYMhKQSYw08/5Ia8q/8U?=
 =?us-ascii?Q?yO0EYHvnCa8IiCGEBptcWS/BtdCYMvW69YXVoNZpa6O4VHuUUqz7ItJTyRwG?=
 =?us-ascii?Q?kKQLNEU2TgMRgeaUrDHHFmrXRMt35g1asJLtSNYRXKLnVpcNCpvkSI0QXFv5?=
 =?us-ascii?Q?iHVPIXiRpmo68ZzeFDcOWu5wom1yKoHQl4RlqWnGjPVpMygA1OGyv2X2M/1z?=
 =?us-ascii?Q?9cRyU60w5v2ByksuWqLg89RYpr6cWZFUz3ZYlrINGhAA8/z+ab8mbDuxcmBK?=
 =?us-ascii?Q?g4R6YWrSdkSDdJ9HH4oeCzJgw9BvV7laaks0e1SzjtsNd0F51dWuYEZmUuPN?=
 =?us-ascii?Q?ydRBIAdI7oHsgARXJYDIQu+1XvKXlGkdQt7ecFe15b2+JCEgzHBARkxyYKKw?=
 =?us-ascii?Q?nzTYizvLCRk9fx/21XXFofaHLbxWyk9vwPl64fAGnjdsp3MmSVhFvn8zm6Yu?=
 =?us-ascii?Q?0/cdeMKxJzKhCz65MVBzUMlgcLVU/SwCX32ExrgVJ9QcpzDjfDbhc3wb2awg?=
 =?us-ascii?Q?n+snXY5T1ol0t3sJB7PS9tM314RItWuiV20vf3EUS0pD+fDqQCgiygZ5sn5x?=
 =?us-ascii?Q?7jvJ+dxSyJU72PS8WkR+4yMojq66PHyRKLinzTcvfi3jNmakN2PCREkPKGlv?=
 =?us-ascii?Q?ojQPZQi1zZOLXbWZjCXLFI5tUK9KQfSIBaG//v0h+gmjy3nRaUsL+E+uuxVc?=
 =?us-ascii?Q?1bWeMAlyAfURcyvviW6pEBg1XZpoJrbcRUWQvcm5Ej6ydQefeKJUwKXbGVba?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558cb686-0a53-4656-51ea-08dcefabec1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:34:46.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUF/EG29tKJX9ArTnC3QN27QDPh30hBrYtQR+YqTZiwICmyHNTIdKPFqzI0L/jUIhqYNNrWIbp77VOYJo5HYwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 19:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206067

With rdp enabled, nothing from freerdp is installed in the rootfs, and
rdp is not usable. It seems there is no actual build time dependency
other than the meson check itself, so add an explicit runtime
dependency.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_13.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-=
graphics/wayland/weston_13.0.3.bb
index e4843d38f7..dd5b2e2b27 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -61,7 +61,7 @@ PACKAGECONFIG[x11] =3D "-Dbackend-x11=3Dtrue,-Dbackend-x1=
1=3Dfalse,virtual/libx11 libx
 # Headless Weston
 PACKAGECONFIG[headless] =3D "-Dbackend-headless=3Dtrue,-Dbackend-headless=
=3Dfalse"
 # Weston on RDP
-PACKAGECONFIG[rdp] =3D "-Dbackend-rdp=3Dtrue,-Dbackend-rdp=3Dfalse,freerdp=
"
+PACKAGECONFIG[rdp] =3D "-Dbackend-rdp=3Dtrue,-Dbackend-rdp=3Dfalse,freerdp=
,freerdp"
 # VA-API desktop recorder
 PACKAGECONFIG[vaapi] =3D "-Dbackend-drm-screencast-vaapi=3Dtrue,-Dbackend-=
drm-screencast-vaapi=3Dfalse,libva"
 # Weston with EGL support
--=20
2.25.1


