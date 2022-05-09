Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B7BC433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 01:30:40 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web12.27219.1652059837246223802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 18:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=pG1TW+q8;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.246,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1652059838; x=1683595838;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fHBLIumTxSIBTv8qpaY4e7Onh4URtBdl6MHTsSOK2uk=;
  b=pG1TW+q8bs+ysNyrotgU8s8ESBQgpnHQvztgiHIjj/rPCiBVqzgUmkAR
   7Vh8aQk9e8ZJB/0cBp3Ift9TU4oXyHMAsjJy0k2I8jLf1fqfPajf+69Mx
   kE03Xx49Qi6WFXSpJ934RmqhouJ5i8r0UHTA33dEQy6sBdD+ODN5sMeQO
   Kop2eA5SVJtud/WoUYlTfI7iK7JeVHPvmkNdjmmLWaNKF1m32dPXliM/5
   GGSJ4OnmiVjvUKsubSbll8kvBzlEFn8Xmc6MQVdSKyqCdC5FOWr5qjH8m
   ecF7VUjCfiKM5ZJL4mFC4N7D4ZRiQfIRd8hDthQrYh5fHFmwrU2n94+Q+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="63618451"
X-IronPort-AV: E=Sophos;i="5.91,210,1647270000";
   d="scan'208";a="63618451"
