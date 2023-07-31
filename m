Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECC8EB64DD
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 02:13:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.86780.1690769622453316837
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 19:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FIMooDa3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7576b4c50b=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36V2DgBw029958;
	Sun, 30 Jul 2023 19:13:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=eTQqnUNoCediDcrYHloy1V3u7/p+8eMqRtOgbAtoFAg=; b=
	FIMooDa3Kuo/9HpWc/B+IxQeB7R8rD+frh4Do+Lg4QWfvrHxZd7tGGXS+O7f6ghF
	UJYk+sQgMHcZXZSlnLB+RSpCr7B+Sqt7gmU1CYi1hzojHCynXOcnlIEHKHbv05ZJ
	R/K/+6Jpweugnq5avWvc5Jka/AE2hxpQp867XSKJth/laNzj4UJymLCft7c7ZlpN
	xgkB0HezudOKNjiJ1pLY3WkXTlnqPgK4BsR7ewlD0dtyunr4fcwmPLE99oOE5lVW
	YrpTiRwaP3+em0q7DER2ods1VXZsrODPENxzfi0fRPQYCMNsGgdvHtD8GwG6Wnql
	rME+2AVLdWw5UNXsXgWG9w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s529fgyau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 19:13:41 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36V2Dfqf029938;
	Sun, 30 Jul 2023 19:13:41 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s529fgyar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jul 2023 19:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWV/CdFRlUIiMhB/JtO/+WomdKcHWARtZc1yCzw05GlAqwWqOh0xc8Sq/qR/uqqAWpCVhg0x8/G8JfZJNKK3+udIz3MmNqXS+ApBhZB7o+5HbRDfcIOlaFmKdxlmMdUOrj5CMpDUsVgL+6rGqXMYhTAW+tkBKV44J1KyRDM3kG7IpsbzIn4sbTG+X3BDZ/pyXrVhkhX3NuAYUdowC3v4TYRQYypVUehqCeCRaDVM7D8Z/6kPf1JvYJrMqxgBRUpRr0NWCUi3CpZOa+SJQqD/0rSxgTikZdEgC36H8b4D0j9qMQE0yJcF7xPjoKL6rFYr+gO4h2MlHfoSGthxjsVLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTQqnUNoCediDcrYHloy1V3u7/p+8eMqRtOgbAtoFAg=;
 b=YNiCN+hO8Ud50VdrmjRsxuDKEHGrLfGmCvjDWDT0ivadHe3G9sWvD/xcD9j9MFK5ljj/qe9DUKt791CyQoj2E5w7KtAjZFD2YYBJHeNvPgw/H78uFgrktwYJHLd002waaP/Q3EdSVrV/fULzI99KjS8fNnUK2OjZmMdTnJc+eUBSwtod4k/pylQjMkBC2EoOl3x4KDo5GeAGLmIsVkK3uPv7DEaqz2v0Y4MvXG5U2qucZIVyYxhJURjEK23iYfNn/tamQhKWZu/61kFcKaXa2vr/2JQh6EiSMiX7P9kLFe7qvHe4Qoto0QhNEArXdACcued7Jy+c30jW8HEcJQBWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 02:13:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5a0c:5fbb:a169:a76d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5a0c:5fbb:a169:a76d%4]) with mapi id 15.20.6631.041; Mon, 31 Jul 2023
 02:13:37 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] multilib.conf: explicitly make MULTILIB_VARIANTS
 vardeps on MULTILIBS
Thread-Topic: [OE-core][PATCH] multilib.conf: explicitly make
 MULTILIB_VARIANTS vardeps on MULTILIBS
Thread-Index: AQHZwFHCYz3EkAmbFEyo8ZZl0TTZrq/PvyuAgANpPNA=
Date: Mon, 31 Jul 2023 02:13:37 +0000
Message-ID: 
 <CO6PR11MB5602C3661E043BD96B2F29AEED05A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230727061521.3626071-1-Qi.Chen@windriver.com>
 <22bef063b15a1dbd6232785bf4812eb13b06fdc5.camel@linuxfoundation.org>
In-Reply-To: 
 <22bef063b15a1dbd6232785bf4812eb13b06fdc5.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH0PR11MB5577:EE_
