Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA30E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 16:52:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33840.1725814329812532981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Sep 2024 09:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99818caecf=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488GlcRC004149
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Sep 2024 09:52:09 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj448x9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 09:52:09 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 488Gq8FF010524
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Sep 2024 09:52:08 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj448x9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Sep 2024 09:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p51Z5hJ3kRPIqwUwweDNkMdmNXx0AUqlfksyA5NhOdE1uRmCJVyITFUS5Q1Chb5ShuR6U6yYoJonBHwKh+I2OAVlFwyIbS6+3BFwdpq3muTpuFYqOSAMbpRooPX5aliubLn8iuM57YWz29plcKRytq3iIF8KAjdnUTT6/5CrzN6eOjHnyYgIScIKwy1kZs65HMo0Nxk4GSDUAgGj2Ws99T2RxBfa6H6WHa0Y6apoA3HcQilaytvsN5mURR8jbqSfGSyYAOUzOsEriJR1cCcoE/IQLTZGMrp3Go/2bR/BaU0+RGq4+TP03FPQ4/njabQg43NRlp5bH/im1+lCtkndCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ0INCrUBcsdQZvliNPSo3+iYg6v2URCkn5NjIFoT8w=;
 b=KQUIAfdg63ArlyeZOxlAQ/Dtnz7tFdHzYmP2FgS/pFCnc5u15I1UIFEJ05rCjGoIEfw8dpCsl5yu+kLC41PctxKEtMBwPPnKw27NPPPxhNFTMj0QxCU6+0JI6XPoSuIcYLLv7ZSWn9tY6maNVToASWhmjQRZ6jU8QAeLPkVvAS4J9LEHjVtnGuY0PIBWP7940NvQIjlnVQ9uKn6/QX/0OqwtnCGV0G1iBB6XiMaTVyUrBU6cpgJhUMZonSPxnxE4A3BxZ69fc/D8d9t/wBsQ8clUAWgI3WK5y4AmnLP8sbMFBPflO9oDAGAZ3bC8Y24KOUBFY6Go3WerVTOEhsltaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.25; Sun, 8 Sep 2024 16:52:04 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.7918.024; Sun, 8 Sep 2024
 16:52:03 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "sdoshi@mvista.com"
	<sdoshi@mvista.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/3] expat: fix CVE-2024-45490
Thread-Topic: [OE-core] [kirkstone][PATCH 1/3] expat: fix CVE-2024-45490
Thread-Index: AQHbAPLzoljH1G+DG0iII/S1E8HABLJOHHk4
Date: Sun, 8 Sep 2024 16:52:03 +0000
Message-ID: 
 <DM8PR11MB5703827BA5786C86CCC33DC184982@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <20240906132930.2926495-1-archana.polampalli@windriver.com>
 <7911.1725692124940297642@lists.openembedded.org>