Received: from mail-tycjpn01lp2176.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.176])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:30:35 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jz1EzctkiOZVwFQ3o4y45r4s6RY/niLKcHlY2+yb/7+viAGEDjKx0iaz2qsBebWF0yCJj8Hq0t9J2saY0wprpPWXT4megir5mufJaFuI2sc5RwnHTzBOEFeefupJUpX9QLgQZ2uSl3gVztWFU7KgYnpvs7X9VWsdjzHb8BMy90IGlFJJxqWdSSKN2JAy4mzcOzHmf2+j7VKLDsKPEj0AGF4BiPXuMp5Rn3vZonf3ueuxvD3f6Q+vc6fhPD1YOQ3NDJwRpqRAU1rJ7R/8uAFKfEs8yMPC030nQyGEru5/w/22uTWw+Ff888kNiG7Lnh9vz9TTNr5kDxSJ8X5KUUBVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHBLIumTxSIBTv8qpaY4e7Onh4URtBdl6MHTsSOK2uk=;
 b=bSu9W953J8JU/eJja8l4K0J6RxMUl93Tf/2eawIvSm0iP1nGb4xHGYVRL54JoJUTlxw8F5Rj10A+Qmr6mhTN9azaFVVAtQ+KdY7Glo+B22lVO5jd85DT6tk42Vp6C8vQuOlZuPRFYrTVGmts9TrLA60Q8TjoGvkxsmSwbhB1pRIM7sRNel3RmI/tkuF+q0InS7uR/X7PtEE5ykwPEIIWDgin+7NPD9vzCIE8IIhVQncPDMRyjWpcD+xEFbLKkidR2nLbdbqofoaaRpMqaUw2LRhvHCNxZbCN5UfG7UJcX3RlUg54324iN+wGXHawTUepmIenHRtVbaOZ+nUhXmOKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHBLIumTxSIBTv8qpaY4e7Onh4URtBdl6MHTsSOK2uk=;
 b=eDHbPTP9y4a3XjtIKiaWv33IiBzI9QreN2LuoYEKfutX7Y3GmKrSIS+ZGyarWHgdr3I2V/kAs2R0iEZ8OgSCK9s9BTvTkrjFEYsSpOuXlSd3slK8vEvHKFzpSJxBiNvgK0I+EnK4nd3ySon9PhMTvDYs8IzZdlEvhHVwP2jnR0U=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TY2PR01MB2427.jpnprd01.prod.outlook.com (2603:1096:404:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 01:30:31 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 01:30:31 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Topic: [OE-core] [PATCH v2] gnutls: Added fips support option.
Thread-Index: AQHYYPqy/ocPXdQui0OLuVvDKY1+Ca0RY4IAgAEiy4CAAIIIgIACu/kA
Date: Mon, 9 May 2022 01:30:31 +0000
Message-ID: 
 <OS0PR01MB61785EBD9D1441B3201AC1A2A0C69@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
 <OS0PR01MB6178F9B577423A035BD3CCDDA0C49@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_wg3r2smGwNVoN34L0ai-pPjPEfjg0P7LoQEirfL8rhQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1eb8fa3a-aec1-435e-374a-08da315b81b9
x-ms-traffictypediagnostic: TY2PR01MB2427:EE_
x-microsoft-antispam-prvs: 
 <TY2PR01MB2427DE23C159C0D29287383CA0C69@TY2PR01MB2427.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xR+64amadPvujZgMyz5gtyXYkCe253nCllXQFaQCE7exJbwGeJSLJ2k7AwNLSn2dfaQA0EuRxaVQipJvjNaA64GLQfoTT9LmE7ukY45p+hUn5Ya0vTcfQyiDaVWZ9LYMttn2qWuU7vxib3ZvvX1S2W/9qmTr4S3jSC+Yiem4pgtGKvlMovnxajmbKnuVZIZqrDxStFbRXJIdN8QTBX8qUlXcYehktnpBycSt+757n2gYfpoUXwlarg2ZOjKE8bOhdZXgktm0ZA9n0FE7pj+vaxY6NU3YzODdX/SOrHnY1U/SSfEv/peWRFJCGjU0lVMN5HIntQjoRXcJTnz17mBVX9alTK3a4W5uUwSclYXv+ysApWU7kCScJjVd8Cigeg0N8snh451GJrq0GKy8P2kmDVHNcCM79pESYvvKtAVKEGO5e8i/KQ/v+VQ65J9mmBVoQydflb4Lxl+BBPfCCy5cx73yZF1AbYWxosPuqCkXm1k5V4Yl6rX565t6q+eLoEkEXK0JNSmsNiqgDzPJI5G5sS+g5Q1rcnBNJR9wQY+3TOtzmBNcyiOAxZhFMtmIsRgle4QwX4OLCMW+FxxKFxO2Ad6aZnplXSEEeAePYT2atf7hM2LkXhZYtlxL3yizIX28wLkS4lh7Rlx5aiE1W0u4iZXn6iTO1VmyYLhuJ/2FyRJkGk68fXIk6PgNM5Hc/dHkZttGkM55JVgNNCHQv38x7L/JOljo16LtRsiaar6Cuzk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(186003)(86362001)(9686003)(38070700005)(8936002)(6916009)(83380400001)(71200400001)(82960400001)(508600001)(7696005)(53546011)(6506007)(26005)(122000001)(316002)(55016003)(85182001)(2906002)(66446008)(66946007)(66476007)(64756008)(66556008)(8676002)(76116006)(4326008)(5660300002)(33656002)(52536014)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L3hLeC96SmhJakVDMnErRFBmOHFHVm8wYVIyWGdtZHh6Rlp2SUp6MGk1eDNn?=
 =?utf-8?B?cE1FbmQxcThnd0RySlhVQWVCM01yT09UMExPSWZLL1JuQVJzY0N4d2lFY3cx?=
 =?utf-8?B?N0plUk8zUmpxaW9QZ0JBYXJmRnZaVjluTnNJRWFTcTRaOU5LaUFEdDFZVnZi?=
 =?utf-8?B?dTNYbmNrQU1LS0xTQjJzSnFHTXM2eXJWOFJkTDBkZXZIbGdXU3VRalV1SGlh?=
 =?utf-8?B?MlhNOHpvSm84V1NnU1VwRUFCWFM0UEVYZ2UweHE2bVJrUndsK0d4VXc3eFk1?=
 =?utf-8?B?NDB2UnVHSHFpMHl5eUEyQkY5QU1Rb0RSczIxNDZKS2tMRjlVcEVzU0hJRUtO?=
 =?utf-8?B?OEU5eGJWbWtuR2QwMGxQRklqbVRBMVlzbmNOY1VoRGMyWFBwd2RxRS85SUpU?=
 =?utf-8?B?VEpmaEord1ZnajEyM0ZJeFV2UzJrb0Z2RlFNc2MrREd6VGxWWENrQmptLzAx?=
 =?utf-8?B?UkxzNzVKM0h4TGxGTk0vY0JvVXh4RHdBd2NKYkg0c1lGYW5CMCtiWWkxemRx?=
 =?utf-8?B?cTJXWG5XeVdXb1oxdjZuWHNCeEFVSzVIS1RUcThsbzJjeVdaR0ZocUxXR3Bs?=
 =?utf-8?B?ODVWd1hrNDdUTWQ0R2NER0N4elVyQ2J1SmVLdnBNZE1yTmJqSndBWjdMc25C?=
 =?utf-8?B?aVNSRFI5V0VHQzQzYnl2ZlRlUmxzYUpTSTZvQ0xJRzZwRm56bGJjSmFHSkwz?=
 =?utf-8?B?U09wY1RCWWRqQjZPNEpMTDNjYUJac1FpWWJ6T3RwcklhdzdKaTk1L0xYeUp3?=
 =?utf-8?B?VnFhQm8rMFUwZEh4T05kOXZqa0JlRU1vSjZYY1hDTWtHZUNyNWxkMUJtUUhp?=
 =?utf-8?B?dzI5czRHak1XQnpFdDJab0lkai8rb2VzbjhEbUZwQUN6VTUzSkxZYWdxVkFC?=
 =?utf-8?B?UDFKcm82a2trYVZWTkRTTFRES1Z3SUFyNXg2Z2pBUUFyaHdlbTNyZXlDalJM?=
 =?utf-8?B?OWUvRk1UQXI2RmtZTVdIN0lZanZoWUNrUWVpdHRFOWs0aUVJb1M0MW15YWVi?=
 =?utf-8?B?ZDhEeWo3ZDJDeE9wSTFkSkpDZnpkcjhDVFNVTjVqK0t3NGlDaUx6RzZTWGxD?=
 =?utf-8?B?aGRlZFFXdzVNekJqZllRMCt0eGdPNVFtaEdJWnRieDlNWXNYV0JSWkluZExN?=
 =?utf-8?B?RklRTkQwVDNVMGxDSUppRWozVTU3ZmprQzNPdGsrc1dPTjZGM1l5aFhzbmpw?=
 =?utf-8?B?bnVLSlRKcEZ6YWZNbkNkU0RWeEdSMjBmQWlFSUFuQ3BZNzFlQU0wV2NCeklz?=
 =?utf-8?B?enBGRjZmeVZpN28xMGlYU0luZFB0OVZpR1RmRnp4b1ZUM0tQQUtyVUJvdDBB?=
 =?utf-8?B?RjdUWVZFbVVkdmt6RXN1aUpvZEFGZHVUS3gxenZ2YVl5dEhldjdzZHY1VlNY?=
 =?utf-8?B?T0lSVEQzOElUbGRPSkJqZmJ6elRoOWFTU21adjZKTUpkOTNNd2pWSndHVitW?=
 =?utf-8?B?RG1sQ2pqRWtKUGliSFV0UExjeGNuanNaUjBCVHYvRGpqZnBJVW51ZVdpS1lU?=
 =?utf-8?B?YmZEUGxQRmxsVDYycHBrWjAvOVRlYklkRkFpMDZMNkJRQUt0Z1NCbHh0djlu?=
 =?utf-8?B?T0ZTUHUxcXNnQzRFVGxkc2kvd1BCcElWR3kxbzJSSjZvN2cxQmV5OGNmYWVM?=
 =?utf-8?B?b1dBK1htcVdrM0VkTkxiZ2pWV0I1OGdnbENiWTl6S1BlamxFcTZYTzBTVnBB?=
 =?utf-8?B?U0tEMEsxRzVvOXNKMTJHcjh2SlBXejFtV3V1czVXRGhDS2RKR3RSNWVnOS95?=
 =?utf-8?B?a0dwUHA5YzN0a0Q1dWJQSi8rdEdVM0t5eXdPSm1hMjdOVk9uM25HdW13OUZy?=
 =?utf-8?B?bEFTVDRubWphSWZIVjdDbHFKWExsaGdaMzEwa2g5cnRmdW00dUJLaCtUMmhN?=
 =?utf-8?B?YmlCb2pIditTYVpLbTZSRjRoUmJ1N0VZUEdqWHVjTGlLZk1oOWh6QWZ5M0x1?=
 =?utf-8?B?YmlaaktZMlhhL0trc2xWL1M1aG0wZmovS1ZXZzNZUk9aMGZaYUJMRHNQdlNP?=
 =?utf-8?B?ZHkrSDFYbXkwdHpDQ25rcXVQSWRoMDhXaTdBSlBTYituWVVZS0VZWmFLWWVn?=
 =?utf-8?B?SWMzOFk3SHNCakNPWnZadnFXSTFTN3RTa251bGswTEJLcGhTdDVYVHJZSXlE?=
 =?utf-8?B?UzlzaWc2M0Qrd3Y3Qi9BVWx2eklBeFdHR05DVVdGS2N3Vk1ubDRWUzl0c3pS?=
 =?utf-8?B?Q3g3M0NpMFB4UFpLS1crY1pwOG91blRYVDRzOXpNWkVPT1cvSjN2aEVmSi9a?=
 =?utf-8?B?djd5T01FQ1hDMDJnQ2loUk5Bd29RQnpoM0RSQ3g3TFdZS2dkUXJjWUNNSGY1?=
 =?utf-8?B?R1dlZ1Bzd0hhbWhYakdWaU5IaHZoVDVtOFhpTysrVUlOSU1MeTliZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1eb8fa3a-aec1-435e-374a-08da315b81b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 01:30:31.4218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Ea87DtddOQ2+6npcxenIpWHBFMslFMqRjctS7zKMNa7oI5HsX+0KgCKvj7Ng4p6+o+TBy5zsQLwE5ZLbwD1j9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2427
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 01:30:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165381

SGksIEFsZXgNCg0KPiBQQUNLQUdFQ09ORklHW2ZpcHNdID0gIi0tZW5hYmxlLWZpcHMxNDAtbW9k
ZQ0KPiAtLXdpdGgtbGliZGwtcHJlZml4PSR7U1RBR0lOR19CQVNFTElCRElSfSwtLWRpc2FibGUt
ZmlwczE0MC1tb2RlLGdudXRscy1uYXRpdg0KPiBlIg0KPiBQQUNLQUdFQ09ORklHW2ZpcHMtbmF0
aXZlXSA9ICItLWVuYWJsZS1maXBzMTQwLW1vZGUNCj4gLS13aXRoLWxpYmRsLXByZWZpeD0ke1NU
QUdJTkdfQkFTRUxJQkRJUn0sLS1kaXNhYmxlLWZpcHMxNDAtbW9kZSINCg0KSSdtIHNvcnJ5IHRo
YXQgdGhpcyB3YXkgZG9lc27igJl0IHdvcmssIGJlY2F1c2UgUEFDS0FHRUNPTkZJR1tmaXBzLW5h
dGl2ZV0gbWVhbnMgUEFDS0FHRUNPTkZJRyBpcyBzZXQgZm9yIGZpcHMtbmF0aXZlIG5vdCBmb3Ig
Zmlwcy4gDQpBbmQgSSBkb24ndCBmaW5kIGFueSBleGlzdGluZyByZWNpcGVzIHRoYXQgY29uZmln
IFBBQ0tBR0VDT05GSUdbeHh4XSBmb3IgbmF0aXZlIG9yIHRhcmdldCBzZXBhcmF0ZWx5Lg0KSSB3
b25kZXIgSWYgeW91IGNhbiB0ZWxsIG1lIGFueSByZWNpcGUgZm9yIHJlZmVyZW5jZS4NClRoYW5r
IHlvdS4NCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0K
PiBTZW50OiBTYXR1cmRheSwgTWF5IDcsIDIwMjIgMzozNiBQTQ0KPiBUbzogTGVpLCBNYW9odWkg
PGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
IHYyXSBnbnV0bHM6IEFkZGVkIGZpcHMgc3VwcG9ydCBvcHRpb24uDQo+IA0KPiBPbiBTYXQsIDcg
TWF5IDIwMjIgYXQgMDQ6MzEsIGxlaW1hb2h1aUBmdWppdHN1LmNvbSA8bGVpbWFvaHVpQGZ1aml0
c3UuY29tPg0KPiB3cm90ZToNCj4gPiA+IEkgdGhpbmsgdGhlIHVuY29uZGl0aW9uYWwgREVQRU5E
UyBsaW5lcyBjYW4gYmUgYXZvaWRlZCBpZiB5b3UgdXNlOg0KPiA+IEJ1dCBiZWNhdXNlIGdudXRs
cy1uYXRpdmUgYWxzbyBuZWVkIHRvIGVuYWJsZSBmaXBzLCBjaXJjdWxhciBkZXBlbmRlbmN5IGVy
cm9yDQo+IHdpbGwgb2NjdXIgaW4gdGhpcyB3YXkuDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gRVJST1I6IDI4OCB1bmJ1aWxkYWJsZSB0YXNr
cyB3ZXJlDQo+IGZvdW5kLiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+IHwgRVRB
OiAgMDowMDowMA0KPiA+IFRoZXNlIGFyZSB1c3VhbGx5IGNhdXNlZCBieSBjaXJjdWxhciBkZXBl
bmRlbmNpZXMgYW5kIGFueSBjaXJjdWxhcg0KPiBkZXBlbmRlbmN5IGNoYWlucyBmb3VuZCB3aWxs
IGJlIHByaW50ZWQgYmVsb3cuIEluY3JlYXNlIHRoZSBkZWJ1ZyBsZXZlbCB0byBzZWUgYQ0KPiBs
aXN0IG9mIHVuYnVpbGRhYmxlIHRhc2tzLg0KPiA+DQo+ID4gSWRlbnRpZnlpbmcgZGVwZW5kZW5j
eSBsb29wcyAodGhpcyBtYXkgdGFrZSBhIHNob3J0IHdoaWxlKS4uLg0KPiANCj4gUGVyaGFwcyB0
aGVyZSBjb3VsZCBiZQ0KPiBQQUNLQUdFQ09ORklHW2ZpcHNdID0gIi0tZW5hYmxlLWZpcHMxNDAt
bW9kZQ0KPiAtLXdpdGgtbGliZGwtcHJlZml4PSR7U1RBR0lOR19CQVNFTElCRElSfSwtLWRpc2Fi
bGUtZmlwczE0MC1tb2RlLGdudXRscy1uYXRpdg0KPiBlIg0KPiBQQUNLQUdFQ09ORklHW2ZpcHMt
bmF0aXZlXSA9ICItLWVuYWJsZS1maXBzMTQwLW1vZGUNCj4gLS13aXRoLWxpYmRsLXByZWZpeD0k
e1NUQUdJTkdfQkFTRUxJQkRJUn0sLS1kaXNhYmxlLWZpcHMxNDAtbW9kZSINCj4gDQo+IFlvdSBj
YW4gaGF2ZSBkaWZmZXJlbnQgc2V0cyBvZiBwYWNrYWdlY29uZmlnIG9wdGlvbnMgZm9yIC1uYXRp
dmUgYW5kIHRhcmdldC4NCj4gDQo+IEFsZXgNCg==

