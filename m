Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9E3C7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:36:49 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web11.3733.1685673401761521871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=asObpksk;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1685673402; x=1717209402;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=dYjBFKJ605Z3TcDN9JkWMIA9cyWYtcKRUlQHWdyB9CQ=;
  b=asObpkskJyaI427k9aYor6soIOG3C5M64gDBcoceWSJVSfF1rzfTSsaW
   Okd6bNKjX0gi6GCk9PRS/Aru5LZUxrgRi0/rD8G1nPworhyXYI2yBDTzK
   wej5euaLLxjqGGeE+Yb1P1FPBQ+m00weBcDQRk6vSc2A/Mlg2FDMO+lNW
   m6Pkgt+EPke78Y5zSwJ76OfVtJn07GfAlXjfg/4uokLFIhaBwN2Yd86mX
   WvLIN8PPj0S4tKafYP1IgiAkmQFnIOubFo2Go6iFFiHhJOSCB3VJw859T
   9iu7n/srI5SsjtE838eeg5mA8j2jZzoecsJePWxOH7Wz2OCWr2HPzJg3N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="85975796"
X-IronPort-AV: E=Sophos;i="6.00,211,1681138800"; 
   d="scan'208";a="85975796"
Received: from mail-tycjpn01lp2177.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.177])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 11:36:39 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/2H01CDBXedDHKtjVAcasSy8+s0DRuP+x/PAZ+nuumBFoo316458QDKcw1jYX5SesepupKQmEOVUEdnHKDeHuxoAp8QJZOaV6ybt0OoI64KY+07kTj1YP8cnS4aOzjCm71LciANgOCbkaQVGJEIlRYptFhhPr/5C2Mw9YqbILju7adtGcUzYqmDaJkvujGYNu0MRCiKwnbtMvKGK97WK5u3eOZ7gHBr/lNh+NX4PAHlLl/KCN4Cal/mIH4lBVPWHQZsELJh4yWguN0s9WEcYPjQeAZxj10E0H57fodKc9QRpyzVCae3PkGCvikZPmhOq8eRunWfKfHITM9J+f6x9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYjBFKJ605Z3TcDN9JkWMIA9cyWYtcKRUlQHWdyB9CQ=;
 b=fVxFlwmVeb9deCqAJKMzM41Va19B6OqMZflkuRdcuT3Weh+9pt/REZq3LNzfn6HNpIISFGO4tR6HM2gNhyQo5JeP1sCm8eYcQEYBaOBRMWSGXuG0anfaHrS2ErQycbLW8uCLvAJS1MVvo+d3N3hUWbTXtSYwZCQm/IxZOLj0hX+wivAleVjk4y5nvBn3ndEhWCOk1SHQEnntkRCLItEwJiAu7K8JiG2u5l6XUJ4zNJadM115moj5U9yLO1JYqOXapwNZJUFBkc+PAx4plKkRmYs/+22CQ6VtxR7C+hRTkZtxgOa+c3yKFzoBy+0wgxfGKVcdHROxe8fTFnV3SHToKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TY3PR01MB11101.jpnprd01.prod.outlook.com (2603:1096:400:3d5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 02:36:35 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::f53:b8cf:2bf5:39ad]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::f53:b8cf:2bf5:39ad%7]) with mapi id 15.20.6433.025; Fri, 2 Jun 2023
 02:36:35 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Is aarch64_be under maintenance?
Thread-Topic: [OE-core] Is aarch64_be under maintenance?
Thread-Index: AdmUVJ7Lf/hFeIQFSMaBIHGjw7h/EgAA3joAACiRHyA=
Date: Fri, 2 Jun 2023 02:36:35 +0000
Message-ID: 
 <OS0PR01MB6178318FC4E138CE82A7D60FA04EA@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
 <fcf04863048c9e529df03a0bc034a8f86e468865.camel@linuxfoundation.org>
