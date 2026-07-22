Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D93AC44532
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:36:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44482.1784715367551261984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WJDqp3QQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16634ecc35=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M90Vp4743645
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=3gztx6i2olDFwXKG1aa1O+
	3HeAmq6c6ZqkASi0xrcRk=; b=WJDqp3QQC5lOaS4znDQHwJuhkntOAkasQuRkDn
	5D/ETMf0Z3FrcdXF13PRMBqIu7Xy7ozmatE/O/RFR+HpEl4bsZm1PZhlQDl7Yfi9
	3qfMvInJND8S22tQFH5HfqS2DoWS0op8DXbqtW63SRNJku8iCMuD4A7GPJCUKocb
	dGmClVTXT75CFIeyUUNVsyLo9HTIrsLvsCfGdI5VRPNRIO4h8gNbnufdhVsguZO5
	ysYYOdFSmTR2kQQ3gjpAOgU0b+30gZf2Pvewpj7qXjIoMhT2cjrMpuHma/H4JqfO
	2Et72LsXamWuMmqUTYz+hoOi4v0j0/MrD4HWu+usajPOoynQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fga8x7grk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 10:16:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6w/TNd/NFByX0am8xJ697WQUEI93OQHeoUNqMtiGbggdNc1WMl4bCCUkAizSPplfCrCKwwcZd2JRAqM4lOc7dF89S2aQjjHRrqaXcAASUreMml/bDO4+YLuS7x13IrGDfyhNPY9qveQe+xLN6zHop4oKJ1ckfNaeBd9gpC0i2h3ji2inOyrHMHd3+Y+tmm+OnHkzz6YEzS24I42uLDQ/75heOOqRRwHsOzofJRLl1Z4/ZJLLQT/UNDtjybzOH83GLOHXrvT4kulKSeXJIpDYbNgKIE8YSDhmAeB/ymgfl6UcBeQG0yeJtozgdTjrx9H0hnN+9SohGeGrjxvs2/isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gztx6i2olDFwXKG1aa1O+3HeAmq6c6ZqkASi0xrcRk=;
 b=twrAR6rBJVfFIYWv1GxGxHldoWCGZaJD7uvLy3SnhaUiSbRPf3DVDUzGUnMgeKmKL+ydXo7TATvd+y3aW2iUXXMr4l3rTLJE7poUpjMtdLbzSqoExR9HWBZ/57mcNCqjLHbVuuDu48YPgoweTCjW4FYrqIbKnE43nLaa7DELTdkeWLZ3Hhzb03f0UU9rlchwQoLTNC/esl7FI7qgR0/C8/tqomDIuiKH883rjJ1qlygzj9+Z0T/RX6WBIDaE/i6qkfenhINjYhzTMvpaPBvlV86UqJIjHyXXfwqLHnIutHLaodCFj8S+EJAIc1/dGX5knPN3Zk5jb4co6UbkXnTSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:16:03 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:16:03 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: =?iso-8859-1?Q?J=F6rg_Sommer?= <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Komati, Shiva" <Shiva.Komati@windriver.com>
Subject: Re: [OE-core] [PATCH v2] systemd.bbclass: fix service enablement for cross-install scenarios
Thread-Topic: [OE-core] [PATCH v2] systemd.bbclass: fix service enablement for
 cross-install scenarios
Thread-Index: AQHdGaX/gTGD084SG0ujiMAuKvObqbZ5S46AgAAHWGo=
Date: Wed, 22 Jul 2026 10:16:03 +0000
Message-ID: 
 <CH3PR11MB87745FC3E9511EBDCEBE293A8FC12@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
 <20260722064730.3212268-1-HimaniRamesh.Barde@windriver.com>
 <amCPncSGEt6euFYd@navimatix.de>
