Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25557D2AB13
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:56:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.15454.1730195806408056206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 02:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=Dj0zCJE7;
 spf=pass (domain: prevas.dk, ip: 40.107.21.41, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln7t5cXwI73YwoDRsgDee7mi1gjhn2+pk+Xdx7oxf9KveKjfo1JRjbADDvoZtSDvBGT24wKAgc6MAzw9Igl9q7U9J0t0OdIwr3Xvrz+X3KYfo8BCEASqxGkyItjoHnWFvrQctaCBZTEiEGGCqpkrPJGSzorkHVzn7bAgeKUUqyrEUVbChDS42H3Q9nlwuUd3kGK+t0y64NDjcLQS9LOq0BjWS1eKngfEikeVpBknaivA/LehLZ6+KN3HOf92DwEUdtia8VTPVBwJzRbviSJMxgsSiipnmHxZT/8OV+WIedKfoRB3RGWgDbpUGMoPp+MphoFpNuXzwpPe+vxWOnHrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tvroSQLszWlv/2X4ky/LRFG93xgJwhx7XbJabWfv8Y=;
 b=MpB5UK+ot5HMErnHusn1ityLQuvG254eV6J2l6cOHSvoVuThRl3kz8sCI+kZGzQ6FlmztXIPjsTQmgJFVYuuyHm7F3QRmMhqLStx+oK8LgGgIn427cR0zv1wnBGEVeIc76TR7b318GHdkjGlys7Ntx6G7ofGooOEPMVGkaCR2pAQby28UjF8+oySyqGOrpzg6R46PZOkUX69ynGYo7+Y8n1zYNWiD17XysvyDJKAofPnd4IK2powhYpWr4nP7a88/IcB6+0yia5KVjNbUS8v5HdVyvAp2BWfbQlTjGBlQJCAJG8utAQA+tiDm/SauFP9Lyeu/qxEt2TAaKnJ4mnZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tvroSQLszWlv/2X4ky/LRFG93xgJwhx7XbJabWfv8Y=;
 b=Dj0zCJE702GqfcIWknb0Mv4xB5MPZN1R1RRnlLsw0+f51GLyP9ySDXrRiAA5A2ZEX6Uh/YbZLF0PssWX1Y5j/kutxcmFQqkpNoPLAap/TZjNWZoscm+6Sc+UtXD2Cj0bP3oWCwFQIomfL0ZwCkaZcesqWhVk7GdTqPdxlZKZJBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS8PR10MB7731.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:629::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.11; Tue, 29 Oct
 2024 09:56:38 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%5]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 09:56:38 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] openssl environment variables
