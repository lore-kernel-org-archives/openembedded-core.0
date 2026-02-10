Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3401E94629
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 02:42:10 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11679.1770691324338645783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 18:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=D+vy0RGI;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.26, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UygLvqeD6aWqMLypRYlG1raRDvIsdPvGTDC7qoEUvojxhz2v7tjl7beYAF+szjm+LDht2c3oQgKK/z2T4y5uzH/m0k6lRhuWeFKh/g60rdxZBZcteR1iuhvoObQUcouLkj9sX9GUetducL1Nj5ApIsqb6JudXC9O6W5X+5q6pJ7+zrmzZxay37XIac8eRwWtxI+hGVHN/d5xv7Tqbel/E5xfjnQTL5w5wpnxK0J91eJj6L5sl2lCioCuIQT+PLxza1l0lsO5+aZ07ZiAWs9KN2HOyF7H4kOJAUPLBqrSXSZ4lEtOH3tjIcaBo+LiSzIsPH9DsKsogSIGgUcfWz3Liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAlmNkV0Gtv0VnVQqvfX3OVcyIJyl2rlVeb+lHZBHXM=;
 b=TPkbljcsjpMXKORwxME9NV8rB3P5U/EuGbd+65PdwGopn8Oq92awX/QVURPA5eqrrkTPyrV2tupNxA4G/LdVjEVrVycfICDVJKLiWO9Avp+tTd9UohYkapJ814K+Awlt5KKlKYBzLjK1ZaeEKUENK0XOSWZOSfjVdfPkB1vUjnTSUlad7wD12IdTzQvtXUD/O3cXJFKV4BFDkojJz8JR58eO3opMfTjAldWhFkGExpAlYtJ/cTBckv3OO9UHJfVBZvtK6y+Ia9IZDuEvny4WFsMApFKLD92UM1JR+02VIpJNqAaUl5QGGb5RV8/Y5iI/G9dpbkEw7Urt+8ZkN9qx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAlmNkV0Gtv0VnVQqvfX3OVcyIJyl2rlVeb+lHZBHXM=;
 b=D+vy0RGITNVZg3xDnndedRTZi2qFYUhbthIaUmjErSkrYGtDb66bb69CFp9Aysh5kKHndIOy7wBOb+cd0wQl0z3mNa3bg/V076dmnSZpwHosqmdv//Ia6CGTYQI0llOiL0bDPDWJQP7joNfYnu+PBdI/7AMQ8j3Bn1wIu7AnGM8TY0CgKUaiE6Z5P7v3bgnlqj57hzM8KRc6TgOiuSCEOln2WHLIb8oiEhgwfbHQLCH/r+R5MIMr+9wl9v39NGCt+vZPOOCdW4Kq8jttf3QJ+F4obTM7h9e1w56CtonzeIDwlUSEZ19iEusHVhMhWmZkM16OYES/c5TKAjfZzPMXag==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TY7PR01MB16026.jpnprd01.prod.outlook.com (2603:1096:405:2ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:41:59 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:41:59 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIIDYvNl0gb3JjOiBFbmFibGUgaG90ZG9j?=
 =?gb2312?Q?_to_produce_doc?=
Thread-Topic: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
Thread-Index: AQHckRIdFxGjs2+yRkygseyoFd9O5LVp+IWbgAl8DsqAAHMaAIAGDKp6
Date: Tue, 10 Feb 2026 02:41:59 +0000
Message-ID: 
 <TY3PR01MB10110F8354668695ABA48A8879B65A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
 <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <OS3PR01MB101063210892B4305F30BCF669B99A@OS3PR01MB10106.jpnprd01.prod.outlook.com>
 <CANNYZj8-gEgL9Vu5XhWAttKdpKO+Py7XkwRM2b-Es7OfjH7HmA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8-gEgL9Vu5XhWAttKdpKO+Py7XkwRM2b-Es7OfjH7HmA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-10T02:41:58.818Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TY7PR01MB16026:EE_
