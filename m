Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35445C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 11:38:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.51])
 by mx.groups.io with SMTP id smtpd.web11.34932.1699875521630512974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 03:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=A7+y87RF;
 spf=pass (domain: welotec.com, ip: 40.107.104.51, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0Bv+oD221pHtFfN2VFRMqiL/K6BW4DQDI0m8nC4gvR3ZifAZEMbZtIAyCqo0eUNLiMxocwKNHJzFxGkDqpYEQ8IL9e4JV1ZM7X+36tOWcqquJe9V80M/kroojjsfl4pwEZ/uuMgAWwfZiGPXQy7Dj0CoZWa8xzAQU5HlaOxtSIwvfRxnS0FvydXyvxjKVJdHPS9m9pjXbljK3z+u/naUibee9uT/Fo8llgy+Gq8FL/yI4VmKqTFFLc7qHF9E77bicHjks81rrc9rxP0gq01HBnqf76+Tc117m/k+eniOYl1dCIVw02voGPEW5JGacY945AJKMY5+AxADtI15awmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqFRHOobub47ElzSNnfEjHP6ONQDk0/v7vzc36WPMhI=;
 b=FphEa9ElrxLdSJBeV771CenvZwBS3ukxqXqcET7Pa1XcqARZkjt1sJKajqa8h/YxU8i8PSGDWUjEfDDZ1oq2AsyBYreE1E/b+1N88cD45MV7mAEl4IgFbwAe5P0aGt5kp6Z3o6QOsUDXqfH+/jI+cgvY4vQO8sOjQshuj+ZXKlBxax6/G35NEW1nnM3CTwCE2JMc0xSQfyt9cXkEHddFcu9E6Ni5vvIbmDwa8Vsn22IbRMhQQo4hMJua8EQgMXtLdc7kRw/RZ+9V2UPB+E14kl//e0+LClk8fwAlqceFhwUYd5KrVp5AQ729EtXxp0t+oyjo+lQ3UrW/vxfHSqxASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqFRHOobub47ElzSNnfEjHP6ONQDk0/v7vzc36WPMhI=;
 b=A7+y87RF+5GWKCUcOFFIgUQPjHPPWfGqiZJnlPiUDurcAkPQlBehXGELkhJHZjhmPCrWtudgI3VW5PkdwMK5gD78nclThaejAgsqheqF0CJC2fkRFJGzRHb99ZWtAKojj/YeklHVcvPyOLEOknaTIernu7juBOkYzKPJipFITyQX213jdjI9tNr8anocZrJocRHIs8ZJ3V/g5TY3ja2EnmASEt7WRMiVeBOef5qtW5MBcxXH8qmQiIxAbKL3QyQKyUse4OGtOMsPD+B8gROtNj+u31TajvbsfIHnZF30LoZCAu5vEQ+RBAOqOgR6ragK8MHEGUvxgtNR4NL1jSGYgA==
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 11:38:38 +0000
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906]) by DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906%6]) with mapi id 15.20.7002.014; Mon, 13 Nov 2023
 11:38:38 +0000
From: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt
 file
Thread-Topic: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt
 file
Thread-Index: AQHaFA1aEL34UFPxXEilBMSzHZ5gPrB4It+AgAAA54A=
Date: Mon, 13 Nov 2023 11:38:37 +0000
Message-ID: <3259483.aeNJFYEL58@latitude>
References: <20231110193716.2198635-1-p.lobacz@welotec.com>
 <238464863e9bdea94b8773983a8e79df07c30607.camel@linuxfoundation.org>
In-Reply-To: 
 <238464863e9bdea94b8773983a8e79df07c30607.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6475:EE_|DBAPR04MB7317:EE_
