Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E981ACCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:36:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3465.1760603750686585562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 01:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bFctZe34;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2384cafde6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G4ig3R1013882
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RKy+RqhTiTy08HfY3EeK7kwQ633TwkQcPAuDsu34D7w=; b=bFctZe34kV94
	D4UjLC25VDClf/yve1fInmU10NAM5VCDNuplzYrADgdhX2NL4CzklrK6xJwjQWAb
	MnXKxdmTkBCyz+I5fX+pViiz1TasoNn7S65TDwSobrSQMQDOWm/lHOu35LCx7VDE
	HVvdd23z5npRuJTXsk5krJ8md9nm7pzv1z8idaJQGIdqxsHcfYySf/kdi5UAqyBA
	lObY9DhWgyVuT4Un/sru88HOi39AUJmyn4/IRLtfISHH2a3klSOjovzjAPA6Pznk
	Jc3h5oY2Iw6bhL3eCvhM5sasCpHD8b/yE9xhgGrZErfTZHnAOw1ErLBpfDTCgprw
	QHZbe/1UwA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewp2ym-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:35:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9zOFvd9WAd+G4pNEZHSe1X0rpLTTlZpBSDU56/YsbcfI32w2uz5k7n2NXXNEYTkOrohoGvxTwLet5Gu8bdc3JyxFuZh2svsNMmBtGfN0/T4CMXdzsZuAjAxoEHCUHLemblUjVSl6O6Jyt3wN+yZL/vqAJQj+yjZ3X4DIaRQ/3g829fnCxRva+BFbd384L25CpC9/2Pq2c83rm1KciYmWt/Nmm0972zWfGgEtq3vsHIUkSIo8NxxTXO85AzUBAUAnLa6y2i9K+NqDC93xkVI9eNyl+j7h1nq39FTe888ElbBaxZcs+GTntvf5AAZUWWtO48PEEC8WnOEuixjnt6h4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKy+RqhTiTy08HfY3EeK7kwQ633TwkQcPAuDsu34D7w=;
 b=VDJmKav7HLQkZzgIq/IWJbbvRMyjCyOdIirnFGb+OhJ5S0iRCK44S8d7EHorTcQ2fEXOGzyo/D8frDlawF/a9tvDHgCHecJgkFf4hq3cRyTMsKxQTVV8wP5wfCQbP8SzrSg45xEf1nMXoAgaDH1fxvFEWMjMrADHR3u0CujfeFrLFHIWkP8L4t/co0aOhvXSO2ETKWl/ElBhrfs39phn55aWmUdRVBR92mAdG8LT5glQKuGT6TLQ4c8vOdf4Gvg9lmN5h6PorANkc2SJmLfXJ9Rhdzd7QLGgzeIOXhRnT9iDzrudpHctIkjHQVvSzoK92CCsOyHMZiZ78zpIRUO6dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 08:35:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 08:35:45 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix
 complementary package installation
Thread-Topic: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix
 complementary package installation
Thread-Index: AQHcLS80r+DEFVTXCU2Qgwnju6WaiLTElUYA
Date: Thu, 16 Oct 2025 08:35:45 +0000
Message-ID: 
 <CO6PR11MB560294040AD5A59501524E32EDE9A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250924084233.3429501-1-Qi.Chen@windriver.com>