x-ms-office365-filtering-correlation-id: ad0ef206-d985-4ff9-4d4d-08de684df6da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|1580799027|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?VWdqc0VXSTJFN0VONytieGJOSXFtMU05dHB3QlRwVlVrQThUQ29saU5aWVZB?=
 =?gb2312?B?ZTI3c0diZDJ3N3U5ODU1N01IUUxEeFhTUW1McTRKazVEZHNzdWRSQ1g1Y3Fl?=
 =?gb2312?B?cVZMTk5iUDZwcmJaUUc5N2doZkRJMUxQTHN5aEhUcERvbUxZblpvTDZZL0pz?=
 =?gb2312?B?UFN1VlRabFQzRk1hbG1MdVoveW1EOC9rbm5sM3d3K29hOERVcHRteGZibCt6?=
 =?gb2312?B?ajZKUlJQeWZVUlhHdTFqTDM0TmFBR0RGeEM3NVR3c0VxK0ZBc3ZDblVyZGE4?=
 =?gb2312?B?MXhZRkJyZnM3T2c2R0I4blM4a1k0US9GSGJ0THdkOTY2Uzh1SXYxS2c0aCtJ?=
 =?gb2312?B?R29aT1R3eUo4V25oVXN2UUZjU01IK3dpRnYrZ1ZYcFEvVzNXUWJDSlN1OWFq?=
 =?gb2312?B?RDNTRnlLbHJXeUYwNjZYVFl3YlJaOGx6bTExUEI0L3p5WkgwcCtYT1lMc3RX?=
 =?gb2312?B?bCtWVEwyQ3oyQTFjaGo2TGk1SC85UnBQcDZMMnp5SlZRZ3UwVjBWK0hYRENC?=
 =?gb2312?B?NXhtZGpEcndsOUliMzlDY3RyM1hxQmFNWmVaZER5WWc1NDlvR1FuTklIalZY?=
 =?gb2312?B?cjFuVjJOTXZnYURUaEliS2p2MFRaR082WWo0RjgyN2EwaXVLTExIUEQ0RkNJ?=
 =?gb2312?B?Qnd5SHhSb1gzUVQvMEZYa25SeG5YVEllQU05QmZkTkJLb3VTOXNFOXlXSlFK?=
 =?gb2312?B?eVZYK1lHTTNQL1lnR2FsVVZETEM1SHcvWlJjOHh5MC85K2puUUxzeXBNV2tQ?=
 =?gb2312?B?ZHZ4ZnQrQ2RmQTB3ZUdMOUk3c2ZFalJIb1g0dXBKWjh0RHg3aDZVdXRUWXNJ?=
 =?gb2312?B?SGhXTWU4cDJVeWFXUUhzSU9EWUE3K20yVlFOQ2pDdnRmWXlJY2J1Q29FME9H?=
 =?gb2312?B?MmIxR3lpNSs3YVJNcHFWR1FnMEpvaGNIRnZkT2pLRkFKaEdESmN0TzNkZW14?=
 =?gb2312?B?Z1J2enUyODFCUENITStRRGh1TlMwSkE5WGVFTGNBL2s3WjlJeS9ZSlQ1WjVy?=
 =?gb2312?B?dVBVM2tCSDhZeDNud1FTbTgxSjVYdkVnTzR4QjRXemN2R3djeW5UVi9XTkFO?=
 =?gb2312?B?TUJNd0hkOGtZOGNuYXZRb05DQU9Mc2NZUk5hMXo3V2FFelQrYms5bFlkQ2xT?=
 =?gb2312?B?bE5mMU11aGVrRFZKMjBSSkxmeFo4THQvb0hFVDMxL2NIVWVNM0R4VXZtblJV?=
 =?gb2312?B?bmNhcFd5ZTh5ekl0OVRrTHNBZzQzU0paT2tNcWdKcFBkckVMZTd2UXRUQTEz?=
 =?gb2312?B?dllDNmJqODlIWlNKeVRjQUo5ZUtnbG9GM082MnQwbDhHSlA2UldHZERDa25k?=
 =?gb2312?B?ZE5zeFVJSzI4Vk81QW1sMVE3QkI5ZkF0R1ltVEEyOHhNK0Z2bmI0cnBOSVZk?=
 =?gb2312?B?clFsUnZGRytPT05KWUhDcVhCS0g3cTljbXNMMlh0T1JQb3J1R2k2S1F0bkdm?=
 =?gb2312?B?U3krc00yMGtxbnhUZ2E0ZjF0TUZLNkhlZ1NHdkJuMXZBdzNzeTZiSmRZUVA1?=
 =?gb2312?B?UUxpeUU5anlKOFVqNTlMRnNyNDYrZnJrV3hHNkdyd1BFd2pxVmpZYWVHeUdr?=
 =?gb2312?B?QVhCcnZ5ZzF4NHg4eTVESVdDY1R5THBOT0RZcFRhVHlDVUxrNU95UGpjMmp1?=
 =?gb2312?B?alRuTTZhL0V2Z3J4NFlIeWVxcTN5MktnYmdVSk5VcyttV2pneDJjTmlpRkNZ?=
 =?gb2312?B?ZjViUFhWSm1yV0l6Q2EzR2doM0JQNGZBVWI3S3Buc3cwT0hqNFlEOW9RelpR?=
 =?gb2312?B?c3dUQUJ1Q2pweXNHeUhrODVZQ1Z6U29nZ1NYVDErUENxajJtNzBFNTdZQkRS?=
 =?gb2312?B?Z3o2dDRhUC9LSHM4ZkZ4b3RZNmtRZ3hlRVF0Qi90TTgxc01hUzBOSklyblJ5?=
 =?gb2312?B?U2NqeStrcTdDMTVEdFhVdXU2dGRWeGpVOE5IYmgva2UxVG9mVnVEQ3NGa0ZY?=
 =?gb2312?B?b0FiNnRqOW9WREpTbElPWmEveGdJQ1Y5TGpCdm1lMTlTSjd6OSs3QWhBVUJT?=
 =?gb2312?B?Qmx1WWRKbnh0UTYxaDEwQkIzYkNtWGFqa2p2cnpnTnJRdVNUZk41bUYvMjVW?=
 =?gb2312?B?ODRiamI5L1RiYmNRM2NhNTBmblAyeUJ5Y1B1akY2RHNva0taRFZieEdTYk9a?=
 =?gb2312?B?OFJuM2JNMkpMd0lacmU5RnVlVGttRTZlcW11V1p1UFdaVGJBUFJsTXh3L0tx?=
 =?gb2312?B?SlE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(1580799027)(38070700021)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?dWJ2Wi9ZdDZsODJzeWs2eG5TUHFFOTFQVWdJZWVzUm41WG52MWJ6SS9ibFd5?=
 =?gb2312?B?cThqMmhsODRoUWd5U1pmQ1dyVnpUVGVLaUFFOWdsTEJUaE5nOW1oTmp6MDRx?=
 =?gb2312?B?Ujk5c1FsRm5IZ21EUzFQQTNjcFp4bDJCdzNoUmdycWdVS1U0aGtTWXE3ZU5N?=
 =?gb2312?B?QzYvR0VOelNEWFhVTURHbzlPaTJnTVJLU29PN2FWMk0zWVc2VGorczVEVkJK?=
 =?gb2312?B?Y1dpMVNPS1d4L0tWdkhHOW1wNWszd0V3R3p5SFVsWVhXTTNZcnRPdys4TGFi?=
 =?gb2312?B?SzR0OUpyVStFM2t6TUN3MmI4cC9xNFpPUVZEU2dvdEIzZElSdU55YzEwK0xn?=
 =?gb2312?B?ZjNaQWlNbW5UeUx4WFJDcTAyR1hpQThmMThNTWpPYUEyZzI3S2o5R1lNUVZ2?=
 =?gb2312?B?WEQ4RTBVc0EyUStCZTdCMmpXZzAzdFh1N1lJS0RXaE4wZUd2MFg1TnFrS1B0?=
 =?gb2312?B?RThtTWxYQ2JnN203TGRRc3BabkxKTi9BM3g4N1duZEFJOUl3R0dLeENnREd6?=
 =?gb2312?B?cnBzaHp2L1FYU2Z5Qk1UaVh1Mys3WnhoeGZBNmJEQ25BMHQxbDBsMVdXQzVH?=
 =?gb2312?B?QzFidmRQUjgwTk1JN1BBWlBFM3B3MVBWZzlvQXlCYURuWGdRWlgraXZsZTdU?=
 =?gb2312?B?SGU2d0pqa1p6WWJ4L0YzazdHblRsT29zdzE5aXNqVXBNZ1ZnbW16aTdWSm9I?=
 =?gb2312?B?VEQwTXVmYmJoMUhhTzhHOVpwWGQ1YnVHSkRGSXJJQ3B1SjdRcTd1c01ZQjdX?=
 =?gb2312?B?NU9SZlRwbnBDN0gyTVRhaEs1ejAxejlIYXphTE9BK1RhTmZnZXNkd24vSWV0?=
 =?gb2312?B?bTlIQWxiM3BGNWdBbjZiM1J1bHJvbzBhZlhXM3grZlFJTVVVaFVRUWFFeGlq?=
 =?gb2312?B?ZUpLWHprS3ZjM3FMdWVVMVR2YVdqOG9FUlR5RVhudmdLbko2c2syaUJpYktT?=
 =?gb2312?B?Sndjdk5KRmc0Nzk0NjhNbUlaYmdOU2lLNW1UbCtjOVRXUkxjaU56T05VREJq?=
 =?gb2312?B?eEVIZ3ZEeFJtS0xIbzdab21rUXQ2a1dEMExyUjdYQVZJMmE2WnREN0ZUZlBJ?=
 =?gb2312?B?N01yWUdwb0RWcDJyVEx4czh1Y0JDWnFyYU5MLzNHaytpcTMrRGtNR3ZTSDc1?=
 =?gb2312?B?amw1cnBJVHNWZzJnK0Z1M0tjNVdScEw4cjJpeWE3WXR3c1lINW1ZNG1UZU43?=
 =?gb2312?B?aHQ1UzdpVTU1dWdrOVpOV3J3eXcrbk02cU96bnZSQStjL21id0U0TWtmTkNJ?=
 =?gb2312?B?YldraXB5RFl4YjlaUlpQcGEwTUczRFBkZmNOZDgxMy9KeWFyc0JFcTZQVkdK?=
 =?gb2312?B?c2FJbFhWT1ZSdWlxZWQrODcxbEFaeGc1MnYxRjhORzRRbkRJNFowZ01odVQ0?=
 =?gb2312?B?VGc1WTlnZlFONC9VTHRuekFKZ2JIeWFiY1I2c0J2WmdCV1hSWjNtRmM0SWx5?=
 =?gb2312?B?STJpWHBwam1HQWg3ajJPS2lFQXVVVGRyUUpyYUZnLzZXcytVZVk1Q1BlQUdk?=
 =?gb2312?B?NDAyRklxaEVJUzkvYWlsNGZtUGFBcnVqS3BLdUVuVC9ta2w3ZmluNCtubVpD?=
 =?gb2312?B?TFUzVDU2UEJQemR1U3NlSTYxdkYxVzdjSis0L3Y2REkzbU9sTmNLSmJzLzdh?=
 =?gb2312?B?dFZ0UjJ1NVlYbEJnZjZOSXZxNWhZbTg0L1BxK0pVWlFCbUhhUkc0TjdRS2tR?=
 =?gb2312?B?V1prSklXRzF0TkxVR3BRcHNrV1RER0FrZ1JsS253S3pHdDhQeXVBaElQR2kr?=
 =?gb2312?B?M2pCQU1XZnZFbzB4RzBQeFN2eHZDbnUybEJRWVhaRDhId0VBTGJCdFNwZVd0?=
 =?gb2312?B?M003TGZXUlo4dWRwZWJsRlJSaERvN2tyUDBTdHBZN0NJaUYrZy9vQWdJY3BJ?=
 =?gb2312?B?anpzOHo4dk9LRlFwWXdIamNtY015d2g3eGljWm5rS0J5NDR1cERCY29sZGFm?=
 =?gb2312?B?L1Zva3Y0OHk1NDY4ekRTVzIxekk0M1NiOG5kM0xYc2Fua0FvZWh1ZmpPZWlU?=
 =?gb2312?B?MzhqakIvYjFtUU12VVBLMHlSMWl0ODQ4MnJZY0xDNXdOdjc5enh4RXN6MTNx?=
 =?gb2312?B?Yk8wcUpxZk1yWWJDM0s3T1IxZnRXWnc0VXRSSERBTWIwWUdkckloNzA4d2lT?=
 =?gb2312?B?WGZoVkVoaEZ0NU9id3paVEpCNnZHMWFVNjVSaTl4Y0x0TTMwZ0RQQjFXOWRm?=
 =?gb2312?B?Ni94NkI1bm1NMHN1TzhieXlJS3RlU2lEU3NYdGZJMC9mWEcveTdEaWlSNkFz?=
 =?gb2312?B?cXdFL0dUOTlNazRSRnRtdEE5Q1ZKZFI4c1ZTbjB1RzdiaXZSVFZFT05nNHNs?=
 =?gb2312?B?S0ptSUp4NUdzRHZ1aTFuVHFoL01pYlcvckdqWU04M3lMMXcrb1l5UT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110F8354668695ABA48A8879B65ATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0ef206-d985-4ff9-4d4d-08de684df6da
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 02:41:59.5944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mXcSMvUDs3Lim0KidjxjaNEiMLzT75tEOA8FqdD81IB1vxSRhFdvAGJ0HRlvXnpIDnyjvlrojUlEgx5i7Z/l1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 02:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230829

