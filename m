Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE94C77B7F
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 06:52:10 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.web10.2493.1750920720404586225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 23:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=VBQqMmPk;
 spf=pass (domain: prevas.dk, ip: 52.101.65.22, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvj1u49BnDQb//vwLg1GxoSJ0qYNKakQ4eILRYaPvkR/hxmDgIh0lEUF7gGT6QgkakbNYCJuar02WMaWZhHsUDshqEB9yaWd1S9tnSCFq0uHikj7H9hWXN1E5YGhlJXBLgVpSjokvPWKI2Z3khXuZo+4INF5/ziIAPNPZ/MVZqRndipJDujB8E19Ut0G5SAt178g9xYJMhcaal2ZthvOyLijI2RX2xAH7+NxqYz55rITfXAMT1X864SE/t+orl9gwm+PmB1AUFmQrtDpIbaaERHy12yct8MGANWgNg1qfR8R7yF6EaLdEeJgpcVzf09YHDORZkMnRdwnWsnewohudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3sDOxv3iV/gDPvGndTENmUTdDpRx7uTwoRHwFpETQc=;
 b=CvBMuOYYIIMRI2NuuHUz6rr+Y57IoKft/MvUv5WMkrJXyG6n/jsU+Ke+Yq8JSQuehkv0J2Yxi0eYHfw8AVJLdaCKoW7fAzx6Utl7+CEUJi8g1CuFATStzMA+jKW8ke1HEO9M862Ugi0LH90oPDn0/3D6DrG395Ar7AMU5rl2ALXKlznv3+UD1ueSt38E97y6QqRSgxowV6b/Qfpq8rMvj0OaYezmMi2ghFndfN7CYPnWzjUVu6ZwETvwJPjqZytD5VREJ1IcAA8NrpT73qor9Iro7vWMwEmJQgSAPgCS90uSjl9BDi6+m6c7VTqatYUBBOweEGwLzhKYg5ix+2z7SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3sDOxv3iV/gDPvGndTENmUTdDpRx7uTwoRHwFpETQc=;
 b=VBQqMmPkK3YQcaw+19xIKRwXpEy5cab7pzFy139j7JviM62hKho7HL0BM6le4pNBkwguzr8i2M1zao36OgBvSnNPOJMwSI5W3is6YlHhGXWG1STEvGC/cpvektcenBSV40l78y1BycuUvpMZ/lfnZXYMkXCEnVROILx6gTm5k/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS8PR10MB5949.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:528::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 06:51:55 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 06:51:55 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
In-Reply-To: <5be4f30a9368b56993590b8ebe5d6d5120b7c15e.camel@linuxfoundation.org>
	(Richard Purdie's message of "Wed, 25 Jun 2025 14:54:36 +0100")
References: <20250606093905.2715221-1-ravi@prevas.dk>
	<0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
	<87ikkuzuf6.fsf@prevas.dk>
	<5be4f30a9368b56993590b8ebe5d6d5120b7c15e.camel@linuxfoundation.org>
Date: Thu, 26 Jun 2025 08:51:52 +0200
Message-ID: <87tt43xaev.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::31) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS8PR10MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd41534-ce96-45c5-1d83-08ddb47df045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nMEfUDoBQaVoTpJDt5A1v5T6ez4j96xkFXK+nFNkz19VPpLUSKWtloHHtJ4Q?=
 =?us-ascii?Q?rAbNAgr9egCcgoZ2AYBJezM4u6eVxc2xh9gpihnXh+KESfhu2PcD+jK6oU9K?=
 =?us-ascii?Q?lF8nEWbff4PR6/dcQZcLTqh2fd6koAWiRhptU7GlJCGGQLxYjF/hFzVZi0Dj?=
 =?us-ascii?Q?Eof9Caeft5xp47VisOWNNmKfHfcYGE78s7N5Ts49jZrJJ/nMjvtg3+91Aa3A?=
 =?us-ascii?Q?J++umdpong3NayJwjvbaRvdH+3I7ZP4d07j3f/F4+BSOwxFLRnFwtQ/0dPu5?=
 =?us-ascii?Q?83D41zeoSYGF5L5XoekwboxA2YabOq2mqttst92IfV/3QEytk/hyHg6+B+a5?=
 =?us-ascii?Q?ezxq/zFvxgGYYhkgYMVBaEHVyrgmsNS3ucDX6R7ZyoB4ZsRrIrne960ARn/f?=
 =?us-ascii?Q?VzI2DvNVCoJFX8MnHqMe5WxSxT9wLinJxiSqamqWUFoxF0dCLGQmzkSGnQdu?=
 =?us-ascii?Q?Mn+qMdspobv6QyhjletJrRvDqOU0ZPNPwoS7Q8w6nnt01tvZXf7EqroyPHoN?=
 =?us-ascii?Q?kYM4g2etmwszO7xEyvJ1ldebojnFtWtwSEXgEk10emxMxcEzNEWjQMI4ifRN?=
 =?us-ascii?Q?WzFcTMCqEkKDgpFDpItfNo2QwMalR6pIXow0OWqJWA6QGAFkBZfSvBwfTzap?=
 =?us-ascii?Q?Z6blpwDCPJCaI21gUH9fp1/hkgrwcqS6eU/vhgMVwCfvr6gqrQIz2JGoOoRU?=
 =?us-ascii?Q?ENbWdcF1JOo3WkFbsh0BTKgkaPgDtjj2M8GXJqSX6xL0UFaRrD/pxV8eQLKh?=
 =?us-ascii?Q?GCQaKZFvUEAp68c3lkaf0r+N9hVkN3hmf09hSElsM6yERPVhbgil8lCbGG2m?=
 =?us-ascii?Q?mo8qpRImP1u6Tb4L4zfub5sYi3ID1B1kdCnpoPP+N1e8RHoT7HTWHYk+uvwK?=
 =?us-ascii?Q?LIO90UYXhPmoskzMgrhob+hEJDFZHP2M84XnVXXFuIDzVo3kv7CxMlyy6vch?=
 =?us-ascii?Q?JsEhvXsYmaucEjjR4lLj+3XgmMP/9PzAd5SSwuzLKyDMQehelH/XqBxTX+OC?=
 =?us-ascii?Q?WGHPKpCUKMB+yMMwPvhjJ5uG0RE+Gjr1n7sAHN6gH4LQslKH60CDdiwSViBI?=
 =?us-ascii?Q?zi7FXN3QZlcx/rfuG2S+fSHq27QSjN0jBjU10EstynCa7lUGa24WGX+rK/CY?=
 =?us-ascii?Q?Q2P4oJKdQISaewiOdn4t5yYUgclaUOXIBteR+vxgPzqdRkVhVd8Ie6PHdLU/?=
 =?us-ascii?Q?LvQZwFmBr5CfZFEQ4kJw6ygr/VcpSECpJIbwyxwJR5hPpnM77K2aRuEaYkZZ?=
 =?us-ascii?Q?9TDuLsF3WF++5wfMCdhhvOVyOUtvNrPpZ7RXe7rdXrYMCHCEvlZ9HXxzaey+?=
 =?us-ascii?Q?NMjLKBVkXPONlLmfbM2oS4sm+jXi/EkaCpBYuLsSi3wZHwLmaQctZbFka8qL?=
 =?us-ascii?Q?74Vye/eieLU0twpGRbnlMxrzglZjcTMpwhAqTuVzVLuQ/HClpR2udM5I3g5Q?=
 =?us-ascii?Q?BQFB8Emquzk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BhfDgVfICFw5W3frULmR5cYvn/Be13+5AU+RFY1OfPZQhKJqPJOLdi/fVBDd?=
 =?us-ascii?Q?6gSUv5r9mJ1VpfKpA19AM3hC5Mo15lNBZxOFDCUoC4osMxsIu5CrvmSfLPJO?=
 =?us-ascii?Q?3z6mlQGe9GII2ccPFY/GjatsWxvAzPLnCP50RZX9jda+/IsXdLDbF+BSR0VO?=
 =?us-ascii?Q?9HP1QADf1cLuJ1lhEhPhX8IYSMKqCIpYgw1U/YMdA6uXmsLoLg/913qQRuTz?=
 =?us-ascii?Q?8LgrMq1pQx7yqrqWNRfPW2l7R1twTx+dciAtbo0FYzH3QTMkmgvPIAvhaigr?=
 =?us-ascii?Q?O3NHvwZoybw4s6bxT0UBrFrXbJfo+BlCFlPtwVAoHqPMMuUGugxLi2I6urKh?=
 =?us-ascii?Q?zUzW1y5PfbNBnN7HewKZAYu9glAGyhL/8nK3xGI6/68Z/14URV4zjZ/rJaYq?=
 =?us-ascii?Q?nILTqT+TUClohx8A9tDgY3xU6QKmDQJDPSbn+hcTxjgb7uxYGlYuu+XRuuxw?=
 =?us-ascii?Q?XiOfmRk9zBAsoSO6F1N2JURtccdqc3FI20Fgj1lkWq+bFSAm3oFkxjfhb+9S?=
 =?us-ascii?Q?9aaR2bIJeuXRykNZiuyc2UAXmvJUg6rD13BOMLUnme0Xr4geZeZyumdzOjj1?=
 =?us-ascii?Q?diLRWL2JpOBcQHFP7dPz5oPGwRrDFRuDs8yEaa5atHRrdjQ4mCEi1a9KHitT?=
 =?us-ascii?Q?dzYTQRVSpeiOD9z8PkmTzj7mghcJb7A2GmWb0GXPud0sAU1RGrRgJNWWsBug?=
 =?us-ascii?Q?6+RcAKhvdK/+ufJbjl+vHxVVt03SpitDuNc+s62SK/lD9jMJcQgsl5SDRlO3?=
 =?us-ascii?Q?WIqhHwLAG92AE1S3DSEgAWWHPKJwO/tSjv/nomlo/QkKXtW4QgyQi0G3xJZe?=
 =?us-ascii?Q?VmAylqSxzMQhWEFEpWsMHwMQPIz8nW4e6ZedU1LyZaHBqu3aFNjGYfNa4ToH?=
 =?us-ascii?Q?8rYFWI3iKunH8c6p8g/zSz+QFjxR+rAQHKCzN5f0DqEiWqI7zc15Av41h85u?=
 =?us-ascii?Q?0mBEjrdXzXn6vZZqMkG6IQhjYSzcsDnULQR4XUgue7TCDrs0iiDF/EjDg3Dt?=
 =?us-ascii?Q?lk+5+pM8dBN9Np6Ss2/MrYI9fyCiKQm5jaJk4wfffUK1ITg7a0TX7ha+wy0j?=
 =?us-ascii?Q?XhoPTGA5pjXwb2K22si+m6R1IZAg4LWIS/lAe8YiKv+c/V4Wf7m0/oo7dIcd?=
 =?us-ascii?Q?56Ptcbr81bAllx4XiQLZA/FVc86UdRCIBTTdk1zztZ/TA8HuUST/3wyy4tFn?=
 =?us-ascii?Q?cu0+XVFvOrjoN+n3sffj177MySs3mnyceujUUFRGg/e4tneX7GR/uep7z8Nr?=
 =?us-ascii?Q?kuUdJC+/KVQstbR3TEYkXTilw+c1nXKnfmq+zXJ4E20LGVOGixWNIu9UdyPT?=
 =?us-ascii?Q?bORczkC+gAM4HoF/p40FCM1wSR7153NZz5zalsew8oPtGbCGFzTUcdamHfE8?=
 =?us-ascii?Q?BlQjD0KBaftOwtrnP2kLL2vKMHjq8U1zEra/KflJF4MOh+6YLMuyVSPxYDN8?=
 =?us-ascii?Q?hF1iowBPoYZWcULG396xmql5pOL6etGHv7C4ltVx/FPqYjf/T0xMiSoF3BEc?=
 =?us-ascii?Q?SlCNGYUmOh7M/NjUjx+Lua2PgDGy6Wf2ytmQoyHPjIBUYQjqAZnkQMPC0V+0?=
 =?us-ascii?Q?dfDQ6YDVtPMzbknW/nbaniyW1GhuIa6GCA3jwjEvo6Ije+Za2UIQajWHGQJM?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd41534-ce96-45c5-1d83-08ddb47df045
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:51:55.4029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aUHTuRZMPF95bONTgomLijUhmGgWMdKC4+wbMwaQjKnUBr+AvsJiZeTRXHJv6/dSV/Hcy9rEkOLshwwsbbTD9cBTp30CONZfNbJNpvBRbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 06:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219338

On Wed, Jun 25 2025, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2025-06-17 at 09:41 +0200, Rasmus Villemoes wrote:
>> On Sun, Jun 15 2025, "Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>> 
>> > On Fri, 2025-06-06 at 11:39 +0200, Rasmus Villemoes wrote:
>> > > From: Rasmus Villemoes <ravi@prevas.dk>
>> > > 
>> > > Currently, files and directories created under ${SSTATE_DIR} when
>> > > fetching from an sstate mirror are not created with group write,
>> > > unlike when the sstate artifacts are generated locally. That's
>> > > inconsistent, and problematic when the local sstate dir is shared
>> > > among multiple users.
>> > > 
>> > > Wrap the fetching in a bb.utils.umask() context manager, and for simplicity
>> > > move the mkdir of SSTATE_DIR inside that.
>> > > 
>> 
>> > I appreciate this sounds crazy but this is causing some kind of
>> > regression being reported in our automated testing. Specifically,
>> > running:
>> > 
>> > oe-selftest -r sstatetests.SStateCreation -j 1
>> > 
>> > fails for me locally with this applied, as it does here in CI:
>> > 
>> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1767
>> > 
>> > Worryingly, if I run:
>> > 
>> > oeselftest -r sstatetests.SStateCreation.test_sstate_creation_distro_specific_pass -j 1
>> > 
>> > i.e. a specific failing test, that fails even without the patch
>> > applied, and it shouldn't so there is something odd going on here even
>> > before the patch.
>> > 
>> > We're going to have to get to the bottom of this before I can merge the
>> > patch.
>> 
>
> I finally got to the bottom of the issues. NATIVELSBSTRING handling was
> causing weirdness when running the tests which was than masking other
> problems. Once I fixed that, I could unravel the problem with badperms,
> which was just broken as you mentioned. In the end I cleaned up the
> umask handling there using bb.utils.umask and combined some of the test
> cases for clarity too. I've sent a couple of patches.
>
> This should mean your patch can now merge as it is correct IMO and the
> tests were just broken/breaking.

Thanks for taking the time to work through this. I was hoping the needed
fixups were small enough (or localized enough) that my patch, along with
those fixups, could be eligible for walnascar. What's your take on that?

I got into this because we currently have to set BB_DEFAULT_UMASK =
"002" to get the sstate dir perms right on our shared build
infrastructure, but it turns out that that cure is worse than the
disease as I wrote here:
https://lore.kernel.org/openembedded-core/87wm9r1wcx.fsf@prevas.dk/

Thanks,
Rasmus