In-Reply-To: <20250924084233.3429501-1-Qi.Chen@windriver.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=1182e6a3-6a71-4194-b7eb-72b7e7c12898;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-10-16T08:35:26Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SJ0PR11MB5816:EE_
x-ms-office365-filtering-correlation-id: c041859a-9120-4efa-41b7-08de0c8f003c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?TUB+VfEdV6pDjUOKeCwLedNz5wWh+KDz2OPpaMFpSfQXOYgY5MQnh+wLK0Ji?=
 =?us-ascii?Q?EC4WwDThem9GWdSVwjeRAF9ojDci93LkRT9HZo8A8xJ29zj0ik1Fe5pWM+No?=
 =?us-ascii?Q?UlkW/ro6PWSPMYAqJo/X7pptZaCjO85P/MUySkOIRIYh4JMDRMj4wxS2RPsU?=
 =?us-ascii?Q?KWvZ56rp2d9jtPmP7ijYCLxxyPTWbLqtfkSYkhuX1jD60CAYUJ204NX8WHGm?=
 =?us-ascii?Q?M0LTkZNtIiAIdrsaFU40w48yNqgk+Y62Ag2WdmhqRdRuANtBmcWvwCdNYaQF?=
 =?us-ascii?Q?D8l83W90+elNbHV06JSDlE9DeOHIKwK+gypfdPt+4daFaKzZho9hODyrCKA8?=
 =?us-ascii?Q?94gTfxf23EhOCNjcDNqe9zOV2eOm5JaYAl+dfv8YJZMrL/Utlz0OAhu3Pvdo?=
 =?us-ascii?Q?ABrJJ/3w3nz5bNFw31N/5Zan4+/pzr4cqrO8BrVidoyn67/Krz0IDSA/6XeE?=
 =?us-ascii?Q?KtMEfJIw7N80gOcN9lloEQII3yHB+M5HdRUUNJrz76Mz0D6r0GedMYLNvrM3?=
 =?us-ascii?Q?GGJjdBnENt6X4b1YVSdGo1lwMFodUPyKcI92ndj+/SeDDuhZkqMEtpUQdd5R?=
 =?us-ascii?Q?+wAqi0IWaWPCyoX3STGyAlqthwujDxclZK9g8ybu1mlo8T8q2vv4JmIoKkE+?=
 =?us-ascii?Q?Z9iziPYwBvB90d91cSDSn0f3GNzPVMn8xO/lSUyaU/FhxUN7Eu5RcT9jD8lo?=
 =?us-ascii?Q?URIf2U+Elnqr8n/xz/lqDLuT4Q5fVtj+j1Hjt/iLdwPJRDixmpE4SOqfW+nI?=
 =?us-ascii?Q?2OtigVoQiTJ08xywGE+R1rqC1Liy0jEBjFX3NLsRFnIvcXpkcjiaBcRYXTo+?=
 =?us-ascii?Q?xmVGE9UF/SS99RHqr7bcl8BwKb/kWtuPT6bvqaZgEXXeiAyQSeeWjT346D81?=
 =?us-ascii?Q?qol5K8Uk30gQBbahQwuZcqAZU1l0Phue36ncI8/ZvlVDzuRN34Pmp6QvWU16?=
 =?us-ascii?Q?32HnxUa+wUub6BeFykXS16IDIWjIow7weLnR4UaWIb2iX2LPbGxjcoF9RNOw?=
 =?us-ascii?Q?zWdb3H1LdmKmCuyOzVUh4nWkJ58wi10pv29bLJtj4psSlQGX1qW1V8sOfGVA?=
 =?us-ascii?Q?TJbwbg8dlBusb2qIWBlChKPfNN2ilBvLVeD3eC32OzSUHmhG1jyI19Lb5nz2?=
 =?us-ascii?Q?uELuyx/3xtBHSeKLkxTDMS3Oj/Z4P5TMVHMwhJ/b3CKCuw7DHZCNKO4BYPN3?=
 =?us-ascii?Q?gxWmt4Vhsj7LTL4JQx3AswP+7YqGSICpDZKPXWZ0fY4QuMF40hjpas46wmMN?=
 =?us-ascii?Q?eaL6HgNfxrK4aDH+weeYI0iNFOxRiviejxtlojr1lli0CX5qNY99riBCJ0kQ?=
 =?us-ascii?Q?jAxqRiqGKwZipTm1whY84BO6XORoRBMPQ8x+LizelkNGxvRxujeMftP1Awe9?=
 =?us-ascii?Q?zoKSVfiobxnxRGXRJBIKjJWy8Ve0uj/xyyBJxiNTPANalxDAsYk8L1bV8ZHk?=
 =?us-ascii?Q?40ddQRk3+Ksm59DSq96rJiCWy0kXLgKouNJr32+6mwyJbLp3ZDGHZA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?g7rQJrm7Qu8kQbYzILFOuTgGQU2gVOtUNly2Le78cEvWBG6OBLD47eY7mw/f?=
 =?us-ascii?Q?X6C1qVLQ/Ij1NsWfLCQM2ZlAYmugVzjV0rA1Cea9jiCivqd33xsH3uS1vyZQ?=
 =?us-ascii?Q?+teuCmu3quWeUmPrAE6tGJUGoZKstKGB0UmfPipD5by5Vcrrh2d8iKhkXh8+?=
 =?us-ascii?Q?U1Swzw4CH9NppZOrGz1khCrNLs0JlN22cdfUJffU1oAbrYq+AWEbYg0ZFybw?=
 =?us-ascii?Q?bfyRSMO+7dnHvmVsZknnelPjRSs7cQFq4Uj0bxX163a8o+NFHKgszJ0bFM7u?=
 =?us-ascii?Q?Gy6/6J8I28VCNTSXjmHobHW0iKA5hoH85FGAq2sSkWz4aFfVIlnrCXa0HuyH?=
 =?us-ascii?Q?0BKJ+doCMYrC3sctl87CljuPF7aXxMztBGO94+yLCOtiDAeJh9280dP54OuD?=
 =?us-ascii?Q?pfoDByv1jxyuP5SoBr5QRbMj4wOo6znvv3kkJaS2k8w3P7Ton1j3mE3wqFtw?=
 =?us-ascii?Q?YRJlTzkyvQ4zmvw0hCCrN8jpcLLMfVOer4B9WrKwlMUL45keXcFLp455ciEN?=
 =?us-ascii?Q?h1YmeAE/3jpi4XE/G/MvZuE6E4b0zM4yzxyoTAS5zwrrU6I2N+ivu7vhmTU6?=
 =?us-ascii?Q?U1i6a6N6WhF4lOnIa12ECrw4uZvizlPB91vepLdQYXDW3gUpD1HR8bdwyoO1?=
 =?us-ascii?Q?ITO5z2Y3nv0pcvxRlZprVKtR2SQ97Pqsvvwsupgjuzd3RU3k/Y1yHLhg8Iu7?=
 =?us-ascii?Q?Zoti5emg0m6n1HuTcznRhnTkT5G3XqtDSKHJJZqYf0JK5XUWVq0Jw9kAfhuu?=
 =?us-ascii?Q?OpffIijmaOQp4tEnPYKlO/ZB1EQ+pUZWEdou2XVoPhxqkNSEH0pbgJe3q0Ea?=
 =?us-ascii?Q?pdu5KU+A4iJIBw3AWS6Y9WIV5SsmeprJWg4Ehdgw2Gv/vYfFeAjSGnqXHDMJ?=
 =?us-ascii?Q?PxRVRAYijVStRihf+yF8TfJJHsRPzts1Tm1/MCLGDrrVqTS5i74sfw8jjBfF?=
 =?us-ascii?Q?8Ck11GTszkTxl+hBEz1ptn26ew0keXTOIOohQrFR23uhCRHpW9Paezm0j2nt?=
 =?us-ascii?Q?XIdHDscpacWUJoyqSTnUlveX0CmyCC5PnxmOsQHGM3I7+zihFML4f1zph9Jx?=
 =?us-ascii?Q?/Lxw/idudAyRaO5lR/zf0KwgZSzK3O0r2jdudEzXAsDvvXcHjHAN9K+9NkOu?=
 =?us-ascii?Q?nOLO0bN2sEAwXTLUPIEhkDrikE2t6f+uwZ33vpefBSm6ZdsxaU1KwXcLp8cw?=
 =?us-ascii?Q?x19y72/hdjxIYloV7pXgOz0mQ0EYu830aILLcZOmGKSlVEDn8BTGo2wpa19M?=
 =?us-ascii?Q?MJT+upPcdwus4cBBuHHRGk2RyOS8w0Wvt1G10mOPMsF9iZOhPKxP8DwQ6CAB?=
 =?us-ascii?Q?dJaElrrbGKEBqctYle3x2eFlY6an52Ep/pJVVhwwo3F7/7gsRyKlYy0joMaZ?=
 =?us-ascii?Q?9E0QvqeyHlejX5mofSE9YCGlyZz608u3j/FI0OI0F5z/1fqN4Wsy75cCSbKU?=
 =?us-ascii?Q?jVFPD6DlSetJaHu6a75N5Ry0fVDidpQyy5I35wOOAKhq/Fwsk9eKEFLbdGU6?=
 =?us-ascii?Q?BZ3VDESwAKLr/mCJrCt6fppfH5ITghurRuKTtIAOlbLBokj9/2jXlPfGv3tT?=
 =?us-ascii?Q?P/SRRRL3RuE2iaKXsC/Mpa5LHXsB65CLZ9SrQEp2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c041859a-9120-4efa-41b7-08de0c8f003c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 08:35:45.6489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xv+r+18bDNDMKgHDEzRyYr6DNeHF9v7LeqWB7+OeXJ3DLyCJjlFy5BeztTyAsUdCLKbYLehz2rUcRM2w+vuv9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-Proofpoint-GUID: 0cf6fuV5s5EzeH0NqI9ci0NOfg9NgocN
