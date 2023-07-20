Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0FDEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 10:07:05 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.59])
 by mx.groups.io with SMTP id smtpd.web10.9536.1689847620626751579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 03:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=hiKAGNz0;
 spf=pass (domain: advantech.cz, ip: 40.107.255.59, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/2hQtQWkdBvZSC+mIdoF5nUcMdawsAzbH3vuEEggcvU2C6X2Bywd7vhjwd7Lk4mTj7v/rH7WT7T7cAgsr+kr05Wv0wA1ykSXk1Bb32WmUV4bkO98flW5Q8cLB363IHDKBzOZFyybtoKabez12Qmj+srlhtuZqsmzZxi7gxm8YycK0yjY+ocLtWuB1LBweo2cgRpcJrU02MrH/PqaJwJqUa+aNYVqqxX7B6p8SnMl7wAiv/+gHvkAdKkb1GBpncSUR7rJEGLms8z8GUB6BwzEcpGtYYe9eLwsUOk68McMnQ0RvxOmE9VsxX/820JTREOplolC59rI8iEWTqgdESMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhAYLusQDZwGFR0beIsdb+HOk05XXoP1bGsfIMp+rgI=;
 b=g8EXxBX+gbkrE4ovQ1G6ON32bX1DHUJ5stgmjmjYq5fUy033iS+S2Zq660D6QUCJcRplwwFaRKTNnp9QzVLpgMHMnPlgengy+h0TUdF8gcvSvSWOBmp7I9jIaL8278r7HcEbq0HpOXUvKPEX7ine72kIZ1TFZR+Ywlr8Vc74cVfT/bRDysAMZz3ecZq4C+5Y8V1tYIO0yA5N5ufbeiPIqNZFLMTqKUTGfj2ka6szLmNOcRZTkqj9eDWjoC2Qknfz9pQHDNKssrStP+hJXqAomgjMIP01Y16grFfWNO0I05P/jKZMtsPzbb0kNunAZeO/+2vnfqBYkBrbrqskIy7LtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhAYLusQDZwGFR0beIsdb+HOk05XXoP1bGsfIMp+rgI=;
 b=hiKAGNz08OXb3HpwbAE7ybDW+24fZi9GukIRdKYhdJwI2iNN3udSzFgo4s4HGLXffvvb/Mxpt+3v5kNE1NnRG2hjVUl+l5wZv3ZKY9gq4SWQXeUng/IaXwv8DyHgHosfZ7/HFwKrNlpqbEiydHTRxoN2W6lAn4v8U/aRmxZQfrWxmTqi1huaeviax/ti+V7WtXw+pjnE6vlsBQpiHKPmqiIJRFo1P3GVz9InWLA5998k5O/kYy9umbyrShbMCr1lAI7E1TXv34+MHie8Swn/Rsztm8WfCuJgBrhyWI9G5uaiLvxtsiV3ogmcZoIHWcC9DY7/CbwQUvuNJrAnE9YL2A==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SG2PR02MB4284.apcprd02.prod.outlook.com (2603:1096:0:f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Thu, 20 Jul 2023 10:06:52 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c%7]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 10:06:52 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Topic: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Index: Adm6Zirrs9Te84mJRC+MJegq9PcmmAAAnvEAAAEeMFAAB62GgAAZFM4w
Date: Thu, 20 Jul 2023 10:06:52 +0000
Message-ID: 
 <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
References: 
 <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SG2PR02MB4284:EE_
x-ms-office365-filtering-correlation-id: 214b00b9-55cb-4c33-4188-08db89090a88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QpUbauf8NFGe85ExR6GN1pdldgNQ0EStypHKgsSrX7e7/HJbTySlmMurHe0qcoUKaCeBvMRq5YGfhmkJAVIOBaoqlmEPL4HAz4N8MbSACNC4aik0ohFMu/1u5JdVqOTKGIaeSeBzhSq9JQmsNvYvJ7OkLKf8xAwUrbrfaEqvnb0O46iT5LsexV0T+T4QbgCTGE9lLInvDMi0GGTwEpAD++3hrucr0/TLzY0tGGpjcuI0hIdsuxyAPCMnS8J3otwmt48xAM+Rr5UQh2W6F8vRfvy6LNY3ktZZ4fnsKxJmy4ZaEXBYJ2rB0j+bSXxfNf2r1icmyLEFhR8Jj8msp+ZDmdMPNGa6DbSSuWjeMknog5bhebZ1aChn9IU9ZTpRKexzLVRUlJM0vIiQO0NG3R1czsBbmCjbbpUqb+kZu2UNS6Q5Y5uRwl/PK+FsjggSi32egQrRFyXCs4oJ6Nh1jKD+TXj9Pf6l/95a43bkBhu++5xD/cmPmPnar3J1ulNpl+mekCcyA9BCn+IIE0RL958aEdiK0YJAO+l2ADMe2Sy7zLePZgcMQBpx7pj81zgoGy6fAO2+cWFnV/uGr3Cs0X8bYwFhQZyUBmo1k8UsFXRipR8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(83380400001)(478600001)(71200400001)(186003)(53546011)(6506007)(55016003)(966005)(9686003)(8936002)(66556008)(66446008)(64756008)(66476007)(41300700001)(6916009)(8676002)(316002)(2906002)(4326008)(26005)(7696005)(86362001)(76116006)(38100700002)(52536014)(38070700005)(5660300002)(44832011)(33656002)(66946007)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cEVSam1KN1RaVmprM29xY0Z4WFRtN2xoaTZCR2ZvajloNDBoU2FVQ1NZUWQ4?=
 =?utf-8?B?SjlZNVNsRlhVOHVzZ2RQV3hhb0JvVUMybldnTEVRekkrWEM2Q05JbmJpYnBT?=
 =?utf-8?B?TWhpYjNnSG91SzVhTjczK2xON2p4UDVJUm9FMzlFMzB0MElaNFJBOWVHQmRG?=
 =?utf-8?B?bFhnckRZZHJmYkNqQVBOWWtvOVp6SG0zV2l3MEl5dG9SR1hTcmU3T2krcnNl?=
 =?utf-8?B?Y1dhYU1INjZ4Z3pCRGVrK3YvT2pZOVZOWXc5ZHhxS0EvYk1QUEw0UkoyWlYv?=
 =?utf-8?B?SVhUSmN1dUNiSllhb0EwRTBiNFBYRXIvbXNaMmRSWEdSMUVNcHhua2RMZExx?=
 =?utf-8?B?ak45bVhjMTdUKzFUWm5mLzM3WHBLcFc2UnB5dVVIaDdUNk8rRmxBaVEyUGFJ?=
 =?utf-8?B?MnZxa0orTmpjeTlSK1RKcWFldTI2TjJsYnY0aFRBZC9yb200ODFZRFFUYTFM?=
 =?utf-8?B?RFpBVkc2QzJWUlJOamcrbDBRNjJFaW8zd1lLSHBVUzh5eW5vaENCVVloK2RB?=
 =?utf-8?B?aVZIUjY5dGpoRG0xMGpETjRPTFNqci9wem1KQkVyeEtxWnpzOWlvSDVCTFMz?=
 =?utf-8?B?RlZGMWRJZHZqVHZFUTc4WDlDeHVraEkrN1FtUk1SWEdvaHRScldTTTFadWRi?=
 =?utf-8?B?a0dtVHl6UmFGQXRxbmxLanF1VXJUZkljT2xPMlJnelQvWklJRnZORDY5LzNk?=
 =?utf-8?B?UFQxWDFhZEljYS9YWCtld3RHd0RhWUhKUkR2eVE5NmNYMlA3TFl2RDV3YnVs?=
 =?utf-8?B?UGVmaDltQzlIUG15Q1A0dGllU29xbDBGY3ZzL1h0MFk3NDc5U0orRS9uaWJP?=
 =?utf-8?B?aU51SUp5MlM1WUJPdVJSYkpyU0orUWo1d3FnMzdXVzNSa0Ivd1dpVTRyZ0t3?=
 =?utf-8?B?ODB4TTJCWnFTT01GZ0VCUGVYTVZQMng3a3pXYjhYdDNrMWxuN3VveXh2SHJC?=
 =?utf-8?B?MVV6ZUxTSzN2cUhjZjF3VjRib3I1MHhXTEhVLzBzMElIQjA5M3p6WnRrbW5z?=
 =?utf-8?B?ZS9PbXlaQkFWckp5aTY5djNnd2FmVmJzQko3MEdxM2ViK0toRUZ6bnRHS1M1?=
 =?utf-8?B?QmJxU01mQ0pUUHBmOU5xN3BxbWFUSmRPR1pORWRPQ2Y2TnUrMnlxS1dhWVVG?=
 =?utf-8?B?V3hyaFcrOXJMa25VOWlCc1I0dWdRYldHdHN6aDR0MUxMQmhiOEFCdi90dFNJ?=
 =?utf-8?B?UFJDdmc0SWJhbFVBcnNFS00rdi8rMURlUXpwd05PcURySHB0QVozWnBCZ2pK?=
 =?utf-8?B?YXQ4eHN6WGhhSkZjbFlHYUtjODI2ZU4zSVNDNHh5V2lEVTJoQjFoWW9YUzFv?=
 =?utf-8?B?amQvQkg1TWp6SnRyYkNwN1RXZEQ5eGRoNlBYaFlsamIrelNSd05Rb2pRM3dQ?=
 =?utf-8?B?MzZVa3ZlWXh2NnVwaFZqZlJIcjRuQzY4c25YN1RNbGJpVWZGY3FRMTRMN0xO?=
 =?utf-8?B?N0U0MzNubXh0QVg0RUQxZDN1NjhnZWxlM0FnaFVXbVN0TmNTejBWL0MxMExl?=
 =?utf-8?B?L3FVZ0RZVDdjWXhsNUhHSUY3VG5tTGhPQ0p5TkpSeml3eXU0UWRQcmlKRkU0?=
 =?utf-8?B?OUw3WmllSWphQmpnRnI2ZWU5aktSbUhvU2I2VTBDUjZWMUFid1BMUk8yRWMv?=
 =?utf-8?B?N0FXTnJvbmF6MmV0ZERkdlZGRXpBbXBrM2pIdUNaSkp4VDcwY2VyVlR0NFdl?=
 =?utf-8?B?QnZpTWh2bVNVQlZlQWt2NGM3SHU0SlRzcFgwbkJEbTYrS1RYU3JHRUZVZzZF?=
 =?utf-8?B?Q0l2cFd0THYyVXZ6ZTU2SjdkYnUwaGpadFVjUWo0aDFld0tNd2xoWGp2WmtY?=
 =?utf-8?B?cko1TXluVEY4clRMb1NuZExmeElxV2laWkJDSjcxblVQcHFlYVJkMGlRYWxj?=
 =?utf-8?B?a09tV2JQWTQ3anpaRERyM0RybWJ0OVJWdmdheSsyTU1GVUJsazBmUUdSbHhL?=
 =?utf-8?B?dFBIT1l1RHY4TjFrV25aZzAwSWROSGd0b1Z3dGRaQng4VVNKc20rMTdqK0Z6?=
 =?utf-8?B?T2pSWU53WldmVXdYaFNDK1NLbGlRQlNucVcxemNmdDYyVVAzV2cxL2lFSS8z?=
 =?utf-8?B?WUp1SzlYVXZhUFloSE13U3JmeTBxdUU2S254NUNEakJSK1B2VDhqUGxVcnZS?=
 =?utf-8?B?YlBRS0p3R1ZmSHBEdmpKbWc0NWlpTHRHWXZJOVlEeUlmVU9FZzlZaWNoOVoy?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214b00b9-55cb-4c33-4188-08db89090a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 10:06:52.7347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OzWhMBrb8rHHqxmrKjd9xWs9MFpTvsuyvmR8Y8t1loiwBG7ReXVvfCRu+H+POEXv0SIi/o6IH8zi9s2EBF5JWep0yDg4T4boUvvqR5rRYk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB4284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 10:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184627

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1
Y2UuYXNoZmllbGRAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTksIDIwMjMg
MTE6NTYgUE0NCj4gVG86IFBldHIgR290dGhhcmQgPHBldHIuZ290dGhhcmRAYWR2YW50ZWNoLmN6
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIG1ha2UtbW9kLXNjcmlwdHMgZG9lc24ndCBrbm93IEtFUk5FTF9M
T0NBTFZFUlNJT04NCg0KPiA+DQo+ID4gVGhlIGtlcm5lbCBpcyAibGludXgtdGktc3RhZ2luZ182
LjEiIHdpdGggcXVpdGUgc3RhbmRhcmQgc2V0dGluZ3MuDQo+ID4gUmVjZW50bHkgSSBkaWQgZXhw
bGljaXRseSBzZXQgQ09ORklHX0xPQ0FMVkVSU0lPTl9BVVRPPW4gd2hpY2ggd2FzICJ5Ig0KPiA+
IGJ5IGRlZmF1bHQuIFdpdGggdGhlIGRlZmF1bHQgInkiIHNldHRpbmcgSSB3YXMgZ2V0dGluZyBh
IGtlcm5lbCB2ZXJzaW9uIHdpdGggdHdvDQo+IGlkZW50aWNhbCBzdWZmaXhlcyAoIjYuMS4zMy1n
OGY3ZjM3MWJlMi1nOGY3ZjM3MWJlMiIsIHdoZXJlYXMgdGhlIG1ha2UtbW9kLQ0KPiBzY3JpcHRz
IHVzZWQgIjYuMS4zMy1nOGY3ZjM3MWJlMiIpLg0KPiANCj4gRGlkIHRoYXQgb25seSBzdGFydCBo
YXBwZW5pbmcgcmVjZW50bHkgPyBiZWNhdXNlIHdpdGggdGhlIGxvY2FsdmVyc2lvbl9hdXRvIGFu
ZCBhDQo+IHNldCAuc2NtdmVyc2lvbiwgdGhhdCdzIHdoYXQgSSdkIGV4cGVjdCB0byBoYXBwZW4g
KHNlZSBiZWxvdykuDQoNCj4gSSdtIGN1cmlvdXMgaWYgb24tdGFyZ2V0IG1vZHVsZSBidWlsZHMg
d29yayBvbiB0aG9zZSBib2FyZHMsIHNpbmNlIGFzIG5lYXIgYXMgSSBjYW4NCj4gdGVsbCB0aGUg
dmVyc2lvbnMgd29uJ3QgbWF0Y2ggKGFzIHRoZSAuc2NtdmVyc2lvbiBmaWxlIGlzbid0IGNhcHR1
cmVkLCBzbyB0aGUNCj4gdmVybWFnaWMgd2lsbCBiZSBkaWZmZXJlbnQpLg0KDQpUaGUgY29tbWl0
IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS9jb21taXQvP2lkPWJiMGY5ZTg3NzAw
YWE0MGVjOGRiODgwZWRlM2MwMThjMWQwNTU3ODYNCnNlZW1zIHRvIGJlIHRoZSBjYXVzZSBoZXJl
Lg0KQmVmb3JlIHRoaXMgY29tbWl0IGFsbCBtb2R1bGVzIChib3RoIG91dC1vZi10cmVlIGFuZCB0
aGUgc3RhbmRhcmQgb25lcykgaGFkIGEgdmVyc2lvbiB3aXRoIG9uZSBzdWZmaXggKCI2LjEuMzMt
ZzhmN2YzNzFiZTIiKSBhbmQgY291bGQgYmUgbG9hZGVkLg0KQWZ0ZXIgdGhpcyBjb21taXQ6DQog
LSB0aGUgc3RhbmRhcmQgbW9kdWxlcyBoYXZlIHR3byBzdWZmeGVzICgiNi4xLjMzLWc4ZjdmMzcx
YmUyLWc4ZjdmMzcxYmUyIikgYW5kIHdvcmsgZmluZQ0KIC0gdGhlIG91dC1vZi10cmVlIG1vZHVs
ZXMgaGF2ZSBhICJ2ZXJtYWdpYyIgd2l0aCBvbmx5IG9uZSBzdWZmaXggKCJ2ZXJtYWdpYz02LjEu
MzMtZzhmN2YzNzFiZTIiKSBhbmQgZmFpbCBkdWUgdG8gdGhlIHZlcm1hZ2ljIG1pc21hdGNoDQoN
ClNldHRpbmcgQ09ORklHX0xPQ0FMVkVSU0lPTl9BVVRPPW4gcmVtb3ZlcyBvbmUgc3VmZml4IGZy
b20gZXZlcnl0aGluZywgc28gdGhlIG1pc21hdGNoIGZvciBvdXQtb2YtdHJlZSBtb2R1bGVzIHJl
bWFpbnMuDQoNCg0KUGV0cg0KDQo=

