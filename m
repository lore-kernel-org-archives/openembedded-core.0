Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90467D5B172
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:02:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.14659.1730192520376782949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 02:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=hVCvMOvH;
 spf=pass (domain: prevas.dk, ip: 40.107.21.83, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DinVO5QbbWTfTgdmAOrHd+fCfoSfbybOx0etxwJII1+kEr7aqOEHgesmfze95pwkGqZA7asXC6f2de2+V8YR0j2lG8wkT6lewVyW17e1bcvIx1xfMAgWW+Uwbbm/OGPHnA9YL/chtN2Vwm7p+p6BbKwlbtgBoeXPzF91pF+l1XhwQ5vslXPiNIyfp5oJ0Mn59HoEq3EicIzNa7sl7My66k3DJPqie3ZQFnSfPN2nDZ6V/cSzrNC/AWXOFN4kwFzTJuPvGNLnOqwiFrybkM+s2rz6075gOfxfujQYUndspGEsfkdqnYd1zwPqyHHjKA6rq35mGSJGn6PIfAUeWabpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aUBprRzaftVQ2SENuWaZOY60yAp86zj3yrWZI+oSf4=;
 b=CYJD1zLtBCqjpMz3VsM2gZEhetrbKyQChOSUb/7bK5RQViHrtL5Ythd7tDf6keNcFSyntCsyGPlccCQSqgAq1EwdbH85OUrD/5EMDbSuCDNYe47vTP2+329Tycs6VQPFsRn0VggRKROpR1XINRn6fYOirFvzx/L4r4YTL+LIUcPXWvRpfCqEJ5NcyguG7gayFfdICaik/l8wxQeX40UkJG6KsjjGtTfVllRHWDI3qsS3ezpZMoMc6bNxW8C0Dd/MxkaCE8dGjzB6dZLMakm4NBQIs/P29y1SLtjJPw5OZekCN2/41rDvmP92sltJpFuaecEuEobBOgpHzUb9FyIjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aUBprRzaftVQ2SENuWaZOY60yAp86zj3yrWZI+oSf4=;
 b=hVCvMOvHg27ISQR/HgSz+x4+LnnnLMvIVVi0PA8zTQBMMVPnFAF4ADXApxLkzMXwVBSbh7555NcMwnBoE7/YxuEFH5Ue/wJnBh5JuYWvBR7eYJO5Cd+Mm07FqOEGWBKnZA7RfQSCrkmFV+a5a33ER1GehVDikDYBq0yhKqBn8ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by VI1PR10MB3582.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.15; Tue, 29 Oct
 2024 09:01:49 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%5]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 09:01:49 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
