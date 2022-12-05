Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50093C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 13:35:35 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.49])
 by mx.groups.io with SMTP id smtpd.web10.15047.1670247325283644039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 05:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BVapVqL9;
 spf=pass (domain: arm.com, ip: 40.107.13.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJHApOytAmTBbXProLnTV5nX+RKOXbB+M4c0EXsCkV45jjWDb5cR6zU9A6i2CJwDb7hOsEr6v2wjhR0j4UDhrCEmg3KihN5duOvDEULfdNSj1ujUILCCFHbzishAM48YNrjPBrg/I8N5gOV6rGJQKiqmHAC+kGf0kFkHwuaEYHSvE390BUGlu9BqZ/igCVcPKFbzvMN5IUbakyF1YQdfBgOHixYj9A1kkBg1clgIaAGsDkIOlZYG6wMAm5cOWhhy+3+b/WMhA84JvSxCwcSvGcfXGgWySF7uwZGB4Gcj/INHRqTLeovq1XH/pPjenjAEu/WnnTH+VZEUAp0UrtyjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7uORXlQCYRIFM6LnV3miqM3iI3YRS1I6CgHynvl1lo=;
 b=AcxAiDCaI0D6xOv1NsSbAkbPDxUcitE3kLFwqCDJViiSzU3weoc/tpeJ2kziqS+xuVZrY/RYpRIYJN2XAze4FixzgOerw1T7w3qwx6P6OsndAmpLxc+O8Sl0tzW8VRQF15sMNuyGoZjilSCZEoJ+ZrOQCR3k864SDam/mqt00WJGJYMb0MBOJacviK9Un/23DSdBe2+FktfdIthtjA1vW+2xs1ZUHRn4G08Gj5YsChezGhIEqTCuL4ujKoHRPXnO6spSpb0W/x56SpyD38OudyxdNmrUbBsMxTLRxmyoVChNOxxGTdJOv37jgDySk2FJHtlgohUDLzjrnChxPGkr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7uORXlQCYRIFM6LnV3miqM3iI3YRS1I6CgHynvl1lo=;
 b=BVapVqL9VXEtMQ3i/781X259dFQ+Cs8nA5iN7789pW61ygi5XJ3lHj7bEL51Or92b6CfT0jNjy1veAis5HmmMDyYoqm/TMD79gxMb/4enWFwSHa6OVkoxWd5ezvIv6kH9w+NDeYkPO5p8EaOs/TDC9i+tfb/yznnT0WBZhTYLeU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 13:35:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%8]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 13:35:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][master][PATCH] externalsrc: fix lookup for
 .gitmodules
Thread-Topic: [OE-core][kirkstone][master][PATCH] externalsrc: fix lookup for
 .gitmodules
