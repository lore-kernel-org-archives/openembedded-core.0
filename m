Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FE3C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 20:50:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30362.1656622231768984895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 13:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dNuWk9Tz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4180e694f3=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25UIPPfB020204
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 13:50:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=dHPdWPb8ICsagWtPzoSLAdT0iLT86ta2+WEQbDuMifU=;
 b=dNuWk9TziDJSgVUTOUOcot4mGeNqZvGKF8L9HC+yAiNXW+O0P1FML0z6gYVkpp0PxvKB
 i2M5wp1F0X9/ah8+SJUBlvx131u7sQmybRr4BFS+vGpZ99PFe8GSr9wXrefDRnhWTafJ
 +IBM6ceoVtAVmoCa26D4BQdaZtvgDRKUqlJPXnXSieIuCAXfA58rEYc5/WB8K7X1722m
 BOReesWd8r2gGZspmocSpnOrUZOdfAloBCV87Tj98hG/wVrgSQpeeDglK508eEpDge1W
 kwykzNzZ+9S0Tj6ZF3NlgdhxAhszqOxFNojNtUjEoESg5UVFEPFsPyJQ1BarKxu3x/5F ag==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwwn4cb0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 13:50:30 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25UKm5to031554
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 13:50:30 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwwn4cb0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 13:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5p5A+3Sn8L8sTNGDS4eM8KCrTY/aDJVwE94j5ohe91fKoRcLxgxwH8wmUrrVIZalqZ7mNlRe0/oRGgQJoZg1aLRj16aXh6B9o5oZMvoTiZOaD/4ZyHHpmCV/g+wZcrx8CCg2jCoe9/LSyOldF0i1gVWxXHbpdDjPGB5TnSb4Whdtb6+PgGhfOiEwc8g7RRfwGSoUtaukZ1XsmU3PkGvLUmRlVG6YT2Vnw08VJ2cBPqdKdp44CbOK2cQYKA3ZpTk0KiEDR6gUfP7vDNCkhZdBG051ufMm1+bFrNH51uKCxQ7WxDxU8H1rDSuP8qxGXog0hY3B6Nb5dXu/jt4tgTjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHPdWPb8ICsagWtPzoSLAdT0iLT86ta2+WEQbDuMifU=;
 b=N1XhhDUBwHBSZqrSnmy2oLyUTjBGUmKw5uzULZDGt/4J+Eyvzy0Lw4x177NOhH0QuXRhrMaG7NugI+Eq1MUiETjLJoNnytpIRIJyTJhvfYmJ22Zv5rPw9SrnFK1VhX1lahZ8zQNb/23ZGejTjuEGbptk566dZcziCSJ+pZSvVooG/HFOMfu84GTsgKde14vRwW0JsZJYcL4v1PfKzNp8KBELShpDx8RxFi0rBF5KTfPoe6ZQuhGP5vJ9ooTi1spVKJCbqGeZ4vSZTiMp5NgwnXqNVDrk3s0Ib7n+5OW3z+rlgQdu4Yjtp8NYSMLt6RGUTZ0bJD2QjD+Rj0SU8wWcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 20:50:28 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 20:50:28 +0000
From: "Gupta, Aryaman" <Aryaman.Gupta@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] runqueue: add cpu/io pressure regulation
Thread-Topic: [OE-core] [PATCH] runqueue: add cpu/io pressure regulation
Thread-Index: AQHYi/RGTRvKDAVBxEedFjobqvMkJq1ntpCAgACyAvA=
Date: Thu, 30 Jun 2022 20:50:28 +0000
Message-ID: 
 <PH7PR11MB60302DE19EF77B6C29DAAB8BEBBA9@PH7PR11MB6030.namprd11.prod.outlook.com>
References: <20220629201016.1948793-1-aryaman.gupta@windriver.com>
 <566a77ac43e2ee7d4bb3204a0290fd6dedd3713c.camel@linuxfoundation.org>
In-Reply-To: 
 <566a77ac43e2ee7d4bb3204a0290fd6dedd3713c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a58b5a68-629a-48ac-bdda-08da5ada2a04
