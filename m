Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0351DC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 20:02:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.74])
 by mx.groups.io with SMTP id smtpd.web11.4552.1720641754397676943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 13:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=P5svFoQa;
 spf=pass (domain: prevas.dk, ip: 40.107.21.74, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8UKHfl9zCeqUOq4m44A6lJx0IC/WsPoVR+G9oSaRVoM9Hi5kqWEdCkDgCYiKG+3CU0wqwuWDjvq6W2g4KdlJNx4EOKmVnbjgk7tFeacM6q9gUFdPEmtLtdIze2+LISjKgHv7W7sLKofuBd7Y6njMyV6c0UC6dJrgfcZ61M6NmiluOjmoKJ30guQucd9q905jDoV+CVU/AjjcV223lJkJGWOEXHBZgABO4Wn7F6Hr5xkR1zXpvlmcCx4xfGGtOKWRRzivo3wbSs26OBUVQ5OAeHqbqwIARORwRQH4vqSCEiM7PqnWEKHye8LgMoQ4XiRj8yowDokgSDDfJ2CaTZbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rae/fgRe7feJmMeQApykmsKYHq4Y39uxZJg5UwuZySk=;
 b=LLFTl8FJt97/oMAykDs+NKkXS1wR4GJQiTtzBhLDt/x3DaWZWLArglMYs0Cd3LKoJMRk5MafhN8Tj8BZiQovhH89lFQHIZgd+2X0NWbJAZSxT2I5d/vnjRDxBTvPv+Qya2ux8z+eegi0NYzJOO5F+r23y+ym/llaO5MzxfVk4VjfFPkgEZ3FzrOtrONbhiahSsIQwgjCffT1qZ04/4g7ut3MsktQrcWJgeaoLFEfwxRd4+xyzeIHeBdCZgF4COmzJYVCpUIQMXiCtAUZcEIHJemU6muF4MtcP54nMGi3s87/fQeL2Vg1+LacOxHgLRDEpwjwkQ7Upnv/6dN4YFOLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rae/fgRe7feJmMeQApykmsKYHq4Y39uxZJg5UwuZySk=;
 b=P5svFoQaqGunpITANGYI3j0vCL8YKoaAc7H/FZHt/KvKC0nd86FjPY8kEaXha0i1HBOncAc6OMwJMIfa3MlWpsecRGZbhK9u/6n/XcE9Qr+8fFa7Lq7WdKyySGPSUIC7jkQEq8HavAZ03KWR69lxsHoGglNko7TzOVu4rWMP9ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by GV2PR10MB6090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Wed, 10 Jul
 2024 20:02:28 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%5]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 20:02:27 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] iptables: remove /etc/ethertypes
