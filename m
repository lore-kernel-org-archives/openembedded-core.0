Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E98D715DE
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 12:18:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17478.1769257098096444059
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 04:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yVw1UPe/;
 spf=pass (domain: siemens.com, ip: 52.101.65.22, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4AvsMofi9JgnTM2yogyNr559YUImmNydC7TN3q2e1WRnzC3HFwrdDn2IfWIL7LrR/yVExC83h/NQNB0ffBgSE/3aSapC6Flo5AkkuQN+Z6r6Ngz6W7b92ZD5m+nghLYkuIpa9Drz3uXUUsEYz8zJjrTDCCe4SYMlO3b7iTgeGyLJ10xx0GAZPO2qvK1Fdv7rj45c5HXDfyW5Q3dZRE9AhBb8k82te1lb6gPSySEUTlUCKvmDHIPuvVY3dzgpBcnuKa2Q4wuHE93tmGgLGseJ8FgK4PQMhknWbIBrp9omG7tF3XuNi2ZG5fqoyCFC1IcSRyo9GEYSehTA/hTydvoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52gfnKGqY7kFrMX6GtV5ph2BrMKgUFOp8PavXiDjaCY=;
 b=xBziOUCepQaD4ViBD1iqDDC754Kmf+27iPOjHzuD4S4U6HPSkJpxZo10cTm5Pq/C6Edw95xgo7pJGwzkhyyMaUI9R86VQp3XvDM2kjHouhSloXN/lo5xdZ4LutpZ0TiMAxo66BduQT6z/DynVBdv9nApRsWABC07/8cxxntTIszkg9+zfVetwc4NSPbWwYn8PfOAyAlIZOaCupKlO0ILQBBGd68bgbjG2GfCuJCvUFzMGTVKD3mM7otzrwUkddalJLmSaq+KwrFiUtBsLZr8gBnd77zpaucoELdM9wJ1JONLa7UhVew/iLNj9b5qG41JxHPxOGhNkKI0zh5nnc5e/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52gfnKGqY7kFrMX6GtV5ph2BrMKgUFOp8PavXiDjaCY=;
 b=yVw1UPe/YsLd6jXEZrQNxI7op/1HtxRubk0zE+bcuRYYP/Dh7t09jcdNYpDDm909kSKu30Byl/9/haEmf9Pr4N9RmjWydaiYC6MzhXdb4iUZjQccICVAW17i1Q0sG35FxVT0Ok1ooO5q9CyjX3U548vf6bqlVoX54KizVf4rvsSr7jRG6EWElT2E3E4F6ynh+sA4TzA0lEHyobz1bXu0O8FCvEf8A2FIgHEJqYHhepiI6GivCs7MujiDR4Hh71RUB0SZyjbEzeH3ovD5qB+b6zYsHzsjD53zu8sdjkjAaiewH+dNGu7BZEkrhFLWMWUaTR8O62QDGRhinUyFNYnX3g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 12:18:12 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 12:18:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 ->
 3.5.4
Thread-Topic: [OE-core][scarthgap][RFC PATCH 0/1] openssl: upgrade 3.2.6 ->
 3.5.4
Thread-Index: AQHcjGSHvMuDyaVqK06yJMJyJ2KvV7Vf+1AAgAEkkQCAAB32MA==
Date: Sat, 24 Jan 2026 12:18:12 +0000
Message-ID: 
 <AS1PR10MB5697A3FDD560D7BC29A19B4BFD95A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260123123336.41126-1-peter.marko@siemens.com>
 <CAMSfU+7FpuEruzCELf=PGAmGgEzWYf_WBnU2goHdsPSsSkDcVg@mail.gmail.com>
 <CAMSfU+7h_LCFuziRsfcEhDfzJkdFQaP4bCM1WEkkHRHcW6j_qw@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+7h_LCFuziRsfcEhDfzJkdFQaP4bCM1WEkkHRHcW6j_qw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=bab9b230-653e-4dd3-9831-765eaed25e3f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-24T12:16:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8520:EE_
x-ms-office365-filtering-correlation-id: 68ae6335-1526-44e4-7bff-08de5b42a4f8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Titoa3hnN0tIQjBjM1duU3RMTVBEWGVMRnFPUlhnNUFyeGpoWFRTZE9KK1dp?=
 =?utf-8?B?Zk8wcDhjTTR0bEdld0syWWR4d3hvbFlhSHlsY0FnYjZZQUNmOE9RemsxU1U4?=
 =?utf-8?B?R3A0RytSQ0h0RlN2bzN6dlVVdlhTaUg4bFlCZ25wc3NsV0QrcW9xTFN5VTkr?=
 =?utf-8?B?V282OHVScEdDb2IxRlVzd2tQNTRwNUZuUHN4TXBEMXlQZlhRRjFYV0VtQlJB?=
 =?utf-8?B?Z1NYcmJKSnI4QVEzWU15SHBnQXA4cVI1Zmg2bUc4bjFZL2RTdnRkQXFrdjJu?=
 =?utf-8?B?T2xWNCs1NWo0dEpYdHhqVDhnaWFqN3I2cjNpMS9yaFhndDhiU1g0bHZnUkFB?=
 =?utf-8?B?bjlWRjF3bWk0djNwblcxMWM1SnM1Nlp0RHZBTWNXTUFpblp2WjhkZGFPUEpY?=
 =?utf-8?B?N0h3ZTFVK3hVTGs2RWhPR2VpMkc1bUpMc0NwRm1SdE1sSFo4THRiYnA2Tk9x?=
 =?utf-8?B?YklBbG5BVHNJZzluZnorZjFERXhNN1BDaGVBWkxLSFhMbGRaSittaVVGWnVm?=
 =?utf-8?B?QUlPeUNRWkFrMEdUTkJSeUtTWktIU1E0eFNOb2h2NDdYTDdlWHdSYmZObzdB?=
 =?utf-8?B?aUlYbVkyNkFyNThxekZTdlRGcU1BTTNRVWs1MmVGMlBjV1hIdnJUNWxJV1JP?=
 =?utf-8?B?WEJocHh0L3Z4Q2RpNEM1cFNMQlA0Zk5VZFVPT282b21QOTBmSVpQYk9pOHRI?=
 =?utf-8?B?b3lEaE1Kbjh5KzdvTkM5c0hUWThHNHNESjNmekVBdnF6M3RYMjNNNTNhUVN4?=
 =?utf-8?B?eHdyQ0Y1OVhrU0l2UXYrRXFtL0x4OW94Snp3aTh1MENWZXM4MWZQZVZhU204?=
 =?utf-8?B?Z3B5RDdBaWNoQVNhaVYrNEVZMm44Q3VtQlFZRHVSREI2THlhRXM5ZHZFc3F1?=
 =?utf-8?B?L2xnbnhObStRTmNHNFBlV0NFUHZJazhaS251T0hLa0w1djh2aXZ1Z1l4MmRZ?=
 =?utf-8?B?N1ZldFhuUkJENUcrbEYxY1hpWFcxQVlLbC83UFVLdWdXREpweW1WWXJjZWtp?=
 =?utf-8?B?cm9sUndQRmlpY0xscVVVLzZYTWxtbllaR05zM1BlVW1xYy95NnpMcnArTFZr?=
 =?utf-8?B?U0pGWlhXdTl5eUZUMW5lWW41emkzVHhEZ2ZpeGUzNTZFRytPYjBBbDd4TEJw?=
 =?utf-8?B?S2F4Nm1tdnZwejcvYnBrTTN3dmVGWjJlejdnKzQrOGMzZXZ0YU5HeVZMT3F4?=
 =?utf-8?B?Wi94dkZiZk4xdkR2cHkyeEtoS2VKQXJ2c2ZwNU82R1llOW55RVlqaFdwYkVz?=
 =?utf-8?B?dGRoc2x3T0t1RGlhb2xFMTRWaFdHLzlXNTB2ZStkZmVTRmRoR1UzNU1XTE5W?=
 =?utf-8?B?cTJWWjhUSVVhSzU3QXJBQkVFRTJBbm5HSitwYjA4b3I1ZEVwdENOSW9TVHhh?=
 =?utf-8?B?TGg4T2J5QUZOS2IzTlVvQS80azVEdXRwYlhnOUUwclV2aC9JSDBVSURZMkx0?=
 =?utf-8?B?ZmdRS3JNb1BIVWZIYk0vZStwcWcrUGNMa3ZVVitNOVBVSTB6U1QwOU9VZjJ4?=
 =?utf-8?B?dFVCMFJXallMWkRqdkY1aW5xdktsRkhvT0lwZVhmeVY0OVkzVVFBeGVkNXU5?=
 =?utf-8?B?dVFSNEU4RHVqeWxJNG5aaHgzVzZQYnRyb3kvUzRRZFlSM08ydGIwaEVXMjlo?=
 =?utf-8?B?RjNkQ25JNFRURjY1ZlVHaFU2dVBjbVg4ZVhKKyt4V2JJMlJVNU4yMzU3dVVa?=
 =?utf-8?B?eE9VWU9qcjVRK0pvQ0FDTnEwVU1RcE9vUVRFZWcvVDl1L2dJbElvZTF4dGNt?=
 =?utf-8?B?QWw1N3JHanpJRGpNeEp6N1RXbjF5UzJzY3ZTM29mTmVwcFlSZHRMU01rUmJy?=
 =?utf-8?B?OFhQRUZNQnZxMFBWRVU0aC9JbXozU3lqMjROdmVhN0t3SGU0OUFac3JjdzRz?=
 =?utf-8?B?WHVUanpGQTlZMjNlUmdoYmxRL2d1Rk1KVTk1SHA3RkUrKzgxMW1Sc2tZb3Zx?=
 =?utf-8?B?cDdaNGdOYUhiTGdUMjQvL3p1MjhLMS95UUYxdUptblg2SldkTExZTUFjdDlM?=
 =?utf-8?B?UGFxS0xsQ3ZtZ2JoYkZ0L0NpNDhaOHNOR29UNXRrRW80dkl4Y1VXcUJxRGlt?=
 =?utf-8?B?WEthdDR5Y21KL2dLUTVmQlBLbmJWSHFjNWlPRVIyUEdjQXU5ejJCbU1VM29G?=
 =?utf-8?Q?r3Ny9YEjbhIutmULXBPqnukG6?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NitpeHJodUpodmI1ek14Y1ZUdEZHcS95bFQxOUxhQXFId1o2ZjRoS3pNUVNv?=
 =?utf-8?B?SE1peDA4QitpRVFNc2tGbXhEZExwS1I2cFY2M2NUVFppTko3bjQxV0JWdTdE?=
 =?utf-8?B?aUZ3Z2Y1ZmVGSUttNkdyZkhrOGFhN1FZbzBvcGVUWVpzcjVFemw1b2lnU2ph?=
 =?utf-8?B?S3UyYW9ZUllnRDlaNmRvZlg5SW5TSUNYZUcvS3doUnZJaWtIWW5yY3IwNjRI?=
 =?utf-8?B?OHhHVnI2VmI2UDF0dlZhWWZoejUrUkZuM3AxdnhyZzlwTXhJbXZ3RWdZWWw1?=
 =?utf-8?B?UXZnL2tMRFJTNVh6ZlhkN1VtZDJ4NE1KTVBtWFN0UEpKM1czUS9McjlxYnV4?=
 =?utf-8?B?aGhidXN2TUpBc2FFZUJ5YmZUc2RCakpUbmtOeHNmM1ZOeEpPUlZSL3lRMDVr?=
 =?utf-8?B?RWlLZHo1NUtQdzJndmg2b3g4L2gzSXJpRGRsQXhxTk8rdUN3YkVLRzNuL0s4?=
 =?utf-8?B?VFQ0L3d5Wm5FemhvaXBOZm9mWHJjUmI2ZEhnTzBzNUFMcEdDNWorQVBHSHYz?=
 =?utf-8?B?YU9YWUxidUNmVzIvcGhYVHQ5UFVMZXEvWEQ4MStJbmtFYkM0bU1ZMjFINkYv?=
 =?utf-8?B?Q2VSdDZrNVQzWnVpZ0phN1VuVWxkQWhCenFKd01pb2gvU1F3SnA2UmVOT1dS?=
 =?utf-8?B?MU5lNnpWS0JkZWxoTEJnOUExQVM5UDJRNC8rL3JlV3FWcFJDOFFsMHRBdWpE?=
 =?utf-8?B?OFl2SktORUZRekVpVDlsbUFabkx0dkQ3bWtvZkh0bzlJYllzZWtoZVM4UEtt?=
 =?utf-8?B?OG51VUdnQ2plb3B6UENoTm5GbDNYZWljdFFKQzRoTzkyT3crZnVFWUMzdC9P?=
 =?utf-8?B?UzZ1ZVVPeCtQenBBM2NCQjJmWG1jK3dyL1VwcXhzdk9nbEp6cG42eGZKUUMv?=
 =?utf-8?B?MVhzb2NSTy9CTWs3ampzbXlmU2dXNGJJZ3ljYTJtbXZQYkRSVzFKU3J3NENG?=
 =?utf-8?B?cHc5bWJFaGtRTGtEYXpkTDVJSzhUZTJFVFRwYkI5VVBmVlcrRTYyWkZSQzV5?=
 =?utf-8?B?R2wwTVlHdjAvQ0pzQWxEK2gyK3pYaU9sZDBkYlJnc1FFYlZWMzhVRUV3UDBJ?=
 =?utf-8?B?RC9LTU5tYmhyU0ZNN0RPVldtbVBoLzB5M3E3YjUrTTJiU3o5L0ZSRFo4M0xD?=
 =?utf-8?B?OU1uWFpnZUU0QXN1Y3FTWWlaODBweFdoaFhzTHFTbmYzbytTVmU0ZDhaRnly?=
 =?utf-8?B?SVRnTHk2ZU84b2pERXVsWFRrUHpuN2hnNWw0bk5pckZRbERWSXcyRS9ETHZD?=
 =?utf-8?B?THI3b2hWczBsY0tUblhZbjBGMGRIbmpzMk1VNnVJT3FhMkJ4ZFRZamR6alBz?=
 =?utf-8?B?VWdRQ0krd1llZU1XTElCYWJ4M2F3bzZiM2dFK2wvemo0QnVFcXJFM1VjSlY5?=
 =?utf-8?B?bEg5b1g5K1JBQ0VYWE9xSXE4bStpU0R4Qi9NdjBiOTE4TVdZZ3ZRaTFhY2lB?=
 =?utf-8?B?UC9aNmpxNWxkdkRpZ05NSWh1d20wR045eVlNcnhjSHRZeUFpRnNLRFBOU1o1?=
 =?utf-8?B?bjZ3VVZFODJQOUFGa2VDS21LVVF2WDVOcXord0RaeE9rMW5WNXNncHRlUG81?=
 =?utf-8?B?ZldvTVd5eGx2ajc1ak1ndmVIbEUza04vU2NuVEk0MWN0TlNyZjVRTkRBbTRi?=
 =?utf-8?B?THN2cTBuNW01dm4rZE5VejYrc0FOSURramdKbjdCWjNrL0RJSkd1d1c5d0ZJ?=
 =?utf-8?B?c0RlNEwzWmhaemplbmtPeXkyZGhOd1FrKzJleXdoeGdFbWZXbFBZeTVIS0hR?=
 =?utf-8?B?WGNVNWhndkthRHhuZkd5QnUwSEZUMEthVURUaDBlQWkvU1pjZUVCQVNROENH?=
 =?utf-8?B?KzhUb3cvL2xvZXdOZFZ6cmZHODZoUE1XOEVNVTRJUktiL0dxZHI2bk5LRkVF?=
 =?utf-8?B?dWxRU3BHYlNGU3lGWkFVcFFJQ20yRDhmUERRTVdCU0pkS3ZKTEFWSjZwcVRw?=
 =?utf-8?B?TFFVNGdoRlVDMFdCajVhZnZjYllwc05TVDF2UCtUblZiUEk1VWY1b3A1WWVi?=
 =?utf-8?B?UktrWmp0Y1lBaE1EMCtZVVc4MEtlaWpTVGlkdlI0dHd6MW9OaXhSdEFXdWV3?=
 =?utf-8?B?dUM2dnpCQXFjaDRjOGNDWkVaOEYwMUJmU2FKWXh0RFBvTC85VzRkbzlSc1E4?=
 =?utf-8?B?R0Rpam93bVdFL2ptV0p1RStSOHF1YTdKQ0pQVEphRW5mOXpGMmpqVkVIYnov?=
 =?utf-8?B?cVVNVGppdlhvZWF1bkJvTGhZMUFDMENzTm1NcGlUNW9RbXMxMEtDRkx0RkhD?=
 =?utf-8?B?Y1VzWFZSdTF4WGFVc1d3NGFBTkJJdWlmbmlmcVlUTkIzMUk3b2ZCMHdDampN?=
 =?utf-8?B?YmsxOUJmSk1EWVVSaU5iVmJQalJBMG5CcTk4M1lDdTlxbm1MZ0Qzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ae6335-1526-44e4-7bff-08de5b42a4f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2026 12:18:12.6355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KE8euKPf/b3pWHRfzlZSAujd7WK7oa12JDkS+NAzN/EAHE/sSSlVWrZkavDPuK9CSfBLWKmjKuBc/tLCAjtjcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8520
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 12:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229919

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFNhdHVyZGF5LCBKYW51YXJ5IDI0LCAyMDI2
IDExOjMwDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtv
QHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3NjYXJ0aGdhcF1bUkZDIFBBVENIIDAvMV0g
b3BlbnNzbDogdXBncmFkZSAzLjIuNiAtPg0KPiAzLjUuNA0KPiA+IA0KPiA+IAlJJ3ZlIHN0YXJ0
ZWQgdGhlIGJ1aWxkIDoNCj4gPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcv
dmFsa3lyaWUvPyMvYnVpbGRlcnMvMjkvYnVpbGRzLzMxMTgNCj4gPiANCj4gDQo+IGEtZnVsbCBi
dWlsZCB3YXMgc3VjY2Vzc2Z1bDoNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLz8jL2J1aWxkZXJzLzI5L2J1aWxkcy8zMTE4DQo+IA0KDQpUaGFua3MgYSBs
b3QgZm9yIHJ1bm5pbmcgdGhlIGJ1aWxkLg0KDQpQZXRlcg0K