x-ms-traffictypediagnostic: DM6PR11MB4721:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iCcq45JF4V8RHiNczvO5phdmh7IvkfxjpgWRBiS6dRNcxnxmftci9ar320suoXuvAq0PLDIXBWyfrCbGtOKX8xxoKTNKk5GmY3MJ0RWWn6Cswkj7tNuEE150b2NFhiQIAdivxEZ8oRkvLuGdOrZnRCorPS8ZIdszInes849HRdVkB8QkjQPtqrNaHEl5rzFDWrxTiTTqK5ilnjAL+0F8qyv9kCHBeF5vRQeoHG2Ml+ws/T8fSYnR1QaRRLx9SoYgmYELxAgH8IRbxsjH4C7eLSYVh9iJ7rNY3rq8DW9/wO5vOuBkoZmNAHTMWyl8sIxbgbfnFzpSQyG4JyFQSqb+IYYJn8NwtNgyifTim91NcwwTSlW+rMlWtydejERxVCk6EmUpCbQnYDGPfrY/x0z8vLk3zUF5R+BmH3HjF6HN0zthwSQbwea0lvr/umxhaCLmNA3qqkDisXHiB0Qjkea73vyNtBdjUGSSz/MThVHROlxj17M16LwFkmqAQE4xMLjXIGS4Md3HKsCK7+gfmh09kG4SdluClUnt3ainOLo7JSgbCrZNE7awTlde0QokfLHdNszgk70O9Y1Myhjx+FeNT1UqinzRIpIrJGgMr6rqy4pO39fGwl2c6pyHY+gmZOQtVBmBL+iH6B6Nb5l4hvXYFepv18/+mtRzZ4WCXptmbiCzk6EdNdtTtEAtZ4JE58iLs7wwwU6wGj5ht+EkXrrSlgQ7aVUHL/hOEO0/vRCn/Tx/c0OQ5aSMbETk4mEfTaL0vN/jVlasIVfVgTSDXIwYurSllsjR5G0cnYAqpLqkgTXEguqFk/vv1qWcl1EA4fzO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39850400004)(376002)(136003)(110136005)(66556008)(478600001)(38070700005)(316002)(76116006)(86362001)(33656002)(122000001)(38100700002)(71200400001)(41300700001)(66446008)(83380400001)(55016003)(7696005)(6506007)(9686003)(26005)(2906002)(5660300002)(66946007)(186003)(52536014)(66476007)(64756008)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eWNiajFvRFpzd2tKalN6SWQyVzllaEUvQlFBZGpmY3JiS1ZEQ3hoMm1QS3Ba?=
 =?utf-8?B?aVJLYUtDZmNHUFBwVkRaVVN2L1lHYlB6MXhSMlRNQ1YwUzVFUGZGN1JxRFNX?=
 =?utf-8?B?YkZyTzBBeTNJRStvMWFmbHpkejZnRnhyVWNIL0N4Q3JyTyt3S3E3VXUvMTI4?=
 =?utf-8?B?R2dWWURSbHJ3M25oSW1MbXA4aUNnZDhRQUoweVVkVVhuaHJzbGlCMlFqMWRX?=
 =?utf-8?B?Q1I2aEoyRzNaWEx0bFNoODZHZjZBU29LcWtOUkdWaW9QL2NDWlFpQ295b3Z3?=
 =?utf-8?B?djFNNTlvb1YwR25Pd1FzM1RCUGVOdzJodHA5ZUdWeWxMeUpRdmpqQlhvMncx?=
 =?utf-8?B?OXFlNXJxTGp0OFZHQ0w1dUh1S0N0RFcxOGxwWkpuOXNTY1MzZHF1bDRKbTMx?=
 =?utf-8?B?VUtZKzEyUGpxNm5yMVlPSFpwcDlLTDF3VWtuNVVJT2tyb3JOS0VhOUJISnNU?=
 =?utf-8?B?UjZITGJhYVRCUnpBdk9JWHF6Z0pzVkxYTngzZkJhdHE1NHlNRGdISkkyaVBX?=
 =?utf-8?B?bTc2SHVsZ3EySnRSbnYyWEtLRUE5SUFCUXh4YkY5ZisvRFlzb2RWSDQxRGt0?=
 =?utf-8?B?VHJvSDNjSS9yZ0RpUkJuWmNFRXVBV05pRkMxNVVCdFg5WG5FU2c3REh0cFRU?=
 =?utf-8?B?TkxWOHVkRWJyaDhGbm5OM2sybXBiS0gvM0Jxbmk3dnQ5UFZYZWJYRzd1R21C?=
 =?utf-8?B?Z0hqNlU0Z21ONVRHSTBZS0dXNFplYzhoUHA2Rm5oNEJEdVd5eTExSVJlbUFL?=
 =?utf-8?B?UXpTN2RDclMrYUZ0Z0xLWnRxRUh2TVlOa3VCZTZBaktaY1VsODl2TU94dzFO?=
 =?utf-8?B?QjIxNXhFWm5YSjR4SElYRDZSQnBGdUhuRjVvT2JnTTdPNkVnTlM1SWFPUHlF?=
 =?utf-8?B?UmtxMzBOK2d4VW5OZGZzY3Y3L1p1d3FpaUdFWGx5R3ErSEs1cUI1QWZYSEw0?=
 =?utf-8?B?RXZ3TVNMWGRWK0FndXhyV0piLzBHQWJ1bkZQaWpndnJibExEOTc3WFdubzh6?=
 =?utf-8?B?TmlzZWlqNnkwOVZKdTd2UXRrdHIwd2ppYy9MSzJKcUdoUTUrS3k4WGNzV0E3?=
 =?utf-8?B?NVJJTUZ5TVVRM3pYWjRVYys5ZU5QVWVkRjErcFNXdktpUTEzSlZTbVZHS3Qz?=
 =?utf-8?B?UmFOclNmVzNVOUtIdWVtanFhYWo4QXJKeW56VnFtelY0TDE5SGtUckpvaU4w?=
 =?utf-8?B?ZFRFTkpsR2JCN2NiRVVMNkllZlFQdnc1U3lxMkhGSi9DZnZKRm44dVREcUJV?=
 =?utf-8?B?RG0xb0haeGVNWUJEZFN6Q1BTMTlZUUJCY0tZdFl1M0s2VTduUmU3dVhjcEpr?=
 =?utf-8?B?MVgxM1pEYVc3aXY1L3dnUnh5WTYveDVxM3drVDZkLzVoMVM5YU56UFprZyt5?=
 =?utf-8?B?YXI4NXZYc2JXZlppN1JucXRuZU9rWTU4ZGhISkg2S2xzSjRaS3M3MDN5alFD?=
 =?utf-8?B?NnBJTCt2QU8xM3dHSXBLNXJ0d1VxeUJzVnoxSFVWaEM3Z0lmY0dSVFFVYkht?=
 =?utf-8?B?SUlReVVpRitIWUFjbUl6S2M1amRoMVdhRTF1bkMrcGk0a0wwT1p3am9vS2hT?=
 =?utf-8?B?OHlUTGM1dmpEOVQ1MTlEUm9zLy92U0V1a0NWNHFaTGY4Qk9PU2pGcUJXZGNW?=
 =?utf-8?B?Z3Y4V1JzNjRpSEZMaXc3UlBRR2RkTjRhYVI3OHZRWHBleGExV2JOT2YvQWhz?=
 =?utf-8?B?MEFtMUxtMUtRcTFuVThtbmVIV0haQW43R1JINUZlbENEUExENithSUFsS2ZX?=
 =?utf-8?B?N2VtaTJjMFJmdXpjdGZtSjdxc3VkbkNnYk15VGhSNlhEYkVwTEpmbWMwRHdy?=
 =?utf-8?B?RmJXeHdQNEg2YzcyYjJEMFpYUW5pTlhEblJTU2NHMnZLTzZTbFdJQ2tXdHZz?=
 =?utf-8?B?ZXBNVGNFQU1STEh4ZDVSNlpLbnN1UnZRUFNEalE0akpWdldIa2JWcnNnWTRt?=
 =?utf-8?B?MkJZVzk0eFZObGZJQmZubWFyRTRJR291QWNVVXpITmJPRUF5V25ydVZlK3hn?=
 =?utf-8?B?RjYrTXdKWmh0YkJUMTczQjR0YkhIRGdQQ05PcnZ6c1QvdEFVcmZmWk9YLzZF?=
 =?utf-8?B?dFUxYjc1VFlibmNpY0Eya3RFSnVUdFUxY3NVa2tXK0lkMGU4UmNkdCsrTkN4?=
 =?utf-8?B?TEtndE00aU5jcTFGd0pIQmxVcERZLzZqRTFOVXVpL1Bsd0JxQk95MHdGZXE2?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a58b5a68-629a-48ac-bdda-08da5ada2a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 20:50:28.0202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 XuyhH9+NsHkMTJ5zGT40aE11uzPdYkHZFPJ7bQlELytVWbAyDDsSZOowstHCMBZdK7bzPtXwIlF3Y4OOyN/8go9EHeJuNhbXb+Ec9lw2bEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