In-Reply-To: <7911.1725692124940297642@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|IA1PR11MB7344:EE_
x-ms-office365-filtering-correlation-id: e4729fec-88e3-4095-e21f-08dcd02690d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?fNIPmwfK6QjMhUBCg98xcwE/HR8FN+F90qZ7vYnb0MxevyI9Khe0ELUf51?=
 =?iso-8859-1?Q?ryM2Tl+h5tzUHUnpPnvBrH43xO4JbwwdX0rQOU7miSAT9DBvZXzdCtuH7W?=
 =?iso-8859-1?Q?/pk3sNOXc3XkL+z2/mWM/58TSFwMQoFk7avhOgKKArJWGyG/HpSlcGm776?=
 =?iso-8859-1?Q?6FS2lIT9zB6iOxv2SNWb8Huxb/29FWbEn0Tz+GE6pYqhOWl+Pt0ifR9C6e?=
 =?iso-8859-1?Q?L2hBkTslonYgfI5VT5sTzX+kNDgNXwCD3T8wEV+CWg3cxfH2kA6IjZ/fXD?=
 =?iso-8859-1?Q?COmo7UglPlQHWzC24Zl3CbduVFbX/b1CwWDssYE1gezEFPb69AIMBJxT9W?=
 =?iso-8859-1?Q?sFmDdIfT53IORkULCsgvMC2W+Hmk0AayoraCXc/ndkuKKmM8f+qJ0E3LIP?=
 =?iso-8859-1?Q?R0P3Q65ocQSziFZtEf/S/Mvj8LS0xG5D4c+OPS5y4IbNvBfjTqfo1LHeb+?=
 =?iso-8859-1?Q?rd0qUXLlE9zMkhgkDsZmJckAhAi9Op7Zt+N6yn6qCL0AhUVF18cYYd9KgN?=
 =?iso-8859-1?Q?BJs0Lv7lfkWSq739NlsXTtHzv//7R2UR054oOLSw+gJmEwYt9+Nu25zluH?=
 =?iso-8859-1?Q?A++RHoWKkV12m7JdRdCxgO4xmIXq1S2EYsEUo3fmUzd0PMFFsPAsjHZWlk?=
 =?iso-8859-1?Q?T4DP+V59X5aUnhRczO+EEZiTuVhtBm+sWLh6WU0yz6RJgFxVpL3+5rmNNr?=
 =?iso-8859-1?Q?z5UMdH6UjR3yPGhX4afvdVubNJKshdOoqstr2yz/Pz1KZ8gWc7VIXZUc9f?=
 =?iso-8859-1?Q?/B3CCfapudJ+OzwraDXmaXUydPeoJSPAj2rIi0JKQk+tuMB+4kVxLR10Xy?=
 =?iso-8859-1?Q?w+e5V/LBISyb795icAH25bILCB1mTYFle5bd9JnfZVxVloT3n5JeIonCBc?=
 =?iso-8859-1?Q?glKGdb9LOY9esoGS76vRHu3wO0xE+tYWEIDE3c688729SuIwBH7iHG2WZm?=
 =?iso-8859-1?Q?R8uB4bgwS6w2JsW32xHs2+5ZGsPTF6rRUrDma3u/7kl3Fo+DZBQf8SxgrB?=
 =?iso-8859-1?Q?udj8xOLz0LoFe4q96R7TPvyqlnCV6nOqZiMEeenwPkvGDx4htHVNmmvie5?=
 =?iso-8859-1?Q?0eAwbD3dccIM4cyzDkhjERWxQaCdSKwYXoBA/ZExoGSf3JmHZQiT0fK8mA?=
 =?iso-8859-1?Q?mJaYevG091Xfr66yNZmfd6N3FAf586UA3bYmuWKvqSGfaB4G0brmGyCnF8?=
 =?iso-8859-1?Q?9g6GYAwvMIB/pJSG1+hKAvDoO8E/zFB5IzhHZ6gr418zRIlDdPB2eb923c?=
 =?iso-8859-1?Q?BmrdLDnIAdsyVuDX0xk6RltqfhGSeGR7hsZjjxikFGtTLm+ZA9maQ523Pr?=
 =?iso-8859-1?Q?1EPPgWOEby61rfBaEK/p6HF6tqcpVPMb1I6PnkLEidVaSTQ+YyU4TA4VjG?=
 =?iso-8859-1?Q?1n1Dxpvq2Zzct/y4OxKTezGsd7TFeyXBzEI2Ovg5G6iUu5as8E3EgJ2yhc?=
 =?iso-8859-1?Q?KreTIrjC5nQXLOEbri9FMJp+89bHPNxY8XZdUg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ZogNP6OqEqMo7e69mGHycOJRGjxXFkXVBpGMSDaGXR/SIT7jozhOU9A5Wm?=
 =?iso-8859-1?Q?27KM7WTH41HXfgQYQ7l970AW9TYGEPhMimsqPhta+Qc4kute/L1YUPTO2q?=
 =?iso-8859-1?Q?AD8qSFfRLLoOL4GAhqPB8mOsr48dzD6cxhnGFClY4VKj8KSPlQv9VqpkYI?=
 =?iso-8859-1?Q?S2MKU19xFZr9gF0NAyfLAKk4vGoydvWW0Z9YM3i4LORM3jQ2kmeGpoLI8Z?=
 =?iso-8859-1?Q?gyywGBwaDYhGzbbxJ5O1jIUDOzlJdAyjoidsmB1BuXGnb9VQw21F8P9FH7?=
 =?iso-8859-1?Q?2wvTT2xJGJaxHi2JvAQt/djxqQXdhavQBIJxrEZC3NbyblcjmWrQ24DTVy?=
 =?iso-8859-1?Q?Dig0aQso9i+owTUt39+5uqGYbloz7nU+ZeNWTZ0gqbn9neryQzx9/k20FF?=
 =?iso-8859-1?Q?DG6baE3aIiUcQlER5nPQsszZ8cGrDmfClRKrD/1L15JkDV0arh6uN04kHv?=
 =?iso-8859-1?Q?viM14BJOpBFsjBlvQmw99S88fa/XVJbmFmKOVUboxzmcg/yU6oNh2u2qUq?=
 =?iso-8859-1?Q?BXpqB/LSqub6sHJuBW5D38fEeoB6+pUaxNMMzO81gmML5Hz7hKGpzOG7/T?=
 =?iso-8859-1?Q?lOJ1ty4Te01v1lWGBdNWmtn2Od4UNIN75v7lIFiswSTp3GaT3ldNCzltN+?=
 =?iso-8859-1?Q?UgotfKhsUd8dZ6e2IETBxvtAdoOyOY4SfzqR7x7JhjY63ST30K435dbMkz?=
 =?iso-8859-1?Q?jhKgoTsMd4BQlvvcbdsGjVXxDhJxaLJ99CuiKlvckQdQHhjEjO2VMifDk5?=
 =?iso-8859-1?Q?jFyho02/g8K9CFIXr27XHFgcxeoPGU/uywOB9P2MMP0s5ERs9JoBiU+YSc?=
 =?iso-8859-1?Q?gWhkLuPQF+p1qhfIvMUK4uztDmUK27NNMJsTL6wxZPvi7XTvq6NjNgPX13?=
 =?iso-8859-1?Q?GT9u/q2OAta1PAESnzqwFM22UuU8XsJbN1AHgl+wHgQzZb2TUSObhP5Rz+?=
 =?iso-8859-1?Q?vbDDGa8J3nLqHVuJKTZvLBq2QuV+a6jd8tgpC0Q0jmSZZ2Tm3OOcQ5L1Uk?=
 =?iso-8859-1?Q?RuqwJFn2iG6Qnndd0TLsA8IBAS8apWDs1S2740M1fKDsRLnJ4Di+hfy9hN?=
 =?iso-8859-1?Q?RqXNXhpg4RxN/CqNkbB2VxUXNhpvX5BvSIw5si3DPYxCyaIJ90peqL8YfO?=
 =?iso-8859-1?Q?EWtSP+HVX83g4bqgPSAoCY2xUFdl+qIRneMaldNuW72ueDE32tqIAEBubv?=
 =?iso-8859-1?Q?QQBqjpBTqGOkQyBaYJP52nerQ9O+LhH7RkcjMe+ND1n/xE4xAxcqqSRoZH?=
 =?iso-8859-1?Q?xBDAI46urw5Oo7EtkVm1x59FzpOMfdxIO8evYpSiPvMirhP/D5mrFc2jx1?=
 =?iso-8859-1?Q?/KvFZz4Z7TQbT0mZhYrFn0jaOd0fZ76S2EnmfNRU0X8trcGkppnvJa6jM+?=
 =?iso-8859-1?Q?5SlQaiu5VJnr7IPZi/B/w2smqDdTvZ3rbTR3W/WAMvj8e7go+04RApG/f2?=
 =?iso-8859-1?Q?QRBo65P/ocevtXYOL9sKEzQnx198vKo+lR3VOxx2k0SW0QO3/eEFgQSLgi?=
 =?iso-8859-1?Q?fsUCQx4IOPr/u6qJFKdENrtmZ1zbkcarXYBPFChIAuaIsZ5oQ5qUnxEwzs?=
 =?iso-8859-1?Q?V0VbJMCdhOzWQhMCxZXBFvAzxp1vG/4MFv1nYO38YlLJzTt1mSumKILAxz?=
 =?iso-8859-1?Q?6/7FpL5GOrgUhrqGYidX3XgVb06O815/tbxfGxwYun5V4xH3piW7sUQg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5703827BA5786C86CCC33DC184982DM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4729fec-88e3-4095-e21f-08dcd02690d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2024 16:52:03.6639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NaoLrRZVlKMHCJJaLot3/yxp3TEXz8hJLdbvU8Plxkng4p1iY1z10RoqZvbz2EoFyR4AXaISU6/lQpQoHWUOQyQI4xDoXadq6zF8Cj5UucpnQqF+IsGTgWO9aPYDr8u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
