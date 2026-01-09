Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29C5D167ED
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:35:06 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6767.1767951305111919869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=MMJqFP6t;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.1, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4vt1yj893BmnyTh4G5nWkY5tz9co30Ek/kRfI+KKoYyfucs6WgqpP9JahnClpw71s+dUqbw+fdgvYehQ9yrRFkTdbO8KrHPYcrreItit1u0Bg6bBVnTc5MZfKyb6M991jJboRBDuo4HNGxyWDCdXUcK6WqzjqFrq7RWuMo3bTrQ0oTJlCYkMEfiF8OFeb1LQjDo4lkfZuInchA0GNPQgub6EomXzZAYY/SpQJgpjn3ilGEsgaE+PAYLisBVyN0EpZcSWPMPYepaCB0q0zffsYH0NqxTiXqlZGobaMSSGk3kYiQJ3gk/pJ0tRdNerpv+9MSC/ZzpkZ64I7bw0IsjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQa7soW0i7VLh7fF40t5qbYhbcFmp377Kd/74itM+nI=;
 b=Hrq4DSBtA3pIl5VULEyAKpxLZyWTD7XymLCiFFPQkVLheZOEBFE8YlqrLOprUP3X9JTdziSIsEH51wm0pQrZQqEmEYmSvvWpsG9JtW2wge/suSFuSNzR0W7utvB1xjjLK6ZI3Iaj+/BxsyqPJlh1Rd3Z9VKBqSU81BguqG8K3ryLILCIkYij3hvrZKVNFTwDd1I5JDZcAPNvrM369KYhODD9cNNHEURyUWmHHZwipogpmdl2rnD+7aT/41xgZ1D8qsfcc/Y0uFk3LVfWmy7ZugsJcUgM3sPGztuAOpYWU4XpdglHeaPDFGUWOigv+WzEstVcnFXzAJfTv8pmemCGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQa7soW0i7VLh7fF40t5qbYhbcFmp377Kd/74itM+nI=;
 b=MMJqFP6t8CPCjnbpGGqoR1BUBk/4VORVR47cOPmv7524MB1l1Wj9q6oWRwjmacdhJw8C9lfWA8+IQx1l3gmKtberimyXdhFdp8tBnhdlAgo+LGmYV+dwxeAqZrZL680dV81Z7vjolMDzRtmzvLsNKq/cE+si4X+vOKGc74b8CSMRZhKt+HCkoOKx9cVq1ZvanBhi4/I3P7IyMPluPGeOybzJUCrDfbZhxXVUMa7Hwwy+r47SVMf9dcD0ICnIS6JyfMDRJFRXkoy+1z0IMmoQDOnW/PmcNCmOUpzC7zE+//QGry1PTP++18G2IFKlJTpiB8TUmMoBS3xurRfDlE+egw==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYYPR01MB16314.jpnprd01.prod.outlook.com (2603:1096:405:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.0; Fri, 9 Jan
 2026 09:35:00 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::2c3b:3362:fd90:f8aa]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::2c3b:3362:fd90:f8aa%5]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 09:35:00 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIIHYyXSBweXRob24zLXJvbWFuLW51bWVy?=
 =?gb2312?Q?als-py:_upgrade_3.1.0_->_4.1.0?=
Thread-Topic: [OE-core][PATCH v2] python3-roman-numerals-py: upgrade 3.1.0 ->
 4.1.0
Thread-Index: AQHcgJLmPq+ChOdyDEaM7ZcKjChGVbVJgykc
Date: Fri, 9 Jan 2026 09:35:00 +0000
Message-ID: 
 <TY3PR01MB1011072F6B309CD08BC2C69329B82A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <20260108014101.1974-1-liuyd.fnst@fujitsu.com>
 <DFJ6DAKQHTKF.1V0HIXEAL96ME@bootlin.com>
