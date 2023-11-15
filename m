Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD033C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 22:43:19 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.51])
 by mx.groups.io with SMTP id smtpd.web10.27323.1700088191542730490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 14:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=PEjJl/53;
 spf=pass (domain: welotec.com, ip: 40.107.241.51, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8FDsd41Qgk6HpUNKVZXX/N+AImhwGwK6Wgr4aTvNnlSBOYbfp2tBJpOFGyYvYCnWJ333i8CkoHHpvrzEnhIKltJ3AfoxJfzP2lvfHYGT2nhvI83SsZTtm0R1JOqCscqEQHrtjLou+OQYSgYsHcGoHIc8e99Hdb5rUhkklI02SyCOwiFjHfiOsT7LK+cEyy8ZI1zXyE1/ULmtW/ueg+6JDkRKHWi9jROa0NUpd+CNC8bMjYe5xjPyWpU0hjo1/UmXWacXgPg1tNhPpX1PBB1UayTuBf7WKMYOviyPS+QLQD5BHTO3rHLQpgQhIhBsoFkzmz0q5DhBV+wMxR8SpP35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXvJqEWTm0cVRA3t4MCOlxY+CgVNwcrsLWnEi8adI/0=;
 b=iCYHqFJIMsOdDUgseXMGFE/AedTtZmWA4zudIuRZbTYSAWkj6lpUHpK2XSxZTKsxBmtUBG4NfYEXWGZ7SQN3wzb60DucjpQpLYVJx3nWW4QUmX/6P+EQ7jB7GWPBEtmnAFCM9KmWzwmyQOH+cVCzdXkbMcZMHzWQtWyJ6Ee5mpQAxzZuZMgWr4sucPfqWzDE2iMmb/CJfJ2z+RFebhxCzSPJlKriSWVDa+IrP7sx6SyqY+xiF7zqB41Mofa3SKWQWxCrlMkSyuLuE6gPCcKpSPxmdYDJRoSEpuU77FWijms1B/3IdqU56MpuGgkFSzZA8cjA2GXgLrXY6Hdn63b1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXvJqEWTm0cVRA3t4MCOlxY+CgVNwcrsLWnEi8adI/0=;
 b=PEjJl/53AHXL4Ukp9g8j5Cc6v13Y9A5Up/o00/A6ltb6RJNsnwkf3A+NxEY3i0vImkhSHrTlD/oIRflezBTTO4nsqODr2ijL0xwyfY0w8AXzFiUnSiclba+aIelvDIuTCkLBSX70qKlzlmSaemqaVSEcrnXVxRG4ANFR5TTsmbaL74Cy9Rh1xRzU6apcu44aN7z2HmTAF7AXtnF8XbEDXmB/IKFT6lblxeIo1TwbxA6qVOA0J8DCdmh1fkxNCfIN2Ar4rAQU73gfb3y7ML8XG9EiZKdve2lImRJkiUZ9vP3KKPecNcVX7f9SMUpNBTviq8A48qn5HiTuUo51rodBnQ==
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Wed, 15 Nov
 2023 22:43:06 +0000
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906]) by DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906%6]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 22:43:06 +0000
From: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 1/2] curl-native: add missing
 ca-certificates-native dependency
Thread-Topic: [OE-Core][PATCH v2 1/2] curl-native: add missing
 ca-certificates-native dependency
Thread-Index: AQHaGA4iCSDTrCfxLkGGqPf6+/ZcorB78vsAgAAHGoA=
Date: Wed, 15 Nov 2023 22:43:06 +0000
Message-ID: <12322453.O9o76ZdvQC@latitude>
References: <20231115215256.867653-1-p.lobacz@welotec.com>
 <9a6435e91f517739cd565d0f597cf07521b16075.camel@linuxfoundation.org>
In-Reply-To: 
 <9a6435e91f517739cd565d0f597cf07521b16075.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6475:EE_|VI1PR04MB9761:EE_