X-Proofpoint-GUID: RSxGuN0FsvovyQDybVzaCTYB-2wzv07t
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66ddd639 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9
 a=wPNLvfGTeEIA:10 a=Dk8AD5F2oMKMhWHZ:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: t5AoPjbQrE4eeVcioc0AvFqlP_zz5pE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409080143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Sep 2024 16:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204304

--_000_DM8PR11MB5703827BA5786C86CCC33DC184982DM8PR11MB5703namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

expat/tests/basic_tests.c is not present in recipe version, will add these =
changes to runtests.c and will send V2.

Thanks,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Siddharth Doshi via lists.openembedded.org <sdo=
shi=3Dmvista.com@lists.openembedded.org>
Sent: Saturday, September 7, 2024 12:25
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [kirkstone][PATCH 1/3] expat: fix CVE-2024-45490

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.
Hi Archana,

The fix for this CVE consists of 3 commits (fix in file, test to check for =
issue and doc update)
(ref-> https://github.com/libexpat/libexpat/pull/890/commits)

Out of which you have backported only 2 (Fix in file and doc update). the c=
ommit for "test to check len<0" is not added in the patch

is there any specific reason to exclude it ? if not, could you send a v2 in=
corporting the missing commit too ?

BR,
Siddharth
A

--_000_DM8PR11MB5703827BA5786C86CCC33DC184982DM8PR11MB5703namp_
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
expat/tests/basic_tests.c is not present in recipe version, will add these =
changes to runtests.c and will send V2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Archana</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;openem=
bedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded=
.org&gt; on behalf of Siddharth Doshi via lists.openembedded.org
 &lt;sdoshi=3Dmvista.com@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Saturday, September 7, 2024 12:25<br>
<b>To:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [kirkstone][PATCH 1/3] expat: fix CVE-20=
24-45490</span>
<div>&nbsp;</div>
</div>
<div style=3D"background-color: rgb(252, 252, 3); padding: 2pt; border-widt=
h: 1pt; border-style: solid; border-color: rgb(156, 101, 0);">
<span style=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>CAUTION: This emai=
l comes from a non Wind River email account!</b></span><br>
<span style=3D"font-size: 10pt; color: rgb(0, 0, 0);">Do not click links or=
 open attachments unless you recognize the sender and know the content is s=
afe.</span></div>
<div>Hi Archana,</div>
<div>&nbsp;</div>
<div>The fix for this CVE consists of 3 commits (fix in file, test to check=
 for issue and doc update)&nbsp;<br>
(ref-&gt; <a href=3D"https://github.com/libexpat/libexpat/pull/890/commits"=
 id=3D"OWAdb84a9bc-ffc1-9e48-176a-c7ae5555ceb6" class=3D"OWAAutoLink" data-=
auth=3D"NotApplicable">
https://github.com/libexpat/libexpat/pull/890/commits</a>)<br>
<br>
Out of which you have backported only 2 (Fix in file and doc update). the c=
ommit for &quot;test to check len&lt;0&quot; is not added in the patch<br>
<br>
is there any specific reason to exclude it ? if not, could you send a v2 in=
corporting the missing commit too ?<br>
<br>
BR,</div>
<div>Siddharth&nbsp;&nbsp;</div>
A
</body>
</html>

--_000_DM8PR11MB5703827BA5786C86CCC33DC184982DM8PR11MB5703namp_--