In-Reply-To: 
 <fcf04863048c9e529df03a0bc034a8f86e468865.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9Nzk1MWYxOTEtMDZiYS00MzJmLTgwZGItODljM2RmZTgy?=
 =?utf-8?B?ZDg1O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wNi0wMlQwMjozMTozOVo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TY3PR01MB11101:EE_
x-ms-office365-filtering-correlation-id: 8d0c95ce-68bf-4f59-53b5-08db63122f41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tQdOSmTtURAqiWzvn/yRpLzToK69cbEFrzWx8cWHDMdxOKUIJD5B4jR4Sb2GQzxXgCpjaAFFZP6KXKkQbhiPXfo+I50jQnilWhaKASEf26+xBhdwneqL2uAIJDK5O07KYevlDdiOWOTLwsHvQNd2E2CcBHkJdDifavH+PpgasGOPPwS/fSqfHR+4oAYBYnac5aP5xUo9MD8z0LiNXLKfYZV67PDu7Bkadh4av8VwRSF/Qcj5Rw2IVA0w2cFL2ZAx9EiuHNOu9bsqJkOVOtlyFlJDzuLqZfnQ4ked2N9Mi2x+Go/QQ3+TuXpWg0Wq+N0YG8mBif0PsoekRr2ypg88TIQDki7Lleosbnu3DU5dpTSDHZxDBxFu02KmTLKmkLUi3LTcL60FzLfZEoK+5BDOHkoDzSwnBjj3GITp2Vcw2eixqiVwFaXYrKnsQAFVn7rRzLLh0WdSqCzJSz+xp4RWRKD/chK0zdlwDl1cc+PI4O10mJ+nIKfE7yVlZRNUFzahprlScPIFxTOo1ViT+YwBjXGN4IvlOACVHDTLzo8UprmccUjCiOoT5g0AC28xb0paIx5QXr0mmtB+Ix/dFD6o9UzfclKk5YoFMM+zHYMYDgxkaVi42oBzakQXuFqyvXbX0kXDirTc6Tzex7E3oaEBSg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(1590799018)(451199021)(82960400001)(122000001)(38100700002)(1580799015)(2906002)(7696005)(86362001)(110136005)(38070700005)(478600001)(76116006)(66476007)(66446008)(66556008)(64756008)(66946007)(55016003)(85182001)(33656002)(71200400001)(186003)(9686003)(6506007)(53546011)(26005)(52536014)(8676002)(8936002)(5660300002)(41300700001)(316002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZDk5czMyZ0paaVpsQnVZV3pNWVNlTFlFSUtTRjZ5Qy9qMU53SFlTdDJMSm1p?=
 =?utf-8?B?ZHM4bDBUajcvRWxUN0FvZHU2ZlNyYWhCQjlJci9GN0Zwb3A1STFUZldlUktJ?=
 =?utf-8?B?TWxxOTd2RnBMQW1IdTl6REttSUwzT21BZlRnVzFuR2lqSjZIQk5HMktoVS9J?=
 =?utf-8?B?WWwyUGIxQkNwVGtPaE1hamtmVk4vYXBMaU1hWll5dUVyS080c3dBZ0c1c0xS?=
 =?utf-8?B?WVFLRlFHclNzWE16SlhkVXQvMVFjaFVtKzZMZTR4SmlXcFdvUXBTNERjZUJO?=
 =?utf-8?B?YkoweUJmbjJMZ2tNNnZ3TDhUSUs1SUxrVVFWWHhiMlgvM0tyM1VPSjUraGhN?=
 =?utf-8?B?NjIrUFQ1TEpySkRlTzlQMXdoUWx3dUZ5Qk12T1RhdEJuOGNSVmxHU2lqczJH?=
 =?utf-8?B?Vm5PclFTQ1NlRzN2T3l4b2p5TzVJSDlraDRrUnJVYUdPdkV4aG1WMlNBaGdK?=
 =?utf-8?B?VGNJdnNvUmYxSTdQcGdQVDFkSmgwTUlhSnV2VCtHajZNM0pRQlREVU1GLy9l?=
 =?utf-8?B?VHAyU2xLaDBFNmgyNUZoZU9iZjMyL09pVnNJUzFVOUxhRDNXekw5T0VlR2Yy?=
 =?utf-8?B?WFFQZHZkMEp4cDhqVld5cUM3VFFYdkVWaW44MFAyUlJ1T1hjMlB2b2thMCtD?=
 =?utf-8?B?ckRkc1FjL2VhNDNwZEUzZmxVOGtnU3RRb3Zxd1pTVDh5cUdsWDVDN0NBNThC?=
 =?utf-8?B?QVJXek1RZjJhaDRETzBzT0JjRnlaczdYOGgxYjBWdUsveFc5dlgwRi9LNGE4?=
 =?utf-8?B?Y0ZSQS9EK2o0UmJrTVdyeHloMm5sYlJTY3ZpNk5lY1FoYzY3NjcrSmVLRnpC?=
 =?utf-8?B?S0U4TG1JL1dhNlhZb25KbG1KNWxZQkFaTTVIanByNFB2WXlxREorT09NcDhu?=
 =?utf-8?B?c3hxVXBsTUNSRnUySjBOZzN1bmM2SjA1dVBxdTFEWHo4TGxNbExMYUwrejNC?=
 =?utf-8?B?VFBiM0VhL0dtZnVYa1gzSjl3b092VmliMUFMOEQ5VEU5a2x5VUx3RGJjUFBE?=
 =?utf-8?B?ZTNqS2FsZUpqYmZwWTJNdWRoZG91c1paaUNaYjcrUTZxbXhNU0o0ckRaSjRJ?=
 =?utf-8?B?blQxNHd5UjF2TldDc1VrWWh5WXMzTWF3ZFlmZGhDVXpuN2pGc2pEMUc4WGhh?=
 =?utf-8?B?blpPVXY3UmRld0h4V0dlanVjZkpXbTlPRXJZeVlXMTlKRnNHbVY4YUFIVDA0?=
 =?utf-8?B?VDBWUEJUQU9HakJXdTU2S0M0R1JQbnhRMGxXVkpuajNVTE8rM2VSNUlQVWsw?=
 =?utf-8?B?VE15UGZIWm5SakxwNjBEdmJmMmNSTXJCOTR4Y09DMGd0QTZNK0FmQXVaUFEv?=
 =?utf-8?B?OWRHNjNkZkxmSndsZ085cGo1WklNbjQzRG1DOTQweU9CZ1pDYkJJT2phUWx2?=
 =?utf-8?B?YzduR2t1SXNyaWpneW0xUmZoMjFIL3oxZE5mN01lMzdpUmw5cUttazNadTdS?=
 =?utf-8?B?L1hXTUR6SkxSb0kyQWVHTlNZaDZUZmV0VXpHU0ZYK3lJZGRUK3kwOWlUcWZG?=
 =?utf-8?B?bWNhR1RMNzg4WFFMSVhwTG9URm9PMTRWdDZhYjFEUmdySGJEaEV6ZW9Vb1Nw?=
 =?utf-8?B?Zkl0UDZab3JZU3RWMmoxekl2ZzhtZkd0eFBJVWZvR1NjS2l4ekVsZ0k4dUpo?=
 =?utf-8?B?ZVRWM1g0VXJUaDBzLzdrT1plLzRKY1VaNEJWNGIvSG51TFl2OHBka2tBN1Ex?=
 =?utf-8?B?YjdRQ0RiRjVyZGZsUEZ4c3AxZTdpZVByeGUvL1VHcVlWTkVIOGdKc1hzblVv?=
 =?utf-8?B?L0JpUFBtRDFjL29rUU5HaU5aSG5jYzl6V2JIMmN6NXNYYjJPRUwvcjlIMkRK?=
 =?utf-8?B?Qk1OdDdOMG52VEt4VWZkZ3l3alViamRBZjFUcUQzWTBQQ2NLWW0vN2c1d0pT?=
 =?utf-8?B?enBoc3YyeDBQTmo1dVFCZzRITm1jZExYcmk3UUtrbFliakFZY1hvS0VPREpj?=
 =?utf-8?B?TzNCTS95U01sMThJamJlOWc3OUJmaC93TTV3TEF3eTZURHlpYlJCbE9GU2g0?=
 =?utf-8?B?VmNiZk0zaVE5VHRKZUNKMCtnTnNMdHJuM2o4Z0JwRVZOMXAxMld2aGRjWnB2?=
 =?utf-8?B?alBTNG1iOWdRUFdQdGoxQ3hOSVhhRHN1L2oyYkxCUm8vT2w1L2pkS29JeFAr?=
 =?utf-8?Q?9VCfsQO6H+WntIcIZ4awzwV0T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7KNLmz7lGmcq/gtNJRWSXZPNymLla++NUTK/Ddg/4IliSQew8Inme7nVDFLtozxE9PsoMVLgcGceZJR9Cw2qgBHlTmQd2lxuB83yPrLy91oH/cmxejYUrt0Ds/9Ky4caGNB5McAZGubCLmmdLdurKkUeeMtI8Z3Axu3z7BYqBb++jgaDBlNReaOaNxrcf/3nAQehjzouMw374OWRAmQukmlZ6RUvBrp9XZT2yQx0eHUS8Z8vaDM9BhOTk7IC8aCkHzfCtQQjoazAF6ZuWSP01sE0XV5DyzigORVHHtJXPzDx7GIK4JVU+MAD5824vX9DjtEfbyu7Vun7I3gbYnDriPfpWCOd8kksxMDPzF0EJZA6Xs4sFNnqb6pWzT4Claryr6HxQGQ0zt/PRfvUcYhLKy14+tPw5IfpHwO/Sn+5vzbYVeph44T95xVgRpHnkWhPtvYBqGL1OQVUloOKQethN3RJnfoTmYVsbG5nDQ9gp2cvqe4lW926b10rI20zgym9/zGBwkuoYsxVe/WITZJVSs0utvzhnJQPCE1VbpSjyCdQYKR/04japy7wOcGHaUbJwoINzj90ebv+TXAHf2Gz9pXYTWB6nFJdNAXKrPomWflbw5EX6ubbWw4N+tN7ZDXGnTAmFfTHDKF6uji7zW0n/CzzWPg9ZAW+3/lRow5bzV4DiCcIlnHwg1VGMl42giqlWEBNEkHMnAjlmZ1jnBIJcIy92R2VToXzEvGNlUatQWqHWnVZP5xWtx+cI00AAocMVca6kaqNtI8yFpzpNBiNG0hHBlRwJ+ID9nwG7ExD3wRVixM/2Rjy89OxJOhdgRY/TKsGH70tVwms6nhqXvijkg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0c95ce-68bf-4f59-53b5-08db63122f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 02:36:35.6188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: csLN6w2qpjo8srgizEUybiswywHbCDuLKihkTBo/dSJbPky8ysT9HwPdGTw7LxyqCxxSPuSIdSovCwKvc7VYlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182137

SGksIFJpY2hhcmQNCg0KPiBJdCBoYXMgd29ya2VkIGF0IHNvbWUgcG9pbnRzIGluIHRpbWUgYnV0
IGlzbid0IHBhcnQgb2Ygb3VyIGF1dG9tYXRlZCB0ZXN0IG1hdHJpeA0KPiBzbyBpdCBsb29rcyBs
aWtlIGl0IGhhcyBzdWZmZXJlZCBmcm9tIGJpdHJvdCA6KA0KDQpJIGhhdmUgbm8gaWRlYSBhYm91
dCBob3cgdG8gZml4IHRoZXNlIGJ1Z3MsIENhbiB5b3UgZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25z
PyBPciBjYW4gYWFjaDY0X2JlIGJlIGFkZGVkIGludG8gdGhlIHdvcmsgb2YgbmV4dCByZWxlYXNl
Pw0KDQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEsIDIwMjMgMzoxMCBQTQ0KPiBUbzogTGVpLCBN
YW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBJcyBhYXJjaDY0X2Jl
IHVuZGVyIG1haW50ZW5hbmNlPw0KPiANCj4gT24gVGh1LCAyMDIzLTA2LTAxIGF0IDA2OjU4ICsw
MDAwLCBsZWltYW9odWkgd3JvdGU6DQo+ID4gSGkgYWxsDQo+ID4NCj4gPiBSZWNlbnRseSwgSSB3
YW50IHRvIGJ1aWxkIGFuIGltYWdlIG9mIGFhcmNoNjRfYmUsIGJ1dCBpdCBzZWVtcyBnbyBiYWRs
eS4gVGhvc2UNCj4gcmVjaXBlcyB0aGF0ICJpbmhlcml0IG1lc29uIiBoYXZlIHRoZSBmb2xsb3dp
bmcgZXJyb3I6DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ID4gLi4vZnJpYmlkaS0xLjAuMTIvbWVzb24uYnVpbGQ6MTowOiBFUlJPUjogRXhlY3V0YWJs
ZXMgY3JlYXRlZCBieSBjIGNvbXBpbGVyDQo+IGFhcmNoNjRfYmUtcG9reS1saW51eC1nY2MgLWZz
dGFjay1wcm90ZWN0b3Itc3Ryb25nIC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yDQo+IC1XZm9ybWF0
IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5DQo+IC0tc3lzcm9vdD0v
dWJpbnV4LWRldi91YmludXgwMDEvYnVpbGQtdWJpbnV4L3ViaW51eC0yMDIzMDcvYnVpbGQtcG9r
eS10ZXN0LWENCj4gcnY4YmUvdG1wL3dvcmsvYWFyY2g2NF9iZS1wb2t5LWxpbnV4L2ZyaWJpZGkv
MS4wLjEyLXIwL3JlY2lwZS1zeXNyb290IGFyZSBub3QNCj4gcnVubmFibGUuDQo+ID4gPg0KPiA+
ID4gQSBmdWxsIGxvZyBjYW4gYmUgZm91bmQgYXQNCj4gPiA+IC91YmludXgtZGV2L3ViaW51eDAw
MS9idWlsZC11YmludXgvdWJpbnV4LTIwMjMwNy9idWlsZC1wb2t5LXRlc3QtYXJ2DQo+ID4gPiA4
YmUvdG1wL3dvcmsvYWFyY2g2NF9iZS1wb2t5LWxpbnV4L2ZyaWJpZGkvMS4wLjEyLXIwL2J1aWxk
L21lc29uLWxvZw0KPiA+ID4gcy9tZXNvbi1sb2cudHh0DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IEl0IHNlZW1zIHRoYXQgcWVtdS1hYXJjaDY0X2Jl
IGRvZXNuJ3Qgd29yayB3ZWxsLg0KPiA+IEFuZCBnbGliLTIuMCBhbHNvIGZhaWxlZCBpbiBkb19j
b25maWd1cmUuDQo+ID4gU28sIGlzIGFhcmNoNjRfYmUgdW5kZXIgbWFpbnRlbmFuY2U/IE9yIGlz
IHRoZXJlIHNvbWUgaXNzdWVzIGluIG15IHVzYWdlPw0KPiANCj4gSXQgaGFzIHdvcmtlZCBhdCBz
b21lIHBvaW50cyBpbiB0aW1lIGJ1dCBpc24ndCBwYXJ0IG9mIG91ciBhdXRvbWF0ZWQgdGVzdCBt
YXRyaXgNCj4gc28gaXQgbG9va3MgbGlrZSBpdCBoYXMgc3VmZmVyZWQgZnJvbSBiaXRyb3QgOigN
Cj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg==