X-Proofpoint-ORIG-GUID: 0cf6fuV5s5EzeH0NqI9ci0NOfg9NgocN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA2NiBTYWx0ZWRfX6j07P2d6NGjC
 5JRjzYdAvoxz3hu2rmHiEVQ9mNZU+zCWoud/6nDVYMNUy28xNeSDTZu5adyGGT5jrrUHjyiM9Gg
 et28S79Min7pW+/3vQu3ENkRrDI1GY3xM+yNDH0n3MSc18wT4Dy3FmQFnGLsZVrPrAi1/YRat7Y
 9KKfHPa5r7MKLYruudfgV9AMKX5R4MsrVjTBFiV+9nzTrjOLq+Kf3G8IcS3HeF767GLS3QhJbKJ
 TYKIY/1BC55RUwhenfjGt4VAp/cRKOzqUVS52D5yW6wpuqB3imKl62wqCueRU3bp+r23gLx3PvC
 re7ktB8w698J1WsS7L4zUNimAfOZk+6dCjHi8QU1tIMj8KmRd5W9hBXbvEKV4Pec+C43qnYB7nF
 40fEmK3Z/He4FeEsHOUVKknFYxBbuQ==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68f0ae65 cx=c_pps
 a=FmVrivm6CVS+kYk2MGmjxQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=1011AmDLJHh65kVMvewA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224958

