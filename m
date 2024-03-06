Return-Path: <Fabio.Berton@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E29C54798
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 00:00:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.57])
 by mx.groups.io with SMTP id smtpd.web11.4981.1709683255079695864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 16:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=aR3OS7CX;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.8.57, mailfrom: fabio.berton@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJNxlF4oYQOmjjaVBp9bxoR3Ja0Y7WOtGIYsxBumY+1dWXRsRZEf+xgRTmCtzeCKSULuG1amItkTLDlnabzVwossY68e8CxXac2kyHjzXBXHb8m+WiB/3xfniSEa+gcnnIojcAPzM0X4vmwa2YYXIFLGTNaHULn8vIPl9EP1iLl/hnZBl/LioRwNcf8KZ0O/e0XF3U7wSk7Zmslzc30lwujcJmaNB+8qxkNmGipKP0Q9GqxU7bSZ99CDIoQj9Ah2aEUQKYYFxZtYdCTvItRmtQf3itjnprac+idalr+eiIUW2Zw8wr5OUR22sdxQ//vKozEvhx3UL9woDxbjqld+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe1NBfJtMZNCC9yM/HBMsQf+rsTcsZRrhd5py7bXT7k=;
 b=PVZ1Cd8GjM6PYKL3FUzLV8TZ0HWlzhx6Gd1SW259Z79+KVeCSNY7wx1UZhqnMjd4zD2LHkSSY2Y7KJcZGiZl1WDz6SQlVEh41sd4PYJvo85sBXFlU73EX6+8GN+MTVkMj45ZWJFN44KGA6RHHsB9rpwsJgHm3UvTM8L5Z9CIAqH3sdK2nx4EdgWVTLWY5QYROLO5a9pes+7brc1iBnnpA5et4aTbPZeSbY7/SKKn/wAdS7ohn+4RWkX3RMarcoK9N46wm2KwcW03y0BtRH1zdAIPjj0VuiCWqKe5Mqa4UMtWYJAb9vEwhyaB6lfaor3unUvm4bk/mEeBsFrgT0hOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe1NBfJtMZNCC9yM/HBMsQf+rsTcsZRrhd5py7bXT7k=;
 b=aR3OS7CXX7zqK8JQb8SXOOgchsTHJ84BTQcMSr0Q/UHxDN24ASHXV9eaClIHRZcHN3gpu9VUTjHimGuj5KTeLyTuRywpr7zAPsKdr+VpRNql7pjsVzDZdMdw6yyJFp6CSbmWvTir/nxwms3E4xIQLRzyLqD7bG2jTK3Te55EVTAJdyDxWvMnZdS0nIaX4z5zME2iVNlD+9I4THjTAEAon+EJUB5uAxmHbWLDe5fxXayK9pohZxyRpe8IZgWkUbFzsIIk2WNJDdckai5Nk1inby6paJ/hbOKu4nq/TL5VDyhyzZEM+gepMrkibGJVnN8uln24oAUV1OX5oeejzwh0iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from PAXP193MB1519.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:13b::14)
 by GV1P193MB2247.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:2f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Wed, 6 Mar
 2024 00:00:49 +0000
