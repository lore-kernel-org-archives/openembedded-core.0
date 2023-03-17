Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F60C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 14:32:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20950.1679063566400363996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 07:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LobDlUKM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2440a05834=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HCTfgZ011297
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 14:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=K4AyYEb2wsxzCcgOFtfKhPHG9vxb5co0d/6CLfm68Y0=;
 b=LobDlUKMiG1+nXgeys7T9TbwIA91NECuuHXuOF8UXivIm42MY/mPvpRwdxEX+zKFhGhP
 LLmZS8DKQugDhjY0a+GIFpRCg1fzszIcwntvpdO01mVx1p3OSHHhmtN5cK2b894QVI/6
 2cowMcERPYS98ttuF//JIMwPKXtYn68Gq6y5JKyPgBRZ+Tmse+aiHoVeXtcbNyESRULW
 BbEDNHK/AK0qrRZq40cVJome8jmlVII+UkLBflOqwl0zPdS1MJhNvaneo0aaaI5rBzyi
 9Qz8abWcLC33WbQQDPkvttfa23dLe6UsYMoz6aX0j7vJO3gfi8PePRcy1GEI6M7SQAr3 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1h9s0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 14:32:45 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32HEWiK4007238
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 14:32:44 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1h9s0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 14:32:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsrxuasORtvDyvzai0JSJ+DRa9DHZCd6LgZClZzlm8wCxitoPchlCc2QIKXs8cDISJ/6FUcAe89rlb3x5uREf93PUSTX6giISQYCtdHdyDMsYHpufZlHwGu4lVhtI56jJm0h7G3KYO3vuZPaIrmA0DPtZ7YwfEm3lhWbur/A+d29wrYw5pf/kzUaD/Ty3awMmnl46zNd6u9Vm8Y/EtfTaU/xAa487k6lGZ5KAC3CIf5tdGHxqHIygYuCCD/SMOORDnL09OwDyzWbGsgSZEpvQlS4ZTrSiHIOeZRYB4UWrmPSwE8ZCnkZUXswsS06sGXH0oCxhv/ZuFWiC8qnmiHZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4AyYEb2wsxzCcgOFtfKhPHG9vxb5co0d/6CLfm68Y0=;
 b=oWwUnQZkMXRZphTkQG+xVEZka9hXGEZ145qW0iDPaxPvqcOwXIz4eZe6r6oIjJHiVoyCmYq5MMWNUl5MAooP7C1FAr6gJqtYDSe/AwWEseG5FxeKxHONDmT3CXEB0gJKXrnvGI3LvSp8IJY0UO9JdSipLLrVJBs7A74e1g5YOkfn1bdgbUYbmC13Wmuza7roOV8bVuEtYver2R6Ic2HISXjumwNGSdrFmm23R07HyVWjEq9dPo2eh0wzlRV2C494We9A40CbHdlIyJkG/GacjFnUYGcj/fyVm7NBkTCMaX+IRVbJEBa7VeKyke961a5IJ0gQ6qs4344jXBzvlWqfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 14:32:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%7]) with mapi id 15.20.6178.033; Fri, 17 Mar 2023
 14:32:40 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Marek Vasut <marex@denx.de>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Armin Kuster
	<akuster808@gmail.com>, Bob Henz <robert_henz@jabil.com>,
        Kristian Klausen
	<kristian@klausen.dk>,
        Nick Potenski <nick.potenski@garmin.com>,
        Richard
 Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] systemd-systemctl: Create machine-id with
 "uninitialized" text in it
Thread-Topic: [OE-core] [PATCH] systemd-systemctl: Create machine-id with
 "uninitialized" text in it
Thread-Index: AQHZVyZrhvJTudSFZE6U3DUPRvTAM67+3/AAgAAsGGA=
Date: Fri, 17 Mar 2023 14:32:40 +0000
Message-ID: 
 <CO6PR11MB560219C3F043786F9A9EF378EDBD9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230227191548.95504-1-marex@denx.de>
 <b006eac7-bc3b-59f7-0ac3-7701042bac54@windriver.com>
 <34a6fdfb-f96d-536d-7761-fb46b06a302f@denx.de>
