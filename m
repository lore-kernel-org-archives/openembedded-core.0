Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA85CC001DF
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 17:16:25 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web11.30196.1690132582090983584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 10:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=luz4Y/w7;
 spf=pass (domain: siemens.com, ip: 40.107.104.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCGEQeFc2BZeesxBGa1rWweADkAA8XNC9ALqRhXg37ISEjrFKCPlCzuPYz2gCPP+RzArRYYaz0fqSjh2bObhs7WbV3DtYvvqhT0Y4i6xXxYU0/BBkp7wweXTDJkEJr+MyghbAXDteZCzSJPkQg5obcwGeu17B2ku4qRFmv7B0pNiMc0wWd29hqKAvXmhZU0wWWjMXPvEgMcFAUAZGTiYGke4ht+WgWLsCOSd8jRRDysxo55PuDHis604ytsyVz5f7PDkwdF6T+dDEOYbVfJnob9QFT46Cz2WDeLFApTbGpNs6xpW/aCWAbyM7MM6n8EG6Cc8xmVNGW153/QS67cSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44uFA8w+jv96XZlG8K560Wcqjn1TFPLn78hnRUuzOtc=;
 b=P4mXcr8WQKQkszil/zMfdEs6Lszox5ajpH53muQ+oscMX3UceYM5JRQlnIOxdefrmg8LTs5kMiJ509j3A8HxMVo7FbuoWOwgnJiKKbgG8kbd3Za6enUA2qcLAKvdqDWOHCcXTyo0+/SnRXqhTkS7tapY6A2P8lXwpeNlZ00U0aVjSayACIz5TTVZ5i6G0xmVazNCUKm6V5Y8m8trKGkZziBQclnRXdjsEXZSV7sx/i/kedxb6H5jPXH10vrAibbH1oGZfxGMLo5aIkSfM0tFb4Rzhnk1MAqwx3VI/dnYA/O/KB3V1Tlwmy63FjMix/d3sAXFKDhcnXbrVirKPts8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44uFA8w+jv96XZlG8K560Wcqjn1TFPLn78hnRUuzOtc=;
 b=luz4Y/w7hfSgmKFEd93qjAtkY0FZ9ZljJdirmSfHc+gD7sOD22BZsZrW+VhKtMeNzzUzgww8oX18fZFCHmmfzZpg7X+l3CiEbivsY+yC2ozrCdqgddZ4cjQqzfJsZc7rZWJY+ZitZgc3gbwHM7k4x13oWwS+MfQSsLcXVowlIoM/60s6jcGrbcThNfCMtjFNPhWRxRS/UhO+M53pSgFeZaCk1l/kbc0JpbzgNQ4c060Vcjf2C7rbMk6LObBre3mmoNXk5UeFVfaIK+kXMB/CozfL5f6Nv7Di0xl0WG0jsM3TPn6tZAjtAgH7NuiRdnheS0KWY725eGobl0ZkBjIF5g==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by PR3PR10MB3803.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Sun, 23 Jul
 2023 17:16:19 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::144a:8e1c:787c:161b]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::144a:8e1c:787c:161b%5]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 17:16:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "sakoman@gmail.com" <sakoman@gmail.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [OE-core] OE-core CVE metrics for master on Sun 23 Jul 2023
Thread-Topic: [OE-core] OE-core CVE metrics for master on Sun 23 Jul 2023
Thread-Index: AQHZvXIWFSQoJvwk40SzsFlF8r/hRK/Hl5YA
Date: Sun, 23 Jul 2023 17:16:18 +0000
Message-ID: 
 <PA4PR10MB570783B0A328B33F0FEB0A53FD3DA@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CAGDS+nmXrjBwCKXoO0GgC6poO-sxFNpK6iJ16_sUptDV9eFPig@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nmXrjBwCKXoO0GgC6poO-sxFNpK6iJ16_sUptDV9eFPig@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-07-23T17:16:17Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=86220c63-962f-48da-b22c-84accab4e41b;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|PR3PR10MB3803:EE_
