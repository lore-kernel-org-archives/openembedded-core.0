Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFBDFED2F1
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 08:37:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16990.1773304624216881793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 01:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q8dGq14Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7531ba8309=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C70YEP3197163
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wWA6KnaV+x2EtPxa4OiEQvHfyZ21s7oBNnCG83eaHqw=; b=Q8dGq14QWEHC
	pNFMQkmrMjhamEIzgSupuuhM27ulJJDi84oesqtgUEgg8YMPit6LsSnE+yjOkWSE
	t1JxsaPZsSThKzHbqX2YTfdmGMOMXn0qX+FJ5HDuJvW+FwevmO83+AYrzEsOSIYM
	co5dc4X95kFL9JFaiMBNBxbwMjvVM5XQdliUNDysvHu279Ngq00wMqisbG08Y9dr
	K9fxqrQZ8xDEnM6vb0cn/jRAPG8EzeBBSgxseMsXnIMS+9C7N4HOusj2rFQB1y9b
	GF8EOqARftTzEI2gCnYrM/ktegAvqzGEp2J/6EHNdgng/oZ2LWwoC0l1kdvAi9oC
	/fZOfLwGNQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010018.outbound.protection.outlook.com [52.101.46.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78gesw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 08:37:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZv49kYpJpZKRhW+JWCXbbuUO8Tc5uCKyyjuY9HTNQaezpUJ1PL/y3MgQS6YUi1637Nxqwh+bWz4OLOQTdgIcI0G9DxMu/2OuBiZZ5CC9lbx7vL51VQDp0yrkoyg/w6WQcxh/Hhc/PndYWE20j2BMiDVskP2aCgNwC0WW9GsZ9PuUHjtagHaWJnndH2e/jlw2fSOnXc5zG+BbP/TZ46iCC76qTs+t75VA+rRrTrhI5C7ZB+Hpev7wBLkQxeOsRl9Iqc/XTeVQaE9/zLg7PE8fyiaW/UplqSitsQIBkYS1g9/Mj+t+zWvK2VMXSQ+rEIsmacmN+I04YoHE58MFrooGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWA6KnaV+x2EtPxa4OiEQvHfyZ21s7oBNnCG83eaHqw=;
 b=SdoGnrHh4XyKhKgbGomXYHX89zHsWI/1qI8Yp/xhW+UETlqMp4Z9z/wuiFOdFtWYd116x2GSzbzAuF1tnC9Nu+O6TZtnnpZLb8NWvK9jpv0uU7fE9R/N1hlenimdWepJ2RBfmbQmG/COz9XZ7ZYxRvgsrp9dS0EsSZoY81weQoWeDMax/x7Oyd/PVPVENCYHPJmdiJp17P5fIuqWgeJTGACF4gAevjAHBOqYAqbtTCxmR5PHbMCuPctYmr+VgQbkxCT2L6ZWOGtIjJDKWb9pjOS7qEKh2uiByo8QKZvp7zSaNViAGLF6Cv5flr1SPO/RmUii1F7ie0Jl3Hupcgqqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by SA1PR11MB8352.namprd11.prod.outlook.com (2603:10b6:806:377::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Thu, 12 Mar
 2026 08:36:59 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::e716:bbea:7a00:2c30]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::e716:bbea:7a00:2c30%4]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 08:36:58 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] python3-chardet: upgrade 5.2.0 -> 7.0.1
Thread-Topic: [OE-core] [PATCH] python3-chardet: upgrade 5.2.0 -> 7.0.1
Thread-Index: AQHcsVBCHe4b4Eopv067NBAHsY8NjLWqkt9Q
Date: Thu, 12 Mar 2026 08:36:58 +0000
Message-ID: 
 <IA4PR11MB9420880D139045D4C269DE4EB844A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20260305074250.377829-1-jiaying.song.cn@windriver.com>
 <e56d9829-1c7b-490e-a4ab-32826f883efd@gmail.com>
