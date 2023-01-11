Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF87DC54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 03:42:57 +0000 (UTC)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com [68.232.159.90])
 by mx.groups.io with SMTP id smtpd.web11.15111.1673408574139703492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 19:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=gN9qjWF7;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.90, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1673408575; x=1704944575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4egiAcXKZEh9V895w75I2ygTXf8mBLoVwjp62DxlXC0=;
  b=gN9qjWF7kVS44RiK4DGYL2NJ0NviIq9y7uBgyJkFKVAoq7ryYcfRY09C
   NAAX0YGn8x3ak3M2F+S16Z7rgycFoEAbf86kkgeUKimLV0W55ulPOwHXD
   2RiQY1rNznCUVy0LzLYKhacyV3YccdoLKIN8ZRwes4e55dAH7WcXtD1x1
   B0RQMU49qppSACWrA95QWwLzYVU01/8UQGRj1FLGV/s5PsA2ForOsroCd
   8Z0J8iJaE3JtoraJeroP/Ot46ItvkYWLErlXv94McgXimKeJuGNyR0Nb9
   Y/sspdHulGWjBARs0Wgr06jb1Li8IdYG1cqCeZFsQK00aymVNSZD/la0J
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="74340441"
X-IronPort-AV: E=Sophos;i="5.96,315,1665414000"; 
   d="scan'208";a="74340441"
Received: from mail-tycjpn01lp2172.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.172])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 12:42:52 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPR0bG1vJSlErqFK62KLEMeuOb2MNAPEUfo728WPjIkISlTjN3dqJmxpWUfW9hrEHWdPnaHN1aIJSGlIEKODP1ZbwzI10iBc7jC46Oi2eT8+TgKQN/jS8LRAVoghVR9LHJw2EbRIqLJKKZqm/VpYcTjFZFSm5V5Uz7W/jttclcDUKwETNV6492LUtvGsEB7dRQxbPANXWznDD2uXOh2FTZ4YtDeQChPq09uKyNe6P+FgEARczM3iloqji2R9uJ0/P2b/MDTcpZAEJNdCsKEcEjGzKBiigTmD/l4zhmb7NoGicExUvbPv9rxL7mY0a2B/baFjx9qokjNNn+KTaP91gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4egiAcXKZEh9V895w75I2ygTXf8mBLoVwjp62DxlXC0=;
 b=d0YtnbQAlY24YH3kw++N3sEgcDjB6eUDFh2vV4owXGSS3RHIm/0gWd3FtbnhspSKjGhDwA5itzNaga35lUsDjbPMWuaIaw9ezNRjjiOkWvRt4Pyqzz3Vu/IiCaQbGM+Q1wW0yDM3Y9K6HRTUOMIGsnMo/iKPW6fBWnudrX7gI8v22/P/yYdlZDY5uASobVcIyQChi+mXk5Mlns1q48/lqN9fzxUPWo9SaSk9n1x0Gx7XJCEnvzGgtRAr0CnqK/oubUcR+rIfXJ1rWTuFqSq01cwx/+NK6akRaJP0BpcGVV/Iefw/Pm+AfiBr+18FQStECdvOk4flc1iBpM7cVxqW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYCPR01MB8408.jpnprd01.prod.outlook.com (2603:1096:400:13b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 03:42:48 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::dee:2a48:6a33:db8%9]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 03:42:48 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] How about move nghttp2 to meta-oe?
