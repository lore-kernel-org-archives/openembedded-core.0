Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11FEC47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 21:42:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web11.29385.1670276524653788182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 13:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GrT0fwZO;
 spf=pass (domain: siemens.com, ip: 40.107.7.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5RTIaLPhwkErmqh8f0EwiuZVumWbfMl9Y8Xp4/jf83sKdmSSpxGBVBYl9HLlDBEUmHNF86nEnXz+Qgn1N30PXOnZxCggMY2KCscfWUWsUjLO8xjUdlIwjvwzlFYMq1f0gYsK8nMsRwB31pAqmtwpaOhp8ioRIjF3p3GgT1D8fCeRtvvMiySMfBhnoIYzRdHemSP7EbB0+Jiy/hqF90jB7VXc8azsEA2td1rujRcKd1djiySfuud/lSDOZEGpVISHZLsCLgG9KgMwaanWRXcQYQIG+ZG+EhmQ5d+NMH4V73D/KedLn1L3E6mNCb4LGz4hJ8qZYM5OzOBqoASPATLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=260T+xRobfvTwKyTlWlkWdXqclq/d3YmqxUW9XxX9L8=;
 b=bvCvQJzwTx75P5UjEV6hbW7HAdghGhFC/O27x3b/TFI/pObJ7JGEk+Ij3E02Os4SAoa9FgMwzaVc1DB5vE1SBDCwKcbjXdWGrifuaPj6zjRxulli9aPwLVPYdik8cwoW6MyZb35ulmTr7yOjjm5lU3JJd1M7P1ha60BGYpJznd9xk4u0ZJUh0AjdCUqC6WPAkYhlCdm2TbxdyuIJJ03kjZ2fIQzNkJqdZcR8hx+YT5IlzhYXA2ZuBKrrultZJKI8lyfERxo9g2q8qm0XCDuL2l9mo9aOZi/kYGrNkQ5GFaB1D1IbcN8i/X9fWi0x9SQ+eJ/zJEyJ0J95SjUs5CzGqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=260T+xRobfvTwKyTlWlkWdXqclq/d3YmqxUW9XxX9L8=;
 b=GrT0fwZOk04v/eSvqUiC2f5vy4E0O+Z5ER0yAXi1VYt7+2EnDRj7XNmNuaDNG1fVkZr7Re6q0AI5Lbunhpg1wsdHcZJrs6YdAt44D5frhaB7C40+rZPeMUY14CcNldAa3zwJjhYjBs8DPoNixCKe8b+3EE4saMrVLPQkAHpyqtgR7A5yINULYpmXsdiwdJG9sNkiJXcDw1rNKau0zFoYW3tLyqOoioauaV0yCttO5orIIJFy2JOMs+XaiRfTgi8kpFv24QmY9fS+WoaBwYw+2sagbv9yTuW1tmJDjKg+dtqGpFJO164F6TkOrrdekNgUFBhtwotsv4at9tBk+TcjEQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB5212.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 21:42:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4f14:3c2e:f13a:963a%5]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 21:42:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][master][PATCH] externalsrc: fix lookup for
 .gitmodules
Thread-Topic: [OE-core][kirkstone][master][PATCH] externalsrc: fix lookup for
 .gitmodules
Thread-Index: AQHZBY3lnxyg0rzqUUS2zY28AH+MW65fUbuAgACHYJA=
Date: Mon, 5 Dec 2022 21:42:00 +0000
Message-ID: 
 <AS1PR10MB569768FEB782D3B693E2D5F0FD189@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20221201140440.9051-1-peter.marko@siemens.com>
 <1F703361-541D-4BE8-AA1F-B62007C68B94@arm.com>
