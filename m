Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B75CC4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 14:56:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.77492.1669992954644692065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 06:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EQrHdMLC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=933577594f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B2Ep916010766
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Dec 2022 06:55:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=gOHe9UT94Hqs4Z3RA9zcQPdnTJmxEgEzNjlm00Exv8U=;
 b=EQrHdMLCR/IfmzOOT2CxmWqhDGpbYBtkaRi1hmxAxGdtdML4bx8hVPKrwKh0rF9zhjbX
 yV8/p8b4LvYuCxz15RHU/Hgzn6v4U9ihLteewgHcM+3q1Hmyrp3LMD3eep2vO5+O6Umy
 zA4YNeGjp5NsLFoZaxhp7hyiZ6MQWnbKNk5o5k1xYUZK/QUjrA9CAMGPN9AxjIzjZiHh
 pU6sq+IKWLs9kkNPY6shoEjEUXG8zgSQ/D+QI1eUrELNzazJJA5NUNGmsiewOzML7S4V
 KyI+KxqEb6FtBaKksaT/aos8IiBTa6Gnw+lT+Qgmzr5pufsQofOYJI6Tnlw/wVKQIVOm Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6rd670-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 06:55:54 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B2Erewr017254
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Dec 2022 06:55:53 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6rd66w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Dec 2022 06:55:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj64yRIo95bDQmsi8LQ6smbKimXk3QxS/7rtErmHSFYrkgWjHHX52Ng1to99r418kp4X+45odBcSWtC3qaVVff2kqRGxMBywRhQchixhLQEOVr30tdYtr0G9zLldNm5TQCbFKSHibgyBuMdUe39oAg9zrSvJtydDhF0me8cE2h4QFUi5Q7Id603LPmLkXkouR1azSJqK0Th4TVLvbFutlabS6J+viBWfPsg1wSFa7EWKpQirzOQOhFLaf3EfP985rNMUou4HuiGlyWnWRAYeuFfNKUFoFXci6qJmzSQoABFQyVo1X+aMz5DukI5cVf5sYiGuA6NA/AwVU7hOUR8sLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOHe9UT94Hqs4Z3RA9zcQPdnTJmxEgEzNjlm00Exv8U=;
 b=Ah8p8vcR2K7x5e2AzmG8WDUaq9pz9zuyUSgCpZNi92EPd3UBpu2Gu78GKxQqZhM4530xzHqy3AHN+L5gpFoiVfOLhI/+0Vu5VcMT9suZRNmin4BS4FNB3zFor5uiDizEznkMZ7UF4WMR7yFbJRbixMHLgeNNKbyHrNxqP8CL6MTF25CB7KxiOlm/cKD+o4jh4bfy5npOJJg3M9x02nUcqDKkQjZN1oZEOCSbFGMAbCqhwbk+tCmaXJ9Y/PtgOaotGLmDavPHHPt1yriklcXnQ/DInDBhIHaNDrn15TuJAvxImms+l+gFDto2ulo5zP1gWlLLohqFcpUwyFkTp2JigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 14:55:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 14:55:49 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][master][PATCH] rm_work: add note about how to clean all
 built recipes' workdir
Thread-Topic: [OE-core][master][PATCH] rm_work: add note about how to clean
 all built recipes' workdir
Thread-Index: AQHZBVw4tZ4sJvWb3EyToDzsnJkXLK5Y6PcAgAG8yoA=
Date: Fri, 2 Dec 2022 14:55:49 +0000
Message-ID: 
 <CO6PR11MB56026132D00DDBE8754BBBE1ED179@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221201080904.6042-1-Qi.Chen@windriver.com>
 <35ea92148bf5fa123685be303936b0c2b5b5cf13.camel@linuxfoundation.org>
In-Reply-To: 
 <35ea92148bf5fa123685be303936b0c2b5b5cf13.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|PH0PR11MB4853:EE_