In-Reply-To: <f0d57e20bdf3d90e6c0ccd8ccfef6faf61bf45b0.camel@linuxfoundation.org>
	(Richard Purdie's message of "Tue, 29 Oct 2024 09:06:12 +0000")
References: <87v7xbjn9b.fsf@prevas.dk>
	<f0d57e20bdf3d90e6c0ccd8ccfef6faf61bf45b0.camel@linuxfoundation.org>
Date: Tue, 29 Oct 2024 10:56:43 +0100
Message-ID: <87r07zjkpw.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0032.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:b::6)
 To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS8PR10MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: f01878f2-c1f5-4d26-998e-08dcf7fffb49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SlN6ne3d7dO/6cVhRi7FeFydRKLrm/oLzbksQNCXLZQEg2wMPVJUDjj6Hkha?=
 =?us-ascii?Q?iWwED+6QFK1JkA/lWvqNUJORZV/MyvKhByhi+XxfuTsRAxJGdDen3ZO+wD+6?=
 =?us-ascii?Q?5bRN9oPxx3k5EN0a6cBIRYbzisRafS9Xk15GaT0uyo0jYtXneODwILKR8Z0O?=
 =?us-ascii?Q?6QgLTvy3oWA6bftRYlgzw51RZ4FIXApWzJKNd8sUpkOPjEXfzhgkbXH36qg3?=
 =?us-ascii?Q?tyT07zLWGsnpK0DmfGgKTyaKG04gGhru4ov+OFrJ0o1g5H/XoqZrd8HXmomH?=
 =?us-ascii?Q?ySogeuScH8lVeVy6i17XISfjBBigyZBM/sobTjr0hjftA0TT/Or4mxojzRHk?=
 =?us-ascii?Q?iBPIzsRYxfcLqqTjOH6p3af5INQNFwHY9TBnpkaFNYy2bEMv7HVfjtTWx9Ho?=
 =?us-ascii?Q?u4AL8FU40gC8WVvHGOUxfZK+ruEV1+ijSOvRVBUx7RtSlnFBw8eyGf8aPDbF?=
 =?us-ascii?Q?bXFu1p1tM0+R4OfHiND25yOb7JjPBs8ACffYaEqXNXF2uNRF1XowyWetraXq?=
 =?us-ascii?Q?5nEpQDlE9wBxnbQ3X53+5/4q0qIR5TIcOxZmewdCSYoY4uI4hPpGBN378eT1?=
 =?us-ascii?Q?E6E7hu1LrNkUlBfE23oN88xR26vh/FIpeevpnSWWiGablQIj9K3VUgblEj7P?=
 =?us-ascii?Q?95GewJsRV3hpx3MNA9Ovtej4/Y5tc3NlPXQylV+3uq3sXXsHt1elKqdHOX3d?=
 =?us-ascii?Q?lKyu2a4I4c3KeotTVwBGD5dMRUzpdHjINuwoUXXP7tsXU8O3sxdfANWkN0HA?=
 =?us-ascii?Q?8W3EQl88pGqae5zk4oxPeBPhT7iYtAjLTu2QyTc7C4YkGOic+i+x4HAaufvG?=
 =?us-ascii?Q?AVjMNE1P/A2JD7ZFfZwqRXy73EzUaIR5uJWpZxAt47dZF22unndtMAYH/mgi?=
 =?us-ascii?Q?Kus2eU/q8LnsUqBz/1iKzwF6+IB/LZoSDoc+O00Q15CKzXZ75pH72P7UlaZe?=
 =?us-ascii?Q?xd+uU8M8oIjQIKOAh4rTyWAV0cjrX4kM9huD2uMRHhDtXf8XQcHxiLNZvLMS?=
 =?us-ascii?Q?pYvtjxQVpp0iMwTd2nTMu25RaIx68udzGz1IGm3xeoZ8g1zPk0HTShs2hzSL?=
 =?us-ascii?Q?vpO358W34fIjwotdzEVl5n629zzp8vFpNhQzWgIm0/GB9MnQBrC4/s0Y/7dX?=
 =?us-ascii?Q?i21omX6dPsZI0mG1Nb8sNOOM9z/B5OhoofE3fWnEMNvZ7WbKAPpdT2N1i7Tg?=
 =?us-ascii?Q?X3RiCfivU1hTTLDsLMaNsHqbcy9LJMSOpV11Ntca0fwhE6wEGA0VjFDTbG9F?=
 =?us-ascii?Q?6HfcqkjnStgsk3J4toNpeL8HcCih0Orq8XTElfVc/cl0bit1upEwvdJoi25/?=
 =?us-ascii?Q?iupgw5POF5UCb0LCAql+Z+rSK/yQSFxf48yau/Lqlcj5QMewdwBZUJVbP/lY?=
 =?us-ascii?Q?Fg6U/M5G2Z6r+A0rkmPzgnjXczZv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iqi/ZMh8qU+YEKMiPmI3Qm9YS62X3G3HxA1hpyZRrfGX4cIBmxU+Nzk/qtDN?=
 =?us-ascii?Q?YGV3w1ROzZF3kUpojdsZiWwzkwfscnLQZNENY1ChHi8KFiPEVfSj8esgje8A?=
 =?us-ascii?Q?teTiywug27+6EAQMNO0JNGunppUUxXAONylb3uS+KE0MqeGBOBmVdwZcndV8?=
 =?us-ascii?Q?+PDa0zGegsBr9bnEPl+3pUs8wg2RCVIUkYJKgoQccRv0Xsgn5r9rnJYuwBAK?=
 =?us-ascii?Q?oLPW6suIea9gEWbiCVDuZSE3TF/O9ZNUp2Pd/DjVweorwK/kJz2tKh/ZUjzT?=
 =?us-ascii?Q?WpWa3ZzHJ+Q6DlpzlYAoUsalBhQomGeg/PBBbT88uapYC1T/lxKchEi2HHrG?=
 =?us-ascii?Q?O1jw1gmkPRCPmN+Ugl2TcWATxbw9ou2qVItpTXiGGgwmSQ3agotECOR8Vn9s?=
 =?us-ascii?Q?70RMxytdUU7/XFsl60XMO/1o0sjuy/U8GbFgRzQVywJ/+RgkZrrhzqLwpNkN?=
 =?us-ascii?Q?qlD2f2Ogyel6q7t6DK9ZdHcO1R0pLcE9LMoBkztfO++BQ46sJ3Eh0W0u6NJ0?=
 =?us-ascii?Q?z4pCzHI2i0uU7tM0Eq8p5dRYtCrs4oHxghg/GDZfG/WyBuYSMznqqGJ9GqOg?=
 =?us-ascii?Q?EuaLGgZO5UwmmjVIEQznbSKReH1OTr1YwO8USMhXkX+GweLaOX0ZxRbEoEvu?=
 =?us-ascii?Q?MLJUpioZ3VEPHqBHCpYt/73zpud2uai/tvQBpDb0QGnzj0wLN5SHutfttENE?=
 =?us-ascii?Q?3/6NlQx1fjXgD6bdFLueo/Pstqqel0jmd41n1CEOnmVNWOWW9wMCd39Yb6PA?=
 =?us-ascii?Q?SOQVrMU2FFQsWMo6rUE89RToFyMV+DToz7xh6bbVZHkvlhfEYHa2evp72vGe?=
 =?us-ascii?Q?YkPmjF8agpb0Ruz8/XpQNNhbgtlK8Qs4q05WPOQV89pbb15sxDp03f/3zWWx?=
 =?us-ascii?Q?M11WR4ypdRQBC2a8LARK2t/1ejDt39EKcttTVQBq2DGU2SGhOwGLq3bgX74z?=
 =?us-ascii?Q?9V7aNN14MgYRQXurgd00xNNei/eKGf3nwlYeR/XZbg+FTXtYIzPKibHF6vUp?=
 =?us-ascii?Q?0+rA5ff1lopyahKcBNECKK7taDrax0tesJgxkD54PZa92wCy86d1UbJjeMZR?=
 =?us-ascii?Q?0mjJF3rFYZ2vl+Jh2V26U9iXMitHgZXpfZz4Nb8fqqcsAR+NnU64qwXixsNw?=
 =?us-ascii?Q?xUd1sqS4//bE40YYZg/TvWwVKcMo94OU6f34+0yMfOTxILLcfw99+KT3Mec8?=
 =?us-ascii?Q?x+LIIh4xlKgaCnuMA/JWeJgRP/EA0uL73eust+KSuOPmbgmaR/rn+QRoF/VY?=
 =?us-ascii?Q?e1+0cRMLRyw1rFwjO51C7GQV8xjEi7JY2RIdaByNHeQ/SrZephGYBpi6letI?=
 =?us-ascii?Q?uNF2H9Hxl8hnvqO0d+XZvqyH4LAZr/qvUFkZs37ZODEH0p8O7t6R0uzORbB9?=
 =?us-ascii?Q?LK/Y4uHdWfYssBeqeoX7TxJuW+QX5pBgtllf98ZV1eIt8hegxc39Ahz3QUim?=
 =?us-ascii?Q?Ws3RLL/aqceeN5XvqL3Iw7QNlV5mra6g8LULSv01C2ROFBB+wGq8Dva4Dxuw?=
 =?us-ascii?Q?geyOQCdDQ1kBK60Aumdyv4IUf3Z2CvzYlrh2kcyZfV5O21kysSjYrPn4OsZH?=
 =?us-ascii?Q?krXdDlCeVUxh6LrP4+bYPEkdzvKxlXFB16tPczX13F6+g1TOJZzKPA686WII?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f01878f2-c1f5-4d26-998e-08dcf7fffb49
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 09:56:38.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/60nUy5v8/ndOytrBlwLgVQEV9UebNTIaZ2sWbpN0zwjzqRxUnt3HzbO5Y7bXarzJzcmErARMyK0iY8RLhwWgYwlUYRYNP5AEBQUbTGMmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206486

