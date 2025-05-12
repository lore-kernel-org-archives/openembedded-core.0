Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8393C3ABCC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 18:17:06 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.56])
 by mx.groups.io with SMTP id smtpd.web11.57604.1747073815903813551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 11:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=Rj1Im0St;
 spf=pass (domain: de.bosch.com, ip: 40.107.247.56, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HomiiDc6Kht3Ba/aNidP0kA8R8DHsMmT+zDRTuEipPpt+b+177DUxfrA0BjMmSA8yolroIs3bMjCdfzhLyRobnXfwDE9kcu2sipEKb5ApsbWnaYK8pUZ9K76rXoq/MMEw4Glk2Fc5Q2ur2dwHo5HaWy1/cDJkwR3x6NYNKqTGMmC5LYDiVfD1qTZFhdYNsYy0qCdOmL8VVp6DpZH0sVq2/USzuFDPg7L3TH3xLg8TWROYwkkQspiud/9gKkOuMmnqnQwFNsmT0FmpY2+5x+xObZ99aEc++jqzhQksE+NUbZ+djbzoxJSdj8CGpQQeBZynCFwiCzZMQOvTMRMBDxzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2mBd0p5IINKxrK5EBIllVaPnQG2hMeDQYOj6WgqNMc=;
 b=Gn3eaGgZCV7zVPtOA5OkrxNqBHsBue1t1OzbOnC+wYArCLvknmhlzkraVrU2TUcBwyw35FGonWkAVybYNj5NNrOIbkUWe1DhQDEFuxUlaS8UupbwP2Drvu25pLjsUcLRaRqNqXiB1PzGKOEcEvIi571DnKAtxoB1tlxKY9QDVi/FAjHaqjKPzWRgvfCL3BNggD+Nw/UwBjYEbg95YeoRzJUXil8MbJT+GCh3+fNJeliuIETBRTGGul3BI1sRV1sGlYUp2+mi2PM1Wkbatv8sKAwbOt+oyTOXv+sHC8FzJlnLIjp5piIxZ25HNsCae80I5O0fk1KO9zup2bHUc75yPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2mBd0p5IINKxrK5EBIllVaPnQG2hMeDQYOj6WgqNMc=;
 b=Rj1Im0St80OC55BWchUQNrH4drgYu7ywGdL45cmgKSlhM22Zi4Z1Mnrm9KurYwHaAlhGf4MC807Hmq3agxjUGvf0CDgMyY0HtCAysKj6ZV2zNXTm9+s0OqjDeoN93FQJwB8J89XnzSkE2uRnRfNv3j6WRNm5qnPX0MeHehcXfL/a5eJk+RvqBtdXu69ychgXG6JBEoP6hC13bwdR3iprDBTDV7sTEDUHHSepavyxu4t+lRa4InLj9hJF4mk66FzTzfmFuL7aSXjkksHrAU2BRrg9sNpL8yBn74kWA3hgKRxpTQNZ4mgsT9Zh36HgO5RdMGkxybAbKVqmPfE1/vBrUg==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by GVXPR10MB8948.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 18:16:51 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%4]) with mapi id 15.20.8722.024; Mon, 12 May 2025
 18:16:51 +0000
From: "Jonas Mark (BT-FS/ENG1-Mue)" <mark.jonas@de.bosch.com>
To: Joshua Watt <jpewhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "Simoes Ricardo (BT-FS/ENG1.1-2)"
	<Ricardo.Simoes@pt.bosch.com>
Subject: AW: [PATCH] udev-extraconf: Allow optionally skipping systemd-fsck
Thread-Topic: [PATCH] udev-extraconf: Allow optionally skipping systemd-fsck
Thread-Index: AQHbwMcK1P7LHOpPakmXu6OSbHJlDLPPOHqAgAAWCTA=
Date: Mon, 12 May 2025 18:16:51 +0000
Message-ID: 
 <DU0PR10MB7076F9B59B85FEC850F9A8D9AD97A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <20250509094421.20786-1-mark.jonas@de.bosch.com>
 <CAJdd5GZ-LkBC-8iZXhAYvKsOhxCm2hYL5tCkTS9SOud-d5+ifg@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GZ-LkBC-8iZXhAYvKsOhxCm2hYL5tCkTS9SOud-d5+ifg@mail.gmail.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|GVXPR10MB8948:EE_