In-Reply-To: <amCPncSGEt6euFYd@navimatix.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-22T10:16:02.363Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|MN2PR11MB4599:EE_
x-ms-office365-filtering-correlation-id: 1ee8180f-ee2d-4573-07c3-08dee7da3c5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|8096899003|11063799006|10067099003|4143699003|56012099006|13003099007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 vQK46/xeg1OaWc2nprQoISYI+uXh8UYjBSCz1NMdqWsnAYcuaPPPUHhIcypzGWguJd2uhEOGYkruW3Vox5GDibyuLPaC+YElt1MSRsbSWOK5so18X1gxHpHJkGg3/4EQjW+SKEyGaa4f5xlGJhgKXC0+78bHxAB/220VvL5O1BMgDVkfjEt2aHvLiKDx4+d7lf1P9FGHnKz+HASgChGEVMu+yHmnMlfBd0VbYIkENLcVYo2zqBsbN7wy8WXQsohfdn2HnX6uNx0BWiH4Nl2bLeu436H7s78tgbOHbQhqpa3ZPNOwrXoLGLNTJ6JDusKGDqfn7yyR16o6lZwle6zcIdhiRvLlw4DUCIQ9+Y1UVNEUsfroZcAn1gEL858WSAYHxGRaurC0Icg7pQtLl1gz3979gJvFN/KAlzgcEfV1kkyyKV56ecqrIaQx2fFkMFtBwrWRjO6iPsi4ccL2Y7JnynkTBhTbja2kkvIOOf/jd2BKbncYL5xeLbZmKTD/NfESu0x/YWqKy6Yj8xOs1BQnRMLwmOVnA9kT7r0Yy8TC77MbceoF/XNJwamLbp70WpcLHnvF2dgg0g+k848sIWcwwHWJGhwaf4ZUDD4I8ZhgA6IzGZ3teU6Jd793T01ffsiRRhpx2yfrwJ4gIDB15GxIdIARqohO0O4pRXptZEF52rg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(8096899003)(11063799006)(10067099003)(4143699003)(56012099006)(13003099007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Edjiv0W2z/o2WPxSOh4Tf2UlYAsjdObzyTg3M3cCbqb/O89yGeAcQePXEy?=
 =?iso-8859-1?Q?hhez2Dfo1NwOeN7C72ednOjH063FhJYlJcGTiDR2JafVR9scxfmpVO8KXE?=
 =?iso-8859-1?Q?iOZcIoTegm+b1sY6f+AmzaED/kqjMH9+qWbWfr3F7mRM8VIKS3ETAvTZWc?=
 =?iso-8859-1?Q?1v8FurwTM2VtDIR6LmGnxxGtdWO88MgPEmhl2xed6Pt2Auvcj9RRGhwajr?=
 =?iso-8859-1?Q?BfFc4Cs9y433xqpSDWvIGeosomMdnGw4sCwLzb14oyWQUwNVrd9a2sOv21?=
 =?iso-8859-1?Q?JAoQ7xhxrmsSACuzRpfylXXln+Aa8BuKN2dbjZHJkMGdKsBsXyvjOEVc/P?=
 =?iso-8859-1?Q?3sBXIeJocfitWFqJ4Tu5hcZ+k3rE5b7kTkIDQZwATO1rhIR3u9CiQ/CjI8?=
 =?iso-8859-1?Q?+BiL5ZvcRGIr3/B36xZ64aXtN46pH98rV1dUO5JKqlnRtJTq4N2FF+ve7m?=
 =?iso-8859-1?Q?RxPmuLGe64h6ZIlbKILaUkJ+rwwQi0umVSCcAb20B083E5EtODrMcGUm8C?=
 =?iso-8859-1?Q?q9rYbZGq1S2bdumAJV3Ev5RqmEiuEwsClFTlJb292boBB2Z4dHRwBHPV9i?=
 =?iso-8859-1?Q?zUnZffTOCtg0QMnMBq2SHt9nNTMwGjnOtvHc397hQAd2JTMx2rT2GloV0G?=
 =?iso-8859-1?Q?Y8aho8bQcf0cTqG+C/sldBlIBG4xsCpwbjfnnz3IMajeWDwexj+7FvkmSx?=
 =?iso-8859-1?Q?jSKrBN7hiy3VzWS4cLhIrdaXLa8ylVbbo8ooWokbSuyVl9luSmry3al3HT?=
 =?iso-8859-1?Q?+eVG7j8zhhIi6XHGxHL5fFSzSNR6/Og37rpmF23whgZ/ovdnZEQrCG1Bpi?=
 =?iso-8859-1?Q?bDPL6ozaBsEGg05PogRVBXmIwUqBttiFe1SUUMACaMbcQDJWJJWNWmqGSd?=
 =?iso-8859-1?Q?IsGAREXFBUhdu0GmEjHh0bCzlL1iLggv1LLmAZRX5FcVT8ZXW1wXpHi1y3?=
 =?iso-8859-1?Q?HmQBGd4bRfYwUnp3aQKNpzahyHbdQbE5zjThJ8kNboOaT/zfeOlbdWALlj?=
 =?iso-8859-1?Q?HakXkvlZwKN/aWUgi8TrN/RY8pc8zGuqINRc2gT47Dh/o10VjLd0RCWLty?=
 =?iso-8859-1?Q?JeZ5p0lldw+Iiq1GI1xG+1fab+iXouWRGSlH7EZ46caEMOm7SjaG9gysk6?=
 =?iso-8859-1?Q?ms6yUWApdaIZ5cirJ8b698oLmy/TkyGDCBt+9Xx4dJbSzeUo37KQ0XUtcy?=
 =?iso-8859-1?Q?Z2TSCuDdh5Q9iZybyxtk1JLT6C5w/AzMkxNnoXuRY3hQXZwo+WstAHCnSJ?=
 =?iso-8859-1?Q?tO47xzzC6ms70V20p2IqcW9q3RmZhOSX8WXOxkN6H2Ec/QDqk3nZKUxdIo?=
 =?iso-8859-1?Q?6DM01v6ZD7eMkxNzn+W3HApBWg+A5vurJ7iW2QUoqR12ePivE1WVzr2cBM?=
 =?iso-8859-1?Q?z/fEtHlYcGfsUkmPnX6OnUZqLugWNzNrCHat1R+cBT/MGdyb1TyDtMen5e?=
 =?iso-8859-1?Q?eDI6pnM3i8n4miYo+gEI8zLDOIqFfOsCt0J4KfrbVS2IVfrMNUNAt11m5i?=
 =?iso-8859-1?Q?2QDQftGw0fr0C7n2IIToQUxO2SM5TFPBrxIQyetGygw86Zky/FZ7dEsJwA?=
 =?iso-8859-1?Q?FM8GmbSxJ6weEptMOnPCZLlE2Vp0kU4HYKZLK5vsGPV8BqwE37z1sBanGl?=
 =?iso-8859-1?Q?BB8lSJmsZJn/1DVJ1229WekPlWrIyb6dbpR7RzxJMr6jf/7PoERe5jWxxB?=
 =?iso-8859-1?Q?v5siq1SsZ6/C+W1kM0d8qNmfeNEqBQlnQ6EhopnzwKJMnCw5YlfnEOjEUK?=
 =?iso-8859-1?Q?Xgf25QRPkQyXQby59wvopJrU/W8afKZ2+bXaEdTtK9sy4La8/OhwnKURzG?=
 =?iso-8859-1?Q?xYl8rHtZN8+XrVkMz2pm6o9O82GW+OE=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	dcjqEu5NZayO8iHIe+Ysgk6MFBCZMBIQRjLsNBlrNSZW9FIPJ4LGk349VZB+31o4D5qjRtxcagZEbPwsKkAy4Smm4P2hjWWkH8OR3ICNkIhsvRz2chlwvbRY30g/eSUYsdUqcDJocKw/DvSWeEG7oTh/yeQE42j6Rn472+kT3ho9ysR7/BbEEYsQ1+AZKL2qGcjdeTY9uJdNtJq5KgzoNhlcChxMrViSYQ6MbvTjJOr2HkzwC60fCVxVeeCKWUjPaKLfLZoPftA577Nibb3ssCtlSXm0joRe7F/y6vGG/S3ojqusp3mDIuanJ7Jj/4T8qYRNwO8HiwTtTfIRK8YOTg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee8180f-ee2d-4573-07c3-08dee7da3c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 10:16:03.4426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SApRdovbVa9/8a/pEA5WRGLyrgoZSpIlXHhGd3kNLab0k1aDE/nNB8ONMRZYJOgGSldnKt8XGBn1Z7HKwiWP+MgfpbATV1EadGR8baDEYPtpAXcFD2PS9h5NQd/Q63hq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5OCBTYWx0ZWRfX86td7eG3Bngz
 ybOx9K/ot1wfCF9EPUwt+zlDbHhz9rLrIHpEZMIkRsG1eDzVQ07mGB+xD4mvOsKFh6uV9aL4K71
 xQFY6HsLnIDchE9C+YCjCjqXq6nO2jP94WHoSN6t8djTBpJAww7o
X-Proofpoint-GUID: eDNIusoD50EkK37N2TkuISR59ygiNLMu
X-Proofpoint-ORIG-GUID: R0Pm0-fKvZe5jh4yU_41pU_6ndQolHY0
X-Authority-Analysis: v=2.4 cv=XdO5Co55 c=1 sm=1 tr=0 ts=6a609865 cx=c_pps
 a=n2iMVF0J/Egc90AivcUAPg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=l_88qD64AAAA:8 a=Q4-j1AaZAAAA:8 a=iH329spom1eHE1IimiIA:9 a=wPNLvfGTeEIA:10
 a=WqFy7LFR3d61eXGv:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=sgQlBcfP8EIGAiSWe9Wv:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5OCBTYWx0ZWRfXztpYYf4NOQez
 jUA6VAQW0hhpIBloeOLAapu7oQckYj4Yjkb+P+4l/0Lk2coOoWizJuu+TlI9ebuztb9RV6xhK+S
 R3XQo8I1MbTvde0ozxfAE7h/oOFZCrQ/g3IxS20DnWatlCqhnJ9/T8WhASQsRda7m8fvh6JQtF+
 U5mKMxP0kva2zcJVVrzSSpZGB8TfxwDTysnPfCSFDiL/zHqchC/5nvGGeCvsKKWS1LdW1y98N7I
 dcfPSWk7xGmWCCSZkEv67hRcWTJ8LNSA1sjdFU+vxXNRtGTEsQBacxK3LaH3yMKVzDkkBvddgXt
 TerkJHCj6aY7xdKLb7eTYTrWIkeu+obyE8tZ8apsgWhmBIY+/JWI9sb7CSnbjOG1lRXvkMTDBBA
 Yz7mKBQvPqAdWOw/5rXzYMpo6bOJjlPiz9hr4QUcLtPslROXsNbqfmDlhVpQQRkc/uItzZH1RaT
 KvIJ6mZ61mh+xQ5aFNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220098
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB87745FC3E9511EBDCEBE293A8FC12CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241658

--_000_CH3PR11MB87745FC3E9511EBDCEBE293A8FC12CH3PR11MB8774namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the suggestion. Updated the wording to "image-build" and "on-tar=
get" in v3.

Regards,
Himani


________________________________
From: J=F6rg Sommer
Sent: Wednesday, July 22, 2026 3:19 PM
To: Barde, Himani Ramesh
Cc: openembedded-core@lists.openembedded.org; MacLeod, Randy; Komati, Shiva
Subject: Re: [OE-core] [PATCH v2] systemd.bbclass: fix service enablement f=
or cross-install scenarios

Himani Ramesh Barde via lists.openembedded.org schrieb am Mi 22. Jul, 06:47=
 (+0000):
> When packages are installed outside of Yocto's normal image creation
> (e.g., using multistrap, debootstrap, or dpkg directly on a host),
> the postinst script fails to enable systemd services.
>
> The issue is that the entire enable logic is gated behind
> "if type systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
> - If systemctl is absent on the host: the check fails, script is skipped
> - If host systemctl is present: it cannot find target unit files
>
> Fix this by separating the offline ($D set) and online ($D unset)

May it be better to say off-side and on-side or image-build and on-target?

> code paths into distinct branches. The previous code used a single
> OPTS variable to switch between "--root=3D$D" (offline) and "" (online)
> within one unified block. This variable is removed because the two
> scenarios now have dedicated branches with different logic:
>
> - Offline ($D set): Uses "systemctl --root=3D$D preset" per service,
>   which reads preset files from the target rootfs and creates symlinks
>   without needing the host systemctl to understand the target's unit
>   files. Falls back to "systemctl --root=3D$D enable" per service.
>
> - Online ($D unset): Same as before - enable, daemon-reload, preset,
>   restart. No behavioral change for on-target installs.


--
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de<http://www.navimatix.de>

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--_000_CH3PR11MB87745FC3E9511EBDCEBE293A8FC12CH3PR11MB8774namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the suggestion. Updated the wording to &quot;image-build&quot; a=
nd &quot;on-target&quot; in v3.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Himani</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> J=F6rg Sommer<br>
<b>Sent:</b> Wednesday, July 22, 2026 3:19 PM<br>
<b>To:</b> Barde, Himani Ramesh<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org; MacLeod, Randy; Komati=
, Shiva<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] systemd.bbclass: fix service enabl=
ement for cross-install scenarios
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Himani Ramesh Barde via lists.openembedded.=
org schrieb am Mi 22. Jul, 06:47 (+0000):<br>
&gt; When packages are installed outside of Yocto's normal image creation<b=
r>
&gt; (e.g., using multistrap, debootstrap, or dpkg directly on a host),<br>
&gt; the postinst script fails to enable systemd services.<br>
&gt;<br>
&gt; The issue is that the entire enable logic is gated behind<br>
&gt; &quot;if type systemctl &gt;/dev/null 2&gt;/dev/null&quot;. In cross-i=
nstall scenarios:<br>
&gt; - If systemctl is absent on the host: the check fails, script is skipp=
ed<br>
&gt; - If host systemctl is present: it cannot find target unit files<br>
&gt;<br>
&gt; Fix this by separating the offline ($D set) and online ($D unset)<br>
<br>
May it be better to say off-side and on-side or image-build and on-target?<=
br>
<br>
&gt; code paths into distinct branches. The previous code used a single<br>
&gt; OPTS variable to switch between &quot;--root=3D$D&quot; (offline) and =
&quot;&quot; (online)<br>
&gt; within one unified block. This variable is removed because the two<br>
&gt; scenarios now have dedicated branches with different logic:<br>
&gt;<br>
&gt; - Offline ($D set): Uses &quot;systemctl --root=3D$D preset&quot; per =
service,<br>
&gt;&nbsp;&nbsp; which reads preset files from the target rootfs and create=
s symlinks<br>
&gt;&nbsp;&nbsp; without needing the host systemctl to understand the targe=
t's unit<br>
&gt;&nbsp;&nbsp; files. Falls back to &quot;systemctl --root=3D$D enable&qu=
ot; per service.<br>
&gt;<br>
&gt; - Online ($D unset): Same as before - enable, daemon-reload, preset,<b=
r>
&gt;&nbsp;&nbsp; restart. No behavioral change for on-target installs.<br>
<br>
<br>
--<br>
Navimatix GmbH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
T: 03641 - 327 99 0<br>
Tatzendpromenade 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; F: 03641 - 526 306<b=
r>
07745 Jena&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; <a href=3D"http://www.navimatix.de" target=3D"_blank" i=
d=3D"OWA84ddc5fd-58de-9068-8d7f-c76dd3aae61e" class=3D"OWAAutoLink" rel=3D"=
noopener noreferrer" data-auth=3D"NotApplicable">
www.navimatix.de</a><br>
<br>
Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
</div>
</body>
</html>

--_000_CH3PR11MB87745FC3E9511EBDCEBE293A8FC12CH3PR11MB8774namp_--