On Tue, Oct 29 2024, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-10-29 at 10:01 +0100, Rasmus Villemoes via lists.openembedded.org wrote:
>> I'm wondering if anybody has encountered this problem before, and if so,
>> if there is a clean solution:
>> 
>> When using openssl-native, there's machinery in place so that when
>> openssl-the-binary is called, it's done through a wrapper script that
>> sets
>> 
>> OPENSSL_CONF
>> SSL_CERT_DIR
>> SSL_CERT_FILE
>> OPENSSL_ENGINES
>> OPENSSL_MODULES
>> 
>> so that these point into the appropriate STAGING_DIR_NATIVE, and then
>> invokes openssl.real.
>> 
>> Similarly, when including nativesdk-openssl in the sdk, there's an env
>> snippet installed that has the same effect when the sdk setup script is
>> sourced.
>> 
>> However, when the build involves some tool, say (uboot-)mkimage, which
>> _links_ against libssl, no such env variables are automatically set
>> up. This means that if one tries to do something like using a pkcs11
>> engine, and has made sure that the appropriate pkcs11 .so file is
>> available in sysroot-native, libssl still won't find it because it
>> doesn't know to look in ${STAGING_DIR_NATIVE}/usr/lib/engines-3.
>> 
>> I can of course define and export these variables myself in the recipe,
>> or in a tiny openssl-env.bbclass helper class, but this feels like the
>> sort of thing that the build system should take care of automatically,
>> just as it already does for the openssl binary itself, and for the whole
>> sdk environment. But I suppose that by the time dependency resolution
>> has figured out that "hey, this recipe (transitively) depends on
>> openssl-native", it's way too late to inject something that sets+exports
>> these variables.
>
> https://github.com/openssl/openssl/pull/19260
>
> We realised we could only probably fix this properly with upstream
> help. We haven't managed to have anyone work through the process enough
> to get patches accepted though.
>
> So yes, we're aware but we need someone with time to work on it.

Ah, thanks for the pointer. OK, so it's a known, and hard, problem.

Rasmus

