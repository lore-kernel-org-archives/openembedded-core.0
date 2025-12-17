Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D114D64098
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 08:57:15 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10064.1765961825581793629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 00:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=ZQlqqE/W;
 spf=pass (domain: phytec.de, ip: 40.107.162.131, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLYunjwYz3e7/gNotE2AbDw/xA6Yfp980ZQsk2LPtJYaKwEMHoWT4J0Tod91tdorRMH1FHEDyhdInZ8zdGSuYtYhEy0mUDyaPA5yyD8yVpWJgbY/Aiw6yEZwR+mP2+a7INcEImUa6OqxijjTVdeJh6Qmt16bmh6wlaXKu+0INN24jvCYKPegCVuiKvXQXE/3oK/OQ9w0rQteNFhbP0sAtKDH1n9R/uUg7fjduhGeZxNgJJJkcuESDgCTxFacFmMN+plylsOWRAOfpFf5557X5c4Gl5SnkAqgpZWXXfepnUog1m7GwK1I7cBRpA5qM+cV2xM7U6Siu8TnlRbAzFyMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsKlsw9sq4G2wiBmV2v056zzR3gMZu8N9047qLfPfFI=;
 b=lmjXWZeM4wEGwEi3AfaHmSWhFgnu+wYqPV9xWWsAINHtcJuBcnEpo4Ojq+X+XYciJ9F/sGXDdRy1XjIfyHPevu2vze3oGyVd35A+83b27JgoAGEt8s+XRX2bf5SGMButIZjPgSDTPJS/MesXV+tgk12dbCG0y1icRBR9pVc6Fmbkp83my1NOU34UnIsu0lnZUppXRVJOzkVK2nYCQUmscr/Yy9AP7R1EbD7+EX1cg5p8mzol9YOSE6Qh+9n8kIr+zzd2p0kRMcwYMtvbpLb72ZOoDZ6K5V0S3IKDM/EPbyUVRBiIHJsYNWHakx0B9HgOOFKeVGv3ZULpJC9JRa08xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsKlsw9sq4G2wiBmV2v056zzR3gMZu8N9047qLfPfFI=;
 b=ZQlqqE/Wyorim+rzBlY/I+OlMjb4q0dzxCgkKb7G/kTjzhzz3QBit78yEF1eFv06T5Mo8AvEdMA3n+ffN8OlTTcFhWyNCxsfzVcl9Ne9iDx3285eKOGAysxucaGFhn0S7jHERxu3BWOKWwLoH08BzzRwzU8VtRBCQPDxCNroBdvJo+ACQm4XuYlMD0aKUpwoZVCFgR7+k1oloc9HHUOn2MsJNOGI2G9HudEKGOYpuPJjEn3kKG0XdGvcmvFoRrPO9xdbCLhiSdjh5t77wI/+eSdLX9BWX0Z8rE3srU6uon7WdyRFtdkDfzTPEtslD58fdE8s5pib+7AwIrW1PZ5Fbw==
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::12)
 by DB9P195MB1681.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 08:57:00 +0000
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582]) by VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 08:57:00 +0000
From: Martin Schwan <M.Schwan@phytec.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
Thread-Topic: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
Thread-Index: AQHca3faro8arn/mtEStyolGWLWsy7Ulj0SA
Date: Wed, 17 Dec 2025 08:57:00 +0000
Message-ID: <7a5b8633ba244eb5be8cc14d4133cb271989d6f4.camel@phytec.de>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
	 <CANNYZj9L7B0tO-qORtFM+2GXLXn2s6YOYo_P9Q3bnfSSBoWQ=A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9L7B0tO-qORtFM+2GXLXn2s6YOYo_P9Q3bnfSSBoWQ=A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2489:EE_|DB9P195MB1681:EE_
