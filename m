Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE89C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 11:16:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web11.14414.1736765207198712261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 02:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=m22kwNiP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.65, mailfrom: catalin.popescu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue3hA1LkSCX9inelJll+ury78zZSzeo6+t8n9KGxuU79Wqst3NwcpZqEcnNQQDWWbhC9WndC8hQ8ihv6MFdACHRYmvhhMuD+AqgoyqkiSeO8Ti//U+XpTm5LA2ALza6TJ/4peOc+fAkXtxAYXpYRxebg5XyZvDr0/Jod+sEtnvJzSz8KC3fhb+FwBbe/tXFsZ/lJczZRYlXWaLHbF3z9yfxYPXe6jkKRdv3lzaYmwAyoAz194ohSu8cTj0q+nzLWeDnPR8d2xp96blku+H3qq+YiJD2Sw5+wquR570W9fFLHrlPBSr+LiFkg0YPmL79ct0mbS4FGlS3uaYFrNhvofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ja4onAThOtaFdy6R0nB4RDaBDGule2Z4RVLeIQn3f80=;
 b=l2UFoA6QuuAviWlYinCbUNzmdDn3JMmipqlm5BUEvpPzB9Yx3yvKvf7bGA4lrkoh34QuWd18uwfqAT9bjbt/IDoFr5ryULRv3Bl2EXdv/H3JB5ZabIyrHecwbZ07TwiQ+dJPI9PhkaFC8HJsgPDg2bK6SkpEjL2UuAQYBn4wmTfM47iSDuJOm0o48viIhYEHO+GWuGZjSV5GfgoBB9ZcfEv2Ve/NSMDwt8IO8CkJiKbqFLaBnox+CwR9pny1NA7uAkMhQLetPqtlSw0mH2XcW9gLXO7p6oNmneAhI66z7KrOtzhORFaOFrL/RnUkCLfAzNAMSQVgXHv/9n9wJH13tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja4onAThOtaFdy6R0nB4RDaBDGule2Z4RVLeIQn3f80=;
 b=m22kwNiPJTks22gm3PXH2WvAQt3tmGAB1AYyoC8YLcrNzfIf2oW/pTcfczX3mfCWlWBjDjpPS0NZUF8nczIaq7G7EIHJvbmPpmE4V8Igx6Px+cVjd3AahBKksKObzeScunGlBRw75lLN7Q4N12+ibK9sPG4DxAkiOC6lgEpiFXY=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by VI1PR06MB6768.eurprd06.prod.outlook.com (2603:10a6:800:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 10:46:42 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%7]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 10:46:42 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file shipping from 5.73 to 5.72
Thread-Topic: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file
 shipping from 5.73 to 5.72
Thread-Index: AQHbYb2xfJ/q8Va8aE6fA9r66k6ItLMTN4SAgAFV3IA=
Date: Mon, 13 Jan 2025 10:46:42 +0000
Message-ID: <08981091-3b9c-4282-b1d5-bd777c69d2e4@leica-geosystems.com>
References: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
 <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com>
