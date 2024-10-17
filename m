Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92923D37495
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:48:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web11.49324.1729172883548861358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dj592RQ2;
 spf=pass (domain: cherry.de, ip: 40.107.22.78, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNCgkj/QFstguISVejbcGR2DScAbgCQSNwpHwfaCsf5AeEtJfCf/3u6OmGV4arBzww0MU4U+Ke5K/NxsMTf98KvzJ/uUd+NKuXHiz5U3aeb5IOgh/FcSBAgBFVSDWJwdrEZ5LVTBOVMQmGgDXGEfAkGM0FSvMVuEtdnoTkTt51MmuB4L9edk0tVPvAKjoo9HXAwyO18Vs6yOFGV6f2aPkyx/tiIeOqehtN59tWeWjNggq+MXlu+cRmVjnQAzbowxgguh5lisIiw5YkFCX2QPqrb7DlzIZoIjHAJ18CONbfJFoV+A3LgFAERK6tNn8IzJJw7Xh6v2QyqMD4PspOPqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNOCY7VeBuchRUiemKLIRU1fdN4lqPcvXJzrMhrUc0s=;
 b=PSDVx+OO6hOY4tqShLr9Rcx9G7gpjRQMKT/1ucvhmGOR8UNOf4wTI5dl9HYY83UUS3ROAQyh6H3ZxtM6UrusXVYygR7YYcmVNht+wig68Io/ol9ojaOb42VxxGNdepG8MVWTmzYYkxz0AL5K2LgDOgFe5+u6KuLNd97btee9oeGtqKmKb/Cd386mRUqXUK8gVQ7tDPZTl3MXR3cnX1VvPGB5fzLQwuHH9DkQtytgqTfWFYRKoYHktrbZ3iKyjcoV0ucjBZkQjLUtg3oEI6vDnP4NMMPJLeq7GEQ4ArgJraqT86jiMIxGAO3bF4Wvl9KjihpeIB7/X75LpQvM/0H7Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNOCY7VeBuchRUiemKLIRU1fdN4lqPcvXJzrMhrUc0s=;
 b=dj592RQ2FY/1zW8avrYVFCsiCVRZS29WEOM9zuYmVV/PBfrseQduxKHyxV5cqen5xVOShWNPZJHW7eSbLlbFra5smPcKlQ1npCx6rbZV9ZULokKJQAXrnk6Glgh2N6LkV81h2GEYFHKHNONgwIjLtoKj/oHpDrsNr9esuVAtba0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 13:47:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 13:47:59 +0000
Message-ID: <de94f4d8-0ae0-487b-a45e-01098869866a@cherry.de>
Date: Thu, 17 Oct 2024 15:47:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RESEND] u-boot: upgrade 2024.07 -> 2024.10
To: Fabio Estevam <festevam@gmail.com>,
 openembedded-core@lists.openembedded.org, marex@denx.de,
 Fabio Estevam <festevam@denx.de>, Ross Burton <ross.burton@arm.com>,
 jon.mason@arm.com