x-ms-office365-filtering-correlation-id: bde11bfa-98ec-492c-2d8a-08dbe43d13d6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Hb2pTSz6b9a0Otwt3izBTj4iRXFj/hS10XkLJviKDbTToaE2vR02HUvdOAfuby5RkQngGa+8KFKt6pOLXEV6os5KnU+gKNf2kksw78KHpqLr9pRg7Pw71fhbIv2GcRvb5TBIhOOI8sJCKYNjy8XMPgCs/D9f4iQN/vtpMfg3lGIi94HfFjcnPFl2VDCEj7nahjzQzj6xCDBmGNePLkzFnOqSH+YngrtSWtrDShwb63L8evgCrf9VaTrqtQnxJ0jAPZeMagMGwCiPbzs4eh5BpniIrxdqYHa0kcooNzVAaO79dojOW+PgBvteLwuTyiQdRR8rNckwna06jiJYekQcQTOAuOZ0hKuaV8Wv1Dh4kRoEen8mVxHlFJdHFx/qpvAEHzpCh4Y65TWQldfIjrRw0qijoqjcZWv9HNC2raNYKou11yRAmJDZiYENIc1zKYjDuQqeRWmYK0j3O60u1lVITz46ri8p3HrVCVHNta1rRsNEUitPStPuVOfe5QOGpEhmLcOnimn0r8H42/cbnCTj0eVep+Qdj9ethtN4e4VJWBgEAlxjU4pb2SvXFjYiYZ1bYPtIT+aXgQlhCtojsmDKekdJRPA2Xr8oXpl5Vbuto0bcqa5x9ON9gAMT6accWgpg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(366004)(396003)(39830400003)(346002)(451199024)(186009)(1800799009)(64100799003)(9686003)(6512007)(478600001)(6486002)(71200400001)(6506007)(38100700002)(85182001)(85202003)(122000001)(86362001)(5660300002)(33716001)(4001150100001)(66446008)(66556008)(2906002)(66946007)(66476007)(64756008)(41300700001)(83380400001)(26005)(38070700009)(91956017)(76116006)(110136005)(316002)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V1hZZ3FZTDVqRVZiNGhIeVpXUzM2Q0xyN2wyVWplTU9BMjhYU0tpekZiWlpk?=
 =?utf-8?B?Y1cwM1dqM21FZHJiUWt0cENpSXN1UjdZNEFMSFB3bzNEQU1wc29HL1FLeUt2?=
 =?utf-8?B?OGR0Nkh4MGhtdncyZDc5a0N3KzV6K2UwK2cyVVhvUTJ0QnJVSUhlRE5rZjU3?=
 =?utf-8?B?NVkvbVpaVGdUZDFVQXVGcWRuTDlnalFFWkZqTUorRi9oN3lTUll0WWszWVhu?=
 =?utf-8?B?S01ZWVUvVXZBSWJndXhCMitmZ2J1T011Wkc0SktvYnhTOUlmNjN3MEs1cXJs?=
 =?utf-8?B?V0xXazJJSjg4Q0NlejYzWFpXb01uYXlpNEVycURsamVkbEswSkZHeHlCeXZV?=
 =?utf-8?B?VmN0VUREenpxYVB1YTYyU1NJR1EwbW42dTJzUnJnc05temdGemhYVEcwSXYw?=
 =?utf-8?B?N0pZblptSVliMEEzMU9URityc3czMFIzOC96U0NTSlduWWU2MzRBWW41MC9M?=
 =?utf-8?B?dlVJWEpDMVNYd3RYL2FnODh5UytGNWg4NldtM1FKaUFYQlM0S2ZyNG9kajVv?=
 =?utf-8?B?SXNLOWgrTkd4bXNmNWZuUmpCYlBiNEJRWXNvVFQxcHdKVkROdmVJZHljRmhT?=
 =?utf-8?B?UUZaVUkzT0h3ZHJYRUN1U1MrOEVmNDU1VzJqYWVNVmFJUS95dzRjK1lUbGZK?=
 =?utf-8?B?VHBDWlpWKzZCOGNSTXFqMmsvZkE5aWpkT0t4WlUwRHdWTUVUZWdSQ3RraG12?=
 =?utf-8?B?Q0xQOFhGVFVyRWw1cUd1QXhJZ2xUVzc4SmlGb0wyUE1mekJOcWhEZGVFWkd0?=
 =?utf-8?B?dlFzNGdGNWk4MDYwWU1jTHM5ZlZrbzYzdHBpWnpBcW1zanBoRThyUGVaNjJp?=
 =?utf-8?B?eDRQYm5acFJEQ2wwZjFQTHJWblBFYlJZVktuM0IyenhtMnZKRUVKMjFqcytU?=
 =?utf-8?B?ZnZhODZMMU1GZW9EekJGZUEydUlwbk9nL1dsUjhzc2ExSkpRMmhmY0U2bUhp?=
 =?utf-8?B?L0pnRSs0cjFIV2lEOVM3ZzVYNndzQW56WmVEc1ozejFPODMzbEdiNzlpYVlt?=
 =?utf-8?B?M1JCN0ZnR0k4S1ZzMGh3V2tPNDZqaGIzR2diUm9UalZrUzBheXJPT0lBSWxi?=
 =?utf-8?B?ZFpROEl4cGxQMWpOWnZEcXZtR0tKb3F2TFpveU5PRXBndzJOR0p4MDcvbm9T?=
 =?utf-8?B?eDVrMnNRREpSZWE1S2JkVHI0aEhXMU5WNFBPTXZ5QkpuUnp2cnFKTDBYNVk4?=
 =?utf-8?B?UjMrOTdRODJIaUp4MFJjSEl4MmtBZ0Fva2lhOFRBNDNHUFJWVjRnSU0wS2Qy?=
 =?utf-8?B?S2gybWtWVmpLNUltVnI0bmFMVXk1Zy9kZkZHQlE3OTZxaDgrSFhVeVhTcEU3?=
 =?utf-8?B?VVhWTFpPaVAyY0JKUk9DN3NRajM3MEFzVTkxVWhQaHRFbkx1cm1kL3FUUUFq?=
 =?utf-8?B?citHOGpHVjJNaWdlSFVza3JjN282MnVxenJUaEFvSDRkbE4yN0t2dWsvK2VE?=
 =?utf-8?B?MUZNWHp4VVpsNDJaNkNKZUxJdFExTGQ2Nkxvc2FiQng1QW9BMUxYb0RQckJt?=
 =?utf-8?B?MFp1WnB6UG1RcTZJd1dCeE11ekJPZ2l6UzNWczRpWnZNa0h4Mk1sam9KQTdw?=
 =?utf-8?B?eHVjRWxRV05NUER2dnBOT2tmeS9PbWJzaEFNdVFPdmRTbUpYV1F0ekE3SGN4?=
 =?utf-8?B?L05LTjZJeGlXWEF3REM2ZnNCK01ZbWdkSFNLK2dDUnIwOXdrOStOYktDQTU5?=
 =?utf-8?B?NFZab2loYTBJNUU4RUNRWm8zMDBQTjRKSnhUV2xIcnptSkNNNk0xM1VGb0JS?=
 =?utf-8?B?bmZ6VklLaWlUUTJQSlFrbDNMdzRxZkxBbFREbTNOdDN4SVRJNzNTZzRjVEtK?=
 =?utf-8?B?OXNqM2llcjQ3N1AwL1QwZ2k0QWtwMkwzRCtYMFNMcExWSDR0WkdDVmdwMGlZ?=
 =?utf-8?B?eFNPTWozZ2pscklsYURWL0h5ZWVtRWNwWExmaGp5SklSU2tONEpKaUhsS0sr?=
 =?utf-8?B?QVduMU5OSWxrcklhOUxrR3RMY1IyaUZOWVplU0w2TkFLSCs0ZUovSzVFVC9h?=
 =?utf-8?B?VXpabTdkeDhBTEJvWkljd3ZpTFVEaW9CVmkzT0J5bjBaWXdON0dJb2M5SGtW?=
 =?utf-8?B?cVlOb2VJU3U5Y09qV2l5OCtNdkxCU29XQmRJVlNabFIzN29HK2lyaDVCL05s?=
 =?utf-8?Q?IHbnUTedpnBlAa1MdQeivqvi8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3151E721EBE1BD4F81855A3C9AD754D6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde11bfa-98ec-492c-2d8a-08dbe43d13d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 11:38:37.9416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wRJFSAHSTYPovmgE6ComgeTtx/jc/KHYwhi9+JZi1P34RdT//G8ENh51Ma6ODnmC3jPzq/FvwF+DD78gmdUBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 11:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190466

