Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2353C2BD09
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 03:36:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.138])
 by mx.groups.io with SMTP id smtpd.web11.2348.1720064158600320985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 20:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=gtPh1zdS;
 spf=pass (domain: navimatix.de, ip: 40.107.104.138, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXTtOkMqUbN81P26xop+q8o0jiScUkJ6QsL+l4geuthvzaBnmxIIHgLxCbLAyOu7PYBSzeBoOromE16VEDwFn7Y3V6MN12SxgNQ3NIDyXa5OMEo2SLlZd4ejpc/0qFRhvjaAQcgUXl8Z/6Nmfkxwdi+LmhA7pYnSDURIWNs0dDEt75ax7mUh4+oVHZLjeBsnVtau0slNaBIpRKYqphU+v4+j086zbmMrlBUV0hqLacBbUur3D/HZszbLIg+o5dQNEU2YYYhzAsdiuL4eyz36bjljles+3ek7KWPx7RwcNtaG+1r3Wl3Q/twQWNQF8vZgA6Gtp//+IPi9ujutQJawUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KxXTDXfz0dPmALBRr8L7HWLuiRKq5sgN8soaq21Ndo=;
 b=aZAlBMHSHTHXH6Isp3gnX94ZQW3Qn404rhZGRgZcxQ3eOtScaAaTm14NtNnzw5LsOmFM6RcOuhDMdWdlKqJFQQL9lootlOBm/D3KFr1p++c1czM43zicR891iknTkD0iMxvxmkpuupRrB9jBPSdQMYp/jIofNZmTVNQBTUxPgrISWlP17PZfCx9kUs6dNO4DcGTewm9ChaRcdOxRGVq94j5HxbSJuKigPvE9Pkmo4yiemhIs2OWICWsx52yeAdqxjco+5mvGrsvEKp8XJ7zzCjfdKgLY+6kqiLqYY5h5moNGWHKEUJH4LtiWlvIlhrivfQySCoJcFKC2AyvqWMzM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KxXTDXfz0dPmALBRr8L7HWLuiRKq5sgN8soaq21Ndo=;
 b=gtPh1zdSz4+UeXuIOfh0fPjawLqT80QAQ7sCiWdKB2zzwvrHL5dgtfsmGgjqtYfWHcSXc4Fx6zCE3LNQHxoa8pzUK5BGaZKT2D/z8Asbf4R0F4qE372EEXvtgo83pY0ssdCFIXRFtmk0EUaGUn1QKdDVHkN+Xmv6Bn103tIRv/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DBBPR01MB10557.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:52a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Thu, 4 Jul
 2024 03:35:54 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 03:35:54 +0000
Date: Thu, 4 Jul 2024 05:35:52 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: bruce.ashfield@gmail.com
Cc: Harish.Sadineni@windriver.com, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
Message-ID: <dome2fa6t7tgbuszz3po6koeaoyuzugqhjzdbx6svuu4aqdkoc@bmrlvnarcgj4>
References: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
 <iwh3wbdnsoxke2t6j7qud5qv4rfz2fljcob5y5nba5afrsxpth@ewx65frf4g7i>
 <CADkTA4PaXx4CoqsFLGTw5Tc9ejRBtArdCpEhZC4DmeyzWS4wqg@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="5fnw4afe2uz4dfhg"
Content-Disposition: inline
In-Reply-To: <CADkTA4PaXx4CoqsFLGTw5Tc9ejRBtArdCpEhZC4DmeyzWS4wqg@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::18) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DBBPR01MB10557:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe97171-5c15-468a-3a4c-08dc9bda68bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QnpIYkdIbHhPTnlLVGtLRVdyNjRhSzN6VXVtaDZjM3lTTzE0Z1JwL2V0Tk9G?=
 =?utf-8?B?L1VHTTEycml6cVlTZDN3c0RiMVZSVEhGTmlMWlpSQ1JEaHRMMll4MVlZbFdk?=
 =?utf-8?B?RVU4dWx3cW9NZXpKeXFKZzNqTDhPK3F4aHAzN1FoNDVUYXJXR0xETGN0d2Y0?=
 =?utf-8?B?b1FLdnN5VysxTDBFT0l4N3hzeXBDSUNacXlqdXdJWTlMQXNtYU1WdnJZTE1L?=
 =?utf-8?B?NDlsWWZLV1BWWFNwdDRrRnF6c3k2SUNZeDQ4Z0t5VE5xYTI4R2VSZEdIZVdY?=
 =?utf-8?B?dDRBZitOTGJ4bEhMdFNDanhCVjRYN080RmtCRENWRFFPRTJEb2RKZUNlV3VV?=
 =?utf-8?B?MkhDeUw5SVFyS0tjcHNmZ3dmb0FvQkRIVDZuNVZhdUthUGhRbkpFYnZuSHBi?=
 =?utf-8?B?eEwzTWluUGViaGJKUVh3Sm84TDlJSDk3bERNcHdiZXNYbCtBYzROdFMreXVX?=
 =?utf-8?B?TWgyK1VONmREUksveXhmdW9jTGVIR21hSDdvYWN2TG1WamYxMXVETXVMWTVZ?=
 =?utf-8?B?MklqOWJoZlBqYnhTVzU3eWkrOExGVFI1YzV6ZkN6ZmpjL0JJc3BTMlNBOGxZ?=
 =?utf-8?B?QWhsMTdEdWVQRzVqOTd2dmxSYkpwYzRINEw1T2N5U0F0NldIYUlJU2tLVU0w?=
 =?utf-8?B?bHZ1YXlVS0ZVS2dhY1pwZFB3WU5DK0cwNWlLdXpmWldOYUxGSm1jbnVCb0s4?=
 =?utf-8?B?aXlsdGU4VFg0akRiUElXdDhZMHNtWHZnU3lIVDVlQjQvOFlCdHdOQ05zcWpV?=
 =?utf-8?B?Zk05SDhDY2l0ajBTcm9jSjlscU5XQ2V2OHQ1VUZLOWxRSFBXaE5jRDZmdCtk?=
 =?utf-8?B?bDFDOFRlNXA0ckNlNFpsbDA5OUZ3UUsyc0txNXExdzl5OTRVUjVQU2YraWxq?=
 =?utf-8?B?dGNKbjE0Q215MndaZy9HT3FtZ3NzV2dIbkpkeEZDS24xOWZKS0U5cGNHbE5p?=
 =?utf-8?B?ek1HSm9GTFpXQll1WjU4bnpZKy8xTWZDTFZPK29kREpTZmx1dks1VnRSVEFP?=
 =?utf-8?B?S1p5SjF3NXYrWk5leGpXdGtCZmhuSmU2ZkpBUXA3elZPbXhUZE8wZnA4emNS?=
 =?utf-8?B?QldFcm53QWhQK0txN0sxMDJVUWkwTDNKUXl1ZlVCNzZrSiszeC9ITENtWEN4?=
 =?utf-8?B?V214eEd2NmJCdGZEME9xbjdFeXFnVU55ZzhkMkxLV3kyWk01OHlwYUlWMXlW?=
 =?utf-8?B?VFdHSlRmR1Z6Qm9iaytZbzBPR0V5U2JqVUZ1UkRLaGgwWTVPa2R0UkFzakFj?=
 =?utf-8?B?K2VOVktqamhWdTdIdFNSUHFBd1IxenNhRDV0OTU0NDRNMFp3TjV4dDNlR2ov?=
 =?utf-8?B?MlFEbnMra0xVN3NLeE1LNGRnNHR0ZExoY1RvdS9yTnpKMnB2RXFrak9MMjJB?=
 =?utf-8?B?QkV4c1gzdEs2S1QwampFTjNhaUpiQ2JJZGh6bDNaVnVPejZOU2M1NEZqRkFM?=
 =?utf-8?B?a3V1YXc0RllMRDVEdytJcTArQnR1a2o2ZHA0R2duSEpJZDN2cGNPVlYwZGl1?=
 =?utf-8?B?TUxhYk9CZW1ZbGtPaEtlL0ovbEsreTZwUHlOb1BrYXdmZ1U2RzNxLytBNDJX?=
 =?utf-8?B?Mm5KYldiaFBHNHJrZXBZaFNnbmRVL25HemMyeFd5TDhlOW1yWE8ydWQwSjZ6?=
 =?utf-8?B?V3RKdENaVHdCU0lkeWFnUzhOSitQWlRWNlBYQmdIZWtZTXR6Y0tSL3FId09h?=
 =?utf-8?B?UUg0OUxFVE1RY2did013WXgwL0ZjUnVTY2hHcTcrZlRRSHNYbk9aSXJyd2Vx?=
 =?utf-8?Q?g9tVj7PlEi0PRoQ6UY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXRxOE96dlZZRGplUFNBS2tJY05iVDBZU0VrK00zV3c4R1p4bFBhalZIWEpo?=
 =?utf-8?B?b2RYY0k0MUp2L3I4czhMV0IrcGplbm1XSDFpVmRXMzlFQ242M21XY3JiV1R5?=
 =?utf-8?B?RXF5dGcvcG0wM0Z0SVk1L1NORGVYaS9aVWlHa2tNUUdFS2g3ZUF1dFdSZDFk?=
 =?utf-8?B?RCtEV0RMcUhvN0VVRGp1N3hTbUtDKzR2bUNyWmpVRTJRYjNYRnpjWXVPek9J?=
 =?utf-8?B?WmdjZlJlOUJBenFScHBMTFBhVGoweGJpVGtMSkJxTkRkQ1kxWVNJclpxa2VE?=
 =?utf-8?B?ZVF4VFliNi9Md1FXTHZ0VUdQMzd2dnpxVy9DNUp1ZE9SVldWQWcvWDNiM1hY?=
 =?utf-8?B?VXJvcFRqRUhtT1g1MVVuOFRBd05DaXhhUlBsRk1TV0ZHaVVIRThDeGlrSFJk?=
 =?utf-8?B?ZDZHdVR0Wm82Um9uTjZwc3drdm9kUmlyLzA5azROR2UwZjIrQzlPVzk2dGR4?=
 =?utf-8?B?ZnVsdFVCTzM2cllsT0NJNEdwd1VjU1FxYnVSUFUvRldSY2pvODdrNVBSLzMw?=
 =?utf-8?B?THF2TEhjNWVLNjByRkdWYUJMa1VsQXRJbE11TjFabEVnclVmcm1hdHd5TThQ?=
 =?utf-8?B?SlFOaVh2eGJnZDM0cFRzYWdwNmc2KzE3RDZMQjFIMEJRZjNid2xqSG9UbEt3?=
 =?utf-8?B?eDEweXJjemlIdjBERVFiMmY4QlI5UGJDNVFJR0FFbEZrTFQ3ajh0ZmNuaHZF?=
 =?utf-8?B?UlgyTCtwUFcwaGtwK1FlMFlTRnUvRlppWjdYQllSMDI4S1NBODUzZGx4cmFU?=
 =?utf-8?B?MHhNWFZwTTRMVE1GbUk2YjJjaHZwVmVNOFZhZFVSUktLVjhoZVMveGZscDkx?=
 =?utf-8?B?S2g0aVRYTGlJVUxrd1Q4RGVMOUxxZzA0dFVnclZVMlV3ODZ3a0VqdDJaeFpj?=
 =?utf-8?B?d3Y0aHRCeUJ6YXpPcmtOVlFVcGJkTFBRSXdvNktkUWJkbm1BTmVORWl5b05W?=
 =?utf-8?B?TlpSQU9OclFzTklFcEdEd0h1QTF0eVdMZVNpUS80V1QyRXVBbGVCSXk2KzY2?=
 =?utf-8?B?QkxOTUU4aGQvNFlLM1BobVF2UTJrVDA3amk2OVpLSXB4a1JFZWZtd2c0SmtX?=
 =?utf-8?B?OWFaZExHOHNEMHllNFpIc1N6RlAvY25VVlppV1paWVZLWm1SMjkxWFZqUDFo?=
 =?utf-8?B?d2VDdzBHaEJVRDN4VDVNYllsSlV0Rk9SbDlSWktIdlpvYVZhMTlBNXJwVlNI?=
 =?utf-8?B?WUFNdVJPMjRrakU1VTU0WFFvWlh0T3YzUkVacEhGUEJrck1TL0d1ak5Pc0xi?=
 =?utf-8?B?SmEyV3ZzTjNTSFhtNGhVbVpiRWViNlBNY2U1KzNwbENBZE85M0tibEVrcXc1?=
 =?utf-8?B?YnVVdTl0Z2t2UmhtNWFGRXhuTTRHRVBQeUM0RHc2SUhHeENDYXBHMVdTcEg4?=
 =?utf-8?B?ZnAyZ3R1OERwWXRLeGRvMk9URFRzYXR2aDFzc2luM3h4Q0pXN0NoRjBmVm5l?=
 =?utf-8?B?T0NuTWxmTC9PeHR3Y1BNUjVFWFkvNnFhNE9LVVB2ajFBNmhkUTlKNFFSNXZC?=
 =?utf-8?B?K01DbUtTRHF1b1VZVkdGVnFwZXdRZ0RuOGNsREVmcmRxd2NxYUZQMXJpMnhO?=
 =?utf-8?B?bUpjQm5HOFEyR0x6VmNJWnUrQU4zNVdMOCtvOHRraWhCTU45UWo1dHJCUFQv?=
 =?utf-8?B?b3krVVQzQXN4MDZGNktLcEZoZktpcHB4R0xWQXdSamdoQjJIcTc0d1BnWC9V?=
 =?utf-8?B?U1UraXFhRkZPa2o3U05zZnYwdUNFcy9CampLQjRmMXFPd3JLbXpFSjdCa05W?=
 =?utf-8?B?ZkN1R3RaeUxja3UwcXRKRkhOVWhXZkc4aFlBdDd2NG4xazQ1d3FHRHV2Wmxp?=
 =?utf-8?B?UkVPKzBKVWxUdVEzQ09LRS9PRkI1MmZqYTVlZGt2d1d3V1FWSEFUN0Y2Kzdm?=
 =?utf-8?B?RzRSOElMTSsvYmgzUURkK0JtZ3dwUzhCWEdtUk5JVThObE1XZW9XVGtqSm9F?=
 =?utf-8?B?NVVBYzVIMXFKMzJzSXdmZFJMZVRNckg4QjZ6Qk5BVG1kbmdDRjRFZWJMdm5v?=
 =?utf-8?B?bXZKVWk4aUorUFRtYk50RkQrRyt5VTlKYzhiMmp1Y0YwRVN3WUQ4aXUrNC9m?=
 =?utf-8?B?WUcvS1NKako5Qk9Qb29lVE13aitua0ZkdytjVWFBNndlYmR5REhrYjVGSngr?=
 =?utf-8?B?ZVNmREw0ajZ1Rk4zU1MrdlBHaWI1TnNkeUFQeW5ZQlVOcFVRMyttdmtaOHA2?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe97171-5c15-468a-3a4c-08dc9bda68bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 03:35:54.4035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pJAm0kL18WGBJ98J7mFuxoYIAMTMs0LNECrOPIQZBsZ1NkCXMVSVKguG1d0TqG279XVCJiX/h7aqUOwSkmgIMTfysBiNaM+QXSsgvno5wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB10557
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 03:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201501

