Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6565AC7618E
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 00:38:59 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web11.9461.1682555938098952368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 17:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@fujitsu.com header.s=fj1 header.b=ScSZif8V;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1682555938; x=1714091938;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=cve/oS0OPp3XeuFIr5D1OldleAB11bMslc8m7VCB6Sw=;
  b=ScSZif8VhGK2gAjcGXbgIczoM9ShEOh75XeqdUHREf1f6smyjZHc2DTi
   pB0dreIf8IodtwSZZP0qldHnRR+KFSypbOotQ+hylGMZkaIwznlyHiWaN
   qiB0ukxzwbXoAJSyQ/ggRDuLvOo6CpLcazo0g6YS8ybzi1gZxtRml/UDe
   319jZH73uR13ivJOPZMgup3NXHPA2/FuWrowsGgCILD+Ykj1cGEcJaHp0
   f8NotBqD/lxFI/Q05PP9IvrN1m6JcgUOr8teRq5jJCU5OEhLz0y5KEJF6
   5mrl1PE3lDSgTP//16pRk6ibOy+J6bu7vydFSj65uhoRrMU4Xbwe88k4U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="83145360"
X-IronPort-AV: E=Sophos;i="5.98,286,1673881200"; 
   d="scan'208,217";a="83145360"
Received: from mail-tycjpn01lp2177.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.177])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 09:38:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaD7xaFjpdsyWg9tUZZ1BBQbF+/kbVAHYb+7tvuHb3Onbsfpv5ZA3lNtfBNIEp9k6OeeuDEj14u59z/eNLvcJELDaSkG4iLg8VOtioNG99zqcKMgU+u/D0viMmZ5QTy9EfkGf7XJmGciqvy8rGRfWQYbnu8w5MERy7xLKxkRMBWcYn4+cXXxVhc1BLK2qRsto3t2wyMX2cJUp6sr7reHpCyOSKpaJBytA1fXctAGVZiBwqZgybMnfa7xqojV0PjAQpFoyBA+VAGUNld0eq3C9tONsUO8OQuK0tXxNlyjohryMmCJB8AyOCj1urqLyhEhgedChu6PXTguyppWmD1EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cve/oS0OPp3XeuFIr5D1OldleAB11bMslc8m7VCB6Sw=;
 b=JISUsfzmJ3+0mHF1c1xeWJZyLy87ly3GIp/jY5p4TNy3YxyfOf5/epEHyPpNiSU75T4MWTh/1Nu8XB0V/PW4IJTvUcEV1rmo4LIqsWltomS5Ml41wq+ZS/jDDCMMl9gIQEswalmdkYhaboSTt3HQr4tgLCauRzCsMTpZRKXCnqbORVWpowp2FDYMaYezXuP+PthLoAmPymifeUo8VMHSw8TbpcAET7ugoQgLl8Hm1znyks3B5sZ+DklL0Vg0taf9Gt4nyhUmJv76i2isVn+pRifzX3WhJLhvGKD/g8ABe1xpsvfk4oxrUhOx5Qx20OI24fVDHWCK9V+E7vGbSkK7mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com (2603:1096:604:1c8::7)
 by OS3PR01MB5846.jpnprd01.prod.outlook.com (2603:1096:604:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 00:38:52 +0000
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::e411:b489:d1f1:5f6e]) by OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::e411:b489:d1f1:5f6e%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 00:38:52 +0000
From: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
To: Luca Ceresoli via lists.openembedded.org
	<luca.ceresoli=bootlin.com@lists.openembedded.org>,
	"luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "fnstml-fujitsuten@fujitsu.com"
	<fnstml-fujitsuten@fujitsu.com>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdIFtQQVRDSCBWMV0gRml4IGVycm9yIFNSQ0RJUiB3?=
 =?gb2312?Q?hen_using_usrmerge_DISTRO=5FFEATURES?=
Thread-Topic: [OE-core] [PATCH V1] Fix error SRCDIR when using usrmerge
 DISTRO_FEATURES