--_000_TY3PR01MB10110F8354668695ABA48A8879B65ATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KICAgICAgIEkgdHJ5IHRvIGVuYWJsZSBkb2MgaW4gZ3N0cmVhbWVyMS4wLXZhYXBp
LCAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSBhbmQgZ3N0cmVhbWVyMS4wIGJ1dCBmb3VuZCBh
IHByb2JsZW0NCg0KICAgICAgIFRoZXJlIGlzIGEgZGVmaW5pdGlvbiBpbiBkb2NzL21lc29uLmJ1
aWxkIHdoaWNoIHByZXZlbnQgYnVpbGRpbmcgZG9jIGluICBjcm9zcyBidWlsZGluZy4NCg0KaWYg
bWVzb24uaXNfY3Jvc3NfYnVpbGQoKQ0KICAgIGlmIGdldF9vcHRpb24oJ2RvYycpLmVuYWJsZWQo
KQ0KICAgICAgICBlcnJvcignRG9jdW1lbnRhdGlvbiBlbmFibGVkIGJ1dCBidWlsZGluZyB0aGUg
ZG9jIHdoaWxlIGNyb3NzIGJ1aWxkaW5nIGlzIG5vdCBzdXBwb3J0ZWQgeWV0LicpDQogICAgZW5k
aWYNCg0KICAgIG1lc3NhZ2UoJ0RvY3VtZW50YXRpb24gbm90IGJ1aWx0IGFzIGJ1aWxkaW5nIGl0
IHdoaWxlIGNyb3NzIGJ1aWxkaW5nIGlzIG5vdCBzdXBwb3J0ZWQgeWV0LicpDQogICAgc3ViZGly
X2RvbmUoKQ0KZW5kaWYNCg0KICAgICAgICAgU28gd2hhdCBzaG91bGQgSSBkbyBuZXh0PyBNYXli
ZSBJIHNob3VsZCBzZW5kIHRoZXN0IHBhdGNoc2V0cyB0byBtZXRhLW9lPw0KTGl1DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4NCreiy83KsbzkOiAyMDI2xOoy1MI1yNUgMTc6NTANCsrVvP7I
yzogTGl1LCBZaWRpbmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCrOty806IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBSZTogW09FLWNvcmVdW1BBVENIIDYvNl0g
b3JjOiBFbmFibGUgaG90ZG9jIHRvIHByb2R1Y2UgZG9jDQoNCkhlbGxvLA0KDQpzb3JyeSBmb3Ig
bm90IHNheWluZyB0aGlzIGV4cGxpY2l0bHksIGFzIHlvdSd2ZSBmb3VuZCBvdGhlciByZWNpcGVz
DQp3aXRoIGhvdGRvYyBzdXBwb3J0LCBjYW4geW91IGxvb2sgaW50byBlbmFibGluZyBpdCB0aGVy
ZSBhcyB3ZWxsPw0KDQpBbGV4DQoNCk9uIFRodSwgNSBGZWIgMjAyNiBhdCAwMzo1OSwgWWlkaW5n
IExpdSAoRnVqaXRzdSkNCjxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPiB3cm90ZToNCj4NCj4gUGlu
Zw0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiC3orz+yMs6IExpdSwgWWlk
aW5nL8H1INLStqEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+ILeiy83KsbzkOiAyMDI2xOox
1MIzMMjVIDEwOjE5DQo+IMrVvP7IyzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+DQo+ILOty806IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+INb3zOI6ILvY
uLQ6IFtPRS1jb3JlXVtQQVRDSCA2LzZdIG9yYzogRW5hYmxlIGhvdGRvYyB0byBwcm9kdWNlIGRv
Yw0KPg0KPiBIaSBBbGV4DQo+DQo+ICAgICAgSSBzZWFyY2ggdGhlIGNoYW5nZWxvZyBpbiBnaXQg
bG9nLCBhbmQgZm91bmQgdGhhdCBiZXNpZGVzIG9yYywgZ3N0cmVhbWVyMS4wLXZhYXBpLCAgZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSBhbmQgZ3N0cmVhbWVyMS4wIHVzZWQgaG90ZG9jIGluIG5l
dyB2ZXJzaW9uLg0KPg0KPiBMaXUNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gt6K8/sjLOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4g
t6LLzcqxvOQ6IDIwMjbE6jHUwjI5yNUgMTk6MjYNCj4gytW8/sjLOiBMaXUsIFlpZGluZy/B9SDS
0rahIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiCzrcvNOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPg0KPiDW98ziOiBSZTogW09FLWNvcmVdW1BBVENIIDYvNl0gb3JjOiBFbmFibGUgaG90
ZG9jIHRvIHByb2R1Y2UgZG9jDQo+DQo+IFRoYW5rcyBmb3IgbG9va2luZyBpbnRvIHRoaXMuIEFy
ZSB0aGVyZSBvdGhlciByZWNpcGVzIGluIG9lLWNvcmUgdGhhdA0KPiBoYXZlIGhvdGRvYyBzdXBw
b3J0PyBZb3UgY2FuIHBlcmhhcHMgdW5wYWNrIGV2ZXJ5dGhpbmcgKHdpdGhvdXQNCj4gYnVpbGRp
bmcgaXQpLCBhbmQgdGhlbiBncmVwIGluIFdPUktESVIgZm9yIGhvdGRvYy4NCj4NCj4gSWYgdGhl
cmUncyBqdXN0IG9yYywgd2UgY291bGQgcHJvYmFibHkgYWRkIGhvdGRvYyB0byBtZXRhLW9wZW5l
bWJlZGRlZCBmaXJzdC4NCj4NCj4gVGhlIHBlbmRpbmcgcGF0Y2ggbmVlZHMgdG8gYmUgc3VibWl0
dGVkIHVwc3RyZWFtLg0KPg0KPiBBbGV4DQo+DQo+IE9uIFRodSwgMjkgSmFuIDIwMjYgYXQgMDQ6
NTQsIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxs
aXV5ZC5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNv
bT4NCj4gPiAtLS0NCj4gPiAgLi4uL29yYy9vcmMvMDAwMS1GaXgtaG90ZG9jLXJ1bi1lcnJvci5w
YXRjaCAgIHwgMzcgKysrKysrKysrKysrKysrKysrKw0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvb3JjL29yY18wLjQuNDIuYmIgICAgICAgfCAgNSArKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA0MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yYy8wMDAxLUZpeC1ob3Rkb2MtcnVuLWVycm9y
LnBhdGNoDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9v
cmMvMDAwMS1GaXgtaG90ZG9jLXJ1bi1lcnJvci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9vcmMvb3JjLzAwMDEtRml4LWhvdGRvYy1ydW4tZXJyb3IucGF0Y2gNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLjI3N2NlMDM4ZjgNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmMvMDAwMS1GaXgt
aG90ZG9jLXJ1bi1lcnJvci5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsMzYgQEANCj4gPiArU3ViamVj
dDogW1BBVENIXSBGaXggaG90ZG9jIHJ1biBlcnJvci4NCj4gPiArDQo+ID4gK0ZpeCB0aGUgZm9s
bG93aW5nIGVycm9yLg0KPiA+ICt8IFJ1bm5pbmcgY3VzdG9tIGluc3RhbGwgc2NyaXB0ICd0bXAv
d29yay94ODYtNjQtdjMtcG9reS1saW51eC9vcmMvMC40LjQyL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL21lc29uLnJlYWwgLS1pbnRlcm5hbCBob3Rkb2MgLS1pbnN0YWxsIG9yYy1kb2Mv
aHRtbCAtLWRvY2RpciAvdXNyL3NoYXJlL2RvYy9vcmMvaHRtbCAtLW5hbWUgb3JjIC0tYnVpbGRk
aXIgdG1wL3dvcmsveDg2LTY0LXYzLXBva3ktbGludXgvb3JjLzAuNC40Mi9idWlsZC9kb2MgdG1w
L3dvcmsveDg2LTY0LXYzLXBva3ktbGludXgvb3JjLzAuNC40Mi9yZWNpcGUtc3lzcm9vdC1uYXRp
dmUvdXNyL2Jpbi9ob3Rkb2MgcnVuIC0tY29uZi1maWxlIG9yYy1kb2MuanNvbicNCj4gPiArfCAt
LS0gc3Rkb3V0IC0tLQ0KPiA+ICt8DQo+ID4gK3wgLS0tIHN0ZGVyciAtLS0NCj4gPiArfCBFUlJP
UjogW2RvYy10cmVlXTogKGluZGV4LWV4dGVuc2lvbi1ub3QtZm91bmQpOiB0bXAvd29yay94ODYt
NjQtdjMtcG9reS1saW51eC9vcmMvMC40LjQyL3NvdXJjZXMvb3JjLTAuNC40Mi9kb2Mvc2l0ZW1h
cC50eHQ6ODoxMDogTm8gZXh0ZW5zaW9uIG5hbWVkIGMgZm9yIGluZGV4IHBhZ2UNCj4gPiArfCAw
MDAwNjogICAgICAgICAgICAgICAgdHV0b3JpYWwubWQNCj4gPiArfCAwMDAwNzogICAgICAgICAg
ICAgICAgb3Bjb2Rlcy5tZA0KPiA+ICt8IDAwMDA4OiAgICAgICAgYy1pbmRleA0KPiA+ICt8ICAg
ICAgICAgICAgICAgXg0KPiA+ICt8IDAwMDA5Og0KPiA+ICt8DQo+ID4gKw0KPiA+ICtSZW1vdmUg
Yy1pbmRleCBhcyBpdCBpcyBub3QgaW4gdGhlIGRvYyBkaXJlY3RvcnkuDQo+ID4gKw0KPiA+ICtV
cHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcNCj4gPiArDQo+ID4gK1NpZ25lZC1vZmYtYnk6IExpdSBZ
aWRpbmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+ID4gKy0tLQ0KPiA+ICsgZG9jL3NpdGVt
YXAudHh0IHwgMSAtDQo+ID4gKyAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiA+ICsN
Cj4gPiArZGlmZiAtLWdpdCBhL2RvYy9zaXRlbWFwLnR4dCBiL2RvYy9zaXRlbWFwLnR4dA0KPiA+
ICtpbmRleCA1NjhiMzY3Li40MGE3Zjk5IDEwMDY0NA0KPiA+ICstLS0gYS9kb2Mvc2l0ZW1hcC50
eHQNCj4gPiArKysrIGIvZG9jL3NpdGVtYXAudHh0DQo+ID4gK0BAIC01LDQgKzUsMyBAQCBpbmRl
eC5tZA0KPiA+ICsgICAgICAgICAgICAgICBjb25jZXB0cy5tZA0KPiA+ICsgICAgICAgICAgICAg
ICB0dXRvcmlhbC5tZA0KPiA+ICsgICAgICAgICAgICAgICBvcGNvZGVzLm1kDQo+ID4gKy0gICAg
ICBjLWluZGV4DQo+ID4gKy0tDQo+ID4gKzIuNDMuMA0KPiA+ICsNCj4gPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjQyLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL29yYy9vcmNfMC40LjQyLmJiDQo+ID4gaW5kZXggZjU2YjkwNThjMi4uYjczYzhkZjA0
ZCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuNDIu
YmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuNDIuYmINCj4g
PiBAQCAtNCwxMSArNCwxNCBAQCBERVNDUklQVElPTiA9ICJPcHRpbWlzZWQgSW5uZXIgTG9vcCBS
dW50aW1lIENvbXBpbGVyIGlzIGEgTGlicmFyeSBhbmQgc2V0IG9mIHRvbw0KPiA+ICBMSUNFTlNF
ID0gIkJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSINCj4gPiAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9MTQwMGJkOWQwOWU4YWY1NmI5ZWM5ODJiM2Q4NTc5N2UiDQo+
ID4NCj4gPiAtU1JDX1VSSSA9ICJodHRwOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMv
b3JjL29yYy0ke1BWfS50YXIueHoiDQo+ID4gK1NSQ19VUkkgPSAiaHR0cDovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL29yYy9vcmMtJHtQVn0udGFyLnh6IFwNCj4gPiArICAgICAgICAg
ICBmaWxlOi8vMDAwMS1GaXgtaG90ZG9jLXJ1bi1lcnJvci5wYXRjaCBcDQo+ID4gKyAgICAgICAg
ICAiDQo+ID4gIFNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZWM5MTJhYjU5YWYzY2M5Nzg3NGM0NTZh
NTZhOGFlMWVlYzUyMGMzODVlYzQ0N2U4YTEwMmIyYmQxMjJjOTBjIg0KPiA+DQo+ID4gIGluaGVy
aXQgbWVzb24gcGtnY29uZmlnDQo+ID4NCj4gPiArREVQRU5EUyA9ICJob3Rkb2MtbmF0aXZlIg0K
PiA+ICAjIGRpc3Rpbmd1aXNoIGZyb20gYXBhY2hlOm9yYw0KPiA+ICBDVkVfUFJPRFVDVCA9ICJn
c3RyZWFtZXI6b3JjIg0KPiA+DQo+ID4gLS0NCj4gPiAyLjQzLjANCj4gPg0KPiA+DQo+ID4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIzMDExOCk6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2Uv
MjMwMTE4DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbXQvMTE3NTIxNDU0LzE2ODY0ODkNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNv
cmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbYWxleC5r
YW5hdmluQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

