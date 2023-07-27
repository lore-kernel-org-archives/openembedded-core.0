Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095F6C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 05:55:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1451.1690437299355814842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 22:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jC5mR0p7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65722416f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36R5pSud000569
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 05:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=X+SDVNdFfe1fdD3B07AiJjKDGVjvt0kD3r3v70T1EpU=; b=
	jC5mR0p78E5wLoLHz95WM0zl256lRjzst77LjzUMe89uKNwT8BEG7W2Mtm+JWoNs
	ZINbb1AjJ8KeS+BXNpzX/qTj84sbvwomL1jVYKozhPqy5CvBsnnuO1dNusl1PTuk
	TJe4sJLabXNjUT8vxR3vwNFeteSVQUSO8sHUPZFiuczO7MLn66cn8h6SLs6F1NFg
	Lzv4RSbRjDwCwm4WQgKJXPTF/+rDNYEMTjiZxDDukDQoQfNFZVMLynbu0tzdS8Ca
	bQ2jJU5b1jhEGjymS/jUnj0o0hSZVlpQjLJjhSc1FGGs6oM8SotXr96fYb3wtAoy
	4V+DYxcw/YNDqcWLbbg/Rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78u71f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 05:54:57 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36R5svn7005514;
	Thu, 27 Jul 2023 05:54:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78u71d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 05:54:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlPQIQE1npDn13l6oTG9ZQWJYI2SlrXK1JB9gzwnz2vUXI136ztb+JFJTKyRjR4NLf1g/M3bNsWApY8r5e2wAVZVJdh0tYVK5JQ9VmNxtSJwW2pDLHcbM2AvucD5hgqX5P268Kqs9TdZMfoQVr2ALJ7XaXqWtI8MKU76NW2knNvbBQioPAcLmZOPmhbD9efryBU5Dx3cXvNcHhlRprp3auT4ka5kqgaCouMtaMcB2x3cB1cloKszuHc8vZVZ3baneigCsiWNlsjtgq/kUN1s5R5hy1ik6mlrEyQNjXLl2Go5caXo7hWp/bIs3YuCSv6uxl/tjraN9BDEAQxlEvVigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+SDVNdFfe1fdD3B07AiJjKDGVjvt0kD3r3v70T1EpU=;
 b=hPlzy++nQ56BPRaZ8lAb5uek2VgG4f6NcPM41EgmP3N1AcP/UmiZ7V+bV83CKxFIMshs+1nnlQ4lEdBTgNm9lQPyOECUfeqYuzv76fLUnuxb/BO02nk2Pl34gW8XwNL3/hexO6ldjd/W8K3g1l534vw0TrrMAuLwrF256FYoYQglpj6ZhZgjFDeXcvcFr3+2xukrzS2Zam7crQeAApBhy4GJ8nkktlis1ZDOBvC+paeBiT+NnkJ5We7wuwnWRR0SxJXFn1apJh+b6pzBgaHHBsHKxXWlROkyrXCBq0A4cvZ4CUaTMYi1CryzN6KNRijoKHschukzWbI1TA/FNggggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 05:54:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c60b:b353:ba77:8cb3%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 05:54:52 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] ncurses: upgrade to 6.4+20230625
Thread-Topic: [OE-core][PATCH] ncurses: upgrade to 6.4+20230625
Thread-Index: AQHZwDGpycNFn8VeEk+6ckYrHgANQq/NBFgAgAAYbYA=
Date: Thu, 27 Jul 2023 05:54:52 +0000
Message-ID: 
 <CO6PR11MB560281C3B8CE03378DFE6029ED01A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230727022539.2478131-1-Qi.Chen@windriver.com>
 <CANNYZj9HjzzNk1DhAdgBv9CVhsHMrDu6hFmTc54c-xPGQdBDTg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9HjzzNk1DhAdgBv9CVhsHMrDu6hFmTc54c-xPGQdBDTg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4943:EE_