Thread-Topic: [OE-core] How about move nghttp2 to meta-oe?
Thread-Index: Adkj2+zm7yzO6zgxSd2sMM33OOqvFgAMenUAAB+MqoAAFxcOAAAhiS6w
Date: Wed, 11 Jan 2023 03:42:48 +0000
Message-ID: 
 <OS0PR01MB6178D2654CE88FDAD423834DA0FC9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
 <OS0PR01MB6178F685B87CCDCDCDDCC32FA0FE9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj8u-5c51tDTSEnDXo2NVo8Rxem4UHvrZr5uzz9Fg7U-qQ@mail.gmail.com>
 <OS0PR01MB617847A78FD3AA141D22EFC0A0FF9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj-bX-53_WzFvRWMwQTHLdzYdymzqBoaUXOCEBZWLNDuug@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-bX-53_WzFvRWMwQTHLdzYdymzqBoaUXOCEBZWLNDuug@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NzFjMTQyYjItODQ3ZC00YWIxLWFjZGItZWRmODA1OWMw?=
 =?utf-8?B?NGM5O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMy0wMS0xMVQwMzo0MTowOFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6178:EE_|TYCPR01MB8408:EE_
x-ms-office365-filtering-correlation-id: d6b8701c-ac96-4476-56fb-08daf385e895
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OPhzkH7NzGf4ilK5HSGmAGbMDKnkCUPxYMsHaBnHN7OQWZmHJKyVk65hXCdKLwzem7T6ngTh9ASdOZkzr+FG1zNEbvcIXjv4BCWVZVx6Xh8Hu8SmkzeHMZ7/n5qonNPpi9WS1hqGhutpfKC92UlcP7NGlicwlDV27rF/B2wLHZzOOGrXGENS59fdpCHJrUTk58+uDZ5wd4OX6MuvK369gBwgt0ObysH6Rb5skCLtfNgjREbgM/gkHlp45arpLSx8YCJgrSnqG7MPmvBZYFSXuldwnYrGaX3HjcMQgYlagbujHpiy7UtRspOEqoiay8TE98UDK2ZmKs1PCKvvKjyZP44aujOmE/AzSahUtxnqqWg2tboYGZXl6rVmOnaJweyofVBHvQ1t/nPULaTveic90PnNNH7UV/qX8XgVn2tvKysXsdYafQ8t9G66OniF17od+crTrYkKJBiZKE0RMYpSe+xltxl7hYXLIC3xemDyCYx4Y/yLC62equGs73dd2QhO1mBuM6xm55VlnAlMdYWuuucQDTEFOx078GG2aCbZZOD+yYSW2HdfwpRAO2vIzs7NjqE/jIauS/uKehonu44qJiNJwGSj+V+3xmfhE53XRd+qn/HqMzKjg7Ga5wRw/3dstasCsNoqoj63OuF/57Q5tGx6OCEU6jr7PchNFgVyvqMhxksEhP87vyeEsjOaaiqqg50XDxi3Jj5YW7GLzNYfFwkJTY0M8XFPnD3lHs20WpY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(1590799012)(451199015)(85182001)(186003)(26005)(53546011)(122000001)(52536014)(8936002)(6506007)(55016003)(9686003)(7696005)(66946007)(33656002)(5660300002)(66476007)(66556008)(66446008)(6916009)(64756008)(316002)(4326008)(38070700005)(86362001)(71200400001)(76116006)(38100700002)(82960400001)(478600001)(8676002)(41300700001)(1580799009)(83380400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UXliZGdPT3M3Snp4NWxnMTFuc0lhWGRHd004M2d0S2xodWtvTnBMUysvWnB0?=
 =?utf-8?B?d05IZ2YxYUkzZ0pqSnNVQ2czMitxeTZ5WUoxd2xKQ2s4TkZnNmR6WkN1Y2Nu?=
 =?utf-8?B?aksvSHEwQ0hoODVXZ2ZEd0FnRk1xemM1OG1mMlFwSUFUTkVQVEpWVG1ZYS91?=
 =?utf-8?B?ODVIRXFQNEwrZCt6aVZCcUkycW1OclFDQ1pQMk43U09DOFFZOHd0UW51eW41?=
 =?utf-8?B?YzJmMkFoVzRUaDJyb2FyYWtzN3ozQ2hiTVJSenJPWWFmWkVGNnBwdjkxMVdY?=
 =?utf-8?B?czc1QVhwdTZLNDczcmhQQVkwWnN0TWdLaVJleEZaYkg2ckhUMUw2N2VKZmV2?=
 =?utf-8?B?RHRWWm42ZzlOZFRBSzFiYWxlN3FSNGwwcVFQdjBPSUlMem9wU0JKS0xvTWtU?=
 =?utf-8?B?RlpJdWVQTGF0MUNxQkJJcmNoY1QxMTg4TzZwQ2tHSWU1OCt4ZkdDRkliMkdM?=
 =?utf-8?B?ejM2WXYyUzVyUklRNXAxK2ZnM25ucHpDWlhEUmxSQy93SFVVZ2gzWDFjWDc1?=
 =?utf-8?B?cHRUMnB0d21uNVM5UWxPd1ZRUjJQR3BjTTFUL0tuL1huUXpKOC9HdHEzV0hm?=
 =?utf-8?B?dTcvdDZtRjM2b2lGMTdpZ0dxQmR3SGxEYmdUMW1GMVVFODY1MXRBejRySTBk?=
 =?utf-8?B?STVyUHJWY2paWUhSaEg2czJpcFkzVUg5L3d0aG0rNVBaaStTeDZWWXM2SnNO?=
 =?utf-8?B?a2xEcXVUVWpSN1NBRjNEdzRhd1Y0NGZ6S1UybzlRekcyQ0tHekNvNUxmcUxL?=
 =?utf-8?B?QnhHSW01Z0NpcEZFWFZuV0ZOQ2czQzgxVEN0Vlh5a1MyWEMycmhDMm10bElh?=
 =?utf-8?B?Z0o0TXo3RTBtUWp4T01TUDk0Y0c0M2dMNWpZbU1ORWt2RzBRMlBMTHBoU1lW?=
 =?utf-8?B?K0cxenNnSHpyb3ovUUpUMFdyVmtsc3o1d1I4UENKNlFTWVgreEd2Uk5ESHJU?=
 =?utf-8?B?ZmZRR0plMVhHeFF2akIxQzZrMDdocXhBSlN0VElyZWV4Q0FQY05rdUdzR1pD?=
 =?utf-8?B?TXdjM1JTVU9RMXZOTVNHYUhXczQycUQ0QnA2OUk1M3lOZW9KZnVQdWdtZnFE?=
 =?utf-8?B?eXRvMWxrdjN1cVJnbGhKc1poSlBGUHNqckpjTTFhMnNqYUxZNXZxQ2JZRDBJ?=
 =?utf-8?B?ck9tNmRlbGV6RDBCMjFMeUdpbGZqWXpIQm1IeGhkMU5yWjF4ZHRFT2twMi84?=
 =?utf-8?B?THJRTEsvbUc3WDFtUHo1M2txazI5ZGg4cWZYUnZpbUxUU1BkK3BOUUJmTTh0?=
 =?utf-8?B?SDFsbVNQaFZ4am9kaEF1YjYzcnRabHZjOTF1ZWUrZDl5VzVLVUQzUnMxUm1Y?=
 =?utf-8?B?Q3ZFc0t0Z1dNUzZ3bU1xRlNDZ1pHL1EvaWkxVDF1L3JTeVIzU3FnR2ZpNU9D?=
 =?utf-8?B?c1lMTXB3RWFJUnhiRngxV01Nbzd5cXRJQlBQYU5wWm1qVWlkTVIrM1VoYkxu?=
 =?utf-8?B?WWY0K0orTlBlZGU4N0dOSnZ2ejZDVXgveFUxd2wxVGtOK2NFWi95YzdMV1p6?=
 =?utf-8?B?UmEzT1F2Y1NpVytzckRUOGVlR3QzU3ExWHMydlFmR0xtYlo0TTlxQUNObnFY?=
 =?utf-8?B?YnFhSWt6bnhJWm80azJnM2oyblFUY2g1bFVMSytpUkY4OERSTHJkMm5kNDJE?=
 =?utf-8?B?U09KRjI4cFBaUzZWZ3Jac25vWkJIajczNFhuam5BbU4rZmtwQWZ0UHJIVHlN?=
 =?utf-8?B?L1oyeDBRQTByODJ5cjBEbjhTdWVHb0toaUFTWncvZzV2NVRGR3hwL1BweVB5?=
 =?utf-8?B?MSt1K1NZS1A0T1NmRCttV1BRdjZld1dUVlJsbXFnOVo2b1h0VjA5bGNYNnhS?=
 =?utf-8?B?ekdiRURLWU5LSkxnR3oyMW5FQkpmNGtRSFh1bXg1eThqTHcrMFBxUDRVbU1E?=
 =?utf-8?B?ZGs0ZGhURHQvQ21DVWlTLzRTUmdJS0hoL3o1eUpqNmtWZ0VLRVg0YzdKVzMw?=
 =?utf-8?B?VGJ0azZoSmJmNDBiY0hqZmhjWHd0TVN0RlpHOVZFVEY2SmtWOWUzSndLcmlM?=
 =?utf-8?B?UWNkQ0cvZjIxdzJXSTJHTXE4dURrdUc3emdEdzlrQXZHQ2I4YVJSUnlXd0k2?=
 =?utf-8?B?dEFoS2J4N1BQWlhobTAwd05tcy9icGwxT1R0V2M4T2NxOEM3Q1FtQzdGU1ZR?=
 =?utf-8?Q?yLmIGhCFq5njJxMLVj3O0nbYy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PB95qsqS7WKHE1/wBc+r/CS80xTKliL+kY91/OMzfCK05XuHNb6zT3wq1Ux+1UwgEdG93AEQAsFMw/3GQm8aLZfyr/4rs4SpgJOQ12xsoAbjin5aqokhTPJb+IjIo0g5q+IzSbPGP2TB30LZPe9XsCAPHEy1HenRhK8F+zc6JTaPPmDwJ17Y1rBzAeD0515dIeQqJ9SXOgsoEFI9uJCsgMlunzOJigxnrunieqULx0JGxqjS/fS6b9B/QlmF4erHCvZ4hHTF6Mn2pGuP5h+SPa0OzQZHAgxC3EUNJzd9gTYgi4cly49rMDznfwQmu9CX0LRJaUvLkPQhE6LRTFsIUgGV9fkK9w8NfJxYaE/xumvzhNNZHQ7Hsyupi7Q8gylw9oVJzlnUfJWUjuJP+3QfU90kEDeL3d+QMq5VdHT7O12hwtkUoX/gMr56S6ekJFdZl9LaNEPbW1u+n/Kx0tFFmlpbzZbFjFHZSZTswCg+onDR9S+kCnk3t6JNvVS65yBilDPH0AFkwXsZ0hFVQlsV3gexNaxlgeE2UQ6DYYzCxvY4mmADpDrUC5hcFz4A/bVyaWReHOhHpZXsszmYW+Od8LMF/Q2WgZb0oj+ZQMhJbpFoN6X6SZuUxbsJeXa6wc83PaZcYhkZVBz1dlJtEIEhZr3NoAtQXMrvQTTbbKyBgJ1h23FU3P6WP1SaUNGKZp/KA8B1h5Sbi2yg1PbCoRRB7VdYzRY9hg1zJs7qHkuctuResVELPpRYs5MdAMpAg26Z1iwyjpCxuZHBkMJ8VoBeHzyNy4RpsndIPeTeczk9+Gt4NvAz6B0K87Rc10foUxNg
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b8701c-ac96-4476-56fb-08daf385e895
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 03:42:48.4491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+L28WuDNROub+hQ7A/DbhlQvkxquL+FNd8pZSTMaE8WU1+H4gYiH6fGcfnRJf4LEJhJSU2sXwWgAH+oQyVArw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8408
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 03:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175726

SGksIEFsZXgNCg0KPiBZb3UgbmVlZCB0byBhZGQgbmVlZGVkIFBBQ0tBR0VDT05GSUcgZW50cmll
cyB0byBuZ2h0dHAyIHJlY2lwZSwgdGhlbiBlbmFibGUNCj4gdGhlbSBpbiB5b3VyIGRpc3RybyBj
b25maWd1cmF0aW9uLiBUaGVuIHN1Ym1pdCByZXN1bHRpbmcgcGF0Y2hlcyB0byBoZXJlLiBJdCBp
cyBmaW5lDQo+IGlmIFBBQ0tBR0VDT05GSUcgZW50cmllcyByZWZlciB0byByZWNpcGVzIGZyb20g
b3RoZXIgbGF5ZXJzLCBpZiB0aG9zZSBlbnRyaWVzIGFyZQ0KPiBub3QgZW5hYmxlZCBieSBkZWZh
dWx0Lg0KPiANCj4gbWV0YS1vZSBjYW5ub3QgY2hhbmdlIHJlY2lwZXMgZnJvbSBkaWZmZXJlbnQg
bGF5ZXJzIHdpdGggYmJhcHBhbmRzLg0KDQpJIGdvdCBpdC4gSSdsbCB0cnkgdG8gZml4IHRoaXMg
ZXJyb3IgaW4gdGhpcyB3YXkuIA0KVGhhbmsgeW91IHZlcnkgbXVjaC4NCg0KQmVzdCByZWdhcmRz
DQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFy
eSAxMCwgMjAyMyA3OjQxIFBNDQo+IFRvOiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3Uu
Y29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIEhvdyBhYm91dCBtb3ZlIG5naHR0cDIgdG8gbWV0YS1vZT8N
Cj4gDQo+IE9uIFR1ZSwgMTAgSmFuIDIwMjMgYXQgMDE6NDMsIGxlaW1hb2h1aUBmdWppdHN1LmNv
bSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiB3cm90ZToNCj4gPiA+IGxpYnNvdXAgaGFzIGEg
aGFyZCBkZXBlbmRlbmN5IG9uIG5naHR0cDIsIHNvIHlvdSBoYXZlIHRvIGFkZCBtZXRhLW9lDQo+
ID4gPiBsYXllcnMgdG8geW91ciBidWlsZC4NCj4gPg0KPiA+IFRoYW5rcywgSSBzZWUuIEJ1dCBo
b3cgdG8gZml4IHRoaXMgZXJyb3I/IEkgd29uZGVyIGlmIEkgY2FuIGFkZCBhIGJiYXBwZW5kIGZp
bGUgaW50bw0KPiBtZXRhLW9lPw0KPiANCj4gWW91IG5lZWQgdG8gYWRkIG5lZWRlZCBQQUNLQUdF
Q09ORklHIGVudHJpZXMgdG8gbmdodHRwMiByZWNpcGUsIHRoZW4gZW5hYmxlDQo+IHRoZW0gaW4g
eW91ciBkaXN0cm8gY29uZmlndXJhdGlvbi4gVGhlbiBzdWJtaXQgcmVzdWx0aW5nIHBhdGNoZXMg
dG8gaGVyZS4gSXQgaXMgZmluZQ0KPiBpZiBQQUNLQUdFQ09ORklHIGVudHJpZXMgcmVmZXIgdG8g
cmVjaXBlcyBmcm9tIG90aGVyIGxheWVycywgaWYgdGhvc2UgZW50cmllcyBhcmUNCj4gbm90IGVu
YWJsZWQgYnkgZGVmYXVsdC4NCj4gDQo+IG1ldGEtb2UgY2Fubm90IGNoYW5nZSByZWNpcGVzIGZy
b20gZGlmZmVyZW50IGxheWVycyB3aXRoIGJiYXBwYW5kcy4NCj4gDQo+IEFsZXgNCg==

