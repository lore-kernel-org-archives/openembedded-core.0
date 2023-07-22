Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D04EB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 15:00:18 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.40])
 by mx.groups.io with SMTP id smtpd.web11.6988.1690038006360399235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 08:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=Wb1cKASp;
 spf=pass (domain: advantech.cz, ip: 40.107.215.40, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJH9cgQP9GU7+Ypa/uWzFmV0Kq1cWmEQMMKtY8I+EdzI7J0oeyMGmhJU/NaHXnYibGF/HhQcRsBoWWQDF7XuW8CCIyhKe15LzXkzRZOXK/wl3Gfk6Y9Aij7S9UEz76L5xc9ZDtP+Y4IiBzwAMqVwcKq/lu9Jvk5XhYwZDVne4Y0wrKZEssSIbiIIW62W0YFAUFNZsA9jqftKwnZEnP7QJbKzyIK7djrvLyrm0E6CZ0eRIi2F70y2bmVkdOMI3oriqeAoNsIKfQ19BD2QEfqyVDTs7V8qtT0CyUqUC2c3Kk8eJcSdSe+MnKgFZ9BVXWO2EGdwixAtS1D3VmxYBqhNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVgjGJSR1tWuB6bqo2FEaoOlEvq8K67VtmO6aoqSSuQ=;
 b=fGmxyISJ+MMZZ6vm9L9SX2tCHn+XILlRji4xZvks4w+VKBjzt5jHtAI6bjKtiR8zz1WjJwr1JpsRKZeOibEgdj/Rp0MLLMt1MPR8v+1jWwm8X+pI6y41Trj5V34cxe8i725PA/mX2y/WP0nRnhI9Su1i6LzYatXEHdEYg2iAnh7vAwdXKJED6veCbuOHHBvuE1PMhwBNwOzX8+sc+4DZu8II0kriswwfL6kKk388LeFBQuG4sKMhRQsNPG8j2it4KFKwlJ3BeStT8EStY3T1fuW+NyUKQe56yMKXpSUcF7isR59CLl5Xo57B8E9+MDCJmFZBGNIf5iHgeV34iBTU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVgjGJSR1tWuB6bqo2FEaoOlEvq8K67VtmO6aoqSSuQ=;
 b=Wb1cKASplpK4i/a/PL06QxcdFADvw5lklgCnN51S3mmksuxQNkXDuO4c2XGVoQnz48I+7TxjwmSxB1QieSHhIkjS2f6jmE5Uw78uJVEDeQTNrJMlS82ece97YKykyhC9tNh0tLCV/Je4wLcRmrkgIef3GGnV+c5WvT1czusBiSqsEeWzLQ/TxuU9ggbQ4n2wWpZzKUAMPM+NstXnZ/JoBSzly2IqKmGUgzoljFvpFo3WtcskxDYX+J16wLn1cQ1PPkr5hSGmCulM1zWaQkBDxLigg2WyHVfECz7KLBCaXc2chRR3k2BhEE6NEjcBDvo+wpsJXuwphHz411Fy/Rw6yQ==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by PSAPR02MB5111.apcprd02.prod.outlook.com (2603:1096:301:7a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Sat, 22 Jul
 2023 14:59:58 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 14:59:58 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Topic: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Index: 
 Adm6Zirrs9Te84mJRC+MJegq9PcmmAAAnvEAAAEeMFAAB62GgAAZFM4wAAbwU4AAABBCUABOJ/FBABmn1eA=
Date: Sat, 22 Jul 2023 14:59:58 +0000
Message-ID: 
 <TY2PR02MB3678D514BA802AA059CD5B08813CA@TY2PR02MB3678.apcprd02.prod.outlook.com>
References: 
 <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
 <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4P6NXH-7am1emePfWaZN43e58FsWe9_Rdj2_PdXD6b9RA@mail.gmail.com>
 <TY2PR02MB3678FC5D7379332D46E8A7EB813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <177395F667E9B0AB.1070@lists.openembedded.org>
 <1773AC7F6FA975DD.8172@lists.openembedded.org>
 <CADkTA4NhrE0idYrbLG5Jzuf3Eg-myKgvHnLJCCU81XWX0hbqZg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NhrE0idYrbLG5Jzuf3Eg-myKgvHnLJCCU81XWX0hbqZg@mail.gmail.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|PSAPR02MB5111:EE_
x-ms-office365-filtering-correlation-id: f2037b35-c481-40cd-feb6-08db8ac45102
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uOiFGm7OgpE6rltMaXGBJKtwRegOeFuHisiPhoROBqZcjcIqj6EEmtLRanmnMXuk58/x7GYWLGQOrpuZ3DbPDWcaFMkLPbtDWzMLRHFM2OLJEdV11ydcKQKV+oVBnv/yduvAC3NDWkwMxJZmllrbByTOh6kD6rA6BBpEA4tzyjS8OTSLzH40Y62pqPTTSrnyjxgl9kjFPAIUuGoOeMxMl3GOYbUjSZKiuVXrFxpNz5PXDbf/Je4od+Yncea6zPx2brQHtUdeS57dR75JskDydZ4yqUXMUEnfOiO4U3mWd9jxingkh/JY+KoNlQqT9CQRA/Rwkewuy0haQdyn5RvLpo8wx9Exrlkai2E7Xqbl9lmRj3435cv1FIt914fw7mdn5+VMn4C3bZYMoRuVEg5yAleg5eC/MCm71CSFZ5i4xdF/oj83GXtu6eJbaEtfnyWE5zL0Y+ZXFfuHEcyUMCHebNxduLDkdrMHu20heamQ7cMFm/eQ/TlxO7SvqmFjxXGdvtV4NxVT8Hegva8xfo7O9QscBdUr53oph75E2vquGxVMfs3fIqbvyuNWL0neXA2reKqH/K2/CWB+AeKtlUbreX9Ce9u92DJ+T2bNVSZaMKS8dK5lZRMFbDa4NSgRqojV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39850400004)(346002)(396003)(136003)(451199021)(122000001)(478600001)(86362001)(41300700001)(2906002)(5660300002)(44832011)(52536014)(8936002)(8676002)(6916009)(316002)(33656002)(4326008)(9686003)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(7696005)(26005)(6506007)(186003)(71200400001)(38100700002)(38070700005)(4744005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UlVDNjhWbXBRTjVMZWt2ZklzQWRYY1RxQm5iM1pxd3BmMlRNdHJOL2JzSlRI?=
 =?utf-8?B?R01pQjNkUHVhZGNtbjRReXljYm9BSlJzcDhsZGVsUWdOZktXaE9iSmdyZ1ky?=
 =?utf-8?B?Qmw1Z0VVZlRoRkQxL2xyUXFpVDZuYWpZQ3h6ZklVYnR6YU1td2Rua1FHNE5x?=
 =?utf-8?B?ZU1UTCtYNXEzOWE0cGhrZ3RkR0lQd2FJL0s5NXh2aDRwWnl6aW1Eemtqem83?=
 =?utf-8?B?MEs4Rnh3d091WFg5RlUzbXQ0cUt1SHFBR2xBcmZmMjVJMzE4VVcvK3FnbTlH?=
 =?utf-8?B?ajl5MHpISmV6NHBKei9JOFNZZ2piVVZpdDJoTEtrb2p1RWFyblc2aGxXWGFn?=
 =?utf-8?B?c2J3VXk5SkJFZUdBTGQ3NHVWS1Y2anptUTRuU3VnN0pUZUxpTHMxSk4wMkJO?=
 =?utf-8?B?YmFpTERsMTBTcjhWdnRXSldHWnRXeFF5TmFCZjE2M000aVNZRDRVVndwR096?=
 =?utf-8?B?M1BiZGs5S0JHN21rYjA0ZHVETERSRGE4WTVvQ1g4enR2QnNSTEprREdaUkRL?=
 =?utf-8?B?UXREQXV1bENhaHNlRDNiSERkZFlZZS8rQmdTa2VMdDBMZ01yYVhlQjN1VkRk?=
 =?utf-8?B?UHpUUlc0YzRFUVNlTWpIei9may8wUjJ5Z3ZYY2ZDL1NCYys2dzVoV0RGLzZn?=
 =?utf-8?B?YkxZYWhna2c4blNTeHBSUWxFaFpWUVdrQmR5UkpNMFlROGtGQndZdkxjZ1p5?=
 =?utf-8?B?RFgydGJHdHNsSEtHRVQxeUQ1R2NXRDh5NnFKMjIxTmhadk5zSmViMVBRVFFF?=
 =?utf-8?B?VEh1TTVzR1FSRFI1SVBUeHpnR2tRLzl6aGRGeUxUYkNTZWM3WUVqci82TzEw?=
 =?utf-8?B?M0pZa05XY2M2ZFgzTkVSb1JQMzhhMm9NSE1sd1MxTWxYTEh3V21XM3JpZDRr?=
 =?utf-8?B?RUFWM0xFRUorVnJ6cnU4d3J3eis4SDhtZGZjc3BVVU84azg3MGN3KzV6MlN6?=
 =?utf-8?B?OHViRjBYRGwvejlUcmRCMWNLWENDUVg0NVNtakRMcWI0Q01oTnRLRE14R2Jq?=
 =?utf-8?B?dDdRckNLOUpZbS9wQ1U1Q29yMXZSN2QxTmtDRGxJVUNaYzNrck5hUGFINGNn?=
 =?utf-8?B?dGtrN1R1cUxqcWVGWW1NWDFTWllaVnhNVFc3emZjMkcyV2ovU1A2VCt3eTVm?=
 =?utf-8?B?SkoxSERyenhJaEIwN2xqck1JV1BjSnU0SnByZlloV3JNaFRGblNXTG1nQUhI?=
 =?utf-8?B?M1AwNnQxQngxS21mWWdCOWM0MmJkalI1dW04eWFLYlBCa2k5K1UxSit2OFVx?=
 =?utf-8?B?R2ZjVms5SE1tVWlrTkh3STduaFpnQlFicm5WbzhFRURmY09WSmlTUXcvS2Er?=
 =?utf-8?B?MnI1L20yOFVCVnJ0S0N2bnliSXg3bWozdW1XSnRUc0lscGxseHByMHkyWXNh?=
 =?utf-8?B?Z1ZGSjEvL3IyMVJYcmcwV0kwM01ia0Rwb1FVL3krVFMrekhZOExmV3pmQ0J2?=
 =?utf-8?B?eFZKQnhrWGVWVGtsRnBodWF3amFXM0E0cmhEcGR5Z2FDTnU2aVdpRFBFNG9O?=
 =?utf-8?B?a0ZvNjUxZlB2UzFPZGRMUTEzSklNajViN3F4ZW04b2l0RFVqWWFTdk15Ujgv?=
 =?utf-8?B?bWFtOVNSTVBUeFlSMmNOY3lzOFE0bzJ0R2VCWGNUYWdidkJBZUdJc3VZaitp?=
 =?utf-8?B?dGpFNlpOeWJ6TGJoWjBCaEFmZEpJTS9UcWtLNkkya25nZFpPZ212Y2VSV3l6?=
 =?utf-8?B?OHNTTjhXVURZS3hhb05OdDJ3V3JQOEpmYlVvaXMwSFg3Z2FUR2VjQ3FpYkxp?=
 =?utf-8?B?Rk9qRTVmOFJFVTBPSHQyWHRRTlR2aG44MkRwOURRcWZzY3RySVAwclhLdUJh?=
 =?utf-8?B?cElydGFmR3lyUEJhNVQrdWsrcitNbi9hWklkUVg5TzgxK3BGd2pIb0hjRllj?=
 =?utf-8?B?MkRWQ3lBVU9UbEVBY1RYZFpSa2kzMjJ3aElUUVBGdzU4YlRpYXF3NDFyYU1p?=
 =?utf-8?B?bi9HWjlSRUhoZ3grd2s4cDlvSzF0c1pqN0ZyZ3dnZFozV2NiNVdpdFF4Ti9i?=
 =?utf-8?B?WE1na0pEVmlZL0lFZUZyV25ZUUNScVVVL0Rpb3BxalF5UlFjTTBSU1cwSG9y?=
 =?utf-8?B?amtWOWU1WlFGUDFCSHNZRXZqV0phcFArZVp2eitVTHZZVkplcHdMNEJhd2ow?=
 =?utf-8?Q?KjIP42/dPXTShfoeJxG7COX+K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2037b35-c481-40cd-feb6-08db8ac45102
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 14:59:58.0280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqihfo+uE7HmD42Ya2a+Vc8F99AP1Bt/jhtXHFMBGEibjCNgbgaBjB+s5BwSL3obtWLB/6ZCLOuKU7K4jhJ7Pu3hQTjEcZ8A9CnxoGfeuPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB5111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 15:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184722

PiA+ID4gSSdtIGNvbWluZyB1cCB3aXRoIHNvbWV0aGluZyB0aGF0IHdpbGwga2VlcCA2LjMrIHdv
cmtpbmcsIGFuZCBub3QNCj4gPiA+IGJyZWFrIG9sZGVyL2V4aXN0aW5nIHJlY2lwZXMuDQo+ID4g
Pg0KPiA+DQo+ID4gSSBoYXZlIGEgZml4IHVuZGVyIHRlc3QuIEknbSBqdXN0IHJ1bm5pbmcgaW50
byBhIGJpdCBvZiBzc3RhdGUNCj4gPiBvZGRpdGllcyB0aGF0IEkgbmVlZCB0byBzb3J0IG91dCEN
Cj4gDQo+IFRoZSBmaXJzdCBpdGVyYXRpb24gb2YgdGhlIGZpeCBpcyBvbiB0aGUgbGlzdC4NCj4g
DQo+IEFzIHlvdSBtZW50aW9uZWQgYW5kIFJpY2hhcmQgcmVtaW5kZWQgbWUsIHJhdGhlciB0aGFu
IGRvaW5nIHNvbWUgZnJhZ2lsZSBsb2dpYw0KPiB0byBtYWtlIHRoZSB2YXJpYWJsZSBjb25zaXN0
ZW50LCBJJ3ZlIGZvbGxvd2VkIHRoZSBsZWFkIG9mIHRoZSBhYml2ZXJzaW9uIGZpbGVzIGFuZA0K
PiB3ZSBhcmUgbm93IHNhdmluZyB0aGUgbG9jYWx2ZXJzaW9uIGluZm8gYXMgd2VsbC4NCg0KVGhh
bmsgeW91LiBJIGdhdmUgaXQgYSBzaG90IGFuZCB0aGUgcGF0Y2ggd29ya3MgZmluZSBmb3IgbWUu
DQoNCkNoZWVycywNClBldHINCg0K

