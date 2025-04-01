Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A05C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.113])
 by mx.groups.io with SMTP id smtpd.web11.20054.1743516309641251854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=TzN8HXx3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.70.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUBZv6CIAe7z94XyHrK+sQhFk//jL/VMMGMlT/V1PtmY6Gj5IH3mFVGDYBrK7lH6Xgb8S469Ts/UO5nD74BOQQ9i8N9jeTaN3nvIt9awouMu1KqAOHH1unW+sKef2eWrBLipYMhsa/7RQCAnKonCAdFqtmG6m8Elz6i/ZdizmOco8Yvi0A0PZAbodXnNWXzQxU0f90txCJZjERlCEcCLHBpQ4lV8Oc/9zdMbspI1SAxTmsRcAl9a11lVatAW+P35iiujUhYwDuiCQ2UjUoCWED18yTryFKIzGiVI3nbXrfMmI4ZV8eGwZRGOenlH5ZLkZ4dWSXg4wE2vd5j+1KjY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1r5RkvnMFd94EnfJ/tAj624VMePeAgpxqi5rNXVarY=;
 b=pgccyozxRs5kzBa1NIQ4s0SHwU03K99a0/KEF0pcBrrwVJ+1+FsydZTcrDG4+ybkhnv06KQxCq1lE/jTdOi/RZrOtMiKibng9UpPCdFcAy3VLtS/mRPkCdePLm9rznq2/tnGQa3t1ZJnpvyDKQuwDzRwqrKdwEBpzaijmVG6xbcSrSQl1DIHklHt3bahJz3RnV06JbMZDfghjBn7v5aAtfm+DsfsOIOh3pV0y8bbZMn7TH5aU7L0cBP+WWVE7ajFlcJkT8ONLQAmyG6J8KbTLS7/gL/jURSnBavnjW4mDZtNAhbmoB0VMMs/d2HeSl9B/cy2gz3RObfF+93Ai6aqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1r5RkvnMFd94EnfJ/tAj624VMePeAgpxqi5rNXVarY=;
 b=TzN8HXx3vbGr6UIE33oZvb97NmWKKW8maoPQ4/bNdaeOVYb4W1vEDRns4/JyKp15KWDjR8URop6reondwTw8iEWJ5mwjbY053Uk8Y83rl+dsI42JpZiHyg6+DX8xz9cHfWjoCi0yF1n5xzY0WcsKru3uuM536c+KAVfnX2aDoO6ubHn2I8ZnKQpeRxYEZv8Ite+EKsp4lQ9Gwk+drVdexTEi9XT3Tj6+BK6lGcx+gCmlTlIjiDqOjZPgbjKck14eRivggXNWyGUs6I9JX0v9/XZ0Oa30XKoMi+iUsKjiIp7/xJ++mBfZoTeywAUEGnXnEYQ9pJIvIw4WBl5bnQ7m9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7088.eurprd06.prod.outlook.com (2603:10a6:800:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 14:05:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:05:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 1/6] default-providers: Add VIRTUAL-RUNTIME_dbus variable