ping

-----Original Message-----
From: Chen, Qi=20
Sent: Wednesday, September 24, 2025 4:43 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix complementar=
y package installation

From: Chen Qi <Qi.Chen@windriver.com>

We currently have a problem regarding complementary package installation, t=
hat is, if 'oe-pkgdata-util glob' maps out packages that are not in the oe-=
rootfs-repo, we will get error like below:

  No match for argument: lib32-glibc-locale-en-gb
  Error: Unable to find a match: lib32-glibc-locale-en-gb

Here are the steps to reproduce the issue:
1. Add the following lines to local.conf:
   require conf/multilib.conf
   MULTILIBS ?=3D "multilib:lib32"
   DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
   IMAGE_INSTALL:append =3D " lib32-sysstat"
2. bitbake lib32-glibc-locale && bitbake core-image-full-cmdline

This problem appears because:
1) At do_rootfs time, we first contruct a repo with a filtering
   mechanism to ensure we don't pull in unneeded packages.[1]
2) oe-pkgdata-util uses the pkgdata without filtering.

In order to avoid any hardcoding that might grow in the future[2], we need =
to give 'oe-pkgdata-util glob' some filtering ability.

So this patch does the following things:
1) Add a new option, '-a/--allpkgs', to 'oe-pkgdata-util glob'.
   This gives it a filtering mechanism. As it's an option, people who use
   'oe-pkgdata-util glob' command could use it as before.
