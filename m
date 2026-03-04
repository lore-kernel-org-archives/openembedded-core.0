Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA92EEDEBFD
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 01:15:29 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8501.1772586924218915149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 17:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=rroHsQnb;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.43, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFqQ04dcp7CIYlnLS55dNYvJoF/MuMtsHTssmkf+YzYdOwURRwH8FgsPPeI8WSARAkKVEt0Azp/eYlgdq/hA2jn1AcumxSVA//fP0NG0hAqo2OgQkkCg7eIhD6bUVpKdFkbbz6AieBUHWPi4R40YQ/4rwt5fnDsIO0oSVOzHMmy11RoHaNyvofbciMytHyL+dKeEeTX8wHD5KzPEr6MkLZ7YlUGKVe5ofHyBUIOMO6el5fZSNMjLGUU/GYpzFziU+1D2dmgvUu/1fAOwlXXcDw8ULyYWK39BexduIVxNkbbPuB0xd2B79Bl/bSZpmwT7/KryAyiyOsJHLD3YTs6Iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3DtiRouqGsa39IEWz4Q3eS9yEqg4hEYoVtCiGStGhc=;
 b=J0h72HFFAx8m1msmtQosTUVc4d8+kiH8DnSpMKTnmVOZcJOWfmrfPhxYM8tHeTx4WNVZRUJZ9IPHaAw7BYklHmbpR+c1sn4qDu0wlMaEppkofe6qU1O0crA9nWXTQ5O25MYbXQ92Yr1pxOS1k8JzjdS7VKQ6nYviBa0KbV8seHEjZ9BbZB6IqZ35zJ/IAOcSgXkbFkdBNlMPhrPB9zPp1gbtCgEfHgi4ubrmays79Tlfjn1/zXbtIfmJfUk3CAc2WdX4PftmmeVJsQ9Gx4TRCGm0xefES5nk9B4xyYZTyekB7i1S2xNd2xhx2/NqIiVTEl3+Z4e6kqaXr/sSykr3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3DtiRouqGsa39IEWz4Q3eS9yEqg4hEYoVtCiGStGhc=;
 b=rroHsQnbeX6muIuyBYu1CeoJZGzaKQmWNsAM0mDsZVlRJ+jKqZ3afs79K1dt6VV+j0I99rWd6IZuYbyR6HZTM4sU5oUYxKAx1lw8DMgQFoPcrzLZRArA+bMF78tx4SqRXr3uFylYXV5zcYbXSBwjTqlGkLui2Cf8rBZTjo5HXmuzba9hg3mnxMInHYa6h4DOrgDATRg1e+pGuG5aHbNDbqgSqIWAggytTSc8uMcSXgvUETwnolz0xSQFDESViACZeCsCCMCiskPF/vSy47HkS6sgTbUdTAPtQFJJ4EsWyHRL1gl1eMvlA/fOWEyK8cAaami69AizbsbdLyg5xl5/fA==
