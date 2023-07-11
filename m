Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E02EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 07:39:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web11.2433.1689061186665094235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 00:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=RTUYQNeD;
 spf=pass (domain: siemens.com, ip: 40.107.22.81, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mS7V0WRAApGprIReox1N9SMzp+hn80sX3CILVCaSgfUdJ/do1TXELT3jrjxL0WpdRfLk3ZNeJvrGQObJ/sxouShKO9KiVi8ioDcin0nmIhxirbLlLizyXbh8tqHyimDsquYnGGKViT4AdpPq1QfqB69jK2ti7kd8j9RSrGZK2C6tERW/+sw5zdQTLwnKFAU7n4nDqx6j4m8ukM9Mi8J625tFWX7qigY/uIk7iNxkK6/6TIzUaV0a6a7cfKq8Xf7imdLpqLgTY9oNiBs1jAIotqaqyGSTaZZteovXEX+6WviTA6VyvJQVlOWZjR0I1CFeGvHHEJIfc9cjlzsCXE2Ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwzgSlP5W8jFFyV0Oz/WSS7fotqGL6vmWkZfKeEUuCI=;
 b=EZBIekBP/tvh258Q9wgPlA6wzAchb89Utm0dyZo9puORTSE6dLWuZYcfVESu07W8AclN+m8vf59xc8LJESTbV0vt7MmjzpVuyLSjkrcCM3nqbr6qKxYysSzKKavvdsffQjLaWRS3IQax53Wl/Ak8yuqLuE0IGuAYAknkb5bCbzyeTll3m8/oDoN3dH3XNLZCrVQFsoCqpgd9zLgBCzqxyn4uWOrLB/jGrJ31e3cennvvNgY3+LNG3tm7oDAMnjFqL9Wnt02Q18T4RYkgQ6RyOXioJZStxG+wZsQKSSCo5RckGoHTnPGvx3rPihskWtA2sTX2KzPaIpBL5hrW/h5Y8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwzgSlP5W8jFFyV0Oz/WSS7fotqGL6vmWkZfKeEUuCI=;
 b=RTUYQNeD875XL59Z/TX1kqVFsCdZewSMo8IIz9flI6zBTY5bS3WyTP2cdQD7mgP4/grxx1XQuVAgVtmTpHjo4butOu0o/pKzD8k4Q/WhbZB3Fj7gjFL0F/E/FF+hR5pNCIUtshbG2YtYZ+f3BemTEL4vtw+xPJ/CaYtluhLurhi5jSqJX8gYVoPlXbiyISozTCQvG11vaiJdVTCiBUHobXaNoEHnRTx8BYRtGDSRhKZ3SXCldyxTTIGAJohcBRk97G6emeDRktDNC3JZYLjx86tQbX1Z1z/GNdFGr0GXEUk+DoIJrlmlfsWZanYaZrBmLG9oaXdyaIBGk5n/jnHoAw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB6722.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:564::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 07:39:43 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c056:6a8e:6bed:d7e1]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c056:6a8e:6bed:d7e1%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 07:39:43 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust-llvm: backport cstdint header fix for
 build with gcc-13
Thread-Topic: [OE-core] [PATCH] rust-llvm: backport cstdint header fix for
 build with gcc-13
Thread-Index: AQHZsxG+m15v0GF0zkeuYT1b5vBsFK+0Le+AgAABowA=
Date: Tue, 11 Jul 2023 07:39:43 +0000
Message-ID: <1053cfc30d198d8a7374538b4ff4c898eef37662.camel@siemens.com>
References: <20230710093432.669209-1-alexander.sverdlin@siemens.com>
	 <20230711073351a9bccb83@mail.local>