x-ms-office365-filtering-correlation-id: 6d8afd20-0f05-48b7-6971-08dd91812b0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YnpsWFRodHVrT2R2bHh5amg3RTI5ZnZrcUZLOTZPRUtHRDNPWFoyanZFdEtJ?=
 =?utf-8?B?NUY3WnZwUThnelJ3YWo1Q09kYmpYd0V6TU1ia0wybEhwOEk4ZkFPbHkrZ2t4?=
 =?utf-8?B?enRjTkRqbnVIYUxNY0hTMU14UTdMNTBaQmRSdWQ1cEFab1dVdWE5QmRSeXFS?=
 =?utf-8?B?WmZWSUhHZmNiVHZYaFRRYTNIbnNSMTYzWm9kVlQ4T2JyS0dtend0b0JTL0g3?=
 =?utf-8?B?TXBtb3VlMVRCVTZzQjJ6VEYxR1dsSGxTVlRNRTN2alBiYnozV3JTVHluR2ph?=
 =?utf-8?B?TVM1QU9EeFV6aDVzK2RLU1JOV2IvdFJzVlRCVlBCUHA2NjBsOTZZaE1qU3M3?=
 =?utf-8?B?L0grVVU2STBwMnZ4RHpmdlNnUjBsaHlxQkk2N0sxQmRlT3FHSkNJOEd1TWJE?=
 =?utf-8?B?YTNEUitzMitlbVd5aDJENlFyb3U4RDJCcktScjVmdjFUY1djeC9uQ3RUUVVF?=
 =?utf-8?B?UVBhM3E5d1kwSEdDQU4wdGVmOUZ5KzVqNXZTZGdiT2Ruc0xNSkhFajJqTjJN?=
 =?utf-8?B?a1hvMjEybWVCdmZjUW9ucWY2bXNBbWUzVEJvNGNPTnJ3YWJyR2tVS24wTnhN?=
 =?utf-8?B?aFZOU2lTYXVhdVN6bjFzbXJWcEI4T1lSaE9WVHhZMDhmOGNDdkFxZFlSQzBi?=
 =?utf-8?B?WnBIbW44SXV1NXd5MThDME1EZTVvKzdYVjl4SlQ4bHpxem8zcWZ0TXhpSDUx?=
 =?utf-8?B?ZlJReGtiSWVyUGk1MGtZaVRXaEVHaG1na3RUcGVLT2FZZS9vZ2drOE9VTGtp?=
 =?utf-8?B?TkpmRGlzOVgzUzY1RURUSlpJY2VEMTdWZTJ5UnRROHZab1U3cWZBUVB3MWlk?=
 =?utf-8?B?cmtDWFl1U2w1aDI3RHBrclllRnVjaGxyMVY4YStwOXlLZDdnZ1VkSnlFWVhz?=
 =?utf-8?B?OTZrK2gzOHY3TmlGUk9aMDgvL1N4NFZBSFVCQzdiSVFBSGwzc2dqUDhVTG9M?=
 =?utf-8?B?eXFCY1B3bkdOVW0yMzVsMzFSS2ltSkhWWjY5NS9MK1BpckZkQVZPZEFNWlNC?=
 =?utf-8?B?cC9WT1psbmJsRmtValYxTHFuaUlDbGJHWmhEL0R2S3JhbjBvSFZrUTVhSGFu?=
 =?utf-8?B?VlNGZ0F4MTIwY1F6YTVYVHZqOW4rWGtVT3JkY2s5dWNxWVRSeE5tTThSc0dt?=
 =?utf-8?B?ZUFwT1dYOFpUdmRzYVVNVUQ5Q3dXNHlXd3U2eE9FL0NKdDRkSlV1ZUJIcURQ?=
 =?utf-8?B?c1hpSzc4YjJuMTRjOG9UODJnalcyQXJEL2l5RDhwWjlEQWs2MTVkdUNyQzUz?=
 =?utf-8?B?cTZ1cHdMdzdGREF6TEZjbVRZL3VtZzBkd1VUZUhSTTV5RFRvV0x6M0llRGdU?=
 =?utf-8?B?SGJ0cFIwUVJwZ3BoOXNKV0c0VElCSUNreklMR2xTRDlyMlA2Y29GKzV6NE1M?=
 =?utf-8?B?a2UrRWNQckxKVG9Fc1AyYmZCa20zbHJNTHRMMVdMZ002dzRHWHh4RUptU3cw?=
 =?utf-8?B?NEJ5M0J3RnR1REs0dXBpTjBBUGlESVBPWHQvSDNhaVNNNWxWTHVvT0xZM1F6?=
 =?utf-8?B?YkNhTEtoRVRHOXBjbnY1VUp3bEFnM0JhcEo0QXJ2WjZLYUFMaVFrNzFTamdi?=
 =?utf-8?B?SWFiWXdTQnI5M0RscHJHSVl4VmF4NzhXYlM4Y05IMEFnWEtRZDkxZ0IvRXVk?=
 =?utf-8?B?RFFnc3NJSEp4L25JZlJHYnBDUWpmTllCd1dienVLVmczNm40bmZGVVFnVnFq?=
 =?utf-8?B?dnFJUW52cWYwbllpNm4yczFIcVlTREYveEhKcjhBaE9hZWR0VzA0L3RkemM1?=
 =?utf-8?B?NUgxYXJUNDduWUtvVGJyOVcxRGdwRExuNVl5bWduUWQyc0ErNzEvbDJiQUQy?=
 =?utf-8?B?SHZwTzZuSkZOVjErc0tCZHB3YU4ycDBqVnE0VGxYQ0JGOFg3N0dPWUJmalZG?=
 =?utf-8?B?cEE1bnVaaitzZnY2YWlkV1FIV1VZbURjMTN0N3hqeCsrb25EdGJnb3J5c2tX?=
 =?utf-8?Q?miiNROqmiII=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dXc0SE0wWi9sL0gyaG1BK0tpNTZjeFFKenRheC9jRFZmNnpwOWJXaDloVy8z?=
 =?utf-8?B?a0wrQTRic0gzOWM0aTFEckdwNmQ5OE1DNGFTc0xhQmVkbXlMTUo0M2FnbVlj?=
 =?utf-8?B?SXIyNVZFSG5JNHJna0VuUTREdjRpVXk1NkozVlJ3aEtQSXBhdkVrdjVsTXBY?=
 =?utf-8?B?QUxhY29BT0NrMnlzdHlrRTJnZCtDYVNjYXRFbDBSYk5IQ0NUK3pqbGY3MCtS?=
 =?utf-8?B?d3Awbk94SlJlY2RFVEczYjdwODFxM09jQ3FaRnphNDQvN1FrTzVaWnVIN2xo?=
 =?utf-8?B?TDJDem1zNGFMZ0FLajRsVnVyK0dibE9aNXo4YnF4clpHQlFFRFk1RCtWWVVj?=
 =?utf-8?B?R29XeU5jb1A3cFVsRVcxamdDTGhwY1h4SjhLaDVGbU43WkVsbFRtQTVrcmR0?=
 =?utf-8?B?N0VnKzMyaEVlOWZ1R1k4K01mWllZQi90eUtNUXJiZzdYZGlGeWptYWRsUmxs?=
 =?utf-8?B?MkcyWnNHYjZGWGh6SEoxaU1tNzRKSllSd0QycEkyU0o4bVV1VU5NQ0hOZEha?=
 =?utf-8?B?WmR4L013NFBQdDVZSWdCclpGdUpuNTNJQytLQXhBaDE0RzA2S3pYRTBKaGFT?=
 =?utf-8?B?cytjZlBlMmRUTkphdkFSWE9ibWFyeEY5VmpwSDFZNkNFd2RJQ3lyREJMajlp?=
 =?utf-8?B?UytnenEvT3JWNXRwZ3NGaGdrdS96Y3pjSE9sQ3orZXZwbTJhVU4wT0VPaGhN?=
 =?utf-8?B?UTd3dUcyK1cyTHpNOCtQV2cwTVVWdG9wZXdGamxVOHh5clFPYllHSGhHQ3dt?=
 =?utf-8?B?UURvMnRjYkcxa2VZSy9qUERyczVNMWtacXh3aEdSY1NRWTV3WS84T0VVSTZO?=
 =?utf-8?B?dWV4dExCS2pkQ0RXRE9YSGZZbW4vamtFYjdFcGJHRktpVHlnaVByTnBoYzdJ?=
 =?utf-8?B?aE5jSGFNOWhXVmhraE4xM0dGQVl1WWVuZlp4TCtMa1Z5Tkowa0NsUTd0ODNS?=
 =?utf-8?B?OXlOT2ozRHBTVGNOVDVuckR4b0plN1RIUUVyWXA3dlQ3dXlXdXROaFVoR0RW?=
 =?utf-8?B?Zk9zazdpenIrOW1iM3ZGYVhYb1Z3eGdQNSt0MFQyUHBQbkRvS2JUN2lld2Z1?=
 =?utf-8?B?SVVOeFFKWUdHRkIxWlRmcWo2aXN0cTJOV0draW05dFRVdDZUNmdkOFV1U0pV?=
 =?utf-8?B?UjJ2UWU4WUhrWmtnQWx3OU91c25zRTNmd0hxSlgwWVFScG1taCtlUFFhSzVv?=
 =?utf-8?B?ZTkvbmFzL3dwM2V1Wm9Eb25Gb2IvVlo1VS9Wb1VmRERQUm1ORHN6c2pqSlkv?=
 =?utf-8?B?Sk9PS3cwWmI1cVBDMHRmNVQ4RUc0NmNRMlgxdHlDWE5QdytOVHlVSE4vcmx1?=
 =?utf-8?B?TUUwdlh2T09jd1l5L0grMng2cVEzL0Z4MjJiNWwrY2VFYmo3R1lFVmMxUTRa?=
 =?utf-8?B?RTZPTTloNkxDSWVwL2hXc3J0ek9BbTc2aENacncxZ3dYR1BHVDJTY1FoUExi?=
 =?utf-8?B?M1QrVCt4NG5KS1IyWjk0RUE1RVNiejdkREkwT3UzRkd3bmo5MWZyWWxPZzFL?=
 =?utf-8?B?Um9kb3JWMitmRXZFNkZoTzR6SmVFaU5SY0hIYkh4cVJiNjFhUE9Ec2Jxb0hq?=
 =?utf-8?B?OFdtQWRlRlJSRDlROERIUUxJWWRoWUZCbjAvMUJDYjlzaTZ2SFNEekIrNWpR?=
 =?utf-8?B?RFFvbFp0T08xTk1vWWxUNUZQVmZrSTRJQmJFMXE4Y1NKVk85cWxrT2k0YnBH?=
 =?utf-8?B?TEg1YzJZZXRwWkphRW5PdEhYRHFyOVpQUkxrVmk4S0ltK09uakpoVk5uZms1?=
 =?utf-8?B?UXBHeFdob0FzSkV1OEcrSjRLSDdGZWd1c0JCS2QybUk5L2pxeUdNUzl0ME5O?=
 =?utf-8?B?RTJpdERzRS84NVpTbWdQVGhReXV6dElJWkl4UGdSY1JZQzFYbjJhdVMyM1RG?=
 =?utf-8?B?U1FJOVkrKzB3Y1cxVFhRcGdORERYYllDcmczL2ZJelppUGZwanpBTVl2aFVT?=
 =?utf-8?B?Ukp0eW1va2FyQ3lSNDVoWWpkTnlEcjdjekJjTFoyWDkwU0p3cURIZmpWM2hQ?=
 =?utf-8?B?ajd2Qm0wejdMUWxsdkN2dW0yWER4aHVrU25wZk5uZUhsRWxzUVREblQ0b0ZM?=
 =?utf-8?B?RHZiUW81ZjZYL1d3ZlFVTGtWaDFjQTc5RFlGVDNWU0toZWNrNVlOMTVIUTZr?=
 =?utf-8?Q?gSa4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8afd20-0f05-48b7-6971-08dd91812b0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 18:16:51.5340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3NQnlhNoHanjDP2eJUafP1Mp2cDCOqQPMCGBi7OhJnFPY2g1W1VcCfmBH84q0/LcxRSNNqQrBp+BUj/NHq0+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216384