x-ms-office365-filtering-correlation-id: 8fa37433-5dd5-4168-3fd2-08dbe62c3c0f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sSvdCPEfwm7kqtTYqSlfVP2vCQ7cNzTJgrpS53L5vJG+ORDtk4x+rQ/au2ILsOiu75DChP1OdR/ZTj2crDhRykC2geiEG0yFK7S01btUHCLQt2MTOuUZ4tgTOv4tPQjkn+z0PSZxq1nX82iISKa0f9ckilv3MCRERmOX+P9COy/8UOlEzDCx4Jb4qfnhPW6bquGG++hGjwDv0oMgCe7xfqQGRLgFv/o+xxT0WtExKJCJ4g+/lEA8+Lz+STOG+/uAWae0Q8LYqC8lY4XLmN5UgKu/swxv2XAOiGFpHcHPs9gCvH9RJpNrrwJ6/cQ1Ww8H4neIpdx64HEn2d+VqlLrqIEdc5YlUssafbq1rg0h6U5uygZMAvufT3FKWn92QoYqLJLND1iLkSI0MbpUlQjHG/1xxVhy/CTeFP19/zC1yfuUxVroYUaNtxlaXhgkgUnc4t1OERqdebX/ORvRG4bxtcSJpZfSrOK1YS17RfAoYmRcqC3QgvTeRmIF+Tr42kvaEcQwCKs6NVbPMVkC7U91/Qjm17lQ2ngyuM8ZeCCVvUdXsf7yYeSwF5KSc3/Tz6SdW0eWxyFSN+AciUGLuQ2e99oenAnRSsxyRPB0Hfe6bMXitl9orgUKNMqyunU8SdhLkLoKP5XVMZgQFzkZxVT0pg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(451199024)(64100799003)(1800799009)(186009)(6486002)(316002)(33716001)(71200400001)(9686003)(83380400001)(6512007)(41300700001)(2906002)(8676002)(5660300002)(6506007)(4001150100001)(122000001)(66946007)(76116006)(66446008)(110136005)(64756008)(66476007)(91956017)(66556008)(8936002)(478600001)(85182001)(85202003)(38100700002)(86362001)(38070700009)(26005)(39026012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?djdDWHI4anlMWkJPOVRKYjlNRmZOeWJhS05pc1c4aGtxc1ZrZUdtK200YWdJ?=
 =?utf-8?B?RDRUY0ZIeVphSE54VW9oNmlWTGJPdzZxN1FVaVBaWHp5SCszb1FLR3VYRGZQ?=
 =?utf-8?B?LzlxUm5xMENUTS90Zzc5dDlvV3g4TTdCdFYzdE1pTWp6Zk01Wi9TdW9CcDNj?=
 =?utf-8?B?V0p5Qy8zM1ViYmNiZ0RKRmRScVlnRndGSXJwRExpelU2dVlWUnZWUVZBUHlP?=
 =?utf-8?B?QUpqNGFQMll0cVUxaFNJSFdwYVFEd2NtWnExMkY1NzFMci9WYkhoK3JtZldL?=
 =?utf-8?B?dGlqUmMxN0l3THUwRnFaNCswNFowajJ3Yk93b3NkNy9wMWlxZnM3NE05NHZp?=
 =?utf-8?B?Q2hOcWZKY0MzL1k0bkV2ZTFmK3BrZTdjYVlPRnhjT3FmOFgwR1BDcEJtWFBN?=
 =?utf-8?B?c2VXVVBtSGp2SGwvMmhaRWVENWo4VU5NUXdMN0wrZGxWYVliQmg4bURoUEZT?=
 =?utf-8?B?SW1MeHNXQmUzYzRsUzA2MW9oVGFZSW9URytoK0VZc0JSdmVsUzdkdkZrZGxl?=
 =?utf-8?B?YitJcEhxM1k2bGlKNVdyYzVwS3VFdWthU2E2SlFEb1Jlei9IcGdXeVJSZVNV?=
 =?utf-8?B?Y0UvTDRUZE9oSUR3TGEvZlFIQTVYb2Eyb05hNHBzazFlQnlBVHRvMVgvLzF6?=
 =?utf-8?B?VXJzNWQ4VFJDd0ZwYkxXTWhLdi94aFdKcHJnSFRJVlVNQzNJU1BYZitVb3BY?=
 =?utf-8?B?MzdIUWc4bGpGb0YxV0tNWFNPTkFTZXhtZ09WR2JWMTAzekt5TFpWc21VWEcw?=
 =?utf-8?B?YVJFSW9tMHNXZU02QkhpWU9xYjBPTE1hUUNHQ0liRUNGR1Y2aFE4cUN5L0R6?=
 =?utf-8?B?bHBnUUtsSmUvNW1XUDZvaWtudzc1SVRHSlBZZXVOM1ZsVGVqb0ZmUzhwRldO?=
 =?utf-8?B?WTBMTTRIbG9FODBJclZPeFcxTGIxN2JSc0luaTVVYVhqN2N3L3YvR01SUk5w?=
 =?utf-8?B?cDg0TXh2aHpEK1FJUjZUUnhJb3RVeGROM3gyRW95ODRFcC9FbENzTmFNTlZv?=
 =?utf-8?B?V3hCSUN6Z1lFakkwaFFESFhPQVRuMnB6cHd1YnhINk51a3lkVU9vM1BqT05r?=
 =?utf-8?B?NHJWYjk2dHhPRmozek55NWJUVTNLS2ZQMGg0YlR0SG03STAwRWN2dHQrWjI5?=
 =?utf-8?B?ODNENXAxL2tnK2NXQUloZDkrK2NIRzQwMjlqNGNhN08zYnBLZkFrdDFqSC9E?=
 =?utf-8?B?TVhhS2R6T2FFV05XcnNNTkZnNDVMaDZRN1JKRG9GeDlqUFVma2Jsa0h2K21B?=
 =?utf-8?B?YWdkMWpILytQRHNxN2xmQlB0RDNjQ1ZPMS84bEhlYVBGR2x3UG9ib3NJb2xG?=
 =?utf-8?B?Vm83RHYwMzY4dmg0OWhndlNhUEFScTNFV24wTlJydFo1dHdtSFpzS0tBTGo4?=
 =?utf-8?B?ZzBOUXFhdllYVnZuKzRYOXdMSzBnMThyd0FqL0xDSDN6aTRsUDl2RjMrR1Js?=
 =?utf-8?B?MU9vK0FYbVVnVEM0VWFCS2IrenhScmlhVEdiNFZZWnlVaFJGUXVQMjBiK0p4?=
 =?utf-8?B?ZGRHYnRTQkhCN3ZtZzd2V244RU9NeFJUSVE4TmNlR2piVjVLaERQL01rMzd3?=
 =?utf-8?B?K0c4eitJZXpGY3Y1aGRySCthZ1lwQkViQVRSRjdnWXlIRDVPTlcxZWhERU41?=
 =?utf-8?B?djBONm03cGpYaTIzQkJMOXQwZ1J2bTlCa0dONkdqMWRZZjhYc3NrNTRGWCtZ?=
 =?utf-8?B?SFo4cGQzdjJ6cVREMC9yenJLaVZBblUvWVZVUTUxOGlxa0ErT1hXVDNqOG00?=
 =?utf-8?B?K2RHMmtPYWEwYTc2dllYV0c5dGZrZ2pYdEFTek5sK1YyamdSb0MwdG1PaXhh?=
 =?utf-8?B?dGEwUGNWYm1wdEt0UGl4b1VhUEFjL2pMNVRQcWl3Yzk2bDFON05BL1ZCcTRG?=
 =?utf-8?B?eEVEcTVpd040d29GZzcybWhCc28zUGtmamllSm1ROTdFc1hwUWFuUHhVMzUz?=
 =?utf-8?B?ZXl2d21mcWVoTkpsbWxLSGpPaXV6QmNrNTZ6UEJqSGdTY1NPdWZxbjBkOU1J?=
 =?utf-8?B?V3BGR1lFN1ZWN0t5L2d2c09uUHg4YjdLQ1V5d1c4dk5LWTd1Rms0cWJMUEps?=
 =?utf-8?B?KzRSSktQSm85RUE0WmI5OC9MWWNzOFpVc3NybjNQWjFQQmZvdHlZUE95SmZJ?=
 =?utf-8?Q?IHN0HTNx/XHgKodOhNMIuVOpM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C43BD7D905B4134AA54126968B6B1FA7@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa37433-5dd5-4168-3fd2-08dbe62c3c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 22:43:06.3530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gpv7JLtmTgj8ZRx4KLJFtZgOF/CHUwFK6+7/4V1Q4k/qpuJZ6h32RVYVbTJ0J8KjXQKsx65XBylIQ217vufnEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190748

RG5pYSDFm3JvZGEsIDE1IGxpc3RvcGFkYSAyMDIzIDIzOjE3OjQwIENFVCBSaWNoYXJkIFB1cmRp
ZSBwaXN6ZToKPiBPbiBXZWQsIDIwMjMtMTEtMTUgYXQgMjI6NTIgKzAxMDAsIFBpb3RyIMWBb2Jh
Y3ogd3JvdGU6Cj4gPiBCeSBkZWZhdWx0IGN1cmwgaXMgYmVpbmcgY29uZmlndXJlZCB3aXRoOgo+
ID4gCj4gPiAtLXdpdGgtY2EtYnVuZGxlPSR7c3lzY29uZmRpcn0vc3NsL2NlcnRzL2NhLWNlcnRp
ZmljYXRlcy5jcnQKPiA+IAo+ID4gd2hpY2ggY2F1c2VzIGFuIGlzc3VlIGZvciBuYXRpdmUgYnVp
bGQsIHdoZW4gY2FsbGluZwo+ID4gY3VybC1uYXRpdmUgY29tbWFuZCwgYXMgY2VydGlmaWNhdGVz
IGZpbGUgaXMgbWlzc2luZy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGlvdHIgxYFvYmFjeiA8
cC5sb2JhY3pAd2Vsb3RlYy5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2N1cmwvY3VybF84LjQuMC5iYiB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9j
dXJsXzguNC4wLmJiCj4gPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjQuMC5i
YiBpbmRleCA1Zjk3NzMwYmY0Li5mMGUwOTg2OGY2Cj4gPiAxMDA2NDQKPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjQuMC5iYgo+ID4gKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvY3VybC9jdXJsXzguNC4wLmJiCj4gPiBAQCAtMTMwLDYgKzEzMCw3IEBAIFBBQ0tB
R0VTID0rICJsaWIke0JQTn0iCj4gPiAKPiA+ICBGSUxFUzpsaWIke0JQTn0gPSAiJHtsaWJkaXJ9
L2xpYiouc28uKiIKPiA+ICBSUkVDT01NRU5EUzpsaWIke0JQTn0gKz0gImNhLWNlcnRpZmljYXRl
cyIKPiA+IAo+ID4gK0RFUEVORFM6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgY2EtY2VydGlmaWNh
dGVzLW5hdGl2ZSIKPiA+IAo+ID4gIEZJTEVTOiR7UE59ICs9ICIke2RhdGFkaXJ9L3pzaCIKPiAK
PiBJIHRoaW5rIHRoaXMgY2FuIGJlIGFuIFJERVBFTkRTOiR7UE59OmFwcGVuZDpjbGFzcy1uYXRp
dmUgd2hpY2ggd291bGQKPiBoYXZlIHRoZSBhZHZhbnRhZ2Ugb2Ygbm90IGJsb2NraW5nIHRoZSBi
dWlsZCBvZiBjdXJsLW5hdGl2ZSBvbiBjYS1jZXJ0cwo+IGFuZCBvbmx5IHJlcXVpcmUgaXQgYXQg
cnVudGltZSBmb3IgcnVubmluZyBpdD8KCkkgY2FuIHRlc3QgaXQgYW5kIGdldCBiYWNrIHRvIHlv
dSB3aXRoIGFuc3dlciBpZiBpdCBpcyB3b3JraW5nIGZvciBtZQoKPiAKPiBJIHN1c3BlY3QgYml0
YmFrZSBpcyBzdHJ1Z2dsaW5nIHRvICJzZWUiIHRoZSBSUkVDT01FTkRTIG9uIGEgbm9uLVBOCj4g
cGFja2FnZSBmb3IgdGhlIG5hdGl2ZSByZWNpcGUgZXh0ZW5zaW9uLiAKCmN1cmwtbmF0aXZlIGhh
cyBhbHJlYWR5IFJSRUNPTU1FTkRTOmxpYiR7QlBOfSArPSAiY2EtY2VydGlmaWNhdGVzIiBidXQg
aXQgd2FzIApub3Qgd29ya2luZyBmb3IgbWUgd2l0aG91dCBERVBFTkRTOmFwcGVuZDpjbGFzcy1u
YXRpdmUgPSAiIGNhLWNlcnRpZmljYXRlcy0KbmF0aXZlIgoKPiAKPiBDaGVlcnMsCj4gCj4gUmlj
aGFyZAoKQlIKUGlvdHIK

