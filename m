Return-Path: <david.reyna@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2685FCE7A89
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 09:02:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.57448.1695632528793929322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 02:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k9Crxhc5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=763279d83b=david.reyna@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P5rifA019722;
	Mon, 25 Sep 2023 02:02:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ZDbhL9DuIry/tG+r2n4yE/gaIlkrpOiNTQZWlr1th90=; b=
	k9Crxhc5nV/G8PP0HK2lecKjxPcoBR/CNo59vKJc+lVqk9vPFfqYPi/g+JTLgBUt
	eb/68ualqQaB/1Y8YKnf/ri49AD1Wd4no4d9mvZx4LsduPKSfuHGN64S5wOhy2x6
	eyGPTWURWGTnhIiynpXO942UUhiUaZgX+UNZEwIz8GOr+cQ/HHLUrTkPS/Qw3STs
	uNPALQdWF6gBpRoDrS3u2ZAYXr78eisj4+OxrhJveI75pu5RALrj4ts87a5aguDY
	7zByjNzcNyXUZSsuT0/jb88etdZRVV26/Mfvd8xo8nUGbu/96Yp0+5untbS6/J9G
	iZJWN+ynpj7wEBGvIssR6Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0hcyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 02:02:08 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 38P9278k009699;
	Mon, 25 Sep 2023 02:02:07 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0hcyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 02:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mw25VlL+3AJi0WVBNuk7UuMbOdo1mq5qgWmELUoH9u1rexejI6XUiJmgXmdV8jo+MWpuo4NgYgLZQMvMrQL8t/jc8wgVMiQldfj0w3Ywg35HbnGktZp2qPKb0OT7w8RfPXqRYcdk8qjJh/SjROmsWtSrw8x4iH5dBntmUbgWgKeQyLRE1visRV6IP6LQwYXjIYa8tKgVG7H+trha0Zk3bKtuGDcezuB93MlNU45QHnAOw5xiHiJPbWRAuapA6TFpCivMhUzK0WIGoVtW1bShhbNZFyWnziMJ2CJ44ogH63d4+J75HRbWFxSv72W8+KoW8EFg1Byb2Xpu36iBnTOKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDbhL9DuIry/tG+r2n4yE/gaIlkrpOiNTQZWlr1th90=;
 b=lIM5a2y3Adlas0LjpmNdoZayf0or9NnsIE0ZyW3lZbkaSNpJiKIkzhRfj8al1/MnlnlVM5Mhs9l8p2B7wCQD8oY/OnJ/m1B2ZpMPMGvwisYr+ctm1wOtm5EKXBXYy76gxQYGapjNEoEpNp7XabotVRRTj7BgvmbEs0FElWcQK1DO69k2D7KphyLzjobqF6Xe3XhhvzSsSXf88SV9rq8BgN8tD+VajfN6B1uUJfeqI5tZgFoZFbvxfr6r8Ytdk4M1OZT5jFwpw7iLaEBuU/whDRQpPdKqnRQ9/UcGswH62fkY6HNXEmtR2+wYlFAVNKt6pH2ttqpQwYywuSJRknGwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB4167.namprd11.prod.outlook.com (2603:10b6:a03:185::28)
 by DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Mon, 25 Sep
 2023 09:02:02 +0000
Received: from BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::c220:5fe7:d50b:a425]) by BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::c220:5fe7:d50b:a425%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 09:02:01 +0000
From: "Reyna, David" <david.reyna@windriver.com>
To: "rybczynska@gmail.com" <rybczynska@gmail.com>,
        "yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>,
        OE-core
	<openembedded-core@lists.openembedded.org>,
        "openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>,
        "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
        "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Steve Sakoman
	<steve@sakoman.com>, Khem Raj <raj.khem@gmail.com>,
        "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>,
        Ross
 Burton <ross.burton@arm.com>, Joshua Watt <JPEWhacker@gmail.com>
