Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDAEC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:24:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web09.5218.1665649430862070336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Tbpw6INi;
 spf=pass (domain: siemens.com, ip: 40.107.22.85, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlR8P4NIYkHlb8LAsfTyTYmHX1jxjdFYecAQtXYDtrq+0Jf6IFKfBU80x08aSGktEgMY/kpNnzOxIG6omeO7sdE654QexTzrRa9GBJXxH3VwOlfasRF0i/Z+RNhwvSnZeF9BA73e3OMOO1bnVTKUlm8bhApIyH0s2nS/YWzQeLYgLos8n526yoNegLdEkbq/Aur/WaLiyH5jMbzsz0QXX6/J1KDcjz6w7XqLjd/gBi7EC6zSsy+ESJZT4ngcR2jLPv3/dOGa/TQPRNCDYCr17af+EZosJhmkEJvI6jdfUbO+aVgMsuUS+Mi8irzgvCMxFx26rH3je40dk9mySIF8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HOmDs20kceZN8HFHxK+nQmk/4DQ+7FHfGIJDm6eteM=;
 b=XLaFfczIwIcF/CxBW5Gym0VUAA+vPZ7DAG2gzYC462dyC3qSoWuKsvW7OnpssJIZzKWVWOuPi5LksXVq/eG5S2mId1MlHKYO4Yp2B+Z1xDDk1ljGK5GvoBTMMZQFU3+xK6/yh6+b+MyUkj5eiLe4ZtVA80NFQVHBl6UguH72uq05f1BYLGZcs22gnLON7UmPua6Q8b/MOJAubkTsMUUqDvlISKlJQmlnNPYoQEV45uCx8qpAn2DLAScpITPwzEMW5V0nWy9Xac4jL5QJRYhZMkmuJkcQHLi2myRSn/zEZLlvsRM/ZNA0EUs7flBY7MA4ISkCwnB9XPu9h+idHBog2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HOmDs20kceZN8HFHxK+nQmk/4DQ+7FHfGIJDm6eteM=;
 b=Tbpw6INis47c0MPjOPTQ0og5E6xQnBJFtoROuQa+dxbvpO83857ZsC1yRMttMJmfZIVvtVq4yu1TqugBlrnFyq+43OZDP/IgWHX+dJ1xDKlKOsf5M3uS5K+ImwbgllprjEAKFT9Sd/L4PoNtJLzLTCBO7KIKMZ//rHiuWXso8NbLcwtfnm0JqO9iIf2DSiYy8dG1vfNPa6iTZF2UbxwKHbQMwjOvQyT0KlIhDMzoQWE6lpwOfHDGDXx974sNMqpvcq15dncZmI4HEOnoOCa0pvNPJQq6YmfndL7rhlz4ZQsoYAU69Qv0xTU7vuX3KJ2lrihYzm/2Ot20vV8p+kZKSw==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by PAVPR10MB7380.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Thu, 13 Oct
 2022 08:23:47 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ce5a:cd74:6bba:9de5]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ce5a:cd74:6bba:9de5%7]) with mapi id 15.20.5709.021; Thu, 13 Oct 2022
 08:23:47 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>, "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: eSDK dependencies
Thread-Topic: eSDK dependencies
Thread-Index: AQHYiiIHc1CLXz+3xkuTnJctNcNK1g==
Date: Thu, 13 Oct 2022 08:23:47 +0000
Message-ID: <096e5f4224fa861c16c93a989f0c95169bb9771d.camel@siemens.com>
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
	 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
	 <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
	 <8afeea0dbf57ab08aade7ab3da3d66603b003bd9.camel@linuxfoundation.org>
In-Reply-To: 
 <8afeea0dbf57ab08aade7ab3da3d66603b003bd9.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|PAVPR10MB7380:EE_
