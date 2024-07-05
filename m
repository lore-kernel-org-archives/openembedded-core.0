Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30D9C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 09:42:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.90])
 by mx.groups.io with SMTP id smtpd.web11.13945.1720172519636592814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 02:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=5YChXYvo;
 spf=pass (domain: navimatix.de, ip: 40.107.22.90, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kj6qIfXddVfe+d6BdVycZH0gkAK/aExtQZsInTks/uytwFfdmZSB4wl0cuB90X5z6+pQrNw3lS02qRTEm/SamIq5/dbYNKYBCDOeXOmlgZKI9Vc0+RdoP+g8K6Ba5P1f/Tdhp7n8vW05IPSuJBNXsea/A3kHbKS2zkr01/rOlO1Wf8suzpJnn2Pj8dG2TfrLUkP63xxKuKg2SX/slXw12UyZ81DfKXX0/eI4rLnzuDCXUWagxQmzTsuJxDu2tC4AILgiVdshQCL6/QFKROtKapSWfaQK7c4rktFWqP/R7IAx3Wqpn1gzedxZxRH+C4HeDKSLfpeEgC+S1B5m53wKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pEl8sV/POqKv1XfeKiAe6Uemj8PyzgSWLyWVr6B3cA=;
 b=H4brw+G1oTf1tr4uqG7TBMNTbsmPYOVbcU6bqxuDrvqFSepICVwtmzvYgvsJ/O/uSXSDe2EKEMNHAcke2INVUTtL/Lkvsrhz0IBQ3WM2OfttkSWe++JXrunxeYCZzUdRafEWa77pdGDyuIxHzrfAYaHc1uUsKi4M3Coj1J+6guT+D7FTAmTlAxlyQmxCSa/Qh6DijQqs8zQ9/bHO86sKe+wnQ+r7mn8cpngTt+lxd9JvPTF/fxpOtj55SmBKmaqvbkYTeftTmGUGJn0RyziJNupO/a498jzIRxzGIDJs8OkIXPCZUrgxz3L7v+n4ks1g9BUbPUJIkxFMQvESf+SERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pEl8sV/POqKv1XfeKiAe6Uemj8PyzgSWLyWVr6B3cA=;
 b=5YChXYvobjadq8qVWkzISMHGfKZmN2q/2gQbc0i7SDKwPM+J5ZsQpWQ3GyPo7xp4hyFoxZ/nUWQU0gZVXgAnWhNOWTfAOb+feoFs5XZZYsqMc2gkdaVjZmufnugyL92UFZ8BXaWBPmlI71jqu/3/lV8tGVruriCy7RYZT3vsURo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB9PR01MB10428.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:307::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Fri, 5 Jul
 2024 09:41:57 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 09:41:57 +0000
Date: Fri, 5 Jul 2024 11:41:54 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot: do not pass O=$B, if $B = $S
Message-ID: <q22jlsvqxcrfo7bpgeu6iqox23lji3t2fgwxkptddo2a75dru5@eod6dk7stnyx>
References: <9e5273afdef2797f48970927998cd5f6d5b1e63f.1720120588.git.joerg.sommer@navimatix.de>
 <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="ddmkhnkq2hgdoweo"
Content-Disposition: inline
In-Reply-To: <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
X-ClientProxiedBy: BE1P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::15) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB9PR01MB10428:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9ae212-66fd-4ca9-266e-08dc9cd6b5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVRLak9mSnRVU2wwR3NYZldYL2VCWlJGMkNxamw4bnhxSFVJUWdFSlN4OGJj?=
 =?utf-8?B?Z3prb3l6SkJMaHRabGR2ZlB5UGNnVTA1TldKUGkwdHhKbzlVblJ4amhjc2pl?=
 =?utf-8?B?elRIcVVVRi9NNFYwaDhrU1FHbFNCNUJYSEtUYllPVDFraXVUNU1Vd3YxdUQ0?=
 =?utf-8?B?VFlOT1ltU1BnNWtJbUk5TVEwUzlmTkprRjJ2OTh5N2RiU0tFbjZnMlUyUVpF?=
 =?utf-8?B?OGRXNHMzN1lwaWNtQVNmZ1dyOGc5Y2tBK01yaW1lT2huaEZMbC9BcTRKc1ZD?=
 =?utf-8?B?UkF6cS9BaFBMdTNOYWRFT1VJbVRNZlRpckJWZkpmNHpieTZGeXdPMU42RXpO?=
 =?utf-8?B?eEROTHBaRVJUN3I3WlhxcXJlK0xkdGF5SmxTREgxby9DcHZEMDhZdXpSMDBP?=
 =?utf-8?B?ZXM0TFFBWUNHUWFYUm1yVVAxTVBTSHVmT2R6Q1NzMk00NXZKT3ExZDJXQTlC?=
 =?utf-8?B?czMwcmQvYkJuMlAvL1NhOTBsQjFaUjFWWWpNMDhBK0ozd0FKZ2pjWmMycmRs?=
 =?utf-8?B?YnN5Q2VubXRzSDk5em4vc2pBWjBrNzRRVUdNa05QNHZ2V2wxcUt3UE9CZFZq?=
 =?utf-8?B?eERtQUZFajJBWGI2dmlXUnBHNXg0YjNZMWNwNmNBLytBby9tTFd0NHdmMVpN?=
 =?utf-8?B?RXk3aHcyM0FlUkk3RURHNGNhc3QrcitZS3pTQmNRVWEwa2pyeVFQalgxN0w0?=
 =?utf-8?B?dUUrMG41TVZicW1DRkRyRUVKZThJYjhrZ043YmthZGtmMVBpTHVkREhMWFdC?=
 =?utf-8?B?OGdRazhiM21sczhxVCtjZkhTSDBSemI3V0dGTG1nbVVPT21JSzNBMDMvV21u?=
 =?utf-8?B?K0ZBTVU3SVpNRkUyY0VoRFVtR3hIQ0V3VHJORVlscjZxYzd2TXdXWjBLdnZ6?=
 =?utf-8?B?MU9tKzhjQVBGVm9iVmRORnhrMVpoRDhBVEREaWUrMlBDWDhLanV0V1RLcWZH?=
 =?utf-8?B?OWZLNEQyeGNaSndtQ1ltb25QbHBid0FTd081RTFBUDIxd2daL21Jbm5RcFRq?=
 =?utf-8?B?b01Cc29QWWdKSmpQZjhUb2VkbHdCSmEzVloxd3YrQ3VWMWJ3OHVrbkdsZ3ZD?=
 =?utf-8?B?RnRFdkhnOGhSUFNwQStPdHlLcmRMMUJaTndwY21zWSt5Vmc2REpJdkNSdlMw?=
 =?utf-8?B?WnpHMStrY1lCeVgrenI2SFUxcEhaV0pXSlY1Qk1NZUxMVGhHczNPV2loUFBh?=
 =?utf-8?B?cFMvUSsySGlBWUdPUnc0c1hSTVc1Nm94SnFPOC9EZEk1YlFqMys5SkZTczhF?=
 =?utf-8?B?eFY3bzM0TVhmME5OSk1hY0xRYVdJbVQ4WVhCUTVYaG96eUFTRURkUW9ldUpN?=
 =?utf-8?B?aThld0VTeFc1czN6UkNGOWlDN2pNRitXd1EyQUIxRitNR0EvTXZGQ056NWhM?=
 =?utf-8?B?VFZQUDZDbWh4Q0RxR1ZPV3BiUUVTM082V2VCaWk4M0NzbW1kMnR6K1NJMTFj?=
 =?utf-8?B?dlVoaVI5YVpJdXRNOFJFM1hyNEZrYTR5cUxjdkRYTU5YSDI4ZHo0VzE4MjhU?=
 =?utf-8?B?c3lFS1kzYWo0Y1g2bVAxN085eVQvTkljcTNEeExNRVdFeUpMTXVaQ2RrL2lB?=
 =?utf-8?B?NGNaTWRsQVZwU051R1BJVFBTakVXVnJsTkdld2h3eXpGYXJOZjFTSXVJNk1i?=
 =?utf-8?B?djZyNkEydDNBb1ozR2EwMWtHYTNNT0h5RDFERkhYaThtMWI1YjVKdTJLS2JW?=
 =?utf-8?B?UFU4YXdGMTNNbk5RRlFVSmpBVVlXUDdoWVJ1U1RyaHBzaHdXbVp4d2VzczNn?=
 =?utf-8?B?R2F1ZWV2czRsQWY2ZUg4dTMvY1F3NllMbzF6aldWRnZLcjdxeFljano1OU5l?=
 =?utf-8?B?UGVIcUd2MUw5ZXIwMXZ1UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2VMeHo5M09WeFNSYTY1cDVsZVVmSndDaGVLTDdPK1hDdnkvSE1rWWFHMXZV?=
 =?utf-8?B?SEJFK014WkRmUUE4UlpuWDdkc013SkVld29zOEh1MFJWZlg2MHBVanNYMmI4?=
 =?utf-8?B?b3Z6OTRzRlNwNnFzL29ia1I5QThhMnU1R3dzYTVXRlF3WGo3MnZOZWh3VGRa?=
 =?utf-8?B?b1B2OU1TUlhUZVBsNjBHNGNKWEN0U01sZitHRkpEUkl2eWRWaHlmQlVOTzRC?=
 =?utf-8?B?QjdNeS9oTjJYcVFDSlora3B3SHpBOVVpbjdUMlZPTkpqbHBFUkI1WlA5d3VG?=
 =?utf-8?B?aU1yUURHNVhpTzJ0WXRCZDJSNjNFTHRuQ3E0eUNhQkRGOVJkb0NnaUV0RTVl?=
 =?utf-8?B?UzdFeEswV0cvMGJ6VzRVVVQ2Mk5WUXFtMDh3NEI4cTdzdWdCY0VaWERiellC?=
 =?utf-8?B?a2JlOXVTVnpuMmtnRjROalZoVnd6VVZjcUxQYmdxaWEvWVZncmRSY1hHNkhq?=
 =?utf-8?B?aGpkUUovdWxQR2R2MHZIQ0M3T1hDclN1eW12QVN3WnAxWDlJZHVvMFZFYllz?=
 =?utf-8?B?cEVvQkdLQjNBK2U1TlI0ZmQ4WDF2TGRFbnpGZlVPOXRnbitWdHVnbGY4REVj?=
 =?utf-8?B?M3FLUG9FRFBBRGgyV2sxVzZDd0x5OVpSdlJTTlBTSmEzR0JVL0JiQmQ0OGhB?=
 =?utf-8?B?RG9FZFNNZ3ZtbDI0SGIwd25WVTdwYXd1ckpxMkRMdmgyREhRaUJzUlRVZzh3?=
 =?utf-8?B?TDdyMnVxWm16WGVpY0Q1SU5GNHBxUTVsa2V0VFZGcDMxMlZBdXd0TTk2NE41?=
 =?utf-8?B?UkNIUUd1elhPU1FPSlNHcXROZ24yS2Zxc3hIODdseHorL210L04vamw1QVBr?=
 =?utf-8?B?azgyWitTWklXaHkxMlNZbi9oRTYrVmdsOTVMTTlSSHZIVk1IbW5pWnNSWXAr?=
 =?utf-8?B?cDFnSFk5dGtQMG80NGJ3dktvYXhCUVRBNXNTTGZSWVNiZ2VjRGRPaUV5VEZw?=
 =?utf-8?B?TGhENHZOWmpYUVJOcThac2tKTndvUk1HemYxLzZCRXdUdysxREF3cEV4RG0w?=
 =?utf-8?B?OEpReDNCbGZqWEFWdUVkdERNMU51OUFSQmErQ1ZvQ1czZXV5NWpSbk8rd2kx?=
 =?utf-8?B?NklzRldVYjdUb0w5bzYvV01rby9zS3NtK3BMMG00TnlhYTdSY3FxK2ZhQ3FK?=
 =?utf-8?B?NkkvbW1QbXVMK0dvKzlPdmZWTkREbzlpZkxxQ01rcitrUUc1K1Q0dVJkNTIv?=
 =?utf-8?B?SUd0NUxYQSsweG9IN294bENpWEhoNEdUaVNkdzZmK0ZEeUFXc1dBbEYvcFVG?=
 =?utf-8?B?Nnh5UVZRTUg0NFdTd2pLdHB1UGg3WUZROTBTMjdqQXpWS3RsV0lUNjV6RnBx?=
 =?utf-8?B?cXQ2Z2pVaWorb2UvSElHRmNsN1I4YmpPdXNOR09mY0hKdVBaTG9LeEJ6bE55?=
 =?utf-8?B?WDZGUGhsOXkwbjdKcjhIeDRIYVdOM3o1SFk5TUhySnVDeVdJMVN3RVM1UENG?=
 =?utf-8?B?MUZ3dWlyVksvVnM3WjZpd1MxV3pJa0w2ZWhhbXFwaTdNY0NmZnhhVGxid2tW?=
 =?utf-8?B?QUNjcDlBQnpHaHBpaGJRcTg5ODFZeGNScExRbEdBcENZS1R6YmhSbFNENU1W?=
 =?utf-8?B?MGUzWW9DZlMvVUZzaUZ1bmtuaktMeTJVL2t6K0QzZG9WbW50TEZJclNpVnU2?=
 =?utf-8?B?N0FCUHN4RmJ2MUFoakpIS0U3S21yMERNMmdlbVRMdk5wMkRtZXlKNGszRzcz?=
 =?utf-8?B?dWsycVhWYUxiVEI1bmRYYURGUWxHTmZRRGVqdHUvRktBdGhpVVl6Y0grMEpo?=
 =?utf-8?B?UWtWenlDRHllZDByamxwbVJJcjE2TFJtUlEyKzAva2tOd3JuL2FIdUV4LzNF?=
 =?utf-8?B?SjhjVkNSSnF1RE9OSkpNV1RseEUrL1RUbGo3VGxQZG04TzFOalJqQjlhM2lq?=
 =?utf-8?B?Z09jQlUzRitzRjdkR1A1Z01MYXZnYzJzTjg5UnB0OWZSc3NqVzJEbTRZMGdj?=
 =?utf-8?B?Y3U3WFRPMUxLTmxOSE0xdW13M2tqdUlPNUgvK2VObmJNbGQvZTR1MzFxRUd5?=
 =?utf-8?B?RVlpYTJHelZES1Z0b0p3U1pZenFndTE1dldHL2NkSlYydXVCS2hhbFpGVzdX?=
 =?utf-8?B?QmhIQzZ6M2VMaFFNT1JXSkE0R0VLU1VyTGM4OUkzN3VHTzNCWFBpTitobTJT?=
 =?utf-8?B?TGhhVGprOVFYcnlwM2o0eTBFa0lOR3BrSjNsMU9qTW5Ob1NJZS9OUi9uWmtn?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9ae212-66fd-4ca9-266e-08dc9cd6b5f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:41:56.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amKMUAWAyOcGbikM6HYoy1ESfkbeZf0ApX/Iwqyr2K+RJEyzzqVOI7X0ysTSU6ky3TOGeF1q37OaZ76actrq5EfrB1edBXkZzI9f7YdEdiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB10428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 09:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201596