Accept-Language: en-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|VI1PR06MB6768:EE_
x-ms-office365-filtering-correlation-id: 0a57ce85-4ef3-487e-25be-08dd33bf910c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eEZGYXArTFoxZ0xVZWlHYW5EdUNsUTNJQzRBU2hyNTlIeFBGQ29ZKy9aNHdH?=
 =?utf-8?B?TDlxSm9sTDhaWnNhVnB3RXdSNjdRaG8xQWpwQXM5WW5idlpiU1RtWjVNUllq?=
 =?utf-8?B?cHlHVzQ0d2phTDR5aFVTVGcrUFJPeHZmS1EwbS9LL3RldWRZRyt0K3dEVEx2?=
 =?utf-8?B?RFZ4RHFtazV0QXcyVUhyUUViT2wrdHRWT1IreWk2Ukh1ZW5TaG9BV1dVcGNz?=
 =?utf-8?B?SWlVQUw0czYvSFlIZm01ODNLTHhkKy9wWUJ2Ulhtd0wyWjE3VTdaV2JiMnNx?=
 =?utf-8?B?OE9TSDZGRjBwUzlwRU55dzRmS3N3WHBYV3E5cnRtcjhqU1hFQWg3bG0zTjg2?=
 =?utf-8?B?ZENIazhGUnpqaHNqRFFGSVl4NzhKOUJaNHBGL2M1NlVLdnZxaStFbzI2aFNK?=
 =?utf-8?B?aFRDejVobC9uY1VjbXFlTUlIcUpZS1JESHNKdkJONXUrbXRkaUF6NStmWTE0?=
 =?utf-8?B?NkY0WWxjM0xhd25HUjBoS2h1aG5mcjRWcFltencyek5Gb0xWOG0yaGcwM21F?=
 =?utf-8?B?UFhXZVlHcUxHOTNudEE4OGFQeElyYVBWT0NHb3dFMGorcFdGNGVzS3JTZFlD?=
 =?utf-8?B?OTZ6TmVYMDNBVnFuU1A3cDBJM0I1ZzJPZ0RDT1hDNlhha2VHYmZMeGllb0Rv?=
 =?utf-8?B?WnJEZEZrUnEzelJBRG9LNXhKbCtWeWQ0RkFQbjArNUhmeGkxTVdZTEZpRnNS?=
 =?utf-8?B?MklRbVFhaXB6V1NJNXQzY0oydEFkc01tMk1zVG9zamYxSHU2cENiOVZmc2hu?=
 =?utf-8?B?dUVBUUhySDhZN2RoTldPMjRUck5GVzhzZ0p3Tk5BcFB0SDRFb0NUTmJvZGZT?=
 =?utf-8?B?RkdqSmdBV1FSUjMvK0VxVkRDdklMeTZsYlJzMWFMZWRxZ2pvL0NJcFB6Sm9W?=
 =?utf-8?B?azczVzhlQ2tzU04zb1V3VjhVUUNVWEttTFFMNGVPVDNEOHVnTEFhYXJkQXR1?=
 =?utf-8?B?MlpWaElhSy9zdWJhVW1NZVE3TWJWMmdMbGtRK3FrWjNSTFF1azM0cDdHYk1p?=
 =?utf-8?B?NWVucFV0TC91dE1IcjhlMjhGQzBoTnFtdFFWTkpOVGhSSTJoOVo1NFRWWkZU?=
 =?utf-8?B?WFBsSW1lcE1HNGtCcGpueHJUVGlsTmw1N3R0TXQ0b0thQy93SkZsVWlOcDJw?=
 =?utf-8?B?cjd4SitBbmtqZGJkNTc3ZDMzSmNMQ2hYL2gvc0FMdVZ6TmdZRFlya2xPd0cr?=
 =?utf-8?B?K0s2QnhtcEh1Q2dhYmFNVEh1Mm1SQ0JYeWxpSk1XR1dBNkhyNVJCOW5XQU84?=
 =?utf-8?B?ODRERUVGQ0tBdkNOMjQ4bDJzdW1PeUEyendvbWRGczhCTmg5cjVkWGxBYzds?=
 =?utf-8?B?Mm00aGU1bkMyUWNwakFEbk1VbmI4T1hGcWQzQmVZeW42bDF3UHk5ZXMwZkUw?=
 =?utf-8?B?NWdLMG5GZFZsc28wZHdkYkVLVW93MlJ3K0p3aWQvcldoc3BoaTZlbFNkMGJ5?=
 =?utf-8?B?bUFWSUVNc01TSFVLNFpFNUlWakFVSVhJWTFaMTJtMkdta2lwbU1WU0VHNDJ4?=
 =?utf-8?B?MHR1NUE3cXJtajhlbmZqZ2ViZFVEbUpTd3BiZWF5ZTBzR0gxVExmR3p2Z0cz?=
 =?utf-8?B?OWU2SHViZmxpcGxxUFlRTWNLbStSTWhwNHFPRytTREprQmpDZEpyU2Fndnoz?=
 =?utf-8?B?RjR6ZGdXRndvZ0xid08ybTRBdTZPMkUyYUMwVlFnWFcvbVgwYU05WTdzS25i?=
 =?utf-8?B?WlZyRlZDd0p2M24yeVd5cHk5bUZqSVkxVnA0c0xEWnBZZzI4WjV2UklpaGE0?=
 =?utf-8?B?TGVQYUxKTHlSWFBLdmVFdzFmbmtzdXg4VUdITnZtZHV5NW94Ymw3Qy8rUWw0?=
 =?utf-8?B?d3NRU1RrQUJPRUFCdUZSTUJTeHRXUXdVQ3VNYUZTTzRRWnFmLzBDMmZNZjNM?=
 =?utf-8?Q?2W9E6XICMs5Xi?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SEVVWmExK0MxSkZnZXMwekV1MHM2Y1FITkZGMkJTZUpZMk42RGxTalpGRU9W?=
 =?utf-8?B?SnNLYjNvUmUyOHkxVnFDSXh2cEx3WFdCS3ovTmk0cWF3S21hTjh2RVVhdjJB?=
 =?utf-8?B?V0lKbGE1ZlJKTXltYmhCZWdtcEk5ZEZSUkZBKzhXNmpGWmZjUUdJK1lBa2FJ?=
 =?utf-8?B?RWo4dUNxRDJXdzJUVjQ2UEprODZFT0p4NEViNW5WTmZXM0lDR1BsL2J5Um9B?=
 =?utf-8?B?WkQyODVpM3BlWGhqZnZJYStXamJ0T1VpT0xkSzlZM0ZVdjRNNFhoRGs1aWQy?=
 =?utf-8?B?QUxiSHVUMEhHQjNzVTBvYngxcVZrdDVKQ1ZzS08vRVhoSDJIWGpPUTJTSEFD?=
 =?utf-8?B?NzdYRmZORU9kOVIwaXoxdytpbFB4VDlIa051WWRFNGpQOHoxdVAvYmZ0MklK?=
 =?utf-8?B?eUxleElodkVabzhrVzJoWXowMzhJN3JYWlZwZkpQcGg5VStGS3FZM3BMZkx6?=
 =?utf-8?B?MWRCWFdYdXVaQWFTYXpuQXdXd21FMDkyNjQvSXJYbGJ3YzFJcUVRek5hZGtp?=
 =?utf-8?B?YW9yT3A5NGhWb1NGSi9Uc2RxTlQ4NkEvNC9pQzBPTExoY0pvNWFyS3VwdVAy?=
 =?utf-8?B?aTR0NDFwTGIydnRXaFZIeU11aG1TbGRucVhvS1VJbUJ5TGJxK3pvcmRPZmRp?=
 =?utf-8?B?Y3IvYzBIcFJNUDJkMlZDRVR1eml6ZVB3dEVrK0VDckN1OUNSUGVseGJjV05a?=
 =?utf-8?B?NG9MdlNnL2hyWXBzZEFQSnNvYjMzd3Rnd2pmUHVXeXVYem96ZGIvazhBTTF1?=
 =?utf-8?B?Z1RNNTBkZStrZHNHb0k1cXB1SUdHUDhCTThKQ1ZDQlVtUmJPVnZVMzByNFVj?=
 =?utf-8?B?UFg1LzhJMkxHY2gxU0RCdWpGUjRId0VHTGFuWU9VTmk4MURZeUZjTGg5Q09q?=
 =?utf-8?B?NVZpdE41amlYeXJyMVhnbHNsU0JGMDB1QzUxYzVDL2ZkL2xScjRQNlRwbHk5?=
 =?utf-8?B?U3YrM0V2N1JEVkY1NTROV3FJQkFBZTJFV2RGTXptWkc2bDNSUkZLM3k4RzVD?=
 =?utf-8?B?WE1BUXhvUXNJbVRNNlNQRU1jd1ppaEJYLzdzTHVESjA5c1EyalhUUGJBTjkr?=
 =?utf-8?B?dVpEZEdzTXIwc3I5eDRiUHFjYXNQNnpGZFlJUVI4dzJaNDBmZHVjLzVGOU9j?=
 =?utf-8?B?TkdmT3kxbDhZSEN4aE5PaG5EclNQbWZEUkk4a01UcHFwdHlJMlAxTVV3MzlC?=
 =?utf-8?B?ay9UOVpWRndqMVRxR0NpWVgwMlF0Z2xXamNraktIcmpaelV1YlZvUTB0cWFO?=
 =?utf-8?B?aE40RjNNRkJoUnZiRXozYXpMR1N5OGZqd0hPcmxMMXlRbmNVK2lSSEhlb3JL?=
 =?utf-8?B?d2ZHUDM2VUZKaWZnMnVEdklOVzdyckc1TzdZR2NEOUJERjd1di9QNC9yTUV1?=
 =?utf-8?B?TVh5VjdSWU81cGhZL2ZhWW1aVHlEZ2oxMHFBSnEyaVhkMVd4Qlp1Nk5DRXE5?=
 =?utf-8?B?a2VKQXc1RGwxMUVMWVhFOGNHV3BJVFA3S0ozbHRnUTJTZTRSUnRjRnhnOHN5?=
 =?utf-8?B?SmFEOUwwNGtoOElKdFk0ZXMvRmhJSDVQNDRXSjExZ2Q2a1RaampWNXJrZ3Bs?=
 =?utf-8?B?Sm4zK2FiSTg2enNtcXRubkdGRUVVZnRFQUxidGVoTVhqR1VEL1lkK09udXA1?=
 =?utf-8?B?Q3Y0c2tDMGpOZ1RyU1ovTGFLYlpOQUltSmdEb2w3Wnk1OHVVM2djeC8va2RD?=
 =?utf-8?B?QUdrMWZkcC9mTTRmT2R0cjhqVUQ1cUJQdkRteUMzWDZBWnVQUG5jODl3NVJ2?=
 =?utf-8?B?a2Z1K21hQ0lmTXVENW5HOHFWbTRkMVAxNDcwQUpaWVNFa3JCaDdqMjJ4MFpv?=
 =?utf-8?B?OTRpRzFJN1ZjK0I3Z0trOEl3OWl0dG1QWlhXTzFPSVJyTUJSR2k3U1FrTm9C?=
 =?utf-8?B?OUVLWHFIZGh1MEVLcFBSREpnWVppSkZmbUN5T1FNVjRtYUVPZXV2NXRPOGh2?=
 =?utf-8?B?RjJJancraGFnUmJZblVpSkpSd0kzZDV4TlZpUGdaVTZ6V1dON1poeEpkOUph?=
 =?utf-8?B?RnpZK2hNYlhHcGh5RlNaZWRrNHdkZkdVTGdrSWZBdUdISlJWd3hzSjluK0Jm?=
 =?utf-8?B?b2ZSam9TZERvUEZwWlVzenUwSlk0RlJObGFGa3pmaEtMS2tCWWFhQ2FlenNa?=
 =?utf-8?B?Q1ZySWxNMkIrUlBXMllzaUtvc0x5N2wvNzNQVCtwczdXcGxsRVJuWkRCR3I1?=
 =?utf-8?B?TkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a57ce85-4ef3-487e-25be-08dd33bf910c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 10:46:42.1281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtosWzKeQeSk0wZylys+iGHXvp76HYJANUMaySgU9k5PHN59ANWx2RGMw6JlCPsbXAFHehE9BQfXsCG4V6JGjIhocU1pbqJ+EcUhFG05g53OkYRekaSqu4TBFU770IXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6768
