Return-Path: <thune.a.tran@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7C4C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 19:21:59 +0000 (UTC)
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net [130.76.144.163])
 by mx.groups.io with SMTP id smtpd.web11.23181.1745263310892105429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 12:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=j8hgUWhu;
 dkim=pass header.i=@boeing.onmicrosoft.com header.s=selector1-boeing-onmicrosoft-com header.b=BumdGXuO;
 spf=pass (domain: boeing.com, ip: 130.76.144.163, mailfrom: thune.a.tran@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 53LJLmSB031711;
	Mon, 21 Apr 2025 15:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1745263309;
	bh=epl1r/0n9+mGFVc5TnKMtXzuss/HM98L8izDp6AkLIk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j8hgUWhuf4Uh/A5w9QDzEGhzp5R18yzCz9ZR7Xe7h4DAfxTaxfpwi04ozMPjgFlat
	 YJi9RiWBDDN6yLVcLJKUDvjdE1e5C9kj9FO3sMmW3uIJbzAekrursPeXaH8T24fcq9
	 t/QlCaMhR6pzdnBc/TQeycRVb2oFTZNEmDxZlsra/nD5qfnfmIJP0w5k2jrxSp1WrS
	 hg/EZhpVRV+My3z5GFSKarUv26v3UDP/eywnisjHAnhGHNu68+bIett9McCYLEtmjI
	 IKH8wlnRLh3NZCowEYjmrpsJnyFslhyAUUZZMAsiM03toRRilYJ4UvPrN84e98xGv0
	 g9IIbAv9QRkkg==
Received: from XCH16-06-11.nos.boeing.com (xch16-06-11.nos.boeing.com [144.115.66.107])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 53LJLfdj031600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 21 Apr 2025 15:21:41 -0400
Received: from XCH16-09-10.nos.boeing.com (144.115.66.159) by
 XCH16-06-11.nos.boeing.com (144.115.66.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 12:21:40 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-09-10.nos.boeing.com (144.115.66.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Mon, 21 Apr 2025 12:21:40 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.179)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 21 Apr
 2025 12:21:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=SOsZofmUrx73iKLX1ithnRylUzlwxQLrzIEdfaqvUSqsP6vUbCXqtSx1VjAryBCuElNANUb9EMAZKoUlXHL9ru+gBc5grl8IOHgom9iMB7Qkn/CxKempOYLCWQMzt8ubrhyKoQgpBtKrwqGMtXkw2CvYMvO7bQWPFeGLpQlGhePK96Kj5TewAhF0zcPL8QEDv0wDjJXSRERFdzLyLsL+j/Zl7fFbf3DRZ4X9PTQNi9aUZLhfjPJ0Ujckf2FbTu2P7e1eSWkruuRUNvDriXCG5uGqD3iJLOvMgqmuK3B7aAnq5nPNOJlFWeFV1sdCqji6OFGFuRyBwPKKZ3HQW/hMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epl1r/0n9+mGFVc5TnKMtXzuss/HM98L8izDp6AkLIk=;
 b=AVm2Hg8LCfTSHDwDvEgxpb1+nyDiQRXngzXV+wVSucX+fMAStD7qbVopGucK1FiX7RTf4MokkYNu4d7+pbYuDtuYi1lOLUs3/faN9QqHwvsLOmF+dJa0qlY8Mpp45L6WqKnl8hLhQ7/m382qb+T4lLAUW2wfKYQsMuyxj++OF/OzDqi170lIK6hi+tElycyQT81+tzjJk7gaJfDuzgdpDTmUe7SdI2OjCOiyTlkAEA/w4Ukk4Tp58+0FiM2S4StlIb4i6HOT+zlBEsNcUn+oXmJwwlbhqaMxO2iDN8GBSMVSHYsG4nHz9TDP5tcKByu0Eg9Dga/Y+SetgABC/9C5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epl1r/0n9+mGFVc5TnKMtXzuss/HM98L8izDp6AkLIk=;
 b=BumdGXuOISJsjZk9yxoa1cbZo3ptSq5xRFYppykfAY6ZmfYWPQk2Jk+YvveDrIa4xR2qSYSTxY/KUxT1eQw33k7RJ++JjSSPibg38vpqcTDqLzKHZEvN9p93asRcA7BVvmjA4WPihO8Cz2koFp+v1PJLHC46jqMsegy/h/k6xeY=
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:166::5)
 by BN2P110MB1140.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:169::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Mon, 21 Apr
 2025 19:21:13 +0000
Received: from SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f]) by SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
 ([fe80::458e:59d0:1c4f:a9f%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 19:21:13 +0000
From: "Tran (US), Thune A" <thune.a.tran@boeing.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Chuck Wolber
	<chuckwolber@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Wolber (US), Chuck"
	<chuck.wolber@boeing.com>
Subject: RE: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
Thread-Topic: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
Thread-Index: AQHbr7D/LgpJJ+T7Qka5LApl2D8i8bOug2zw
Date: Mon, 21 Apr 2025 19:21:13 +0000
Message-ID: <SA1P110MB225095BC4A08303EC935A987B7B8A@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
		 <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
		 <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
	 <1264db75faf2ae16362f1f05ea2b6b77e0fb7616.camel@linuxfoundation.org>
	 <SA1P110MB22506DADB11B27B51A1CC536B7BCA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
 <34381df1e0f5da0ba1e4512afc83fc1a99e9e54e.camel@linuxfoundation.org>
 <18372610739395C0.11203@lists.openembedded.org>
In-Reply-To: <18372610739395C0.11203@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2250:EE_|BN2P110MB1140:EE_
x-ms-office365-filtering-correlation-id: 5dc284f0-d079-4431-edb7-08dd8109ae46
x-ld-processed: bcf48bba-4d6f-4dee-a0d2-7df59cc36629,ExtAddr
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TnRUYXlOQlA1M2ZUanJzaURYNjlxWVRtblNNTDVONC9CQnJHeVRQSlIzbCsz?=
 =?utf-8?B?U3ZoRUd6VitVQ21ucVAzSmltUWVieTY0RnhidEFRSmRFbGdhNE1HQlBpWmRX?=
 =?utf-8?B?UkM0czB1Q3RFZHZuOE5ZdU4zVkNjYjJRczAvUW9WdmxkK0dJU3p2QWhNRzkx?=
 =?utf-8?B?Z1NYUS9GQ3VXamY2b2E5eXB3K1g3MDZXdjNCb055Q29KSUlYekl2YkhnTGJW?=
 =?utf-8?B?Zm04bitHbmhjRnFHVW5vaFVIQnlRaDJGdEZ6cjdWMHltdDkwMlorQXpaNnNW?=
 =?utf-8?B?anAwZ1EwUW55c2diMGoxejhadkdGUHdoeDVzOEZMQ0ExSmVub3FBcVdpZXh1?=
 =?utf-8?B?OXhRcUF5aFRkcTJKU2ZjVW1tYSs5b2xzZjBmSldRdHdQWVlZUFJiYlJwVURG?=
 =?utf-8?B?STBBdTRGd1pzVjBUU2t0RGprVnNTNjN6MmRReGlySW55Ulo0WG1iYVZpL0h3?=
 =?utf-8?B?SXJVZnBIaXVjWVVkYmUrcWtMWVlkblZoR0UwNlB4QWhmcjN1cVc5bnYxNUQ1?=
 =?utf-8?B?akZQZDgvTTVKalFkOUVEV1FyUlVRelJPOWovbkhwVTdMemdLZ3FKZXhUTEh1?=
 =?utf-8?B?dmh4dWZ1NEthektrT2VkSEpTaDgrNE5RdUE1cUxsTUdwQlBuVTJFcFl6NDFy?=
 =?utf-8?B?Z3YwM05DdXFnQ0pVNEl2NTZYVURMZ1MrdHJEYWxRQmRtalVLZmZvZWZaTWFS?=
 =?utf-8?B?YllXcXg2MXZyK3MwOWV4bjY0U084RzVGZm9yUVZHQXppaHZ4K1NjU1JOMDhG?=
 =?utf-8?B?Ymp5VE1ISHZXZm5IV05xS2MvSFJ4VVJpNUZjb3drTmxWOGVOdTNVOEcxbXVl?=
 =?utf-8?B?ZGdlTlpQcmNzV1dJUUxEcGxiV24xWWw0Yk1haTF2Rnd6Rlg5bTRaMldSSmlw?=
 =?utf-8?B?TE84VHRnL3EzbmM4TU9MMGFueW1ad0tFaWh4Sko3dmZ2WUF4VExieURoREc5?=
 =?utf-8?B?dTgxN1NhRjhsNHNjL1lCdHVYN1dLWFE0Nnc5Y2ZoRmloajZlM2toRUF3amNK?=
 =?utf-8?B?ZjE1aE1veWtMQkpQSXFNZERYUG5hNmJyV2ZFTlN2RXVobFNUTFRTTXArNzdU?=
 =?utf-8?B?Zzc3enkzRG9jVFJvc2FPUC9nVkFlY01tM0FSMG4zYTVKais1SGFPcDRaZFVB?=
 =?utf-8?B?bmJJUGNPMWVHNS82MWNLbGFyQnplallDRWV5WG96UUR3MThZaGdEOHFBWGEr?=
 =?utf-8?B?enhpKytRYWpoVHZRdGZybUxDN2dXekRjejJXUElnK3JNcXpZRjE5SlViUmVZ?=
 =?utf-8?B?V1dvQU1wOFcvL0JlN0R4dHZldWJKejgyLzVpcGFIRnZvZ044NXMxY1F5MThi?=
 =?utf-8?B?cDczZmlqUStrRTBrYXhwK0swNUI4QTFVajdaVDQ1MWlxa3hUNEtKNllQbTBF?=
 =?utf-8?B?VndTK0VuaGw1UFFKclpBbFhtUHZDTDdPZXJDVTZaUnUrZmhsa1lDaGUyYytU?=
 =?utf-8?B?MkZDejhkNDdKeWFJWFNGTG1hODZRbkJJVGdrS05LZHNjZ0dTOWhaaUxxamsy?=
 =?utf-8?B?TVUrTlF3NDVVZHNSTGJPWnd6RitlTUl5ME50a1N6clRTb0dQVHpQRklUVHVL?=
 =?utf-8?B?SFNWNiszcGVDNlB2TTZwTFUrcjVob2lxOUpFRmt5YU1zdFM4QU1iaWJuaFo1?=
 =?utf-8?B?aURoazZCcTJ3bnVjY2I4ZlBlZ29CWGJtZG1JVklRTVFxbHVvcmsxQVQvNXRQ?=
 =?utf-8?B?cmR3ZXcwdTJ6TWFRZnppVjZsbC93cTc3bEtJQ1JSVldaUzRkWTRzY014U1dr?=
 =?utf-8?B?eWVWT0dTS0lzTDZzd2draS92VGZydFU3N2VMOWd5aTVPRmNubVRpeGdSbEpo?=
 =?utf-8?B?aFZoOG9UWjZPTTNKVU1zVk51b3B2UGlkNE9MVlpLRlNTQzFpMktOOUJKTVZB?=
 =?utf-8?B?Ymd6c25wdGtmVk03NjdaNWlEVU1ONGhEZkdrQW8zUTVVSG9VMklBUVgxdit2?=
 =?utf-8?Q?L4goKHQ+WtU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V05jcGxjUWxXNng2VDJvcUMreWpjRkl2U2dzTVZLTUR3cWZJcmFtN1ZhLzRn?=
 =?utf-8?B?K3hlblRmcytYQ2NqQ01PVXFRQ2FPSEQrRmlqamJSakVMUXRHOXFiWGtEaWR2?=
 =?utf-8?B?WURCYVRVTE9GL1Z1U2VTYUFsclMyeFdkL1Fqajl3YW02Q1ZmMEdRYVFKU1o1?=
 =?utf-8?B?VHJ5blA1VElobjRENFZuS25xVkQ2VzhXUnVDYXNIWWxRcktDZTZVNGtXczVB?=
 =?utf-8?B?Q2Nrbm1vMk0rM1VDaExKbzdtNXRuLzNvaTY2VlJFU1VxRFBZNlZNRTRmN3ht?=
 =?utf-8?B?YnlmSVZWLzdTMjVyZlFyOFEwYk1reElxWnArNWpHMW4rbG14NGR1YTMwOTNn?=
 =?utf-8?B?MGZ4SHQ1Mm8zS3BGMXptRHZRQkdaSitSb1c3SEY3Z3YvWDBPbTRNQ1hBM3I2?=
 =?utf-8?B?N2Q5SWk2NDNDZzRUVW5CNm5ra0NJL2pudzhkS1pDMHp6MENISkNpZEM1TWtt?=
 =?utf-8?B?RnIyUmQ0YWZNT2pVVEQ0dnRKbmRHSHlPRDNBUWxabkNBMmV5SVJsblVPRE82?=
 =?utf-8?B?Qit5Q0hzMDVUcTdlQ1VKM0g3RnErNkRLaGh4c1BtVWZheDJhTUNSM09DTmxP?=
 =?utf-8?B?T0ZoUmNDcDBUUEpHNGJVQ1UvdzV6MFB5anRyZ2d6eVBhUjdqc1N0TVFUbzRI?=
 =?utf-8?B?Ym5YNzh0ZDlwc29udElzRUpVenhtbEZtU2Z6c05xd2RlZUxLQVhsV3pBaGlL?=
 =?utf-8?B?Zll4RXpZdVowVGVFamxTcEQ4bU9VcVVIdmQrQ3Q0S2VHRy9YTWRIaGdBQUtp?=
 =?utf-8?B?WmpCeDd6dlcrQXVFd2c4OHBrU25JSzU4V1dzanQ0TXYxRHMrVXJQV1Z6WlhV?=
 =?utf-8?B?SENiYVlBekRkcWJCSmJSdTZ0dENuQ2xIT0E1WCtQYWFVbTZXZTR5NEtjaDhv?=
 =?utf-8?B?VERXWVRPcnNNdmM4V0JhOE1maDlDYW5vbXZ5T3VqNjJBUmh6RnpTVVVOWExK?=
 =?utf-8?B?TjhzTHEwMC9MZkVhMWJ1VVBoWGhXTWZFMVN5V3BWbWFsS3NKVmVFZm16V0xT?=
 =?utf-8?B?bkd5bXFoODI4YVFtc0ZVYXh5ZGh1TytSeDJRQVdiajNqRGhicm5HQlA0djVy?=
 =?utf-8?B?NmgwY21wVCtTL0Eva2U0dHNHSnlhRGpkTG0wcHRwMGlUR3FyZVVRQjdmTldx?=
 =?utf-8?B?UU1xdDloSFdNa1JSTnZMeitSRnB3c3RWZUhFQVA3TDVseEd0c0hlKzk3ODUz?=
 =?utf-8?B?OHFiZ1p4Z3crd0IwaHJFcmRzd09RbW1lUy9uTlJwb1JyWWszSzl5VXJFWE5N?=
 =?utf-8?B?SDhwUWtzZDhzS1NLZGtna1E1cm5JeHdIaHMrWXJJcHFaTTFGRkxkVmsyWTVC?=
 =?utf-8?B?TzJzQytPSUZleU1pTS9WOGNRbXk4dDk4T2trZmxiZDlibkhKS1JJTjZMMUtX?=
 =?utf-8?B?WEZDdzNOM3dQQ2JiaFowUENvbjJwN0U1WHg0R09vT3MxaWN5aXYrb2o0bTJy?=
 =?utf-8?B?TFZ6YXExK0RVL3JLWVhEUHNOZmVlU2lIZU9CcEF6KzJqQkdkWFNRUWhTQnJE?=
 =?utf-8?B?NHIrVU9FbUJhcC9Jd2czVHQ1Mk5vSHRpSlcxNGVQWS9URy9Gd1c5TDhnaUNl?=
 =?utf-8?B?OWZVcG5OcWZrRVVDbDNKR0JtdU4wdEhrY2I1eTlmNFlxc1FJZXMvRnN3SExt?=
 =?utf-8?B?OS9ITVU1R1p5YnpDQ292bEJxQlJ6UHpTQ2IyRnFTMjA1STZ3ZnZUMnMxcVB4?=
 =?utf-8?B?cU1ZUHJKcVhBanhMUWhSTVNoKyt2ZjVsNWxxZ2IrVG1kN3pMblVTa1ZkZ0xM?=
 =?utf-8?B?WVBnTHEyUHJULzh1TmZCMnl0SmNtZTNlTkxIRTd2alF3clFZUEVGZkZsNjBQ?=
 =?utf-8?B?a2UyUHdOaTZQNTFCM2RaR3Z4alBmMmY3M0QxMHZtbkUwT1c3Nml1WDhDT2RD?=
 =?utf-8?B?bnNmQlQxVFhpUlIxcHE4M1duV1lHVnkvNW84YzNQcWZ3Vkcva3h4cWtoYTBv?=
 =?utf-8?B?SmV5UDgwWFpycmNYd0ovUGszZCtsdXRUMFBjaHNSMUVKMGJpT3doWE00TEFx?=
 =?utf-8?B?VVZpQkh5bU04TDdSZWJkamFPQkJVQUl5RXh4VjdIMWJIbC9XZGcrclhIbDh0?=
 =?utf-8?Q?Y6Z8iO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc284f0-d079-4431-edb7-08dd8109ae46
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 19:21:13.4821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1140
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 19:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215182

Pj4gT24gVGh1LCAyMDI1LTA0LTE3IGF0IDEyOjU0ICswMDAwLCBUaHVuZSBUcmFuIHZpYSANCj4+
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4+IHdyb3RlOg0KPj4+PiBPbiBXZWQsIDIwMjUtMDQt
MTYgYXQgMjE6MzkgLTA3MDAsIENodWNrIFdvbGJlciB3cm90ZToNCj4+Pj4+IE9uIFdlZCwgQXBy
IDE2LCAyMDI1IGF0IDM6MDfigK9QTSBSaWNoYXJkIFB1cmRpZSB2aWEgDQo+Pj4+PiBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIA0KPj4+Pj4gPHJpY2hhcmQucHVyZGllPWxpbnV4Zm91bmRhdGlvbi5v
cmdAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+ICU8IFNOSVAg
JDwNCj4+Pj4+PiANCj4+Pj4+PiBJIHN1c3BlY3QgdGhpcyBjYXVzZXMgc29tZSByZWdyZXNzaW9u
cyBpbiBvdXIgYXV0b21hdGVkIHRlc3RpbmcNCj4+Pj4+PiB1bmZvcnR1bmF0ZWx5Og0KPj4+Pj4+
IA0KPj4+Pj4+IGJ1aWxkdG9vbHM6DQo+Pj4+Pj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNDMvYnVpbA0KPj4+Pj4+IGRzLzENCj4+Pj4+
PiAzOTYNCj4+Pj4+PiANCj4+Pj4+PiBtZXRhLW1pbmd3Og0KPj4+Pj4+IGh0dHBzOi8vYXV0b2J1
aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzcvYnVpbGQNCj4+Pj4+
PiBzLzE0DQo+Pj4+Pj4gMzANCj4+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBXb3VsZCBp
dCBtYWtlIG1vcmUgc2Vuc2UgdG8gYWRkDQo+Pj4+PiBzZWxmLmNvbnRleHRfZXhlY3V0b3JfY2xh
c3MuZGVmYXVsdF9jYXNlcw0KPj4+Pj4gdG8gdGhlIGxpc3Qgb2YgcGF0aHMgcmV0dXJuZWQgYnkg
Z2V0X3Nka19wYXRocz8NCj4+Pj4gDQo+Pj4+IG1ldGEvcmVjaXBlcy1jb3JlL21ldGEvYnVpbGR0
b29scy10YXJiYWxsLmJiIGRvZXM6DQo+Pj4+IA0KPj4+PiDCoMKgwqAgY2FzZXNfcGF0aCA9DQo+
Pj4+IG9zLnBhdGguam9pbihvcy5wYXRoLmFic3BhdGgob3MucGF0aC5kaXJuYW1lKG9lcWEuc2Rr
LnRlc3RzZGsuX19maWwNCj4+Pj4gZQ0KPj4+PiBfXykpLA0KPj4+PiBkLmdldFZhcigiVEVTVFNE
S19DQVNFUyIpKQ0KPj4+PiDCoMKgwqAgdGVzdHNkay5jb250ZXh0X2V4ZWN1dG9yX2NsYXNzLmRl
ZmF1bHRfY2FzZXMgPSBjYXNlc19wYXRoIG1pbmd3IA0KPj4+PiBkb2VzIHRoaW5ncyBpbiBhIGRp
ZmZlcmVudCBwbGFjZSwgc2V0dGluZzoNCj4+Pj4gDQo+Pj4+IMKgwqDCoCBkZWZhdWx0X2Nhc2Vz
ID0NCj4+Pj4gW29zLnBhdGguam9pbihvcy5wYXRoLmFic3BhdGgob3MucGF0aC5kaXJuYW1lKF9f
ZmlsZV9fKSksDQo+Pj4+ICdjYXNlcycpXQ0KPj4+PiANCj4+Pj4gaW4gbWV0YS1taW5ndy9saWIv
b2VxYS9zZGttaW5ndy9jb250ZXgucHkNCj4+Pj4gDQo+Pj4+IEkgdGhpbmsgd2UgbmVlZCB0byBh
ZGQgc29tZXRoaW5nIHdoaWNoIHJlcHJlc2VudHMgdGhlIG5hbWUgb2YgdGhlIA0KPj4+PiBkaXJl
Y3RvcnkgZm9yIGNhc2VzLCBpLmUuICJzZGsiLCAic2RrbWluZyIsICJzZGsvYnVpbGR0b29scy1j
YXNlcyINCj4+Pj4gYW5kIHRoZW4gYWxsb3cgdGhpcyB0byBiZSBwYXNzZWQgaW50byB5b3VyIGZ1
bmN0aW9uIHNvIHJlZ2FyZGxlc3MsIA0KPj4+PiBpdCBhbGxvd3MgY3VzdG9taXNhdGlvbiB3aXRo
aW4gYSBsYXllci4NCj4+PiBXZSBjYW4gbWF0Y2ggdGhlIHRlc3QgZGlyZWN0b3J5IHBhdHRlcm4g
KHNkaywgc2RrbWluZywNCj4+PiBzZGsvYnVpbGR0b29scy1jYXNlcykgZm91bmQgaW4gZGVmYXVs
dF9jYXNlcy4gVGhlIHRlc3QgZGlzY292ZXJ5IA0KPj4+IHdpbGwgdGhlbiBiZSBiYXNlZCBvbiB0
aGUgbWF0Y2hlZCBwYXR0ZXJuLg0KPj4+IA0KPj4gDQo+PiBXZSBjb3VsZCBkbyB0aGF0IGJ1dCBp
biB0aGlzIGNhc2UgSSB0aGluayBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gDQo+PiBpbXByb3ZlIHRo
ZSBjb2RlIGFuZCBtYWtlIGl0IGEgYml0IGNsZWFuZXIgaWYgd2UgY2FuLCBldmVuIGlmIHRoYXQg
aXMgDQo+PiBhIGxpdHRsZSBtb3JlIGludmFzaXZlLg0KPj4gDQo+PiBUaGlzIGFyZWEgb2YgdGhl
IGNvZGUgY291bGQgZG8gd2l0aCBzaW1wbGlmaWNhdGlvbi9jbGVhbnVwLi4uDQo+IA0KPiBNYWtl
cyBzZW5zZS4gV2UnbGwgbG9vayBpbnRvIGhvdyB0aGUgY29kZSBjYW4gYmUgaW1wcm92ZWQgYXMg
d2UgDQo+IGNvbnRpbnVlIHRvIHdvcmsgaW4gYW5kIGJlY29tZSBtb3JlIGZhbWlsaWFyIHdpdGgg
dGhpcyBhcmVhIG9mIHRoZSBjb2RlLg0KDQpMb29rZWQgaW50byBpdCBhbmQgZm91bmQgc29tZSBw
bGFjZXMgdG8gaW1wcm92ZSBvbiwgc28gcGxhbm5pbmcgYSAgUEFUQ0h2MiBvZXFhL3NkayB0byBz
aW1wbGlmeSB0aGUgd2F5IHRlc3RzIGFyZSBzcGVjaWZpZWQgZm9yIHRoZSBTREsgY29uZmlndXJh
dGlvbnMuDQo+PiBDaGVlcnMsDQo+PiANCj4+IFJpY2hhcmQNCj4NCg0KDQo=