References: <20241014113549.1594444-1-festevam@gmail.com>
 <ZxEO4yJA4VVLQdsN@bootlin-mathieu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ZxEO4yJA4VVLQdsN@bootlin-mathieu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a25e15e-76ac-4cd3-69de-08dceeb24fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bThaZHFkaWYxS3FtcTVWZkQyM2svOEhkalo4cmIvYTZHdWtkZ2Y5N1MrNU41?=
 =?utf-8?B?SERCd2g3bmtWYXJuS2ZWek9FQTVzN2c3dFhnOUJCVzBOSWVCbEcweHhxU2N5?=
 =?utf-8?B?YTNwOGxwTThYR0xib3B2c24wTGVjNWVpcnRNR25KbG14SnQ1TkIxWmxVTjRY?=
 =?utf-8?B?a1pjV0lZZklzSVJxQWRIRDA2b0NxQ2VqdmxUMzQxZWJJSStLaUJvdXR0emNW?=
 =?utf-8?B?QTN5ZGphK2hRbTJweHF2ZUJ1b1ZsMUVNMlNiM0tGR0NGWWEydmYvdEY0MUI2?=
 =?utf-8?B?eW1mVzIwaVdTQWxUMEt1cnZFWHRvN3oyWDhlQ1B4c1FsNmlGV3BMOEg2elEy?=
 =?utf-8?B?cWlyeUhpTDQxMXBGZjhhTFgwVG81SFFEMXNwY3pUN3o0eFg4SzdlVGN4bEtk?=
 =?utf-8?B?MFQ1K3FML0dHQk5POG9IU3JoczZRYmsrR21qOVRRSkZFc3QxRnd2V1Y4QS85?=
 =?utf-8?B?U0prbzdXdGZ3MlRmN2xkTk9zZTAxNnVaaC9lSCtBRG01aXMxT25rNkdTVXBE?=
 =?utf-8?B?VGZmVlFKUW1BazFtdlA5TDRlbW1FMmQ0dWw1T2JzaWcvOStybm1hVmRid2lh?=
 =?utf-8?B?RnlUZjQzS0JyNkpzOTFkOTVycmdxWjduaXJMeEZJRXJKZ2dOMjlHVG9qcHAx?=
 =?utf-8?B?dytaY0Jwd25peG05ZXorM0tmUkxIbnhtNW9sOHZZa1FIZGlsZytibitIekpX?=
 =?utf-8?B?ZGZwS1NVNjFoWTVVMkZzUytjV2EyMVIvUDRtSFptRU5GTmNJVTV6dUhEVTlG?=
 =?utf-8?B?akRpYlhoZSt4VTE1clZSa0Y2OTJLazY2OHc5ZnJIVS8xZWhrZGVBNmhIcW8z?=
 =?utf-8?B?MjgxWVd4L3J3QzFzTGlQbk9aSko2d3JDY0J4dklSUjdXbkY2VzhETGNUNXlq?=
 =?utf-8?B?U1NpZ2trZWUwZlI5aERaaFc1RWlTTGZCRXNWTkF6QzIvRUZGcmJBbzBJeHN1?=
 =?utf-8?B?Mlgxb01YUHdYUC9mdXpmS2Y1bFk3RVMwQXNhU1RwdGlzcUJTU0dGc0o4UXRR?=
 =?utf-8?B?ODYwa0FPVWVSVnVtbzRQclZFc296V0p1K0VkaW9qMkZObVBCaVMzaDRXWStz?=
 =?utf-8?B?eHdCYWNDZC90UVVxYnVaeVlNN1Y3M1phb0dJK1EvK3VONmprM2VxZllnSWYw?=
 =?utf-8?B?aFhCbW9tZEhZcC9KZGdmSVVRN3BTWnZmQjgvRXpwV0JMd2pZcm02SmJnaTI3?=
 =?utf-8?B?aUs1UEdWUC9qeHRKL0h3d0xnWm52ME16a1lVYnNManZOVzVhRENXMnNTSmY5?=
 =?utf-8?B?WVB3N1dZTlBhK1NzK05od05hTlpxc0ViWnAwYUdub1dGOHVUVGhyVmFMYWpp?=
 =?utf-8?B?Z25HSHF1cVFweDI5c3VVOEEzQ3RNaWhoNGxOSmplSVdGSWVIKzdxMDVlWjZs?=
 =?utf-8?B?ampaWHRUbld4NXp5NmNMaUpxNjZXNjBhTjJkd09VQnZuMlJNZ0tqMmJpbmNn?=
 =?utf-8?B?UjNKUzFzaWR2MkZjK25PYVFPR0g2YWhmNTNtOWh1SXlGTjV1elNIRGU0cHFa?=
 =?utf-8?B?NytiWnp2WG8xNWFPNmdidmQwT1FTMVpkKzhWZ1dxQTVKbXdYdXBSOWpqZVpo?=
 =?utf-8?B?YTFNY3ZidXAzVDFaWlkvMkIwYitvamdDWmdwZnE5R3QrajZKN3MxdnkvZXVX?=
 =?utf-8?B?Wkg5TW5RNmhWVURYV3hNL3lZQmJvZWp5RkpRaXNyTndKbGNRWW9xR2dUUEta?=
 =?utf-8?Q?iLzsHdfLH1L3MYeMa6SG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmQzcmh6eGJoOVRWRUdYYitSblN6eVpEeENpWTU3SktVT3NiaEpVblpvc1c1?=
 =?utf-8?B?cFBkS2t5bkZkbHpldjhIbHdmZ2FLRmJoTXJERUdlSUtZdjdMYk9iVXhNQ2x5?=
 =?utf-8?B?L2FwQXAvRnNaTjkzUzdGR2VId1JtenpkeE9Lc3ZIcWdkYlhUVWpnVFA4SDFB?=
 =?utf-8?B?ZXA2UXRDZjNVRlJBb1IzYzV2SmdqYnV6dGdoRlpWRVhIS0s4K0dJK2d6S2Ra?=
 =?utf-8?B?bklUNGRBQ1lkVCtRNnVWZGoxSDZvdlpZTGlhY1h3dHNTN1pVU2Z6dDdiUWda?=
 =?utf-8?B?bjQzNTlFTnB4MjhqWFUzSE1lL0JaVnUxUkRNMDNrMWtoWXR3bTBUcmVPZVM2?=
 =?utf-8?B?a2VsUnZUV3V4RmlZZlJvWEtHMy9ja2JEVmxLSWJRMDF5eWc5U2NFRitYOU96?=
 =?utf-8?B?ZTlNRWpCcC9RM1k1bFhOSlFQR3pjUElMRk1tRlNJYkdXUzlpSlBvZ0kxRXRD?=
 =?utf-8?B?TnE2T0xDTFNPdEp3cHM3SWwzUHhJcWR3TUxWQXZpMkhqNWdwM1M4dTNRNCtn?=
 =?utf-8?B?a3ROTGxXNTAyTnNjMjVEKzg1WWtDRGdZaWdhTzZTUDZXN3lzKzNicWhHZVJa?=
 =?utf-8?B?dGJQOXVzTVJHSldSVi9HVkIxZzNoZ1Z3UURRaFJ4NlZvYkEvS3RVSTAxcmdD?=
 =?utf-8?B?U2RONk1LR0hoS2d0R3NXQ0dZVHNWblowQ01SMkN2VksyeE5ENUd2dUJKd29I?=
 =?utf-8?B?K1A4WXVBT3dzbHBhZU55YU1VOXR3RGFPbDB4WFdSMnJxb2wxQldRbXpMUW1m?=
 =?utf-8?B?T0owYUo5SS9tZHJMd2U4dFY0Ykg1ajFtY3dteFg1L21FNWcyUlNpM1hoVmpT?=
 =?utf-8?B?OTZxRTlSLy9oM0hpSjJvZWdOTFovTHkwb2dMcHNvU2kyUm1PY3lmMXNVTFAy?=
 =?utf-8?B?dExkN0NwYXJzcnhGZWtLWXNiN2xKeDEzcTJwa1NiUjBGU2ZzdS8rVDQ4enlU?=
 =?utf-8?B?UjJZeUlpME8ydFJzdktaNHVlZFJuNGJKb2lISUkwSHAvU3ErQUtSZEVMZGpu?=
 =?utf-8?B?c3F2U1l0RVp6WE9DUVo4SFlYK0UzRzhFdUtydDcwck9SbG1zdmx3T0RORWJD?=
 =?utf-8?B?dytjMnpaU0c3eGx5U1NzMmozRGh2SHdac0VhRXpURndoS3A5Y1UvNEVTRGpV?=
 =?utf-8?B?WmNTdmM5TU1Ydm5MM0xkWW1VYTdoQURUakZkRFRna1FFdTcvTDRKZnJ1Qlo4?=
 =?utf-8?B?R0oxVTBxS29jRjhlWGpQdDJ5TXVYa1EyUVNOZWozcDNTUXdEZS9Jd0RuUmtW?=
 =?utf-8?B?b1o5QUY2WU56WXZUYmo1U3VHRVgwbWhRenQ3Mi92NkpQV3dvcFRsNTI5blZB?=
 =?utf-8?B?bHVQN3Bha0dHUkVtMkVRdjBPM2ZzaEhCdFlqNGx5dmJOYlBuWDh2Tk1kWEpB?=
 =?utf-8?B?TUVGamVnSWJ0UG9Ba05VWUI4QWVKcDZITU1sLzBoZzdQSVhQRGZHcFRiVHZG?=
 =?utf-8?B?a3ZsdU5HWGNrd2N2eloyekNGL0VBcGxCaEh6MHBIUTZ2WW4xeDlXTVFnZC9X?=
 =?utf-8?B?aGMzSWlrZm5mbVVtSEZoanNGRnN1ZDlHc0JRY1pxN1hEdlNNcFhldlJQZlVk?=
 =?utf-8?B?QTBrT3pPeTh1ODk2WlNPWk1jQnhaRnhxbFhvNFhNT3NJWkF2bmRueVpicW9L?=
 =?utf-8?B?T0ZqQitsQjNJRkx6OVlwMkw2V2RpeDNmcTFySFNIMkk5aHExQW50T3lhTzU1?=
 =?utf-8?B?U1NwUVpGV25JbjNsSGpvZDZxUmYyY2Q1dXd2U1RnZVhyQk55SFBUdTJVbXZO?=
 =?utf-8?B?akpkVG9TNkpCc3BHUTFRdzZSMUpCNGR5YmJnQzZ3aVJ6T01VbEp4MlRtS1hT?=
 =?utf-8?B?UzN4R3R4U2QvK3Jac2dsODE5NWZ5M2hBZ0N2WTNBc05BeG50K1pVR01rT3Iv?=
 =?utf-8?B?WFVaVkFFVGd2c3p5a2F5R2NCSTd4bDNGcG9HeWFjcW5MNW5uT0dmUUo2NW9a?=
 =?utf-8?B?TnUxajRIb0k0d01icldJNTFweWRmelR2bEsvWk5tWEJyZVp0bk9YMFM0ekwy?=
 =?utf-8?B?MkdBZlRNYXlVdzJhM1ZWaFNpWEN1VDBVWGljVithcGJBZng2RzZtaWNhcWxY?=
 =?utf-8?B?bHBtRC9yK3hYcExYbkxHMXlFWEpqUjFKQnAvUktIZHgxZC95MFR6ZnVHTGZB?=
 =?utf-8?B?UUdMM1ZiVFUvTWtEck55dUhabk1LeUtSdEJuQ2ZLSjdNdUN2TFZwWENQYjUv?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a25e15e-76ac-4cd3-69de-08dceeb24fec
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 13:47:59.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuVH+tQJc8dZXKfORsMx4nEBpcnIlEISuG9YexmC1F7a7E9ie7dCLObLbSWQtHdz+ggiV82FGMHPfmWdJ8JIFDMhG+fecl4aVr8eyy1otfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206027