2) Add to package_manager 'list_all' function implementations which
   list all available functions in our filtered repo.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D85e72e12936=
2db896b0d368077033e4a2e373cf9
[2] https://lists.openembedded.org/g/openembedded-core/message/221449

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/__init__.py     | 78 ++++++++++++---------
 meta/lib/oe/package_manager/deb/__init__.py | 26 +++++++  meta/lib/oe/pack=
age_manager/ipk/__init__.py | 20 ++++++  meta/lib/oe/package_manager/rpm/__=
init__.py |  8 +++
 scripts/oe-pkgdata-util                     | 14 ++++
 5 files changed, 111 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_=
manager/__init__.py
index 88bc5ab195..b9a4218939 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -32,7 +32,7 @@ def create_index(arg):
=20
 def opkg_query(cmd_output):
     """
-    This method parse the output from the package managerand return
+    This method parse the output from the package manager and return
     a dictionary with the information of the packages. This is used
     when the packages are in deb or ipk format.
     """
@@ -369,40 +369,48 @@ class PackageManager(object, metaclass=3DABCMeta):
         if globs:
             # we need to write the list of installed packages to a file be=
cause the
             # oe-pkgdata-util reads it from a file
-            with tempfile.NamedTemporaryFile(mode=3D"w+", prefix=3D"instal=
led-pkgs") as installed_pkgs:
-                pkgs =3D self.list_installed()
-
-                provided_pkgs =3D set()
-                for pkg in pkgs.values():
-                    provided_pkgs |=3D set(pkg.get('provs', []))
-
-                output =3D oe.utils.format_pkg_list(pkgs, "arch")
-                installed_pkgs.write(output)
-                installed_pkgs.flush()
-
-                cmd =3D ["oe-pkgdata-util",
-                    "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_=
pkgs.name,
-                    globs]
-                exclude =3D self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
-                if exclude:
-                    cmd.extend(['--exclude=3D' + '|'.join(exclude.split())=
])
-                try:
-                    bb.note('Running %s' % cmd)
-                    proc =3D subprocess.Popen(cmd, stdout=3Dsubprocess.PIP=
E, stderr=3Dsubprocess.PIPE)
-                    stdout, stderr =3D proc.communicate()
-                    if stderr: bb.note(stderr.decode("utf-8"))
-                    complementary_pkgs =3D stdout.decode("utf-8")
-                    complementary_pkgs =3D set(complementary_pkgs.split())
-                    skip_pkgs =3D sorted(complementary_pkgs & provided_pkg=
s)
-                    install_pkgs =3D sorted(complementary_pkgs - provided_=
pkgs)
-                    bb.note("Installing complementary packages ... %s (ski=
pped already provided packages %s)" % (
-                        ' '.join(install_pkgs),
-                        ' '.join(skip_pkgs)))
-                    self.install(install_pkgs, hard_depends_only=3DTrue)
-                except subprocess.CalledProcessError as e:
-                    bb.fatal("Could not compute complementary packages lis=
t. Command "
-                            "'%s' returned %d:\n%s" %
-                            (' '.join(cmd), e.returncode, e.output.decode(=
"utf-8")))
+            with tempfile.NamedTemporaryFile(mode=3D"w+", prefix=3D"all-pk=
gs") as all_pkgs:
+                with tempfile.NamedTemporaryFile(mode=3D"w+", prefix=3D"in=
stalled-pkgs") as installed_pkgs:
+                    pkgs =3D self.list_installed()
+
+                    provided_pkgs =3D set()
+                    for pkg in pkgs.values():
+                        provided_pkgs |=3D set(pkg.get('provs', []))
+
+                    output =3D oe.utils.format_pkg_list(pkgs, "arch")
+                    installed_pkgs.write(output)
+                    installed_pkgs.flush()
+
+                    cmd =3D ["oe-pkgdata-util",
+                           "-p", self.d.getVar('PKGDATA_DIR'), "glob",
+                           installed_pkgs.name, globs]
+
+                    if hasattr(self, "list_all"):
+                        output_allpkg =3D self.list_all()
+                        all_pkgs.write(output_allpkg)
+                        all_pkgs.flush()
+                        cmd.extend(["--allpkgs=3D%s" % all_pkgs.name])
+
+                    exclude =3D self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTA=
RY')
+                    if exclude:
+                        cmd.extend(['--exclude=3D' + '|'.join(exclude.spli=
t())])
+                    try:
+                        bb.note('Running %s' % cmd)
+                        proc =3D subprocess.Popen(cmd, stdout=3Dsubprocess=
.PIPE, stderr=3Dsubprocess.PIPE)
+                        stdout, stderr =3D proc.communicate()
+                        if stderr: bb.note(stderr.decode("utf-8"))
+                        complementary_pkgs =3D stdout.decode("utf-8")
+                        complementary_pkgs =3D set(complementary_pkgs.spli=
t())
+                        skip_pkgs =3D sorted(complementary_pkgs & provided=
_pkgs)
+                        install_pkgs =3D sorted(complementary_pkgs - provi=
ded_pkgs)
+                        bb.note("Installing complementary packages ... %s =
(skipped already provided packages %s)" % (
+                            ' '.join(install_pkgs),
+                            ' '.join(skip_pkgs)))
+                        self.install(install_pkgs, hard_depends_only=3DTru=
e)
+                    except subprocess.CalledProcessError as e:
+                        bb.fatal("Could not compute complementary packages=
 list. Command "
+                                "'%s' returned %d:\n%s" %
+                                (' '.join(cmd), e.returncode,=20
+ e.output.decode("utf-8")))
=20
         if self.d.getVar('IMAGE_LOCALES_ARCHIVE') =3D=3D '1':
             target_arch =3D self.d.getVar('TARGET_ARCH') diff --git a/meta=
/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/_=
_init__.py
index eb48f3f982..0f74e1322f 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -112,6 +112,29 @@ class PMPkgsList(PkgsList):
=20
         return opkg_query(cmd_output)
=20
+    def list_all_pkgs(self, apt_conf_file=3DNone):
+        if not apt_conf_file:
+            apt_conf_file =3D self.d.expand("${APTCONF_TARGET}/apt/apt.con=
f")
+        os.environ['APT_CONFIG'] =3D apt_conf_file
+
+        cmd =3D [bb.utils.which(os.getenv('PATH'), "apt"), "list"]
+
+        try:
+            cmd_output =3D subprocess.check_output(cmd, stderr=3Dsubproces=
s.STDOUT).strip().decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the all packages list. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode,=20
+ e.output.decode("utf-8")))
+
+        all_pkgs_lines =3D []
+        for line in cmd_output.splitlines():
+            line_parts =3D line.split()
+            # the valid lines takes the format of something like "findutil=
s-locale-ga/unknown 4.10.0-r0 amd64"
+            if len(line_parts) !=3D 3:
+                continue
+            line_parts[0] =3D line_parts[0].split('/')[0]
+            new_line =3D ' '.join(line_parts)
+            all_pkgs_lines.append(new_line)
+        return "\n".join(all_pkgs_lines)
=20
 class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=
