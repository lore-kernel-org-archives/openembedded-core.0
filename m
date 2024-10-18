Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D49D3F2AF
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 21:56:44 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.76])
 by mx.groups.io with SMTP id smtpd.web10.33290.1729288600645244080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 14:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=qK3lbbNv;
 spf=pass (domain: axis.com, ip: 40.107.104.76, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1dSqqNd0V9oKimFrgqhX5NPgbJJYHu/umK7QymHykVnA/ksqhmoyn6Dg9y7cI56Lz/OjtmfCcoYEG2/7wkRaW0nTdiu/NkTa+8LxFUMf5mT5LOSKiXwOna1rjAW+kDjPNp6asIZ9O1norieJf31/Hjf0xTRoI4CWoodQzvHIPsyiWW8VnLWK10Gs4rgguIGApLV+GFBRrms2jpJCsi7vWkoquzrXOJSBasQL/XHUl7pS0oNyAwcN3vXuZlE5WzmROR0qtGb78zPccZdun/f9GHrPJcgmjk+V29rJasJAso+KTI/NW6GeKCiA/ea11R07TE83UU/RFVgCl7yetjdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qgoe7i5kNXNY4hHsNmLRriATQcwH5ytHGNtLDEiph6g=;
 b=wKWMX0UZMVKUEKvsPhHii5pJRBeFvREj1aknrY/fUaIM4xe+1p4zU3WlN/Nt7+rzoBxiXirf8/UTOG9+8uoLUjmll3mVN/yB4PoK+vY/DF482JmtIxQtHQ09X/AW3vDhksFHTl3IxSwpPV5VYtkXnzLHPHCa2L2Puiov1zWm4OXZpc40cBWZ4I9JFLKUeb4KWiErkKaO9VfQMLIZ/XJH05zNX3o5U+96nAG8Cwd5Rrqn+cziK8jw6NvZGIDljilet/du3cItFLl2yQAc8JBgeShUgGr49Ef3TIhp0C0qDdOy79t+g89TFkHTCPQAOHKklRQ+B1uNWi3ljx+YWsFX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgoe7i5kNXNY4hHsNmLRriATQcwH5ytHGNtLDEiph6g=;
 b=qK3lbbNva0euipMzpiJk0eyDLnY0UAiZ/Ys5js1jcp+utY+TJWSRqLRCBi6PPkgSWss+0L0sm/CPCdMyUQL8lc+eoon2lAb85eZm/C6wtNNtw8FJVu54Rr0N6Pgr9wg52I66NzTqukNasca8j9AmWcMyqKTf7X9j2wOKFBc4Mf0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8329.eurprd02.prod.outlook.com (2603:10a6:150:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 21:56:35 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 21:56:35 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap 17/18] image_qa: fix error handling
Thread-Topic: [OE-core][scarthgap 17/18] image_qa: fix error handling
Thread-Index: AQHbHzORBRQ2PndZlUWL3uOIAdA0ILKIaHEAgAD3QgCAA47vQIAACPyAgAAa9pA=
Date: Fri, 18 Oct 2024 21:56:35 +0000
Message-ID: 
 <DB5PR02MB1021318FA0FBF43B3287C3CB0EF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1729018153.git.steve@sakoman.com>
 <8fe7aef17eefa70e3f7c07077b8c695e5c00ed5e.1729018153.git.steve@sakoman.com>
 <a8af25be04be39c3f91344858ed95a6ebc936f48.camel@linuxfoundation.org>
 <CAOSpxdYwqNEs5dDd3jDrGmeUfT07J09X+WoFtpkaioX99x72QQ@mail.gmail.com>
 <DB5PR02MB10213F358C4369372C5047B1EEF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAOSpxdbTAe6iCzciRoZHO+gVfx64Or_M=ia1KcOn=DF4sGQ3sg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbTAe6iCzciRoZHO+gVfx64Or_M=ia1KcOn=DF4sGQ3sg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8329:EE_
x-ms-office365-filtering-correlation-id: 42e6fdb0-c94c-43d5-15d2-08dcefbfbbf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UmZaeDJYZmdaRjFzV2FtMkpNRG5mbDBBQko5UTU0MmpyMkd5N1JZQUlRQ1hn?=
 =?utf-8?B?QTVmVUFNRkpEdFJVS2R2MXFTaVFNcjdHTklaS0wvVm1MR2crTWRXVzlURG4x?=
 =?utf-8?B?dy9wWDlEZmxkdWlnVjM1L3o4VEtMRUtodE1HcHBKM1Y2TDgwMW1GSVhPTU96?=
 =?utf-8?B?Ymo0TDNyUkNEUy9QWmp0YmlSZHZ1cjdxY2ZkbUpGSVhRc3QwYU84NllVZktG?=
 =?utf-8?B?MXRicmx1YVEyS3NhVzZhd2Y1aTZ3L2QzaHpwbFdVdmxncDVlemxySmZxdjU5?=
 =?utf-8?B?c1hLZllKMXFGU0FOWWNlVVp5d0M2cXRZb25JZE82V0ZucU9SZkxKbG9keDZq?=
 =?utf-8?B?dU5jKzdCaHZVajhxS2ROOXhLek4xNjVIdU44MmR2Z3ZwMTdHNmhWSURFVHov?=
 =?utf-8?B?Uk9tS0JlSjBZYkVuWk1sNzJXd293THVTdTRLMXMyWmhSOFJQU2FzbndjcC83?=
 =?utf-8?B?UjQrTmlyMFMvcUlVOXVtaVNNR3hQWDB1L3lMM0Z0eEZXNnFEeEU3VVFVVWdl?=
 =?utf-8?B?L2hSSEVqTzRod0x1VmhoUitLUEQ1U3JwcThqQ04ycnpybzZKS2hQZ1dDNG5S?=
 =?utf-8?B?a1RFZUx0N01xNXNqWmltbzNiV3RJTGRJcS85MklJMENOMTlBK0dvRXYwa1lS?=
 =?utf-8?B?RFRoU0xxa01wVVBFYkhTelZGUEtDRUl4SVhFMjRsd2d0dmJvN0xYaUZUOWk0?=
 =?utf-8?B?RkRYM2RaRThrdncwUFFSZEEzbCtvQ3ZZcWlsbURHcEtBS3AyWk9YaExxVm1i?=
 =?utf-8?B?T2ZGcGpvN1dJUTNNS1ZPU3NzNDdWUGczOEdHUk40UTFDQUxqQlpqWDdxSkl6?=
 =?utf-8?B?SWhqZHBkazFINGhkQTMwSTBBZVlkRHRFK0lQOFBuL1paVXpVaHdFQ3BkcmFW?=
 =?utf-8?B?WmUxVWQxQWN4Tml6ZUJUTHhDK2luUm9mOGZMd2xCcFg3YmRyU0pvaEhXMGtx?=
 =?utf-8?B?RjhNUlF3VDV4YTZ6S0ovNkY4eTZxMHpHaUk2empTcmRDU1lvZk1Gbm5GQkFh?=
 =?utf-8?B?VVRucU40dkM3UFo0elZVcG9sN0VDZ3lLWVcwN01IYXdDYjFyMm1MVmRSK3FU?=
 =?utf-8?B?YnBjTDA1a3kybmdlNzV3TXdlR0YzaWdsdFh0Um80dTErSTd4MWV4NGk5a1F1?=
 =?utf-8?B?TmFFd1ZvODZpb0RUdEFrMVdXYVFQakhla2lWUG0zZzdQaU9rejJtaXNSL21L?=
 =?utf-8?B?RnFCemZjd3BCNkw1ZVYvWDd2ZnBzNUJPVG53N05UM3k3ZWE2TFMvVVpuVzFL?=
 =?utf-8?B?VGw0UkdLQmQ4Wk9UbVFGdmNhWW5YNXZSMnlYWEpEY1hXMyt0RkdJV1BQd1BL?=
 =?utf-8?B?ekZ0bmp1MVRnWEFrbXdPaEdXbVhueDQ3L09HQWhBVml4Zjl1eisvN1pkaHcz?=
 =?utf-8?B?cEpHL0ppVUdUc0U5d2paM0NVYlRRam5aVXVQRWhKdGQxWHYrY1pkZ2tGb0x4?=
 =?utf-8?B?SW4wVTRzZS8rd21MTWEvci9UbmIrNk01U1RWbFR2Z3VLeFdrWnpBRFQ5RDFh?=
 =?utf-8?B?c08wQVEyOEhJWGF2SzJEN01KZFV2VGpwWUloWlp4Y2FSYmoxR3FDek5sNzJj?=
 =?utf-8?B?TDBWZ1QvSWIycUwrRlNkakFZbTBqbUE2VDRSS1VlZDVraHduemZTL2FiT0E0?=
 =?utf-8?B?SFBTaUpTeGJaRFF1b0pEL05mTkR4VzlVM3J1Nk0wazFnYWl4ZUZHWlovaUtq?=
 =?utf-8?B?cmc3TGVXcDRnTzlaVGMwOVBpa0RCWFBURXVUL1V6TGhnY1RUbVRaWUo3bUFS?=
 =?utf-8?Q?vUmK1lQIzGKZyN/o1Ap1/5274nQ1QlHiQHYfGX9?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZHN2eUtPbElMY1oyREtKd3ZJQkY3UnpKVUZWK1ZEb3BKem5uNU5WeTRXYnBJ?=
 =?utf-8?B?WDR5MzAwSVVzMTNNQTh5bXo3ekhaQXlhMWNWWnFDZlQ4QnRGT2ZNY0l2N0d3?=
 =?utf-8?B?SGYrc1BpUVBGSGNyWDk4S01razBUNGZRT2RZb1lyWWVJRUlrc25KeWQxbWNq?=
 =?utf-8?B?VHhHR2s0WVdQUmRJUm1lYkQwQjNoRGgweDV4YkorMEtDWTBlMzJLL2kyeEZj?=
 =?utf-8?B?QmRKUCsvRkZtL3ZrelJIbVZkaGhqdTdxWisvUDNLeHdXVlNYN1JzbGNVTWxn?=
 =?utf-8?B?cjU4WGJqdkZxL2F6WndVQkpIOXpRUFRQL3lGNEczTGpOc0ZSbUdhL09BNit4?=
 =?utf-8?B?UlppSHdTUXE2RXIrdVJxNTZhVC9NdnMzSFJDZE9venNSTEJXQXdFOXQxTi9m?=
 =?utf-8?B?aUpnZEdoRlNqSkhhR2s0MXVOQ3h2ZXdlWmkrRVU1ejY0WnZPZjdVZVRvbjdj?=
 =?utf-8?B?eTk5ZCtQUXFYT3JEeUFraEY4L0Z0TE42RmVWcmpUd3JyUGw1ckRtUUFGUXZW?=
 =?utf-8?B?T2k4Wk4zTXpJbmQveGlGRUpWTjJTME1ZbTRNNWQwekp0clNobk02RHdSd1NS?=
 =?utf-8?B?Qm1kbVovdW93UUpydHFtTHEvZGtpWktBOUROSFRHOTZmczUwc1FiSzYyRWVL?=
 =?utf-8?B?b1FHamR4MXB3NzJabjg4VE1YZjY2dTY1eUpkUnRyalQ5V0hCTHRJY0FlYkJ5?=
 =?utf-8?B?elNNK0tsTlFvTGo4cDVhclJmLzQ2elJYRDNtN1VTZU1CSHNiMHVkTnhrR2Z3?=
 =?utf-8?B?VU5LajJKQ0Mwc3VlMVN1RTNBWVFvNVpwZVM2NnlEelNZY2hIVytkNWNJMjN5?=
 =?utf-8?B?ODMzNDdFbU1Ucjg5d2YraFlsRVlXQXlxSENNbVUva3ExS2dKemIxNWxGQnFy?=
 =?utf-8?B?VlhaOHpwZVowMDVYZG15VUpjUFJuemI0c010aGE2TVdXV3JUZ0haMkVETG9K?=
 =?utf-8?B?Y01rWHFDZTRrV0JRdjdwZ3BVckpSVkxTRTk4aTNldENlcVRTUkFlcmFaN2dz?=
 =?utf-8?B?bWkyTjdUQ2szODJIYTBOUXh5Nkp4SUxrdVkwVUZQNDBxdTR2LzQ5S1l1UFJR?=
 =?utf-8?B?VE9KM2RFZHFYMEFvdnM4ckF4bzhXTG01RFBQdnRkdGF4RFZkVno1eXpNdTV1?=
 =?utf-8?B?OEZOSktPbkpWNjVHSzk0ZENydVEyTU8vQUY0WEVhN1ZhWHdaRmZzSlFXRldn?=
 =?utf-8?B?OGlBQjhJd3JJTUc4NVh0MS9MdU1wMDRpZ3k2ZmZNTDBZaWUxS292L2FGUHox?=
 =?utf-8?B?RnU3R1g5cFdXMnAxcURQUS82aHJJc0RTMVRjT3JRYi9TaitpenJPNTVscnEv?=
 =?utf-8?B?cittYWM2QmlnRi81VzFOL25tQkhNd3dQd2xPc2RKVGNYOE83S1kxYjhqOUMx?=
 =?utf-8?B?c1lBSHhRTTNGTmhCMm5KSHV6ZWc5SkhDWXF2RDQ0WkVmbERnYy9xWWMweFdW?=
 =?utf-8?B?ZzJyN2w4blBXcHRnQnVWbGVmeERocmhRb29jR0trSllsSHhWYWZEV1RSRlVj?=
 =?utf-8?B?eXhQS2M2TE9TNXlsVDFNVlNyK0NSeEtzQmhMNjQzSjB5RFQxbjFtT1hneHZp?=
 =?utf-8?B?QVlldGJDY1U1NXJWcWNqdk52SEV0K2x2NUZNSndBR0ZDZnJkYUR2RU1zSDRz?=
 =?utf-8?B?K0NJUHV3bVErc1NNRUx0SjZ4RXdNR0RlTU9maFdaZlZmaGc1TFljT25ZWHVh?=
 =?utf-8?B?MlRXVU0raDBsSlJtSW11ZDEwYXQzMU5GYWcvZnYrSEl3clU0d1p3MmdpTGxH?=
 =?utf-8?B?cUdsTXlNZzBkRVRWYzMxR3U4S1RiMGRMQkNBWW1sb1AyRk84TGVtN0t4anFN?=
 =?utf-8?B?TlFFOVZuQVQwZExwRHRRSHdzdXZKREZmdSthMlhEbi9SWHV5UEYwU1FYOVB3?=
 =?utf-8?B?UUlHRFJpaFB5MXpPSDFDWW1XRDgxM2lTcjVyNjUyUU1FUDVXRGFvRDBJdlRG?=
 =?utf-8?B?bERPbytZZWtHQmxCSnp3RHRMSWJyRWlTcG14NUdleXk4bFdtMFNCWkFoT1Jy?=
 =?utf-8?B?MlhzY1dxZVlJeTAxRWNPNlZLZ1o3QzVqWldpeXR1VmVwMGhyY09vaVcxQUxt?=
 =?utf-8?B?TXd5dVViSjhacFlKVkxxTjNFQnBVeWJUTkExUUo5Q1p6SXRKYVd1c1Npa3py?=
 =?utf-8?Q?fodQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e6fdb0-c94c-43d5-15d2-08dcefbfbbf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 21:56:35.0292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 94DsHR7UkwaA5xuX8+Fv87zw0oQ03cutuAKBD5WtM6UwUyoPSHjDgX55wlTRY1oJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 21:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206072

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZSBTYWtvbWFuIDxzdGV2
ZUBzYWtvbWFuLmNvbT4NCj4gU2VudDogZGVuIDE4IG9rdG9iZXIgMjAyNCAyMjoxOQ0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz47IG9wZW5l
bWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV1bc2NhcnRoZ2FwIDE3LzE4XSBpbWFnZV9xYTogZml4IGVycm9yIGhhbmRsaW5nDQo+
IA0KPiBPbiBGcmksIE9jdCAxOCwgMjAyNCBhdCAxMjo1NuKAr1BNIFBldGVyIEtqZWxsZXJzdGVk
dA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgU3RldmUgU2Frb21hbg0KPiA+ID4gU2VudDogZGVuIDE2
IG9rdG9iZXIgMjAyNCAxNToyNw0KPiA+ID4gVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiA+ID4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bc2NhcnRo
Z2FwIDE3LzE4XSBpbWFnZV9xYTogZml4IGVycm9yIGhhbmRsaW5nDQo+ID4gPg0KPiA+ID4gT24g
VHVlLCBPY3QgMTUsIDIwMjQgYXQgMzo0MeKAr1BNIFJpY2hhcmQgUHVyZGllDQo+IDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gT24g
VHVlLCAyMDI0LTEwLTE1IGF0IDExOjUwIC0wNzAwLCBTdGV2ZSBTYWtvbWFuIHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IExvdWlzIFJhbm5vdSA8
bG91aXMucmFubm91QG5vbi5zZS5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBNYWtlIEltYWdl
UUFGYWlsZWQgaW5oZXJpdCBCQkhhbmRsZWRFeGNlcHRpb24gc28gZXhjZXB0aW9ucyByYWlzZWQN
Cj4gaW4gdGVzdHMgYXJlDQo+ID4gPiA+ID4gY2F0Y2hlZCB3aGVuIHRoZSBhY3R1YWwgdGVzdCBm
dW5jdGlvbiBpcyBleGVjdXRlZCBieQ0KPiBiYi51dGlscy5iZXR0ZXJfZXhlYy4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IENoYW5nZSB0aGUgZG9faW1hZ2VfcWEgdGFza3Mgc28gZXJyb3JzIGFyZSBo
YW5kbGVkIHdpdGgNCj4gb2UucWEuaGFuZGxlX2Vycm9yLiBBZGQNCj4gPiA+ID4gPiBzb21lIGNv
bW1lbnQgdG8gZXhwbGFpbiB0aGlzIHJlcXVpcmVzIHRvIGxpc3QgdGhlIHRlc3QgaW4gRVJST1Jf
UUENCj4gb3IgV0FSTl9RQS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFtZT0NUTyAjMTQ4MDddDQo+
ID4gPiA+ID4gaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNDgwNw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTG91aXMgUmFubm91
IDxsb3Vpcy5yYW5ub3VAbm9uLnNlLmNvbT4NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPiA+ID4g
PiAoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdA0KPiA5MDVlMjI0ODQ5ZmJiZWQxNzE5ZTBhZGQy
MzFiMDBlMmQ1NzBiM2I0KQ0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlIFNha29tYW4g
PHN0ZXZlQHNha29tYW4uY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICBtZXRhL2NsYXNz
ZXMtcmVjaXBlL2ltYWdlLmJiY2xhc3MgfCAxMSArKysrKystLS0tLQ0KPiA+ID4gPiA+ICBtZXRh
L2xpYi9vZS91dGlscy5weSAgICAgICAgICAgICAgfCAgMiArLQ0KPiA+ID4gPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL2ltYWdlLmJiY2xhc3MgYi9t
ZXRhL2NsYXNzZXMtDQo+IHJlY2lwZS9pbWFnZS5iYmNsYXNzDQo+ID4gPiA+ID4gaW5kZXggMjhi
ZTZjNjM2Mi4uYTY4MmI1ZjNiMiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMt
cmVjaXBlL2ltYWdlLmJiY2xhc3MNCj4gPiA+ID4gPiArKysgYi9tZXRhL2NsYXNzZXMtcmVjaXBl
L2ltYWdlLmJiY2xhc3MNCj4gPiA+ID4gPiBAQCAtMzA4LDIzICszMDgsMjQgQEAgYWRkdGFzayBk
b19pbWFnZV9jb21wbGV0ZV9zZXRzY2VuZQ0KPiA+ID4gPiA+ICAjDQo+ID4gPiA+ID4gICMgVGhl
IGZ1bmN0aW9ucyBzaG91bGQgdXNlICR7SU1BR0VfUk9PVEZTfSB0byBmaW5kIHRoZSB1bnBhY2tl
ZA0KPiByb290ZnMNCj4gPiA+ID4gPiAgIyBkaXJlY3RvcnksIHdoaWNoIGlmIFFBIHBhc3NlcyB3
aWxsIGJlIHRoZSBiYXNpcyBmb3IgdGhlIGltYWdlcy4NCj4gPiA+ID4gPiArIw0KPiA+ID4gPiA+
ICsjIFRoZSBmdW5jdGlvbnMgc2hvdWxkIHVzZSBvZS51dGlscy5JbWFnZVFBRmFpbGVkKGRlc2Ny
aXB0aW9uLA0KPiBuYW1lKSB0byByYWlzZQ0KPiA+ID4gPiA+ICsjIGVycm9ycy4gVGhlIG5hbWUg
bXVzdCBiZSBsaXN0ZWQgaW4gRVJST1JfUUEgb3IgV0FSTl9RQSB0bw0KPiBwcm9tcHQuDQo+ID4g
PiA+ID4gIGZha2Vyb290IHB5dGhvbiBkb19pbWFnZV9xYSAoKSB7DQo+ID4gPiA+ID4gICAgICBm
cm9tIG9lLnV0aWxzIGltcG9ydCBJbWFnZVFBRmFpbGVkDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAg
ICAgIHFhX2NtZHMgPSAoZC5nZXRWYXIoJ0lNQUdFX1FBX0NPTU1BTkRTJykgb3IgJycpLnNwbGl0
KCkNCj4gPiA+ID4gPiAtICAgIHFhbXNnID0gIiINCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAgICAg
Zm9yIGNtZCBpbiBxYV9jbWRzOg0KPiA+ID4gPiA+ICAgICAgICAgIHRyeToNCj4gPiA+ID4gPiAg
ICAgICAgICAgICAgYmIuYnVpbGQuZXhlY19mdW5jKGNtZCwgZCkNCj4gPiA+ID4gPiAgICAgICAg
ICBleGNlcHQgb2UudXRpbHMuSW1hZ2VRQUZhaWxlZCBhcyBlOg0KPiA+ID4gPiA+IC0gICAgICAg
ICAgICBxYW1zZyA9IHFhbXNnICsgJ1x0SW1hZ2UgUUEgZnVuY3Rpb24gJXMgZmFpbGVkOiAlc1xu
Jw0KPiAlIChlLm5hbWUsIGUuZGVzY3JpcHRpb24pDQo+ID4gPiA+ID4gKyAgICAgICAgICAgIHFh
bXNnID0gJ0ltYWdlIFFBIGZ1bmN0aW9uICVzIGZhaWxlZDogJXNcbicgJQ0KPiAoZS5uYW1lLCBl
LmRlc2NyaXB0aW9uKQ0KPiA+ID4gPiA+ICsgICAgICAgICAgICBvZS5xYS5oYW5kbGVfZXJyb3Io
ZS5uYW1lLCBxYW1zZywgZCkNCj4gPiA+ID4gPiAgICAgICAgICBleGNlcHQgRXhjZXB0aW9uIGFz
IGU6DQo+ID4gPiA+ID4gICAgICAgICAgICAgIHFhbXNnID0gcWFtc2cgKyAnXHRJbWFnZSBRQSBm
dW5jdGlvbiAlcyBmYWlsZWQ6ICVzXG4nDQo+ICUgKGNtZCwgZSkNCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IC0gICAgaWYgcWFtc2c6DQo+ID4gPiA+ID4gLSAgICAgICAgaW1nbmFtZSA9IGQuZ2V0VmFy
KCdJTUFHRV9OQU1FJykNCj4gPiA+ID4gPiAtICAgICAgICBiYi5mYXRhbCgiUUEgZXJyb3JzIGZv
dW5kIHdoaWxzdCB2YWxpZGF0aW5nIGltYWdlOg0KPiAlc1xuJXMiICUgKGltZ25hbWUsIHFhbXNn
KSkNCj4gPiA+ID4gPiArICAgIG9lLnFhLmV4aXRfaWZfZXJyb3JzKGQpDQo+ID4gPiA+ID4gIH0N
Cj4gPiA+ID4gPiAgYWRkdGFzayBkb19pbWFnZV9xYSBhZnRlciBkb19yb290ZnMgYmVmb3JlIGRv
X2ltYWdlDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2UvdXRp
bHMucHkgYi9tZXRhL2xpYi9vZS91dGlscy5weQ0KPiA+ID4gPiA+IGluZGV4IDE0YTdkMDdlZjAu
LjgzZjE0NDA4ODcgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvbWV0YS9saWIvb2UvdXRpbHMucHkN
Cj4gPiA+ID4gPiArKysgYi9tZXRhL2xpYi9vZS91dGlscy5weQ0KPiA+ID4gPiA+IEBAIC00ODIs
NyArNDgyLDcgQEAgZGVmIGdldF9tdWx0aWxpYl9kYXRhc3RvcmUodmFyaWFudCwgZCk6DQo+ID4g
PiA+ID4gICAgICAgICAgbG9jYWxkYXRhLnNldFZhcigiTUxQUkVGSVgiLCAiIikNCj4gPiA+ID4g
PiAgICAgIHJldHVybiBsb2NhbGRhdGENCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC1jbGFzcyBJbWFn
ZVFBRmFpbGVkKEV4Y2VwdGlvbik6DQo+ID4gPiA+ID4gK2NsYXNzIEltYWdlUUFGYWlsZWQoYmIu
QkJIYW5kbGVkRXhjZXB0aW9uKToNCj4gPiA+ID4gPiAgICAgIGRlZiBfX2luaXRfXyhzZWxmLCBk
ZXNjcmlwdGlvbiwgbmFtZT1Ob25lLCBsb2dmaWxlPU5vbmUpOg0KPiA+ID4gPiA+ICAgICAgICAg
IHNlbGYuZGVzY3JpcHRpb24gPSBkZXNjcmlwdGlvbg0KPiA+ID4gPiA+ICAgICAgICAgIHNlbGYu
bmFtZSA9IG5hbWUNCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGNhdXNlZCBmdXJ0
aGVyIGlzc3VlcyBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseS4NCj4gPiA+ID4NCj4gPiA+ID4gaHR0
cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L2NvbW1pdC8/aWQ9YjBlYjJiOWIzNjYwZGZk
YTFjNGM0M2NmY2NhNmEyYzRhODRkNmRjOA0KPiA+ID4gPg0KPiA+ID4gPiBmb3IgZXhhbXBsZS4N
Cj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHJldmlld2luZyEgIEkndmUgZ290IHRoYXQgb25lIG5v
dyBhbmQgd2lsbCBhbHNvIHRha2UgaXQgZm9yDQo+ID4gPiBzdHloZWFkLg0KPiA+ID4NCj4gPiA+
IFN0ZXZlDQo+ID4NCj4gPiBEbyBub3RlIHRoYXQgSSBzZW50IGFuIGFsdGVybmF0aXZlIHBhdGNo
IGZvciBTdHloZWFkIHRoYXQgZG9lcyBub3QNCj4gPiByZW1vdmUgdGhlIEltYWdlUUFGYWlsZWQg
ZXhjZXB0aW9uLiBXaGlsZSBJIHdvdWxkIGJlIGhhcHB5IHRvIHNlZSB0aGUNCj4gPiB2ZXJzaW9u
IHRoYXQgd2VudCBpbnRvIG1hc3RlciBiYWNrcG9ydGVkLCBJIGFzc3VtZWQgdGhhdCByZW1vdmlu
ZyB0aGUNCj4gPiBJbWFnZVFBRmFpbGVkIGV4Y2VwdGlvbiB3b3VsZCBiZSBjb25zaWRlcmVkIGFz
IGEgY2hhbmdlIGluIGJlaGF2aW9yDQo+ID4gYW5kIHRodXMgbm90IGVsaWdpYmxlIGZvciBiYWNr
cG9ydGluZy4NCj4gPg0KPiA+IFRoZSBhbHRlcm5hdGl2ZSB2ZXJzaW9uIEkgY3JlYXRlZCBmb3Ig
U3R5aGVhZCBjYW4gYmUgZm91bmQgaGVyZToNCj4gPg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjA0OTgyDQo+IA0KPiBTaW5j
ZSBJIGFscmVhZHkgdG9vayB0aGUgbWFzdGVyIHZlcnNpb24gZm9yIHNjYXJ0aGdhcCwgSSdtIGlu
Y2xpbmVkIHRvDQo+IHRha2UgdGhhdCB2ZXJzaW9uIGZvciBzdHloZWFkIHRvby4NCj4gDQo+IFN0
ZXZlDQoNClllcywgaW4gdGhhdCBjYXNlIGFueXRoaW5nIGVsc2Ugd291bGQgcHJvYmFibHkgYmUg
d2VpcmQuDQoNCi8vUGV0ZXINCg0K