Subject: openssl environment variables
Date: Tue, 29 Oct 2024 10:01:52 +0100
Message-ID: <87v7xbjn9b.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::12) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|VI1PR10MB3582:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb4d151-57cb-465a-3aee-08dcf7f852e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3CZEAzq9Skco090f2wYq4leyy7rUMXG+UmVUMxpnpngZZjakXCXzGsBNx5jE?=
 =?us-ascii?Q?SNG5g5dJYa4LgLfH0ewB0GtpRd2B/2dphVxb+1nBm4LA+TFJBAW40S0LtNuj?=
 =?us-ascii?Q?k3ov3z/to00w+IOFPq5WQmFeNPX/jgC4MQH/i1JmWe/qOZAvulIa6jv9qP5C?=
 =?us-ascii?Q?LYnj7Jz7Yw5mBwbW309RmzvTdRAqYuAffvf4NoPdlj0eojlVrxon6P31P2qZ?=
 =?us-ascii?Q?slJ4reA+JK7c5HgjE8V61CT9KS6nzZJr0PjvK3Fu8wklJQBN9V838jrXnMhA?=
 =?us-ascii?Q?q7GIkC81ERvHXJHGdxpH+Vzca+CnVQXidNLhHjEShjhKKaSBb1OLEQQMhNJQ?=
 =?us-ascii?Q?TYhUbCYm20fgO/GfWFctO27STU3Qbcs/5ZhNgSD/z9p4bhjd2ymIhwADYnk3?=
 =?us-ascii?Q?mymOk2hbwT9kNyYHtWAyd6m1jMRvBdIYqWlhcXdwwBlyPgXdeFgQYV4AkehP?=
 =?us-ascii?Q?SCx0J4AS81lQvWdwRyj1DUgQO52rrAkFkuEaxLhy2sOGDQReyEorUhlRpvWk?=
 =?us-ascii?Q?Ei973OqMwUwJBxId8yENaVObpKK1IfCJZBYHcC4Q5h4I+46ORtWEHnUdGj9D?=
 =?us-ascii?Q?4prH0PuaMZKMev3gAA9hTSr/aOwC2Wi/REI84a5oxEJmCvEQdATwCmbu5MJ0?=
 =?us-ascii?Q?dGoSpVKBCTugRmLkuwC2AT1uxHBWDIN1D7hb/kSuuSkRxYNb/F7l0FK/xti8?=
 =?us-ascii?Q?JEp8pI086St+a2OPCnMNZcbuMPn2K7hDjwdS1AvFy1kPlD1tRJgJlVGHrhg2?=
 =?us-ascii?Q?Ehc1CN5eppV+kHN9c8Qe3O3VWd+kQ8qYUaQ8uBRFIl+ht/PeV1xKPKAF627v?=
 =?us-ascii?Q?evxPcIkcob/etvWkjakN85jjAjwpHqPsLKrsFyWuMCi/NIP7PiZqHBDyCr+Z?=
 =?us-ascii?Q?tCUuVdailPHsxUMKa4L+R2fQb6out1ytRYGDmVpB8ndPfWKb34NuBI4unNWe?=
 =?us-ascii?Q?sQCgWfC58F16lS6xaVhkCP6MTFuDxuxUuRtvPyyK1OFTo1JlonUcoY1HWJya?=
 =?us-ascii?Q?eKIjj41kki9mDI9jGa1QOB4H8V+wxmcg2cR/H7LEInL7XPXOYWGkvWp/OFNG?=
 =?us-ascii?Q?0v3mISUKsrz+F1eVHbKdEQyVRB5cB3IImPG4J+d4lKCOkZs5lDRu1SBmK8sY?=
 =?us-ascii?Q?2I07M12CPMmv9YuCikjbKSKRbe8LQTKcjKCJ7jQyCikPmH9T6wDSoKPA9P3U?=
 =?us-ascii?Q?cxmzD2mdsJh3xnMl/ZBE6Iqn+ZvCK//hCJY11yxVh9tv78Fm/9+7MJatnJxT?=
 =?us-ascii?Q?F8Dn8Biq2pVDyevhb+qSG2T5HjxjyE/UHg6+jGOQXWy8jxu8copH+FdqXU5n?=
 =?us-ascii?Q?mGGCwkhdTBYMqwLxs9KlcHPtfKGuKi3Yndnc+nvthecEK5+PpXH2C9daVh3b?=
 =?us-ascii?Q?qELhVJo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HWQaxG5n2+PQ8onKUjBzpQ6Jbz+t8usOclClHmqBL0QU2BBLfn1Mrn2YG1+b?=
 =?us-ascii?Q?QXzxyXxdjqabVS50VkeoiZjmO+mtOtxWl+eV4JFw2RC3KiFp4aQ4C15Ymk5C?=
 =?us-ascii?Q?SheJR0dnPjhBiCG3T3a/GHb1QJ523ul4C2C4aRU0+AF7iYgPwfa11pcAUSzQ?=
 =?us-ascii?Q?mdsZsS9Ai8lwugOvTLTyIhj6tDvqGb+sgnMzqXaW3fcwd38SmdVOx+w0zbh0?=
 =?us-ascii?Q?Hyx42rzrHw94yjKHsGd4BLKZ+/KMufRMx1bG6IA/N9zhYq4fQLorMOKAyLNJ?=
 =?us-ascii?Q?J5ptQipjSBH4I09WLzE7WDDeaPLP/Txk07kTxJtaXdf28pZr8R/zg1uIwfkl?=
 =?us-ascii?Q?V3wlq7MKmeGsfJnRngmJ0J+uXyxLMSRHzC4K4gK3l3hdepFiPwe3TQun5pgW?=
 =?us-ascii?Q?vPwD3MjlgFF/ybU2PNdkaOfwwvtLE4m6lDDq/3ZMuQLM3trilvAzAnxoRvhR?=
 =?us-ascii?Q?wUG1CnWpZFRdDgpa9m0HwyMmmB/ltKy33MjOGspgQyjlOH2ebQo0S+intHsy?=
 =?us-ascii?Q?UaBkN9aMEuMMHgwdiZJsdO9l43At3URwaUgcok3O2Bowp8Ort3rupSYBzwtw?=
 =?us-ascii?Q?YOKS4SqPspHj2V4/1iMquSMQ3Prh76vhuKQTnF4rF0VJ/8vlvscxCcTljFM+?=
 =?us-ascii?Q?+TrrGWYhlO0nQ7bwbLH6Ux2sHtKQXEGWtzLUWnhySF/g00PWC+b9h97TqxM+?=
 =?us-ascii?Q?rMFY33Hq6RNA7fSXlg1YLlPHLQRriZ5tV7q/QTXQmYW0prnaoJ9BJM7+2nmk?=
 =?us-ascii?Q?zM5HnA3iqBfXWNUo68om/FQ6PDkkrqiQ79M/K1cP8EFjWbcpoo2vWaawfcqe?=
 =?us-ascii?Q?AMe9Hjp/C6NKrrwOzLRn2QfqID8WR39LowkUxCkKirgBJZ1VYpue4fMwmlV/?=
 =?us-ascii?Q?E87eWy5GjfBmZwF2we+Zedg10oOznX8Gww+JRGuPDOxq3Wfzv3Dve4Uiw38Y?=
 =?us-ascii?Q?LyG3PTlhmx5NiWvnsFhPMtzgM0BMf/4b7mLSsADuzRzMAxuaOgt6JVKe+LuD?=
 =?us-ascii?Q?a6YvAvSCrGdsyfd+3vyhLg7VSDdUYMZoqCQYy/JgMUeFaUQ1fTwWZeh0vQub?=
 =?us-ascii?Q?hFe+hKAIFza7HIqpwUmrCa5tlxf6fIhFlmnsTIilTGIzaQdAk21ZUPgDzOXa?=
 =?us-ascii?Q?BNUJWLrLfcGxESX/4r8wRae5TjJ1qGRL+e3pX18Tj7rSzVge2RDujwXvdcbm?=
 =?us-ascii?Q?QcHXVAd/EMJRR1GUMKVIptuMb2J6RpEYUv6+z8FHaScyLzFL+LF2V7le9ue5?=
 =?us-ascii?Q?sgL31jUbCdg2CyEPpgHaHWKgnJd1gKdhHZwqwZAJ2cv6Rv1V2RQfs5UNxxxq?=
 =?us-ascii?Q?xHAgTVzQXOTzkE5SLrVdHXuWdQpqIlh76BDs5nuxoqdO95rM9lnBuf9yyIKe?=
 =?us-ascii?Q?PVpR4VKX4mUyPl3IHnen+qpTVzrYN8d/rXDEPhEBa/durArspSrOdtPVtqRA?=
 =?us-ascii?Q?9qfvWkucV7Fklo2HAI/tg2In7Pnp4LgD9zsUMqw3jdb/926P6Ve4rfwYpD2w?=
 =?us-ascii?Q?qG4YYvCAX2nfZXI5ozpMX9d9jVFMRJNjJ6j11mHZMpuojuj0XD92t71DQD/n?=
 =?us-ascii?Q?/XS+4G5fyiNLnfM+a+6NDs7HeZOhC2ch08lec15aJHfqkgg4tgi/KVE71nuW?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb4d151-57cb-465a-3aee-08dcf7f852e7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 09:01:49.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BrWLn7cxrwwcmkQlT7WRgpF4EbnIcsN2Mt2knNPJpUby92GV+XErJ9uJmjFooi89yp7D4gJJr+mFbrLN69B0C8dVzFc71NCtadCGXeGAOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206475