x-ms-office365-filtering-correlation-id: 07e3dc3d-bfb8-484c-1cdb-08dad4754d49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RIm7Uf1agzbONC8eoyJPuV20RvQMqj1H7t5L9Wo5EJ+dI8lsQvXzjxU43A1UFWwcn1afrMXD8FLuz5rB6h/XIhpsr2wShQy1o/zgRqPNFaxE9+VMvy2EW4M6SEASp4wqyZT8OwyFKK4kZUbo/PHqXoiLgZjE9OhN10VueRCWQ1k0b66YH3OD+X16QwWuChu/nIXADa+kW850pzYUgFzqYhEXhldK6oNZuJs5o41UFQ+3nTVhwzkt7BaLRg/wcYKHfOdrq5JsSWllV+YlZmYRx8jpp0vDcA6OBWa7eEMHuDB8zofHk3v9KhjLVQUR72zw6YtpLPfopE/W/aql9n/pJAzahERPXZ5H/wZXyKkPOZAjaAVtC+ZXSDtAbAlO86EaC7gTcwnr/m5UiBHZzSu0Shjt9zTFBnEbwpCKT2FhXRhu7n1nEtqloXEQxK87YKTHMvR9IUQDA9Ap0teWaJXipjbCT5wZBgUUlr/PcFZSDoA125Rphlkspwooh13Ge8ExoMhaAL94lRcWCbQx0juZauY23uKNVNXdbXFRw86K06Yq5gnlIrDyLivisnKpdd+xY/zUgnL5IpToaZT54HWcrKpkFWilu+pwlAwSF/KMyA7tXJWFRsOb7PVoO7RfZVP/0LYp0bvTgqOwXdU/b5p1UUl/ezaKuA2FCJwwjf+SigZqDyMg0Alp+YXx++PQ+HzjynGy/smcXl3gZU6eEjOfbQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39850400004)(136003)(346002)(376002)(451199015)(6506007)(38070700005)(7696005)(26005)(9686003)(53546011)(110136005)(478600001)(71200400001)(55016003)(38100700002)(86362001)(122000001)(66476007)(33656002)(83380400001)(186003)(66946007)(8936002)(66556008)(76116006)(66446008)(64756008)(8676002)(41300700001)(52536014)(5660300002)(2906002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZG5SNlZxOWlLMUd3RFc4MTdyOFd0bytSRnFXYzI2a1F1M1RZUUxsTy9JZDV3?=
 =?utf-8?B?YU9SRExmV0NCaTQxVFh6OWNZRjBocjBiUjhZZ2tGVEhCMEhiQUI4TGJXUCtN?=
 =?utf-8?B?NVk4aTNJUzdLMFJva2hxVHVialV0NzgxWlBDWkVBSDJFbFZSV3BIMk9XaWRp?=
 =?utf-8?B?ZCtSeEZjdlpiQkpnNEM0UEw5NFlCZE1PMjJ1VVBwT3lTWWdRZkVtcWNPVHhw?=
 =?utf-8?B?ak5tV2lRelE3WDB5UTNab09ZeWcxaEp0OGd1cCt4cWU1VGlpWmhpWmxDbVVG?=
 =?utf-8?B?cEtUTUt5WUJhRDFsSUtIMlpMK2JsbjlGc1AvVi9zYWFSRUNhRkk5Y3hmaU51?=
 =?utf-8?B?ZXFmZkxMNEEyRE9jTWsrd3JZWlRyTG5Hd05icm8xUzUxdE8xMTYxR29IOEJF?=
 =?utf-8?B?a3l2MGczSXlpUHp6SHBNRCs0aDJld3RwTXIwNXc1dlJUNS9FZ0RXM01Cd1Vi?=
 =?utf-8?B?S1dKTnhUZ0RpbnRXVExERW1oOGUvdDFMOGF2bWdZMTVpTnU0NEphbkZMQWN1?=
 =?utf-8?B?aHI0M1k4MHhUMklEUUh0RGVLWGtHeFhqYm5TcWhhcGtMelRrMHpzdzNjYkNU?=
 =?utf-8?B?d1NGY2d2b1RRWlJkQ2Y2OFZjZk5EYjVxbGNCMy9pSWxNSkJ1TEllMWoyYjB5?=
 =?utf-8?B?T0RkVThVblE1K0hOMkpwRWg2VE91N0tISDdubFlyWk9iNVF6NTcxcUQwQktK?=
 =?utf-8?B?Z1gwMWc2MldlMGlXdDl1SkxYT05YWCs0RXVBNHlwdSs5ZVFxYXZoZElNVWNB?=
 =?utf-8?B?eUx0QXRIWThlQWJWeGJreXAzVUlLVnNjYUpTYTZsaUlTaUplVUd5S3h4dVlr?=
 =?utf-8?B?N28vcVIvZXpBejBOQmFDOFplZVpaSy9UT1ZSM0Y4ZlRhbHlaNU56T1RCb0pH?=
 =?utf-8?B?S0xCMzEzWDhYaXlCbG9hUVVOVUtOYlJmdGd6eXc5bnNxbm44ZHdqVFZOQ0hH?=
 =?utf-8?B?cWRxOUc5WFJ4NzRHNW5mTElCTmUzaTZwallGaFFSZFJOUmt4WXdubzhrb21l?=
 =?utf-8?B?bS9yVHlRbWhPb1QvdG9oQ2JxOGlzTEpoUTNQWU5LMVNwRmlKV1IraVhIbm5a?=
 =?utf-8?B?WEZ2OTJpLzh0K0ZNWHRGd1crMEFndG1CTHZ1dmVvMnZsREtuSEhFZzV0d3dx?=
 =?utf-8?B?SDNMOTZtZU9ndldoNmVMTkNIdUJhT2JqQ1ZjTXlUS0ZVRlBOb1N5Tld1dE0v?=
 =?utf-8?B?ZmlSUlFuU0hLTVYrVHE3MjdtTlpEWW1aazBjUWp1ZEJacnFjK2dZL3F2WUxF?=
 =?utf-8?B?NldNZmtGZnZ3MEtlYmZpQWdLQnBSeGVINHZEbEZZVWNLc3BtdGFHWmN0djh2?=
 =?utf-8?B?VjVHaFNpbUZiUW9kWjBMQmFTdExrQkR6Y0l2bURjd1pEN1o1UlJheE1KSUs2?=
 =?utf-8?B?MWxocWxDOWMrU3d5UGwyR2U3dDk2eS84eVBlZ1FyTkwxK3crTzZRbUlDakdG?=
 =?utf-8?B?Lzl6V056U3JTTWx4N204czJsVXJtR282TkhuRW1TTlkwc3VFdkRreUFRVzdp?=
 =?utf-8?B?UDQzNFd2ZUVDMXlFYmxCaGc1VzJHdzNVb0tCeVc5QWo5citUR0RpM002Ty9V?=
 =?utf-8?B?S0pIaXVmRVZ3THVjTFk5cC9jcmhOZWxhZjZMU0ZsRGxQQWlFcEZCSWx2cHVp?=
 =?utf-8?B?QTY0R3hTOVpaYVFnUkwyZ2xwR05DeGZjN2xPTHo5Qm1lelFtWVhNZEJoQVNx?=
 =?utf-8?B?Nnh1T2luR3NDWlFPT1JqTWg1OUxaOUlnRGFCSFJRYjcra01HTDFLZndEVjdh?=
 =?utf-8?B?dkJoOE0vUytnalFPak1Za0pDSEhMcUplVytudnNCRGtNQkhKQXVBcitRK1ll?=
 =?utf-8?B?NTNkZXdPemNnSDJsY3RxWEh4dDdkY21uVnE5Zk5Ea1dNSmJUZ0kraUZ1QTkv?=
 =?utf-8?B?bWc5MDE2eFY4a0dibkNUVGM2aTJLTjJPanpjZ1FPOElleTk1QzM4OHh0OEZn?=
 =?utf-8?B?R3JmdFdUWWZVTnJkUXFkMGZHOHp4NnM5ZFhQWWJhT1ZZQmN1ZEEycHdXWDg0?=
 =?utf-8?B?MUxBYWZwc0Eyb1h3MGlndWVnOHlzQlJ1VVZGT0pNR1RlS3ptUXBnRVBRemw5?=
 =?utf-8?B?aUVHTXREUlN4M0lwSjFKaVJJS3cxUHg0Q01xNng3Ris3NHk5YjZMTTFLTFNV?=
 =?utf-8?Q?iBsZ1GTZ0gb08gDhX3QmobdmQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e3dc3d-bfb8-484c-1cdb-08dad4754d49
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 14:55:49.8933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +KnJIRK30jPgwwe+3bcb4+SA4C9gKEZB1wO66Q75/apQtyET87wHXevCMHcrjcRRmqtowKmgHXXanUMOt0IdAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
X-Proofpoint-ORIG-GUID: fKFIIkvM8pCihZ2IvRNIlmjZWSGnKYsN
X-Proofpoint-GUID: bUnhCSZDDudbQ_pHJKR6As89d_BnvERv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_08,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174237

SGkgUmljaGFyZCwNCg0KV2hlbiBJIHdhcyB0cnlpbmcgdG8gZmlndXJlIG91dCBhIHdheSB0byBz
b2x2ZSB0aGUgcHJvYmxlbSwgSSBmb3VuZCB0aGF0IHdpdGggYSBzaW5nbGUgbGluZSBjaGFuZ2Us
IHRoaW5ncyB3aWxsIGp1c3Qgd29yayBmaW5lLg0KDQotICAgICAgICBiYi5idWlsZC5hZGR0YXNr
KCdkb19ybV93b3JrJywgJ2RvX2J1aWxkJywgJyAnLmpvaW4oZGVwcyksIGQpDQorICAgICAgICBi
Yi5idWlsZC5hZGR0YXNrKCdkb19ybV93b3JrJywgJ2RvX2J1aWxkIGRvX3JtX3dvcmtfYWxsJywg
JyAnLmpvaW4oZGVwcyksIGQpDQoNCkkgcmVhbGx5IGRpZG4ndCBleHBlY3QgdGhlIGFib3ZlIGNo
YW5nZSB3b3VsZCBtYWtlIGFueSBkaWZmZXJlbmNlLCBidXQgaXQgZGlkLg0KTG9va2luZyBhdCB0
aGUgbWVhbmluZyBvZiByZWNyZGVwdGFzayAoZnJvbSB0aGUgY29tbWVudHMgaW4gcnVucXVldWUu
cHkpLCBpdCBzZWVtcyB0aGF0IHRoZSBvcmlnaW5hbCBjb2RlcyBzaG91bGQganVzdCB3b3JrLCBl
dmVuIHdpdGhvdXQgdGhpcyBjaGFuZ2UsIGJlY2F1c2Ugd2UgaGF2ZToNCmRvX3JtX3dvcmtfYWxs
W3JlY3JkZXB0YXNrXSA9ICdkb19ybV93b3JrJy4NCg0KQmVzaWRlcywgYml0YmFrZSdzIG1hbnVh
bCBhYm91dCByZWNyZGVwdGFzayBkb2VzIG5vdCBzZWVtIGFjY3VyYXRlLiBJdCBzYXlzIGl0J3Mg
b25seSByZWxhdGVkIHRvIFJERVBFTkRTIGFuZCBSUkVDT01NRU5EUywgYnV0IGluIGZhY3QsIERF
UEVORFMgYW5kICdbZGVwZW5kc10nIGFsc28gaGFzIGVmZmVjdC4NCg0KRG8geW91IGhhdmUgYW55
IGNsdWUgb24gd2h5IHN1Y2ggY2hhbmdlIHdvdWxkIHdvcms/DQoNClJlZ2FyZHMsDQpRaQ0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMSwgMjAyMiA3OjQxIFBNDQpUbzogQ2hlbiwgUWkg
PFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bbWFzdGVyXVtQQVRDSF0gcm1fd29yazog
YWRkIG5vdGUgYWJvdXQgaG93IHRvIGNsZWFuIGFsbCBidWlsdCByZWNpcGVzJyB3b3JrZGlyDQoN
Ck9uIFRodSwgMjAyMi0xMi0wMSBhdCAxNjowOSArMDgwMCwgQ2hlbiBRaSB3cm90ZToNCj4gVGhl
IGRvX2J1aWxkIHJlY3JkZXB0YXNrIGRlcGVuZGVuY2llcyBhcmUgcmVtb3ZlZCBmb3IgYSBjbGVh
bmVyIA0KPiBkZXBlbmRlbmN5IHJlbGF0aW9uc2hpcC4gVGhpcywgaG93ZXZlciwgbWFrZXMgcm1f
d29yayBiZWhhdmUgDQo+IGRpZmZlcmVudGx5IHRoYW4gcHJldmlvdXMgcmVsZWFzZXMuIE5vdCBh
bGwgYnVpbHQgcmVjaXBlcycgJHtXT1JLRElSfSANCj4gYXJlIGNsZWFuZWQuIFRoaXMgaXMgYmVj
YXVzZSB3ZSB1c2UgdGhlICdkZXBlbmRzJyB2YXJmbGFnIHRvIHNwZWNpZnkgDQo+IHNvbWUgZGVw
ZW5kZW5jaWVzLCBhbmQgcm1fd29yayBjYW5ub3QgaGFuZGxlIHN1Y2ggY2FzZS4NCj4gZS5nLg0K
PiBkb19yb290ZnNbZGVwZW5kc10gKz0gIiBtYWtlZGV2cy1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lz
cm9vdCAuLi4iDQo+IA0KPiBJIHJlYWxseSBkb24ndCBzZWUgYW4gZWFzeSB3YXkgdG8gcmVzdG9y
ZSBwcmV2aW91cyBiZWhhdmlvciwgYnV0IHdlIA0KPiBjYW4gdXNlIGAtLXJ1bmFsbCBidWlsZCcg
dG8gZW5zdXJlIGFsbCBidWlsdCByZWNpcGVzJyAke1dPUktESVJ9IGFyZSANCj4gY2xlYW5lZC4N
Cj4gZS5nLg0KPiBiaXRiYWtlIGNvcmUtaW1hZ2UtbWluaW1hbCAtLXJ1bmFsbCBidWlsZA0KPiAN
Cj4gSXQgd291bGQgYmUgaGVscGZ1bCB0byBhZGQgc3VjaCBub3RlIGluIHRoaXMgYmJjbGFzcywg
YXMgcGVvcGxlIHdobyANCj4gdXNlIHJtX3dvcmsgbWlnaHQgYWxzbyB3YW50IGNsZWFuaW5nIGFs
bCB3b3JrZGlycy4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgdGVzdGluZyBpcyBkb25lIHRvIGVuc3Vy
ZSB0aGF0IHRoZSBleHRyYSB0YXNrcyBhZGRlZCBieSANCj4gc3BlY2lmeWluZyAnLS1ydW5hbGwg
YnVpbGQnIHNob3VsZCBiZSBtb3N0bHkgZG9fYnVpbGQsIGRvX3JtX3dvcmtfYWxsIA0KPiBhbmQg
ZG9fcm1fd29yay4NCj4gJycnDQo+ICAxLiBiaXRiYWtlIC1nIGNvcmUtaW1hZ2UtbWluaW1hbCAm
JiBncmVwIGxhYmVsIHRhc2stZGVwZW5kcy5kb3QgPiANCj4gY3VycmVudCAgMi4gYml0YmFrZSAt
ZyBjb3JlLWltYWdlLW1pbmltYWwgLS1ydW5hbGwgYnVpbGQgJiYgZ3JlcCBsYWJlbCANCj4gdGFz
ay1kZXBlbmRzLmRvdCA+IHJ1bmFsbC1idWlsZCAgMy4gZGlmZiBjdXJyZW50IHJ1bmFsbC1idWls
ZCB8IGdyZXAgDQo+ICdePicgfCBncmVwIC12IGRvX3JtX3dvcmtfYWxsIHwgZ3JlcCAtdiBkb19i
dWlsZCB8IGdyZXAgLXYgZG9fcm1fd29yayAnJycNCj4gSW4gbXkgdGVzdGluZywgdGhlIG91dHB1
dCBpcyBlbXB0eSwgd2hpY2ggZGVtb25zdHJhdGVzIHRoYXQgYWxsIGV4dHJhIA0KPiB0YXNrcyBp
bnRyb2R1Y2VkIGJ5ICctLXJ1bmFsbCBidWlsZCcgYXJlIHRoZXNlIHRocmVlIHRhc2tzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0N
Cj4gIG1ldGEvY2xhc3Nlcy9ybV93b3JrLmJiY2xhc3MgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMv
cm1fd29yay5iYmNsYXNzIA0KPiBiL21ldGEvY2xhc3Nlcy9ybV93b3JrLmJiY2xhc3MgaW5kZXgg
NDEyMWExMzI3OS4uYjU0ZDk0OWU0NiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzL3JtX3dv
cmsuYmJjbGFzcw0KPiArKysgYi9tZXRhL2NsYXNzZXMvcm1fd29yay5iYmNsYXNzDQo+IEBAIC0y
Myw2ICsyMywxMyBAQA0KPiAgIyAgICAgZWNobyAiYmFyIiA+JHtXT1JLRElSfS9mb28NCj4gICMg
fQ0KPiAgIyBSTV9XT1JLX0VYQ0xVREVfSVRFTVMgKz0gImZvbyINCj4gKyMNCj4gKyMgTm90ZToN
Cj4gKyMgQWZ0ZXIgcmVtb3ZpbmcgdGhlIGRvX2J1aWxkIHJlY3JkZXB0YXNrIGRlcGVuZGVuY2ll
cywNCg0KSSBkb24ndCB0aGluayB0aGlzIHdvcmRpbmcgaXMgZ29pbmcgdG8gYWdlIHdlbGwsIGl0
IHJlZmVycyB0byBhIHByZXZpb3VzIGV2ZW50IHdoaWNoIG5vYm9keSB3aWxsIHJlbWVtYmVyIGlu
IHRoZSBmdXR1cmUuIEkgdGhpbmsgaWYgd2UgZG8gYWRkIGFueXRoaW5nLCBpdCBuZWVkcyB0byBi
ZSB3b3JkZWQgZGlmZmVyZW50bHkuDQoNCj4gIG1lcmVseSBydW5uaW5nDQo+ICsjIGBiaXRiYWtl
IHJlY2lwZUEnIGRvZXMgbm90IGNsZWFuIGFsbCBidWlsdCByZWNpcGVzJyAke1dPUktESVJ9Lg0K
PiArIyBUbyBlbnN1cmUgYWxsIGJ1aWx0IHJlY2lwZXMnICR7V09SS0RJUn0gYXJlIGNsZWFuZWQg
dXAsIHJ1biAjIA0KPiArYGJpdGJha2UgcmVjaXBlQSAtLXJ1bmFsbCBidWlsZCcNCj4gKyMNCj4g
IFJNX1dPUktfRVhDTFVERV9JVEVNUyA9ICJ0ZW1wIg0KDQpJIGFtIHdvcnJpZWQgdGhpcyBpcyBy
ZWFsbHkgc29tZXRoaW5nIG1vc3QgdXNlcnMgb2Ygcm1fd29yayB3aWxsIGNvbnNpZGVyIGEgYnVn
IGFuZCB3YW50IHRoZSBpc3N1ZSBmaXhlZCAicHJvcGVybHkiIHRvby4gQXMgeW91IHNheSwgZmlu
ZGluZyBhIGZpeCBmb3IgaXQgaXMgZ29pbmcgdG8gYmUgcmF0aGVyIHRyaWNreSB0aG91Z2ggOigu
DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQoNCg0K