In-Reply-To: <34a6fdfb-f96d-536d-7761-fb46b06a302f@denx.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MN2PR11MB4583:EE_
x-ms-office365-filtering-correlation-id: b8eab5f4-4881-428b-0813-08db26f4766d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VT4dsIsqc3UDbMWZNCl+oVPVzpyW+v+OkTw2sKPH/T5qxX/1HUKnP1TiJ8ZQc5wA5bGPTSpCCqBI0U0Khy+Nl7HqiqhokgzPUBr+1W2jh9C6Quhlfe73SSaXW9/J9gekN9Esp765vHezTtPbMyi+X23FBVuAhhBrhJ4w+l3Ha19jlJGhKLx9/dbk3qhrL6CSdNPYK/ahWPyUqYi50Ahu+aQGyD9f8+2ZgvEqGuFitPzdw/mkNtYv0bohibxPfeSYHnhOBLLhZfuCwYNMBrxGFBXiySUtLgEkyFoRqU5dAPhJWyfOLq2b5qM4NHFDX41M96JSPDqpq20jfbp71/DFALlawtDWb65Z9hJ6lYjt9K+OCA3HmTmHBHj/GvXsLjY4G69cvLbtJrFj+1iOIefHG8qUQjXgbQqqr8OWJpsSWa7beOcISy/i0xmM2kaoiHFRtXIqHXQQsrvXVKBgdgm9KjzRguS8ibwX+s9fBnz3Jhrb1zSNnU7t0zhRd9+zzD8OT68R3bWq7OpeeREgotG+PGgyfzGM/lkLIfd7YrCzh0APrNCeFsvDSuxMvEd166Y6mHMJYrIzzJVpcNrT8UVQFYJgZxh2azRJFzpsHULxvp3Lk+7kYBVv+wfieo/gIb8rv5sYG2bYljWnt+SdxtPdc5tc2/eEsdA/B9BFC8S1UokP21Sfxu8IPAIiis9+gnlt4mNR+hpkZjStRHIKpmIjOg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(451199018)(52536014)(4326008)(110136005)(76116006)(64756008)(66476007)(66556008)(66446008)(66946007)(8936002)(54906003)(2906002)(478600001)(316002)(8676002)(71200400001)(7696005)(5660300002)(41300700001)(26005)(186003)(9686003)(6506007)(53546011)(83380400001)(38070700005)(86362001)(33656002)(55016003)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RmNCZWR4Mm9takd1Z3hyV2s2VlFQNEUyN0lYY3dxSjl6dlFlUXZ3QjRLeVJZ?=
 =?utf-8?B?N0xRazMwOGIzeW5PMjREcVVGY05YRUE2Q1VLaUhMVHVMRG1zMTFIUW1wK2NS?=
 =?utf-8?B?V2pNbjhOL1ZWYUdwUk5rOWxpNzFlaUV1cU1CbU1maTRXMndCUXVwZEVmUmxo?=
 =?utf-8?B?WnFVNCtoaVpxWDI5bDdDYjdSd2hGbUVIbTluVERmTVFrUjV2RHlLemtTa3ZT?=
 =?utf-8?B?QllXdzVFY3h5bnI0bnpDU2p2QzkxVXgvY2xuYm5IZG9mcVN1a2RhckthZVFZ?=
 =?utf-8?B?L3RjN3BtL29LbUp2c3ZhWkhLMmN4QmdMcDNhaGxYQUl5YjlrQVZYbWFndy9S?=
 =?utf-8?B?L0hhUDE1ZGdTdG5BWUpNMCt5MlFEb1dSVG9RVEIrK0JLbjM4akJNUmUyQ3d3?=
 =?utf-8?B?VzQ0STE0NWpiTzFzUmJFdDdaQkxqdzVQSnlCeCtRL0ZsQ2JRcldob3BrbUE4?=
 =?utf-8?B?S1JuZ2N6YnFrOGRXY0ZWcll5YzB0Z1FFaUtNM3VtTlQ0ZFU5ZXZacmltRlcr?=
 =?utf-8?B?YTlab0xlZVMvL2lwV0RLZzh4VHhpYk90YUkrZXY4dEZPWlA5QzZ1a1NFV3J0?=
 =?utf-8?B?ZjBrc3doM0lKNDFUaXlVVTZqSHJneU80cnV4VjlibE9kQ2dHQUt6NE5XemVH?=
 =?utf-8?B?SCs1YVNuNGdadmFVUnBLVkR3QnFvdGZJWUhZVzZDd25qZHp2aWVqdzNrZkI0?=
 =?utf-8?B?MXdpRjBaTXlOM296UmJSbzJPZCtrMmFjaXJyYWp4T2ptMXZldFA1QXlwYURU?=
 =?utf-8?B?Z1JncTZsblRRNFBTcWE5anM1QTVEM1NPQkVacVBwQWNTMzBIaHBHbUtWbUFn?=
 =?utf-8?B?bzlpaGJiZFZwQmY2UG9wemtLc2s0T3ZpVllBZ2NxK2tGbnh1UEF3Zm9jOWdz?=
 =?utf-8?B?US9maW4yYlZITEJ1U254Um0ybm92aFJOQ0RCc1FCcnF4VFlVYVJ2ejhKZmlk?=
 =?utf-8?B?dmNnODBTd2JWRkhqcGtEcUorbW5kb2xDY3FnMzJTc1V1VGZUSkEycElQd1Zn?=
 =?utf-8?B?eUloelVtT1p4ZzQ0RzNPclE1eFV5MjFyTFh4RkZ6L2hhSTkwa0YzaGZ1dS81?=
 =?utf-8?B?RjJWUjgvTFZ2MTQzbmYweWQzOGR2TW5aMGdFRWZVQXFCMkJmL0NwYklCK0RR?=
 =?utf-8?B?bFFueSsvRVlaSjgvNlBXbDRma1RBTzNjVWUyeVpoOXpJSEIxaFlBSndkWEhT?=
 =?utf-8?B?VmNRSUUrellWaUNidXV1NHAvcmQrL21lMktSczFreXgxazJiamhJRms4N2k2?=
 =?utf-8?B?dFd2dzZkblJMVjhyajJ5bmp3L1E2bG5yeFpzQzIrbDlvRitZb21ncDVWejhJ?=
 =?utf-8?B?SlpWZXlLUFFDTFlKMFllbUdDQnR0dDFYTlVwU0FrK3RJUjVvTXJEVktQSjR2?=
 =?utf-8?B?ekxDK1dzM0JETUdYL09uY2dDeGVRMklzdk9PYi9sODRZRjhTN1A3bWpTaHkv?=
 =?utf-8?B?cmhBb2NIYjJ5VTYyREJTL05ieHZ3NlZrbkRNMHZwRTRNc2pCREYwMnRBcVFv?=
 =?utf-8?B?R2FpSWhjVEFnaVNUUjEwTmtLc1BadVluVlVzWVdzSmFhMDF3QXJOV0k2Mlgx?=
 =?utf-8?B?eVl0clJ6Yml4N0xhOG5NOWQrbnp3eEtncHNRVDBXQ2ZaYmFocENnSVoxQkc3?=
 =?utf-8?B?ZkV6eW9ydkExS0RvQWdqK2ZoUUtkNytkM254VTZ0N0FZcWJmSlo5cFpHRmI1?=
 =?utf-8?B?VFF5ZVVBRVQ5UUU2anRIZ3JaWU80bDh2MU1KQm4vQ2N6R3NJaEZPVGJUR2h0?=
 =?utf-8?B?VGc2d09GZ09DeENkd0lTWlVxdEZJQXZ2cFA1ODI5NVZBZkYzQUJGRlhxRGJ6?=
 =?utf-8?B?aHNNR3NMS0JjTTRkUVZoYjRwTlNwbDN5b2p3RlJGUmp1RFl1SlU4UUlldDVj?=
 =?utf-8?B?c0ZlTTJlVXh4cFQ2UjlLWTlKeElYZndvZy8wVTBJNWZ1ZEd4L0l5WWE3RzAw?=
 =?utf-8?B?bGxSTUtpYStiaUx3R01qOTZ3RkVDMlZaMjB3ckZLOEQyaUhRRkhTVGU5TGFW?=
 =?utf-8?B?Uks4RG5Xb1V0Sml1cFVpZnpTcHc4V3A1cTYzNHdhOHpVcGxVUkJZWE8xZ2Jw?=
 =?utf-8?B?MDRqV3Q1Q09HbXR5R2I5L1B3NFoxZ3pIelNteWhJV2tTL01MNks4UTZXZ3dR?=
 =?utf-8?Q?5nCmWOs/SVByKWohFEqbYJvPj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8eab5f4-4881-428b-0813-08db26f4766d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 14:32:40.3321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XUowhEf1eq1wlUEQipzu9IeK5Xs3nLs2abSaKaBg/q6Ihcf1jpEf21zM1EdNciXHFgLjLQzvn7yWmyBST/MVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