In-Reply-To: <1F703361-541D-4BE8-AA1F-B62007C68B94@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-12-05T21:41:59Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=987b6ed2-4c7b-46d0-9b23-2beef0ccad21;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB5212:EE_
x-ms-office365-filtering-correlation-id: 5a4b681b-66b8-48f0-9497-08dad7098a96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Z8E/k+sRwBtHdloW7tRoLN0h13/HjKih8OYoAgporwpv/1zMntzLKHza/Gj/vBAvET7SG0/T5e+qtagaXbjgq1s9IW/wzCyBduekAr4pPFnbLFJnU+WXf1kh8yTKO5znL0mOHishz3PzvOFTivqfneN7eltvXoTlQAhHzS7de5lYa2z4G5EQ8lIKMc+JOXEr41BwDPfWfuW5B9vE69f90kP1LHXmNTAWmglrHuj6PK42llpm8rO1WnBDGkfhxuXEyOiqkIrIXLqIalV5xBptoAqZtyeViz4jzE/z4Fyi/SSEVPuoWWfRZ9HV0FxzK11Ey+HQNsfPmBCvvMi/0bQLJyHYVbws89AL2oVetgHvw9fyZoGQLW7qTv1j3g6ccYIKrFm6QWo/+KW755EFH2Sqq1Cwq1ZjJ+aLt/teUayev6o1agUM9kYz+Nl3MitIPX0f8nkzrdqXNqRl91K7Dc+cD0+FLxUuc2YIyrIg99D/yPQvczhBqE6bItxwfQTUkxeM0zhU5F2tHPJePxUZHm03TZU7XpK4rx5bWo7CLQ0FSeiLCB6B9Bin9RUgv1KfAuMSBrZIZtZ8APdFYmjekRQvsqaTe9ljMHYG+srQ4sq0VJuV2dEQ8NslvACilf5DDjdT+tCg+xXrftS+vWQP4lpwqIjVxS2s/6tuKClX9i6U3/dB0n87RSNnZXPSBXZvLMSClrfitTZakbUFjiMUmh4zf6ZYvWjFE6st7MxZyMYPHe56pSDT9ixhFJtvX1U0Lz/7
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(38100700002)(82960400001)(86362001)(8936002)(2906002)(4326008)(41300700001)(38070700005)(4744005)(5660300002)(122000001)(83380400001)(33656002)(478600001)(966005)(66476007)(66556008)(76116006)(66446008)(316002)(6916009)(66946007)(71200400001)(55016003)(52536014)(8676002)(186003)(55236004)(26005)(64756008)(6506007)(9686003)(7696005)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cGNPT214WTU1MGE0bExQZGxzR3djMUpsRzR1NTVFc0NzWGpnU29JMVRpek4y?=
 =?utf-8?B?Rk9tTHMrZXdmSWZJeHkzZHFiWU5NQ0FaQTZEU1VRb081Q0Q2SFFhT0k5R1ZF?=
 =?utf-8?B?UVp1ZkhzUGhwbVY2TytDOGZYR1lyVWRTbVVOOWRsOUFQUitiS2lmK2RyOVNp?=
 =?utf-8?B?MWx3NjhhbE1QZkluUVVRRkR5NklEMFhaNzZpY3VIaHpyeStPVFZjYTlpOHA0?=
 =?utf-8?B?V3o1My9aYW4wd3E0bzE0TmRQWXdDS0tYWitXdkxCVFRuNE41NHFtRW5Dekpw?=
 =?utf-8?B?Uk9GWDU1ZmJ6emZHME9xb0V4cUErTjFJSjFLY2c2bzZrY1FkQityT255bEd5?=
 =?utf-8?B?SWpqYnpLWUtXS0RXRVg5VmQ3eXBPbkY4YWZIazVzNkhvdExodFJpeXVYdmN4?=
 =?utf-8?B?L1FtWktFNUFqRkNETk5COXFZamJLVEVjTi9QdHYrQjRuK2lNWnFkRXlRbGxC?=
 =?utf-8?B?d0I5aGI3NmNjWG1uRll4TFN0QStGRW9pK1lSZlh0d2hYQVNwQ0lOY1Z1OHNP?=
 =?utf-8?B?RXYyMFpBQ0NLbm5KVVpZZlZwdWdVZ2l1bWJoRGttc0JZUUhOV3AzWXFOcThT?=
 =?utf-8?B?K3ZvQnNiZUsxMERsWE9OQ29vNlBPbHdneDNFcmRReGV0K3VCU0ZhZm1GQVl5?=
 =?utf-8?B?U1F5Q3EveDd6Z21rd3Zwc2hPSkFWTnJxMWRaSFBwbDBQVXpONzlGVlU0NVhX?=
 =?utf-8?B?V1pzS1lRcHhmcGx5L1FlQW12SDJLSHFUclFZcmZvQzc1aE5SUXBqYmN3Zyt1?=
 =?utf-8?B?a3h3U2VXRkpoeVdjc1hPNC9LQkNxN3JVZGJWZHI3VzBFd0Y3a25mb0FiTEJ5?=
 =?utf-8?B?dlZGOUlTL0RwM3o1YkRSZWxmbVpHQm1ob0ZnY3N6YnhIV0h1ZkZzd1ZHT3dy?=
 =?utf-8?B?WEs2bGlxRFMvRWZ1OGlWWWtJU3ZqV1ZlaTVHbkxadjJ2bFJRby9DbDE2dE52?=
 =?utf-8?B?dnd1djdtWGpJZGxDUmpmUlNwblZQVmU0YUJZUGpQU1VlcnlydFBaemtYYytN?=
 =?utf-8?B?TUlJekdNaEZqMHg0WmZOVHRnYXBCekppWUExckN0TnBhb2Y5REFLc3FqU2xs?=
 =?utf-8?B?Ykp3RGNzUm9YbktXNmVsY0JvZ3dTejI2d2FnZlFNOW9RQWJxN3JhUTZ2Nk8v?=
 =?utf-8?B?R2dVK1FQVnVjVHg2bjlxVkRuOWEyQUxEczRJaUhhSElvT1hGQTB0bjYxVjNn?=
 =?utf-8?B?YmVqL01FbUt5dyttdUdjaFdMenJEQzlsdkNzNnVmZXB5S2Fadmd1S2FMbmdT?=
 =?utf-8?B?TGlZQ1FqektVUGEwdnZvWDMwMlJrdko3anhKNXVQcDBnNmdGNGlZclFzWWNr?=
 =?utf-8?B?VXhGUGxFQ1hMSHloZjFLak1ZTFZpTnZlVDV2bXNZa0QyaVJnelRlU1YwdmtS?=
 =?utf-8?B?Mk9mSVRJMkFGMzVZSG44VVpVSEtDVVhzM2VTaUp3aWJqdFVEd2V3S2VueHlL?=
 =?utf-8?B?MnFUMjZpSmV1czh6OXB1ZWgzZ080Ym1Td1ZsZ3BuS2VoM2dkc2N4VFFkeWEv?=
 =?utf-8?B?YmViMi9CdFM4UGUycU1oQ3RBRmFOek4rVTRuMkVSdlZ4VUVOM1JCYWdwZ0VG?=
 =?utf-8?B?RGx6MTlGVVprVEtyUEQwN1h1SHhYSnRldWtpQWE5bU44VWdTVTVkVk9WNzBB?=
 =?utf-8?B?dWEwTTdVU3RBTHk0YUpnUjRjRjVUVzc4UlFFMWNYTXl0a1VKd3NDTXZ4NGFr?=
 =?utf-8?B?Yjd1d3BlWk55L1pJaFo3RXpCZUMrVlRQb1piOGRKSko3MXlUd3RGOGUyOGVp?=
 =?utf-8?B?SEExZURLbzVWQ0dQVnNsNDdaNUIwUjZiV2RpQUJwYTJhWW05UnBTUVpaMlhY?=
 =?utf-8?B?enQ2Z2FlOW42d0dlbkc5SkpMNU9KK216ZUZhUy84ZjNGY1N4RC8zVjIxaTh4?=
 =?utf-8?B?WFFkdEx1WXFMSk9KckpjMEMzV0huZVNOUFhKRVdZYWUxL3JBWDZJaHhoclh5?=
 =?utf-8?B?elorYXFjYnpiOEFXRnFzek1sUUdqRzN0azBTTWJtdkZTdTZGVmpBZnNZWDF2?=
 =?utf-8?B?d0ZOOU5lUlNmUlNDL2V3M2FCMmswbHhBY3loR1NkS2ViQ0tyeHBkWnorOHdz?=
 =?utf-8?B?dVJDbW1WT1dBM1JQUHZoamQrakNDckxva1JVVlZaVWxxcjFIYTd1bUc0eUtS?=
 =?utf-8?Q?Ln568xAB6nNK5TXPKySe4eSGj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4b681b-66b8-48f0-9497-08dad7098a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 21:42:00.5992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JR14x/+5VGhe3Mgr8Cgn6uTmdP2K3GCqEx8j1crJKvzBHGT8o77//w3XyWYJnI23CLdQiGZjGouAdfCsSWvh1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 21:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174305

PiBUaGVyZeKAmXMgYmVlbiBhIHNlcmllcyBvZiBjb21taXRzIG5vdyDigJxmaXhpbmfigJ0gdGhl
IGxvb2t1cCBsb2dpYywgY2FuIHlvdSB3cml0ZSBhIHNtYWxsIHRlc3QgY2FzZSB0byBleGVyY2lz
ZSB0aGlzIHBhdGg/DQo+IA0KPiBSb3NzDQoNClRlc3QgaW1wbGVtZW50ZWQgdW5kZXIgaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzQz
MDQuDQpJIGRpZCBpdCBhcyBhIHNlcGFyYXRlIHBhdGNoIGZyb20gdGhpcyBvbmUgYXMgaXQgaXMg
bXkgZmlyc3QgdGVzdCBhbmQgaXQgbWF5IG5lZWQgc2V2ZXJhbCBpdGVyYXRpb25zIHRvIGdldCBy
aWdodC4NCkJ1dCBpZiBuZWNlc3NhcnksIEknbGwgc2VuZCBhIHYyIHdoaWNoIHdpbGwgYmUgYSBz
ZXJpZXMgb2YgdGhvc2UgdHdvIHBhdGNoZXMuDQoNClBldGVyDQo=