In-Reply-To: <e56d9829-1c7b-490e-a4ab-32826f883efd@gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=e5131d0c-e474-400d-a8ca-d803e7232454;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-03-12T08:32:23Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|SA1PR11MB8352:EE_
x-ms-office365-filtering-correlation-id: e4d66d2d-a76f-40e7-2c9a-08de80128688
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 IAZvydwcVQ5Jvm+0cfYJ9M5aB6z9E3Q/P3i1GM6cy2r72ZEOuoCGsR7dBM7uL7IYtZJeBcak5v+kWs92pPuip4u4gcGA5ebuY8tX/7T8dPFd5sCeL/aBKyXLsmW41KJBwBZ5YTqDm1XZ3yuGSAfNBHz6WvEoVw3QTm0rWJ3orFjPNb8jE0jkHUoHRv1EliOAdD304b3/HWkzjTwn4IUwE2FACwi+ynf+QTNgKr3+7Afl6xynyRczKtx+Z8fcf+B/X0bA+s6qo0B+5qra4uTfiXZ6l34QQfoh6H90babMKtlVjC4HNwYUjT4FQsoNNrUdKDjTpQ2NvarrdSE2tFMAEpWZ+gLoIrtnms03jgQ4fUe3LrklZ3z79BywE44WvrOYTfWa3dpQA9R0wEFxFD47IefkT89FWMkB+a5e7UFFt/kq+Pa/lbQJWRfZw6sYtNVwSKG8yHhFgpH5H9YD1iq/XOQloWj5tEoS6UckGDFPY4ujUW4GS6bz1TMbwXdxMnpBJ4FonPxWbje+fTm2hRVPROBXWjlRLd67RZ6u0FSWNHNBJd7m6U5lMASXxuzgxr+zt3alIEqSWDzRqV0nCo8i9EFsPIgnOZwLWfwrbH/LS14IpK4X5UJcaBOHTWJfxirVu2JWkkLw1wnHjFzFPEDqKf0cPpxJ57KACx3FCgkLdZN9hLkQCiPwPyrcn0xMBq7SqxMSUESbPLc+DbJAG0qCJgoebtDNtDNB05HBbK10Lig9Yv/iwejuBug74mxs55GX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TXFEbkJyNlNpTFJYL0pzalpOQVc0OWNxaGhBUm1nbmJxUWJSVHdvcE56RUlr?=
 =?utf-8?B?cmVMWi9WNzd0TkhiWEFYc2pmeHFvMnUwMUpPSXdhOHpFZjlvYUh3bzgxQWxy?=
 =?utf-8?B?REh6VllpT0t5QUF1eDFpc3ZXekdzQXFyRWVEeGlQa2ZQTXR6dkR3WUk0bWE5?=
 =?utf-8?B?bnpwa08rcWZnVHZMUUNpVUwrbGpSSjBIcjJRNXpQU3c5cTB6clBnSHZJRnJV?=
 =?utf-8?B?ZEE3aXFxblhYNnlLMVMzUzVRbjJxRm1zanpNbngrNHp3cHNwUkVLeFRhTHZX?=
 =?utf-8?B?Kyt1T1pTSkdZK3djOEN5VUk5ZmJCaEMyaFBCbkxabVBqU3JRN3paRS81a0pV?=
 =?utf-8?B?a3prZWZXQXpXMkRrOUdrS1NqOUt1WHJ1MDE0cGRjQXZpVUxzSlhnaGF3VXU1?=
 =?utf-8?B?Smt2andEV0ZwSjN5YnhPaFY4SytFdW12ZWJiV3k0cjZxSlFGb1JncmUvdXp4?=
 =?utf-8?B?NXdubjNSTVFGVGExMzZXUnRUaUJheHVRcUNsV3hSYnhpcG1FeVg2VTMxb3RR?=
 =?utf-8?B?YWRTUDB3WDRYRjVYd2xuTTlHTEN4amVlZlM3T1dQVi9OaFpzZ0Z4SlFYN1Rz?=
 =?utf-8?B?b1lnaHl6VkZpZm5sVUpnbHJTSFA1VTNVS0wwOWJ0a2FjekttUnErbE9oWXhI?=
 =?utf-8?B?dWdPWjBMb3ZibW5SWWF5alNPcGhiNlJmcmVTdWJ2ZnpqWkVXUmN4byt0WFhU?=
 =?utf-8?B?NVNDM3BEQXVVbWU3NTVJMzNJM0NTNWswQndtbXVCdmhrSEpPckhreFlZbkhN?=
 =?utf-8?B?VDRtZnRlK3hnSmhwTzhFcnhjODN6MzVQcER0L29KVXh5eVlIWDlUM2ZGbFRJ?=
 =?utf-8?B?OHpGQ0NPQ2hyVHRwejg0dGpWYW1lM01UUmZQWS92cUUxcUtMV01VT1VRMkxi?=
 =?utf-8?B?YXBKTldhbUZsTWdjMS96SXJZOTQ3c2t1QWFEQXJnTVUwYXRxUG96ZWtudnM1?=
 =?utf-8?B?eTEzOVF1Z1Y1YkhKZHJWTCtWay9rMlpqOEljd2hqK0pUWTRqUGU0VVBqWUNJ?=
 =?utf-8?B?ZnFNU3NHRGFwelEwRXMwWU56ZnpQR21WTk1xSkQvR0hwU2M5dmtuSDJjWDRT?=
 =?utf-8?B?YVZlRlF5QkZPY3hKeU9HWE1uVUN1YkVPZEIvNVhsRlEzYTc4OEV4dTMvdjMx?=
 =?utf-8?B?QzA1ZUlIZlAwa3RWVEVWV0JyanhYeUVlSzhELzFXcUZOU3NMT0E3VjFlbUJN?=
 =?utf-8?B?QjdmdDFUcWNpbStZRVBPL2FXTStCeDhnbjJlRGtYV1BZbWtsQkZBSXJzMHNW?=
 =?utf-8?B?djF6Q25Ud3NVd1lzbGgyb1AvMlBIUDZtK1kxS2FNMGdVTzZjamZrU0xSSWY1?=
 =?utf-8?B?SlB5UUdIaXVIUUh4a3ZzTXI2cHZ0aHlmem9KQ1poSEVhYXFrWWlZb2d3eFJp?=
 =?utf-8?B?SXdjd3VONVpSNGd3Tlh3bXliaUp6aURFYkVVd3hQbXNDbkZOSmlDTFplSVlY?=
 =?utf-8?B?dEoyeXVIeFlRNmVDU2tzTk1KRW9RQ2xtcjdCbFlqaXFZYVBQTnZYdjVHR1dw?=
 =?utf-8?B?MThYdDFqMk1obW92YytDOFBmdDIyV0NVT1VkT3ErckdteDVhMkZTNmZmS3dt?=
 =?utf-8?B?ekJRWk5uUnRCRlI1L2d1WDhIUkFuemVNNTlhS2xQVCtZR3VUUXNIeExrdEdv?=
 =?utf-8?B?a0ZFT3BrcWNoOUV5cjA3aFhoUmdrSk5ENVZjRUJhMWVZOGwweFY4M3N6TytB?=
 =?utf-8?B?bGNJbXBJM2JRZjRWRXVod21zeHpJaWxJaEJMU3VPbWxaenNudHlDaGFpTWMr?=
 =?utf-8?B?cEZBbmdWNklRWTlWUTBCYTUyKzlNYVdUMmVEVXJsaXpTZkZscFZhTmxTSGlN?=
 =?utf-8?B?RHlrYitmTVlZTTlzM1lMUkthdGhUdC9XSDN3SzE5ZmptMUd5STQ3dDRTUGRp?=
 =?utf-8?B?UmVGcG1SMVdxYktBMU90azViR3M4SXh6TDZoV3BlZytwYlVYTTZWVDlTVzVE?=
 =?utf-8?B?MHNqZmRUQVRpdERTV2FUcjZOT2JvNmt1QUJVSE5UNjFvZjhWYy8rUWVaalZX?=
 =?utf-8?B?NGpOQmtoQVZXVFpPc04xQmlwOGg2UHp2ZmYxNWZmYy95TjVjdWhTeW9xTFZj?=
 =?utf-8?B?UmpIWG1wS1g4M3I3TjI3OExTVGtqTzBkZzNDTUZwcEdlNnF1V2EvZ1hmNE5Y?=
 =?utf-8?B?dkY5eGVlUWZiZDBTMlh4WjJMOHpPdU5RZlNadU5JVUxaWVNmbWJvUzRIWXUx?=
 =?utf-8?B?M2Q1b1VKWjJmNlpQYXFYWkhjaVhJejdTc2w4WmpmTGoyZkRZMW43R08rWGty?=
 =?utf-8?B?N3lESUNpUXFNTXd4WHViajlKZGV3VTlNVnhJZXpHMG85d2NIZFFuVEV5dW1m?=
 =?utf-8?B?UXBhbjM0TEZHdUZXMHErNkk4QXI0ajJqbEFZN1Z0WnNJYm43MXR6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	twjveBiVmmXzgNg18w1L7M8/QPqRg3iPKBrs0Q4BwilF//Ck5/CeApNmq3OadZRSZpKdxQ4295sfU1hn1tPedN4w2BF54UgapQmFHfWX2n/qWir0YjYYeY2pgzUVZ5EuV5d7vcJO3sicu/psPAc8XRgDDfepaXw7PbbFgb+qpnjnOracQJXtWD6Nc7hZidHsaJh+rY124qPTHvIxuDC5xnWEaoMlKRSZ7WKXkU9x9GHcN0qMvM2OCviy+7iUgb/fiw9aAihadAJwFDQWSO3pm44JYsRuyQ5Gk1M7aO7/anLVnd2ImjaD/64fC2G2irWUKq9eBIIW5JJzWQw85NdWMQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d66d2d-a76f-40e7-2c9a-08de80128688
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 08:36:58.7497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VHDEioclcrQUWgv6Q+LRLWP5foh7bD//fpONkt27tDTl6N5yyhhRrMETEagiUrW1gEMN9VF1u/tlgJ4n5fD6dNq5GDYUyidONr9aRmo+bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8352
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b27b2e cx=c_pps
 a=xtX6lszn+wSwJ/mzueWfcw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA2OCBTYWx0ZWRfX+F0QsETfqWwF
 0yr/GXlmDVuO8Ad2v4U4LtTBHiUeXFly6KA5DdtMjD808lHx+9jziqmiLEjoV8m2VNuO/c+ZGW9
 ak16LhmdTMnIxUKDhvhIIDvTYJdek1xJsgW2PmRnyoEWrbMaAmBvJOnu8wq3Z5QCp3qYbrQC6qo
 VKaVx2rfyP7Odiy33ZrRjXHu2uc85Yd1guHze2i2ZimNtMHyhGwB9y3HjKX4ODa9F/ltDxYHwBJ
 Ccgm+x6Z4LDgoyyRhjqY3ooQ/TvFdVjNmdD4UVKUfNHgbRBOa0o1dL+p0l0T7m3HuHD7p4pXUPb
 DZzrUIJ7V3QVazyYLNJ6KFWgqLWmOibMI8UNBDuTDuG06gc88h2N39GnV+7OkITYKq30acPxSIr
 dD9Q60PRIT9P4kD8Q6joq+BLbZH0aOIIJIpVdf+QhWkIdolwvGLPBnO1a61qE0/SSH5ziTLIdMY
 ktTy7xNrT60CcNd2EFQ==