Thread-Index: AQHZeAjMmmlYxuZsK0i38x3e5dX99689Uj96gAD9nwk=
Date: Thu, 27 Apr 2023 00:38:52 +0000
Message-ID: 
 <OS3PR01MB9515769FCFB04D41B1424B5FBA6A9@OS3PR01MB9515.jpnprd01.prod.outlook.com>
References: <1682490667-2414-1-git-send-email-qiutt@fujitsu.com>
	<175971C08FC40A4D.699@lists.openembedded.org> <20230426112604.253bf25b@booty>
In-Reply-To: <20230426112604.253bf25b@booty>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2023-04-27T00:38:45.202Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9515:EE_|OS3PR01MB5846:EE_
x-ms-office365-filtering-correlation-id: d0cd3501-2bf1-4312-aea0-08db46b7c62f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FxJrHEqmUyVtRxb9wSNVU4btzARfSdBrNv1MToEa73rL9lGdmmS8EQmwuCMgVhzd5KKAD5Svr+892R5tXJhM5KfcGTpL0STbo1ifkHBsgCHp+saSTw1UsbLXLcG3spHXCA/zcynESCuD31OhHTQ+L52eV2KSBhjbdOz5ZP6wO4IuF5Xi9m54/fJ09VbKJ3Y5DSjqV/1v7o591Bw67sFLalK5aP8S19jjslkG6koaI0hrYwPsJRCvSfav9cmGsP+fUJghrtEraNYOuBFYioZX5TuNd5xU6eEf0yIqBPKd/9caN3thMW7U0bxtc+xG7lpJFjNhW/BGu6UGes7LRuNoJhQWq3G+K5wIeNCkSWjvlit4/sCq3jl2VQ+qbRsHhQbMMEusAmnjvAjToWB/8y0ckJ6T0Y/zJBJoPYyLqtWbhA1GFVvyBVIi51kRSJFQc6DViKzXTx3dK+YUI0FCSPvmgRuE406tLO7+HilojqcBTJBDQsKqReiH382KHr/OQf42gLPOUlla4iB3QAU0GVeWsk62DQUyY/wEydn+Pz9Jr9ILUmt5wHsP01rQvElgiAnjArXZW0LTaGXC3PkI+kOiVzEPte2bRp4LPG38Y+xlVvm7MqWkNAeOuXd+iie4BFWm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9515.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(1590799018)(451199021)(76116006)(91956017)(224303003)(4326008)(64756008)(66946007)(66556008)(66476007)(478600001)(66446008)(1580799015)(316002)(85182001)(86362001)(33656002)(966005)(26005)(6506007)(9686003)(110136005)(54906003)(107886003)(186003)(55016003)(2906002)(82960400001)(7696005)(166002)(41300700001)(5660300002)(71200400001)(52536014)(38100700002)(122000001)(83380400001)(38070700005)(8936002)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?M3kzVWR6Wmk4Q3Z6NFBidnNmaHgzamdlOS96YkxneUVTWDkwOGUzd1A0eDFi?=
 =?gb2312?B?V211bHVvSXFNQ0EvNk9xbFRQa3JuazlqaDZLcFRrQkovMURQTG1kVkxLRWRp?=
 =?gb2312?B?c0ZpeG9EZHQ0THZKTlVOaHlMZkJWQzg2NjRDc0V1YzlKYUlkbjJ2SGl6VmFV?=
 =?gb2312?B?cys1b2kwN0dBL2lVVUhYSjViS05qRU5JQTZUZ2xCYUNlcTNxbTJGSzJFMlls?=
 =?gb2312?B?L1JFcDRmTmpDZFh4VXQ0Z2JxY3FmZStESVVPRnZPd0NURGdJZW9DMzA0TWNj?=
 =?gb2312?B?R2RFTjRSd2h5WnJOWkNqQ2VhdlorUlA1M2QyWU5ZNlV4UzhxYWcvT1J0Y3lP?=
 =?gb2312?B?bkM2SW5CbUg5VmEwZVRVaXd1UFNPeXZvc1FleTBkNFNQdTN0VUpLREZST083?=
 =?gb2312?B?NDl5emh4c3FCZHd1Q1RrOXRVZVNtR2toZXFHYnhpRmRUOXRmR0Y2UlFuSWRz?=
 =?gb2312?B?RXdaWHBSSFYzbnpGWkcrcE1YSEFDYVhXMWNGMzAzeXhLYk5QV3JESTNtUDZW?=
 =?gb2312?B?YUJ4TG5QY2lHU1RyVittK25BN2s3UG5tMTg3RTdiTUZBL2JFRmViY3p6QXYv?=
 =?gb2312?B?bnNOclpXU0V5MHk5RklMeEJxclk2RW1qOGQwb2tKYXRYUFJBZzI1TEozY3Zq?=
 =?gb2312?B?a2M1dzk1aVQrbzRRTHpTUWpzTE5IZ2RreHRSYmRGUG84cmRkemt3K3dTTXpW?=
 =?gb2312?B?SlJvQ2dnbnJiOVVZcHFqUll5V2JNYlV0bnIzNWVlTThxWVRPTVBKOFpSczVy?=
 =?gb2312?B?dVVIdTJEUnBpM05qRGx6VU1Gc0VLNTdlRlJleGIvT04xcjR1UzcwVGk3T2Vx?=
 =?gb2312?B?RDE2YjRWQUd1RWtTY2h2YnpyMGh3NHZiMXlub0dFdnBPbkJ3WTZMQXdKdmdm?=
 =?gb2312?B?WlNtaHhHRFlKVUx5WWJKaXQvRGhLR0hNRUNySXJKdXR6Y0xrbzAycURFV2RL?=
 =?gb2312?B?TzB3QkZWdDNOUDhWSzAveVJvQ0Y2QjVkb09YS3h6NHVKQW9kc2liVE94MlM4?=
 =?gb2312?B?OGM0ejVrL2FZTEtsVHFSSERWVkY2eWxjaHBpMDlSTG9xQ2ZqeG8xQlVUME5M?=
 =?gb2312?B?eWpBVDV2TmxaTEJSNnVHL21VZzJjRzFQMGhGeEZzVzBuMUdYc2piZk52MVl5?=
 =?gb2312?B?MUxISXpYUUxvKy9RTE4wTzJKSk85bTAwczVMWlYvYW9ENjU2WkNWMjJ1VzY3?=
 =?gb2312?B?RlVGbkphN3JZSGdNeGZYOTk4dmEvWUFVVTdkQ1NoNGIvWkVRbGx6ZE54dXBp?=
 =?gb2312?B?WTVEeVR3SEhDOU15Qnc2cVlCdU1iUlZCNUN6UWtIbUlNVTJxRSthZDdjNmFC?=
 =?gb2312?B?aGJSRy9pQjArbUg4U1VFYVZWYkNwQUJXS2hscjd6SWlnaDhZY2xZNE9GTXVy?=
 =?gb2312?B?U090NGh4NWE5QmptRlIzeWxKQ3MxeEtQL1I1b0FXdGVFaXFjTkpLQWlDSEM4?=
 =?gb2312?B?aTlxS2lKcnVrZ1RUZVI3RkRJUkdrNlVtYjJYcG9ydFlkOXNOV0pkcDhERTBW?=
 =?gb2312?B?bUc5c3RKZUtOOHEwRHNGR29OOGVKNVRJcWdxWHZqK0lYc0ZSZXNxcHVzbEhj?=
 =?gb2312?B?VWtQMDduWXJpbERBS09PSmE2RUpMN2wwd1d4L0dDNlVqdlFnMGV3bXlMdGI3?=
 =?gb2312?B?NCtzZFVva0dHL0JQOUNweEp3NHRhWjJIQ2ZldGJ4VVZrVzFUdjQ4cXhDbWRh?=
 =?gb2312?B?RzJVSXpWZkN2UnpYR0c1ODZxTCtGbkZma2ZZOVNaQitMV25YMEh3SkdITGtj?=
 =?gb2312?B?MUI0Z00rL2hlTzY1ZHBtWmYzMUFDWWdYaUlxZnVnWk5sWWMxbHN1RHp2UXhq?=
 =?gb2312?B?dGxXc2lnVi9JNkNlNlI4Vmt0d2k0Q0JWNmFtVUZmV050bVZpbEhsT0NzZjdN?=
 =?gb2312?B?QkZFMWliUmZsTWgwSmoza3lSREVHQ2RkUGVtTkFSd01tak9JbHNUZTBwR0Jj?=
 =?gb2312?B?dG5lcHpyRUo0aHVwR2UzMGoxQS9QeCs5TVpSRnFQaENOK3YwK2RZdlEydlVS?=
 =?gb2312?B?R3ZZUjZvOFgrcEc1OHdHbTl0VTlMa2NGR0pCbWhsZG5pZHBmbG5YUXZISXoz?=
 =?gb2312?B?SEFlczdmbUszYnVLaUpOaDlZYm1zTFRVZWFEUk5ldFhFSktaekYyZXlBWDlC?=
 =?gb2312?Q?F6KA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_OS3PR01MB9515769FCFB04D41B1424B5FBA6A9OS3PR01MB9515jpnp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	soUIneCi7w9lQ5pRph30Loutv2DxV01V+krdw5wnE/wMwVjMpyrR3/oaCsUbMRBk7hYe2SWqi8BoR/WRqSA+sQtq+JAstjXH3zNo5TvoQHdYPqp8lqa6RYdlbIYiYT8x54xoWwrbBcmh3z1t1ZgdlQIuBhSA7zZq5c2tW/QrJfSU6TwP59FtwKgq0TbPzOJvhyFmVK1TcBfPGf2gBFLaYsTJho2myOBbU0MyxuoWBpYJ1lH6XFf5M+qGa/o4HXjXg1EKLWzlhVWsiMF+W6AAkZDN2rPDz3eG9nL4P9lNU1NiqjwmRdPuODG+WvoBd6/YNgRTVHByP4TlGMqzYOUfZAKDn4Fbsnrr5jK2SPM0R3ynCe5cWySciAWoQCuWofusR9Gnk5CSLLlcKTNGYIQeOCt7EMjO+ijUwI2sWmSYf3/Th2gxjyNxS55KaulkpLY/8MYJ39f/2YflXWOKxxp6dsFiySOPANc+13zb/bPA2C6FoFyjgKjn3VsQyXd67abg9MSBtt1RycqafwLSqQY0K3vNqqUO3flLHk++enR2UFiGD2OJFEH9UkdTvB9SYyjfWxCqnv/j6ydX58qJWg10YA/tsyp/jXa90L0SDesi28NU8KY7fxxhQwYTqRx8VS8NsRwQ6tZLBwPVZ7p9eCLbTSxI22TXJWy4TLfUYIwwlN4irxadSRHJdflToeqZaPb/PoCqvaolb6nOFaNXZPGEbTxQG7p730gXxb2KeIFr7uXFrqrtnCTQmOh/oVXAgrCepi80LQcXjY6elqL/LPHr2q4SPoZ5/fcIKMwJGSIVr0eoM7vhqrXIrqaLrSOs42Bd4QIOdNm9yReyrz823nDZ8A==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9515.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cd3501-2bf1-4312-aea0-08db46b7c62f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 00:38:52.0806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zCMrmos9Zw+w/D54FFRqgs6C5x4yxOG/tHli7R+amVj9nkZOGWsXRjQRK79tWevmS0wHfGy0dIyKvChu+8FF/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5846
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180459