--5fnw4afe2uz4dfhg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
MIME-Version: 1.0

Bruce Ashfield via lists.openembedded.org schrieb am Mi 03. Jul, 14:44 (GMT=
):
> On Wed, Jul 3, 2024 at 2:34=E2=80=AFPM J=C3=B6rg Sommer via lists.openemb=
edded.org
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> >
> > Sadineni, Harish via lists.openembedded.org schrieb am Mi 03. Jul, 05:5=
2 (GMT):
> > > The following commit addressed the issue which checks whether the str=
uct "task_struct" has __state or state
> > > https://github.com/chenhengqi/bcc/commit/d3cf5dcecfaeb6d8d346e2228626=
a7dbe506ad38
> > > The above patch requires enabling CONFIG_DEBUG_INFO_BTF in the kernel
> > > and requires pahole.
> >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes=
-kernel/linux/linux-yocto.inc
> > > index 0132fcffb3..d6b4794d32 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > @@ -65,11 +65,12 @@ KERNEL_DEBUG ?=3D ""
> > >  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "po=
werpc" ], "elfutils-native", "", d)}'
> > >  DEPENDS +=3D "openssl-native util-linux-native"
> > >  DEPENDS +=3D "gmp-native libmpc-native"
> > > +DEPENDS +=3D "pahole-native"
> > >
> > >  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make paho=
le-native available before do_kernel_configme
> > >  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG=
", "True", "pahole-native:do_populate_sysroot", "", d)}'
> > >
> > > -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", =
"PAHOLE=3Dfalse", d)}'
> > > +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", =
"", d)}'
> >
> > Can't this whole line be removed?
>=20
> Can you elaborate as to why it would be removed ?