x-ms-office365-filtering-correlation-id: c292f017-a37e-44f7-7bec-08de3d4a3dbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dmdzZ2VOR1hZclY5bFQxZENXamlNNkJvYTNrcHYwb2U1bTFyN3lEaDRKamxH?=
 =?utf-8?B?bnhBK2l6alU0b2dhR09hZFVrcFhHbGdrbnFWV2U2eFZueFVrZDgrMDhVZldw?=
 =?utf-8?B?ajFFaTN1Y0RpTGZLaXdwamg1YVN2aUNQQjZrUXhLZkJ0d2s0cjZTV3FYenZw?=
 =?utf-8?B?NWI2U0QzMlBPWTdQVlZLY2pEaWxCMkRNS3RRUTF4dmxMOGh3a0g3Y21EZlds?=
 =?utf-8?B?cCs1elphSkhPSnFGRHRkdTdkdW1xVUxOQzV0UlRTektteWUrZG1BRWthakt6?=
 =?utf-8?B?YStwNVY5Y0RybGhiMk40dVNRQVFER25nbVJPaG5VeXQ3b1JDTkhvbkI3WUVQ?=
 =?utf-8?B?NmxBemJYTlh2WkNJRnR5Q01BNmJLazVWdmF4RUZDRktQaWsxTGxzU2phY25R?=
 =?utf-8?B?YTJJV0ZEc3UyRHRxNGZmSmZ2K2hsWi9FRWJOemw2MmpnSnBRUVFoZmJmd3Vv?=
 =?utf-8?B?VW9uR0tnUkJaa29vUTcwNkNXWGQwUFJubU9JY0hNZUQyOEdzbFJJTTN1YVh2?=
 =?utf-8?B?MDBxV1RITmxMc1hOSG5DQmYrSHJGMlN5Y3dPNVp6dmJYdFg5Y2hPTUU1eUh3?=
 =?utf-8?B?MFhGc0tLbEFnUFdJNFBPU01WNU5XN095LzFVaFFwUU4zRWwyREF6cHl6SWNQ?=
 =?utf-8?B?Y25BaDlCTllUSDAzQkJ6dEZjWnNpeEgwWGlURHFVZzVrYkN2dCs5MVpyN2FI?=
 =?utf-8?B?d0V6SDdIdE51d0pzMVd4RHNXRjBOZ20vMlFVSnZWRDQ3YWtObGF2NkdkS0Jt?=
 =?utf-8?B?eXJ1WDk5Q3JqY3lMRlFScDJtRjJhd1loRzVyNTJwUkw5WTBlM0JRSXorV1d6?=
 =?utf-8?B?UDlwYS9TeHRRMGxkWUNzNVJvN3AyaHpCcGdZMWRsZGpJWTZlMFcxZUE5UzZF?=
 =?utf-8?B?M0pjVW90SW9rOGNlY05iMVZGdS8zUzNaMjBXbjRZV1FmeEVYaHJGamdoL2Rm?=
 =?utf-8?B?dHhiYW5GRzhiVTVsU0xmQXlwZlA5VTdlWHBQSngwT3d4TGFOcFp3Yzd4SG9W?=
 =?utf-8?B?WEhyclNKcUdYSm9PYythYk5JYlJPRUtsaUhrM0pTcHNxNFJCbUxTUG53UlZT?=
 =?utf-8?B?Ui8vbERWWTdwV2Rxa0o2ejFrak9JYWpWTXY2MlpzOHRFRmFUQlRHTWxJNDht?=
 =?utf-8?B?L1RhRDZFbS9oMndQNkFwQndaa3VtVU9wZCtIL2lvZ0pZTCs2KzZXa244c1Qw?=
 =?utf-8?B?Z0FQdjhPS2JoZmh5OXhlNWFOU1IxMXhhMUtLMi9TWFhhK2UrMlFYVUF0Nno1?=
 =?utf-8?B?d0IwMlZ0R1FYVmhYdHdZSXZLUWxhOTlEUnZ5eHR1SFA4SWc2SS9KWG5Pakx1?=
 =?utf-8?B?RHNUdmp3eElESzNUeC9HZzdVazAvOGgyQlFKdjB3Z1YyalVKOU14dWFKSGI2?=
 =?utf-8?B?RnAyeVNtNmtkMnVjMlZ0VXdOWkR1d2cwbXBaZ1pRQTZrSEpBNjZPcTl2bzNF?=
 =?utf-8?B?WkhUenlvZFVrYkphSTQ1Wll5M0twb3A5b2RYdVVvdUZFek5sTTFXNldYYjEy?=
 =?utf-8?B?TkoveFpTUHN2VXV2Y29BOVo1NjBLKzFEcVBkWTFNWlloMkV6TFJ1cjlCSS9p?=
 =?utf-8?B?VnhoN1ErZi8xb3cvdlNGRW1pbUxwYkcyclpWTW8zK0hvYnMwNkxMMXZmSWtY?=
 =?utf-8?B?N084WE03S3VSdGdLTmsyRTUrU0JiUkVyNzJuOE94bnVlTEFoajFDR3lCbVlO?=
 =?utf-8?B?MW1KNW5MTDZjeGdOU1VMOFVJN0ZSRE1yZnJwcVhNMlV3QVlsN09leWVodzRL?=
 =?utf-8?B?MWxuMTVtcTlsbGRmeEZpM1FTS1ZkRUpDazZJbGxpY1VmOE5hbTkxcGJKSUhE?=
 =?utf-8?B?ekZOVjhDTmRFblBMb2lrV0xoOHprN0QxUDhCSkZWTXRIeDFWZ1diU1Z0QmEy?=
 =?utf-8?B?dzBJL3JHTFRWZklnWngvMlpDK0ROMEpXKzJiOHJFb1kweWw2NEN1WCtJNnlE?=
 =?utf-8?B?aWVRRTF5d0FvS0VrUjI5RThobmE5MnVwR1d0enJ0TTlOT204STlBTmRXbXpm?=
 =?utf-8?B?QVprbmN3NmRneXMwSGpyOElJVkkySmhBa2NDRmJDeC92Qm92KzZ1SHpoTS9U?=
 =?utf-8?Q?vi5LBW?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2489.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zlk1aHNVTUJPbk5GQ0UzS1JCSXZPNTlBZ0wydG9XMWhYZWRac0pUVm1CMW82?=
 =?utf-8?B?QjZneWNGYU03TkhrQW5RV2ZwcG1Kc2p5c1RmWTJtbmRXN0hUS2IraHZhSFF0?=
 =?utf-8?B?WjZGTDZoaW8zTjlJWnkvaXVNMm84a2IwbCtrZmlwcWJyTHJUWWxuSkdnMTJ2?=
 =?utf-8?B?Mjh6aVFmc3FIVnk4NktMVFNHdHA1YkJ6ZzN5clN6WWNjaGVGOTZGcmg5T1Uz?=
 =?utf-8?B?WjB5aTlGMlZQOC9GWGlRUUJpNXp3cGx0alVpOEdDNGIxUnhvdm53T29mSkNz?=
 =?utf-8?B?bHlXNWQ0c0J4QkR0TmRHcVV1alBzY3lRWjRGd2JVcm9nUURUWUdrMzJtSjVn?=
 =?utf-8?B?bkRQQ0MrR2E4TU9vaE9wd05SNzRscUtVOUFISWxqMzFpR0drcDFaVlo2YUlW?=
 =?utf-8?B?YXh4anVaNmhqL2ovVEVsMlJHeHB5SzZUaXBIOEp6QmpuczlqbVRRT1o2WWJ1?=
 =?utf-8?B?em1ac2RyTVJiZkFnZmEyeFhSTm96b0xjTHZVQWhWQ2RjbFA0eVY1YXNDRWNo?=
 =?utf-8?B?Z3dCQ1phYThseERjTFZLT0tUVzBvNmhwUzVDK3VuSytrYmUvVW84Wkc0eEpV?=
 =?utf-8?B?K3FWL2RwekVtQStSc213VGR1YTdmVEx4RHp5TlBIVHVWczNTSlU3WjhNN1pD?=
 =?utf-8?B?TEdUL0dkRjF3VG1MM3lIVmxVSW9mblBjTWYzbWIva0FvZ0hBQ1JoS1pqcTJU?=
 =?utf-8?B?OFBZMzFPbm12UE1aWnd2Q3dqVDQvYzdMcDdKL3JIcDFqTXU4bkdsZ0U3SjR5?=
 =?utf-8?B?SUdaRHp0dlpTelV5dGVyaXd3TWhPTnNHOXRLNXduQWo0K3g3SXB4Nmh6dElu?=
 =?utf-8?B?dE1teSt4dTNINFJnYktMajQ4NzMvZExMdU1vUnhBZW51b0JQWHdpcFgraXFS?=
 =?utf-8?B?dUo3T2Q5aXFGK0g3SnZnTGttOHVGelM4dmdGeUpSMHJrd0dDMDlNV1Zvcm1W?=
 =?utf-8?B?TFpsNWpvTG5wNFpyUmIzU2xhTU9OME50Ly9lMmFYZlE5NTlETTZjbk9pZ20x?=
 =?utf-8?B?eWd6SmZpMUFCVE5oVW44NXVCRElIcjd4aVBieXNWQXNGRHFWR3haeS9NZk1q?=
 =?utf-8?B?UThiTENJVHMxRE1KVzFuc2lZWU14akgzcStXeS9iWXNjSVpkRXhIWmwzSkd6?=
 =?utf-8?B?cHltYzlOM2k1Uk9qQnFUK2c1VW9mOURFcEZqWkpFQVV4S21GaG45ckNIUGhG?=
 =?utf-8?B?K2hHQ0RtTkQ2RWpYcWMyY3dkUXBwSGVueEpGMkc0N2dUTHdNT1M1WjhIRGJJ?=
 =?utf-8?B?R28ralhzRU9wWWZyUGxZWkdKR1VtQTJpNTdiTExnbCtnV2d2NTk0THoyTjZK?=
 =?utf-8?B?eHJFK0VRZHQ2Vmlzc0F2THRnWSs4aEFyTmRTQUFrZDBwNlFHVmdXTE1Fd2NF?=
 =?utf-8?B?V0RBVDVERHZRS1czN1ljNDF4OVNqb1VtcHBXMTRLN2NBZFd5Q083T05nZWhS?=
 =?utf-8?B?cW90Z0JuTklIeFUvOUEwM1hJTFNFL0o5ZWIxQmViWHY5d2ZlNnBjQlJCL3NP?=
 =?utf-8?B?NHYxRDhHRDQxN2Jic3dOTkEzTWxTRlZ5cllZNnNoUmhhbDZIWEd3Y3A3TGFw?=
 =?utf-8?B?Q3FkOENoZGxNL3JHN3pMTjZ2czE4ZjZhbHV2VW9kNkduR1Vsck5kRmM4TlZy?=
 =?utf-8?B?OGJQS0ZSai9PeUVFNU5GTVdtK0FoYVJLd2lQUTF5M3ZOdXJna3I0d1c4MVYx?=
 =?utf-8?B?a3M0a3V2eFNRMC9LVER3SUhVK1Bjb1QwRXFqdzRTREZOUTU3VHd3ZmFZZkJY?=
 =?utf-8?B?VldGMmM5WGZxYU01TGdBL0M2ZWpnWWU0NWE5cFN4S2xkbVlibGhPSzJwM2xB?=
 =?utf-8?B?UERiSURYL1lrVjdCMHlSR3VPQllqM2lQdk5vOW05WmtDMjNWRWJkMnBvOEtT?=
 =?utf-8?B?am5ZNE5wMytuL3VMdlpkOURIcU5wb0JjYThFVGprTzcxZGc4N25GMjF2TDJh?=
 =?utf-8?B?SWsvZlp1UGc3eDZSOXRQUnZ4THZtcEU2ZW5vQnVGUGxmaUVJK0M4a043STFO?=
 =?utf-8?B?OU4rWEEyYW5xV3NWOTlTdEMzTXpTTVVaMkdBQi9IcnJRZGRUNE1rL3lWMWZs?=
 =?utf-8?B?cjdVZFM2VE1PSVh6eXBQVDA5emlBa3RkNXh0NWV4MzI3dkpPYzhDNmVWY0N1?=
 =?utf-8?Q?5ziSF48rGARhjBDS3r8JJAM90?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3B334E660180D41AD2C6980934F3BD7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c292f017-a37e-44f7-7bec-08de3d4a3dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 08:57:00.2681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPpQSQzGrYwVtfLpBsAC4iVEKzrDL7CAivppbrcA+BXcXpUGsYTdCezb3dhgD/0Eu8Kwri0aEhQA1Bav0539EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228008