Content-Language: aa
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC828259FA37EA4BA4681CA9E9D81903@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 11:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209710

SGkgU3RldmUsDQoNClRoZSBlcnJvciBkb2Vzbid0IGxvb2sgbGlrZSB0byBiZSByZWxhdGVkIHRv
IG15IHBhdGNoLg0KDQpCUiwNCg0KDQpPbiAxMi8wMS8yMDI1IDE1OjIzLCBTdGV2ZSBTYWtvbWFu
IHdyb3RlOg0KPiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHN0ZXZlQHNha29tYW4u
Y29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5B
Ym91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gVGhpcyBlbWFpbCBpcyBub3QgZnJvbSBI
ZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUgY2FyZWZ1bCB3aGlsZSBj
bGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcgdG8gdGhpcyBl
bWFpbC4NCj4NCj4NCj4gVGhpcyBpcyBjYXVzaW5nIGZhaWx1cmVzIGluIGF1dG9idWlsZGVyIHRl
c3Rpbmc6DQo+DQo+IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFp
bHMvODQwMDI3Lw0KPg0KPiBJbiBwYXJ0aWN1bGFyOg0KPg0KPiBybTogY2Fubm90IHJlbW92ZQ0K
PiAnVE9QRElSL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8v
MS4wL3Rlc3RpbWFnZS1zZGsvc3lzcm9vdHMvY29yZTItNjQtcG9reS1saW51eC9ldGMvYmx1ZXRv
b3RoL2lucHV0LmNvbmYnOg0KPiBQZXJtaXNzaW9uIGRlbmllZA0KPiBybTogY2Fubm90IHJlbW92
ZQ0KPiAnVE9QRElSL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNh
dG8vMS4wL3Rlc3RpbWFnZS1zZGsvc3lzcm9vdHMvY29yZTItNjQtcG9reS1saW51eC9ldGMvYmx1
ZXRvb3RoL25ldHdvcmsuY29uZic6DQo+IFBlcm1pc3Npb24gZGVuaWVkDQo+IHJtOiBjYW5ub3Qg
cmVtb3ZlDQo+ICdUT1BESVIvdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1h
Z2Utc2F0by8xLjAvdGVzdGltYWdlLXNkay9zeXNyb290cy9jb3JlMi02NC1wb2t5LWxpbnV4L2V0
Yy9ibHVldG9vdGgvbWFpbi5jb25mJzoNCj4gUGVybWlzc2lvbiBkZW5pZWQNCj4NCj4gU3RldmUN
Cj4NCj4gT24gV2VkLCBKYW4gOCwgMjAyNSBhdCAzOjA54oCvQU0gQ2F0YWxpbiBQb3Blc2N1IHZp
YQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxjYXRhbGluLnBvcGVzY3U9bGVpY2EtZ2Vv
c3lzdGVtcy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+PiBDb21taXQgNDkz
OTFmZGNmNzFiMzJjNWZkM2M3YjEzNGMxZDFjNDVjYzFkYjM4OCByZW1vdmVkIHRoZSBzaGlwcGlu
ZyBvZg0KPj4gY29uZmlndXJhdGlvbiBmaWxlcyBmcm9tIGluc3RhbGwgdGFzayB0b28gZWFybHku
IFRoZSBjb25maWd1cmF0aW9uIGZpbGVzDQo+PiBzaGlwcGluZyBoYXMgYmVlbiBhZGRlZCB0byBi
bHVlejUgNS43MyB3aGVyZWFzIHNjYXJ0aGdhcCBpcyBvbiBvbGRlcg0KPj4gdmVyc2lvbiA1Ljcy
LiBUbyBhZGRyZXNzIHRoaXMgaXNzdWUgYmFja3BvcnQgdGhlIHBhdGNoIGZyb20gNS43MyB0byA1
LjcyDQo+PiBhbmQgYWRkIGl0IHRvIHRoZSBibHVlejUgcmVjaXBlLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IENhdGFsaW4gUG9wZXNjdSA8Y2F0YWxpbi5wb3Blc2N1QGxlaWNhLWdlb3N5c3RlbXMu
Y29tPg0KPj4gLS0tDQo+PiAgIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6
NS5pbmMgICB8ICAxICsNCj4+ICAgLi4ubC1jb25maWctZmlsZXMtd2l0aC1lbmFibGUtZGF0YWZp
bGVzLnBhdGNoIHwgNjEgKysrKysrKysrKysrKysrKysrKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDYyIGluc2VydGlvbnMoKykNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLWJ1aWxkLXNoaXAtYWxsLWNvbmZpZy1maWxl
cy13aXRoLWVuYWJsZS1kYXRhZmlsZXMucGF0Y2gNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LmluYyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMNCj4+IGluZGV4IDNmMmYwOTZhYWMuLmQ3MjgzZmJh
MDAgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVl
ejUuaW5jDQo+PiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUu
aW5jDQo+PiBAQCAtNTQsNiArNTQsNyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0v
bGludXgvYmx1ZXRvb3RoL2JsdWV6LSR7UFZ9LnRhci54eiBcDQo+PiAgICAgICAgICAgICAgJHtA
YmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgJycsICdmaWxl
Oi8vMDAwMS1BbGxvdy11c2luZy1vYmV4ZC13aXRob3V0LXN5c3RlbWQtaW4tdGhlLXVzZXItc2Vz
c2lvLnBhdGNoJywgZCl9IFwNCj4+ICAgICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1hZGQt
YS10YXJnZXQtZm9yLWJ1aWxkaW5nLXRlc3RzLXdpdGhvdXQtcnVubmluLnBhdGNoIFwNCj4+ICAg
ICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0LWdhdHQtRml4LWh1bmctaXNzdWUucGF0Y2ggXA0K
Pj4gKyAgICAgICAgICAgZmlsZTovLzAwMDEtYnVpbGQtc2hpcC1hbGwtY29uZmlnLWZpbGVzLXdp
dGgtZW5hYmxlLWRhdGFmaWxlcy5wYXRjaCBcDQo+PiAgICAgICAgICAgICAgIg0KPj4gICBTID0g
IiR7V09SS0RJUn0vYmx1ZXotJHtQVn0iDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS8wMDAxLWJ1aWxkLXNoaXAtYWxsLWNvbmZpZy1m
aWxlcy13aXRoLWVuYWJsZS1kYXRhZmlsZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JsdWV6NS9ibHVlejUvMDAwMS1idWlsZC1zaGlwLWFsbC1jb25maWctZmlsZXMtd2l0aC1l
bmFibGUtZGF0YWZpbGVzLnBhdGNoDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXgg
MDAwMDAwMDAwMC4uNmUxMDY3NGJmOQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LzAwMDEtYnVpbGQtc2hpcC1hbGwtY29u
ZmlnLWZpbGVzLXdpdGgtZW5hYmxlLWRhdGFmaWxlcy5wYXRjaA0KPj4gQEAgLTAsMCArMSw2MSBA
QA0KPj4gK0Zyb20gYmUwZTc5NjI5OWIwZTdhNzNiZjA2YzU2NTViNTYxODA1ODg1NTBiMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+ICtGcm9tOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPg0KPj4gK0RhdGU6IE1vbiwgMTIgRmViIDIwMjQgMjA6MDI6NDQgKzAw
MDANCj4+ICtTdWJqZWN0OiBbUEFUQ0hdIGJ1aWxkOiBzaGlwIGFsbCBjb25maWcgZmlsZXMgd2l0
aCAtLWVuYWJsZS1kYXRhZmlsZXMNCj4+ICsNCj4+ICtDdXJyZW50bHkgd2Ugc2hpcCBvbmx5IHRo
ZSBkYnVzL3N5c3RlbWQgcG9saWN5IGZpbGVzIGFuZCBvbWl0IHRoZSBvdGhlcg0KPj4gK2ZvdXIg
LSAvZXRjL2JsdWV0b290aC97bWFpbixtZXNoLW1haW4saW5wdXQsbmV0d29ya30uY29uZi4NCj4+
ICsNCj4+ICtPdXRzaWRlIG9mIHRob3NlIGZpbGVzLCB0aGVyZSBpcyBubyBkb2N1bWVudGF0aW9u
IHdoYXQgdGhlIGRlZmF1bHRzIGFyZQ0KPj4gK2FuZCB0aGUgb3RoZXIgcG9zc2libGUgb3B0aW9u
cy4gQSBudW1iZXIgb2YgZGlzdHJpYnV0aW9ucyAoQXJjaCwgR2VudG9vLA0KPj4gK0ZlZG9yYSkg
aGF2ZSBvcHRlZCB0byBtYW51YWxseSBjb3B5IHRob3NlIGludG8gdGhlIHBhY2thZ2UuIEFsYXMg
dGhpcw0KPj4gK2RvZXMgbm90IHNjYWxlIGFuZCBsZWF2ZXMgb3RoZXIgZGlzdHJvcyBhdCBkaXNh
ZHZhbnRhZ2UsIGluIGEgc2Vuc2UuDQo+PiArDQo+PiArTm90ZTogd2UgbmVlZCBhIGN1c3RvbSBp
bnN0YWxsIHRhcmdldCB0byBlbnN1cmUgY29uZmRpciBhbmQgc3RhdGVkaXINCj4+ICtoYXZlIHRo
ZSBjb3JyZWN0IHBlcm1pc3Npb25zLg0KPj4gKw0KPj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQgWzUuNzNdDQo+PiArU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4NCj4+ICstLS0NCj4+ICsgTWFrZWZpbGUuYW0gICB8IDggKysrKysrKy0N
Cj4+ICsgTWFrZWZpbGUubWVzaCB8IDEgKw0KPj4gKyAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gKw0KPj4gK2RpZmYgLS1naXQgYS9NYWtlZmlsZS5h
bSBiL01ha2VmaWxlLmFtDQo+PiAraW5kZXggMmIxYjlhY2RmLi4yY2JmZWQyZGIgMTAwNjQ0DQo+
PiArLS0tIGEvTWFrZWZpbGUuYW0NCj4+ICsrKysgYi9NYWtlZmlsZS5hbQ0KPj4gK0BAIC0zMSwx
MSArMzEsMTcgQEAgQU1fTERGTEFHUyA9ICQoTUlTQ19MREZMQUdTKQ0KPj4gKyBjb25mZGlyID0g
JChzeXNjb25mZGlyKS9ibHVldG9vdGgNCj4+ICsgc3RhdGVkaXIgPSAkKGxvY2Fsc3RhdGVkaXIp
L2xpYi9ibHVldG9vdGgNCj4+ICsNCj4+ICsraW5zdGFsbC1kYXRhLWhvb2s6DQo+PiArKyAgICAg
IGluc3RhbGwgLWRtNTU1ICQoREVTVERJUikkKGNvbmZkaXIpDQo+PiArKyAgICAgIGluc3RhbGwg
LWRtNzAwICQoREVTVERJUikkKHN0YXRlZGlyKQ0KPj4gKysNCj4+ICsgaWYgREFUQUZJTEVTDQo+
PiArIGRidXNkaXIgPSAkKERCVVNfQ09ORkRJUikvZGJ1cy0xL3N5c3RlbS5kDQo+PiArIGRidXNf
REFUQSA9IHNyYy9ibHVldG9vdGguY29uZg0KPj4gKw0KPj4gKy1jb25mX0RBVEEgPQ0KPj4gKytj
b25mX0RBVEEgPSBzcmMvbWFpbi5jb25mDQo+PiArK2NvbmZfREFUQSArPSBwcm9maWxlcy9pbnB1
dC9pbnB1dC5jb25mDQo+PiArK2NvbmZfREFUQSArPSBwcm9maWxlcy9uZXR3b3JrL25ldHdvcmsu
Y29uZg0KPj4gKyBzdGF0ZV9EQVRBID0NCj4+ICsgZW5kaWYNCj4+ICsNCj4+ICtkaWZmIC0tZ2l0
IGEvTWFrZWZpbGUubWVzaCBiL01ha2VmaWxlLm1lc2gNCj4+ICtpbmRleCBlYTUwMzgzZDIuLmU0
YzlmYTZhMyAxMDA2NDQNCj4+ICstLS0gYS9NYWtlZmlsZS5tZXNoDQo+PiArKysrIGIvTWFrZWZp
bGUubWVzaA0KPj4gK0BAIC0zLDYgKzMsNyBAQCBpZiBNRVNIDQo+PiArDQo+PiArIGlmIERBVEFG
SUxFUw0KPj4gKyBkYnVzX0RBVEEgKz0gbWVzaC9ibHVldG9vdGgtbWVzaC5jb25mDQo+PiArK2Nv
bmZfREFUQSArPSBtZXNoL21lc2gtbWFpbi5jb25mDQo+PiArIGVuZGlmDQo+PiArDQo+PiArIGlm
IFNZU1RFTUQNCj4+ICstLQ0KPj4gKzIuMzQuMQ0KPj4gKw0KPj4NCj4+IGJhc2UtY29tbWl0OiAw
MTQyMzgyODI0OGI3NWUxZjVhZmUyZTU5NTljY2Q5NzFkZjg3NWNkDQo+PiAtLQ0KPj4gMi4zNC4x
DQo+Pg0KPj4NCj4+IA0KPj4NCg0K