--_000_OS3PR01MB9515769FCFB04D41B1424B5FBA6A9OS3PR01MB9515jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksIEx1Y2ENCg0KVGhhbmtzIGZvciB5b3VyIHJldmlld2luZywgSXQgbG9va3MgZ29vZC4NCkkg
d2lsbCBzZW5kIHBhdGNoIHYyIGZvciBpdC4NCg0KQmVzdCByZWdhcmRzLA0KUWl1IFRpbmd0aW5n
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+ILT6se0gTHVjYSBDZXJlc29saSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8bHVjYS5jZXJlc29saT1ib290bGluLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
t6LLzcqxvOQ6IDIwMjPE6jTUwjI2yNUgMTc6MjYNCsrVvP7IyzogTHVjYSBDZXJlc29saSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bHVjYS5jZXJlc29saT1ib290bGluLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPg0Ks63LzTogbHVjYS5jZXJlc29saUBib290bGluLmNvbSA8bHVjYS5j
ZXJlc29saUBib290bGluLmNvbT47IFFpdSwgVGluZ3Rpbmcvs/Ag5sPmwyA8cWl1dHRAZnVqaXRz
dS5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPjsgRk5TVCBmbnN0bWwtZnVqaXRzdXRl
biA8Zm5zdG1sLWZ1aml0c3V0ZW5AZnVqaXRzdS5jb20+DQrW98ziOiBSZTogW09FLWNvcmVdIFtQ
QVRDSCBWMV0gRml4IGVycm9yIFNSQ0RJUiB3aGVuIHVzaW5nIHVzcm1lcmdlIERJU1RST19GRUFU
VVJFUw0KDQpIaSBRaXUsDQoNCk9uIFdlZCwgMjYgQXByIDIwMjMgMTE6MjM6MjIgKzAyMDANCiJM
dWNhIENlcmVzb2xpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIg0KPGx1Y2EuY2VyZXNvbGk9
Ym9vdGxpbi5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQoNCj4gSGVsbG8gUWl1
LA0KPg0KPiBPbiBXZWQsIDI2IEFwciAyMDIzIDE0OjMxOjA3ICswODAwDQo+ICJxaXV0dEBmdWpp
dHN1LmNvbSIgPHFpdXR0QGZ1aml0c3UuY29tPiB3cm90ZToNCj4NCj4gPiBGcm9tOiBRaXUgVGlu
Z3RpbmcgPHFpdXR0QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gV2hlbiBidWlsZCBlMmZzcHJvZ3Mg
cHRlc3Qgd2l0aCB1c3JtZXJnZSBESVNUUk9fRkVBVFVSRVMsDQo+ID4gaW4gdGVzdF9zY3JpcHQg
YW5kIHRlc3Rfb25lIHNjcmlwdHMsIHZhbHVlIG9mIFNSQ0RJUiBoYXMgcHJvYmxlbS4NCj4gPiAg
IFNSQ0RJUj0vdXNyL3Vzci9saWIvZTJmc3Byb2dzL3B0ZXN0L3Rlc3QNCj4gPg0KPiA+IHB0ZXN0
IGxvZw0KPiA+ICAgIyBwdGVzdC1ydW5uZXIgZTJmc3Byb2dzDQo+ID4gICBTVEFSVDogcHRlc3Qt
cnVubmVyDQo+ID4gICAyMDIyLTEyLTE3VDExOjA4DQo+ID4gICBCRUdJTjogL3Vzci9saWIvZTJm
c3Byb2dzL3B0ZXN0DQo+ID4gICBsczogY2Fubm90IGFjY2VzcyAnL3Vzci91c3IvbGliL2UyZnNw
cm9ncy9wdGVzdC90ZXN0L1thLXpBLVpdXyonOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+
ID4gICAuL3Rlc3Rfc2NyaXB0OiBsaW5lIDU0OiAvdXNyL3Vzci9saWIvZTJmc3Byb2dzL3B0ZXN0
L3Rlc3QvdGVzdF9wb3N0OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4gICBEVVJBVElP
TjogMA0KPiA+ICAgRU5EOiAvdXNyL2xpYi9lMmZzcHJvZ3MvcHRlc3QNCj4gPiAgIDIwMjItMTIt
MTdUMTE6MDgNCj4gPiAgIFNUT1A6IHB0ZXN0LXJ1bm5lcg0KPiA+ICAgVE9UQUw6IDEgRkFJTDog
MA0KPiA+DQo+ID4gUmVhc29uDQo+ID4gICBJbiBNYWtlZmlsZS5pbiwgU1JDRElSIGlzIHNldCBi
eSBwcmVmaXggYW5kIGxpYmRpci4NCj4gPiAgICAgQGVjaG8gIlNSQ0RJUj0ke3ByZWZpeH0ke2xp
YmRpcn0vZTJmc3Byb2dzL3B0ZXN0L3Rlc3QiID4+IHRlc3Rfb25lDQo+ID4gICAgIEBlY2hvICJT
UkNESVI9JHtwcmVmaXh9JHtsaWJkaXJ9L2UyZnNwcm9ncy9wdGVzdC90ZXN0IiA+PiB0ZXN0X3Nj
cmlwdA0KPiA+ICAgcHJlZml4PS91c3INCj4gPiAgIGxpYmRpcj0vdXNyL2xpYiAod2hlbiB1c3Jt
ZXJnZSBpcyBzZXQpDQo+ID4NCj4gPiBzb2x1dGlvbg0KPiA+ICAgQWZ0ZXIgcHRlc3QgY29tcGls
aW5nLCBjaGVjayBhbmQgbW9kaWZ5IFNSQ0RJUiBpbiB0ZXN0X3NjcmlwdCBhbmQgdGVzdF9vbmUu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBRaXUgVGluZ3RpbmcgPHFpdXR0QGZ1aml0c3UuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9n
c18xLjQ3LjAuYmIgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2Uy
ZnNwcm9nc18xLjQ3LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNw
cm9nc18xLjQ3LjAuYmINCj4gPiBpbmRleCAyNjIwNjEwOTAzLi4zMjE5ODE3YzA4IDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDcu
MC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dz
XzEuNDcuMC5iYg0KPiA+IEBAIC0xMjIsNiArMTIyLDggQEAgUkRFUEVORFM6JHtQTn0tcHRlc3Qg
Kz0gImUyZnNwcm9ncy1iYWRibG9ja3MgZTJmc3Byb2dzLWR1bXBlMmZzIGUyZnNwcm9ncy1lMmZz
Y2sNCj4gPg0KPiA+ICBkb19jb21waWxlX3B0ZXN0KCkgew0KPiA+ICAgICAgb2VfcnVubWFrZSAt
QyAke0J9L3Rlc3RzDQo+ID4gKyAgIHNlZCAtaSAncy9cL3VzclwvdXNyL1wvdXNyL2cnIC1pICR7
Qn0vdGVzdHMvdGVzdF9vbmUNCj4gPiArICAgc2VkIC1pICdzL1wvdXNyXC91c3IvXC91c3IvZycg
LWkgJHtCfS90ZXN0cy90ZXN0X3NjcmlwdA0KPg0KPiBUaGVyZSBpcyBhIGR1cGxpY2F0ZSAnLWkn
IGluIGVhY2ggbGluZS4NCj4NCj4gQWxzbyB0aGUgcmVnZXggd291bGQgbW9yZSByZWFkYWJsZSBi
eSB1c2luZyBhbm90aGVyIHNwZWFyYXRvciBjaGFyYWN0ZXIsDQo+IHdoaWNoIHdvdWxkIGFsbG93
IGdldHRpbmcgcmlkIG9mIHRoZSBiYWNrc2xhc2hlcyBlLmcuOg0KPg0KPiBzZWQgLWkgJ3MsL3Vz
ci91c3IsL3VzcixnJyAtaSAke0J9L3Rlc3RzL3Rlc3Rfb25lDQoNCkFuZCBJIGZvcmdvdCwgdGhp
cyBjYW4gYmUgZG9uZSBpbiBzaW5nbGUgY29tbWFuZCBvbiBib3RoIGZpbGVzOg0KDQpzZWQgLWkg
J3MsL3Vzci91c3IsL3VzcixnJyBcDQogICAgJHtCfS90ZXN0cy90ZXN0X29uZSBcDQogICAgJHtC
fS90ZXN0cy90ZXN0X3NjcmlwdA0KDQpPciBtYXliZSwgaW4gY2FzZSBpdCBtYWtlcyBzZW5zZToN
Cg0Kc2VkIC1pICdzLC91c3IvdXNyLC91c3IsZycgJHtCfS90ZXN0cy90ZXN0XyoNCg0KQmVzdCBy
ZWdhcmRzLA0KTHVjYQ0KDQotLQ0KTHVjYSBDZXJlc29saSwgQm9vdGxpbg0KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6Ly9ib290bGluLmNvbQ0K