x-ms-office365-filtering-correlation-id: d3c9b635-cab4-440a-86f7-08db8e65ff3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zHBtdfvig6RsNXNbzSsVQLo7AzD796asgS3dFkZjY6VVQPfUMWhE3zJ9x1b4d+T61yfp/s75BOs8xbSh6LN7dZHvxZDE6+1brrfjiytCYWkgOVZzmaLuZBA4+lYKLahzK0MsGpkrHxYHz33kMmHP5eSrTh4Vdve+AFc206IUy0RKyGa0C7gsD5lwFcAJy8q5A0amcKc7fd92hQursmn3WRrh6EWTDiRRov+vaVjVuYbzjZeGUdk5lYqy6fSqbH/0aP/9a+OxFEpmiPAsSY8ML4GjhppvsGvmTYSjKawpVyynkpcD1V7W/LFF7Vxzr7vnMY0+pcCk/XM3tB595ocZs94RfpMgeSa117HotczoDetLO5CduOVImUbCujLdw/dDpkI3yGRYazyP2QLiErEhsrdJQs1HhQtS5RQgttrQPMMxrTTDzooHXiSj6cj+2eB9RNrtU/ryFV6mwiJspnWSEDKvY4tlsaDjCMvZP6Zr/JKkBrfSWpM8x4izWh4WLy0aVeQtZO2YEyJF9mk4SXkboCQJmUOnWenGpfFttUBE7wEccWek1uFec4Tk0gAGXtLnAjivILN2JTn0S7loi8mmTYzSGqmDiza9VqiXy9Qt5hVIDomdwmnC2RhXO10ofISQVoNIfOOPkErv0pbNjjrWew==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(376002)(396003)(346002)(136003)(451199021)(2906002)(66899021)(316002)(8936002)(8676002)(52536014)(5660300002)(38070700005)(41300700001)(33656002)(55016003)(86362001)(7696005)(122000001)(71200400001)(478600001)(26005)(6506007)(53546011)(186003)(966005)(9686003)(66946007)(76116006)(66556008)(83380400001)(38100700002)(66476007)(64756008)(66446008)(4326008)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eDZRaGxsK2NIK0dFeWxGc2ozcndPY3VvYVl5d0FwaFNvYkJvamhaMnJiTENa?=
 =?utf-8?B?RE1xWTN5Ty9QQlFLNGtZaFo0YjBEY0JFaWJXOUMwa1U1OE1tNkRadUcxdVov?=
 =?utf-8?B?Vi9KVGRnQWxVYUNqVkszejVscHNXalh3SGNVUFhUN0hVaWFjRHZ4T2VOVlQ5?=
 =?utf-8?B?Zld1Wll6WFNwRlcvSjB4RElEbUJPKzF6WTVBVTZWZDBSZ0ZybkFtaTFSZFdN?=
 =?utf-8?B?K0I5Tk85WTZub0xiTFRDNGZtRStGZm85TVliSUpYdlR3U2N0NHBhb1NlWHhM?=
 =?utf-8?B?RnU3eTVJUWx3c3JwZVc3T3RUc2VuekhrN29WVk1zVnBvSktGV290TytwSndl?=
 =?utf-8?B?NENoc2w1d01MbGR1NkJLdDNFN0NQdEhHemY1QXpLNENPcHV2STRySkdzS2dV?=
 =?utf-8?B?OCtVS09XRm92ZGh3RUtZZnFBbzRDZmNvR1hjZGpBcFNhZXI0bU1IaG4ySFlk?=
 =?utf-8?B?NXpSbmNNM0RGSVh5Vk56TThxaHAvMGtoNGRZMUo2T0l6R3VSR25DZUNGbDBE?=
 =?utf-8?B?WHVEUEJtb3FJVUJ6TjlwUHlwMyt6OFBOb2lPZlR5cG5RWFkvejkvQXRqSTBX?=
 =?utf-8?B?eU1rVkc5M1BTanU4SENwMTc0aklUdDZZK0NJcjI1QlpDZmJGdFM0MkUvdm14?=
 =?utf-8?B?YitoN1hYWjlKQk0rQTBvaW5JUHA4USt3ZFhOV25Tck4wVU10SWNuOEJSVnhG?=
 =?utf-8?B?aDhqdVViN01tN3dwcnBZVWkzQ3NiSTQ0c2ptZFdPSys1M0VhN0dnTHdlV3RD?=
 =?utf-8?B?K2FnVFcyelNHN2F3MStkZ2tVUzJiVy9MUWdGSmRNMElGWWNjWEtYbnFqeG1o?=
 =?utf-8?B?eFR4Z0ZYVDkrTHhyU0FsWWNnQWRFZXdyYTVkdnJXbTJ4eDZ4dStZVE5GNWQz?=
 =?utf-8?B?NjdnRml5bWJtWUgwMEFSUHNWZ0dhWlhoa2VPVnNpaUZ6ajlSbVhvUm5qSmJK?=
 =?utf-8?B?V0p4TGpiVkZFbHV4RmwrS1BnVnRsZGJDVWtpdDBoeGhhaGoxSFZSd0xzazhZ?=
 =?utf-8?B?WUZPaGRkWjM1LzJVaUkwYlBmK1Nobm50MVIrdTJPK3ZLM1NOYklCWnF1cHkx?=
 =?utf-8?B?MWNEbnljeGdPd3kvM2k2ZHdBb0ZMcUZWUlRkN00vYURtZmxkL0wwcUY1WDhl?=
 =?utf-8?B?TGRabG5vdlhwRnM1VXIxNExPaEFLVkQ5UmtFa1M3Z08rWndJcXBVWmNOekVZ?=
 =?utf-8?B?MnYrN2U1QXFDZ2xob0QwbldkMzRIQnVzNUFYaVh1Q2VYVjdZTDR5S0NjYjZa?=
 =?utf-8?B?eDVjOVlLNHczdmFpSVVPQjRvYXUzSG5naktsZmRYTm9IdGNhRTlPeVB3Z1FC?=
 =?utf-8?B?emZtdEpPK0JlKzF1a1dONC83cERjdEF0QTZQd3JGekkyYVVnOEVvQWU4aTBt?=
 =?utf-8?B?N045L2dRczU4RDNGLzZhQUJ5SUpJRXFSWDRBdWRUOWpIc2YyUWdvZzFQTWVN?=
 =?utf-8?B?ZGN1aDd2cmpPMlBjb08xdWRWM2Rpd25WVk44c2ZNamlXWTlROWc4UU9pYW9t?=
 =?utf-8?B?a203dEdTL3RVbnZ4NGF5VzRwZ3VxclJPeWNvR0taTmQ3bVJPWkhmLzVjM0FK?=
 =?utf-8?B?YWNsOEpOeTA5dVdpZEpJZ2RoM2RpNk4rZkhLT0FVVWw1YzJ1NnBsMU1NS015?=
 =?utf-8?B?dkJKSHoxcVdCZlRJOW9FQmpmU3VMQUtmMlZtemhTYzVDYjVLWFdwcTlrRlpl?=
 =?utf-8?B?dVpQY2psaGpMWE8yUTk0N2N4YW9Od1lzMXF3S2F4M0pzeENmSEkwaG53RFgy?=
 =?utf-8?B?cjVDcW9mbWVzbUxDNUdMUHhkT1ZMZUpEN1U2bWlzQ3llZWdhN1dVNzVidWFU?=
 =?utf-8?B?dkl3a3JjckZEcmtIRnVMaFNMUHdlVmtDTHpoNm1nN211TjdqUjFoWWVrbUps?=
 =?utf-8?B?dTZwd0RIMENkNnV3dy9SUnU2TmdaOGJicUkzdlZ1cllsakQ3NTFsL2tPeUZN?=
 =?utf-8?B?UnZUcVo5SC95alVhR3lWMXhkRzZkczhzVnNsWTB2N3Q2QzRtYmM2UEFQbTEz?=
 =?utf-8?B?TEFGZWJnMklQa3ZhUGJ2MTNudE1nb0pqQlVYYWcycnUxVmpFcE1PUkJBWGJr?=
 =?utf-8?B?Rzd0dWU5V1J3V09mWjI2RDhLekN1aEJaRDkzdGdVNUN5SEMybEpnYm9RS3RU?=
 =?utf-8?Q?gOTCbiUEf8XkysfwKP5+Djk9Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c9b635-cab4-440a-86f7-08db8e65ff3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 05:54:52.7478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phCVzKLe3mJKeKTvfNzpAnkvzylHNDHa3DOmjxvIsPoVk1K4tgTKe8/6uIgr781n6peQRUiUUV6XWeekkcHWCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