x-ms-office365-filtering-correlation-id: 56025446-d7db-40bc-bfca-08db916bc013
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ilOb2LZAgnYIyy4Xoc172njIQ5R2UH7MJ8iqAcE9yRXL7Hvx89I7R5KWyB43NeQsMshFhXSPMF7iZgc4v0LNk/VyUuni7Ymx/fvgTwUKxHl9jFAZ8IliEtTyNy58TugmYieVI/Dg8tnGez24iymo12OPAVnYHccDa/+iALwjvPZibC33CKt0yCbjXkRK3hz9+WsLzF0bnMYcdrSESRPOjezfeJBp8r651q9mXOv8QtYwgpTHiO71eTWyLpEaYLemDazNAE/1QGhBfqxnEJqzlh8wb/cMVxfYGdMrLoJq5nla1asucY5w8DnPBeUygXz/J66VRSWGdW9Qv9n+QHef8vjt882LEXJ45lP6Nv61TlYtHRniNTp6ndpI4Ah25NHlW28LdXForopm0JwNNX6xHrc8EcY+Ci+E0GSRJuANdQlU39Q2hOVJ9ezqe9gAND7Ef6mktASoRTbipf5TXlfpF4c9grSJ3b6p/OpujKiUdTDguFrHnPovgXggyrYMGcd21lmIzszD3+mdX/JR+ykykI8LTNEHDfEhbs72W38o+Coc9mw4r+9wspZq4bqZuexpAkmpz2vpp3djyU6ClSebzww+/RcFMHUlNJxLTswsvXs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39840400004)(396003)(346002)(451199021)(71200400001)(53546011)(186003)(26005)(41300700001)(55016003)(6506007)(76116006)(66446008)(66556008)(83380400001)(66476007)(8936002)(64756008)(5660300002)(52536014)(8676002)(66946007)(316002)(7696005)(966005)(478600001)(110136005)(2906002)(9686003)(38100700002)(122000001)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkV1bUdjaDZ3eU1aWEZqT3lZQWRuRlhGeDVaSHlHM0RBWkpqWXRIZm8zZ20y?=
 =?utf-8?B?OEYwNUVlanNESGFaRXNtbDRzSXVxeWdmVENIUmp5TE4zODBuVFM2bDZiVlJ2?=
 =?utf-8?B?UlJIb1RDNHp4R3crTjM3eWJtaTBxYmJ4Y1preFRIUGwvUUlkanEza2g3ekx3?=
 =?utf-8?B?YTJCVVlpTmg2YkVueTZyaHlRYllRejBtbUJGV2Zlb09EZ2V0cURJazFHd3JX?=
 =?utf-8?B?SC8ralNITW9hVy9tZElxZ2JoUkFHaldxNXJxNkFRWEd3S0V3TG51aFgzZlFL?=
 =?utf-8?B?Y09yZ241WG16L091YURrMXU4am1YcXBoZFJsYVRsaG0zSHhwWVN5OUNNeGVs?=
 =?utf-8?B?KzNEeVhUSEY1TG1sMTBPRVdHc2FjbEVZUHBZaGJFR2RWaFBVenFxV0JHdThU?=
 =?utf-8?B?TjJTQlZtMEFhVlFJWkFDQVcwSUJCYmhoaWl2T3ltRXAxcXN0MkowNHlQSWFD?=
 =?utf-8?B?T0tPMVVpeThHMWdadHhUZGh6bVVKMzFpYU1mZkxiM3hPZGFzNWl5ZGZtQ3cx?=
 =?utf-8?B?WlFJTnNqVVVydDVlUENCL0hIbUR1MHVCNVNrbnZFSSs4K01QU3NZNVduRFMr?=
 =?utf-8?B?U2ZOQmdJUmVqYW94akRmZ1lxUFptaFVZdy82eDRQNmU5M0pXVWQzWUtQVFhj?=
 =?utf-8?B?TnlQWTZMWmdVaFAwSE1aSzFEQVgvRnRaQkxreitoNWMxTDlvcXRUdTZHNGV6?=
 =?utf-8?B?VEpBVU9qOGk3RmRzNHd6d1ovVjF0UDh1dGFubHlXR29zeElIZzhLNVNjUHpi?=
 =?utf-8?B?dGxuczRVWTZiOEQ5b0R3WmFDQW1jWkJIVWgxYWNkQmd5SW5LL1RsVnJVdmpl?=
 =?utf-8?B?V0V5bWhiTDlXYU9tZmZoVDJPNVFnbURFVzJhQmxOcHRaYXRUaFJJWjNJcWls?=
 =?utf-8?B?NERiUkJaUjN2ZTF0bDdhZ1V6TDJXQi9wUFVVOHQ1Yzl2OFRBTWRvbEJMdlJr?=
 =?utf-8?B?Z0RlVmp4QmtRU0cvMk9KeHB0OGQydWovVnJjM3NaYkZGV0dMa2I0UmpwaFli?=
 =?utf-8?B?Q2l2TmFsT1VwSTNNZVhVZytHZXdETkVhbkFXc2dUUEhaWFhTREs0RmxSNThs?=
 =?utf-8?B?WFo1ZEc3S0I1M0ZDMEJ6RXBDbVhuMW8wazkwNEt4cXA1S0d4VG5MeWhza1l6?=
 =?utf-8?B?S0ZIYVNPRWUwUDVLV2krbi90RThMaVVRQVdZY3ZMVTVoK3FRcG5NVjZTQ0lj?=
 =?utf-8?B?cWd1anJUOERETjY4b0F6VVJpaWRFY1JZZzF0ekdvbVhPbjMxSTBGMi9SbFkv?=
 =?utf-8?B?MVVyTTlyQ1dGNlRkRFhEZFRBK09EcDgxbWJOWGZ0bWZZZHgxdUYydzNqdnZa?=
 =?utf-8?B?cGpKMm9waytSZ3pHVlpWUHVVaWM4bkdFZlZCR1pGKzcrVmZaY2tUUG5SbFNk?=
 =?utf-8?B?cVl3T1p5YWxadVJhZnQ2ekFNWWJ3YUFHUE5TNzB2VityaEJkdkpGdnpYbHZL?=
 =?utf-8?B?NFZIVFJoS29pTHhBT2lVcW5TQlg1eUs1RWFSOTQvMm51Yi9wUFNCSFpNakZ3?=
 =?utf-8?B?Y1RBSWtPNU1YMW5WdFR3dkpYR0RyS3RiRXd3TUxEanVGSTBjTmo1cmc0UkxJ?=
 =?utf-8?B?Z3M4cFFYc3JZUlA2YjRCeWt1U0I5TWpIM0U4ZzAxOXpTR2Y2T2tGYi96RHND?=
 =?utf-8?B?UnVnOUVTQm5uem9sQ2psU01hUGw1VWhRQ2JmanVISFcwd1MzSVExazllVTd6?=
 =?utf-8?B?QVQzS25JWHBrUjR6U0NsR0d6KzRrRGpKNlpNY0oxN0ZBYi9oQ3dPQW0vM2Er?=
 =?utf-8?B?aHY5aXplQzMvTW1YNndrTGhpUVQzS0YrOGF6a3dvZnY5VXExdERDc3JaWERw?=
 =?utf-8?B?YXZFT0ZUc2owTlgxNEd3NENKeG1GWG5TU0xUdU1QZ2IwTFVZaGNHQ2kyWGl1?=
 =?utf-8?B?UDk4am9aazI5VEQvVGFCK0NTVjJTRU95RVhNSXlKY2VvUENWVWVab3RlOE8r?=
 =?utf-8?B?SlJ2cnJpTG5LV1J4UHd5dTY0N3lGR3lMTVdwNmNQQ1I3QUlSd25tUDlHeHda?=
 =?utf-8?B?VzlXNzNlY3ZuNnpOSk53emg3dUlDUGNaYUVsMGZBTTRhNmYyTUl1MjEzNnBq?=
 =?utf-8?B?bkZPQXpNclhDZm5qV2w5ZHhtMzZJbk4vdWR4UUtwcWJ4SWpud0tmdE4ySXhR?=
 =?utf-8?Q?9Zp4LVO1xOcWfNsLWubbyRiNi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56025446-d7db-40bc-bfca-08db916bc013
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 02:13:37.2968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lx1RO40F88b7+rlQYQ6JQkKPHGbunujKXRbwOJ76u5MG0wn5WjCsdl61aiAEuZ7YgvRveI9oWrjCViLJ/UlaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
X-Proofpoint-ORIG-GUID: Pl6mitvNv1-SSEMenuDWA6L_vFX7lAr6
X-Proofpoint-GUID: Hn7cwlzTYrHFp4Ed-ynBK8RdYKDiB4-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307310019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 02:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185115

