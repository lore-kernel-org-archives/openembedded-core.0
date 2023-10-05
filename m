Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612E5E93705
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 11:02:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web10.12500.1696503760222965474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 04:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=VH4Z0thB;
 spf=pass (domain: nedap.com, ip: 40.107.21.132, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msRJK35JNaZlmYhk+YmGvo3FEGtxjygktgeJmsgAxW+3tD+MCpZZnKdpraY2pVxvyc/aLDFeJn6TOc1aB1EbkwZaRqd3NcLugbxCxKDlpHlIuXJChgArHB52TXiac/ZMNWRLmtcGr2ooOsMBw0HbDePMf2tWc8IZSn0sNovEamh0vHVIVmZ+RL55qB626CD4Htk83lolaXpPzVR83fclvqWXKE5imrvp8X07dc51YUCyJ2v/QcKFuvEWYLPJZjKYBZwxFxUSwJMLGUexH65HTACXdEVom0d1P0OJobD6IaH2bPP1mmtlCPQzOZruA2EqCq6fGuX18z0SJ0SWhQ8ttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kuc82N4NJH0SfhoXxpFE8cZz0zHpGxmnlQOwn1QmMuk=;
 b=YlXHACH3ZLRskaZLvhDUfphv/f1so4CIl/XqE45jbeurP9iwfA7vrn7ErXbzfcgJj4g1cOHezSvUfSshePnTvu5Ze72tauPdWiUJZZdRT4przCNS9g8JFiKtkN2vgSFtZOhk3kwcw9yHD4kfRpPVVPZskMu5tlWknGUuZx7TfVfJsnHW6/BDu73iPH/aqCpgMJXD4B65Ov2nfo79zkvjGDk7ZBsn/c+iFBLqCnGQ7NH7Bzuy4MSsJ4Yxn1S7VmzP58CSvZlmIMJHphHJrBp1LdzGurRDhvyLY/ZEg5EtsQ9PUfrvcGmPeb8SWHAgHc/WrTTNYKoZArq7mEiJ+zKxaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kuc82N4NJH0SfhoXxpFE8cZz0zHpGxmnlQOwn1QmMuk=;
 b=VH4Z0thB0xVsfFr3HNzQym4ot5Gcd3JUwRzTUfG8XJk/b7evCSv808ERuMPFmz5ThwaR4xh8wHFR8TQQ+m/J6AFyxmmukY1cJGY8p8/C32hyBUNvnQwkH0BmhvmVJ6TjdC7I1TFfiExjklFjI4mTD+8AxJQbW9O0ftgM/b0Yz/E=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by VE1PR10MB3821.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 11:02:36 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::887b:c4d7:be56:734d]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::887b:c4d7:be56:734d%5]) with mapi id 15.20.6813.017; Thu, 5 Oct 2023
 11:02:36 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC] scripts/oe-setup-layers: Allow setup using
 branches instead of fixed revisions
Thread-Topic: [OE-core] [RFC] scripts/oe-setup-layers: Allow setup using
 branches instead of fixed revisions
Thread-Index: AQHZ9tDWcm3WeIPcaUy/6lZQlY1VWrA67coAgAAaMVA=
Date: Thu, 5 Oct 2023 11:02:36 +0000
Message-ID: 
 <VI1PR10MB318209662821A2B4E5F10C12F7CAA@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20231004144106.1577-1-jermain.horsman@nedap.com>
 <CANNYZj-tS36SKm6ss046Yf8NTcznJrtx3FAMkJ6w8sQs-pcKJw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-tS36SKm6ss046Yf8NTcznJrtx3FAMkJ6w8sQs-pcKJw@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|VE1PR10MB3821:EE_