Hi

I'm wondering if anybody has encountered this problem before, and if so,
if there is a clean solution:

When using openssl-native, there's machinery in place so that when
openssl-the-binary is called, it's done through a wrapper script that
sets

OPENSSL_CONF
SSL_CERT_DIR
SSL_CERT_FILE
OPENSSL_ENGINES
OPENSSL_MODULES

so that these point into the appropriate STAGING_DIR_NATIVE, and then
invokes openssl.real.

Similarly, when including nativesdk-openssl in the sdk, there's an env
snippet installed that has the same effect when the sdk setup script is
sourced.

However, when the build involves some tool, say (uboot-)mkimage, which
_links_ against libssl, no such env variables are automatically set
up. This means that if one tries to do something like using a pkcs11
engine, and has made sure that the appropriate pkcs11 .so file is
available in sysroot-native, libssl still won't find it because it
doesn't know to look in ${STAGING_DIR_NATIVE}/usr/lib/engines-3.

I can of course define and export these variables myself in the recipe,
or in a tiny openssl-env.bbclass helper class, but this feels like the
sort of thing that the build system should take care of automatically,
just as it already does for the openssl binary itself, and for the whole
sdk environment. But I suppose that by the time dependency resolution
has figured out that "hey, this recipe (transitively) depends on
openssl-native", it's way too late to inject something that sets+exports
these variables.

Rasmus