Date: Wed, 10 Jul 2024 22:02:28 +0200
Message-ID: <20240710200228.2602597-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::23) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|GV2PR10MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 164e76bc-43a3-4fe8-9400-08dca11b38f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E3ALX80c2OWtBzcXFglZcm9YB/Utk0o26IBk2tfzxlfWabc7h0Xs9a3Le7Dn?=
 =?us-ascii?Q?K6pJGXe2CB0jRyGX7VGcmwdl9yYqUom7lB7UC+F8bTRsAFlgo0up9nZ75iM9?=
 =?us-ascii?Q?DnCcP2QCYU0P59jYM+2Ficc9EsphCnHGj/doQLRY+Uw0DLJgUvejfLSGfrpo?=
 =?us-ascii?Q?tLnVdLpvq3D/lHR3vBsVjhwXNjH0h8YleDj0EuCQeyI5wyhyghjXNqBkRJUo?=
 =?us-ascii?Q?8R8ftudgCujLFdS9dTU0aJd87OtkAaKRELGMxq7E7jSWXqmZEwKpjYXlvhVY?=
 =?us-ascii?Q?iXkPtwjEO7VvqOPfrdT2RrLac100BId8OFjlybT2+3EkgNAc4YB1sXA9gUZd?=
 =?us-ascii?Q?hDki+mTuxdRZBPJe0QnM3suikFW+qR4RawmPCiNy9bm9adJKygpueQJi18Xi?=
 =?us-ascii?Q?F83sRFPtunI6JMMoF1mOJvqx26KyI2UX+bIiU27zY9COCV695dqeHforc3gY?=
 =?us-ascii?Q?ynrWIjVYVnZzvTwD3i5D9Q8rXud1PB+OIvrl2PeQKD5BTcz1oslZ9YKadTAb?=
 =?us-ascii?Q?cNbXU+Y4BC/w/5f7f9mxW3MPrFeiKL4Xvj0weVFK7YIqWWrJMnE/prdhipOl?=
 =?us-ascii?Q?8Io9eXpkYMd3TjsjXkb/F8HKxsWAAruBaG7OCA6pSqBnXeQmwlVvvOYq/cvd?=
 =?us-ascii?Q?AcaUh5y30rpKvKgu+Z8cK0DIVtSIF41xhTGdz3jvAAH8Hha+BmV3oEeBEezi?=
 =?us-ascii?Q?NU0++UWblPKkbzGVk7bwWjwNps1LxBpxZR2+fl2sdShYjEBTFtd+z0fWgCmZ?=
 =?us-ascii?Q?JKqFUUz+vstx8wKWxqDHTzVsJBfZwpWLVGreCtH7l2xtaKRJ7wuBiBsCnE9H?=
 =?us-ascii?Q?+OdT50z/hDAAA6FQHRi/E/NxcNFwkR9ffAA95tqGrmM9t9BVN6SHEsVNk9m1?=
 =?us-ascii?Q?GNIeN8YbJKcZ5Ecfn/1OCZyqAh4QyjExXDcKExemkYeMQTo/ua2kP9smACis?=
 =?us-ascii?Q?nzUcY8xiEH4NASja9OvdCL8OgkgXt/b8vhZ25Bdqgq5cSnTgrd3Pv2+nZvts?=
 =?us-ascii?Q?r6Woy39p0AMBueR8GU9dHf4DpY799mdlVjQm8b+dyctJj+gxO/k9UJl+ibXX?=
 =?us-ascii?Q?pol2mCjEhK0aaQ/UOeGo53KtNj7YehhmCHtgrIXHI5E0bDjcG9VOKRCdPMcO?=
 =?us-ascii?Q?D2MVfFVFdyfhIdpeMO5u+M2cm64xY0qzBKvGWcpWEkQKpSdfkPU/o5RDAVGp?=
 =?us-ascii?Q?gwzcUKO7xAKz3cQ0uL8n73IgPS43OExr2IHQ9S5eFDaRuFBQl0EsdSnBlevK?=
 =?us-ascii?Q?+kZYipvIDGSJx7QGyN64RefubQJcylM/PnzqODjVJJMeIVkUJmIZRf2HFq8E?=
 =?us-ascii?Q?V4JSwULF6gSNpaUwHZ5m4Ql50LYfDFdNqez7NB6xcyjFSMmAFCTWQvkqF84U?=
 =?us-ascii?Q?kccseClLtfbPN+HHbTs3tuhCjdjr3s90DnB7xXXgT1QIxtmI5A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M+1mZbE07cyoWmGSk8+eNh9ClG1lM7FTnoQqZRcuiQHhTcSzZ9wGi994QP/3?=
 =?us-ascii?Q?MOqlW6Q7/27/SAgxgJFlKIxPzKY8A3R/8M1qUzur9l9kr9dOHbisteDqQJyy?=
 =?us-ascii?Q?+BP7aSDeKUOBazUC+KwXKaJHZKYQGSmLx2fk2fy9uNT5pwopUXA1js8L/Qr0?=
 =?us-ascii?Q?kNRoID3ZF/eYC2gCNtK+0mOV/+T/2m+eccSdELw9gO1pwqtM7yn2t7Zgpm3k?=
 =?us-ascii?Q?zyh5KSCglSpxv6zD5Ul2AYKknbqXvBUgxL70L5YYb2SCqAA0fzN89Dm0lt5T?=
 =?us-ascii?Q?g8FM30ThhzOI1kxdoUO5PrLMk68BbjB9jJ72b05wfUoIqJAKMrj5Axz68Poi?=
 =?us-ascii?Q?ecYEaDb8gqXUdgC7DWPDSgK7+UbH0V9uzUU80GUqE0ExE9TO16haISwMhbKO?=
 =?us-ascii?Q?FyvFd3hEW8xJJfS2PN0Prb1bq2Mxwce/3vtAXZK9uap5xNj4mu8Q8hrYe4KT?=
 =?us-ascii?Q?SIAK5DCOA66azcTpsZDq6yckSNnNq3KYWx8ocnj6AoqA++XpmsTohhqwyHy6?=
 =?us-ascii?Q?XuMcyJmZ61W3PWavtKl7SSqfH2VKPW8Yigm3XHDPQEMMFZqMKcTrRDtqifyF?=
 =?us-ascii?Q?J+Bq9BO23JtCnxKMfpmNCw60lngl9Ekb7pQ+nwtjTZr9LjI0ZUh5gR0UpQId?=
 =?us-ascii?Q?tnDcQjmGtnDw/EyWYTeanNch/PnncWlsdNIupGdKGnSTU/qx0ukyAaUWkNoJ?=
 =?us-ascii?Q?GQS842FYuoSwYOSutZOjiU1oIhv5B0YOc560Ow284lxYFeHdxeyhYCGkaI83?=
 =?us-ascii?Q?xrND02LohHaM2XKZQ4tRrT5vJ4BPpyFwar7nj2HE3nKL9AMaObcU1IaEF9mB?=
 =?us-ascii?Q?YrPRdeZQLptAyngbOyKUhd2KlHzLxQy4chmdpwt+lFvvdcNN5n3SaQvsw0By?=
 =?us-ascii?Q?p7gfoxh4GrvKjmMTwYDkYmvt3iYaAV/GqB03w/EoRYo5DHj+GKr4H4aO/ZYK?=
 =?us-ascii?Q?V63FK7LOejbSMse6g+ZhirHiLbCFN2DnzaFH1CYnGON4OphX1SM1KQ1Ygh/x?=
 =?us-ascii?Q?zlEp27ZDSifRgGrX0Aav3ZGXgLEG/Vpa/KHu4BfMjfSx55oYUj5qjorxyEfK?=
 =?us-ascii?Q?QGCcQ0nTvPHN4HgQs1mmuTrEsWV7r7PaYAWoG7BnKRTU00wH+RDE95UGrJHn?=
 =?us-ascii?Q?EriVJIG9dkYC0v5fBVIQcv0czhaTeWhYDPSSKd5W69TNtVQbTQChJ+9wJCOn?=
 =?us-ascii?Q?DivlK6I7XhdaK1fh7PIjeODQ3+ObGvpF/1dCUG8rIaTy5gbHDsZ/RWMdK0Vc?=
 =?us-ascii?Q?EJzFSziOERd8yJLfMG3zO8J+PjhBYU2HPpl88qh34BjytL0bkHrPMhHie4tZ?=
 =?us-ascii?Q?kW7wSxTpfeAwcasDHy4AVRmiN3lV0eFQN0UMFPJvudBT0cItAV6axGiH92R2?=
 =?us-ascii?Q?aff8iFV754pwjZhcs7M81PE88W+F3ttmu1suDDVP6sG7PTK4HREObQh6+y1/?=
 =?us-ascii?Q?ERwGBG7yjWJAH5P8gtCTtZP9UJfFSz6RNA6lTPXt9UxtVjkW2fqXYaAEICrM?=
 =?us-ascii?Q?qseJwYQJM6C/fxWgQqsyp7TJPdqDx3FVgdz2TZuZxJpCziQsh8E3kNEU51YH?=
 =?us-ascii?Q?M3kvh4o9xPD4L27Z8pDThLDrh+JQAksM1MP/qg7Q/EwXCpDslD7GqqiKdBX0?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 164e76bc-43a3-4fe8-9400-08dca11b38f4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 20:02:27.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V4OCSOHVLUA+I8e6HGu5vzwNQiRVADABQivP4dlok/wpO/Q10uSSg+Nlzk8n1PrdC+KofhkPjc9T7OZQ1/uh4wQjKGf5THnPuZEqVLthW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 20:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201741

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