Subject: RE: [yocto] Security processes: YP needs
Thread-Topic: [yocto] Security processes: YP needs
Thread-Index: AQHZ5jjNAdhWZJaxGUeBI1c05jBKhrArSjbA
Date: Mon, 25 Sep 2023 09:02:01 +0000
Message-ID: 
 <BY5PR11MB41673328EC01C44668ED8870EAFCA@BY5PR11MB4167.namprd11.prod.outlook.com>
References: 
 <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4167:EE_|DS0PR11MB6327:EE_
x-ms-office365-filtering-correlation-id: 6751520b-3db4-4dd3-46d3-08dbbda614c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hBBOKXXrgmDPp/wMHGK/Og1pjlpQfGVlHPdxiD+W39ngF8Dy9pV6J+sMuSAinKgPh68J5G4MawHnciYkHERTDLFZ80RoKhChZ0VUfVO+t9BrpQacAnPCwaf9JC4r6JU5wyeFGXu9zOKn2PxxW8pj6jW9TkgctKsFqPWllr8Upcl6C+cHN+5VjJB8EMfUDrSEGRSdVBPD/XSN9dw7LQtl/cPtP7ioGuCH7ERKX+qJnXJDWg45xNEBLE34RduRO/2gxDUxV2eaFAB+UxMUI7FoTk8YekH2lNf4w4UVK3GiXDKy1QwcKeNuBJw6K7rXnXxTceLn/Ei1JLk4uHvODHT+nTfD9zQ1gW0yBaoPrs7rO8+hyLBVh+lxlEiHFsOhaook+/wPNsf1ZNPXf1KDUExpcb2v5Vea2iAXd7fx9iPxcLGB4DBT4H2afPHK4Ng1NH2rPjAAzouQ35zBaDcC96/0zsMuY30lh4LhKBhPxeUxr54uS0S2RHGl7DpZoJyV7xFuS+1n/MLrbDcoBh78t1ngVyDwB56zSWcKYxsQM4gqDWdxuMyQ3LF7e9foU7PC9ZmvMfAKr3z48+DkL9OuOgUvUbwMNgKHLaFVhBNF2ZguUjQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4167.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(366004)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(53546011)(9686003)(6506007)(71200400001)(7696005)(83380400001)(33656002)(86362001)(38100700002)(38070700005)(122000001)(66446008)(15650500001)(55016003)(66476007)(6636002)(66556008)(41300700001)(54906003)(110136005)(7416002)(66946007)(316002)(64756008)(76116006)(2906002)(52536014)(5660300002)(4326008)(478600001)(966005)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bE5FU3Fnd1pRanEyKzZUeTF2bk5zbkVneVBPc2t1TGFsay84RTJYWG9vdjFT?=
 =?utf-8?B?ZkwwVWVpeWQ1WkJ2bFU3bU1yaFhhYUNDZWJ5ZE5NNnZycm5PZUNFTzhwaGYx?=
 =?utf-8?B?QU9LT29DVkRoeXRJV0VZa3BRR1ZKNk5DNllXcVJhRzlkVkpkTTF6b2tNOTdW?=
 =?utf-8?B?Vm1HR1N3SjRTWmlZeW1RNXBJbGt3ZGJRa09tMm5VS3RGU0R5UWdRaElCUUx2?=
 =?utf-8?B?TFhzWFBBald0Y1BDaXFqRVQyL1luVytZd0FRZkEzeDk1dkxpblF5UXdWSTdw?=
 =?utf-8?B?Tnp4UjYyVWlxK3RCQmU2MHZjcEwyRFc2ZmtFU1IyQ3JjVS9CZ0pNQVhpdUo0?=
 =?utf-8?B?TjNoMnpJOU92c1BueU82WnFZM1l3OWUrMDhSWk9xcWhkR0grd081VGFZL3di?=
 =?utf-8?B?OHhoaDdMa2pRNE8zYVFJdENBQ0lNUFYrazRTOVJwZ1o0WHgrWVpKSVVoamhC?=
 =?utf-8?B?cUdQWU5pTU13VGRyQ1RmdFlwdzJYL1hVZGZqc2ZWN3g0TkZVdm9XNStYeFBo?=
 =?utf-8?B?UklSU290dE9OU1dvSGhyTitnWkFQZmNlZml2UmFoRDZVcWZ4eUJiTFpOSWMv?=
 =?utf-8?B?aGRuK0xtOEtHQ1lGSm81TU5jZy8wL1VJMU16STJOMWIydU0vSG5ZWkV2TEI4?=
 =?utf-8?B?RllSdUZCU0s1Qmg5dml4eHVPcks1VWdTSllGRzdnL25mT1JsNFEyVVFPcmZL?=
 =?utf-8?B?K01rSTBuWmlKQkpWbjY2L1NxT3ovakF0c1hmWTdldTM2NitOU0RDbG5QU2Fa?=
 =?utf-8?B?bG53VGk0U0cveENYWUFjbmlyY0NHQ0R2K3laeHMrakFGSXAwMmpaNUMxUFhL?=
 =?utf-8?B?bHN2by9UWllTNzhqVnRvcWpDMlEyamUrbDJwZDlwK25SN211UUxTYXJWZXZC?=
 =?utf-8?B?UzZZK2o1L3pGeDBSQUtpTGt2clRhRGIrR2dqcmtwcEt1SVBCMWhSaWZhMlNQ?=
 =?utf-8?B?OTV1WHNoNENJTmMwUmpPQ3Z6QzNuWDZIY0ZrT3JYQU42T0hwak1mSm9Wd2tO?=
 =?utf-8?B?cGx1dFB3RFpPL0hlNHlpc3ExRjB3ODgydTZVdi9MaytuZlR2NDI2cEVGbW1i?=
 =?utf-8?B?SkMzZjFkUkd0SXZOK3ZmdUdxaitDYUJibjZFM05BREdlSGE4SFhmZUJsYSto?=
 =?utf-8?B?WmVRR3dmVURzbzlHcDlxVmU2QzFBU1RCdVArSjJ3SEFXakdUTndXUnp2T0dm?=
 =?utf-8?B?S1poV3ZzdkVWR0NNVytZdlNjZUg5cnFyMHA2MGZjZlNiSDhMeFl4cklpQnBp?=
 =?utf-8?B?bThlZzNwTXBmNTU2TVY5OWlYUFpCMFNiOXY0em1lZFhqTjJ6UlJDaUFmdVk3?=
 =?utf-8?B?VzJVV203TzdpMWhDVnhqaDEyYVkwRkpFamtvdk1VNXhmaE5KYndNNTNUWlpr?=
 =?utf-8?B?K25nc2htcUM2N08wUm9ZU1R3SnVEL2pFVkRuUUhqUGMwN1pmbW04QlZLZGRC?=
 =?utf-8?B?MXM2ZWQ1RzhUWWRCY0VQcUVSL0xOa3ViMDJSRDZ0L2hJVmVzck56WU5ibUFz?=
 =?utf-8?B?NUI4ZjBkRGxFSXJnTEZxcnBLLzZDcFlZZUljLzdUVDBldVNkLzdQUVNqd1A0?=
 =?utf-8?B?TUpiZ0w2emNGN0l2TkpLOVFKd1BIMkxRNDgrRG1EQXBLNTdUaTJSck1aUDVD?=
 =?utf-8?B?dEZING14NWc3c0hOaEZVbisrKzR0YkxyMzVaeUppT3BKSTlHNmlqQTZtRTQx?=
 =?utf-8?B?VVhwVkNRSXBaMERmeGhORzlOU3RoOE5BeHplTGZyc2lDeVF3TCttNndIVmc2?=
 =?utf-8?B?Qms3bzMzRGcyL3M2THNoeWNpS0hNT3pKcFdxVFcrWStmM2svUmw1V1hnRWFi?=
 =?utf-8?B?NTBNWFgzcFVFYTVwWFhBNVJKaDRtRUdRS21HL3lEbjlEK1JnZjVIazVrM1Ax?=
 =?utf-8?B?U05TQ3drNkNETXRJQ1BuV3pSOHpMRmoycklmcnBFY0RkN3BkdG5zQTlxWlk1?=
 =?utf-8?B?QjFIeTMrMnlkT1NCMVRCYnZYd0d6bUNGOW5OdG9YcUwydHJLSDhuZzgzMjV1?=
 =?utf-8?B?bjQ1SnlQakh5K2huQmZrZHlBWnNReDFTR01sQnlPZE9Dbng0aVQ0QUV2U3Yv?=
 =?utf-8?B?VytiOXR6Y3BGdlByS1lVRzVBMWo0L2lUa3hjK3IvbGxaV21LOVdIRHRUQ3RU?=
 =?utf-8?B?VWxKL1dqSGNmZ0E1azJBc3NLbWZpY3ltLytQbXpQT0ZGNHVvWWE1cnlnUWNV?=
 =?utf-8?Q?b7F3oPzyiG+SX3M/w3WUwlTqkkRGpH2GjgfUux+DMn0k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4167.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6751520b-3db4-4dd3-46d3-08dbbda614c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 09:02:01.3120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gc824iMsYKFMoeWcPUQwKeEoLp+7C8lTJevP8OFdjtjg57BADNhzhNwHXS37/LZTiNgMWtjWEQJtBfsIGTo9vNtJk2f9TZUrAtvDEi9XgMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