--_000_OS3PR01MB9515769FCFB04D41B1424B5FBA6A9OS3PR01MB9515jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi,&nbsp;<span style=3D"font-family: &quot;Segoe UI Web (West European)&quo=
t;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;=
Helvetica Neue&quot;, sans-serif; display: inline !important; background-co=
lor: rgb(255, 255, 255);" class=3D"ContentPasted0 elementToProof">Luca</spa=
n></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; display: inline !important; background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 elementToProof"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; display: inline !important; background-color: rgb(=
255, 255, 255);" class=3D"ContentPasted0 elementToProof">Thanks for
 your reviewing,&nbsp;</span><span style=3D"font-family: &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif;">It looks good.</span=
></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;">I will send patch v2 for it.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;"><span style=3D"display: inline !important; backgr=
ound-color: rgb(255, 255, 255);" class=3D"ContentPasted1">Best regards,</sp=
an><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;"><span style=3D"display: inline !important; backgr=
ound-color: rgb(255, 255, 255);" class=3D"ContentPasted1">Qiu Tingting</spa=
n></span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>=B7=A2=BC=FE=C8=CB:</b> op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt; =B4=FA=B1=ED Luca Ceresoli via lists.openembedded.org &lt;luca=
.ceresoli=3Dbootlin.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2023=C4=EA4=D4=C226=C8=D5 17:26<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Luca Ceresoli via lists.openembedded.org &lt;luc=
a.ceresoli=3Dbootlin.com@lists.openembedded.org&gt;<br>
<b>=B3=AD=CB=CD:</b> luca.ceresoli@bootlin.com &lt;luca.ceresoli@bootlin.co=
m&gt;; Qiu, Tingting/=B3=F0 =E6=C3=E6=C3 &lt;qiutt@fujitsu.com&gt;; openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt;; FNST fnstml-fujitsuten &lt;fnstml-fujitsuten@fujitsu.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core] [PATCH V1] Fix error SRCDIR when using u=
srmerge DISTRO_FEATURES</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Qiu,<br>
<br>
On Wed, 26 Apr 2023 11:23:22 +0200<br>
&quot;Luca Ceresoli via lists.openembedded.org&quot;<br>
&lt;luca.ceresoli=3Dbootlin.com@lists.openembedded.org&gt; wrote:<br>
<br>
&gt; Hello Qiu,<br>
&gt; <br>
&gt; On Wed, 26 Apr 2023 14:31:07 +0800<br>
&gt; &quot;qiutt@fujitsu.com&quot; &lt;qiutt@fujitsu.com&gt; wrote:<br>
&gt; <br>
&gt; &gt; From: Qiu Tingting &lt;qiutt@fujitsu.com&gt;<br>
&gt; &gt; <br>
&gt; &gt; When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,<br>
&gt; &gt; in test_script and test_one scripts, value of SRCDIR has problem.=
<br>
&gt; &gt;&nbsp;&nbsp; SRCDIR=3D/usr/usr/lib/e2fsprogs/ptest/test<br>
&gt; &gt; <br>
&gt; &gt; ptest log<br>
&gt; &gt;&nbsp;&nbsp; # ptest-runner e2fsprogs<br>
&gt; &gt;&nbsp;&nbsp; START: ptest-runner<br>
&gt; &gt;&nbsp;&nbsp; 2022-12-17T11:08<br>
&gt; &gt;&nbsp;&nbsp; BEGIN: /usr/lib/e2fsprogs/ptest<br>
&gt; &gt;&nbsp;&nbsp; ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/=
[a-zA-Z]_*': No such file or directory<br>
&gt; &gt;&nbsp;&nbsp; ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/=
test/test_post: No such file or directory<br>
&gt; &gt;&nbsp;&nbsp; DURATION: 0<br>
&gt; &gt;&nbsp;&nbsp; END: /usr/lib/e2fsprogs/ptest<br>
&gt; &gt;&nbsp;&nbsp; 2022-12-17T11:08<br>
&gt; &gt;&nbsp;&nbsp; STOP: ptest-runner<br>
&gt; &gt;&nbsp;&nbsp; TOTAL: 1 FAIL: 0<br>
&gt; &gt; <br>
&gt; &gt; Reason<br>
&gt; &gt;&nbsp;&nbsp; In Makefile.in, SRCDIR is set by prefix and libdir.<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; @echo &quot;SRCDIR=3D${prefix}${libdir}/e=
2fsprogs/ptest/test&quot; &gt;&gt; test_one<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; @echo &quot;SRCDIR=3D${prefix}${libdir}/e=
2fsprogs/ptest/test&quot; &gt;&gt; test_script<br>
&gt; &gt;&nbsp;&nbsp; prefix=3D/usr<br>
&gt; &gt;&nbsp;&nbsp; libdir=3D/usr/lib (when usrmerge is set)<br>
&gt; &gt; <br>
&gt; &gt; solution<br>
&gt; &gt;&nbsp;&nbsp; After ptest compiling, check and modify SRCDIR in tes=
t_script and test_one.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Qiu Tingting &lt;qiutt@fujitsu.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 2 ++<=
br>
&gt; &gt;&nbsp; 1 file changed, 2 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb =
b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb<br>
&gt; &gt; index 2620610903..3219817c08 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb<br>
&gt; &gt; +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb<br>
&gt; &gt; @@ -122,6 +122,8 @@ RDEPENDS:${PN}-ptest +=3D &quot;e2fsprogs-bad=
blocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck<br>
&gt; &gt;&nbsp; <br>
&gt; &gt;&nbsp; do_compile_ptest() {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake -C ${B}/tests<br>
&gt; &gt; +&nbsp;&nbsp; sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_on=
e<br>
&gt; &gt; +&nbsp;&nbsp; sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_sc=
ript&nbsp; <br>
&gt; <br>
&gt; There is a duplicate '-i' in each line.<br>
&gt; <br>
&gt; Also the regex would more readable by using another spearator characte=
r,<br>
&gt; which would allow getting rid of the backslashes e.g.: <br>
&gt; <br>
&gt; sed -i 's,/usr/usr,/usr,g' -i ${B}/tests/test_one<br>
<br>
And I forgot, this can be done in single command on both files:<br>
<br>
sed -i 's,/usr/usr,/usr,g' \<br>
&nbsp;&nbsp;&nbsp; ${B}/tests/test_one \<br>
&nbsp;&nbsp;&nbsp; ${B}/tests/test_script <br>
<br>
Or maybe, in case it makes sense:<br>
<br>
sed -i 's,/usr/usr,/usr,g' ${B}/tests/test_*<br>
<br>
Best regards,<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" data-auth=3D"NotApplicable" data-loopstyle=
=3D"link">https://bootlin.com</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_OS3PR01MB9515769FCFB04D41B1424B5FBA6A9OS3PR01MB9515jpnp_--