When building an image including iptable built with the libnftnl
PACKAGECONFIG, one hits

Downloading file:.../oe-rootfs-repo/armv8a/libkmod2 * check_data_file_clash=
es: Package iptables wants to install file .../rootfs/etc/ethertypes
        But that file is already provided by package  * netbase

This used to be handled by
0003-Makefile.am-do-not-install-etc-ethertypes.patch, but that patch
got removed with the 1.8.9->1.8.10 upgrade (commit 4616ada82e70).

I think the rationale for dropping the patch was wrong; the commit log
talks about xtables.conf, which is indeed gone from upstream, but said
patch didn't change anything about xtables.conf, it did

-dist_conf_DATA        =3D etc/ethertypes etc/xtables.conf
+dist_conf_DATA        =3D etc/xtables.conf

However, instead of patching iptables to not install ethertypes, and
having to forward-port that patch, it is much simpler to just remove
the file in this do_install:append.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-extended/iptables/iptables_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recip=
es-extended/iptables/iptables_1.8.10.bb
index 86f1335ac8..81eba6c967 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -75,6 +75,8 @@ do_install:append() {
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables=20
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-save
         ln -sf ${sbindir}/xtables-nft-multi ${D}${sbindir}/iptables-restor=
e
+        # ethertypes is provided by the netbase package
+        rm -f ${D}${sysconfdir}/ethertypes
     fi
 }
=20
--=20
2.45.2