R290IGl0LiBJJ2xsIGNoZWNrIHRoaXMgZmFpbHVyZS4NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBTYXR1cmRheSwgSnVseSAyOSwgMjAyMyA2
OjA4IEFNDQpUbzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFU
Q0hdIG11bHRpbGliLmNvbmY6IGV4cGxpY2l0bHkgbWFrZSBNVUxUSUxJQl9WQVJJQU5UUyB2YXJk
ZXBzIG9uIE1VTFRJTElCUw0KDQpPbiBUaHUsIDIwMjMtMDctMjcgYXQgMTQ6MTUgKzA4MDAsIENo
ZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCndyb3RlOg0KPiBGcm9tOiBDaGVuIFFp
IDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBUaGlzIHBhdGNoIGlzIHRvIGVuc3VyZSBy
ZWNpcGVzIGdldCByZWJ1aWx0IGNvcnJlY3RseSBhbmQgYXZvaWQgDQo+IGluY29ycmVjdCBzc3Rh
dGUgY2FjaGUgcmV1c2Ugd2hlbiB0b2dnbGluZyBtdWx0aWxpYi4NCj4gDQo+IFRoZSBmb2xsb3dp
bmcgc3RlcHMgc2hvdyBvbmUgZXhhbXBsZSBvZiBzdWNoIGluY29ycmVjdCBzc3RhdGUgY2FjaGUg
cmV1c2UuDQo+IDEuIGVuYWJsZSBtdWx0aWxpYiAmJiBiaXRiYWtlIDxzb21lX2ltYWdlPiAtYyBw
b3B1bGF0ZV9zZGsgMi4gZGlzYWJsZSANCj4gbXVsdGlsaWIgJiYgYml0YmFrZSA8c29tZV9pbWFn
ZT4gLWMgcG9wdWxhdGVfc2RrDQo+IA0KPiBUaGUgZXJyb3IgbWVzc2FnZSBpcyBhcyBiZWxvdzoN
Cj4gRXJyb3I6DQo+ICBQcm9ibGVtOiBjb25mbGljdGluZyByZXF1ZXN0cw0KPiAgICAtIG5vdGhp
bmcgcHJvdmlkZXMgYmludXRpbHMtY3Jvc3MtY2FuYWRpYW4taTY4NiBuZWVkZWQgYnkgcGFja2Fn
ZWdyb3VwLWNyb3NzLWNhbmFkaWFuLWludGVsLXg4Ni02NC0xLjAtcjAueDg2XzY0X25hdGl2ZXNk
aw0KPiAgICAtIG5vdGhpbmcgcHJvdmlkZXMgZ2NjLWNyb3NzLWNhbmFkaWFuLWk2ODYgbmVlZGVk
IGJ5IHBhY2thZ2Vncm91cC1jcm9zcy1jYW5hZGlhbi1pbnRlbC14ODYtNjQtMS4wLXIwLng4Nl82
NF9uYXRpdmVzZGsNCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIGdkYi1jcm9zcy1jYW5hZGlhbi1p
Njg2IG5lZWRlZCBieSANCj4gcGFja2FnZWdyb3VwLWNyb3NzLWNhbmFkaWFuLWludGVsLXg4Ni02
NC0xLjAtcjAueDg2XzY0X25hdGl2ZXNkaw0KPiAgKHRyeSB0byBhZGQgJy0tc2tpcC1icm9rZW4n
IHRvIHNraXAgdW5pbnN0YWxsYWJsZSBwYWNrYWdlcykNCj4gDQo+IFdlIGdldCB0aGlzIGVycm9y
IGJlY2F1c2UgcGFja2FnZWdyb3VwLWNyb3NzLWNhbmFkaWFuIHJlY2lwZSBpcyBub3QgDQo+IHJl
YnVpbHQgd2hlbiBpdCBzaG91bGQgYmUuDQo+IA0KPiBDdXJyZW50IGNvZGVzIGhhdmUgdHJhY2tl
ZCB0aGUgZGVwZW5kZW5jeSB0byBNVUxUSUxJQl9WQVJJQU5UUywgYXMgDQo+IHNob3duIGluIHRo
ZSBmb2xsb3dpbmcgY2hhaW46DQo+IFJERVBFTkRTOnBhY2thZ2Vncm91cC1jcm9zcy1jYW5hZGlh
bi1pbnRlbC14ODYtNjQgLT4gDQo+IGFsbF9tdWx0aWxpYl90dW5lX3ZhbHVlcyAtPiBNVUxUSUxJ
Ql9WQVJJQU5UUy4NCj4gDQo+IEhvd2V2ZXIsIE1VTFRJTElCX1ZBUklBTlRTIGNhbm5vdCBhdXRv
bWF0aWNhbGx5IGRlcGVuZCBvbiBNVUxUSUxJQlMuDQo+IFNlZSBzb21lIHJlc3VsdHMgZnJvbSAn
Yml0YmFrZS1kdW1wc2lncycgYmVsb3c6DQo+IExpc3Qgb2YgZGVwZW5kZW5jaWVzIGZvciB2YXJp
YWJsZSBNVUxUSUxJQl9WQVJJQU5UUyBpcyANCj4gWydleHRlbmRfdmFyaWFudHMnXSBWYXJpYWJs
ZSBNVUxUSUxJQl9WQVJJQU5UUyB2YWx1ZSBpcyANCj4gJHtAZXh0ZW5kX3ZhcmlhbnRzKGQsJ01V
TFRJTElCUycsJ211bHRpbGliJyl9DQo+IA0KPiBJdCdzIG9idmlvdXMgdGhhdCB0aGUgdmFsdWUg
b2YgTVVMVElMSUJfVkFSSUFOVFMgZGVwZW5kIG9uIHRoZSB2YWx1ZSANCj4gb2YgTVVMVElMSUJT
LCBzbyBsZXQncyBzZXQgdGhpcyBkZXBlbmRlbmN5IG1hbnVhbGx5Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIG1ldGEvY29u
Zi9tdWx0aWxpYi5jb25mIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2NvbmYvbXVsdGlsaWIuY29uZiBiL21ldGEvY29uZi9t
dWx0aWxpYi5jb25mIGluZGV4IA0KPiA3ZjNiOTQ2M2VmLi5lZjM2MDVhNzNkIDEwMDY0NA0KPiAt
LS0gYS9tZXRhL2NvbmYvbXVsdGlsaWIuY29uZg0KPiArKysgYi9tZXRhL2NvbmYvbXVsdGlsaWIu
Y29uZg0KPiBAQCAtMiw2ICsyLDcgQEANCj4gIGJhc2VsaWIgPSAiJHtAZC5nZXRWYXIoJ0JBU0Vf
TElCOnR1bmUtJyArIChkLmdldFZhcignREVGQVVMVFRVTkUnKSBvciAnSU5WQUxJRCcpKSBvciBk
LmdldFZhcignQkFTRUxJQicpfSINCj4gIA0KPiAgTVVMVElMSUJfVkFSSUFOVFMgPSAiJHtAZXh0
ZW5kX3ZhcmlhbnRzKGQsJ01VTFRJTElCUycsJ211bHRpbGliJyl9Ig0KPiArTVVMVElMSUJfVkFS
SUFOVFNbdmFyZGVwc10gKz0gIk1VTFRJTElCUyINCj4gIE1VTFRJTElCX1NBVkVfVkFSTkFNRSA9
ICJERUZBVUxUVFVORSBUQVJHRVRfQVJDSCBUQVJHRVRfU1lTIFRBUkdFVF9WRU5ET1IiDQo+ICAN
Cj4gIE1VTFRJTElCUyA/Pz0gIm11bHRpbGliOmxpYjMyIg0KDQpJIHN1c3BlY3QgdGhpcyByZXN1
bHRlZCBpbiB0aGlzIHNlbGZ0ZXN0IGZhaWx1cmU6DQoNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNzkvYnVpbGRzLzU1MzQvc3RlcHMvMTUv
bG9ncy9zdGRpbw0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==