X-Proofpoint-ORIG-GUID: Ou7CHXjjvhxl8Sgorfv-DWDyUQaHCpt-
X-Proofpoint-GUID: EakFyCpUHEHki2RBVB-0JxNfJEISrnaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_09,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=684 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 14:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178755

SGkgTWFyZWssDQoNCkkgdXNlZCB0aGUgZm9sbG93aW5nIGxpbmUgaW4gbG9jYWwuY29uZiBhbmQg
dGhlIGZpcnN0Ym9vdCB3b3JrZWQ6DQpJTUFHRV9QUkVQUk9DRVNTX0NPTU1BTkQ6cmVtb3ZlID0g
InN5c3RlbWRfcHJlc2V0X2FsbDsiDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+IA0KU2VudDogRnJp
ZGF5LCBNYXJjaCAxNywgMjAyMyA3OjU0IFBNDQpUbzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJp
dmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNjOiBB
bGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBBcm1pbiBL
dXN0ZXIgPGFrdXN0ZXI4MDhAZ21haWwuY29tPjsgQm9iIEhlbnogPHJvYmVydF9oZW56QGphYmls
LmNvbT47IEtyaXN0aWFuIEtsYXVzZW4gPGtyaXN0aWFuQGtsYXVzZW4uZGs+OyBOaWNrIFBvdGVu
c2tpIDxuaWNrLnBvdGVuc2tpQGdhcm1pbi5jb20+OyBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBzeXN0ZW1kLXN5c3RlbWN0bDogQ3JlYXRlIG1hY2hpbmUtaWQgd2l0aCAidW5pbml0aWFsaXpl
ZCIgdGV4dCBpbiBpdA0KDQpPbiAzLzE1LzIzIDExOjEwLCBDaGVuUWkgd3JvdGU6DQoNCkhpLA0K
DQo+IFRoaXMgcGF0Y2ggaXMgZm9yY2luZyBzeXN0ZW1kIHRvIGRvIHByZXNldC1hbGwgYXQgYm9v
dCB0aW1lIChmaXJzdCANCj4gYm9vdCkgaW4gYSBmdW5jdGlvbiB0aGF0IHNpbXVsYXRlcyAncHJl
c2V0LWFsbCcgYXQgcm9vdGZzIHRpbWUuDQo+IA0KPiBJZiB3ZSBsb29rIGF0IHRoZSBjb21tZW50
cyBhYm92ZSB0aGUgY2hhbmdlZCBsaW5lLCB3ZSBjYW4gc2VlIHRoYXQgdGhlIA0KPiAvZXRjL21h
Y2hpbmUtaWQgZmlsZSB3YXMgZGVsaWJlcmF0ZWx5IGNyZWF0ZWQgYXMgZW1wdHksIGZvciB0aGUg
DQo+IHB1cnBvc2Ugb2YgbWFraW5nIHN5c3RlbWQgbm90IHRyZWF0IHRoZSBzeXN0ZW0gYXMgZmly
c3QgYm9vdC4NCj4gIiIiDQo+ICDCoMKgwqAgIyBJZiB3ZSBwb3B1bGF0ZSB0aGUgc3lzdGVtZCBs
aW5rcyB3ZSBhbHNvIGNyZWF0ZSANCj4gL2V0Yy9tYWNoaW5lLWlkLCB3aGljaA0KPiAgwqDCoMKg
ICMgYWxsb3dzIHN5c3RlbWQgdG8gYm9vdCB3aXRoIHRoZSBmaWxlc3lzdGVtIHJlYWQtb25seSBi
ZWZvcmUgDQo+IGdlbmVyYXRpbmcNCj4gIMKgwqDCoCAjIGEgcmVhbCB2YWx1ZSBhbmQgdGhlbiBj
b21taXR0aW5nIGl0IGJhY2suDQo+ICDCoMKgwqAgIw0KPiAgwqDCoMKgICMgRm9yIHRoZSBzdGF0
ZWxlc3MgY29uZmlndXJhdGlvbiwgd2hlcmUgL2V0YyBpcyBnZW5lcmF0ZWQgYXQgDQo+IHJ1bnRp
bWUNCj4gIMKgwqDCoCAjIChmb3IgZXhhbXBsZSBvbiBhIHRtcGZzKSwgdGhpcyBzY3JpcHQgc2hv
dWxkbid0IHJ1biBhdCBhbGwgYW5kIA0KPiB3ZQ0KPiAgwqDCoMKgICMgYWxsb3cgc3lzdGVtZCB0
byBjb21wbGV0ZWx5IHBvcHVsYXRlIC9ldGMuDQo+ICIiIg0KPiANCj4gSSdtIGdvaW5nIHRvIHNl
bmQgb3V0IGEgcGF0Y2ggdG8gcmV2ZXJ0IHRoaXMgcGF0Y2guDQoNCkhtbW0sIHRoZSBwcm9ibGVt
IGlzIHRoYXQgd2l0aG91dCB0aGlzIHBhdGNoLCBzeXN0ZW1kIGZpcnN0Ym9vdCBkb2VzIG5vdCB3
b3JrIGFuZCBJIHdvdWxkIGxpa2UgdG8gdXNlIHRoYXQuIEhvdyBjYW4gd2UgYWNjb21tb2RhdGUg
Ym90aCBvcHRpb25zLCBpLmUuIG5vIGJyZWFrYWdlIGZvciB5b3UgYW5kIHdvcmtpbmcgc3lzdGVt
ZC1maXJzdGJvb3QgPw0K