x-ms-office365-filtering-correlation-id: 39907884-73ff-4570-c8c8-08db8ba08766
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vstVDybJZxfMxHSVQ6LO4RyHL7dbh8YV1FEOSeWI58t5yHznKLFDxmWHIq1GP2ABRNwEhXnuhRnG8nOoIMf1+V3mzpg9VmQMXjxLWv424A/73fT9EqcjAAw+NEMJiLwoGJZ1uFbogG8MyVBBo3Z292o4LvkqcvgBtqbEJlXpbHZa8JfNkxAfWrGjS0G8+XEozgUUsbvYp9os8N5IxBcd0r4G/KPlTRBUcxgkV1z4VEn+mz0FUXoaSUjt87mNYeLyiW/zQhRCS/kfA1o4f0pfLNGiUXKMuZUa128TFmvDQ7MgfItWEtY/wVmyyKlebu+RToXRnZr9R9axxo6pq5Rob3PMbyN1LX/Y9HZ+lNpTGObIIHOsss6jHizkTurxpgLdFBmW0YOOJ2it3mR1TDzAiKjxJAqW6pduoZe0q5EPpMsPpbyLOtwY+fQ40XgZXHqQ95ecwSbkyP7vTSzBZGSX53e8WL1gp/EGrxLR2HYSbSUbb5HFxXt5u5hS8/TnzYPE0usyyuJB1TkcA8h+Cb/Gc4LqUAJEvlavh2k914gLDEGg0ftPkcqpfbMxZ3zCcoZIO0vxHrpNEvRqJ2hJqn6KS+ZFRr9ETu5BssNJWSxllNE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(966005)(7696005)(478600001)(71200400001)(9686003)(110136005)(55236004)(53546011)(186003)(6506007)(26005)(2906002)(316002)(76116006)(41300700001)(66946007)(66476007)(66556008)(64756008)(52536014)(5660300002)(8676002)(8936002)(66446008)(38100700002)(82960400001)(122000001)(33656002)(38070700005)(86362001)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aW5GWktJbWFLeml3UHdWSmhNUGVXbDdIVktFQXFOaUxNZExKVzYwTjU5WVhm?=
 =?utf-8?B?QWNpZnovT1BsVkIrdmVLdHRONVQrcTJRcm5ReklYT012NW85ZjV6WDEydE9m?=
 =?utf-8?B?T2VWZ0N3ckxsYkFCMVE2SnViUG1pUmdKaXBTNUtYY1N6K2Y0Y3BnTG90WmZY?=
 =?utf-8?B?eXd6cWlITVFQcTVMeWZ2M1JEWC9LRkt5MXZYOVlZUm1mSlhGOWh1RHU5SXBS?=
 =?utf-8?B?SXBBZ1ZuU2NkZERESVltUmRwa0lsdUE2K1VWclF3VDcxcVUzMitQelR0ZUJw?=
 =?utf-8?B?eGpMdUdCTkk5aXdjNnh1Z294N1lBTmZ1UUU4c3kxaXg3cUJrRFprbTIwZkE2?=
 =?utf-8?B?dnkvQ0JFd3BYd0Y4Qlpwa0o4d2RDUEI5SloraWdNK2lld1hXbTU0L1BBeG5P?=
 =?utf-8?B?a3YrWElxcHpUYW45clJmNmM0NGt6cUFla0pINXc5cktJK2lEbmpieTdieXJk?=
 =?utf-8?B?MzhjMVJIQlI4NDFUcFlvQ0dlazcyYXNmWmc2Qm5IQmRTYm5mb0E1YU1CUkZ1?=
 =?utf-8?B?TWRJdkdmR3pTWnVEaDg5YXNjZlNSNzludEZMczRVdUFmSndZcmpEbmdYa1l1?=
 =?utf-8?B?dkJNUk5IMmFVNE44K0puaS92UlpjSEtDN2ROd2Z4TU9qQ2ZqTGtEOTZJVzdW?=
 =?utf-8?B?NC9jbnErbXduSTJ0VFFIUFNwSkdFN2ZuZ1RobTIxWm1DbGYycWdlNk9YdmdR?=
 =?utf-8?B?OTNjclU5UFZIeGZlNmhMUFcxWEE4RG9LZmZrTkY3ZU1JNHdJZ1dtMHJZck9U?=
 =?utf-8?B?cHRSZHIzUUU3OHhlOVAyclNIcEVmb2ZISEd2ajdjaHBiQXpMaFV6c3JFbGdy?=
 =?utf-8?B?c29IRkpSMlI4U3hGelN1bjRVYVkvalhPQlFCcXQxTS9zMStsSEtLeU9OcDZV?=
 =?utf-8?B?WUE2bzhMaFFibnF0UEZCb0J2TTkyN2pqR2Z1b2FjUlVGcWhaWWIvSGRMM1Bv?=
 =?utf-8?B?dmNMMXY1UW9JMm1rbU9Va3FHdEhSQmlReGNzYmVucDJGeko0dS92MFZOcm1p?=
 =?utf-8?B?VnF3K2lkaSthZnJVdzhRTmxRS3dZRHoxTTR0dXdidjQrYXkvM05mcFRHNjEz?=
 =?utf-8?B?bi9WUTBjcXROK2VyWEJwU0JjRFRsZklvQXlBKy8reS9Rd3JRTnB1YXZXb0xT?=
 =?utf-8?B?enZsSG5nQ3YydDdscHp4d0xxSE5rTXJ2V2w5akIxSTFUUW90T0llT3dYeS9O?=
 =?utf-8?B?QWQzYjlxbHovS3VKMGFFdlg3Q0VpRTRHRXB0M1p2L3AzelZlZUU2a3hoV0lt?=
 =?utf-8?B?aUpDUndGQVZKOHI5dFlrQU1EbTJNYkhTdGgwTWpPN2h5YlozUDNVOFkrckhj?=
 =?utf-8?B?SGU2MlMyUVYvWWQ2VU1yLytEQko1S1NyZW44cGJJdFBVNzZSOTliZXQ5ZVRu?=
 =?utf-8?B?K0lvT25IOFRRa2R5Y1B1MlZ6L2F6YmtQWElvd3VGWXZad2cxK0d2QjE2Vi92?=
 =?utf-8?B?SW9hLzZPeGxBZVRtRENEcFpicTl5SW1sWHdORFNNUE8vbENPdzZUaUt1SFBP?=
 =?utf-8?B?aE1LRmtJcG90eHJtSVorU0Zqd05uMVNQNzE1Q283akpLdWhveFhWOU5DdVpw?=
 =?utf-8?B?UGNkbDVoelRsZlNEM2lNbFgvZEh3ZXgxQVMvcC9lbEZPTS92S2RaaDU1Zy9x?=
 =?utf-8?B?bW90TEV4SWRCY01pdHNwcERHdmxoQk02YXJBalNabXcreGlUb2s2dW15VGQ3?=
 =?utf-8?B?UVpocXB1anhsNkMzOUQ4a2ZrMXVsWmRLOW1FQVFTMHVUQkRDeDBDT0ltUjY1?=
 =?utf-8?B?NTJMb0JwUldBbUJuaEplRWd2TUJCZWV5cjZhNGV4YkZiOTE0bS9Fck8rZTI4?=
 =?utf-8?B?QSt2dCsvZllaK3Rabzk1WE9WRG15V09ZajFyR3lUNzBkL3FHVDlGZFJJb3R3?=
 =?utf-8?B?VDNrZmwwN01RYVh1NHUwdGhDclVQY0J6UEQ4ejBCWDhFczVPV2w4STlLdS9T?=
 =?utf-8?B?UlMvM3VLRjVGeWNHdmpwZ21mZEpkalF0TWpSeVczeUluVmpWa1pTSW56dHhC?=
 =?utf-8?B?QnVUQ3dRUXF1WmJmRVJxbjlJNlV6RUFHS1pzd1pMb2xmc3F4S1pHT1YwYVVY?=
 =?utf-8?B?TWxNMnBpOWFCbzFBNTl2bzJyY3l1R0FUaFdzVEpWNEwwZ3l2OUwvbGNKK1Mx?=
 =?utf-8?Q?/1HJ7a9SZfkqPFG4cq/J7yyAM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 39907884-73ff-4570-c8c8-08db8ba08766
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 17:16:18.5736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGtvBp2s7P67jTDL5qfnZ68L/UTt+OD3ZyFmF6INxTcdxnPLOA9aU9OtQ9PyFBt45Io5tcrwptrUw+DKg737Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3803
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 17:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184764