=3DNone, deb_repo_workdir=3D"oe-rootfs-repo", filterbydependencies=3DTrue):
@@ -436,6 +459,9 @@ class DpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
=20
+    def list_all(self):
+        return PMPkgsList(self.d,=20
+ self.target_rootfs).list_all_pkgs(apt_conf_file=3Dself.apt_conf_file)
+
     def package_info(self, pkg):
         """
         Returns a dictionary with the package info.
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pack=
age_manager/ipk/__init__.py
index 4794f31f88..2f330ec4f0 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -90,6 +90,23 @@ class PMPkgsList(PkgsList):
=20
         return opkg_query(cmd_output)
=20
+    def list_all_pkgs(self, format=3DNone):
+        cmd =3D "%s %s list" % (self.opkg_cmd, self.opkg_args)
+
+        # opkg returns success even when it printed some
+        # "Collected errors:" report to stderr. Mixing stderr into
+        # stdout then leads to random failures later on when
+        # parsing the output. To avoid this we need to collect both
+        # output streams separately and check for empty stderr.
+        p =3D subprocess.Popen(cmd, stdout=3Dsubprocess.PIPE, stderr=3Dsub=
process.PIPE, shell=3DTrue)
+        cmd_output, cmd_stderr =3D p.communicate()
+        cmd_output =3D cmd_output.decode("utf-8")
+        cmd_stderr =3D cmd_stderr.decode("utf-8")
+        if p.returncode or cmd_stderr:
+            bb.fatal("Cannot get all packages list. Command '%s' "
+                     "returned %d and stderr:\n%s" % (cmd,=20
+ p.returncode, cmd_stderr))
+
+        return cmd_output
=20
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name=3D'=
target', ipk_repo_workdir=3D"oe-rootfs-repo", filterbydependencies=3DTrue, =
prepare_index=3DTrue):
@@ -364,6 +381,9 @@ class OpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
=20
+    def list_all(self):
+        return PMPkgsList(self.d, self.target_rootfs).list_all_pkgs()
+
     def dummy_install(self, pkgs):
         """
         The following function dummy installs pkgs and returns the log of =