--_000_TY3PR01MB10110F8354668695ABA48A8879B65ATY3PR01MB10110jp_
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
>Alex</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif;" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp; =
&nbsp;I try to enable doc in
</span><span style=3D"font-size: 11pt; color: black;">gstreamer1.0-vaapi, &=
nbsp;gstreamer1.0-plugins-base and gstreamer1.0 but found a problem</span><=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: black;" class=3D"el=
ementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: black;" class=3D"el=
ementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;There is a definition in docs/meson.build which =
prevent building doc in &nbsp;cross building.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: black;" class=3D"el=
ementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
if meson.is_cross_build()</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
&nbsp; &nbsp; if get_option('doc').enabled()</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; error('Documentation enabled but building the d=
oc while&nbsp;cross building&nbsp;is not supported yet.')</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
&nbsp; &nbsp; endif</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
&nbsp; &nbsp; message('Documentation not built as building it while cross b=
uilding is not supported yet.')</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
&nbsp; &nbsp; subdir_done()</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
endif</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: =
black;" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 0px; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: b=
lack;" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;So what should I do next? Maybe I should =
send thest patchsets to meta-oe?</div>
<div style=3D"margin-left: 0px; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: b=
lack;" class=3D"elementToProof">
Liu&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Alexand=
er Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C25=C8=D5 17:50<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce=
 doc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
sorry for not saying this explicitly, as you've found other recipes<br>
with hotdoc support, can you look into enabling it there as well?<br>
<br>
Alex<br>
<br>
On Thu, 5 Feb 2026 at 03:59, Yiding Liu (Fujitsu)<br>
&lt;liuyd.fnst@fujitsu.com&gt; wrote:<br>
&gt;<br>
&gt; Ping<br>
&gt; ________________________________<br>
&gt; =B7=A2=BC=FE=C8=CB: Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@fuj=
itsu.com&gt;<br>
&gt; =B7=A2=CB=CD=CA=B1=BC=E4: 2026=C4=EA1=D4=C230=C8=D5 10:19<br>
&gt; =CA=D5=BC=FE=C8=CB: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<b=
r>
&gt; =B3=AD=CB=CD: openembedded-core@lists.openembedded.org &lt;openembedde=
d-core@lists.openembedded.org&gt;<br>
&gt; =D6=F7=CC=E2: =BB=D8=B8=B4: [OE-core][PATCH 6/6] orc: Enable hotdoc to=
 produce doc<br>
&gt;<br>
&gt; Hi Alex<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I search the changelog in git log, and f=
ound that besides orc, gstreamer1.0-vaapi,&nbsp; gstreamer1.0-plugins-base =
and gstreamer1.0 used hotdoc in new version.<br>
&gt;<br>
&gt; Liu<br>
&gt; ________________________________<br>
&gt; =B7=A2=BC=FE=C8=CB: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<b=
r>
&gt; =B7=A2=CB=CD=CA=B1=BC=E4: 2026=C4=EA1=D4=C229=C8=D5 19:26<br>
&gt; =CA=D5=BC=FE=C8=CB: Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@fuj=
itsu.com&gt;<br>
&gt; =B3=AD=CB=CD: openembedded-core@lists.openembedded.org &lt;openembedde=
d-core@lists.openembedded.org&gt;<br>
&gt; =D6=F7=CC=E2: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce d=
oc<br>
&gt;<br>
&gt; Thanks for looking into this. Are there other recipes in oe-core that<=
br>
&gt; have hotdoc support? You can perhaps unpack everything (without<br>
&gt; building it), and then grep in WORKDIR for hotdoc.<br>
&gt;<br>
&gt; If there's just orc, we could probably add hotdoc to meta-openembedded=
 first.<br>
&gt;<br>
&gt; The pending patch needs to be submitted upstream.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Thu, 29 Jan 2026 at 04:54, Yiding Liu (Fujitsu) via<br>
&gt; lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded=
.org&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; .../orc/orc/0001-Fix-hotdoc-run-error.patch&nbsp;&nbsp; | 3=
7 +++++++++++++++++++<br>
&gt; &gt;&nbsp; meta/recipes-devtools/orc/orc_0.4.42.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 5 ++-<br>
&gt; &gt;&nbsp; 2 files changed, 41 insertions(+), 1 deletion(-)<br>
&gt; &gt;&nbsp; create mode 100644 meta/recipes-devtools/orc/orc/0001-Fix-h=
otdoc-run-error.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-er=
ror.patch b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch<b=
r>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..277ce038f8<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.pat=
ch<br>
&gt; &gt; @@ -0,0 +1,36 @@<br>
&gt; &gt; +Subject: [PATCH] Fix hotdoc run error.<br>
&gt; &gt; +<br>
&gt; &gt; +Fix the following error.<br>
&gt; &gt; +| Running custom install script 'tmp/work/x86-64-v3-poky-linux/o=
rc/0.4.42/recipe-sysroot-native/usr/bin/meson.real --internal hotdoc --inst=
all orc-doc/html --docdir /usr/share/doc/orc/html --name orc --builddir tmp=
/work/x86-64-v3-poky-linux/orc/0.4.42/build/doc
 tmp/work/x86-64-v3-poky-linux/orc/0.4.42/recipe-sysroot-native/usr/bin/hot=
doc run --conf-file orc-doc.json'<br>
&gt; &gt; +| --- stdout ---<br>
&gt; &gt; +|<br>
&gt; &gt; +| --- stderr ---<br>
&gt; &gt; +| ERROR: [doc-tree]: (index-extension-not-found): tmp/work/x86-6=
4-v3-poky-linux/orc/0.4.42/sources/orc-0.4.42/doc/sitemap.txt:8:10: No exte=
nsion named c for index page<br>
&gt; &gt; +| 00006:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tutorial.md<br>
&gt; &gt; +| 00007:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opcodes.md<br>
&gt; &gt; +| 00008:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c-index<br>
&gt; &gt; +|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ^<br>
&gt; &gt; +| 00009:<br>
&gt; &gt; +|<br>
&gt; &gt; +<br>
&gt; &gt; +Remove c-index as it is not in the doc directory.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Pending<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + doc/sitemap.txt | 1 -<br>
&gt; &gt; + 1 file changed, 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/doc/sitemap.txt b/doc/sitemap.txt<br>
&gt; &gt; +index 568b367..40a7f99 100644<br>
&gt; &gt; +--- a/doc/sitemap.txt<br>
&gt; &gt; ++++ b/doc/sitemap.txt<br>
&gt; &gt; +@@ -5,4 +5,3 @@ index.md<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; concepts.md<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; tutorial.md<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; opcodes.md<br>
&gt; &gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c-index<br>
&gt; &gt; +--<br>
&gt; &gt; +2.43.0<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recip=
es-devtools/orc/orc_0.4.42.bb<br>
&gt; &gt; index f56b9058c2..b73c8df04d 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/orc/orc_0.4.42.bb<br>
&gt; &gt; +++ b/meta/recipes-devtools/orc/orc_0.4.42.bb<br>
&gt; &gt; @@ -4,11 +4,14 @@ DESCRIPTION =3D &quot;Optimised Inner Loop Runt=
ime Compiler is a Library and set of too<br>
&gt; &gt;&nbsp; LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
&gt; &gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D=
1400bd9d09e8af56b9ec982b3d85797e">file://COPYING;md5=3D1400bd9d09e8af56b9ec=
982b3d85797e</a>&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI =3D &quot;<a href=3D"http://gstreamer.freedesktop.org/sr=
c/orc/orc-${PV}.tar.xz">http://gstreamer.freedesktop.org/src/orc/orc-${PV}.=
tar.xz</a>&quot;<br>
&gt; &gt; +SRC_URI =3D &quot;<a href=3D""></a>http://gstreamer.freedesktop.=
org/src/orc/orc-${PV}.tar.xz \<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a =
href=3D"file://0001-Fix-hotdoc-run-error.patch">file://0001-Fix-hotdoc-run-=
error.patch</a> \<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br=
>
&gt; &gt;&nbsp; SRC_URI[sha256sum] =3D &quot;7ec912ab59af3cc97874c456a56a8a=
e1eec520c385ec447e8a102b2bd122c90c&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; inherit meson pkgconfig<br>
&gt; &gt;<br>
&gt; &gt; +DEPENDS =3D &quot;hotdoc-native&quot;<br>
&gt; &gt;&nbsp; # distinguish from apache:orc<br>
&gt; &gt;&nbsp; CVE_PRODUCT =3D &quot;gstreamer:orc&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#230118): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/230118">
https://lists.openembedded.org/g/openembedded-core/message/230118</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117=
521454/1686489">
https://lists.openembedded.org/mt/117521454/1686489</a><br>
&gt; &gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB10110F8354668695ABA48A8879B65ATY3PR01MB10110jp_--