Maybe I interpret it wrong, but the true and the false case add nothing ""
to EXTRA_OEMAKE. Isn't the `+EXTRA_OEMAKE +=3D =E2=80=A6 "", "", d` a NOP?

--5fnw4afe2uz4dfhg
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
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNzA0MDMzNTUxWjAvBgkqhkiG9w0BCQQxIgQg3e+Zpl3J
O5t8UUr6b8Iv3QaMsQKg5MwFljBGLW7luFUweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAC3haqvrXhY54cPXIa5hoQXombaN9UEmj/rFMloC2EZwT6x1S6kSLHQOs//ogMZxC
Bmts54b/vkMDgwnGf52xwJjFn/95yO+eaBmlgJ6S+v57esUrxMZvdYRlXEcMqvO5yo3UTJXT
ngwp1m3BD24rspFUrTkLoNzqGm30trrMtUDhaD3jCm4lE1WzH/VyUfySt9SvXfI3Rytweug0
OJ9asq5uZgLJE5g5rJtVGrQ7d5/GitAFtCyDFqY1LPaXWn+bBBOY/OokZHC2Cs2blatrDhdF
8Bpbw63iYL1zQsiGhl59mE79vMCmmX8C96nnEG2BY6x+Vc31Yi0XFdnE88hioA==

--5fnw4afe2uz4dfhg--

