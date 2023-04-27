Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D07C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:30:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14820.1682580620250354636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=T9iCwlSr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34817e955c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R72AeX013069
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=eZ4IADGlVuroGjgkUht9rvnqp4/KeU1k+hP9Q0VDkUU=;
 b=T9iCwlSrtV98TruNQ4aSP7kV5O22OKoWbS8KLe1bL2n3acLvDWqD0Wrorjqevy1SdpIQ
 JuxKzijGQUJGp9nkgEo0q7T83IqgIa7r8HeSZKz5DDtV0FfAXGxjA99Qjqh1Lz45h6em
 ulJksujWtzFM0fHb22iiIKqCgfm4S5TuD7bljf8rHj6ETO6zGz0IQKqC9V6H2EpxCdr2
 21kjSSU+LEXMITRsREtzmjN5ULnwr20c9DNW3x17rUbW6dL44L+6fLcyh8k9fuUNL1Pu
 73dQaKqMYamiAtqkW7aNpExPsEeVRAHA99U08MWCs7653MzkZvTB30FDtOpsLdYQSFIW cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q46jbdafw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:30:19 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33R7UI7v002124
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:30:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q46jbdafu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Apr 2023 07:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv2wcZYEXTol1IlpDilcqQ0sxH20khR3HAzAk1qa4gnb94TlUxUFg5gDDErL9grEPTwDenFZAYK4dMDg5b39sHR3TgyS7HzVJvCJzLkFEFfHyg73HhjZuvi5WryL3nYU34LFiwobxt99rjubDi4YfI/ikRiLTPwqCIKuZIXBxQte+b6mhQxACvtcJ6xuaK6Izy86qdRlUNKmZfRAfa6C+yRMk48OL80d1LqEKFEQa/D2u70taLipJo8ecG8vvQVOqZdA6QCmjYRu+SARhY4mavv6GjXb7ZP4lizNRo7uxNR7bE++2Nn0K6j6+6euW019/rWVRP/rXCNCWxPfY5vMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZ4IADGlVuroGjgkUht9rvnqp4/KeU1k+hP9Q0VDkUU=;
 b=Oko50s8iYJKiwlwQz+jLlAsUWQt3UbQZdxWvBhXAjM4rc1+rBA4uqGs3nTgoEgmekb1tdIiEOv6isz1JbqMJuGMcbyaT3w+oU0PatJOlm3uP/B2sO/LjkQ3czJ7NcDSJhgBbeZ2yd9BtQEszZpnfaGRi+noU8mgxK92ky6NzEExnMskvQM74NYXt6iBAeVL++XovjyuXv+6sTQv0VpeNbz892rEpYwCS4AhKQnuOBnVbnSlxBC6pOdcfuVOFexCkB5IGdBHMYMR3Ln7/UapsuoD6y9j+gPrKHkoyugxL4ZXzB4Pb1y444YaZ1duHWOhBGLmQZJb0oqRqI0PVy+hkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Thu, 27 Apr
 2023 07:30:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 07:30:15 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
Thread-Topic: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required
 kernel to 5.15
Thread-Index: AQHZeCSs+PZv6Qqf8U69uIGwlxp52a8+vJEAgAAEkoCAAAKjcA==
Date: Thu, 27 Apr 2023 07:30:15 +0000
Message-ID: 
 <CO6PR11MB560204CC8CEB29806F20BAFEED6A9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230426095036.2632847-1-alex@linutronix.de>
 <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA3PR11MB7534:EE_
