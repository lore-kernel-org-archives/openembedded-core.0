Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E98C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:02:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web11.3390.1743192114318143811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 13:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=AHbF44iR;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.61, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9LJQvLrm9VFlasBaL2ZgKnl5n8PV75QbbdK8P+sQJ+jriIuJneMHOVzxozQCCpZo9rFCWcuQOVnIcl+YvGGkWgh4NhcS8ofSF4N+zisFikvT1v8COb3FJ2HuagfB0IJKS4qnDrOivqbjfwkZA8q7FjWiKd7Qf21U0IC4QeAFkYLUBdQOdrENSGGxmSefFSrobGqFGThkKD6LPETchqrRlJBQpckwqggjBoxq7xm5tm7P+II8xa5KeNB+cS+QjJuQ4IAyrrRhAgvYzyEv/f59tHg+IOxVf4c9bB9dxF7GDjh8d84q4renL0uV9A4j4xSg21/kz6divNfEkUINk15KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCmxYkuBWeZFXJzntiDN/eVSpW09o47VW+20bSN+ZPM=;
 b=xC3e4GQkumkh61xkuq2juxEMgjO19Y/IZc372FUnoN0qIyIuScQ1JoWOHx0DPOGs00gxyn2IBIeEx2Lku5woA+w++S8waXftfmGpNvCosuVRHll2919Rks8BGwb8nX+PFjvQfyBQ3rYgSWppqrXvWBK86/qMKIsAOkEix9WOHxnQWUZXXgHRyntqYvpOJp3hks+m0EEXrTwtQYmsbB8z/1lVZSJAC4tBTXeUhnKnx+PlZxzFl35/tLJoYr89np2cPpKgyKBin/TbnUOWY4eHsjx0IauLBpFa1iWmsxd0Lz+GpkB45IO66bDnef2JekgaCszxH2WVKcjYsrwLi7DyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCmxYkuBWeZFXJzntiDN/eVSpW09o47VW+20bSN+ZPM=;
 b=AHbF44iRQyfMrVC4dxOdDUzJDRMhqV5RKAox1N7ffascLBxrvo0EIPgofJ2hZU54MTQAmxwrG33FTjXZIQ128uwuqyU2RbHql4yB9UVVaHVtINYlWVK4/090rIt6UNwXT0kGyvah4eKXBfGpKugeeaRZ+zdlsjyKE2E2mPLe2vegP5iLcqn/ePDE+WXgo4lFYGVxa1q92EFk5+J3y0OxUBp9BKlXqQHhTkmZEjO0UsjJZoLoWr5cEiPl/QFMvRN8Q1OVESjxloJ/0ux4ZEIABGsFVnQ4phMaVTWrq971rKp4jTbhsQ2j+66ja0alFy1zVEt5gI5Yj7WT43w7M39J7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB8741.eurprd04.prod.outlook.com (2603:10a6:10:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 20:01:51 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Fri, 28 Mar 2025
 20:01:50 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 1/4] toolchain-scripts: Export meson settings for SDK builds