x-ms-office365-filtering-correlation-id: ac0dab4f-60e8-49b2-fed9-08dbc5929587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2K7E8+3U7AKb4HZw0H+LS4q0NEFfwA0CKAnp+0TvXCcW5+zw98wQQi+bM26HC6zlQ5zNRbRL1GDSQQI+cRc9fjcTspUBaWB1slrJHccn4s/Jq6f844XXR7Zx6b0mpN9vPOY4rv1BA67m7L7l2SiuvMub1L3GFCUzr6ccSzFT1IJL8ViOwGckgRfXNG8PT2CI8jim2ri9miJBKuZy6mWa/dkLGjdag5ouk6z7YqaQ0wFgxGCNaSWgKYVacbObsVJNJPOM1ddWp5JmjiyWu3HGes3p/+bL2teGuouNLPfhu4Es435jUcLN958oXveYhdRL1Lr6iNeqUMXHawrHFF0TTV25mm604QBwawyna63PvDOr9T+hSUkCYEXrlwj9QqKIzHOQVnuMfUP2Z9muKPdJuzsMvrjcqOu2CzOYVOML+SDAaoFpxtKscg1KdUNn+iBXGm8p8F0v7Qor6het/IoLSnUpj57kFwdq8guvcUs6Ky2PHHel7TqO8TN5SGhsti50zJ009RuWZQYofquJdsP0zYPW2x9DHwyr1tcmYgsgc7qn6IRmyLeNV5JD3XHWq7gs0pVqLrQunmjG/7MIax9mtW1yTa8MbtuqmOPmT9J+uniEtIFbLL0QRkUHebzfRT8K
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(39850400004)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(5660300002)(316002)(41300700001)(44832011)(52536014)(6916009)(76116006)(66556008)(66446008)(66476007)(64756008)(66946007)(71200400001)(55016003)(26005)(478600001)(7696005)(9686003)(6506007)(8936002)(4326008)(66899024)(8676002)(2906002)(4744005)(122000001)(38100700002)(33656002)(38070700005)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d0E3WFVvdnN4bko3VUgxdXhndkRmOVhYRTRWOEFHSWRHQ1p0dGw1cGFDOVQw?=
 =?utf-8?B?cnhpeTBOTHgwTWZKSUlWdEtaL0o4ZEJadEVENi9aQjRXSjJkZW5CcnozVEpR?=
 =?utf-8?B?TFEvSUlSZk12S2taNGo4dWU3eU15QXBSY2MwaGVWaDZBODNVL1pkVkdVSUl6?=
 =?utf-8?B?VUI2UTZXN2VmemdMY1pkK1czMmFMNEdHMGF6MldlK3ROQWtyVGJQRmxucHhq?=
 =?utf-8?B?UU03RjBSOVlCT3o0ekNybGVBSGdJUjF0UDFWcVVHd1V5R0tHODdyYjArampt?=
 =?utf-8?B?clcyenFLbUxoQXdjZUtFV0tZWTllY3NneE9OMHVkSTVadGcvRTRoVEVJMWxv?=
 =?utf-8?B?anZmWjJlUjg1d05ad0VtSUZ2WGFxbm5SSGxBSTZRSDd3RERkb3Vhd2JHNE5Y?=
 =?utf-8?B?dFQ2Uy9lTHJ5WFY0Q3g1NHkyYmUvRXlxOGRoVWs1ajNNTElVdlluS1BhS05P?=
 =?utf-8?B?Unl1TkphbkFDTFpWRll0aVVsVmVsd0dDSEg1OWFmRGYxbmsxa01teVJNMU1M?=
 =?utf-8?B?S0lkZVRkM2pWOEcrSEIycytuc2dPVG5ROFNWT3N0bmxyb0N0OHpBMHJtZnYw?=
 =?utf-8?B?VkFONklkWUtOdnBlUTd4VnV5V09wb1VqMndrc2t6aVM3SGozUkN4bDBoQXYr?=
 =?utf-8?B?MGR2VXhOWUlrQ3ZWMVRRd1Uyb3BkUVRHdjJ0YWdSNzZxcFRxMFUvTTlEMEJ4?=
 =?utf-8?B?SXFDSnFVYWRnaWNrNXFVdjJMeTBxdUg5Q3BoY3YyNlgxVUU5NlUyVDNnbDNp?=
 =?utf-8?B?a0R5VVdpT3lvVjZ4YldmbGlKV1ZWbjdJdE85L3ZhOGNvMjhYb2lmeTZNaTVr?=
 =?utf-8?B?RmtyaExlKzRMZTBKWEI2RXQwR2pnRjJFamNIRE9EN1RmYzRPUlg0eTJ0UXJk?=
 =?utf-8?B?cHdPdFZRMVQ4SE8yM1RYd3JvQVhWY09tdGRyMS9acUdUK2NCRHc5MTFSbEJt?=
 =?utf-8?B?Tlp4ZWR3UGRYL2QyNVMvTFZaU2xTM0dVN2ZKdHRvUWkxRnA5V2xmWVpTK245?=
 =?utf-8?B?cFkyMUhDZVMzY3g0dkJQMU1RNlJNOEpwT0VoRk93YXBMOFduVGZRK0c0VjlZ?=
 =?utf-8?B?dVIyaFhBNHRTQjRIVlJzOEUvT2ZYeXo4ajRzcHRnd1Y3T21RNFNkcEx4WHNq?=
 =?utf-8?B?TzJzcXhuejI1aS9RbHUrZ080L0s2N3NIU1kxOUxWTTkyUmR0RkVLVFVMY2JH?=
 =?utf-8?B?bURNSzNVRXpQYWxjSkVMRHBtdFQ5RWZLcTZsL1RBZmsyclNLV1pZQUU1MENG?=
 =?utf-8?B?Q3V4ZGdlMktqUWU3S2FXMWpHa0pYY2dQNzRDTllMbE5KNlN0OVR6WVB3a1hS?=
 =?utf-8?B?c04vakdWcURmNFM2SVRnWUJod0c4WjFBVE1HYnF2UC9TVEcvQ1Z4bHB0enk1?=
 =?utf-8?B?UDlVZ2N1QmZjbEtBWEUvbTNJdzJxSVJzK3RLK0FmRnY5bzVlR0NHT2xuZGxJ?=
 =?utf-8?B?VmlxUUY3YWZIcEpxcVBpd2krZmoxN28zN3RGTjV3VkpXQ3hpUlpTZVJRc1NS?=
 =?utf-8?B?d0JocWxYQ3ZsMUUvSkZWMnMwZ2FjU2p2ZDBUZTBDNitqV0tvRi9NVnIxS1Vm?=
 =?utf-8?B?YWMwVncwOW1pRTFsVktjd1pySmNmekQ5N01VU01ON3ZrNDhWWVJsc3Viek1E?=
 =?utf-8?B?dk90c0hyU2lFRk9GYlp2R1oyV1hhbldIVjhtSmxCZWQxYThvdVkvN252S0cv?=
 =?utf-8?B?K2hJNTA0UEdGdzhQVkF3RGxYYnc2NWNsalVBMXB6V25OQmVGdHdFSlVzWEs5?=
 =?utf-8?B?eTh2RG54U0tRU2RmSmpvVlA3eTkxajJRSENRUENucGFJTlFLV1R1RWtVVFJX?=
 =?utf-8?B?RUpoU0tzV01vVkVqd0tGN1ZUYUNSMlRleTluaFlxTWh4REtienphOTdLYTFt?=
 =?utf-8?B?YkFtRW1SQWs5bTcxQXQ0cjZjbTRtVWQxSXRNVll4T0p2VlFhTlFTVDY5N2R2?=
 =?utf-8?B?N1A5K0ZRZUtPNXVhQkIwd0lBcWNIYktwQU1WcWV1eVNzWTNDODJZUlowWFBs?=
 =?utf-8?B?ekdDUVpWb0kzblNnMGZTcWV5THZjZzJtRHBkNlJ3eG8wMEVVOCtPbFdZdzZ3?=
 =?utf-8?B?WFd3VUh2SjFncTBlTit4SkxPbWxUWGtJMnBETFVXSUlYZHBmS2hIK2Ficjkv?=
 =?utf-8?Q?dleaDC7kpJoeSaSOI3NXRiq4e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0dab4f-60e8-49b2-fed9-08dbc5929587
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 11:02:36.7235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t46SPty0ksVhT7L1IakQkSpkGOghXf29DS9QiMxTnHo1rn9tJXJqdELz8Kip8zrfE5Dn5uZkNSaTBPHHGkAQj382b8Jd8m7+uR9ps+cOrhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3821
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 11:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188716