X-Proofpoint-ORIG-GUID: UU8Rf4w8j9MqMjpsWIT1u32p3BpCRipn
X-Proofpoint-GUID: BmGmubbH32YuAMCYjvcigYVvjknM2Jcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307270052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 05:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184909

VGhhbmtzIGZvciB0aGUgaW5mby4gSSB0aG91Z2h0IGl0IHdhcyBhIHN0YWJsZSB2ZXJzaW9uLiBU
aGUgdXBncmFkZSB3YXMgaW50ZW5kZWQgZm9yIHJlc29sdmluZyBDVkU6IGh0dHBzOi8vbnZkLm5p
c3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDIzLTI5NDkxLg0KQnV0IG5vdyBpdCdzIGNsZWFyIHRo
YXQgc3VjaCB2ZXJzaW9uIGlzIGEgZGV2ZWxvcG1lbnQgdmVyc2lvbiwgSSdsbCBqdXN0IHNlbmQg
b3V0IHBhdGNoIHRvIGZpeCB0aGUgQ1ZFLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBKdWx5IDI3LCAyMDIzIDEyOjI1IFBNDQpUbzogQ2hl
biwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBuY3Vyc2Vz
OiB1cGdyYWRlIHRvIDYuNCsyMDIzMDYyNQ0KDQo2LjQrMjAyMzA2MjUgaXMgYSBkZXZlbG9wbWVu
dCBzbmFwc2hvdCwgYW5kIG5vdCBhbiBhY3R1YWwgc3RhYmxlIHJlbGVhc2UuIFdlIHVzZWQgdG8g
dGFrZSB0aGVtIGJ1dCB0aGF0IHdhcyBkdWUgdG8gbWlzdW5kZXJzdGFuZGluZyBhYm91dCBuY3Vy
c2VzIHZlcnNpb24gcG9saWN5LiBJcyB0aGVyZSBhIHBhcnRpY3VsYXIgcmVhc29uIHRvIG1vdmUg
dG8gaXQ/DQoNCkFsZXgNCg0KT24gVGh1LCAyNyBKdWwgMjAyMyBhdCAwNDoyNSwgQ2hlbiBRaSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8UWkuQ2hlbj13aW5kcml2ZXIuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPg0KPiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRy
aXZlci5jb20+DQo+DQo+IFRoZSBsaWNlbnNlIGNoZWNrc3VtIGlzIHVwZGF0ZWQgYmVjYXVzZSBv
ZiB0aGUgeWVhciBjaGFuZ2UsIHRoZSANCj4gbGljZW5zZSBpdHNlbGYgcmVtYWlucyB0aGUgc2Ft
ZS4NCj4NCj4gVGhlIGV4aXRfcHJvdG90eXBlLnBhdGNoIGlzIHJlZnJlc2hlZCB0byBhdm9pZCBw
YXRjaCBmdXp6IGVycm9yLg0KPg0KPiBUaGUgcmVwbyBpcyBzd2l0Y2hlZCBiYWNrIHRvIHNhbHNh
LmRlYmlhbi5vcmcuIEl0IHdhcyBzd2l0Y2ggZnJvbSANCj4gc2Fsc2EuZGViaWFuLm9yZyB0byBn
aXRodWIgbWlycm9yIGJlY2F1c2UsIGFjY29yZGluZyB0byB0aGUgY29tbWl0IA0KPiBtZXNzYWdl
LCB0aGUgZ2l0aHViIG1pcnJvciB3YXMgdXBkYXRlZCBvbiBhIGRhaWx5IGJhc2lzLiBCdXQgdGhp
bmdzIA0KPiBoYXZlIGNoYW5nZWQgYW5kIHRoZSBnaXRodWIgbWlycm9yIGhhc24ndCBiZWVuIHVw
ZGF0ZWQgZm9yIG1vbnRocy4NCj4gU28gc3dpdGNoIGJhY2sgdG8gdXNlIHNhbHNhLmRlYmlhbi5v
cmcuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4N
Cj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL2V4aXRfcHJvdG90eXBl
LnBhdGNoIHwgMTAgKysrKystLS0tLQ0KPiAgbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vy
c2VzLmluYyAgICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4gIG1ldGEvcmVjaXBlcy1jb3JlL25j
dXJzZXMvbmN1cnNlc182LjQuYmIgICAgICAgICAgICAgfCAgMyArKy0NCj4gIDMgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy9leGl0X3Byb3RvdHlwZS5wYXRjaCANCj4g
Yi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL2ZpbGVzL2V4aXRfcHJvdG90eXBlLnBhdGNoDQo+
IGluZGV4IGZkOTYxNTEyZTAuLjlkZGRiYmNjZjQgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL25jdXJzZXMvZmlsZXMvZXhpdF9wcm90b3R5cGUucGF0Y2gNCj4gKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvbmN1cnNlcy9maWxlcy9leGl0X3Byb3RvdHlwZS5wYXRjaA0KPiBAQCAtMSw0
ICsxLDQgQEANCj4gLUZyb20gNGE3NjlhNDQxZDdlNTdhMjMwMTdjMzAzN2NkZTNlNTNmYjlmMzVm
ZSBNb24gU2VwIDE3IDAwOjAwOjAwIA0KPiAyMDAxDQo+ICtGcm9tIGJjOTE3YjliYWUwYjExYjAy
YWEwZGRkOWVkNjJkOWNkNzhmZmM0ZjcgTW9uIFNlcCAxNyAwMDowMDowMCANCj4gKzIwMDENCj4g
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ICBEYXRlOiBUdWUsIDMwIEF1
ZyAyMDIyIDE1OjU4OjMyIC0wNzAwDQo+ICBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBuZWVkZWQgaGVh
ZGVycyBmb3IgaW5jbHVkaW5nIG1ic3RhdGVfdCBhbmQgDQo+IGV4aXQoKSBAQCAtMTEsMTggKzEx
LDE4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPg0KPiAgZGlmZiAtLWdpdCBhL2NvbmZp
Z3VyZSBiL2NvbmZpZ3VyZQ0KPiAtaW5kZXggZjM3N2Y1NTEuLjE2M2Y4ODk5IDEwMDc1NQ0KPiAr
aW5kZXggYzI0NjJmN2YuLjMzNjY4Y2YwIDEwMDc1NQ0KPiAgLS0tIGEvY29uZmlndXJlDQo+ICAr
KysgYi9jb25maWd1cmUNCj4gLUBAIC0zNDIzLDYgKzM0MjMsNyBAQCBybSAtZiAiY29uZnRlc3Qu
JGFjX29iamV4dCIgImNvbmZ0ZXN0LiRhY19leHQiDQo+ICtAQCAtMzQ1OCw2ICszNDU4LDcgQEAg
cm0gLWYgImNvbmZ0ZXN0LiRhY19vYmpleHQiICJjb25mdGVzdC4kYWNfZXh0Ig0KPiAgICAgY2F0
ID4iY29uZnRlc3QuJGFjX2V4dCIgPDxfQUNFT0YNCj4gLSAjbGluZSAzNDI0ICJjb25maWd1cmUi
DQo+ICsgI2xpbmUgMzQ1OSAiY29uZmlndXJlIg0KPiAgICNpbmNsdWRlICJjb25mZGVmcy5oIg0K
PiAgKyNpbmNsdWRlIDxzdGRsaWIuaD4NCj4gICAkYWNfZGVjbGFyYXRpb24NCj4gICBpbnQNCj4g
ICBtYWluICh2b2lkKQ0KPiAtQEAgLTEzMTExLDYgKzEzMTEyLDcgQEAgY2F0ID4iY29uZnRlc3Qu
JGFjX2V4dCIgPDxfQUNFT0YNCj4gK0BAIC0xMzUyNiw2ICsxMzUyNyw3IEBAIGNhdCA+ImNvbmZ0
ZXN0LiRhY19leHQiIDw8X0FDRU9GDQo+ICAgI2luY2x1ZGUgPHN0ZGxpYi5oPg0KPiAgICNpbmNs
dWRlIDxzdGRhcmcuaD4NCj4gICAjaW5jbHVkZSA8c3RkaW8uaD4NCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlcy5pbmMgDQo+IGIvbWV0YS9yZWNpcGVzLWNv
cmUvbmN1cnNlcy9uY3Vyc2VzLmluYw0KPiBpbmRleCAzNjdmM2IxOWY0Li43OGQ2ZjI2MTljIDEw
MDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5jDQo+ICsr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlcy5pbmMNCj4gQEAgLTIsNyArMiw3
IEBAIFNVTU1BUlkgPSAiVGhlIE5ldyBDdXJzZXMgbGlicmFyeSINCj4gIERFU0NSSVBUSU9OID0g
IlNWcjQgYW5kIFhTSS1DdXJzZXMgY29tcGF0aWJsZSBjdXJzZXMgbGlicmFyeSBhbmQgdGVybWlu
Zm8gdG9vbHMgaW5jbHVkaW5nIHRpYywgaW5mb2NtcCwgY2FwdG9pbmZvLiBTdXBwb3J0cyBjb2xv
ciwgbXVsdGlwbGUgaGlnaGxpZ2h0cywgZm9ybXMtZHJhd2luZyBjaGFyYWN0ZXJzLCBhbmQgYXV0
b21hdGljIHJlY29nbml0aW9uIG9mIGtleXBhZCBhbmQgZnVuY3Rpb24ta2V5IHNlcXVlbmNlcy4g
RXh0ZW5zaW9ucyBpbmNsdWRlIHJlc2l6YWJsZSB3aW5kb3dzIGFuZCBtb3VzZSBzdXBwb3J0IG9u
IGJvdGggeHRlcm0gYW5kIExpbnV4IGNvbnNvbGUgdXNpbmcgdGhlIGdwbSBsaWJyYXJ5LiINCj4g
IEhPTUVQQUdFID0gImh0dHA6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9uY3Vyc2VzL25jdXJzZXMu
aHRtbCINCj4gIExJQ0VOU0UgPSAiTUlUIg0KPiAtTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9YzVhNDYwMGZkZWY4NjM4NGM0MWNhMzNlY2M3MGE0Yjg7ZW5kbGluZT0yNyIN
Cj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PThmMmU1Yjk5ZDViNmMw
ZTZlZTdjYjM5Yjk5MjczM2I2O2VuZGxpbmU9MjciDQo+ICBTRUNUSU9OID0gImxpYnMiDQo+ICBE
RVBFTkRTID0gIm5jdXJzZXMtbmF0aXZlIg0KPiAgREVQRU5EUzpjbGFzcy1uYXRpdmUgPSAiIg0K
PiBAQCAtMTMsNyArMTMsNyBAQCBCSU5DT05GSUcgPSAiJHtiaW5kaXJ9L25jdXJzZXM1LWNvbmZp
ZyANCj4gJHtiaW5kaXJ9L25jdXJzZXN3NS1jb25maWcgXCAgaW5oZXJpdCBhdXRvdG9vbHMgYmlu
Y29uZmlnLWRpc2FibGVkIA0KPiBtdWx0aWxpYl9oZWFkZXIgcGtnY29uZmlnDQo+DQo+ICAjIFVw
c3RyZWFtIGhhcyB1c2VmdWwgcGF0Y2hlcyBhdCB0aW1lcyBhdCANCj4gZnRwOi8vaW52aXNpYmxl
LWlzbGFuZC5uZXQvbmN1cnNlcy8NCj4gLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9taXJy
b3IvbmN1cnNlcy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciINCj4gK1NSQ19VUkkg
PSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9kZWJpYW4vbmN1cnNlcy5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hc3RlciINCj4NCj4gIEVYVFJBX0FVVE9SRUNPTkYgPSAiLUkgbTQiDQo+DQo+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXNfNi40LmJiIA0K
PiBiL21ldGEvcmVjaXBlcy1jb3JlL25jdXJzZXMvbmN1cnNlc182LjQuYmINCj4gaW5kZXggMWVi
MTU2NzNkMS4uYjg3NWFlZTI1MCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1
cnNlcy9uY3Vyc2VzXzYuNC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25j
dXJzZXNfNi40LmJiDQo+IEBAIC02LDcgKzYsOCBAQCBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS10
aWMtaGFuZy5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly9leGl0X3Byb3RvdHlwZS5wYXRj
aCBcDQo+ICAgICAgICAgICAgICINCj4gICMgY29tbWl0IGlkIGNvcnJlc3BvbmRzIHRvIHRoZSBy
ZXZpc2lvbiBpbiBwYWNrYWdlIHZlcnNpb24gLVNSQ1JFViA9IA0KPiAiNzliOTA3MWYyYmUyMGEy
NGM3YmUwMzE2NTVhNTYzOGY2MDMyZjI5ZiINCj4gK1NSQ1JFViA9ICI5NjRlYzlmOWM2ZTNhYzNh
YWExYTkxNjFjNmZiNzVmNmQ3ZjU4OWI1Ig0KPiArUFYgPSAiNi40KzIwMjMwNjI1Ig0KPiAgUyA9
ICIke1dPUktESVJ9L2dpdCINCj4gIEVYVFJBX09FQ09ORiArPSAiLS13aXRoLWFiaS12ZXJzaW9u
PTUiDQo+ICBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj5cZCsoXC5cZCsp
KykkIg0KPiAtLQ0KPiAyLjQwLjANCj4NCj4NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZp
ZXcvUmVwbHkgT25saW5lICgjMTg0OTA0KTogDQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTg0OTA0DQo+IE11dGUgVGhpcyBUb3Bp
YzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDM4Mzk5OS8xNjg2NDg5DQo+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtY29yZS91bnN1YiANCj4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+DQo=