SGkgSm9zaHVhLA0KDQoNCj4gPiBGcm9tOiBSaWNhcmRvIFNpbW9lcyA8cmljYXJkby5zaW1vZXNA
cHQuYm9zY2guY29tPg0KPiA+DQo+ID4gV2hlbiB0aGUgZnNjayBiYWNrZW5kIGRvZXMgbm90IHJl
c3BlY3QgdGhlIGV4aXQgY29kZXMgcHJlZGVmaW5lZCBieQ0KPiA+IGZzY2ssIHN5c3RlbWQtZnNj
ayBtaWdodCBub3Qgd29yayBhcyBleHBlY3RlZC4NCj4gPg0KPiA+IFRoaXMgaXMgdGhlIGNhc2Ug
Zm9yIGZzY2suZmF0IGZyb20gZG9zZnN0b29scyBbMV0uIFdoZW4gYSBGQVQNCj4gPiBmb3JtYXR0
ZWQgYW5kIHdyaXRlIHByb3RlY3RlZCBwYXJ0aXRpb24gaXMgY2hlY2tlZCB3aXRoIGZzY2suZmF0
IGl0DQo+ID4gd2lsbCB0ZXJtaW5hdGUgd2l0aCBleGl0IGNvZGUgJzYnIFsyXS4gV2hhdCBmc2Nr
LmZhdCB3YW50cyB0byBzaWduYWwNCj4gPiBpcyB0aGF0IGEgd3JpdGUgcHJvdGVjdGVkIGRldmlj
ZSBjYW5ub3QgYmUgY2hlY2tlZC4gSG93ZXZlciwgdGhhdA0KPiBjb2RlDQo+ID4gaXMgaW50ZXJw
cmV0ZWQgYnkgc3lzdGVtZC1mc2NrIGFzIGEgYml0IG1hc2s6DQo+ID4NCj4gPiAtIDI6IFN5c3Rl
bSBzaG91bGQgYmUgcmVib290ZWQNCj4gPiAtIDQ6IEZpbGVzeXN0ZW0gZXJyb3JzIGxlZnQgdW5j
b3JyZWN0ZWQNCj4gPg0KPiA+IEFzIGEgcHJhY3RpY2FsIGV4YW1wbGUsIGEgd3JpdGUtcHJvdGVj
dGVkLCBGQVQgZm9ybWF0dGVkIFNELWNhcmQNCj4gd2lsbA0KPiA+IG5vdCBiZSBtb3VudGVkIGlu
IHRoaXMgY2FzZS4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyB0aGUgZW52aXJvbm1l
bnQgdmFyaWFibGUNCj4gU0tJUF9TWVNURU1EX01PVU5UX0ZTQ0suDQo+ID4gV2hlbiBTS0lQX1NZ
U1RFTURfTU9VTlRfRlNDSyBleGlzdHMgc3lzdGVtZC1tb3VudCB3aWxsIGJlIGNhbGxlZA0KPiB3
aXRoDQo+ID4gdGhlIC0tZnNjaz1ubyBvcHRpb24uIFRodXMsIHRoZSBwYXJ0aXRpb24gd2lsbCBi
ZSBtb3VudGVkIHdpdGhvdXQNCj4gPiBydW5uaW5nIHN5c3RlbWQtZnNjay4NCj4gPg0KPiA+IElu
IGdlbmVyYWwsIHRoaXMgbmV3IGZlYXR1cmUgaXMgdXNlZnVsIHdoZW4gdGhlIGZpbGVzeXN0ZW0g
aXMga25vd24NCj4gdG8NCj4gPiBiZSBjbGVhbiBhbmQgdGhlIGZzY2sgYmFja2VuZCBkb2VzIG5v
dCByZXNwZWN0IHRoZSBleGl0IGNvZGVzLg0KPiA+DQo+ID4gRmluYWxseSwgb25lIHdheSB0byB1
c2UgdGhpcyBuZXcgZmVhdHVyZSB3b3VsZCBiZSB0byBhZGQNCj4gPiBFTlZ7U0tJUF9TWVNURU1E
X01PVU5UX0ZTQ0t9PSIxIiB0byB0aGUgdWRldiBydWxlIGNhbGxpbmcgdGhlIG1vdW50DQo+ID4g
c2NyaXB0Lg0KDQoNCj4gVGhpcyBpcyBhIHByZXR0eSBnZW5lcmljIHdvcmsgYXJvdW5kIGZvciBh
IHZlcnkgc3BlY2lmaWMgcHJvYmxlbSBpbg0KPiBkb3Nmc3Rvb2xzLiBJdCB3b3VsZCBwcm9iYWJs
eSBiZSBiZXR0ZXIgdG8gcGF0Y2ggZG9zZnN0b29scyB0byBoYXZlDQo+IHRoZSBleHBlY3RlZCBl
cnJvciBjb2RlcyBpbnN0ZWFkLg0KDQpZb3UgYXJlIHJpZ2h0LiBXZSBhbHNvIHRob3VnaHQgYXQg
Zmlyc3QgdGhhdCB3ZSBzaG91bGQgZml4IHRoZSBwcm9ibGVtIGluIGRvc2ZzdG9vbHMuIEJ1dCB0
aGUgcHJvamVjdCBhcHBlYXJzIHRvIGJlIGFiYW5kb25lZC4gVGhlIGxhc3QgY29tbWl0IGluIHRo
ZSByZXBvc2l0b3J5IGlzIGZyb20gT2N0b2JlciAyMDIzLiBBbmQgdGhlIGxhc3QgY2xvc2VkIGlz
c3VlIGlzIGZyb20gQXVndXN0IDIwMjMuIExhc3RseSwgdGhlcmUgaXMgYW4gaXNzdWUgd2hpY2gg
c291bmRzIGFzIGlmIHRoZSBtYWludGFpbmVyIGxvc3QgYWNjZXNzIHRvIHRoZSByZXBvIChodHRw
czovL2dpdGh1Yi5jb20vZG9zZnN0b29scy9kb3Nmc3Rvb2xzL2lzc3Vlcy8yMTApLiBCdXQgdGhl
IG1haW50YWluZXIocykgZGlkIG5vdCBldmVuIHJlcGx5Lg0KDQpJbnN0ZWFkIG9mIGZpeGluZyB0
aGUgcHJvYmxlbSB1cHN0cmVhbSB3ZSBjb3VsZCBvZiBjb3Vyc2UgYWxzbyBhZGQgYSBwYXRjaCB0
byB0aGUgbWV0YS1sYXllci4gQnV0IHRoZSBwYXRjaCB3b3VsZCBiZSByYXRoZXIgYmlnIGJlY2F1
c2UgdGhlIG92ZXJhbGwgZXhpdCBjb2RlIGdlbmVyYXRpb24gaXMgc3ByZWFkIG92ZXIgdGhlIGNv
ZGUuIFRoZXJlIGlzIG1vcmUgdG8gZml4IHRoYW4gb25seSB0aGlzIHNpbmdsZSBzaXR1YXRpb24g
dG8gbWFrZSBkb3Nmc3Rvb2xzIGFkaGVyZSB0byB0aGUgZnNjayBzdGFuZGFyZCByZXR1cm4gY29k
ZXMuDQoNCldlIHdvdWxkIGRlZmluaXRlbHkgbm90IGJlIGFibGUgdG8gbWFpbnRhaW4gYSBmb3Jr
IG9mIGRvc2ZzdG9vbHMuDQoNCkhvdyBlbHNlIGNvdWxkIHRoaXMgYmUgaGFuZGxlZD8NCg0KQ2hl
ZXJzLA0KTWFyaw0K