SSB3YXMgbW9zdGx5IGxvb2tpbmcgZm9yIHNvbWUgcXVpY2sgZmVlZGJhY2ssDQpBcyBhIHByb29m
IG9mIGNvbmNlcHQsIHRoaXMgd2FzIGVhc2lseSBlbm91Z2ggdGVzdGFibGUgb24gbXkgZW5kLg0K
SG93ZXZlciBiZWZvcmUgc3BlbmRpbmcgdG9vIG11Y2ggdGltZSBvbiB0aGUgYWN0dWFsIGltcGxl
bWVudGF0aW9uLA0KSSB3YW50ZWQgdG8ga25vdyBpZiB0aGlzIHdhcyByb3VnaGx5IHRoZSByaWdo
dCBkaXJlY3Rpb24uDQoNClNpbmNlcmVseSwNCg0KSmVybWFpbiBIb3JzbWFuDQoNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDUsIDIwMjMgMTE6MjQgQU0N
Cg0KVGhpcyBsb29rcyByb3VnaGx5IGNvcnJlY3QsIGJ1dCBpdCBuZWVkcyB0byBiZSBhZGRyZXNz
ZWQgZnJvbSB0aGUNCm90aGVyIGVuZCBmaXJzdC4gSWYganNvbidzIHNjaGVtYSBhbmQgY29uZm9y
bWFuY2UgdGVzdHMgc2hvdWxkIGJlDQp1cGRhdGVkLCB0aGVuIHRob3NlIHNob3VsZCBiZSBvZmZl
cmVkIGZvciByZXZpZXcgZmlyc3QsIGFuZCBub3QgY29kZQ0KdGhhdCBtYWtlcyB1c2Ugb2YgdGhv
c2UgY2hhbmdlcy4NCg0KQWxleA0K