T24gRnJpLCAyMDI1LTEyLTEyIGF0IDE1OjU4ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToKPiBPbiBGcmksIDEyIERlYyAyMDI1IGF0IDEwOjE5LCBNYXJ0aW4gU2Nod2FuIHZpYQo+IGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcKPiA8bS5zY2h3YW49cGh5dGVjLmRlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOgo+ID4gK3B5dGhvbiBkb191cGRhdGVfY3JhdGVzKCkgewo+ID4gK8Kg
wqDCoCBpbXBvcnQgdG9tbGxpYgo+IAo+IFNhZGx5IHRoaXMgaXMgYSBwcm9ibGVtIHJpZ2h0IGhl
cmUuCj4gCj4gdG9tbGxpYiBpcyBhdmFpbGFibGUgc2luY2UgcHl0aG9uIDMuMTEsIGFuZCB0aGUg
bWluaW11bSBweXRob24KPiByZXF1aXJlbWVudCBmb3Igb2UtY29yZSBpcyAzLjksIGFzIHNlZW4g
aW4gc2FuaXR5LmJiY2xhc3MuCgpPa2F5LCB1bmRlcnN0b29kLgoKQXJlIHRoZXJlIGFueSBwbGFu
cyB0byBtb3ZlIHRvIFB5dGhvbiAzLjExPyBQeXRob24gMy45IGlzIG5vdyBhdCBpdHMKRU9MIGZv
ciBzb21lIG1vbnRocy4gSSBkb24ndCB3YW50IHRvIG9wZW4gYSBjYW4gb2Ygd29ybXMsIGJ1dCBq
dXN0IGxpa2UKdG8gdW5kZXJzdGFuZCB0aGUgZnV0dXJlL2ludGVudGlvbnMgaW4gdGhpcyByZWdh
cmQuCgo+IFlvY3RvIENJCj4gYnVpbGRzIGFyZSBleGVjdXRlZCBvbiBvbGRlciBkaXN0aWJ1dGlv
bnMgdG8gY2hlY2sgdGhhdCBkZXBlbmRlbmNpZXMKPiBvbiBuZXdlciBweXRob24gZmVhdHVyZXMg
ZG8gbm90IGNyZWVwIGluLiBJIHN1c3BlY3QgdGhpcyBpcyB3aHkgdGhpcwo+IHdhcyBhbmQgc3Rp
bGwgc2hvdWxkIGJlIHBpcGVkIGludG8gcHl0aG9uMy1uYXRpdmUsIHNpbmNlIHRoYXQgaXMKPiBw
cm92aWRlZCBmcm9tIGEgcmVjaXBlIGluIG9lLWNvcmUuCgpBbHJpZ2h0LCBJJ2xsIHJldmVydCB0
aGF0IHRoaW5nIGJhY2sgdGhlbiBhbmQgcGlwZSBpdCB0byBweXRob24zLW5hdGl2ZQphZ2Fpbi4K
Ck1hcnRpbgoKPiAKPiBBbGV4Cg==

