Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE077CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:30:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.60])
 by mx.groups.io with SMTP id smtpd.web11.2128.1758645019531265553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 09:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=n/xJUMO6;
 spf=pass (domain: axis.com, ip: 40.107.162.60, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXLnEe3Xy+FS8KVctwn+hkB6JydQRTnuo/gXcHK8+qywLjWdAhcnhk32ubretUZ8n41E7rIc+E8QCo+ulk55VkdN3HNy1V6BhniPsH4IvC9QDQOSLqCpUH2qKalbNJmH86t6IcUCuAXPWv3GJhA5SXKVWLFJMCztfKhuLaKbtgfzTkE275G+uuBKeqIMA91g0R67iOd8HUmNBKQepY3GxbKtPcZmx1CO8K0xC5DmT9e9XymOexwmSMTeqxvxzgY8twboS12SNBB8s55Syc3yjjy1JSRAsudWfKxYfJi8lUBAMr9N2Xh+egC75f+9oTPxB7xIufCLfqZCf9nalGvjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K6pMuuiow26pk6fssOI/NuVQc6WCwiw9lwq6RXaBTA=;
 b=iyGvBT2yFjwGaD9ybGM3GriUrbh3+SCURMqdU2JpQFtqW1D23ra9QwMVGNX3mOshKOXgS5tvXhcuTv1fvG4hX8qpGWPQJvF3A7Vgd0ICvmAu3LtJ29hEDsGrNVioHIPPZRscCpm7Wq9z/FImoNkAawMfnAulKMlwZNBHVHXTiSjjFFvcsXITu352bhK+cVG3cu50xfL7HJz4FN1yIvB96PERrj+E9Iy0cYfau9rmYp3mXeDXOHlQ+MSGeYu0aWi0xSa3EVIWQ2tZP6TLzDXGIg8NTZk+GlHxXE3HG9fbi69K08AvMOhmkpm8Amc1xmX2XKQyAJ+2Gp/ZmbH11Ag+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K6pMuuiow26pk6fssOI/NuVQc6WCwiw9lwq6RXaBTA=;
 b=n/xJUMO6Gyk0L7GStHSM69j2QdC9PiubOiYHqDtJxtrfqndqoy45Ns8+bKA5G1krgfrrX5gingo+/URx/WyYkbF9wzaNxs0iEBO3jL8fDYerje3Y88rBKEfdcXWcR1rWdRBnBGrdAReGZXs+trzZSzVIp3SjrkUbvJlL9B3NsKw=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by PA6PR02MB10877.eurprd02.prod.outlook.com (2603:10a6:102:3d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 16:30:15 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 16:30:14 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: Daniel Wagenknecht <dwagenknecht@emlix.com>, Adrian Freihofer
	<adrian.freihofer@gmail.com>
Subject: RE: Direct expansion of vars in inline Python expressions (was: RE:
 [PATCH] os-release: do not add empty parentheses to VERSION)
Thread-Topic: Direct expansion of vars in inline Python expressions (was: RE:
 [PATCH] os-release: do not add empty parentheses to VERSION)
Thread-Index: AQHcLKJyoWRaKJgSU06v1FiP9OLC6bSg8fVg
Date: Tue, 23 Sep 2025 16:30:14 +0000
Message-ID: 
 <AS8PR02MB10201D91FFF4D4B97DE2A197EEF1DA@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20250912161917.844344-2-dwagenknecht@emlix.com>
	 <DB5PR02MB10213CC660236ED26287025A1EF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <ca7c6bc4f4f80fb260758915c379385fca211419.camel@emlix.com>
 <1867F4659CA4DC12.16927@lists.openembedded.org>
In-Reply-To: <1867F4659CA4DC12.16927@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|PA6PR02MB10877:EE_
x-ms-office365-filtering-correlation-id: 5ff4839c-dc80-4bcb-ea08-08ddfabe79a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cGZGUnNiaTBwQzBrTW9BR2dNMFYzMDVRLzJDWU9EenhaanNKVmJ0UTVnSldz?=
 =?utf-8?B?N2RpZTJqeWF3bUVCY001cEpRTTVFMkZDcUN1NnRpT0dDb1ZEdFlMR2dNNFdO?=
 =?utf-8?B?c2FwN3g0dVh4cW81azh6Z0doZUJhTktTcm9qS0F1YkpGRkxnUHlRbHlnVFdB?=
 =?utf-8?B?cUk5bDJRRGVYSjc2RklJdXEvSzdBUzd6cXZuSEpyUHMvbU1CbStRVUxmTjNW?=
 =?utf-8?B?WVZyNjJIdzRjNDZKZnlWQUo3MmxzQTljMDhNQ0F0T3BIU2daeUJJa3RtZVc2?=
 =?utf-8?B?eVFjZG0zVm1KZWVoSnBRcDF0OGh5Y2dPaUljUFAvZWxBNXRKTHJhOVZHZlBO?=
 =?utf-8?B?RkhBTDlIUm9Gc2NBWFdZQ3ZHaHp5OVFiQTArazJ4VldrbWl1bzZGVWRIQkVF?=
 =?utf-8?B?cHF5bStXVFFBT3QvRHBUZUVmcG9uOC9XQktGMGdtQ25KaW1ramExZXMrcEJv?=
 =?utf-8?B?dHEwaU9yakc4ZTFJT05PNjNUdDhxL2V4OVcrdG5TZU4zRDdXUDA1cDRia3gz?=
 =?utf-8?B?MTdyNXBxWEhtMzdlMDNMMUR6bzdNc010WHdLZzRGc1VJZk9YTmg0T3ArckNm?=
 =?utf-8?B?Ujl5bGxsTlhJaW5LY0ZxTWgreXMxZVAxL0VpdXJSMWdaQUlPdjBmM3VINlBE?=
 =?utf-8?B?QzRkWU94c3pMV2NRbFJ1dW5CL1R0RzNtYjE5aEIrdEM3eDVHSFpBZjFGL0tJ?=
 =?utf-8?B?YThIV2QxV01Od2F6K2dRbFh3NG43UUxZZHU4cVlTaENhVncrWDR5Wm5Cb01F?=
 =?utf-8?B?T09GT3FDNGV3WHpTb1FEaFhSVTdzYXl2RTNOeWNuZWg5QkRTNTBDR3VaTGR0?=
 =?utf-8?B?dElEQk85QjlRK0RqUTErakxWdFRNOVhTZjNqZVNzSTRtVUVSVGxyZXl1QzVn?=
 =?utf-8?B?bDgydjRBczUrZit4c2gvbVpIKy95UzF5dW0rMGdkZVZsSTdkUGxKNlo3dUVB?=
 =?utf-8?B?Y0RITUNwOTRSN2RxSXZlelU3VTF0aTZWZmdDUnJyZmdweENTS0M0QWd4UDhs?=
 =?utf-8?B?dFp2Tk9QOW14RzZIbTdWWkJTSlFoeGNiVDZGSmxLZFpCZDNyVkhFMDlZUWxh?=
 =?utf-8?B?c3FFUkozbmhZZm9KcWQyV3RQQ0dwbE9aTUpWNzlxME5IUmZ3blc2UEczb0NL?=
 =?utf-8?B?ckxWd0E4RkplZDBWY2Q2WEVuNy9KWnlJeTdWZVVreXNBTERDT2g2ZG9pVHE1?=
 =?utf-8?B?enBjSnZ3WUZ4ZW9sdkd0SEQwaFhEVVA4WjJvQkZXS1htQ0lyYjZYWU1HRXZM?=
 =?utf-8?B?a0k1WlVPQUoxS2hLenF6UmxxS1N0c2tJZWJwb280bC9ZWm80dXRFd3NvUlJ0?=
 =?utf-8?B?NnlobS93S016RXJlVzRJdjFwelVaTDhkTWhVR0M4MkcvaHJ4WjNuQVl5VThh?=
 =?utf-8?B?MStHdkFiOXkvSDBrNXRZcm4rUVlXSzliaUVHWkp3V3FNUFl1TUtDaTVIVVZE?=
 =?utf-8?B?VkI1ODZvNTUwZnRackhvR0cxRVpXV2lwY2pWRHNkemFVbEZ0enkwZDJlV3l4?=
 =?utf-8?B?bEI3RkplUUVvbnRXNkszZldiS2w2RGdkVE44aVNkUVUrVDdpbDg5bWZGRnhv?=
 =?utf-8?B?OE5tT1d3emxiWU1XYlNMTSt0Ti9WV0FDZHA0UmZEQmZQYUdFSGloTzVsWjZ5?=
 =?utf-8?B?eGpZQmoxd0RjUTQwMkY2SlJhRGJvMXVCbW9KMUo4Z0RzZ2JUdjN3blJRdGhB?=
 =?utf-8?B?U3Zwa1JMZThOaS9wb2J5dUI1Y2hISk1lMVlXUWpsRlNwVUMvMEJHek4rbFYv?=
 =?utf-8?B?WmxHYVkvLzlxdzVXV2lhUkhiN3k0Y1RoTFY0V3g5SjNrS1FyS2R2UW5Tbk0r?=
 =?utf-8?B?MzNXKy9PbVFUdXZObytiMXVpS2l3U2gyTFV5dmtzVFo4WGgzMGNIRG5IRFM4?=
 =?utf-8?B?bXFPUGw4bWVGdlI0WThNTmFzaFFRbDR5cTRCWjVianlyNndycHJNYjFEM2dX?=
 =?utf-8?Q?Otfllxovi3U=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzBZZkRTeVp3RTJHT2tIaUViMGo3dW1sei9xSFV4QXRoa0ZXNFlMRlBkcXNG?=
 =?utf-8?B?N0R3bFFxeHgxVmR5cjV4MHlmZHlvSE4zSVlPUDBOTnNtOGtiSDNtSXlGNy9j?=
 =?utf-8?B?L2J2TmRhY1R1UWNIU1o3bFpSYm4wVDhVTEVmRGgwWXowa1d6TExQV0c1dHcz?=
 =?utf-8?B?cTJ1NENld0Z5MnhPemhtTkU3Tnp6d0RXNkduMmpZRUpET0p6TWw2VGtZK05T?=
 =?utf-8?B?cVd1eWJHSHFneUhZYUhva3BiSUVIVXRjUHFmWTZ6aTcwbTZYZUZSU21Ic1BT?=
 =?utf-8?B?NkZLNkNMVW1yMnhJM2pCS3ppbGZrK1NZRGpJSzY5MVdIQUtsTTlReEpzVlpB?=
 =?utf-8?B?S0J6YWJRbG1EYlRGT2ZxUVlldVpqb0JjWXNJT0w5RXRnYjlTSy9Pc2xGUUlo?=
 =?utf-8?B?NFd0eDdDY1I3dkluQTM1Y2ZIYzllZmo1WWNVNC8yWlhCaTRJS1N3YnZlcnlT?=
 =?utf-8?B?OU5OR0NBOFozbHRrdy9nbHloN3NidWNkd1drMGs0WGNZKzQ1VmNtV1BKRWg1?=
 =?utf-8?B?ZXZva0hrSElSY3MvVTFWVk1mbGdOZ1dwQnR4Q3R5TFNmQ1BHbUVaOVlsTFVZ?=
 =?utf-8?B?R3VkanJSSnRxOUVvR29FbmRqWmpFenRLU1FyMDh3cS95amxEd3YzVkxDQ0Uv?=
 =?utf-8?B?MVhHWUxKWEd6WkN6cjNqMm1hSnYvTCs5NUZsQVhyZ0xXc2tvYlF6RWJzVnA3?=
 =?utf-8?B?ZkZ2SGhNNm41NHV0V3Aya3NKZWIwMlFNb1N3TGFDaXJYMHQyN0ZyN2ZGWGti?=
 =?utf-8?B?RU43Q0h0cGV4alBjSUZneUZ4REM3TTU2NmFCb05LVjNJc0V2N1lUWXNRTHF4?=
 =?utf-8?B?N01NZXhtdTdndURudnRlV1d5aHBCd2ZXNjJrQ0lQWEY1OCtCcDVEUVpFOGZX?=
 =?utf-8?B?Nit2YTZZVkFqSEpudnhaOVlWUEN0WVlmK2xZeG5rVDdPdExELzRNU1AvV2hy?=
 =?utf-8?B?YjBsQ1hXemZycDhoYVE0VTJlODZncDIwTy9Nbk1TbllxMVEwdlUweXJybSsz?=
 =?utf-8?B?NEFueEsvZ2RoQU1NaGhlWXpIRTZ2SEwyeGNvVXgyZ3Byc2FtNmlHamJmQk5o?=
 =?utf-8?B?bk1yQ3VvK1JnZEtpVytBcnJUZjhDQ0hCRExwUWdIVUJnejYxdFkwZ2c2ZzRQ?=
 =?utf-8?B?bndXT0ZlMG52NjRpVTRsVnU2emVwY2ovSnNvWEhSNnV6djl0RGtIMGVRK1Az?=
 =?utf-8?B?OXdiWlZNSkVScG9ZTEdDWmF6cU8xYjRLWExvWGI1RlZqeTliWEdUZUJWcGR2?=
 =?utf-8?B?NHVJTGNnbHYrYWxIa1pYcEttUHhHVXlDbnEvbWk2amRBaWRmNHI5cndGQUQ1?=
 =?utf-8?B?SStqN1NOZ2lqek5jOCtjTFBDSXBVWkJmUkI5WkdYcDJGVEJGWmxRQmtNMGI4?=
 =?utf-8?B?SWNBQm9zMzgvOFhFelA2T213dzA4cmh3Zk1QSlhjdmRNdlRJcXdGaUtRZCsy?=
 =?utf-8?B?QXBmUVV1cmpWSzNpUFpVMXBKaFRhWlVqVmw0QTRDdnF4aU5EZWtEYTV5U2xO?=
 =?utf-8?B?aFNpL0NyYjdvcWllNjZXV2hwZnJTbkQzcDFMTm15WmRzZDRjV1UvZ2hKbnVz?=
 =?utf-8?B?enFuMzhKZUxLSTZTR216TDVsOWkramNxcldpd1hHMzZuUzh1V2h2MzNHUkFY?=
 =?utf-8?B?bnZNVEt6ZFNmVk1peWp6bWVFN0hUVkhqRGNiZHYwVkFtYTlRbEVlZTcwMUJw?=
 =?utf-8?B?QmZxRWI2ZWJWV3g5ek1MaTBYMFZjQjg5K21CQ3BSLzBjMm9GQXYzWjloZkl1?=
 =?utf-8?B?TENEekxEUHQvQlRRTmwxYTltS3dydFZGSmNnc1ZlYnBIZ0kvMS8zVVBCSFZq?=
 =?utf-8?B?Z3pwcktoa3dLRlNWd1hkWVNNYWdmRlFDTDFYcmJiOEgwWW1icnB3MU1ydlNw?=
 =?utf-8?B?a29aU0Y4bHYxMnRiRUNtaFB2RzkvTXl4OSs2M0U4OXkvS28zOFZJM2wrVlRn?=
 =?utf-8?B?TDJtSEtiQ1RqS3lKSWNUN05TK2ZqS2tJL1JhVHE0ZnZmb29hYTlid0lqaFov?=
 =?utf-8?B?Vk80dUErTlRqL3BpN09QYzdkOTJQZkQ5V284MzRsZGlocXQ1eDYyNmVaS3JD?=
 =?utf-8?B?dzVEaGRaNG44R0g5TW9RYmNVSGVpampXRmkzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff4839c-dc80-4bcb-ea08-08ddfabe79a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 16:30:14.7723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SLJBSx6IXAm1coFf0WxnETosNWiXhU3/Sp5MYLq/RNL+D4UGYlTfzqBu4+3j+wf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10877
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 16:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223905

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYWxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU2VudDogZGVuIDIzIHNlcHRlbWJlciAyMDI1IDE3OjU1DQo+IFRvOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IERhbmllbCBXYWdlbmtuZWNo
dCA8ZHdhZ2Vua25lY2h0QGVtbGl4LmNvbT47IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVp
aG9mZXJAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gRGlyZWN0IGV4cGFuc2lvbiBv
ZiB2YXJzIGluIGlubGluZSBQeXRob24gZXhwcmVzc2lvbnMgKHdhczogUkU6IFtQQVRDSF0gb3Mt
cmVsZWFzZTogZG8gbm90IGFkZCBlbXB0eSBwYXJlbnRoZXNlcyB0byBWRVJTSU9OKQ0KPiANCj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IERhbmllbCBXYWdlbmtuZWNo
dCA8ZHdhZ2Vua25lY2h0QGVtbGl4LmNvbT4NCj4gPiBTZW50OiBkZW4gMjIgc2VwdGVtYmVyIDIw
MjUgMTA6MDYNCj4gPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gb3MtcmVsZWFzZTogZG8gbm90IGFkZCBlbXB0eSBw
YXJlbnRoZXNlcyB0byBWRVJTSU9ODQo+ID4NCj4gPiBIZWxsbyBQZXRlciwNCj4gPg0KPiA+IHRo
YW5rcyBmb3IgdGhlIFJldmlldyENCj4gPg0KPiA+IE9uIFNhdCwgMjAyNS0wOS0xMyBhdCAxMDoy
OCArMDAwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+ID4NCj4gPiA+IFZFUlNJT04g
PSAiJHtESVNUUk9fVkVSU0lPTn0ke0AnICglcyknICUgRElTVFJPX0NPREVOQU1FIGlmIChkLmdl
dFZhcignRElTVFJPX0NPREVOQU1FJykgb3IgJycpICE9ICcnIGVsc2UgJyd9Ig0KPiA+DQo+ID4g
eW91IGFyZSBjb3JyZWN0LCBJJ2xsIHNlbmQgYSB2Mi4NCj4gPg0KPiA+ID4gT25lIHRoaW5nIEkg
ZG8gbm90IHVuZGVyc3RhbmQsIGFuZCB0aGlzIGlzIG1vc3RseSBhIHF1ZXN0aW9uIGZvciBSUCwN
Cj4gPiA+IGlzIGhvdyB0aGUgZmlyc3QgRElTVFJPX0NPREVOQU1FIGlzIGFjdHVhbGx5IGV4cGFu
ZGVkIGluIHRoZSBhYm92ZQ0KPiA+ID4gZGVmaW5pdGlvbi4NCj4gPiA+IFsuLi5dDQo+ID4gPiBP
ciBhcmUgYWxsIHZhcmlhYmxlcyBpbiBkIHNvbWVob3cgYXZhaWxhYmxlIGFzIFB5dGhvbiB2YXJp
YWJsZXMNCj4gPiA+IGluc2lkZSAke0AuLi59Pw0KPiA+DQo+ID4gVGhpcyBpcyBpbmRlZWQgdmVy
eSBpbnRlcmVzdGluZy4gSSB0cmllZCB0byB0cmFjZSB0aGUgdmFyaWFibGUNCj4gPiBleHBhbnNp
b24gY29kZSBpbiBiaXRiYWtlL2xpYi9iYi9kYXRhX3NtYXJ0LnB5IGFuZCBmb3VuZCB0aGlzIGNv
bW1pdA0KPiA+IGZyb20gMjAxMDoNCj4gPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL2Jp
dGJha2UvY29tbWl0Lz9pZD02MDZmYTFmZDk3Y2JkNDdhNmE3ZWJkYzdhMmU2YWE5M2E4ZjY1Y2Y1
DQo+ID4NCj4gPiA+IEFjY2VzcyBtZXRhZGF0YSB2YXJzIGFzIGxvY2FscyBpbiBweXRob24gc25p
cHBldHMNCj4gPiA+DQo+ID4gPiBFeGFtcGxlOg0KPiA+ID4gRk9PID0gImJhciINCj4gPiA+IEJB
UiA9ICIke0BGT08gKyAnL2Jheid9Ig0KPiA+ID4NCj4gPiA+ICR7QkFSfSA9PSAiYmFyL2JheiIN
Cj4gPg0KPiA+IFNvIGAke0BWQVJOQU1FfWAgZXhwYW5kaW5nIHRoZSB2YXJzIGluIGlubGluZSBw
eXRob24gZXhwcmVzc2lvbnMgc2VlbXMNCj4gPiB0byBiZSBpbnRlbmRlZCBidXQgdW5kb2N1bWVu
dGVkIGFuZCBtb3N0bHkgdW51c2VkIGJlaGF2aW91ci4NCj4gPg0KPiA+IFNpbmNlcmVseQ0KPiA+
IERhbmllbCBXYWdlbmtuZWNodA0KPiANCj4gV2UgZGlzY3Vzc2VkIHRoaXMgaW4gdGhlIHRlY2gg
bWVldGluZyB0b2RheS4gQmFzaWNhbGx5IEkgd29uZGVyZWQgd2hldGhlcg0KPiB0aGlzIHVzZSBv
ZiBkaXJlY3QgYWNjZXNzIHRvIHZhcmlhYmxlcyBpbiBpbmxpbmUgUHl0aG9uIGV4cHJlc3Npb25z
IGlzDQo+IHNvbWV0aGluZyB0aGF0IGlzIGVuY291cmFnZWQgb3IgZGlzY291cmFnZWQuIFJQIHJl
c3BvbmRlZCB0aGF0IHRoaXMgaXMNCj4gc29tZXRoaW5nIHRoYXQgd2FzIGludGVncmF0ZWQgMTUg
eWVhcnMgYWdvIGFzIGFuIGV4cGVyaW1lbnQsIHdoaWNoIHdhcw0KPiB0aGVuIG1vcmUgb3IgbGVz
cyBmb3Jnb3R0ZW4uIFNvbWVvbmUgc2hvdWxkIGV2YWx1YXRlIHRoZSBwZXJmb3JtYW5jZQ0KPiBp
bXBsaWNhdGlvbnMgb2YgdXNpbmcgdGhpcyBiZWZvcmUgaXRzIHVzZSBpcyBlbmNvdXJhZ2VkLiBB
ZHJpYW4gRiBhbHNvDQo+IG1lbnRpb25lZCB0aGF0IHRoZXJlIGFyZSBzb21lIHBhdGNoZXMgZm9y
IHVib290KD8pIHRoYXQgcmVseSBvbiB0aGlzIGFzDQo+IGFwcGFyZW50bHkgdGhlIGV2YWx1YXRp
b24gb2YgdGhlIHZhcmlhYmxlcyBpcyBkaWZmZXJlbnQgY29tcGFyZWQgdG8gd2hlbg0KPiB0aGV5
IGFyZSBmZXRjaGVkIHVzaW5nIGQuZ2V0VmFyKCkuDQo+IA0KPiAvL1BldGVyDQoNCkFuZCB3aGVu
IEkgd3JvdGUgIlNvbWVvbmUiIGFib3ZlLCB0aGF0IGRvZXMgbm90IGltcGx5IFJQLiBJIHdvdWxk
IGJlIGhhcHB5IA0KdG8gaGVscCwgYnV0IEkgaGF2ZSBhYnNvbHV0ZWx5IG5vIGV4cGVyaWVuY2Ug
aW4gaG93IHRvIGV2YWx1YXRlIFB5dGhvbiANCnBlcmZvcm1hbmNlLi4uDQoNClNvbWUgYXNwZWN0
cyB0aGF0IEkgdGhpbmsgc2hvdWxkIGJlIHRlc3RlZCBhcmU6DQoNCiogV2hhdCBpZiB0aGUgc3Vw
cG9ydCBpcyByZW1vdmVkIGFnYWluLCB3aWxsIHRoYXQgaW1wcm92ZS93b3JzZW4gbWVtb3J5IA0K
ICB1c2FnZSBhbmQvb3IgYnVpbGQgdGltZXM/DQoqIElmIGFzIG1hbnkgY3VycmVudCBkLmdldFZh
cigpIGFzIHBvc3NpYmxlIGFyZSB0dXJuZWQgaW50byBkaXJlY3QgdmFyaWFibGUgDQogIGV4cHJl
c3Npb25zLCB3aWxsIHRoYXQgaW1wcm92ZS93b3JzZW4gbWVtb3J5IHVzYWdlIGFuZC9vciBidWls
ZCB0aW1lcz8NCg0KLy9QZXRlcg0KDQo=