x-ms-office365-filtering-correlation-id: b80e0fe4-9b89-4ac5-8f88-08db46f13e6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oiPsjv8C9BxxoToTiKOwtqsUo1tZ2CnOSoiK0mdldDiPPrfA1SJXeaf/YltsvRV0Fvfganwx2FeXSVEOZiiN7dF78eFWkyTZg/3vK63qdyqjm4VLz6C25OGT1oYVkSp8txyZHjHSqZROhH/1zSwVSW9yh/ID9vbGtBmFD4tY/qOOUHGJIzAnDPrVwxFiZTjo+++Gm8lN3IqMZWIJoq3kOg17wsl1PAlk3/6JV1P9wn1KrYRddjQJKE29Cb2RGDZsWFD0wn5yGOe9sPk7BcorRReId1doUGo4Nkl0BVt8gxTmFTVJr4RXmJnYsqhjgXh32cjAmRiN18Qy2pFrUpti2tkchmUUxFKpfCquyYWLq1tobQfBkrhaYpKnIgM0p08WxbavE9B1TQlQikfIEDYoBUfNWEVPbPoq3uedBxyHAkMjeiW5ujW66MRh/kz/lGHIJ5V/daCwHHi3sbmNXChd5dz1m481QI650JcaYJpu3s8gLlErm0pwbKtwzfzGBVYOWS+bskLAV/Pg0Duv8XVOl2QuvvWaA4Kucn8jROx3lMGhiMCHuoF0bgjVEN/6agNak61rvfMu1DTX3tz0IlVjEeq/0DJ1Lxp46JvvGTrGcG5GqX7fsWnmeQdRpvc3naWS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199021)(478600001)(83380400001)(66556008)(55016003)(53546011)(26005)(9686003)(6506007)(7696005)(71200400001)(110136005)(76116006)(66946007)(54906003)(186003)(41300700001)(122000001)(38100700002)(52536014)(5660300002)(316002)(4326008)(64756008)(66446008)(86362001)(66476007)(38070700005)(2906002)(8676002)(8936002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NU9oQ3UyQ1ZSWktQT2xrbW1iOGpZMWh3NmxjRnJ5MlhXV2xWK1F3MWJ0aDl0?=
 =?utf-8?B?RUF2NitrM2QxUXhaRUZLcExGWTBMUXlRcHVvN3EzcUFwNHBLWDViemtwU1Ux?=
 =?utf-8?B?cnVoc241N3pYOVV1b0dKdXVHbmsxcW0wd20wY2xpVlZqVkNMTCszbWJGUVdJ?=
 =?utf-8?B?dkdNdTJIcXg0SG5HZkpUdWFBckxhdUdRUGdBdHlscFlkZkNGYXhNMEVCdkwx?=
 =?utf-8?B?cnRYZUhMcEwzZzFFNHVKMVRFRUhSYkYva3Zvc3AraGcwTHQvZ0JCMytJdEtO?=
 =?utf-8?B?SlFjV0ZRUHo2Zkg1a0tyaXUzNGk2dGhobHRpMXhKdzJNVGl3dno2clZEUk1M?=
 =?utf-8?B?eWE2WGpmOWk4Z1FNeTBib2U2Sjl3eFVEd3F0U3F0cmUwc2daSm1QOG9zTUpT?=
 =?utf-8?B?blZnMWZ1cDVEN2p1UzVOaDhRZHR2NzdxbEszdU15cmdZS2VWdXZjM2tFWWs2?=
 =?utf-8?B?eTBBdDRsdno5dTZzcUJpL3E4bk9nM3YxYTlZNFBJOXdCUDZ3YlJ0eFNqVGtZ?=
 =?utf-8?B?TjIwM2JYUDZ0S3dEdVdJVWZJOUVVVWpuV2t3YjE1bjZ3cVdkWk55MGsxaFV4?=
 =?utf-8?B?eFdhUU16NCtzd0RUeGh6Qll6WStoMVBpTU8zOFJ6dlJDU0UxeW9GcUR1VlFJ?=
 =?utf-8?B?NWJhNy9NbE51VmUyUGNXTkFhRXdCN3ZlMjRhdllyQnloVEdVWUxSVjFkTTRC?=
 =?utf-8?B?c3Jaa2VETG5pRU9NeEZhQnhPYVlQS0xpd2pXV0Z0YXBFR3pVbExNeUUvU1Iv?=
 =?utf-8?B?UEgxbVRTcHVYeFVlaytRNXNMOHIzL05VSCtSbmRMTFJKTkQ2MGNuZ0hyMlQx?=
 =?utf-8?B?RnQ0clR4aVZlenFrYTg1YkE2dGJzcXlSZWhFczdKSlBxQnlXTTgxWlZ6R0g4?=
 =?utf-8?B?RzQxRi9VUG9TYVFIVDNBaGhHdjRtak1RK0NWdXlUV3ZjQzdmVmNUODRxdzU5?=
 =?utf-8?B?WmwzYVMzQnJYNGVLQ2VoL3B4SzhXZGhQOFI5UFV6cysvRE1saW5TVGh1R3k5?=
 =?utf-8?B?WUxIVjNhWlQvdHh5Q3BaYnRPcGRBMTBlRWxVQWlDaDZHNWhQY1d1UzF2QWQ0?=
 =?utf-8?B?SGJVdEV0S1FVZXd1aFBDOHdqNURwOGplMlpzZ0FjOHgyVC9RVTlQM2VOSm9k?=
 =?utf-8?B?T3RRa2ZRWHd0YjR6N0hsWTBKQzZvczZxd05lWjBkSTJsWXJLVktGQ3RQQnlx?=
 =?utf-8?B?SUh2dW5hRWR6QUlqNmpUQU1DNGpZb0VtN1JmenZqM0IrVkJUN1A2MXptVXM2?=
 =?utf-8?B?b01KYVk5V054dTZ1UEJqaFRHNXFUYUV5RmdLb3JqK0Vhbm1DNTk1Nyt2VFpN?=
 =?utf-8?B?ZHJtZzEzOENOK2JqRDgxSVZ1Y1Y4cHpWQ0tnWlhERHJuU1NYNjFxNmtibFBz?=
 =?utf-8?B?SWl5c01ZbFllcmVmanhEZEZyN2wrN0U3em5NL09YRmpsbWx2cEJ4d3kySU9K?=
 =?utf-8?B?V003UTRaNTIvR0pnREp4aW1YYnl0bG9QSXNkZEY5K20ybDFXeWtVTk82ZnpL?=
 =?utf-8?B?NmpZMkVYVlIvWXBrSzlwajBkWFJGZG5GeWVTeVJOdFVhNFBIelNtcERIa3Bw?=
 =?utf-8?B?Z0VSWTByRklOMXFFZ21yNDJzMVFwWUJHUEFqWlVFcHZRZmkwY050YnNtMC9k?=
 =?utf-8?B?enBvZjREdWx1NytKcTBDSUNvSHJXU294Sk1YR09QUGRkMEhtbVp1bXkrbnZU?=
 =?utf-8?B?M2VJNFRjZWREZkRmS1VWUjU2eWFNaVdYU0pKWmdQdGNKR0NLZ21CKzRTZnI4?=
 =?utf-8?B?d3JTMmVzZzZEYVIzdE9Pek9rSnl1UVFYVEJiamNvSXlRekc2V2VRZmllbFpu?=
 =?utf-8?B?MXdYYnF5VG9lc0tubklHVHQzcm1DUzNZNVMyT0t5aUtBSzZWZzNYYjNOWjZF?=
 =?utf-8?B?OTg4ZGdlb05ENytSM2ZQeFVWK3hWR3JyMXVMYnptQ2xIbnVDYmYwMU9CMjlE?=
 =?utf-8?B?UW9nb2RnQjZSYUJtNVEyQ29tMjlsc3h1cVRERFdrOVo5R3ExN0EzbzNhQmtH?=
 =?utf-8?B?a0JDMnlTeExkc0Vyb3pyS0lmd2JmVzFjeHFzbGRqanBSVHZEL0pGY0hOcW9S?=
 =?utf-8?B?T0RuOHA4RkZkTGxHTG5XR3BCUVMwRDh6OHc3aURhUXRPUDJydzNBUFMxNzlW?=
 =?utf-8?Q?4h5QO+mpWNBm4pU19jNZsZYr0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80e0fe4-9b89-4ac5-8f88-08db46f13e6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 07:30:15.1105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: viD2Z+mTmsGQYyKN0ZVlKYxOIGQ1Wf98gDgZWB4TkLhAXyOtntx+y9HpagVRSW4qUHEDReByOCjZ3nSA5HbEuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-Proofpoint-GUID: uc6hW3gr02Gk6ljlk_2gBv0QOvyvA59d
X-Proofpoint-ORIG-GUID: jCoQsY7r4JKX1eYAj1olhCX0aflChHYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_05,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180472

RG9lcyB0aGlzIG1lYW4gdGhhdCBTQU5JVFlfVEVTVEVEX0RJU1RST1Mgc2hvdWxkIGFsc28gYmUg
dXBkYXRlZCB0byByZW1vdmUgYWxsIGRpc3Ryb3Mgd2l0aCBrZXJuZWwgb2xkZXIgdGhhbiA1LjE1
Pw0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4YW5kZXIgS2FuYXZpbg0K
U2VudDogVGh1cnNkYXksIEFwcmlsIDI3LCAyMDIzIDM6MjAgUE0NClRvOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc7IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+DQpTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAwNS8xMV0gYml0YmFrZS5jb25mOiBzZXQgbWluaW11bSByZXF1
aXJlZCBrZXJuZWwgdG8gNS4xNQ0KDQpPbiBUaHUsIDI3IEFwciAyMDIzIGF0IDA5OjA0LCBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3cm90ZToNCj4gV2hpbGUgdGhpcyBtaWdodCBiZSBn
b29kLCBkb2VzIHRoaXMgZml4IGFueXRoaW5nIHNwZWNpZmljIGZvciBlbmFibGluZyANCj4gNjRi
aXQgdGltZV90Lg0KDQpZZXM7IHBsZWFzZSBzZWUgdGhlIGxpbmsuDQoNCj4gVGhpcyBjaGFuZ2Ug
bWVhbnMgd2UgYXJlIGltcGx5aW5nIHRoYXQgeW9jdG8gd29udCB3b3JrIHdpdGgga2VybmVscyAN
Cj4gb2xkZXIgdGhhbiA1LjE1ICBhbmQgbWF5YmUgU0RLIHdvdWxkIGFsc28gbmVlZA0KPiA1LjE1
IG9uIFNESyBob3N0cyBhbmQgc2ltaWxhciBuZWVkIGZvciBidWlsZCBob3N0cyBtaWdodCBiZSBp
bXBvc2VkIA0KPiB0b28uIFBlcmhhcHMgaXQgd291bGQgYmUgZ29vZCB0byBkbyBzb21lIGR1ZSBk
aWxpZ2VuY2UgYmVmb3JlIGFwcGx5aW5nIA0KPiB0aGlzLg0KDQpJIHdhcyB3YWl0aW5nIGZvciBz
b21lb25lIHRvIHNheSBzb21ldGhpbmcgbGlrZSB0aGlzLiA6KQ0KDQpTREtzIGFyZSBub3QgYWZm
ZWN0ZWQuIFRoZXJlJ3MgYSBzZXBhcmF0ZSBzZXR0aW5nIGZvciB0aGVtLCBTREtfT0xERVNUX0tF
Uk5FTCB3aGljaCBzdGF5cyBhcyBpdCB3YXMsIGF0IDMuMi4wLiBLZXJuZWxzIHZlcnNpb25zIG9u
IGJ1aWxkIGhvc3RzIGRvbid0IGhhdmUgYSBzZXR0aW5nIG9yIGNoZWNrLCBhbmQgdGhhdCBuZXZl
ciBjYXVzZXMgdHJvdWJsZS4gVGhlIGZvY3VzIGhlcmUgaXMgc3BlY2lmaWNhbGx5IG9uIHJlbW92
aW5nIGFsbCB1c2VzIG9mIDMyIGJpdCB0aW1lIG9uIDMyIGJpdCB0YXJnZXRzLCBhbmQgYXMgYSBi
b251cywgZW5hYmxpbmcgb3RoZXIgb3B0aW1pemVkIHBhdGhzIGluIGdsaWJjIHRoYXQgYXJlIG9u
bHkgc3VwcG9ydGVkIHdpdGggbmV3ZXIga2VybmVscy4NCg0KVGhlIGltcGxpY2F0aW9uIGlzIG5v
dCB0aGF0IHlvY3RvIHdvbid0IHdvcmsgd2l0aCA8IDUuMTUsIGl0J3MgdGhhdCBpdCBpcyBub3Qg
dGVzdGVkIHdpdGggc3VjaCBrZXJuZWxzLiBXaGljaCBpcyBmYWlyIGVub3VnaCwgaXNuJ3QgaXQ/
IElmIHNvbWVvbmUgZG9lcyBuZWVkIGFuIG9sZGVyIGtlcm5lbCAoYW5kIHllcywgSSdtIHdhaXRp
bmcgZm9yIHRoZSAnb3V0ZGF0ZWQgdmVuZG9yIGtlcm5lbHMnIHNxdWFkIHRvIGNvbWUgb3V0IGFu
ZCBseW5jaCBtZSBmb3IgdGhpcyBjaGFuZ2UpLCB0aGV5IGNhbiByZXNldCBPTERFU1RfS0VSTkVM
IGxvY2FsbHksIHdoaWNoIHdvdWxkIGNvbmZpcm0gdGhhdCB0aGV5IHNob3VsZCBiZSBkb2luZyB0
aGVpciBvd24gdGVzdGluZy4NCg0KQWxleA0K