Thread-Index: AQHZBY3ySBpDJv1AbEm3tDkSj4uQFa5fUa4A
Date: Mon, 5 Dec 2022 13:35:21 +0000
Message-ID: <1F703361-541D-4BE8-AA1F-B62007C68B94@arm.com>
References: <20221201140440.9051-1-peter.marko@siemens.com>
In-Reply-To: <20221201140440.9051-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|DB9PR08MB7495:EE_
x-ms-office365-filtering-correlation-id: 74a4f15b-66ef-4650-0ac6-08dad6c58e95
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7/FuBgL0sJgCaT92W0NBrhklwzUA41mxAwOPeoB40UouSTYCnjl9Yik1bjRuaQ+LMxwFylwLdlp09cKJWoPaK+hsVDm3hgwWX2oUdfYRSxI/RjujsJ4gMq2RfGRB3Pw2lQ41jtGfyPe+tiRvYFj4k2hGtarG4CSc7NwYZTeB0158m8tXq7tBzuxk9jYB7pbD2z+K7YS5Bq+BkcTHP9tklfWcgsX0jZAlppx84cMkO1bxIfndHiHs2YdmwnFG/vKJWeueQicx5I9nl9L63bptWuYyGj6/RFXfWebwIyr+npT6ZBK66UCnnvrjnTlE+BHiiv8R5QXzHDsJAdRKWdPboLxJT2t9YB/u8H7ZaaQpOoale+ZFd85Dxluw5/aOwKI+3EGD2rEpQ41qyzBB/GXywvKuHKzhEdbQlw4wSxk35jhABZjXaeBu5ZpDNMIxUHxZmd5MQxpixYyB1A9MvTjxu3vOrEp+08pbFWlPhQCoQJD6xVZNSq1g2mJTzwpMIOi+SllM3l/N2IBJMBEAYQo07E/6u45DbMKIEvUxWzV4BiFlkGjIRWTiPm0UefssrFoE0ZIrItojHXBNDilpMDUAL/4gVHJfQtgc4lkf24wSv0zAvTN4Kbx7MaO5XlO0jdnxIMKKpEaQNeWYPEm4vUJY0zsk7OBY+eZR5PXmDhm97C85fmFHUtP39kNlYky6rOBSQEr4qxqE3JU2PFUcEHnshGrvTsIf0ls4Is26o9rGTjrxqKz9TVF82ETi0JxJuvMzAoqEkZOkhgl3jFJ0s8pv8w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199015)(122000001)(38100700002)(33656002)(66476007)(86362001)(6486002)(4326008)(66556008)(66446008)(64756008)(91956017)(66946007)(76116006)(8676002)(8936002)(4744005)(6916009)(41300700001)(316002)(2906002)(186003)(2616005)(5660300002)(83380400001)(478600001)(6512007)(6506007)(53546011)(38070700005)(26005)(71200400001)(36756003)(142923001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cXJCRnRSWEVYdU1ndEY3cXdBWjBrTDZPRUlGMTRaTVlQdFZlOVhVS1pWYXVZ?=
 =?utf-8?B?S1lGRDFGbUJ2c29JWVQxa0hDbktxM014NnAxcEI0NmdwWUM4VFR4K1hRSUQ0?=
 =?utf-8?B?WlFvdmNva3I1cVFnY0NhRWptQkRzY0dRTTVPSDY3QTdoakthUlVGam1tS3E3?=
 =?utf-8?B?TlVqaUlybEYrbzZGK01UZmkzU0VXbEp5TlhwQjRwWUJKci83YTl2THBpOEth?=
 =?utf-8?B?emtlOEwzTmhXVkdzNXNncGtvT0tlTkpIMlpocWl1bnhZVndhSkg2VExuRk9Q?=
 =?utf-8?B?MHIvRnZ0cXo0RnBPdTl5cGtyTERqZ2M0MlRSOU1BT0VvWmU0SE45QmVqK25j?=
 =?utf-8?B?MWZOOHc1ZWQ5a01DK0ZJYTRvM3BxTjBGRlNtR0V3eDE0L2RKUzh1VWlWYkF2?=
 =?utf-8?B?VjVHNFRITWtUaEVSTzJIdjltZVZKUXJ5d0hnSTQxWEZDRjg1Z1Y4T2M5SWFC?=
 =?utf-8?B?N0NiSEh1OGVtcFdyY0hsNXlIRkd6MkY3UzUxQ3MvT3N0bGR2SWt6cnVuOVBP?=
 =?utf-8?B?a3ZYMWRwcm9ud3A5NEh3N0JQZHBpZmEwZXhFN1pSYjJDb1BjQlhjWmx2TkpT?=
 =?utf-8?B?WWFHVXoranAxcGJFaWNiMWNYVHRkcTJDM284UXp6ZmR0VXN4OHU2WWtiY3hF?=
 =?utf-8?B?cjFybUVMYjhoL0JFNS9GL2FidjQ1OHFHV21vYmp0L0tjQ254aEhveDU4cFlS?=
 =?utf-8?B?emJEQWpLRlNaM0szRWxIVnhRQlhUUjc5RkVnUHd2Y3dkdStWWHJIZ3NmSkhw?=
 =?utf-8?B?eXZoTUttOElmTFJDMG1iOWRHcDRUUjZjU3c1dDI2eDFmRzdtVU04bWNVTWds?=
 =?utf-8?B?c055bzRQa0JvRm0rTVVFVmk0MzlLUTlvTXNRVWFQbG9QTXlpTks4MnhXSkpL?=
 =?utf-8?B?MkZjSSticXB3RWQwOVNZampBbFJCTkk2TDFBcEttaCtjRG5SbzRvN1MrTUZH?=
 =?utf-8?B?dnFuMHVRVlNDVVlTcFdnaElHOFQwaThLUHJDVTk4QWJvTXRDL096NnUwMmhj?=
 =?utf-8?B?UUcwYWlMNk9QZjBjakROR1owck5NY0xVTG1iTG9Fem04N1lQczV5QkEwWjlT?=
 =?utf-8?B?YXdOYk1IbldnSlRXRmNYdFk4NzNyclRsUHNtQUhTWTJ3d2Nwd09KWkpndGVZ?=
 =?utf-8?B?eFdQOS93TXptbkhQR2dHUTNVYlVLVUNzaDhmRllvbGIycEh3VlkrTXp2c3Bq?=
 =?utf-8?B?NGJHdHMyUTFlZU9makMza201UG8rZkhLRDJqbFY4WUUwZVpjWlBtWGtjTnJK?=
 =?utf-8?B?MGtJS2ZSRzZxYVNQTVBOajJFSlVtbGZXSnAvQkhndndTNmpVZDNtZElwRERv?=
 =?utf-8?B?NHd1SjA2cXRQd3VMNXorenp3clR6YlYwbC9vTXE0L3ArM2JSYkFUU1lWT01N?=
 =?utf-8?B?K0RxQVFtcnE2ZlhkVlo0MGd5bm14ZXUxckR3bjNHWWZuZkkybS9qMWp1L2R6?=
 =?utf-8?B?NFNUZW5wU0UxZlQyVkxMamkvNG1tcDF5UHY5dWZ3Um9YLzlmaFJlZ0hOWUpa?=
 =?utf-8?B?WGcvLzkvY2NHbzVuVzl2VzkwY1hmK09zZjllTk5vSWFEL3VKK0g5REdweGRV?=
 =?utf-8?B?NmN3a0ZnM2oxdTNaQlZwT01LSyt4bkVCcEVnTmVEeFlRWE45b0xEUEVIQWR3?=
 =?utf-8?B?NndDbEVFd1VlRU5BVmFrSGZ2S09zY0p1NHZFMGxrTlpWa2pqamh4WStFUXhB?=
 =?utf-8?B?QWExRGcwTi8zbURNQmpnTG1zd2Vad1pYYkNWY3ZWenFHT3MzajkzVjVadHBT?=
 =?utf-8?B?cm0rNytiRE5Sam5kTG9waUpBNHBXV09DYiswUFBPVDVNb1VHbGNIcmY2TU1m?=
 =?utf-8?B?a25rRmV5VktTa3pITndIZUx6NnM4T2wyZnMyR2tVZFNWbHdtL1ZsVXNLVk4x?=
 =?utf-8?B?N1AzUzNEVkY5UHBvUFB4Ync4ZXp0WS9HK01zVld4NnRVa0NZZXJKZXFWeldt?=
 =?utf-8?B?Q1RTYlZkWHVZTFRxVmtvSUF1RHAwU2xWa0VnaVBDZDllV3JtV0xIYVI1TVVo?=
 =?utf-8?B?VE5yUWFvVCtiQ05BeWNDa2piNG55OUFPaWNoNmE0NzRhVUxkM0YxaXh4Q1Bv?=
 =?utf-8?B?bUtnODhPb1MzMDN1aWhYSTB2RE9RSTUzMGtLVC8wNkdzVFpiRE1JR1NRMWl4?=
 =?utf-8?Q?SDrA8f4cRUaHF8R17psT9AL05?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8BC7F573E2FA74896EE495BCCD70230@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a4f15b-66ef-4650-0ac6-08dad6c58e95
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 13:35:21.4911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v7twr7NGMN8v4CwE4HIZuRkbxoHNtgyS464ujqOPOLlARlHSMUBg2yXLAw6HG3k1cHIR++37NILfw799t3y8HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 13:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174286

T24gMSBEZWMgMjAyMiwgYXQgMTQ6MDQsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+IENvbW1pdCAwNTMzZWRhYzI3NzA4MGUxYmQxMzBjMTRkZjBjYmFjNjFiYTAx
YTBjIGJyb2tlDQo+IGJpdGJha2UgcGFyc2luZyB3aGVuIGJpdGJha2UgaXMgZXhlY3V0ZWQgZnJv
bSBkaXJlY3Rvcnkgd2l0aCBleGlzdGluZyAuZ2l0bW9kdWxlcw0KPiBhbmQgdGhlIHJlY2lwZSBp
biBleHRlcm5hbHNyYyBkb2VzIG5vdCBoYXZlIC5naXRtb2R1bGVzDQo+IA0KPiBUaGUgY2hlY2sg
bmVlZHMgdG8gc2VhcmNoIGZvciAuZ2l0bW9kdWxlcyBpbiBzb3VyY2VzIHBhdGgsIG5vdCBjd2Qu
DQo+IA0KPiBpUGFyc2luZyByZWNpcGVzLi4uRVJST1I6IEV4cGFuc2lvbkVycm9yIGR1cmluZyBw
YXJzaW5nIDxwYXRoIHRvIHJlY2lwZT4NCj4gLi4uDQo+IGJiLmRhdGFfc21hcnQuRXhwYW5zaW9u
RXJyb3I6IEZhaWx1cmUgZXhwYW5kaW5nIHZhcmlhYmxlIGRvX2NvbXBpbGVbZmlsZS1jaGVja3N1
bXNdLCBleHByZXNzaW9uIHdhcyAke0BzcmN0cmVlX2hhc2hfZmlsZXMoZCl9IHdoaWNoIHRyaWdn
ZXJlZCBleGNlcHRpb24gQ2FsbGVkUHJvY2Vzc0Vycm9yOiBDb21tYW5kICdbJ2dpdCcsICdjb25m
aWcnLCAnLS1maWxlJywgJy5naXRtb2R1bGVzJywgJy0tZ2V0LXJlZ2V4cCcsICdwYXRoJ10nIHJl
dHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDEuDQoNClRoZXJl4oCZcyBiZWVuIGEgc2VyaWVz
IG9mIGNvbW1pdHMgbm93IOKAnGZpeGluZ+KAnSB0aGUgbG9va3VwIGxvZ2ljLCBjYW4geW91IHdy
aXRlIGEgc21hbGwgdGVzdCBjYXNlIHRvIGV4ZXJjaXNlIHRoaXMgcGF0aD8NCg0KUm9zcw==