In-Reply-To: <DFJ6DAKQHTKF.1V0HIXEAL96ME@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-01-09T09:34:59.101Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYYPR01MB16314:EE_
x-ms-office365-filtering-correlation-id: 24438379-be43-4b1d-5706-08de4f625c15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|1580799027|38070700021|8096899003|7053199007|13003099007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?TmJadzdoVjdnTWNvQ05jUStFL2g5Z0p1ME9nbU9YQjNrQVNZYk1qQ3U2bmlk?=
 =?gb2312?B?QXRZcXhvcHl3eU1MVnZVMndtUDRvelliUE1KTDd2Vml0ZmNxRGhNVStkSWE4?=
 =?gb2312?B?QWoxcS9pdnRCMXdFc2o3djJ0SzdnRTZVOE5QT1I1Y3dWQlc4Z09BeVZUSHdH?=
 =?gb2312?B?SnlwNFprQzNTM1FCbGkvcW41Nm5Kc0Z2UWNNRVZvc2ZIS0tXQjRsbHgycXBq?=
 =?gb2312?B?N2VnYmRnSWFjVXlHY29xVzhtSUhXTHR6L2dkK005cFlFTGxwSXV5YTFURThF?=
 =?gb2312?B?a0h4d1lNMEdsTm5YYlBuQy9iUmlxWU5YTDA1dzI3Ukp5Zkh1WGtFTk1hMHcx?=
 =?gb2312?B?RkpLbjRwcndUUjAvVGwwd0FLQ0UzRHlLbGZSVDMwNGxnOWFyN2dReWxTbS9U?=
 =?gb2312?B?ajBINE14S2xTanFmMVJGeGdxamxEb0xuemI3SlVEa1JTMHRKYUpwVy84ZDZT?=
 =?gb2312?B?akxvSUhYUW5RMFhOLzVHL1IxclRsOGY3NXBwOWtTNmphbjdQbk9HSVlMc2ZR?=
 =?gb2312?B?OHZLUEV6a3FpSTVqNSsxSFFpSHQ2YWovNDBRa2VrZEVpODB0a1c1UGpzVklG?=
 =?gb2312?B?aUFzVlh1bnk1STV6NFNOdDRpYjQxZjNuTUxLRSthQWZZOG9mc2tETkRtZCto?=
 =?gb2312?B?amtKTzBTMFc2eitlUDhnc0hkWWZUSkJnRFRRZkdSTGp3eE1lQ3J0UFBFNXNO?=
 =?gb2312?B?YyswNWQvdkVpYmxTKzViclVranpZMUErNVh1cmV2M3c2dm50OHpTZ2UzZ0k5?=
 =?gb2312?B?NTduczA3UEp4TVlIRnpZdlRsSmpBd0R1ZU5SN0RXbHltbW56dkZBNFY2Q2Fm?=
 =?gb2312?B?NGZsRGE1NzZRYkNWM0ZPMzBFdmNUakc4eUxrRExJdW1jMzBiU216eTJHTTcr?=
 =?gb2312?B?L01UdTNFbHdrMnY4cTBhY0NETUFyd08vbUNEMXlzU0s3K0lsNlZxbmZsRG5r?=
 =?gb2312?B?TW9kQVpoeTFrVWpxeGMvejI3SGVkMS9CYjh6L3owOGtZTkRyOWpSR1gzejRl?=
 =?gb2312?B?TlpQK1EzVDNnc2drN2ZCMDJhTWE0R3UxczBia0hhc014TXh0OXloUzVQNnZu?=
 =?gb2312?B?Rzh2aUJOMWxzSFNrL2hCc2xrelJYZDRRY09DRUNya1JrdVF0RDFpME5KYko5?=
 =?gb2312?B?Q2Q0UFdaNFZ3cDc3S0RWYk8yN2REbUpnM2kwZndJaVNPL2d0bmRHVWUwWkY2?=
 =?gb2312?B?S25NSW90WEpPZE16WjV4cUYxV3Z1dG9lN3lLaHcvcjlXc1lvcnd6L3RZVDE2?=
 =?gb2312?B?UVAweFNRNmhvY09qOTJGSHlCbng2ZHVoM2xOVUJubEpuZnI1SWpDYm9uZWsr?=
 =?gb2312?B?cFArWW5MekZhTGljRDhHMm10THk0T2pVUTVnMDdtYTFDc0RxOFdOaExWUlVj?=
 =?gb2312?B?UTdtcEFQeFlqbzMvcm9yZ3ZSZXZ5R2RxTmI0bmEzd3p4NHV0d1dNQlkyVlNz?=
 =?gb2312?B?Ni96TjJ1OTc0SW5YMUc5cWUyYXVZaXY0S2d3MmZISzJKV1lJS3h2VmtCR1Bx?=
 =?gb2312?B?UEMwaWxOVlJ5SnZkanNtdzdRUFR5WlcyR3NIbWZLcHBYVi92RDVTT1hHTFNy?=
 =?gb2312?B?VU10RlNSejdDWmpRNk1xbDZzY3YrazNXOWVXRjJweXFLYjN2dE5qbWJyRHNC?=
 =?gb2312?B?Nk9iYzYwSFREaGxsVktlSzRZdVZYb2tPK3RJUVo3V2pCaWNqUFNyUW9hL1Uv?=
 =?gb2312?B?cmdRZi9ybmFiSnJBa2dXYTNWVTA3c0JoVlAyWW1HQlNNN2p1ZnhCWVg5YUc2?=
 =?gb2312?B?Sis1VDdadTZtMURDQnY1N1dlWjNrVkFyWjVBcjRtZ1c5Snk0c3cySXZVOHd0?=
 =?gb2312?B?UXJrTmp6d1RnTkxhS3JjRk1Pak5TUFlrcjk4eUhjRTRpTnFOMlEvcjNvSm1C?=
 =?gb2312?B?bUFTdXY0ZVhaNm13c0FDODU3VU81bEVueGZKTTJQbFZzTDNKZ1RxaGxpK1Fa?=
 =?gb2312?B?Z1ROMWF5SmZINEViRU1ldFFhUzluQzJJU2VDNEZNUlFOem9LYWQrQUdycE1N?=
 =?gb2312?Q?CCN7nZ6MPayElnR2NyhxRR32aWjGLo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(1580799027)(38070700021)(8096899003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?d0d3RldFZGdvNzFCTlhHTk9MbDNTOWpqdHBoUi94dHlMV2IvQ1RYSjdqaHhN?=
 =?gb2312?B?QW5hbFloQklCYnVQYjByKzZ4ZEtZWEpBdlFiU3ZoZlQzWWFPVlM4eGR5dDkv?=
 =?gb2312?B?ck92eUh3c1RqaXVGRWpNbG9oa3EyT2RPZFdHL3hneGZneG56RU5UY3ZzQ1NC?=
 =?gb2312?B?cE1sWDc1eHZQWHpMNFdlOURmVFBmTXQvRmVURnlwdzMrL0Q0cmtSNGU5VXFY?=
 =?gb2312?B?R3ZucEl5cGx2MTZBM1Z6VVdHUEhEcG13SmFDZ0NIQ2tIUW1MS1A2bStKcDI1?=
 =?gb2312?B?dDlXWmk4bEF4WC9rZytqaFB0RFdVaGQzWlZFanRXa3NrWGhNbzZLSWhvMXlT?=
 =?gb2312?B?Ri9GMEsybUkzTjFVOGJ0SU8rTHNqVVFpT3ZTallseFFjK2tleHJPYm11ekVS?=
 =?gb2312?B?UWJtS2VFRUVGMTgrOVZ3ZGpLaHRPNjFUTHROOWpveUJ5OHgzQUFHVHF1dkVp?=
 =?gb2312?B?MHJWeFE2VVYyd0phanhycnlUWUc4TmNwZUZzWFkxTDJ1bGg0NWpkSDdtOGdD?=
 =?gb2312?B?ZkNaUUtqOUZzM1V3T2IvSFYwNmpiZmswZWdyS1V1TTBURDhBSTZTTjhiTnpS?=
 =?gb2312?B?UVZZbkJvcnFJSmE4MXhSZURwQjhoZXFXb3Y3Z1ZoNXcydzZmdFNuNnRtdk9i?=
 =?gb2312?B?aUdTaDE5UXczbnkvZGl4VGp0Qmhpdkd4TzlhUnhNK2pKZk00cTZPbXczZ2lT?=
 =?gb2312?B?RDV6WUF1NE1CaE9jRG1MVzR0SUp1MnFNamZaRVlMV0NSbTV5KzZKcFVhTHl1?=
 =?gb2312?B?aUkrbGYvZ3owVzlrNWl5VlpMNXBIWnBkelVHcWFXZTJDRnBqODdYTmlabktL?=
 =?gb2312?B?WjVxWUh3L2dXdnBkd2dMY2pqY3B5VjQ1cFMyUjNhbDZ1dndQcHJKQ2w2UEZo?=
 =?gb2312?B?OTNjN3BOSFU5YW9aNVkzdFlCYWlRU1lzU2ZNZXBYNnVQcER1eDZ4eW9qeld4?=
 =?gb2312?B?aEV3cUNweFo2VFRSeWNvUW0rVElIazQ1MEJSZWFHM2ZOd1preE5vZUtvOVVr?=
 =?gb2312?B?eUxkcURqQVBISk5NUU82K1BYQ3lvRmJ5dDB1bTNGWFVpUUJjK2Z0bnhxdnJP?=
 =?gb2312?B?Vlh2ZlZrUjZoZ1IrWFU0RHR5c2NocWFFZ1dCWWdSWDhTZTdkNTJlK1NyeWJJ?=
 =?gb2312?B?ek1HYWRZdWhwdUJDaEFiQndIUXNrbkJ1eFlJdVkzWGpmNUZTN0VjR01VUWZl?=
 =?gb2312?B?VFlnRmpRdTJ4NWd4YzR4NFlaSldmbEFMdy9rOGttemVjUWZuNWpWZWhkeGQ1?=
 =?gb2312?B?NDMzTHhQb2szMGJkL1NVRVAyOXQ5Uk1wL2QwRGs0R1R5SEhia0I3NWtybEVm?=
 =?gb2312?B?RlA5VUlvMEZEdmloeEZQMjhwT3NuODFXNjJibS9VbUxXQThJc0lsbldZR2tE?=
 =?gb2312?B?dmV1QWtTc2lDV0h4blhOdFgxcThIZE9VT0diOTBpVmo4bVZPeTRyWG1WYk5I?=
 =?gb2312?B?WERNTFBhVm5mbWlNa29waGtPTjZQR2puQk4veitacUsrZDF0STQ1YUZUaWVK?=
 =?gb2312?B?MGlnTDNGTzhFaS9vU0Y4WVE4eDlZV0JGc3hIQi91bFpseWFhOWhGZHJ0RmVH?=
 =?gb2312?B?cGIvcDVQYUlpYWtoQXNYZllOL0pzK0hUSEt4Q2xQb0VUNm1ra0RUejJnZ25q?=
 =?gb2312?B?RUVxMlE2OE52cnA0M2FrM0ZKQUxGV0lsZEZlT281cXJhS2dITEVmdDErejUw?=
 =?gb2312?B?WGxpT2JxMUFNNUJxNWVPd2ZwM0tiTEhkUDgyanQzcUd4ME5DUFpZeFdXWVAr?=
 =?gb2312?B?NjR4bDhTVzNiV25ZazA2Wnc0U21hZnlTeFhsMGhqNHdBY0cvZnQzWUFQSkd3?=
 =?gb2312?B?YzdQYUdSTGdILzJEOTQxS1ZpWFVJUXM1M3F5aEtIOWNnTS9LRWRuSE8zazFS?=
 =?gb2312?B?TEJvREtocW1lUDhrQnFISHcxRkNBcjNMRzNZdHY5c2p5enRkQmFNUUQ5M01O?=
 =?gb2312?B?dWFWM3dsaEhuNkxZczFoUFZ0OXo4TWtBS0hUWjZrMmd6NWVabFRoMVpRaFVC?=
 =?gb2312?B?d0xGRnBaSEoyOWhXYlBXb081Ymt4NG03bXNtaWl5ZHJWeGVOcTlqcjlBSVF2?=
 =?gb2312?B?eEtiT2pyZkJiNXpma0xhaldhVm94SzN4aXF1OHhZVjJWWXZSM0lyTGFWNHQ2?=
 =?gb2312?B?d1U5aFlmSTk2TGF3MmZLaVpKSVIyV1dXUmF3MnkxMnJzak16enc1R2s1UDJ2?=
 =?gb2312?B?akpIOCtkRjhnTk8rRXJhbnpIVjdleXdaS0hEcWhtZlJPOW5uTmdPOUtoT0hj?=
 =?gb2312?B?RWYyWjc4ZVV0MWV6MmcrZE5ONHFhbVdYV2xkVGdSdnJiUnU3ZWlHMURadnhX?=
 =?gb2312?B?c0xHVkpONlkrb25sN091S1ZsMnpTZno0SW5QMHcxUms0bmlLbWw4UT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB1011072F6B309CD08BC2C69329B82ATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24438379-be43-4b1d-5706-08de4f625c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 09:35:00.3065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EaB5NRORdrY3LE2y7PMGW0CDIQQzaQDRNYsdY1g70h8q/s9+d9IPnNRTW53CepYXJeheSt6G85dZsEX8iN8i6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 09:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229098

--_000_TY3PR01MB1011072F6B309CD08BC2C69329B82ATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgTWF0aGlldQ0KICAgIEkgdHJ5ZWQgdG8gYml0YmFrZSBidHJmcy10b29scyB0byByZXByb2R1
Y2UgdGhpcyBlcnJvciwgQnV0IEkgY2FuJ3QgcmVwcm9kdWNlIGl0Lg0KDQogICAgQ291bGQgc2hh
cmUgeW91IGxvY2FsLmNvbmYgd2l0aCBtZT8NCg0KVGhhbmtzDQpMaXUNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQq3orz+yMs6IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGll
dS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0Kt6LLzcqxvOQ6IDIwMjbE6jHUwjjI1SAxOToz
NQ0KytW8/sjLOiBMaXUsIFlpZGluZy/B9SDS0rahIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPjsg
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCtb3zOI6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjJd
IHB5dGhvbjMtcm9tYW4tbnVtZXJhbHMtcHk6IHVwZ3JhZGUgMy4xLjAgLT4gNC4xLjANCg0KT24g
VGh1IEphbiA4LCAyMDI2IGF0IDI6NDEgQU0gQ0VULCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gMS5DaGFuZ2Vsb2c6DQo+ICAgUmVzdG9y
ZSBMSUNFTkNFLnJzdCBpbiB0aGUgcm9tYW4tbnVtZXJhbHMtcHkgbWV0YS1wYWNrYWdlDQo+ICAg
QWRkIHNvbWUgZGVidWcgYXNzZXJ0aW9ucyBmb3IgdW5zYWZlIGJsb2Nrcw0KPg0KPiAyLkFkZCBi
YmNsYXNzIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgdG8gc29sdmUgZm9sbG93aW5nIGVy
cm9yOg0KPiAgIHB5cHJvamVjdF9ob29rcy5faW1wbC5CYWNrZW5kVW5hdmFpbGFibGU6IENhbm5v
dCBpbXBvcnQgJ3NldHVwdG9vbHMuYnVpbGRfbWV0YScNCj4gICBFUlJPUiBCYWNrZW5kICdzZXR1
cHRvb2xzLmJ1aWxkX21ldGEnIGlzIG5vdCBhdmFpbGFibGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IExpdSBZaWRpbmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+IC0tLQ0KDQpIaSBMaXUsDQoN
ClRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCg0KQnVpbGRpbmcgYnRyZiBzZWVtcyB0byBiZSBicm9r
ZW4gYnkgdGhpcyB1cGRhdGU6DQoNCkVSUk9SOiBidHJmcy10b29scy02LjE3LjEtcjAgZG9fY29t
cGlsZTogRXhlY3V0aW9uIG9mICcvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdXg4Ni13
b3JsZC1hbHQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2LTY0LXYzLXBva3ktbGludXgvYnRyZnMt
dG9vbHMvNi4xNy4xL3RlbXAvcnVuLmRvX2NvbXBpbGUuMTM0NzE4NScgZmFpbGVkIHdpdGggZXhp
dCBjb2RlIDENCi4uLg0KfCBFeHRlbnNpb24gZXJyb3IhDQp8DQp8IFZlcnNpb25zDQp8ID09PT09
PT09DQp8DQp8ICogUGxhdGZvcm06ICAgICAgICAgbGludXg7IChMaW51eC02LjE0LjUtMTAwLmZj
NDAueDg2XzY0LXg4Nl82NC13aXRoLWdsaWJjMi40MikNCnwgKiBQeXRob24gdmVyc2lvbjogICAz
LjEzLjExIChDUHl0aG9uKQ0KfCAqIFNwaGlueCB2ZXJzaW9uOiAgIDkuMS4wDQp8ICogRG9jdXRp
bHMgdmVyc2lvbjogMC4yMi40DQp8ICogSmluamEyIHZlcnNpb246ICAgMy4xLjYNCnwgKiBQeWdt
ZW50cyB2ZXJzaW9uOiAyLjE5LjINCnwNCnwgTGFzdCBNZXNzYWdlcw0KfCA9PT09PT09PT09PT09
DQp8DQp8IE5vbmUuDQp8DQp8IExvYWRlZCBFeHRlbnNpb25zDQp8ID09PT09PT09PT09PT09PT09
DQp8DQp8IE5vbmUuDQp8DQp8IFRyYWNlYmFjaw0KfCA9PT09PT09PT0NCnwNCnwgICAgICAgRmls
ZSAiL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtd29ybGQtYWx0L2J1aWxkL2J1
aWxkL3RtcC93b3JrL3g4Ni02NC12My1wb2t5LWxpbnV4L2J0cmZzLXRvb2xzLzYuMTcuMS9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9weXRob24zLjEzL3NpdGUtcGFja2FnZXMvc3BoaW54
L3JlZ2lzdHJ5LnB5IiwgbGluZSA1NTMsIGluIGxvYWRfZXh0ZW5zaW9uDQp8ICAgICAgICAgcmFp
c2UgRXh0ZW5zaW9uRXJyb3IoDQp8ICAgICAgICAgICAgIF9fKCdDb3VsZCBub3QgaW1wb3J0IGV4
dGVuc2lvbiAlcycpICUgZXh0bmFtZSwgZXJyDQp8ICAgICAgICAgKSBmcm9tIGVycg0KfCAgICAg
c3BoaW54LmVycm9ycy5FeHRlbnNpb25FcnJvcjogQ291bGQgbm90IGltcG9ydCBleHRlbnNpb24g
c3BoaW54LmJ1aWxkZXJzLmxhdGV4IChleGNlcHRpb246IE5vIG1vZHVsZSBuYW1lZCAncm9tYW5f
bnVtZXJhbHMnKQ0KDQpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3ly
aWUvIy9idWlsZGVycy8xNy9idWlsZHMvMjgzNA0KDQpDYW4geW91IGhhdmUgYSBsb29rIGF0IHRo
aXMgaXNzdWU/DQoNClRoYW5rcywNCk1hdGhpZXUNCg0KLS0NCk1hdGhpZXUgRHVib2lzLUJyaWFu
ZCwgQm9vdGxpbg0KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6
Ly9ib290bGluLmNvbQ0KDQo=

--_000_TY3PR01MB1011072F6B309CD08BC2C69329B82ATY3PR01MB10110jp_
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
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">Hi </span><span style=3D"font-size: 11pt;"=
>Mathieu<br>
&nbsp; &nbsp; I tryed to bitbake btrfs-tools to reproduce this error, But I=
 can't reproduce it.<br>
<br>
&nbsp; &nbsp; Could share you local.conf with me?<br>
<br>
Thanks&nbsp;<br>
Liu</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Mathieu=
 Dubois-Briand &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA1=D4=C28=C8=D5 19:35<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH v2] python3-roman-numerals-py: upg=