RG5pYSBwb25pZWR6aWHFgmVrLCAxMyBsaXN0b3BhZGEgMjAyMyAxMjozNToyMyBDRVQgUmljaGFy
ZCBQdXJkaWUgcGlzemU6Cj4gT24gRnJpLCAyMDIzLTExLTEwIGF0IDIwOjM3ICswMTAwLCBQaW90
ciDFgW9iYWN6IHdyb3RlOgo+ID4gQnkgZGVmYXVsdCBjdXJsIGlzIGJlaW5nIGNvbmZpZ3VyZWQg
d2l0aDoKPiA+IAo+ID4gLS13aXRoLWNhLWJ1bmRsZT0ke3N5c2NvbmZkaXJ9L3NzbC9jZXJ0cy9j
YS1jZXJ0aWZpY2F0ZXMuY3J0Cj4gPiAKPiA+IHdoaWNoIGNhdXNlcyBhbiBpc3N1ZSBmb3IgbmF0
aXZlIGJ1aWxkLCB3aGVuIGNhbGxpbmcKPiA+IGN1cmwtbmF0aXZlIGNvbW1hbmQsIGFzIGNlcnRp
ZmljYXRlcyBmaWxlIGlzIG1pc3NpbmcuCj4gPiAKPiA+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBp
c3N1ZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGlvdHIgxYFvYmFjeiA8cC5sb2JhY3pAd2Vs
b3RlYy5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bF84LjQuMC5iYiB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC40LjAu
YmIKPiA+IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguNC4wLmJiIGluZGV4IDVm
OTc3MzBiZjQuLjE2NWExMTYxMzkKPiA+IDEwMDY0NAo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvY3VybC9jdXJsXzguNC4wLmJiCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9j
dXJsL2N1cmxfOC40LjAuYmIKPiA+IEBAIC0xMzAsNyArMTMwLDkgQEAgUEFDS0FHRVMgPSsgImxp
YiR7QlBOfSIKPiA+IAo+ID4gIEZJTEVTOmxpYiR7QlBOfSA9ICIke2xpYmRpcn0vbGliKi5zby4q
Igo+ID4gIFJSRUNPTU1FTkRTOmxpYiR7QlBOfSArPSAiY2EtY2VydGlmaWNhdGVzIgo+ID4gCj4g
PiArREVQRU5EUzphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBjYS1jZXJ0aWZpY2F0ZXMtbmF0aXZl
Igo+ID4gCj4gPiArU1lTUk9PVF9ESVJTOmFwcGVuZCA9IiAvZXRjL3NzbC9jZXJ0cyIKPiA+IAo+
ID4gIEZJTEVTOiR7UE59ICs9ICIke2RhdGFkaXJ9L3pzaCIKPiA+ICAKPiA+ICBpbmhlcml0IG11
bHRpbGliX3NjcmlwdAo+IAo+IEFkZGluZyB0aGUgZGVwZW5kZW5jeSBJIGNhbiB1bmRlcnN0YW5k
IGJ1dCB0aGUgU1lTUk9PVF9ESVJTIGFwcGVuZAo+IHdvdWxkIG5lZWQgdG8gYmUgaW4gdGhlIGNh
LWNlcnRpZmljYXRlcyByZWNpcGUgdG8gYmUgb2YgYW55IHVzZSBhcyBJCj4gdW5kZXJzdGFuZCBp
dD8KClllYWgsIG15IG1pc3Rha2UgY2EtY2VydGlmaWNhdGVzIHJlY2lwZSBuZWVkcyB0aGlzIHNv
cnJ5IGhhdmVuJ3Qgbm90aWNlZC4KPiAKPiBBbHNvLCB3b3VsZG4ndCBhICs9IGluc3RlYWQgb2Yg
YSBhcHBlbmQgd29yayBmb3IgU1lTUk9PVF9ESVJTPwoKSXQgc2hvdWxkIEkgY2FuIGNoYW5nZSBp
dCBhbmQgdGVzdC4KCj4gCj4gQ2hlZXJzLAo+IAo+IFJpY2hhcmQKCkJSClBpb3RyCgo=