X-Proofpoint-GUID: yCKZkHmSiapDycZbXI0IN6fjDponSq6x
X-Proofpoint-ORIG-GUID: 75rUGXIqlFGYrjgNTurNJazOnLjpfaqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_04,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309250065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 09:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188183

SGkgTWFydGEsDQoNCiogU1JUb29sOiBXZSBtaWdodCBkZWNpZGUgdG8gdXNlIGl0IGFnYWluLiBJ
dCBhbGxvd3Mgb25lIHRvIGRvIG11Y2ggYnV0IHJlcXVpcmVzIGNvbnN0YW50IGNvbW1pdG1lbnQu
DQoNClRoZXJlIGFyZSBtYW55IHdheXMgdG8gdXNlIHRoZSBTUlRvb2wuIA0KICAoYSkgIFRoZSBv
cmlnaW5hbCBkZXNpZ24gd2FzIHRvIHBlcmZvcm0gMTAwJSB0cmlhZ2Ugb2YgaW5jb21pbmcgQ1ZF
cy4gVGhpcyB3YXMgYSBidXNpbmVzcyByZXF1aXJlbWVudCBvZiBXaW5kIFJpdmVyLCBhbmQgd2Ug
aGF2ZSB1c2VkIHRoZSBTUlRvb2wgc3VjY2Vzc2Z1bGx5IGZvciA0LTUgeWVhciBub3cuDQogIChi
KSAgVGhlIG1haW4gbGltaXRhdGlvbiB3aXRoIHRoZSBTUlRvb2wgZm9yIFlvY3RvIFByb2plY3Qg
d2FzIHRoZSBsYWNrIG9mIGludGVncmF0aW9uIHdpdGggQnVnemlsbGEgKFJvc3MgcmFuIG91dCBv
ZiB0aW1lKQ0KICAgICAqIFRoaXMgaXMgdGhlIGNydWNpYWwgb3RoZXIgaGFsZiBvZiB0aGUgd29y
a2Zsb3cNCiAgICAgKiBUaGVyZSBpcyB0aGUgYXV0b21hdGljIGNyZWF0aW9uIG9mIGFwcHJvcHJp
YXRlIGRlZmVjdCByZWNvcmRzIGZvciBpbnZlc3RpZ2F0aW9uDQogICAgICogVGhlcmUgaXMgYWxz
byB0aGUgYXV0b21hdGljIHRyYWNraW5nIG9mIHRoZSBvdmVyYWxsIENWRSBzdGF0dXMsIGJvdGgg
Q1ZFcyBpbiBwcm9ncmVzcyBhbmQgdGhlIENWRXMgY29tcGxldGVkDQogICAgICogV2luZCBSaXZl
ciBoYXMgYW4gZXh0ZW5zaW9uIGZvciBmdWxsIGludGVncmF0aW9uIHdpdGggSmlyYSwgYW5kIHRo
YXQgc2F2ZXMgd2Vla3Mgb2Ygd29yayBmb3IgdGhlIENWRSBtYW5hZ2VtZW50DQogIChjKSBUaGUg
Z3VpZGluZyBydWxlIHdhcyB0aGF0IENWRSBtYW5hZ2VtZW50IHdhcyBpbiB0aGUgU1JUb29sLCBi
dXQgc3BlY2lmaWMgZGVmZWN0IHdvcmsgd2FzIGFsc28gZG9uZSBpbiBKaXJhL0J1Z3ppbGxhLCBm
b3IgYSBjbGVhbiBzZXBhcmF0ZSBvZiBkb21haW5zDQogIChkKSAgVGhlIFNSVG9vbCBoYXMgYSB1
c2VyIG1vZGVsDQogICAgICogVG9nZXRoZXIgd2l0aCBCdWd6aWxsYSwgaXQgaXMgZWFzeSB0byB0
cmFjayBzaW5nbGUgcGVvcGxlIGFuZCBldmVuIG11bHRpcGxlIHBlb3BsZSB3b3JraW5nIG9uIENW
RXMNCiAgKGUpIFRoZSBTUlRvb2wgYWxzbyBoYXMgdGhlIGJ1aWx0LW9uIGFiaWxpdHkgdG8gbG9v
ayB1cCB0aGUgQ1ZFIHN0YXR1cyBmcm9tIG90aGVyIGRpc3RyaWJ1dGlvbnMgKFJlZCBIYXQsIERl
YmlhbiwgLi4uKSBzbyB0aGF0IG9uZSBjYW4gZ2V0IGEgcGVlayBvZiBleGlzdGluZyB0cmlhZ2Vz
IGFuZCByZXNvbHV0aW9ucw0KICAoZikgVGhlIFNSVG9vbCBpcyBidWlsZCBsaWtlIFRvYXN0ZXIg
b24gdG9wIG9mIERqYW5nbywgc28gZGV2ZWxvcG1lbnQgYW5kIGRlYnVnZ2luZyBza2lsbHMgZm9y
IFRvYXN0ZXIgaW1tZWRpYXRlIGFwcGx5DQogIChnKSBBbHNvIHdpdGggdGhlIERqYW5nbyBiYXNl
LCBpdCBpcyB2ZXJ5IHNpbXBsZSB0byBhZGQgYW55IG51bWJlciBvZiBtb2R1bGFyIGV4dGVuc2lv
bnMgdG8gc3VwcG9ydCBmb3IgZXhhbXBsZSBDVkUgU2Nhbm5lciBpbnRlZ3JhdGlvbg0KICAoaCkg
VGhlIFNSVG9vbCBhbHNvIGhhcyByZXBvcnQgZ2VuZXJhdGlvbiAoaW4gdGV4dCwgQ1NWLCBhbmQg
RXhjZWwpIGluIGFkZGl0aW9uIHRvIGVtYWlsIG5vdGlmaWNhdGlvbiBzdXBwb3J0Lg0KICAoaSkg
VGhlcmUgaXMgYWxzbyBhICJwcml2YXRlIiBtb2RlbCBmb3IgQ1ZFcyB1bmRlciBlbWJhcmdvLCB3
aXRoIHN0cmljdCBhY2Nlc3MgY29udHJvbCBsaXN0cy4NCg0KUFJPUE9TQUwgMTogSWYgdGhlIGZ1
bGwgdHJpYWdlIGlzIHRvbyBtdWNoIHRvIGJpdGUgb2ZmIHRvIHN0YXJ0IHdpdGgsIHBlcmhhcHMg
dXNpbmcgaXQgdG8gdHJhY2sgYW5kIGNvb3JkaW5hdGUgd29yayB3aWxsIGJyaW5nIGltbWVkaWF0
ZSBiZW5lZml0Lg0KDQpQUk9QT1NBTCAyOiBJIGFtIGhhcHB5IHRvIGdpdmUgeW91IGEgbGl2ZSBk
ZW1vIG9mIFdpbmQgUml2ZXIncyBmdWxseSBvcGVyYXRpb25hbCBTUlRvb2wsIHNvIHlvdSBjYW4g
c2VlIGFsbCBvZiB0aGUgYmVsbHMgYW5kIHdoaXN0bGVzIGluIGFjdGlvbi4gSSBhbSBhdmFpbGFi
bGUgcHJldHR5IG11Y2ggYW55dGltZSBiZXR3ZWVuIDEwOjAwIGFtIFBhY2lmaWMgdG8gMjowMCBh
bSBQYWNpZmljLg0KDQpQUk9QT1NBTCAzOiBJIHdpbGwgc3RhcnQgcmVmcmVzaGluZyB0aGUgWVAg
U1JUb29sIHJlcG9zaXRvcnkgd2l0aCBteSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGxldmVsIGZy
b20gV2luZCBSaXZlciAod2l0aCB0aGUgV2luZCBSaXZlciBzcGVjaWZpYyBtb2R1bGVzIGxlZnQg
b3V0IG9mIGNvdXJzZSA6LSkNCg0KRGF2aWQNCg0KQlRXLCBJIGFsc28gc3VwcG9ydCBhbiBleHRl
bnNpb24gdG8gdGhlIFNSVG9vbCB0aGF0IG1hbmFnZXMgQ1ZFIHNjYW5uaW5nIG9mIGJ1aWxkIGlt
YWdlcywgd2l0aCBob29rcyB0byBhICBudW1iZXIgZXhpc3RpbmcgQ1ZFIHNjYW5uZXJzIChlLmcu
IFRyaXZ5KSBpbiBhZGRpdGlvbiB0byBvdGhlciB2dWxuZXJhYmlsaXR5IG1ldHJpY3MuIFRoaXMg
aXMgcHJvYmFibHkgb3V0IG9mIHNjb3BlIHRvIFlQIGF0IHRoaXMgdGltZSwgYnV0IGl0IGlzIHBl
cmhhcHMgc29tZXRoaW5nIHRvIGdyb3cgaW4gdG8uDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0b0BsaXN0cy55b2N0
b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgTWFydGEgUnliY3p5bnNrYSB2aWEgbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZw0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTMsIDIwMjMgNDo1MiBB
TQ0KVG86IHlvY3RvLXNlY3VyaXR5QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IE9FLWNvcmUgPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBvcGVuZW1iZWRkZWQtYXJj
aGl0ZWN0dXJlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IHlvY3RvQGxpc3RzLnlvY3RvcHJvamVj
dC5vcmcNCkNjOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZz47IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPjsgS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT47IG1hcmsuaGF0bGVAa2VybmVsLmNyYXNoaW5nLm9yZzsgUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+OyBKb3NodWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5j
b20+DQpTdWJqZWN0OiBbeW9jdG9dIFNlY3VyaXR5IHByb2Nlc3NlczogWVAgbmVlZHMNCg0KSGVs
bG8sDQpJJ3ZlIGJlZW4gd29ya2luZyByZWNlbnRseSBvbiBjb2xsZWN0aW5nIHdoYXQgd29ya3Mg
YW5kIHdoYXQgZG9lc24ndA0KaW4gWVAgc2VjdXJpdHkgcHJvY2Vzc2VzLiBUaGUgZ29hbCBpcyB0
byBnbyBmb3J3YXJkIGFuZCBkZWZpbmUgYW4NCmFjdGlvbmFibGUgc3RyYXRlZ3khDQoNClRvZGF5
LCBJJ2QgbGlrZSB0byBzaGFyZSB3aXRoIHlvdSB0aGUgc3VtbWFyeSBvZiB3aGF0IEkgaGF2ZSBo
ZWFyZCBhcw0KbmVlZHMgZnJvbSBzZXZlcmFsIHBlb3BsZSAodGhvc2UgaW4gQ2M6KS4NCg0KSSB3
YW50IHRoZSBjb21tdW5pdHkgdG8gY29tbWVudCBhbmQgdGVsbCB1cyB3aGF0IHlvdSBmaW5kIGlt
cG9ydGFudA0KYW5kIHdoYXQgeW91J2QgbGlrZSB0byBzZWUgYWRkZWQgb3IgY2hhbmdlZCBmcm9t
IHRoaXMgbGlzdC4NCg0KKiBDVkVzOiBWaXNpYmlsaXR5IGlmIFlQIGlzIHZ1bG5lcmFibGUgb3Ig
bm90DQoNClBlb3BsZSB3YW50IHRvIGJlIGFibGUgdG8gY2hlY2svbG9vayB1cCBhIHNwZWNpZmlj
IENWRTsgaXQgbWlnaHQgYmUgYQ0KQ1ZFIHVucmVsYXRlZCB0byBZUA0KKGVnLiBwYWNrYWdlIG5v
dCBpbmNsdWRlZCwgV2luZG93cyBpc3N1ZSkuIFRoZSBjdmUtY2hlY2tlciByZXN1bHQgaXMgYQ0K
cGFydCBvZiB0aGUgc29sdXRpb24sIGJ1dCBwZW9wbGUgYWxzbyB3YW50IHRvIGtub3cgd2hpY2gg
Q1ZFcyBkbyBub3QNCmFwcGx5Lg0KDQoqIENWRXM6IHN5bmNocm9uaXphdGlvbiBvZiB0aGUgd29y
ayBvbiBmaXhlcw0KDQpDdXJyZW50bHksIHRoZXJlIGlzIG5vIHN5bmNocm9uaXphdGlvbjsgbXVs
dGlwbGUgcGFydGllcyBtaWdodCBiZQ0Kd29ya2luZyBvbiB0aGUgc2FtZSBmaXggd2hpbGUgbm9i
b2R5IGlzIHdvcmtpbmcgb24gYW5vdGhlci4gVGhlcmUNCm1pZ2h0IGJlIGR1cGxpY2F0aW9uIG9m
IHdvcmsuDQpSb3NzIGhhcyBodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL0NWRV9T
dGF0dXMNCg0KKiBUcmlhZ2luZyBvZiBzZWN1cml0eSBpc3N1ZXMNCg0KUmVsYXRlZCB0byBDVkUg
Zml4ZXMgYW5kIGluY2x1ZGVzIGlzc3VlcyByZXBvcnRlZCBkaXJlY3RseSB0byB0aGUgWVAuDQpT
b21lIGlzc3VlcyBhcmUgbW9yZSBsaWtlbHkgdG8gYmUgc2VyaW91cyBmb3IgZW1iZWRkZWQgcHJv
ZHVjdHMNCihhdHRhY2sgYnkgbmV0d29yayksIHNvIG5vdCBhbGwgaGFzIHRoZSBzYW1lIHByaW9y
aXR5Lg0KDQoqIFByaXZhdGUgc2VjdXJpdHkgY29tbXVuaWNhdGlvbg0KDQpBIHdheSB0byBzZW5k
IGEgbm90aWZpY2F0aW9uIG9mIGEgbm9uLXB1YmxpYyBzZWN1cml0eSBpc3N1ZS4gRm9yDQpyZXNl
YXJjaGVycywgb3RoZXIgcHJvamVjdHMgZXRjLg0KVGhlIHNlY3VyaXR5IGFsaWFzIGV4aXN0cywg
YnV0IG9ubHkgc29tZSBwZW9wbGUga25vdyBhYm91dCBpdHMgZXhpc3RlbmNlLg0KDQoqIFZpc2li
aWxpdHkgb2YgdGhlIHNlY3VyaXR5IHdvcmsgb2YgdGhlIFlQDQoNClRoZXJlIGlzIG11Y2ggd29y
ayBvbiBzZWN1cml0eSBpbiB0aGUgWVAsIGJ1dCBpdCBsYWNrcyB2aXNpYmlsaXR5Lg0KDQoqIERv
Y3VtZW50YXRpb24NCg0KUmVsYXRlZCB0byB2aXNpYmlsaXR5LiBXZSBuZWVkIGVhc3ktdG8tZmlu
ZCBkb2N1bWVudGF0aW9uIG9mIHN1YmplY3RzDQpsaWtlIHN1Ym1pdHRpbmcgYSBDVkUgZml4LA0K
cmVwb3J0aW5nIGEgcHJpdmF0ZSBpc3N1ZSwgYW5kIGhvdyBvdXIgcHJvY2Vzc2VzIHdvcmsuLi4g
VGhpcw0KZG9jdW1lbnRhdGlvbiBzaG91bGQgYWRkcmVzcyBwZW9wbGUgd2hvIGFyZSBub3QgcmVn
dWxhciBjb250cmlidXRvcnMuDQoNCiogQWRkaXRpb25hbCB0b29saW5nDQoNCldlIGNvdWxkIGFk
ZCBhZGRpdGlvbmFsIHRvb2xpbmc6IGEgdGVtcGxhdGUgb24gaG93IHRvIGFkZCBjdmUtY2hlY2sg
dG8NCnRoZSBDSSAocG9zc2libHkNCmEgZGlmZmVyZW50IG9uZSB0aGFuIHRoZSBhdXRvYnVpbGRl
ciksIGFuYWx5emUgdGhlIHJlc3VsdCwgYW5kIGV4dGVuZA0Kb3VyIHRvb2xpbmcgdG8gdGhlaXIg
bGF5ZXJzLi4uDQpJdCBpcyBhbHNvIHJlbGF0ZWQgdG8gdGhlICJBcmNoaXRlY3R1cmUiIHRvcGlj
IGJlbG93Lg0KDQoqIEFyY2hpdGVjdHVyZSB3b3JrDQoNClNlY3VyaXR5IGlmIG1vcmUgdGhhbiBD
VkUgZml4ZXMuIFdlIGFsc28gaGF2ZSB3aGF0IGlzIGhhcHBlbmluZyBpbg0KbWV0YS1zZWN1cml0
eTogaGFyZGVuaW5nLCBjb21waWxlciBvcHRpb24sDQpzZWN1cmUgcGFja2FnZSBjb25maWd1cmF0
aW9uLCB1c2Ugb2YgY29kZSBjb3ZlcmFnZSB0b29scywgYW5kIHNvIG9uDQoNCiogU1JUb29sDQoN
CldlIG1pZ2h0IGRlY2lkZSB0byB1c2UgaXQgYWdhaW4uIEl0IGFsbG93cyBvbmUgdG8gZG8gbXVj
aCBidXQgcmVxdWlyZXMNCmNvbnN0YW50IGNvbW1pdG1lbnQuDQoNCiogUHJlc2VuY2Ugb24gcHJl
LW5vdGlmaWNhdGlvbiBsaXN0cyBhbmQgcmVjZWl2aW5nIGluZm9ybWF0aW9uIGJlZm9yZQ0KdGhl
IHZ1bG5lcmFiaWxpdHkgZ2V0cyBwdWJsaWMNCg0KWVAgY3VycmVudGx5IGRlcGVuZHMgb24gcHVi
bGljIGRhdGEuIFByaW5jaXBhbCBkaXN0cmlidXRpb25zIHJlY2VpdmUNCnRoZSBpbmZvcm1hdGlv
biBiZWZvcmUNCmEgdnVsbmVyYWJpbGl0eSBiZWNvbWVzIHB1YmxpYy4gSXQgcmVxdWlyZXMgKGlu
IHNob3J0KSBwcml2YXRlDQpyZXBvcnRpbmcsIGEgc2VjdXJpdHkgdGVhbSwgYW5kIGEgdHJhY2sN
Cm9mIGV4Y2VsbGVudCBzZWN1cml0eSByZWNvcmQuDQoNCiogQmVjb21pbmcgYSBDTkEgKGJlIGFi
bGUgdG8gYXNzaWduIENWRXMpDQoNCk5lZWRlZCBpZiB3ZSB3YW50IHRvIGFzc2lnbiBDVkVzIHRv
IHRoZSBzb2Z0d2FyZSBvZiB0aGUgWVAsIGxpa2UNCmF1dG9idWlsZGVyLCBUb2FzdGVyIGV0Yy4N
Cg0KS2luZCByZWdhcmRzLA0KTWFydGENCg==