x-ms-office365-filtering-correlation-id: 22ba7502-73c6-48c5-74a8-08daacf44060
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5OI+S+8KwZyx1jxAfFn0yzKe2Y08ioL2yTBsmFzuWL9dxXsrVqtTTPHZ4p9As6u+iVfosBflQByEtqtxBXcwzVCeYSXGieiznqEcWpDWR7iCXORvVUk8FQRlox93QKVja5T0WAe6rwbUgLQoOePbSiYe9bRnsiDSqiVr+5rKqJrQj1D1UwvDcTQbpb14/nf4VWUFtqrW39ddxyC7sKZSMyADBcga2pFWgbWh0HNkO4l8lbqqoFQLxlDJHns6zJbXQBiClo8x4H7TlWilUd+rvgemsztTBnKMcK++/9IzL1hqotXl0nHw17xxFD5DYjPRGi3zk2mvMR4PkA3UpLnY9FZEyf1Mzq2Wal0wc5tezyzC2qHW8QAk14iUcfDLjR2l1yHobyJ3IdEHIdPYE1HzcX+MEqk45NVTY3RrZmtEkrHssaHiKXgC7b8uMMf/d1VO4yyn8vAAo2EN+0Wc5k++68vRWlzx2c+G590pO4Z5T7+QHWxCSBJvK2WE/w76FNyqsu5AZnfQYD+2ouNik0WfaauaQUzSzZC4zV6CMFqHMP1AbwqOUS2ZUtf0h41X+dyH1cvALh6oywK/elTgD8kIekOaaG/7V+WxhAhvrHp7THcJv0VOFFiWLQ4BoQdcxPlopn64ikRDCfmYSGGZW/NoCt3FX5Uu6Bp8KqJd52q/HOm/XFKQ0G62Yr1r7h+HaSCEGRprY53XX08g4PfNJKbT9esiywq4rAn7hybQ3cHhfIQkkISR1TdaDJbENAuUsqvsb/YZ7RwQknaWCXJWQQpZN4cXHmrlLhddYUxwBremyFR2F8KjUADWy0n2eWFsaJrWlLwpPY/DrD4yGXBREEDs3g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(38070700005)(8676002)(186003)(82960400001)(107886003)(316002)(76116006)(66476007)(122000001)(83380400001)(4326008)(66946007)(91956017)(66556008)(6506007)(2616005)(26005)(54906003)(3480700007)(8936002)(6486002)(71200400001)(38100700002)(86362001)(110136005)(966005)(64756008)(478600001)(36756003)(66446008)(7116003)(41300700001)(5660300002)(6512007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WXpTdFJYa1JtVm02bG43a3B3T25uakp0Zmg2azB3cnF4Z3c3QXhBZXVHaHdT?=
 =?utf-8?B?eG1oUVpSS1RPcmpWT1hrL1RUU3ZOS3ZTV2ZLVkczUDI5eThWaUt0NSsydSt3?=
 =?utf-8?B?ODdHZnhzMkVGSVFMQ2xOSUZpV1hvVDNOZU9NU2lTVVpBSXIrVXNONE42cStk?=
 =?utf-8?B?TzN1Y05jbVZTRFhxTXp3NGxVZkJ2aVFqQkZYbldOMi92aUZEZ3d6RE1BMHlY?=
 =?utf-8?B?ZTJOSHpGR0RJU2RVWkNnY1JwWWk0K3l6Y09NbnNIWE9EUzRqUVJiK0F0eEhh?=
 =?utf-8?B?K1BaQlJXRHBkZlBoSHNXTXkvQ3pnMDNWY2wzVnpVZEw2Vjhia1l0ZWJLRjEz?=
 =?utf-8?B?aTUzd25saFdBMXpINFZDaG13MHczcW14clpyNFZOVkUrT0ZhUTNSaTlEODMy?=
 =?utf-8?B?VVVOUUhBR2s1elFxeEFtd0xTS2E3MFo1QTM5Tk1pVkJRczRrVkgxNXdUUmlJ?=
 =?utf-8?B?aHprRUUxRVhMbWpWQ3EvVlZYZldqd2JPMDJlLytLbDNGOTllWkZHSCtHdkRw?=
 =?utf-8?B?cWM5UXlZMXJpaEFyMDg0MHA2eU9lVmw4MjRFbmtDYjI0MnlMTHBwUGRqVkhZ?=
 =?utf-8?B?ckp1amY1dW9vMXBuSUIwZkdkRUdyQzZ6Q1pvaHpoOWcwSWhVdXRoVFcyd3kw?=
 =?utf-8?B?ZE13OGs1cGo4RFRmNkZldnVvZUJqTjFwcjNQMThmZC85WE1VWkM5bTZRZ1lu?=
 =?utf-8?B?ZnZVZWdleC9iVWwyaGpIZG45aHd5aXJBMlJlVHlkU2NEWXdTR0l5Zi9IR25S?=
 =?utf-8?B?VlpvYXd6RzBOeVZPRkZ1RWR6RVBkTnpETXB2TFFkUWNWMTBhR2xEa2JuWWdi?=
 =?utf-8?B?OFZZMnZBZlprMUI2cHd6WndGUSt6WlEyZHdrUUovMkRxUk9ZQU5sSE05VGQz?=
 =?utf-8?B?TklMc2x5ekJsbUJIK3gzM3dCMDkwNktMQy80RFAzdGE2QU8zaFQrcCtvN1li?=
 =?utf-8?B?OUxNQUY2U1NhQTFsUjFUMytjSFJlQnVRMGFhVjZyUHBObG9iNVExUVN0S1Az?=
 =?utf-8?B?dXczTzM2QmZ1YnV1ZkcvL2RuR1QrNkRRemJPc0cwdTR6SjI5TDlBU2FSQlVD?=
 =?utf-8?B?RHhoMEZEdktzSHBYcXhOQjJndFZDK2w4dGVEQXg4T2hsaHBGaklmM0RNK3dO?=
 =?utf-8?B?Y3FNMWpPbFhENm9yWUFvR1BFMXhCMW1CK0FhTER4WU9BSEM3SnFzNWw5Yllw?=
 =?utf-8?B?Y3hrNjg0Z1kvc0tFRlkyRDNpNVFJNVhySHEraTVGM0RtV0t4b2tiTEVRUGx4?=
 =?utf-8?B?aVYxT0o2bWFlblc3VW50b3Zsb1B1SVAyWjVpSzFvc2IwZER5ZEpaTjFQRE55?=
 =?utf-8?B?M1RPbU1iUXZYMjFHNzFHaVp2ZTJaOE9YS3pvbWlwYmRKdHRUeS95Zm1WUTVO?=
 =?utf-8?B?VkVQVlIrU1JrRkZNeUdxQlZ4ZVZsUnU4WWZYRXovRHVPMkg1TEUvc1RSeU94?=
 =?utf-8?B?OUNYZ3p4MUdhVEo4YkRnYnA5NkNrWWQwQktKdjlCc0pPb1VURncvamNkeVlj?=
 =?utf-8?B?bUhGQVd1d0RDR3BKMTZMV2ZlRmxHN2FQZEZTYkcrKzQ4aWhsNnpva1ZucWpZ?=
 =?utf-8?B?bFBtYlNUK2dKYmp1R1ZNb2RORUhQRW1tVFY1S0pxVXM3VnJ2eDAvUVdYbnVL?=
 =?utf-8?B?TkVYSkVPYmM3c2hIWnZrNm1OQW1QdEVpZmlWcDlnOGJ4a0FjNDFxSHMxS0Fw?=
 =?utf-8?B?OUt0VHpNWVBhQWRuUmluQmxrcDFtQUh6NUw1L0NxbW11WExOeCtzNUxiRGgz?=
 =?utf-8?B?WWMyTktOWXZ0TUlCNGRYeUxwSzNVbjVOL093Vkt4NUhTVWNNc1JiS3doeS9G?=
 =?utf-8?B?YzVMeDZjZTFmc1NMa0VvaFI0Q0JHRm53Z2JDWWJmaWpwajRBQmFyU1Y1T1Fw?=
 =?utf-8?B?QjJQa21yNy9zZ01LeEpGK0MySXdabVVBRVo5QTBMYnB6M3RnZHpVZ2xXSHRy?=
 =?utf-8?B?d1psalZvTW1LbE1TSDcvYytsNWwzMWsvMERLM2prN01kZ3RpZDJmeHFkM25H?=
 =?utf-8?B?ck9QeTZqNUcwenNrWEJvZlZ3T3d1S1hlTitEYUVTSlRuaERtWWlXbDc0SFRW?=
 =?utf-8?B?bEc2dDB1b1RMbVlzK3NzOUVaa053RTZoakI3VDlHTkJQc0VEQk9UbXEvYUxX?=
 =?utf-8?B?M2ZSeFFBUWVGYld6aUp3bmZoMU9XNDNSMVhlSzZGWVZDWXNFcXBtV1M1Y1hl?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76413A39197992409AF3AA8115D04ABC@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ba7502-73c6-48c5-74a8-08daacf44060
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 08:23:47.7783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/4708Q7C2YTPF0TY1PrjSI8hefDe6PzVlDozBP+lw2nc5mas1xwgAdHKQ4967noAhMMCROWFXiOTHYoir7v5HZmzXQE8psYdtWVSKgQrmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171690

SGVsbG8gYWdhaW4sDQoNCkkgaGFkIHNvbWUgdGltZSBhbmQgbWFkZSBzb21lIG1vcmUgdGVzdGlu
Zy4NCg0KTG9va3MgbGlrZSwgdGhhdCB0aGUgcHJvYmxlbWF0aWMgY29tbWl0cyBhcmUgaGVyZToN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0
LzQxZDdmMWFhMmNjOWVmNWRiYTRkYjM4NDM1NDAyZDRjOWMwYTYzZTENCmh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0LzZlMmNiZmM1NjFkYWM4
OWJmOTE4M2QyNGQ5MGU1MmY3ZDkxMTc4MjYNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRk
ZWQvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0LzAzMGQ1NmUyZThlY2U5MzQ3MmFkYzUxZmU0Njcy
MjFkODQ2YzlhYzANCg0KTWVhbnMsIHRoYXQgcmVjdXJzaXZlIGRvX2J1aWxkIHRhc2sgaXMgbm90
IGJlaW5nIGV4ZWN1dGVkIG9uIGltYWdlDQpsZXZlbCBhbnltb3JlLiBBZnRlciByZS1jcmVhdGlu
Zy9hZGRpbmcgdGhlIG1ldGEgY2xhc3MgYW5kIGluaGVyaXRpbmcNCml0IGluIHBvcHVsYXRlX3Nk
a19iYXNlLCB0aGUgaW1hZ2Ugbm93IGNvbnRhaW5zIGFsbCB0aGUgbWlzc2luZyBkZXBzLg0KDQpJ
IHRyaWVkIHRvIGV4ZWN1dGUgdGhlICJiaXRiYWtlIG15LWltYWdlIC1jIHBvcHVsYXRlX3Nka19l
eHQgLS1ydW5hbGwNCmJ1aWxkIiwgYnV0ICItLXJ1bmFsbCIgZGVzdHJveWVkIHRoZSBwb3B1bGF0
ZV9zZGtfZXh0IHRhc2ssIHNvIGluIHRoaXMNCmNhc2UgaXMgdW51c2FibGUuDQoNClNvIHdoYXQn
cyB0aGUgcmlnaHQgd2F5IHRvIGdldCBpdCB3b3JraW5nIGFnYWluPw0KDQpSZWdhcmRzLA0KQW5k
cmVqDQoNCk9uIFR1ZSwgMjAyMi0wNi0yOCBhdCAxMToxNiArMDEwMCwgUmljaGFyZCBQdXJkaWUg
d3JvdGU6DQo+IE9uIFR1ZSwgMjAyMi0wNi0yOCBhdCAwNzo1NSArMDAwMCwgVmFsZWssIEFuZHJl
aiB3cm90ZToNCj4gPiBIZWxsbyBSaWNoYXJkIGFuZCBBbGV4LA0KPiA+IA0KPiA+IFJpY2hhcmQ6
DQo+ID4gV2UgdHJpZWQgdG8gcmV2ZXJ0IHRoZSBjb21taXRzIHdoaWNoIHlvdSBtZW50aW9uZWQg
YW5kIGl0IGRpZG4ndA0KPiA+IHdvcmsuDQo+ID4gDQo+ID4gQWxleDoNCj4gPiBZZXMsIGlzIGZ1
bGx5IHJlcHJvZHVjaWJsZSBvbiBsYXRlc3QgbWFzdGVyLg0KPiA+IA0KPiA+IGJpdGJha2UgY29y
ZS1pbWFnZS1taW5pbWFsIC1jIHBvcHVsYXRlX3Nka19leHQNCj4gPiANCj4gPiBlU0RLIGluc3Rh
bGxlZCB2aWE6IHBva3ktZ2xpYmMteDg2XzY0LWNvcmUtaW1hZ2UtbWluaW1hbC0NCj4gPiBjb3J0
ZXhhMTV0MmhmLQ0KPiA+IG5lb24tcWVtdWFybS10b29sY2hhaW4tZXh0LTQuMStzbmFwc2hvdC5z
aA0KPiA+IA0KPiA+IC4gZW52aXJvbm1lbnQtc2V0dXAtY29ydGV4YTE1dDJoZi1uZW9uLXBva3kt
bGludXgtZ251ZWFiaQ0KPiA+IGRldnRvb2wgbW9kaWZ5IGJ1c3lib3gNCj4gPiANCj4gPiBTc3Rh
dGUgc3VtbWFyeTogV2FudGVkIDE0IExvY2FsIDAgTWlycm9ycyAwIE1pc3NlZCAxNCBDdXJyZW50
IDYgKDAlDQo+ID4gbWF0Y2gsIDMwJSBjb21wbGV0ZSkNCj4gPiANCj4gPiBTbyBpdCBzdGFydGVk
IGEgY29tcGlsYXRpb24gb2YgbWlzc2luZyBjb21wb25lbnRzLiBXZSBhcmUgYXNzdW1pbmcsDQo+
ID4gdGhhdCBlU0RLIHdpbGwgaW5jbHVkZSBhbGwgYnVpbGQgZGVwcyBmb3IgYWxsIGNvbXBvbmVu
dHMgaW4gdGhlIGltYWdlDQo+ID4gYW5kIG5vdCBqdXN0IGEgZGVwcyBmb3IgaW1hZ2UgaXRzZWxm
Lg0KPiANCj4gT2suIFRvIGNvbmZpcm0sIFNES19FWFRfVFlQRSBpcyBzZXQgdG8gZnVsbCBpbiBi
b3RoIGNhc2VzPyBDb3VsZCB5b3UNCj4gc2hhcmUgdGhlIGxvY2tlZC1zaWdzLmluYyBmaWxlIGZy
b20gYm90aD8gSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCBpZiB0aGUNCj4gdG9vbHMgYXJlIHRoZXJl
IGJ1dCBub3QgYmVpbmcgdXNlZCBvciB3aGV0aGVyIHRoZXkncmUgcmVhbGx5IG5vdCB0aGVyZQ0K
PiBhdCBhbGwuIElzIHRoZXJlIG11Y2ggb2YgYSBzaXplIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
dHdvIGVTREtzPw0KPiANCj4gSSBzdXNwZWN0IHNvbWUga2luZCBvZiBiaXNlY3Rpb24gdG8gdHJh
Y2sgZG93biB0aGUgY2hhbmdlIGNhdXNpbmcgdGhlDQo+IGlzc3VlIHdpbGwgYmUgbmVjZXNzYXJ5
IHVuZm9ydHVuYXRlbHkgYnV0IGF0IGxlYXN0IHRoYXQgdGVzdCBjYXNlIGlzDQo+IHJlbGF0aXZl
bHkgc3RyYWlnaHRmb3J3YXJkLi4uDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0K
DQo=