In-Reply-To: <20230711073351a9bccb83@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB6722:EE_
x-ms-office365-filtering-correlation-id: 57f620f7-526a-4dc3-6885-08db81e1fe0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZqJ8x+Z2xtDZBaiGThRySPMxxBbgDZGB5/8PQpvn9L2rRKXBFs96CbJYQ4JpmnKtctxr/O7smozTAvnfCg/BDFrW9arFoy9wsc6Zl9cysQpjuyOFU/JqXEZ2eehCa95HvB439gAScROcwieuuJwIuDoNJSoPN7JdBfjvBKORYhf4JtWgVPsOqKnHoPeKGeEEpU99GFs7PV/iRBWV20KZiumB2bt9BE33JYAGBf3BIGOYrJFLrMiz3o4nKfFE94eAdO6jWXDQGqWag3Upr/yHoAoyujS0VmYSbofX9OScsvAYQDlPZ5NyJFbFGVei7db4T0HpIrXVwYBi4AhhG9WirW2ylU7UdCUTz8HXEB8gM/iZDT6Rl5nhaHVTnTpo9tCkSYtSraAw61SEGgQ2/0TrsBvORl56hfyBI5NQ1dEGmiBC6JFMRRe5vYCprjog4GfKRxJ6Q8tpSrS/kCu3d8L/iSPqEpVpUggce2s0HKmncya1xNs9VisCdaiqgk20RvHh5x34D+9F4NLaWnX53XTFm9D3H04j69PRPmbxfFxm/7BBpScLd6TfqaOjKhK/hOipzHa3Ng6x3+SJOAiF0VZkIpvzu6HAj9eRVFnNgXfHnwMMV/p6qlQBqgyjlneDE0kWqfXrmU8tlYFpkYoYY2WF+A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(41300700001)(2616005)(2906002)(186003)(36756003)(5660300002)(38100700002)(122000001)(82960400001)(26005)(15974865002)(4326008)(6916009)(8936002)(55236004)(6506007)(8676002)(64756008)(66446008)(66476007)(66556008)(316002)(86362001)(66946007)(76116006)(478600001)(6512007)(91956017)(38070700005)(71200400001)(6486002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NjBRaExpdU5NckZBWHJOVitCK1F1K05yWUk3ZFEzN0sxMS9oV0swVmR4SGl4?=
 =?utf-8?B?VFlUT2ZnSytyR3BoY0xJYXRCeG9nMHIvbllIOU5lREEvbHA1RHBmOFQ4WW83?=
 =?utf-8?B?UE5hdUNKZHhISWlSVzJra0RHSFduRi93SEVPYXBjbG5XQ011ZDc4QVlJdXZ5?=
 =?utf-8?B?MXFIZHIzZE5hZklWSnN3RmZwS0VmQWowMWRCSGVQazlFdGZSeW05NDJGbFZ5?=
 =?utf-8?B?Q0k5UW13cjVDUlJBVlg4Y0F2WEg0MnpueHAvSnM4ZzduVVZ2VE45dTIxM3R3?=
 =?utf-8?B?UE9Xc1BxNGpISEVqbGZEL1dFeWgxZG51K0FicEo1aUpFWnNmcmh3ZjRrcm9t?=
 =?utf-8?B?NGhpcEJkS1dLWWpDUm9pdWJ3TzZTYkNyYXFKQUtsaFd6NXlManlJVmRkMTkr?=
 =?utf-8?B?SlZzSVhDZThXb1pZM0g3c1ZxaXUyRjFuZjljdVdGVnREaEFLRlJ5VFhkMHA0?=
 =?utf-8?B?cWhQc2NjVDNjMHoyYUxKVmgvQjlEcVh2WUFlZG9OVWFvKzE3SStzUlJqc0hT?=
 =?utf-8?B?c08xVVltWkdsWXF4N09McE5lNk5yNXY0eE9IMytnYUVSZUJkaExnOHc2UFY2?=
 =?utf-8?B?YVRORU9sWEFJZDIxcDNaVUtqOTdwQmFLOFhlK3pyemtLdjVCVTRXaVVPSXF0?=
 =?utf-8?B?bHZkRHNDQnJZNlhoZStMMGxPY1pDOUxUSFB1RmxDeXhsTGU3WDFVRjMwUGNN?=
 =?utf-8?B?TC9XVE00VXRwNUZVMHltVU04NGlxRlcwVVUvUURZMGxXNnN2VTZjRUEwcFZ3?=
 =?utf-8?B?S1Rnc1NTSTBNSEFjdFZ6b25GMDFqdStWakFoQ3F2T1dQNDF1b2VVWU55VXk5?=
 =?utf-8?B?SC9PRTFOQTRudC9WVVBKLzRvcGlHZ2hPYkRmc3FyZCtVeElaK0tTSEVnV2xJ?=
 =?utf-8?B?RmUwQk8yMXVSaHV5WXlQanF1aEZUaGRCc2VCTUUrZDQ1Z3k4RzF0S0owWW9B?=
 =?utf-8?B?UVZ0V1RCVTZsekpNb1FZK3NhRHd5OVl2ME1tQjgwa0UrVjZZL3BvalJTdHFw?=
 =?utf-8?B?Rk9XV3ViSGVIVFRadXk2SFdHOTUyRU5FY0VVL2I5My9UM1NmRm1GRVh3Vmt6?=
 =?utf-8?B?ekFZbzdQRGNMS0pyVHZQRXBETDNrdDNxbjNoa1FaenhtS3J0ZzNhOSsvdE5S?=
 =?utf-8?B?Z2VoSXowNEMyV1NmZm4zVXphdEtZcVpQTFA2ZGRFa25BM0tlNm1CRWNzbEt5?=
 =?utf-8?B?TXk1dEpsa25Cc2treGFwZGpta2YweEFYUHVYRGhZOVR6K2VJZEpRMHErOFhL?=
 =?utf-8?B?NEZWcW1COE1NeE55SDhDaFc4NW1heTYzU3d0cVNGL2dDUmtyMncxekdLU2I2?=
 =?utf-8?B?UmdBSmpwME9wMnlPb2NqWmVkUkdQd29OWExzR3hHbHNBcWVxc0trN0FDWDdF?=
 =?utf-8?B?NUNnVXl5MHBhOERhdmZSNWdUZGtaOVpGNXNWbU5XMXROL2ZNbTVZNUJ2bEJM?=
 =?utf-8?B?MHl2SjVnMDRWdC9zamFUL1hYWm1aSXAzWHRpaVRBdUhKWEZ6T0pmR0Nydkk2?=
 =?utf-8?B?K2NBU0Y0OTdaQnR5OWJFSUdzemV2VTB6UE5sT3NOUzYxUGdmUmdrRXZQZGxK?=
 =?utf-8?B?L0FmY29GeGI2aUg0V3Nhc2FKWlpiMzJlTUVlU0JRTUNGRDJEaVU0WWg4OGsr?=
 =?utf-8?B?TU9kNXlKdGxoSjZ6L0N4a2lkZ2QxbnYwb3V2U3N2RUM1MnBaSmwycWtxODEx?=
 =?utf-8?B?aGZ6Y29HVUtjVzUrWk9KcmJUdnJJTFFJbUJmaFo5WEcvMTROdERUNGgxWFFY?=
 =?utf-8?B?ZHdVT2hPQ0llWTdIK3hCS3VmZHVGcGlJbjVZdlpNamxtUG1wQUhlbHYwK05o?=
 =?utf-8?B?TUxwcUJyc0NvRFNtQVc5b3ltRVZCNUcrNldOS09BdUdEdXhINEluS1U1TjNG?=
 =?utf-8?B?WDRmNjRybnNxSTNuSTdUajAzbldwMGc1dkxzTzlqZDBqRVJWb0kyRHkyUkV2?=
 =?utf-8?B?Zm5zalBEbjl3STNwYWZxZGgzUEk2c2pObUl5UnNuVXNwdUVEbGFzc1BsK29D?=
 =?utf-8?B?YTZhcnJKSlZ2Q0FJM2tJWE40OGJxWGVBM2ZNVDMrUGhnckppbDRUN1piRVRE?=
 =?utf-8?B?ZEExZC9waXdiUUZtajNNYUZjYlZ2SU13by81TTJJRGlIMG9IQk1YRGRlMlk2?=
 =?utf-8?B?VFJoaHdQeWFBek9SMEFBY1c4VVlYaG00bkJ2bGFLZnBPSXp6L256YTY0Tyta?=
 =?utf-8?Q?QRvlNS4Qsi4D5F3p6nYBUeY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB32295F8CBEAD4095D19AAED516B65E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f620f7-526a-4dc3-6885-08db81e1fe0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 07:39:43.2319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErKkH5p8Dt2zlPRSXPOPEGJSxGaQfr9f6qcSWUiJDAawDs2pgRaIYJs5ESk91WhfJcfC6Jt+XptcFeETh3pPeUYsbevsLNy+NfqqTwvSFzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6722
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184120

SGVsbG8gQWxleGFuZHJlLA0KDQpPbiBUdWUsIDIwMjMtMDctMTEgYXQgMDk6MzMgKzAyMDAsIEFs
ZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBPbiAxMC8wNy8yMDIzIDExOjM0OjI3KzAyMDAsIEEu
IFN2ZXJkbGluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IEFs
ZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KPiA+IA0K
PiA+ICogbmVlZGVkIGZvciBydXN0LWxsdm0tbmF0aXZlIG9uIGhvc3RzIHdpdGggZ2NjLTEzDQo+
ID4gDQo+ID4gQmFzZWQgb24gY29tbWl0IDMzODI3NTljYjZjNSAoImxsdm06IGJhY2twb3J0IGEg
Zml4IGZvciBidWlsZCB3aXRoIGdjYy0xMyIpDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+ID4gLS0t
DQo+ID4gwqAgLi4uLW1pc3NpbmctY3N0ZGludC1oZWFkZXItdG8tU2lnbmFscy5oLnBhdGNoIHwg
MzIgKysrKysrKysrKysrKysrKysrKw0KPiANCj4gV2FzIHRoaXMgdGVzdGVkPw0KDQpzb3JyeSBm
b3IgdGhlIG5vaXNlLCBJIG9ubHkgcmVhbGl6ZWQgdGhhdCB0aGlzIGlzIGtpcmtzdG9uZSBzcGVj
aWZpYyBpc3N1ZSB0b28gbGF0ZSwNCnRoZXJlZm9yZSBJJ3ZlIG1hcmtlZCB0aGlzIHBhdGNoIGFz
IHN1cGVyc2VlZGVkIGluIHBhdGNod29yayBhbmQgc2VudCBvdXQga2lya3N0b25lLXNwZWNpZmlj
DQp2Mi4NCg0KPiBFUlJPUjogcnVzdC1sbHZtLW5hdGl2ZS0xLjcwLjAtcjAgZG9fcGF0Y2g6IEFw
cGx5aW5nIHBhdGNoICcwMDA0LVN1cHBvcnQtQWRkLW1pc3NpbmctY3N0ZGludC1oZWFkZXItdG8t
U2lnbmFscy5oLnBhdGNoJyBvbiB0YXJnZXQgZGlyZWN0b3J5ICcvaG9tZS9wb2t5YnVpbGQveW9j
dG8td29ya2VyL29lLXNlbGZ0ZXN0LQ0KPiBmZWRvcmEvYnVpbGQvYnVpbGQtc3QtMTkzNjA1Mi90
bXAvd29yay94ODZfNjQtbGludXgvcnVzdC1sbHZtLW5hdGl2ZS8xLjcwLjAtcjAvcnVzdGMtMS43
MC4wLXNyYy9zcmMvbGx2bS1wcm9qZWN0L2xsdm0nDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGlu
DQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