Date: Tue,  1 Apr 2025 14:04:25 +0000
Message-ID: <20250401140430.13837-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003849.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0c7085-db47-476b-8662-08dd71263488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LKvrw/kisOxDFlhWjz72oG9A5t0xfxROXkfwNPJ7T8IhUtq715LB4cXHMBxp?=
 =?us-ascii?Q?f/ynV7GJMAPaHP3rMbDklTLS+mG4SNvYg7YkE5JSmgfMyqoEAIe8gYAymPjx?=
 =?us-ascii?Q?eZdQ16i70OJMIA0Ll02P36XBhzLQs9pN6rJhNUNO6+HQGRSeDI8jFREg6LXw?=
 =?us-ascii?Q?1RHtLCGATZteqU97AEBRWe0Bgppy5lsz1xIK7ite1KpLSKgdw/JMS4VkWOvL?=
 =?us-ascii?Q?5acBLEoumi5tlmDpSgt859mRVS8i4+oQKn6fnZBIRSGuVqx4LxlRINnKwT1S?=
 =?us-ascii?Q?AY9wy5+xG3XnKBSDc+BjvrT+GJj+UBL+sYmVnCtupSnxZvZWKbr/V462wdiK?=
 =?us-ascii?Q?+Rih8vmWWYOBhb2H5ZcYPp/LZ9NT8yS0NDFu5hX+QKrirCRToI/ACFW93sga?=
 =?us-ascii?Q?3fkLVf9ckef6+NRsWemwTwqVasOcVLsYconFmqu6UF3S8nyALAT4I6jk5j7K?=
 =?us-ascii?Q?LMehPiFGi6wcs2eYNnBfxayGDJ+xdI7FCwttuKSiazTKUiV2VNhsOJKHSQh9?=
 =?us-ascii?Q?x2jUN1xmOfoihUf64orabbuv/S+vG84qlEkuEHHo7BZdciAubVuB8cS57EA/?=
 =?us-ascii?Q?r9KY8plH8m36rSKL+9LRmuP3jOt7NaA4Pxgva4GhCzJ44HvoAXQbO5uoGixy?=
 =?us-ascii?Q?O1mlfPn5BdGIN2LNOpF3klaxitYI0EjeUkplAsJD0F/VbH/7JoeGCrhn7u9N?=
 =?us-ascii?Q?kQuuj6sRPmoBW3zWerwyREVQjGqNEfITToPSWz+QBqW1Skvt0XRlvFWy+9IV?=
 =?us-ascii?Q?hX+iBWRgggZj0xjcKfYI4cmLJNoClor7l4aMKLnW/QTqXMbM8bHSGZm+RqfW?=
 =?us-ascii?Q?nLRfvOGUdRn6SYFmIaediHXtkH3vkEtsULiiiVT5JGFMSLUo9haazXqTYF5w?=
 =?us-ascii?Q?S3sWmY2OkSPMwRsp3KPb2VCG2L9OM/6hhHDTE4fqwyugfDLzvUYZ33O165KD?=
 =?us-ascii?Q?ZWXBVoUCNqfmRrLYMky60iru2gggUPurVLUsEo1GC1GthOq1BrujD99A2Mcn?=
 =?us-ascii?Q?B2uyF9zZXeWLjicBruBLIVmYpEvkG8DxtN5EzK3hjx3E4Sn7dOQZGHySfaDm?=
 =?us-ascii?Q?h4vUa42TD63G3M4Kh2oPLm1WvSg4JUtw5WX9/Q4BdStnAM5CRnV+rSPZe1o8?=
 =?us-ascii?Q?i9yrxOMgJgvBtmOr//s8buK+acGISTr209Z7pYRI7IR6YJXNIAfcgSCJ+vOq?=
 =?us-ascii?Q?ZXybtmwb2j5IX5RjX6yVEypfBjpR2hoaXsUnnStoiJNN0bhKMWP2ddb4C9XS?=
 =?us-ascii?Q?ILhF6vKN3RPz8phGiWNrtloqRyTo5E7sRGkiaq6lbN5MUbUdI6A7wp+KWUlo?=
 =?us-ascii?Q?eKscnlEl+ipImnGrjcX8bFlTBaQM7oqx1ifBnTGUAoXTjDQqe0czFum4rAPj?=
 =?us-ascii?Q?/fArbir3+IbBqjoIoEqtz47IiQuMgWQNDr5XYOVzL/4ixWa3jA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QBvLZfhVjFYWqkpUIKMHdeWCpUFcDJsHEOcWUjQpq54TIV6JPEJYc/AYk4fU?=
 =?us-ascii?Q?FXVYI13lHFKkMbOUqo0NHIgApamTxPm++IF/V5Pp3w1bWMnMtvV5DebpugQQ?=
 =?us-ascii?Q?/qt0PUInZ40Nu6lwP9d+o1q7k2WW3m9o82fKkm25DLozPRq3RLU4MtKymNUR?=
 =?us-ascii?Q?TBs9Q9e2o181Y3XoZ9jy+Gwcx3RqIPTJ4a033Pz3HZF4bTp2v68aL9n2/QMG?=
 =?us-ascii?Q?O/rE8gYS3Bx4ctUm3SF43rxx9mtRdwJTETFKaf9hvZ/YtFu4kM1lRk3WQKIo?=
 =?us-ascii?Q?gWO02YZfTarTIDSRg0/5k9a2q9IUo90i6nanJOVv/J21H1j+/nCrhhHwDGFO?=
 =?us-ascii?Q?Vxx65byspUmiR6zyOoYjUBUUR2IhTK0igiON2C9CMDIU7CZ53Xmj1yFjciEQ?=
 =?us-ascii?Q?Gs0IQd5ulT9VxUgp62+rxJYFN9627c+YyVlDaD2/yJX4Mpab1w3ub7HErn02?=
 =?us-ascii?Q?CHgpQAcvgi2H6Eq3RMh2i3oBfalFPMOl+qFYe5lBJTaCZxsCH8TA5pWwS+1j?=
 =?us-ascii?Q?M+PcpAZgcHrM7m9SQxXfAHILmNKndgmej9TpY6Ww+rpjGGrjI43WVsS1+8Ck?=
 =?us-ascii?Q?tezxmfgKgHCz4qXUSOlFvEOX+obm/yH3+/nYd6W0rlpZRc1/p+AjZfcwOuIu?=
 =?us-ascii?Q?UGkCaBW56lBslHBV51b6jaU/t8sBpiAYqUuXe/poYnDSdjObdviN31IH6vXt?=
 =?us-ascii?Q?SzXl2YgvshwJgyMddsBprF1AHjcJncnBMbkyo8unD8n+BQmgI6r4XR+QKoXF?=
 =?us-ascii?Q?TCVRn1CgZHnRpwKku8RuU6C2YmAceUF2NSo3Jo3+Cx7FuWOtVc4HQ3YYUKud?=
 =?us-ascii?Q?BYn9FvKdEblTS2rlc2rZC1sBpNJdDbU9QkANPb0BiRL9Y6Nxc40/SvtdSiMf?=
 =?us-ascii?Q?d9SGrkyj6zTnLCXPF7UnXHrPy4TPdOelNMiOHjnHmheqnrBX9aZdEJms1KZD?=
 =?us-ascii?Q?SsAQTeMbDNHxLpTHMUG0mzWX+QkRGjdDvxWP5lLagWMXMA5YiLslUXiuOtCs?=
 =?us-ascii?Q?1lc3bAdL3yxPoVFBWNa/fm5o37eGj8yp4v7sgO/Q5ocMCx2SVMIWhlsF6DGD?=
 =?us-ascii?Q?FQmMM6OkknjCqQyymNixkQpebdwZc/MVl9WihtAfxmTLWJPh39Hbv1oM+rJh?=
 =?us-ascii?Q?Eh1Ro/+xSBccddgzAl1FmammkE8shpYPkoRUrS5iFH0+mTtK5ZwkvRETB3Rk?=
 =?us-ascii?Q?dXXXbgbxLo2EiCRr8o6gdBEDlW16ju/2cjfzMq3lmT4KgugtNvuavfbevIMH?=
 =?us-ascii?Q?KYIQf/KVSmaV+0+1GR9YFuHnBQs9pEW0tuNNVc3OzWHwktoxc75Qc9cWZ9jR?=
 =?us-ascii?Q?Yu0cj7x2Bv/c13aJUmtiyANtZX/pYexKMswrNn0px1C/PLYgO3Z9OK1x2x/4?=
 =?us-ascii?Q?/y1mtfm+HN2pvqCnzx2eM3n8EJkNJCj379RWajVbiZixZwKoj8J1MbchV25R?=
 =?us-ascii?Q?q2rftnKzJMOBa9Mb4StRctOXxNE/UYvpBPzoOk5erIT5yZA6fsvCgTz7jlDN?=
 =?us-ascii?Q?LAEcmeTGrntq5ftJx2Gzr537UrSy6FzYnAxR7ImISp/YxTQCC+1qo6T3s2Sw?=
 =?us-ascii?Q?4j6NyZlAVbWnjTyS+zU34KuD24Qxa7GnQLVU4UF4CO8yC84QEfvu0P4Tjgx4?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0c7085-db47-476b-8662-08dd71263488
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:05:06.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJNW7fS3lmZ96jdDkL05J57BCXW/ipNkag8BGM23pZ6ux3KpNlvkqdCtPrWbQ83uI3Tbv68zcIDk7D2A43TmjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214129

The purpose of the new variable is to facilitate oe-core users who wish
to use an alternative runtime D-Bus implementation instead of the
default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
is currently available under
meta-openembedded/meta-oe/recipes-core/dbus/

While introducing this facilitation the intent is to preserve the
existing functionality, while allowing the user to optionally select an
alternative runtime D-Bus implementation by adding the following line
e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus =3D "dbus-broker"

As a background, for example the Fedora distribution uses dbus-broker
instead of Freedesktop.org's D-Bus implementation. The following
excerpts from
https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementa=
tion
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in =
place of the reference implementation.
  The reference implementation suffers from long-standing issues including =
potential dead-locks and susceptibility to denial of service attacks, which=
 the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log mes=
sages.
  Any visibly different behavior to `dbus-daemon` should be reported as a r=
egression.
  Ideally, this change should only improve the performance and security of =
the message bus.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
+VIRTUAL-RUNTIME_dbus ?=3D "dbus"
=20
 #
 # Default recipe providers
--=20
2.39.5