X-Proofpoint-ORIG-GUID: 6lx7B27QMyY1ehsOPXXKgcFrGRTFBJtC
X-Proofpoint-GUID: Td1bszDAUuWEVa21_beQ_wMAzjZulnun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232931

SGkgWm9sdMOhbiwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIFlvdSdyZSByaWdodCAtIEkn
bGwgaG9sZCBvZmYgb24gdGhlIDcueCB1cGdyYWRlIGR1ZSB0byB0aGUgb25nb2luZyBsaWNlbnNl
IGNvbnRyb3ZlcnN5Lg0KDQpCYWNrZ3JvdW5kOg0KVGhlIDcuMC4wKyB2ZXJzaW9ucyB3ZXJlIHJl
d3JpdHRlbiBieSBtYWludGFpbmVyIERhbiBCbGFuY2hhcmQgdXNpbmcgQ2xhdWRlIEFJLiBIZSBj
bGFpbXMgaXQncyBhbiBpbmRlcGVuZGVudCB3b3JrIG5vdCBkZXJpdmVkIGZyb20gR1BML0xHUEwg
Y29kZSwganVzdGlmeWluZyB0aGUgTUlUIGxpY2Vuc2UgY2hhbmdlLiANCkhvd2V2ZXIsIHRoZSBv
cmlnaW5hbCBhdXRob3IgTWFyayBQaWxncmltIG9iamVjdGVkIG9uIE1hcmNoIDV0aCAoaHR0cHM6
Ly9naXRodWIuY29tL2NoYXJkZXQvY2hhcmRldC9pc3N1ZXMvMzI3KSwgYXJndWluZyB0aGF0IEFJ
LWFzc2lzdGVkIHJld3JpdGVzIHN0aWxsIHJlZmVyZW5jZSB0aGUgb3JpZ2luYWwgTEdQTCBjb2Rl
IGFuZCBzaG91bGQgcmVtYWluIHVuZGVyIExHUEwuDQoNCkN1cnJlbnQgU3RhdHVzOg0KQmFzZWQg
b24gRGFuIEJsYW5jaGFyZCdzIGZpbmFsIGNvbW1lbnQgKGh0dHBzOi8vZ2l0aHViLmNvbS9jaGFy
ZGV0L2NoYXJkZXQvaXNzdWVzLzMyNyNpc3N1ZWNvbW1lbnQtNDAxNzQxMDgwMSksIHRoaXMgbGlj
ZW5zZSBkaXNwdXRlIGlzIHVubGlrZWx5IHRvIGJlDQpyZXNvbHZlZCBzb29uLiBIZSBsb2NrZWQg
dGhlIGRpc2N1c3Npb24gd2l0aG91dCBjaGFuZ2luZyBoaXMgcG9zaXRpb24uDQoNClNvbHV0aW9u
Og0KSSd2ZSBzdWJtaXR0ZWQgYSBuZXcgcGF0Y2ggdXBncmFkaW5nIHRvIDYuMC4wLnBvc3QxIGlu
c3RlYWQgLSB0aGUgbGF0ZXN0IHZlcnNpb24gd2l0aG91dCBsaWNlbnNlIGNvbnRyb3ZlcnN5LiBU
aGlzIG1haW50YWlucyBMR1BMLTIuMS1vbmx5IGFuZCBhdm9pZHMNCnBvdGVudGlhbCBjb21wbGlh
bmNlIHJpc2tzLg0KDQpUaGFua3MsDQpKaWF5aW5nLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogQsO2c3rDtnJtw6lueWkgWm9sdMOhbiA8emJvc3pvckBnbWFpbC5jb20+IA0K
U2VudDogV2VkbmVzZGF5LCBNYXJjaCAxMSwgMjAyNiA4OjEyIFBNDQpUbzogU29uZywgSmlheWlu
ZyAoQ04pIDxKaWF5aW5nLlNvbmcuQ05Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBw
eXRob24zLWNoYXJkZXQ6IHVwZ3JhZGUgNS4yLjAgLT4gNy4wLjENCg0KQ0FVVElPTjogVGhpcyBl
bWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCkRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBz
ZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0KMjAyNi4gMDMuIDA1LiA4OjQy
IGtlbHRlesOpc3NlbCwgU29uZywgSmlheWluZyAoQ04pIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIMOtcnRhOg0KPiBGcm9tOiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2
ZXIuY29tPg0KPg0KPiBNYWpvciB2ZXJzaW9uIHVwZ3JhZGUgd2l0aCBzaWduaWZpY2FudCBpbXBy
b3ZlbWVudHM6DQo+IC0gTGljZW5zZSBjaGFuZ2VkIGZyb20gTEdQTC0yLjEtb25seSB0byBNSVQN
Cg0KUGxlYXNlIGhvbGQgb2ZmIG9uIHRoaXMgdW50aWwgdGhlIGxpY2Vuc2UgY29udHJvdmVyc3kg
aXMgcmVzb2x2ZWQuDQoNCg==