--ddmkhnkq2hgdoweo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] u-boot: do not pass O=$B, if $B = $S
MIME-Version: 1.0

Richard Purdie schrieb am Do 04. Jul, 20:38 (GMT):
> On Thu, 2024-07-04 at 21:18 +0200, J=C3=B6rg Sommer via
> lists.openembedded.org wrote:
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> >=20
> > The u-boot Makefile (even v2024.07) doesn't like it, when `O=3D=E2=80=
=A6` is
> > the same
> > directory as the source directory and complains about a dirty source
> > directory; see below. This happens when `UBOOT_MACHINE` is set and
> > not
> > `UBOOT_CONFIG`.
> >=20
> > ```
> > % make O=3D$PWD all
> > make[1]: Entering directory '/home/joerg/git/u-boot'
> > =C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/timestamp_autogene=
rated.h
> > =C2=A0 Using /home/joerg/git/u-boot as source for U-Boot
> > =C2=A0 /home/joerg/git/u-boot is not clean, please run 'make mrproper'
> > =C2=A0 in the '/home/joerg/git/u-boot' directory.
> > make[1]: *** [/home/joerg/git/u-boot/Makefile:1928: prepare3] Error 1
> > make[1]: Leaving directory '/home/joerg/git/u-boot'
> > make: *** [Makefile:177: sub-make] Error 2
> > ```
> >=20
> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> > =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 8 ++++++--
> > =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> Can we not just always ensure B is set to somewhere different to S?
>=20
> Building in S is generally a bad idea and we try to avoid that with
> anything that supports it.

I did some tests and yes, setting $B solves my build issue and does not harm
a build with UBOOT_CONFIG. But I must admit, I could only test this with
kirkstone.

Would it be possible to get this patch in kirkstone and scarthgap, too?

--ddmkhnkq2hgdoweo
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNzA1MDk0MTU0WjAvBgkqhkiG9w0BCQQxIgQgrqfu93st
/G5RmFMyEuyd8vd/MvYxxXMFD6LZ7g6aWyQweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAkQOLVTSjbGf0V8T6ThILApf3NHK3Jf3POezFoXvseBi7qTpei2zAJ8oIJ1UndO/A
YQH5fQiHQqk91YzZV+sB0iKS6UXH8XxPNk/z7zWG14HkDzA4vdz26yqQRZ5RW7/YkkSTr1Y2
XfPvp99gLTNiH7v1n/OxmnElV7uVaD1HtOlinVwSjd+CrgmDu3E7zqYDNREefEmup3fnEewc
/yg+4yD/yTPX1VuJbp0qHE4Cw1Ue+ep9YyxGPMr7fdUCiajsnIUY9ImSarsb30FmarGdAkiA
NBcfExNRQwxhNfs6amLND2wuPhoki+arI+VIyTnmLdmIF7oxLPFUOWMXHk1Asw==

--ddmkhnkq2hgdoweo--