Received: from OS3PR01MB10106.jpnprd01.prod.outlook.com (2603:1096:604:1e3::9)
 by TYYPR01MB12890.jpnprd01.prod.outlook.com (2603:1096:405:157::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 01:15:18 +0000
Received: from OS3PR01MB10106.jpnprd01.prod.outlook.com
 ([fe80::3f28:58af:d760:e254]) by OS3PR01MB10106.jpnprd01.prod.outlook.com
 ([fe80::3f28:58af:d760:e254%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 01:15:18 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gstreamer1.0-vaapi: Enable hotdoc to produce doc
Thread-Topic: [OE-core][PATCH] gstreamer1.0-vaapi: Enable hotdoc to produce
 doc
Thread-Index: AQHcqvy0A4aXFqtbUUiK4ah7vL9Xp7WdkH2Q
Date: Wed, 4 Mar 2026 01:15:17 +0000
Message-ID: 
 <OS3PR01MB10106B317449BCE9308E7E94F9B7CA@OS3PR01MB10106.jpnprd01.prod.outlook.com>
References: <20260225094537.1213-1-liuyd.fnst@fujitsu.com>
 <CANNYZj9=jfp-sfg8tGJhYX+WxvJ18pfrfZDPqwzyj+LVpB_dOg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9=jfp-sfg8tGJhYX+WxvJ18pfrfZDPqwzyj+LVpB_dOg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-04T01:15:17.109Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB10106:EE_|TYYPR01MB12890:EE_
x-ms-office365-filtering-correlation-id: f3a8bcdf-5b02-46eb-346d-08de798b7f7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|1580799027|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 TdlkalK+LqLmEXsC9OtDBbdCMyvA32j6pDQtI35toan3/Ck7qpYzhYBU1Its5+5A39HUhbVrqXEX3rmFinmW8b+04WdAVOglf2Eqr3swNhikNA3xy9h68LU3cIqpaCcHNaiO8br36YLNyu8RH3c2M5jHhkWO84Uw9FFDOmL2zARl5QINYJMUAGHazbxgRG+t2xr4o5arrKjdx8Hz6nJ6RhJCbEIulcLE9jHWGuu+7ro4GcvXsuHXEGPI2KbJ0TzciL2lNxu7I2J3x+T9bu5p1Qx7IyRm0zvKdNhvYrEB+iv1QkTqvZ4Fd9NLdYYS4SWJNDCNMjmJN4EQ+rP2XBeQ9V3xRd3I0ueLzxlcGo5eAqrznRtI4UrzXfd4LwWpHM3BEUhT3AQ4ra6PUnBnjH2mk80vQGN4RYhgzGqidwS8DuEs3OUecWe3hSohpSa9CZ+3eRqpF/FYEtb562TniNR3JsAdt6MYoIzF4nvOA5vv2AB6X2fvJwr97FrN2F4i2aUE2eKSlQn2Al1jRvaBiY0favYY3C54lSZFp5soSDpNRPKmXJwey9iE0KuxrkD2EOmEFnLJhWyjfiD8bj4A+HtsscuACDht1inP2YnsfvhMGVaVDQvo9NEKvagpPAkWKi4l9fJIUs1FuJ2s5LC4qNO+1D4/qUYkBCUscjWKtujMAqrwrZ4pPM5KIJ2NULlkpXKgzxgbYFB8GPxO3GHo+bFAX7jX5WpewKTI8BQ+QdRX2Yt7FiGHlqYqtycVWA+k2MwLF8kTJ9LVd0B9KgCuydmLk2C8lV9SWLtOtFB8Us1VdK4/nwpdSudwxUmlvpQMKHRi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB10106.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(1580799027)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?R2dNbGtZU3A1NHpsaXVzUmVNeHp0SDkwWjZMVUdaWU9rVElJR1VLT09PbVhx?=
 =?gb2312?B?ZVRNRWFYQWRDNnlvSzNJVzVNQWtjT25FRktTS0JPR0oxdTZSMHJoRG4rdDZp?=
 =?gb2312?B?VytyZG45a3FMdWZtOW1vdXdpYndaaUVFQW1SOGs0d215M2VoM3NGRzZPSENM?=
 =?gb2312?B?UEF1ODA1WDhIblRPdDNOaHBuODJTQUdubDY1YjMzSHlxSzNVeWZXWWw5VnlU?=
 =?gb2312?B?bTdEWGZtU3oraFR2RjBuck1TMkVnOXlyakN3L1g4RmlpTk5ZZzZ4WTg1MDJq?=
 =?gb2312?B?ZzZWNXlNV0JjZEd2emRnNFBWZ2Zqc3dsZVY4KzI4SldER2sxcGVOcFJyQWhJ?=
 =?gb2312?B?aG1JTHBrTFdxVlZxV1dRVTZRRFFOZ2JzZFViRW9pdFJEOGJrK3VlMjNWZHhw?=
 =?gb2312?B?bmREWHYvUmo0b21XZlZkZE5ydmFwbFJxSjVveFJkL2dvM1JKVVRBbkZuV3pq?=
 =?gb2312?B?dEhLNUNXWElnZmRHTVFFSFd2VzY3K2FEemRQQVdwVFViOTFONjUvM0RManBC?=
 =?gb2312?B?SHZhT1lRQ2kwKzAyTmF3OTMrRXFDbHFxTzNNY0NMSWM2WWVVRTJVQk42ZVR2?=
 =?gb2312?B?b0kxQmpKVXJqWHVNVk14NVpiL0ptekdpZWV1bHIxMWFpVGswNTlPMG1DTzFU?=
 =?gb2312?B?YmQxeS8vbGlwNGlYL1pDTUJLKzE1c1FxMDZiMy8xQnEyTHRpelBHbU1QTDFF?=
 =?gb2312?B?eE94ckJveXRGWWsyY056S1BuT29JUVI3UjlwN0ErY2Vvd3VjdHlIRmZXMnZU?=
 =?gb2312?B?cFVrallMZXloSmM5clhnQk5rRDFPNm0wVDJ6UVZJRXlTbDdSSjc0TCsycTRt?=
 =?gb2312?B?dHg4bmVMMHFBazdOU3VrbUFuQVZ6NnIzNndtYUxRSk80VWNPbmdTN2wrOXNv?=
 =?gb2312?B?Mkdza1ROMXFmNk43T29mS01aNTZFTEhaM2p0SkJDLzNKMDRQN0MxcHNWTElE?=
 =?gb2312?B?Vk1XK3A0ZDdRRmVCN2l1aFFBazBMSkozd1RVVzZOYjhsWjBRT1NCR0FuZFh5?=
 =?gb2312?B?a1FJM0lXbkorS3NsN1hkRVNNbVAxRWs1K2V4elVSTkFDdU9rZDFJdlVCNXp6?=
 =?gb2312?B?NUpYc0V0dk45VmxvaHJybmw5MnRCWGVWYUx3ejQ1V21sUjAwbzZuZGIrTFhT?=
 =?gb2312?B?cUtuYlNNeUlBSkFaYTBFbzRMU1hlSmVqc3pKbHNNR3ZFa1hiMnJxZlZTZlpN?=
 =?gb2312?B?eTVIWm9zbDFGTjlLYThyTDJDbGs3NTJUeDVUL2JYMHpHL2U2YmEzM2VXaENm?=
 =?gb2312?B?ZTZSNXFiUmpOelZRbTFQSHZhdkJ2YXVEc2RCK2tYWGY3T0VwRUZtQUhDZmF3?=
 =?gb2312?B?UFFmK0ZSR2xaT0RjQ1BDSEFYSTYxUnROVFU2SzBZdk9Nb1I0SzZGb2lGQXhj?=
 =?gb2312?B?UVAyb3dCbVRYRVljNExwanpTSEVmT2ZZajgrYlF5eEMwZEQ1Y0poZGJBbzU3?=
 =?gb2312?B?TWNEN0lRRU1DSWhGeVFLUXZBcitlZExKK3F2aHdQT3FHditCUmxQUG9XMEZ2?=
 =?gb2312?B?UjlvQVgwYVZUd1lSai9mTVVFR05oeXhTenBnbmxreWRVd0lDT0ptNzBJZDVw?=
 =?gb2312?B?cEJjVE11MjhnZXpBVDZ6Ry9IQUVUc0ZzRGQxU3NxTEF2TGhOSVR0YW14RWYx?=
 =?gb2312?B?SjNGNjgweStBZlEwTmR5V3AzUmNOTjNZaDJ2Rm9IWmJRKzRBeGZzTmM4Tlcx?=
 =?gb2312?B?TFhCd213VDNiUUx5OEdiZzZncEFzcGlDQjlBQXhNYTNmM01aOTF2TjkxUzJy?=
 =?gb2312?B?bFBCR01lbUtXTDBLN2JsL2hhLzJHK0VGNHR4aDFGcjJpaXV2enJHRVJVZmFm?=
 =?gb2312?B?N042OHl0YngyR25yanhKNy93RWVPMi8xV3hPRGszeXdQT0d5V052bkxOdlJ6?=
 =?gb2312?B?MittZElQQlRsZGd6SXlnMVJmMngrUnJBU05SQStLQU1paTd0QitseENyZEIz?=
 =?gb2312?B?UW5pL01mRFd3dVRUVUcwQVZYVzk3MlVjaEZZYjh6QmlmckVSK2FCZklvRmxu?=
 =?gb2312?B?Mjk5NzQxU3p4RWJWRVJtMDg1dWkwRmEzcVI5T041WENQUUYzby92b1pUS0hX?=
 =?gb2312?B?M1JHSGIvRHZIWDJtdWZUdXQybmQrUGJCckxjdENqQ2doOTRjL2Yyby9mdU8v?=
 =?gb2312?B?bFNIQWZKNWZvR1RIMmQ1Q2VFQm9leEZTYWdpMTJxMngzSmh3M01OTFFwUDkx?=
 =?gb2312?B?elA2enlzVTE0REE1M2FRYmhydnVrQXJEZ0hjamtSRkRVODB6ZFhSMGlpUkpa?=
 =?gb2312?B?Z3pJZ2x3WE1qTms2N0ZwYkNtUm1aVmFyR0pjWmJ0ZTZweW84K1NCcVU2M3N0?=
 =?gb2312?B?MUl4RUc1NU9rVVNPa0FIWUt1dmIvTy96ek9hVlFKc2h2aTNWWTBWUT09?=
Content-Type: multipart/alternative;
	boundary="_000_OS3PR01MB10106B317449BCE9308E7E94F9B7CAOS3PR01MB10106jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10106.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a8bcdf-5b02-46eb-346d-08de798b7f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 01:15:17.8986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j936uIJw08Lg6l7aM604/VOsrWTyusbG4yeiCGD2pj1Y3H8F27BSsR8PFMbTg2HmsKizT+L41wWPMERumS84kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 01:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232340

--_000_OS3PR01MB10106B317449BCE9308E7E94F9B7CAOS3PR01MB10106jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQogIEkgYW0gbm90IHN1cmUgYnV0IGNvbnNpZGVyIHRoYXQgZ3N0cmVhbWVyMS4w
LXZhYXBpIGNhbid0IHdvcmsgd2l0aCBjcm9zcyBidWlsZCBlbnZpcm9ubWVudCB3YXMgcmVsYXRl
ZCB0byBjbGFuZyBlbnYgYXMNCiAgZXhwb3J0IExMVk1fQ09ORklHPSR7U1RBR0lOR19CSU5ESVJf
TkFUSVZFfS9sbHZtLWNvbmZpZw0KDQo+U2hvdWxkbid0IHRoZXNlIHN0ZXBzIGhhcHBlbiBhdXRv
bWF0aWNhbGx5IGJ5IGp1c3QgZW5hYmxpbmcgdGhlIGhvdGRvYw0Kb3B0aW9uIGFuZCBidWlsZGlu
ZyB0aGUgY29tcG9uZW50Pw0KDQpZZXMsIHRoZXNlIHN0ZXBzIGNhbid0IGJlIGF1dG9tYXRpY2Fs
bHkgYnkganVzdCBlbmFibGluZyB0aGUgaG90ZG9jIG9wdGlvbi4gSWYgaXQgd2FzIG5lY2Vzc2Fy
eSB0byBiZSBhdXRvbWF0aWNhbGx5LCBJIHdpbGwgaW52ZXN0aWdhdGUgaXQuDQoNCkxpdQ0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQq3osvNyrG85DogMjAyNsTqM9TCM8jVIDE4OjU4DQrK
1bz+yMs6IExpdSwgWWlkaW5nL8H1INLStqEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQqzrcvN
OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K1vfM4jogUmU6IFtPRS1jb3JlXVtQQVRDSF0g
Z3N0cmVhbWVyMS4wLXZhYXBpOiBFbmFibGUgaG90ZG9jIHRvIHByb2R1Y2UgZG9jDQoNCk9uIFdl
ZCwgMjUgRmViIDIwMjYgYXQgMTA6NDUsIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYQ0KbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPg0Kd3JvdGU6DQo+ICtTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgY3Jvc3NfYnVpbGQg
Y2hlY2sgdG8gbWFrZSBkb2Mgd29yayBpbiB5b2N0by4NCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlIFtvZS1zcGVjaWZpY10NCj4gK1NpZ25lZC1vZmYtYnk6IExpdSBZaWRp
bmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+ICstLS0NCj4gKyBkb2NzL21lc29uLmJ1aWxk
IHwgOSAtLS0tLS0tLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkNCj4gKw0K
PiArZGlmZiAtLWdpdCBhL2RvY3MvbWVzb24uYnVpbGQgYi9kb2NzL21lc29uLmJ1aWxkDQo+ICtp
bmRleCBhZDVmNzg1Li4xZTdhODA4IDEwMDY0NA0KPiArLS0tIGEvZG9jcy9tZXNvbi5idWlsZA0K
PiArKysrIGIvZG9jcy9tZXNvbi5idWlsZA0KPiArQEAgLTQsMTUgKzQsNiBAQCBpZiBnZXRfb3B0
aW9uKCdkb2MnKS5kaXNhYmxlZCgpDQo+ICsgICBzdWJkaXJfZG9uZSgpDQo+ICsgZW5kaWYNCj4g
Kw0KPiArLWlmIG1lc29uLmlzX2Nyb3NzX2J1aWxkKCkNCj4gKy0gICAgaWYgZ2V0X29wdGlvbign
ZG9jJykuZW5hYmxlZCgpDQo+ICstICAgICAgICBlcnJvcignRG9jdW1lbnRhdGlvbiBlbmFibGVk
IGJ1dCBidWlsZGluZyB0aGUgZG9jIHdoaWxlIGNyb3NzIGJ1aWxkaW5nIGlzIG5vdCBzdXBwb3J0
ZWQgeWV0LicpDQo+ICstICAgIGVuZGlmDQo+ICstDQo+ICstICAgIG1lc3NhZ2UoJ0RvY3VtZW50
YXRpb24gbm90IGJ1aWx0IGFzIGJ1aWxkaW5nIGl0IHdoaWxlIGNyb3NzIGJ1aWxkaW5nIGlzIG5v
dCBzdXBwb3J0ZWQgeWV0LicpDQo+ICstICAgIHN1YmRpcl9kb25lKCkNCj4gKy1lbmRpZg0KPiAr
LQ0KDQpJIHRoaW5rIHRoaXMgaXMgc3VpdGFibGUgZm9yIHVwc3RyZWFtIHN1Ym1pc3Npb24sIFlv
Y3RvIGlzIGEgY3Jvc3MNCmJ1aWxkIGVudmlyb25tZW50IGFuZCBidWlsZGluZyBkb2NzIGRvZXMg
d29yay4NCg0KPiArZG9faW5zdGFsbDphcHBlbmQ6Y2xhc3MtdGFyZ2V0ICgpIHsNCj4gKyAgICBp
ZiAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdob3Rkb2MnLCAndHJ1ZScs
ICdmYWxzZScsIGQpfTsgdGhlbg0KPiArICAgICAgICBleHBvcnQgTExWTV9DT05GSUc9JHtTVEFH
SU5HX0JJTkRJUl9OQVRJVkV9L2xsdm0tY29uZmlnDQo+ICsgICAgICAgIG1lc29uIGNvbXBpbGUg
ZG9jcy92YWFwaS1kb2MNCj4gKyAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtkb2NkaXJ9LyR7UE59
DQo+ICsgICAgICAgIGNwIC1yICR7Qn0vZG9jcy92YWFwaS1kb2MvaHRtbCAke0R9JHtkb2NkaXJ9
LyR7UE59DQo+ICsgICAgZmkNCg0KU2hvdWxkbid0IHRoZXNlIHN0ZXBzIGhhcHBlbiBhdXRvbWF0
aWNhbGx5IGJ5IGp1c3QgZW5hYmxpbmcgdGhlIGhvdGRvYw0Kb3B0aW9uIGFuZCBidWlsZGluZyB0
aGUgY29tcG9uZW50Pw0KDQpBbGV4DQo=

--_000_OS3PR01MB10106B317449BCE9308E7E94F9B7CAOS3PR01MB10106jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Alex</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; I am not sure but consider that gstreamer1.0-vaapi&nbsp;can't work w=
ith cross build environment was related to clang env as&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; export LLVM_CONFIG=3D${STAGING_BINDIR_NATIVE}/llvm-config</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&gt;Shouldn't these steps happen automatically by just enabling the&nbsp;ho=
tdoc<br>
option and building the component?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yes, these steps can't be automatically by just enabling the&nbsp;hotdoc op=
tion.&nbsp;If it was necessary to be automatically, I will investigate it.<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Liu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Alexand=
er Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C23=C8=D5 18:58<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] gstreamer1.0-vaapi: Enable hotdoc=
 to produce doc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 25 Feb 2026 at 10:45, Yiding Liu (Fujitsu)=
 via<br>
lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt; +Subject: [PATCH] Disable cross_build check to make doc work in yocto.=
<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-specific]<br>
&gt; +Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; +---<br>
&gt; + docs/meson.build | 9 ---------<br>
&gt; + 1 file changed, 9 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/docs/meson.build b/docs/meson.build<br>
&gt; +index ad5f785..1e7a808 100644<br>
&gt; +--- a/docs/meson.build<br>
&gt; ++++ b/docs/meson.build<br>
&gt; +@@ -4,15 +4,6 @@ if get_option('doc').disabled()<br>
&gt; +&nbsp;&nbsp; subdir_done()<br>
&gt; + endif<br>
&gt; +<br>
&gt; +-if meson.is_cross_build()<br>
&gt; +-&nbsp;&nbsp;&nbsp; if get_option('doc').enabled()<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error('Documentation enab=
led but building the doc while cross building is not supported yet.')<br>
&gt; +-&nbsp;&nbsp;&nbsp; endif<br>
&gt; +-<br>
&gt; +-&nbsp;&nbsp;&nbsp; message('Documentation not built as building it w=
hile cross building is not supported yet.')<br>
&gt; +-&nbsp;&nbsp;&nbsp; subdir_done()<br>
&gt; +-endif<br>
&gt; +-<br>
<br>
I think this is suitable for upstream submission, Yocto is a cross<br>
build environment and building docs does work.<br>
<br>
&gt; +do_install:append:class-target () {<br>
&gt; +&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains('PACKAGECONFIG', 'hotdoc',=
 'true', 'false', d)}; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export LLVM_CONFIG=3D${STA=
GING_BINDIR_NATIVE}/llvm-config<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meson compile docs/vaapi-d=
oc<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${docdir}/$=
{PN}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${B}/docs/vaapi-doc/=
html ${D}${docdir}/${PN}<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
<br>
Shouldn't these steps happen automatically by just enabling the hotdoc<br>
option and building the component?<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_OS3PR01MB10106B317449BCE9308E7E94F9B7CAOS3PR01MB10106jp_--