rade 3.1.0 -&gt; 4.1.0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu Jan 8, 2026 at 2:41 AM CET, Yiding Liu (Fuj=
itsu) via lists.openembedded.org wrote:<br>
&gt; 1.Changelog:<br>
&gt;&nbsp;&nbsp; Restore LICENCE.rst in the roman-numerals-py meta-package<=
br>
&gt;&nbsp;&nbsp; Add some debug assertions for unsafe blocks<br>
&gt;<br>
&gt; 2.Add bbclass python_setuptools_build_meta to solve following error:<b=
r>
&gt;&nbsp;&nbsp; pyproject_hooks._impl.BackendUnavailable: Cannot import 's=
etuptools.build_meta'<br>
&gt;&nbsp;&nbsp; ERROR Backend 'setuptools.build_meta' is not available.<br=
>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
<br>
Hi Liu,<br>
<br>
Thanks for your patch.<br>
<br>
Building btrf seems to be broken by this update:<br>
<br>
ERROR: btrfs-tools-6.17.1-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/btrfs-t=
ools/6.17.1/temp/run.do_compile.1347185' failed with exit code 1<br>
...<br>
| Extension error!<br>
|<br>
| Versions<br>
| =3D=3D=3D=3D=3D=3D=3D=3D<br>
|<br>
| * Platform:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux; (Linux=
-6.14.5-100.fc40.x86_64-x86_64-with-glibc2.42)<br>
| * Python version:&nbsp;&nbsp; 3.13.11 (CPython)<br>
| * Sphinx version:&nbsp;&nbsp; 9.1.0<br>
| * Docutils version: 0.22.4<br>
| * Jinja2 version:&nbsp;&nbsp; 3.1.6<br>
| * Pygments version: 2.19.2<br>
|<br>
| Last Messages<br>
| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|<br>
| None.<br>
|<br>
| Loaded Extensions<br>
| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|<br>
| None.<br>
|<br>
| Traceback<br>
| =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
|<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; File &quot;/srv/pokybuild/yocto-worke=
r/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/btrfs-tools/6=
.17.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/sphinx/registr=
y.py&quot;, line 553, in load_extension<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raise ExtensionError(<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _=
_('Could not import extension %s') % extname, err<br>
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ) from err<br>
|&nbsp;&nbsp;&nbsp;&nbsp; sphinx.errors.ExtensionError: Could not import ex=
tension sphinx.builders.latex (exception: No module named 'roman_numerals')=
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/buil=
ds/2834">https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds=
/2834</a><br>
<br>
Can you have a look at this issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB1011072F6B309CD08BC2C69329B82ATY3PR01MB10110jp_--