Date: Fri, 28 Mar 2025 15:01:22 -0500
Message-ID: <20250328200125.1051797-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f8ad99-cb80-4a09-8097-08dd6e336114
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wDSzV2GTV5lXDJtgEJTeUyG/ac3vSx6rEAcoNFClaXeBouHFSok1BQYUbiCU?=
 =?us-ascii?Q?Ohsp4xp+SurWU0HQkXgUlVu0Xjem82hnTS652yfKqY7SUrlLSb3EtpKWjAI4?=
 =?us-ascii?Q?SAJg4AmYreZp3tZzSXUAwt/AWK41olG+2wfAwTdWnPZCEJjhDqaXEN6fsNf4?=
 =?us-ascii?Q?daFCdhFY7UPYDcy2qgUCDyMQMBvpFCtvRLJNSJKuQwf/w3Iyv6s+zPQCnSGP?=
 =?us-ascii?Q?cLmUQYVvB9/1PZoqp1VCyDBcdbCAuiV3nqRbYQ/j3KSsBOLBKI8SjG0sZN2A?=
 =?us-ascii?Q?5ox661H2kw+z8xlS0v4gR64pnJxIpR3jL0ii/+tMsIi1ii8JR1F6QouZg3Qy?=
 =?us-ascii?Q?Rm8IfcRi+mFsLUQjHQKjHGFW/nkb4Jyt81fns5UusZgMRnqCXSKcaD5UioqI?=
 =?us-ascii?Q?4J8tcgYPMXOjgJPDb7WNGCYTV/EJFSpsizzW18PzM9SAELi8qphfYGFp6XZJ?=
 =?us-ascii?Q?NMlPy8xnrC/r9vLEjj0+b4n99ENovtDj+A3bZuqSEBrtVohPhgsJRB1JRxf8?=
 =?us-ascii?Q?bnKL49Ik1d6tRvT5JYfBLbeGkqCDwnhtHCLew7fCtXS4Y1+EVOQ7uP1P8DdE?=
 =?us-ascii?Q?b7o65t8gkxI357Kv9ht7/1JKshZF8/cIXkLXBBIn3l7aTR8JtJFjOF9rROAP?=
 =?us-ascii?Q?l80dUX5pCQqyN+c9b49ov+1bkXsng7mJrfBMLeIDN3yKtcFBgcRk558Af3Vh?=
 =?us-ascii?Q?Djch1k8GWhnQMDp7IATYFgWnsmq/+8X8ivTM3WNNS/RSsFMLRaw/Vs/oD36w?=
 =?us-ascii?Q?U8y+uaml9Qe9nJYRGchvUU4c9C/TFuMufO87F9sKbvva0F5BvrWwYI8RcpTv?=
 =?us-ascii?Q?Jg9yWkvQH1L9yv996vQMf3BOiLP2YHD0bI1Qw/IDXpbmCw/B9Yy5uc5iIDk2?=
 =?us-ascii?Q?bBaLhS1UDYhxJHYnHKXBBfd3L3oloeIhymELUeGcugEiDQS9cFhwTf5K2Pld?=
 =?us-ascii?Q?yoTao3N8/ksLNdo9GdHx89+ecfA+kmnmwIDW2Qv8M3JYwD05iugERoWZMUCn?=
 =?us-ascii?Q?Y7EYNV549z5b+yfh6S1svX6nShYzBaQFah2XyWQf8GipqBdkcAbHscyz8zQH?=
 =?us-ascii?Q?sIZzwl7FB3iU9ZM1bJxOE8OQ4xWE+AsRT4iv6MVwvYxMo1rBUpidMl6hdwUc?=
 =?us-ascii?Q?pAha8QklyibxPOyErOPCAV/E0eObZpZY6XBxJcY+qvSvubOb6b6A/LL5vHMg?=
 =?us-ascii?Q?weszm3lmiNMGdzYiljbzABb6Uz6KZFjS3eTlfOusmFAJComY5+jme43GpInh?=
 =?us-ascii?Q?QQ4+Z4nf6ri4V9DIY2hZDfIZ94CKLCfg2hmr70zK6WGOSXRtkfy+++pzgjqk?=
 =?us-ascii?Q?zebQKCD5yccQ6eFibV6Lnp4gQN/inEcF1Dt0b/vsQ0wSGgFbW1ortT6RsCcP?=
 =?us-ascii?Q?lgTi1efybRlXY6CqDhBOV5iZmeL3aqJj5NiWWKP8Am4iN35knBEWT/4y2b4I?=
 =?us-ascii?Q?MXoZG65IjxA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FhICCHzfTdRlwrXHSysB4a2qd32+6RQZoAwAfFs/ZMi6ZN1h7D3ZEPGSXhez?=
 =?us-ascii?Q?lSZEmzXeMV3kKSEzZEHVXZqXqIxa9/xhOnHTEE/tOlepO9gSAz6hRRB3aRe9?=
 =?us-ascii?Q?AZMLvLO+4uM5Pj/wh8ssQ3CDhVlQ8EHNBQ+YDwGiBxAi0UHZ/2kMbANmTsK+?=
 =?us-ascii?Q?3i5ySrHNiDz57/Cw+pS8pweY+jhdhBKfsV39miGiNyWrQNxmmH2IZOYMaf2v?=
 =?us-ascii?Q?1UFRohqozCYVIylSKDFVfM6DgFAU5E1L3ugOCb/aXBDFm6/AZCYK/oJUdCqh?=
 =?us-ascii?Q?uUv8X9VbqbLNdabNKlcoYHsh4Y3Eyvx52MAGSU28zez8mKsdHtJqYwe8bhIr?=
 =?us-ascii?Q?3bp+S+l7+G6XTHWNfNJu4wR5wR6z2AI5BWua+M9r9pIeLD/D7uNlpo4lbchv?=
 =?us-ascii?Q?AkcwnPt7HtC0f/6uYL0kqE5SGfQekSllKTmZuouDasdQrHXRsel4GpbNs9kN?=
 =?us-ascii?Q?UWQNNhJ+h0IgbUvaxMWr2LLbt5yYXM8LpIwowImWngxspkJUaIFm2wLpaWTj?=
 =?us-ascii?Q?trPb/pYMQXH6lNyDvN2EBzbW7vpC246nEZ8sFrFSlKFLo8NkqMBwEoabYPaf?=
 =?us-ascii?Q?NsUj3vpk0h4+pxTWGhyPwPgJ25BQbAH9jdMVwZytKg7N5vzkdaWxA9iLWBOR?=
 =?us-ascii?Q?fzpIFQPKR6AvGLvJU3Q4vr4yi6Cqq6VCuL5abT750NZq6ryJoNavb+L13+Ud?=
 =?us-ascii?Q?aBxEWabqY9JknETFGUwwhonTcvq3wh22WR4ysrB4H7CBblFOgDet8DVLqMtX?=
 =?us-ascii?Q?lc/jHcUAayw2LK78ccCR6d6L0lsfuTm5CBJoiWUsKmJy3GSO1jkDNfRdosag?=
 =?us-ascii?Q?weC96+40unOAlSpVo0NrdsUhy03yfwcIXHTWOqtnIL7eLcZf3LEdJry+kCJe?=
 =?us-ascii?Q?lPKVq5Q2t9rFVIXoFmzjB2F3jUFigckpsHcwtOtR80qJpg3Mkjifuh+PZscp?=
 =?us-ascii?Q?MVQ3+9WBEI+A8eSPtZSCGC7AUXk8mIGgGeNlwonZUu0Pg0DcNCHbd9HjrQBc?=
 =?us-ascii?Q?mlYHf2jisPEWlIO0nNfs5Tl50hyY57/V9zr+SZL6MAXELMdpk6HG24/H1uKL?=
 =?us-ascii?Q?C/jnw7CcNeutC37PhpZstHpnsfh4nZeYe2UMOBLPljh9GVtoWXukJi5946m1?=
 =?us-ascii?Q?ML5WquZUq5Zxp/yT38lZpJRB0Zn8/sRDlJ+FLhBuDcDrBWSrwylfL+FurYoV?=
 =?us-ascii?Q?BtvVxbXL+Xkjd10uvIpE9pxaS4XLT9Zk95Epuol+KOMbXwKjiEXkEAb3NvTp?=
 =?us-ascii?Q?J9uZvLuVlfTs/DQNYQCwG4CR21IfU6LDetsnsrGTLK/sZi2HW1qd/hPO+uMn?=
 =?us-ascii?Q?p4y9NH7rV/doWmBaGUOAeXgOEDCbf1V+F6iwRIj+MJGRlABfhOe5kaB1IP/3?=
 =?us-ascii?Q?Qzy5SDJ6mrKq0RA4n8q02D3ZTmtJBCp7AhUiajhIrmm5rmGucWLzTt9u46Da?=
 =?us-ascii?Q?brs6IOkr9QgepfnX3lTpQj6nHBbbCnuR7RGkUv9Hgv1bh0y+3J4vbxBDg8dT?=
 =?us-ascii?Q?4eWClmQdheK8AtuXa5YN4tITRiX+g6svLsCNzuCRneNfrjn2N/VSrq1JhU7G?=
 =?us-ascii?Q?U5uSKK5EMR2hkw4JfvjG5K7scnd752pFzs5DC3SN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f8ad99-cb80-4a09-8097-08dd6e336114
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 20:01:50.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPrisMoAIBn2x4YZQ/LpueR0sfb53D0GA9oZ7Rf4O23xuCB3PEHMBs26YLyCuRc9gUDc+UUMwLgoIcb4OjSU+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8741
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213866

Create a new set of exports for the Meson `host_machine` cross settings.
This allows the target cross file to be created correctly from
meson.cross.template and aligns with meson.bbclass.

Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
inputs here, aligning nicely with the Meson naming. That turns out to be
incorrect since the script is generated in a nativesdk build with
HOST_OS and HOST_ARCH set for the "build machine", not the "host
machine", using the Meson terminology. See
https://mesonbuild.com/Cross-compilation.html.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index b59a295abc..00593f681c 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit toolchain-scripts-base siteinfo kernel-arch
+inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
=20
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because =
it
 # doesn't always match our expectations... but we default to the stock val=
ue
@@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
 	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
 	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_SYSTEM=3D"${@meson_operating_system=
('TARGET_OS', d)}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('=
TARGET_ARCH', d)}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_TARGET_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET',=
 d)}"' >>$script
=20
 	echo 'unset command_not_found_handle' >> $script
=20
--=20
2.34.1