X-Proofpoint-ORIG-GUID: KZwrC1fTmOuWDdxInE666Ac82VtjJeXP
X-Proofpoint-GUID: 4s8RmXhc0G5SkdtqRsl4Y2XF_T3iFqlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 20:50:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167444

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPlNlbnQ6IFRodXJzZGF5LCBKdW5l
IDMwLCAyMDIyIDU6NTMgQU0NCj5UbzogR3VwdGEsIEFyeWFtYW4gPEFyeWFtYW4uR3VwdGFAd2lu
ZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC0NCj5jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj5TdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcnVucXVldWU6IGFkZCBjcHUvaW8gcHJl
c3N1cmUgcmVndWxhdGlvbg0KPg0KPltQbGVhc2Ugbm90ZTogVGhpcyBlLW1haWwgaXMgZnJvbSBh
biBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10NCj4NCj5PbiBXZWQsIDIwMjItMDYtMjkgYXQgMTY6
MTAgLTA0MDAsIEFyeWFtYW4gR3VwdGEgd3JvdGU6DQo+PiBTdG9wIHRoZSBzY2hlZHVsZXIgZnJv
bSBzdGFydGluZyBuZXcgdGFza3MgaWYgdGhlIGN1cnJlbnQgY3B1IG9yIGlvDQo+PiBwcmVzc3Vy
ZSBpcyBhYm92ZSBhIGNlcnRhaW4gdGhyZXNob2xkLCBzcGVjaWZpZWQgdGhyb3VnaCB0aGUNCj4+
ICJCQl9NQVhfe0NQVXxJT31fU09NRV9QUkVTU1VSRSIgdmFyaWFibGVzIGluIGNvbmYvbG9jYWwu
Y29uZi4NCj4+DQo+PiBJZiB0aGUgdGhyZXNob2xkcyBhcmVuJ3Qgc3BlY2lmaWVkLCB0aGUgZGVm
YXVsdCB2YWx1ZXMgYXJlIDEwMCBmb3INCj4+IGJvdGggQ1BVIGFuZCBJTywgd2hpY2ggd2lsbCBo
YXZlIG5vIGltcGFjdCBvbiBidWlsZCB0aW1lcy4NCj4+IEFyYml0YXJ5IGxvd2VyIGxpbWl0IG9m
IDEuMCByZXN1bHRzIGluIGEgZmF0YWwgZXJyb3IgdG8gYXZvaWQNCj4+IGV4dHJlbWVseSBsb25n
IGJ1aWxkcy4gSWYgdGhlIHBlcmNlbnRhZ2UgbGltaXRzIGFyZSBoaWdoZXIgdGhhbiAxMDAsDQo+
PiB0aGVuIHRoZSBkZWZhdWx0IHZhbHVlcyBhcmUgdXNlZCBhbmQgd2FybmluZ3MgYXJlIGlzc3Vl
ZCB0byBpbmZvcm0NCj4+IHVzZXJzIHRoYXQgdGhlIHNwZWNpZmllZCBsaW1pdCBpcyBvdXQgb2Yg
Ym91bmRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFyeWFtYW4gR3VwdGEgPGFyeWFtYW4uZ3Vw
dGFAd2luZHJpdmVyLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IE1hY2xlb2QgPHJhbmR5
Lm1hY2xlb2RAd2luZHJpdmVyLmNvbT4NCj4+IC0tLQ0KPj4gIGJpdGJha2UvbGliL2JiL3J1bnF1
ZXVlLnB5IHwgMzkNCj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykNCj4NCj5UaGlzIGxvb2tzIGxpa2Ug
YSBnb29kIHN0YXJ0LCB0aGFua3MuIFRoZXJlIGFyZSBhIGZldyB0aGluZ3Mgd2hpY2ggd2lsbCBu
ZWVkDQo+Y2xlYW5pbmcgdXAgaW4gaGVyZSBhcyB0aGlzIGlzIHByZXR0eSBwZXJmb3JtYW5jZSBz
ZW5zaXRpdmUgY29kZSAodHJ5IGEgInRpbWUNCj5iaXRiYWtlIHdvcmxkIC1uIiB0byBzZWUgd2hh
dCBJIG1lYW4pLg0KPg0KPkZpcnN0bHksIGl0IGlzIGEgYml0YmFrZSBwYXRjaCBzbyBzaG91bGQg
cmVhbGx5IGdvIHRvIHRoZSBiaXRiYWtlIG1haWxpbmcgbGlzdCwgbm90IE9FLQ0KPkNvcmUuDQo+
DQoNClJpZ2h0LCB3aWxsIGRvIQ0KDQo+PiBkaWZmIC0tZ2l0IGEvYml0YmFrZS9saWIvYmIvcnVu
cXVldWUucHkgYi9iaXRiYWtlL2xpYi9iYi9ydW5xdWV1ZS5weQ0KPj4gaW5kZXggMWU0N2ZlNzBl
Zi4uOTY2N2FjYzExYyAxMDA2NDQNCj4+IC0tLSBhL2JpdGJha2UvbGliL2JiL3J1bnF1ZXVlLnB5
DQo+PiArKysgYi9iaXRiYWtlL2xpYi9iYi9ydW5xdWV1ZS5weQ0KPj4gQEAgLTE1OSw2ICsxNTks
MjcgQEAgY2xhc3MgUnVuUXVldWVTY2hlZHVsZXIob2JqZWN0KToNCj4+ICAgICAgICAgICAgICAg
ICAgc2VsZi5idWlsZGFibGUuYXBwZW5kKHRpZCkNCj4+DQo+PiAgICAgICAgICBzZWxmLnJldl9w
cmlvX21hcCA9IE5vbmUNCj4+ICsgICAgICAgICMgU29tZSBob3N0cyBsaWtlIG9wZW5TVVNFIGhh
dmUgcmVhZGFibGUgL3Byb2MvcHJlc3N1cmUgZmlsZXMNCj4+ICsgICAgICAgICMgYnV0IHRocm93
IGVycm9ycyB3aGVuIHRoZXNlIGZpbGVzIGFyZSBvcGVuZWQuDQo+PiArICAgICAgICB0cnk6DQo+
PiArICAgICAgICAgICAgc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoWyJjYXQiLCAiL3Byb2MvcHJl
c3N1cmUvY3B1IiwNCj4iL3Byb2MvcHJlc3N1cmUvaW8iXSwgXA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuaXZlcnNhbF9uZXdsaW5lcz1UcnVlLCBzdGRlcnI9c3Vi
cHJvY2Vzcy5ERVZOVUxMKQ0KPj4gKyAgICAgICAgICAgIHNlbGYucmVhZGFibGVfcHJlc3N1cmVf
ZmlsZXMgPSBUcnVlDQo+Pg0KPj4gICAgICAgICBleGNlcHQ6DQo+PiArICAgICAgICAgICAgaWYg
c2VsZi5ycS5tYXhfY3B1X3ByZXNzdXJlIT0xMDAgb3Igc2VsZi5ycS5tYXhfaW9fcHJlc3N1cmUh
PTEwMDoNCj4+ICsgICAgICAgICAgICAgICAgYmIud2FybigiVGhlIC9wcm9jL3ByZXNzdXJlIGZp
bGVzIGNhbid0IGJlIHJlYWQuIENvbnRpbnVpbmcgYnVpbGQNCj53aXRob3V0IG1vbml0b3Jpbmcg
cHJlc3N1cmUiKQ0KPj4gKyAgICAgICAgICAgIHNlbGYucmVhZGFibGVfcHJlc3N1cmVfZmlsZXMg
PSBGYWxzZQ0KPj4gKw0KPj4gKyAgICBkZWYgZXhjZWVkc19tYXhfcHJlc3N1cmUoc2VsZik6DQo+
PiArICAgICAgICBpZiBzZWxmLnJlYWRhYmxlX3ByZXNzdXJlX2ZpbGVzOg0KPj4gKyAgICAgICAg
ICAgICMgZXh0cmFjdCBhdmcxMCBmcm9tIC9wcm9jL3ByZXNzdXJlL3tjcHV8aW99DQo+PiArICAg
ICAgICAgICAgY3Vycl9wcmVzc3VyZV9zYW1wbGUgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChb
ImNhdCIsDQo+Ii9wcm9jL3ByZXNzdXJlL2NwdSIsICIvcHJvYy9wcmVzc3VyZS9pbyJdLCBcDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bml2ZXJzYWxfbmV3bGluZXM9
VHJ1ZSwgc3RkZXJyPXN1YnByb2Nlc3MuREVWTlVMTCkNCj4+ICsgICAgICAgICAgICBjdXJyX2Nw
dV9wcmVzc3VyZSA9DQo+Y3Vycl9wcmVzc3VyZV9zYW1wbGUuc3BsaXQoJ1xuJylbMF0uc3BsaXQo
KVsxXS5zcGxpdCgiPSIpWzFdDQo+PiArICAgICAgICAgICAgY3Vycl9pb19wcmVzc3VyZSA9DQo+
PiArIGN1cnJfcHJlc3N1cmVfc2FtcGxlLnNwbGl0KCdcbicpWzJdLnNwbGl0KClbMV0uc3BsaXQo
Ij0iKVsxXQ0KPg0KPlRoaXMgaXMgaG9ycmlibGUsIHlvdSdyZSBhZGRpbmcgaW4gYSBmb3JrKCkg
Y2FsbCBmb3IgZXZlcnkgcGFzcyB0aHJvdWdoIHRoZQ0KPnNjaGVkdWxlciBjb2RlLiBZb3UgY2Fu
IGp1c3Qgb3BlbigpIGFuZCByZWFkIHRoZSBmaWxlIGluc3RlYWQgd2hpY2ggd2lsbCBoYXZlDQo+
Km11Y2gqIGxvd2VyIG92ZXJoZWFkLg0KDQpPaCB5b3UncmUgcmlnaHQuIFJhbmR5IGFuZCBJIHRl
c3RlZCB0aGlzIGFuZCB0dXJucyBvdXQgc3VicHJvY2VzcyBpcyBzaWduaWZpY2FudGx5IHNsb3dl
ci4NCldlIGFsc28gbG9va2VkIGF0IGFub3RoZXIgbGV2ZWwgb2Ygb3B0aW1pemF0aW9uIHdoZXJl
IHlvdSBvcGVuKCkgb25jZSBhbmQgcmUtdXNlIHRoZSBmaWxlIGRlc2NyaXB0b3IsIA0Kc2ltaWxh
ciB0byB3aGF0J3MgZG9uZSBpbiBidWlsZHN0YXRzLiBXaGlsZSB0aGlzIGlzIGZhc3RlciwgdGhl
IGFic29sdXRlIHRpbWUgdG8gcnVuIHRoZSBjb2RlIGlzIGFyb3VuZCAxIG9yIDMNCm1pY3Jvc2Vj
b25kcy4gR2l2ZW4gdGhlIGFkZGVkIGNvbXBsZXhpdHkgdG8gdGhlIGNvZGUsIHRoZSBvcHRpbWl6
YXRpb24gZG9lcyBub3Qgc2VlbSB3b3J0aHdoaWxlLg0KSSdsbCByZW1vdmUgdGhlIHN1YnByb2Nl
c3MoKSBjYWxsIGluIHYyLg0KDQo+DQo+RXZlbiB0aGVuLCBJJ20gbm90IHBhcnRpY3VsYXJseSB0
aHJpbGxlZCB0byBoYXZlIHRoaXMgbGV2ZWwgb2Ygb3ZlcmhlYWQgaW4gdGhpcw0KPmNvZGVwYXRo
LCBpbiBzb21lIHdheXMgSSdkIHByZWZlciB0byByYXRlIGxpbWl0IGhvdyBvZnRlbiB3ZSdyZSBs
b29raW5nIHVwIHRoaXMNCj52YWx1ZSByYXRoZXIgdGhhbiBvbmNlIHBlciBwYXNzIHRocm91Z2gg
dGhlIHNjaGVkdWxlciBwYXRoLiBJJ20gY3VyaW91cyB3aGF0DQo+dGhlIHRpbWluZ3Mgc2F5Lg0K
Pg0KV2Ugd3JvdGUgdGhpcyBzaW1wbGUgdGVzdCBjb2RlOg0KaW1wb3J0IHRpbWVpdCwgc3VicHJv
Y2Vzcw0KZmlsZSA9ICIvcHJvYy9wcmVzc3VyZS9jcHUiDQoNCmRlZiB0ZXN0X3N1YnByb2Nlc3Mo
KToNCiAgICBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChbImNhdCIsIGZpbGVdKQ0KDQp0ZXN0MSA9
IG9wZW4oZmlsZSkNCmRlZiB0ZXN0X3NlZWsoKToNCiAgICB0ZXN0MS5zZWVrKDApDQogICAgdGVz
dDEucmVhZCgpDQoNCmRlZiB0ZXN0X29wZW5yZWFkKCk6DQogICAgd2l0aCBvcGVuKGZpbGUpIGFz
IHRlc3Q6DQogICAgICAgIHRlc3QucmVhZCgpDQogICAgICAgIGNoZWNrX3ZhciA9IDErMQ0KDQpy
ZXBlYXQgPSAxMDAwDQojcHJpbnQoIlNVQlBST0NFU1M6ICVzICIgJSB0aW1laXQuVGltZXIodGVz
dF9zdWJwcm9jZXNzKS50aW1laXQobnVtYmVyPXJlcGVhdCkpDQpwcmludCgiU0VFSzogJXMgIiAl
IHRpbWVpdC5UaW1lcih0ZXN0X3NlZWspLnRpbWVpdChudW1iZXI9cmVwZWF0KSkNCnByaW50KCJP
UEVOIEFORCBSRUFEOiAlcyAiICUgdGltZWl0LlRpbWVyKHRlc3Rfb3BlbnJlYWQpLnRpbWVpdChu
dW1iZXI9cmVwZWF0KSkNCg0KUnVubmluZyB0aGlzIHdpdGggcHl0aG9uIHRlc3QucHkgZ2F2ZToN
ClNFRUs6IDAuMDEyNjk1OTg0OTczMTA2NTMzIA0KT1BFTiBBTkQgUkVBRDogMC4wMzY5NjQ3MzE5
ODk0Mjg0DQoNCllvdSBjYW4gc2VlIHRoYXQgdGhpcyBpcyBhYm91dCAzeCBmYXN0ZXIgYnV0IG9u
bHkgYSBjb3VwbGUgb2YgbWljcm9zZWNvbmRzIGluIGFic29sdXRlIHRlcm1zLg0KRG8geW91IHRo
aW5rIHRoYXQncyBhIHJlYXNvbmFibGUgb3ZlcmhlYWQ/DQoNCj4+ICsNCj4+ICsgICAgICAgICAg
ICByZXR1cm4gZmxvYXQoY3Vycl9jcHVfcHJlc3N1cmUpID4gc2VsZi5ycS5tYXhfY3B1X3ByZXNz
dXJlIG9yDQo+ZmxvYXQoY3Vycl9pb19wcmVzc3VyZSkgPiBzZWxmLnJxLm1heF9pb19wcmVzc3Vy
ZQ0KPj4gKyAgICAgICAgcmV0dXJuIEZhbHNlDQo+Pg0KPj4gICAgICBkZWYgbmV4dF9idWlsZGFi
bGVfdGFzayhzZWxmKToNCj4+ICAgICAgICAgICIiIg0KPj4gQEAgLTE3MSw2ICsxOTIsOCBAQCBj
bGFzcyBSdW5RdWV1ZVNjaGVkdWxlcihvYmplY3QpOg0KPj4gICAgICAgICAgYnVpbGRhYmxlLmlu
dGVyc2VjdGlvbl91cGRhdGUoc2VsZi5ycS50YXNrc19jb3ZlcmVkIHwNCj5zZWxmLnJxLnRhc2tz
X25vdGNvdmVyZWQpDQo+PiAgICAgICAgICBpZiBub3QgYnVpbGRhYmxlOg0KPj4gICAgICAgICAg
ICAgIHJldHVybiBOb25lDQo+PiArICAgICAgICBpZiBzZWxmLmV4Y2VlZHNfbWF4X3ByZXNzdXJl
KCk6DQo+PiArICAgICAgICAgICAgcmV0dXJuIE5vbmUNCj4+DQo+PiAgICAgICAgICAjIEZpbHRl
ciBvdXQgdGFza3MgdGhhdCBoYXZlIGEgbWF4IG51bWJlciBvZiB0aHJlYWRzIHRoYXQgaGF2ZSBi
ZWVuDQo+ZXhjZWVkZWQNCj4+ICAgICAgICAgIHNraXBfYnVpbGRhYmxlID0ge30NCj4+IEBAIC0x
Njk5LDYgKzE3MjIsOCBAQCBjbGFzcyBSdW5RdWV1ZUV4ZWN1dGU6DQo+Pg0KPj4gICAgICAgICAg
c2VsZi5udW1iZXJfdGFza3MgPSBpbnQoc2VsZi5jZmdEYXRhLmdldFZhcigiQkJfTlVNQkVSX1RI
UkVBRFMiKSBvcg0KPjEpDQo+PiAgICAgICAgICBzZWxmLnNjaGVkdWxlciA9IHNlbGYuY2ZnRGF0
YS5nZXRWYXIoIkJCX1NDSEVEVUxFUiIpIG9yICJzcGVlZCINCj4+ICsgICAgICAgIHNlbGYubWF4
X2NwdV9wcmVzc3VyZSA9DQo+ZmxvYXQoc2VsZi5jZmdEYXRhLmdldFZhcigiQkJfTUFYX0NQVV9T
T01FX1BSRVNTVVJFIikgb3IgMTAwLjApDQo+PiArICAgICAgICBzZWxmLm1heF9pb19wcmVzc3Vy
ZSA9DQo+PiArIGZsb2F0KHNlbGYuY2ZnRGF0YS5nZXRWYXIoIkJCX01BWF9JT19TT01FX1BSRVNT
VVJFIikgb3IgMTAwLjApDQo+DQo+SSBkaWQgd29uZGVyIGlmIHRoaXMgc2hvdWxkIGJlIEJCX1BS
RVNTVVJFX01BWF9TT01FX0lPIGFzIHRoZSBvcmRlciBvZiB0aGUNCj5pbmZvcm1hdGlvbiBraW5k
cyBvZiBzZWVtcyBiYWNrd2FyZHMgdG8gbWUuIFRoYXQgY291bGQganVzdCBiZSBtZSB0aG91Z2gh
IDopDQoNClN1cmUsIHRoYXQgY29sb3VyIG9mIGJpa2VzaGVkIGlzIHBlcmZlY3QgO14pDQoNClJl
Z2FyZHMsDQpBcnlhbWFuDQo+DQo+Q2hlZXJzLA0KPg0KPlJpY2hhcmQNCg==