Received: from PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
 ([fe80::4fb3:efb3:71ee:9708]) by PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
 ([fe80::4fb3:efb3:71ee:9708%3]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 00:00:49 +0000
From: Fabio Berton <fabio.berton@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] useradd-example: do not use unsupported clear text password
Date: Wed,  6 Mar 2024 00:00:25 +0000
Message-Id: <20240306000025.4191933-1-fabio.berton@criticaltechworks.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0471.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::27) To PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:13b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP193MB1519:EE_|GV1P193MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: 837cfc8c-0975-49d7-a0a7-08dc3d707b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zorMB7uQPyLnJ1NQNxiWf9U4GSZjHRzIbCU/mU8EcwqqNz/c82qdDpos5d+jLcolyBtDpB9P30+OlYahKbNRriNcx0FLrMaTme1Gw5qn6d7B/LP0VW4NFODBLvSNIz8FdsctyXnEFdMKr0EO59UhH7HWH8qwWhifLjP9JGvTOB5mgSIWoUZVCN7dEg2cUH3xALsseQhu7+0NALy58WxEiLpUWY/Vslm1n9MxSkgHcVIuHaHJabgYgCkaM5slwQbECCgLVJIEuIyAciPX/vVyLlEnoNnNvUKkjWc0H38ydlVdfjuLKznIlGfnb0ZYiTIu/VNMJa+3lpbPM3cXfGavHcZn9Pq73KURz86ExAgzmMDi3wV34GgqvIhYCVtkuFjmUPcLJyeS0Ezgsb4m6TWBqrvPegH1s7uXSs1gxWB3F+DqEUIRq3mFOGkJ1CQ67RJv5LbMTyDUkB8TWvWNuYBw4hx5BJLvUUQcCgi22ixkWz61jCIzxN5w6QqGq76KzcfYCGZlFSvR8iRgUsRfmbSwSIJ2FjQuon5wurvKCe27ztmjiaRCwVoZd7vY39FIWOEfy0fOr3Etp5Duj3eIg5jAu60AjY0lfCh3wjfjNFcIPiSISLG0iD+sblchtca+rEHlZWYeS26TstG0LL+pATAsvRkXNKgo9gTdT719RQ6G2iEKX8bQIYol1Lu2HfyE7jUNsFtOVlBuBAbH3giYvRKCTw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP193MB1519.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jAU+5J8f5Dy4y8gG0DpnhDIPy85dUU5uF6Jgel/3aQMPvadMlVElSsQCa81N?=
 =?us-ascii?Q?v4DGb1UELmg9aZDO+301Tsy2mM+m1ZRM364ZnDLkJeGxfa6k1IQ6+Laa/8JX?=
 =?us-ascii?Q?n1oIWCSw7+8G/Y4kvEaoxaqztNAKuaU/PoGKOFbbonFep/LMdzG3ByF03hmh?=
 =?us-ascii?Q?CVMn2qJ2nxIZNV9WS1TwMTGKxn77SbCcoWeD8lXPLGVS0fQBTSxCkrSl8BSL?=
 =?us-ascii?Q?ugKXu084eg6NbLot5wcQKjTpwsasHwK4RQCCAUxQ9zbnqihHaLHZsq/A/357?=
 =?us-ascii?Q?jeIBWeji5PFBOtioePetu/BZYiRDgE/KkQpOFOTD3BK6BFklTmZiyJnbUvnJ?=
 =?us-ascii?Q?9QHaHyVNmg9RtRqlNTsCkP0/IHN2eibP3GGLg4XFVvtiaa+IRiE7kBzFEnMr?=
 =?us-ascii?Q?Hy3re7/CpAbSht55cRuYK2OMjrqQdQuZKcbswHbROYJ2rEfX0hEqfASD24BC?=
 =?us-ascii?Q?Of4olf4IisAuyhZQSf7pBax3S0mM4uZeqfU8MUBHySe8vwsODynqpesS9RSK?=
 =?us-ascii?Q?YzLzZ/5Fnx9mwWHY2IpXNLf08uui38wkqhhDnDj9ZfPM0MiPChbU/7ICYpSt?=
 =?us-ascii?Q?dUkl6lVQwogrC+IVY8yZ0aTMX+y6Nu3G269P9xeb/a776qH09UpBX+8b/Kxv?=
 =?us-ascii?Q?g2o70IhS8si/pgJMDrhqCzrak0M+Bm4jqfcKepLN8ls71VTVn96PiyR3rIZY?=
 =?us-ascii?Q?DW6VKExb1IARydFX1Qf3YPWmYctGOl3YZH/+j3QIstJTyR+29hxBgRl9W/Rv?=
 =?us-ascii?Q?KS/r0p221kkVp5SNx9rW+WmcSAhoWFTiqukKQGHo5D3r/r2+vLD25YzXIpkM?=
 =?us-ascii?Q?qBHbAEzfhx1/X8KYCVFup4nmXBr154I6ye5/VLtEA11okOpahXmKw3gYC0Jx?=
 =?us-ascii?Q?WLknBCZ5W8WNrTLdv4zSDi8QYNQNykEsl5dSWUlTqvnuSYrkOHZGwjxh1C78?=
 =?us-ascii?Q?OiB7ulgMKQqoRlZffywVPdAWkRkhbJda52YjKdJSDutnNnKsAPF38lRqysBO?=
 =?us-ascii?Q?jVuFjmTgCo6FXRW914lfAAVfOAyzGUxpmPu85cegvrYiCLUXkKpPcbemLTyB?=
 =?us-ascii?Q?gADqajA2zqd6soeOgqX+d3LUDpCor72k6avU+QwTNbl/MiUurDRLa/pHX9Ij?=
 =?us-ascii?Q?GUx8BW0ZMjCAq9AwpWve8P4R8HYI9H8GJHI4ClzChF0xqbcOwEdbLYGfI89R?=
 =?us-ascii?Q?0FlDf5RKwMnYwLGbrjdv0DtVouZBWfhRjFjPJts99PlNj+CjfSenSD+NB4nq?=
 =?us-ascii?Q?LMrk0eAtQ7Xl8XV2AljnJJ/uV2bYvluxjwGQTqKNHWSVy4R5Hyd1W8ttuSaY?=
 =?us-ascii?Q?lLh9nZW77pcJmmDPnFQU9xwtEocm9zcf8tCZgbpYkUUeLmhRpnzV26OeTou/?=
 =?us-ascii?Q?0HqwAjjK/pdTNpiyhbWRRJVaVIoqFUzV2CCm/6wdtlq3uEUHacLNHg5GhkQ7?=
 =?us-ascii?Q?MEMckA3M0Erp7o2P1i2uHKvncjOwVc53PnGkSMjGw+XJMA4BUDcAX3C5c9zF?=
 =?us-ascii?Q?gvjgpDz9xP29sKS55dOeKSfocaGpGmzqDENunapQuPj0c4uDofCKQuxYrhW0?=
 =?us-ascii?Q?8j3zu+kCF67uzSZkg6gZPKmG2p+S2UmY1fhDHFGEnOWV3L3XCbfM/nPsjNNp?=
 =?us-ascii?Q?7cAAv3CklPa2DguLc3AZjDE=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837cfc8c-0975-49d7-a0a7-08dc3d707b37