output.
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/pack=
age_manager/rpm/__init__.py
index 20e6cb8744..a51057650a 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -275,6 +275,14 @@ class RpmPM(PackageManager):
                 elif os.path.isfile(source_dir):
                     shutil.copy2(source_dir, target_dir)
=20
+    def list_all(self):
+        output =3D self._invoke_dnf(["repoquery", "--all", "--queryformat"=
, "Packages: %{name} %{arch} %{version}"], print_output =3D False)
+        all_pkgs_lines =3D []
+        for line in output.splitlines():
+            if line.startswith("Packages: "):
+                all_pkgs_lines.append(line.replace("Packages: ", ""))
+        return "\n".join(all_pkgs_lines)
+
     def list_installed(self):
         output =3D self._invoke_dnf(["repoquery", "--installed", "--queryf=
ormat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.=
%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nD=
ependenciesEndHere:\n"],
                                   print_output =3D False) diff --git a/scr=
ipts/oe-pkgdata-util b/scripts/oe-pkgdata-util index 44ae40549a..5b7cd768a4=
 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -51,6 +51,15 @@ def glob(args):
=20
     skippedpkgs =3D set()
     mappedpkgs =3D set()
+    allpkgs =3D set()
+    if args.allpkgs:
+        with open(args.allpkgs, 'r') as f:
+            for line in f:
+                fields =3D line.rstrip().split()
+                if not fields:
+                    continue
+                else:
+                    allpkgs.add(fields[0])
     with open(args.pkglistfile, 'r') as f:
         for line in f:
             fields =3D line.rstrip().split() @@ -136,6 +145,10 @@ def glob=
(args):
                         logger.debug("%s is not a valid package!" % (pkg))
                         break
=20
+                if args.allpkgs:
+                    if mappedpkg not in allpkgs:
+                        continue
+
                 if mappedpkg:
                     logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg))
                     mappedpkgs.add(mappedpkg) @@ -592,6 +605,7 @@ def main=
():
     parser_glob.add_argument('pkglistfile', help=3D'File listing packages =
(one package name per line)')
     parser_glob.add_argument('glob', nargs=3D"+", help=3D'Glob expression =
for package names, e.g. *-dev')
     parser_glob.add_argument('-x', '--exclude', help=3D'Exclude packages m=
atching specified regex from the glob operation')
+    parser_glob.add_argument('-a', '--allpkgs', help=3D'File listing all=20
+ available packages (one package name per line)')
     parser_glob.set_defaults(func=3Dglob)
=20
=20
--
2.34.1