Hi Mathieu,

On 10/17/24 3:19 PM, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> [You don't often get email from mathieu.dubois-briand=bootlin.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Mon, Oct 14, 2024 at 08:35:49AM -0300, Fabio Estevam wrote:
>> From: Fabio Estevam <festevam@denx.de>
>>
>> Upgrade to U-Boot 2024.10.
>>
>> Signed-off-by: Fabio Estevam <festevam@denx.de>
> 
> Hi Fabio,
> 
> I tried to apply your patch, and I got the following error on the
> autobuilder:
> 
> ERROR: u-boot-1_2024.10-r0 do_patch: Applying patch
> '0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch' on
> target directory

This is for/with meta-arm/meta-arm-bsp folks to look at I believe?

@cc ross and jon

Cheers,
Quentin

> '/srv/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/u-boot/2024.10/git'
> CmdError('quilt --quiltrc
> /srv/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/u-boot/2024.10/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch
> 0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch
> patching file arch/arm/include/asm/system.h
> Hunk #1 succeeded at 163 with fuzz 2 (offset 9 lines).
> Hunk #2 FAILED at 376.
> 1 out of 2 hunks FAILED -- rejects in file arch/arm/include/asm/system.h
> patching file arch/arm/mach-exynos/include/mach/system.h
> Hunk #1 FAILED at 36.
> 1 out of 1 hunk FAILED -- rejects in file
> arch/arm/mach-exynos/include/mach/system.h
> Patch 0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch
> can be reverse-applied
> 
> https://valkyrie.yoctoproject.org/#/builders/75/builds/249/steps/12/logs/stdio
> 
> Can you have a look please ?
> 
> --
> Mathieu Dubois-briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206018): https://lists.openembedded.org/g/openembedded-core/message/206018
> Mute This Topic: https://lists.openembedded.org/mt/108999417/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