U29ycnkgdGhhdCBJIG1pc3NlZCB0aGF0IGR1cmluZyBteSByZXZpZXcuDQpJIGhhdmUgc2VudCBh
IHBhdGNoIGZvciB0aGlzIG5vdy4NCg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgU3Rl
dmUgU2Frb21hbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBTdW5kYXksIEp1
bHkgMjMsIDIwMjMgMTY6MjkNCj4gVG86IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRo
ZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PjsgeW9jdG8tc2VjdXJpdHlAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBbT0Ut
Y29yZV0gT0UtY29yZSBDVkUgbWV0cmljcyBmb3IgbWFzdGVyIG9uIFN1biAyMyBKdWwgMjAyMw0K
Pg0KPiBDVkUgY2hlY2sgc2NyaXB0IGZhaWxlZCB0aGlzIHdlZWsgd2l0aCB0aGUgZm9sbG93aW5n
IGVycm9yOg0KPg0KPiBFUlJPUjogVW5hYmxlIHRvIHBhcnNlDQo+IC9ob21lL3N0ZXZlL2J1aWxk
cy9jdmUvcG9reS9iaXRiYWtlL2xpYi9iYi9wYXJzZS9wYXJzZV9weS9Db25mSGFuZGxlci5weQ0K
PiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+ICAgRmlsZSAiL2hvbWUvc3Rl
dmUvYnVpbGRzL2N2ZS9wb2t5L2JpdGJha2UvbGliL2JiL3BhcnNlL3BhcnNlX3B5L0NvbmZIYW5k
bGVyLnB5IiwNCj4gbGluZSAyMDAsIGluIGZlZWRlcihsaW5lbm89MTI1LCBzPSdDVkVfU1RBVFVT
W0NWRS0yMDIwLTE4OTc0XSA9DQo+ICJ1cHN0cmVhbS13b250Zml4OiBJdCBpcyBhIGZ1enppbmcg
cmVsYXRlZCBidWZmZXIgb3ZlcmZsb3cuIEl0IGlzIG9mIGxvdyBpbXBhY3Qgc2luY2UgbW9zdCBk
ZXZpY2VzJywgZm49J2NvbmYvZGlzdHJvL2luY2x1ZGUvY3ZlLWV4dHJhLWV4Y2x1c2lvbnMuaW5j
Jywgc3RhdGVtZW50cz1bPGJiLnBhPg0KPg0KPiAgICAgPiAgICByYWlzZSBQYXJzZUVycm9yKCJ1
bnBhcnNlZCBsaW5lOiAnJXMnIiAlIHMsIGZuLCBsaW5lbm8pOw0KPg0KPiBiYi5wYXJzZS5QYXJz
ZUVycm9yOiBQYXJzZUVycm9yIGF0DQo+IGNvbmYvZGlzdHJvL2luY2x1ZGUvY3ZlLWV4dHJhLWV4
Y2x1c2lvbnMuaW5jOjEyNTogdW5wYXJzZWQgbGluZToNCj4gJ0NWRV9TVEFUVVNbQ1ZFLTIwMjAt
MTg5NzRdID0gInVwc3RyZWFtLXdvbnRmaXg6IEl0IGlzIGEgZnV6emluZyByZWxhdGVkIGJ1ZmZl
ciBvdmVyZmxvdy4gSXQgaXMgb2YgbG93IGltcGFjdCBzaW5jZSBtb3N0IGRldmljZXMnDQo+DQo+
IFRoaXMgc2VlbXMgdG8gYmUgZHVlIHRvIHRoZSBsYWNrIG9mIHRlcm1pbmF0aW5nICJcIiBjaGFy
YWN0ZXJzIG9uIHRoZSBtdWx0aWxpbmUgZW50cnkgZm9yIHRoaXMgQ1ZFIGluIHRoZSBmb2xsb3dp
bmcgY29tbWl0Og0KPg0KPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRl
ZC1jb3JlL2NvbW1pdC8/aWQ9MTYzNGVkNDA0OGNmNTY3ODhjZDVjMmMxYmRjOTc5YjcwYWZjZGNk
Nw0K