X-MS-Exchange-CrossTenant-AuthSource: PAXP193MB1519.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 00:00:49.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bl6Vflkl2Et1B34kYLaF4Qum2eLuUHgCtdG2DBtawte5mBPbHs3+v2dXRWdTtRKxxzUZJoKU7TwPWjoafxBziHwqMJVNRAVpPz0yJpkk98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 00:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196653

From: Chen Qi <Qi.Chen@windriver.com>

The clear text password support has been dropped. So let's just
use a normal ecrypted one. The password remains to be 'user3'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd8232f9c58980d95180ad320b7b0bb0fcfd9ff5)
Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
---
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/me=
ta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index 3f4c42d714..cff624e2f9 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -33,8 +33,8 @@ USERADD_PACKAGES =3D "${PN} ${PN}-user3"
 USERADD_PARAM:${PN} =3D "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u =
1201 -d /home/user2 -r -s /bin/bash user2"

 # user3 will be managed in the useradd-example-user3 pacakge:
-# As an example, we use the -P option to set clear text password for user3
-USERADD_PARAM:${PN}-user3 =3D "-u 1202 -d /home/user3 -r -s /bin/bash -P '=
user3' user3"
+# As an example, we use the -p option to set password ('user3') for user3
+USERADD_PARAM:${PN}-user3 =3D "-u 1202 -d /home/user3 -r -s /bin/bash -p '=
\$6\$XAWr.8nc\$bUE4pYYaVb8n6BbnBitU0zeJMtfhTpFpiOBLL9zRl4e4YQo88UU4r/1kjRzm=
TimCy.BvDh4xoFwVqcO.pihLa1' user3"

 # GROUPADD_PARAM works the same way, which you set to the options
 # you'd normally pass to the groupadd command. This will create
--
2.25.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

