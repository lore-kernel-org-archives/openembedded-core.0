Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F386C5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 01:14:52 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9510.1787015691488836348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 18:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=XJgHsTeT;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=o+yXEQtN;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLo2Sd2179922;
	Mon, 17 Aug 2026 20:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MME8Bv1BGhp45PEVUS5XuM8x+lsI0yQEOWTALnYVI
	yk=; b=XJgHsTeTMXnLOfuXvVK8gKFi6x2fr9cfk4Sv70oUg2uf+vE8u0DDyGeXA
	6ZMmnQd7RiwUy7JKjPXOU1gR6R4/tgIoLvNLmXVeIHTu1i95XmgOTae+caFW0KsO
	0ZH2WRFof3u41S57pHvYJSXByajM9lIUZQCuUMgCo1ZktKrS/5JkvreA0+pwCNRf
	zhRZ4yaF98hjjprnN4aMF6RGZ3sTb/QcBHp7JRtMwygg/MkuVel82zoX4umEPLjM
	Z/nTi4MvvoCT3H6wot72m1Q4yGsuLIHwpdFvm7todfhS9zX96zVHJUjc7dXxUPhP
	JdH5yzO2TQDDjUE7OCcmQU+AX3WJg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g40dj4y4n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 20:14:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmdLw3cXFWEaeWJmjD8gfSqAKoOtiCG5Qe8HQwdAQEP3VMTzwuzFhr83JYpr2bkQiktmoGbnoqGjuO4pSsNvhtRzvzj/f4jtcilvlY1AkEV3qOuhlUm0YADBpdX94tAOaMxKJ+6MkOQtTgnBdXtbRBhnp8OfG6eVeTMWPZkxvDMRqCjk3Kz2WQMG+kYV8wVKlb4/FTMoGxYJ24UrfCH4fWhJuvy7Fzzem6iOuRQrfaaKcKP76nWqTVpzERW7yZeH0MVB5PYiLHkSmRIlXTKwvb+jCeaRLwKETxJamsQdq6S1Xd5MXl6J+WHUjXqldIMsC7WL8KGAcf7XmDFTgoWvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MME8Bv1BGhp45PEVUS5XuM8x+lsI0yQEOWTALnYVIyk=;
 b=i1674x/GTJaUNiRw4woXkXCieKHzlrjPsbXV30+3BP4XL/91K6EB1fJ4QRbMd9jJhCB+nAdUSHfVi5Ebfhz5AePMW9nLmxRgv4eX3mZT5kxK2l3mjwfgruVrLbSDcQI+0I8YsWqPcYNGniyAZwgy2uwAcTK/Qwv5gJpH9k2rHK4JYJ7UfcAXXWclzeetdxp1wDvi3vjUSF5raDTirY/2BIGATEEtaQqErfHv6PDCy/rf005LoTMiRyNMQ8oP1q6q36qFWRIfQ0IduqAhoT9A+Tfk4WtF9cF+KyR2T2IFnMCG+VJdm+Ae+DAK5zIZ2eh60lvzujDhM9BJi8VhwotvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=windriver.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MME8Bv1BGhp45PEVUS5XuM8x+lsI0yQEOWTALnYVIyk=;
 b=o+yXEQtN0zcN+tNtP103YccmAzmIv5wgorzgfotEksRqWwJ6a+XWwaX1moGi1RhP9yXWs+eJ4jmo/F2pR5S0YJl3s8vTeSt+l9b7NRBs0fq1k7LAZlLMuUl7uh1VR2Xr8rzTFL2yujITC8hmlU8lOd53lBlnwUP27v6w0eIfD+w=
Received: from PH8PR22CA0002.namprd22.prod.outlook.com (2603:10b6:510:2d1::26)
 by PH5PR10MB997710.namprd10.prod.outlook.com (2603:10b6:510:39d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 01:14:38 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::a6) by PH8PR22CA0002.outlook.office365.com
 (2603:10b6:510:2d1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 01:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 01:14:36 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 20:13:57 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 20:13:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 20:13:56 -0500
Received: from [10.249.32.188] ([10.249.32.188])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67I1DuWW482972;
	Mon, 17 Aug 2026 20:13:56 -0500
Message-ID: <48685035-4165-421f-b57f-7746e242221c@ti.com>
Date: Mon, 17 Aug 2026 20:13:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v15 00/12] rpm: 4.20.1 -> 6.0.2
To: <richard.purdie@linuxfoundation.org>, <sumanth.gavini@windriver.com>,
        <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <mathieu.dubois-briand@bootlin.com>,
        <mattware@cisco.com>, <esparlin@cisco.com>, <peter.marko@siemens.com>,
        <randy.macleod@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
 <9b1d36c0af04de14a7f59695e40f513dc454d7a4.camel@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9b1d36c0af04de14a7f59695e40f513dc454d7a4.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|PH5PR10MB997710:EE_
X-MS-Office365-Filtering-Correlation-Id: b30ee3fd-b7fc-4f4a-d19f-08defcc611d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|82310400026|36860700016|376014|1800799024|23010399003|13003099007|3023799007|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	1u2AehdKHtcbnBWz3ma5lEDr4TioKbRkzuqJNUfOsbghDojGex7nRhkoI8NrJ2dsOg8Be9uDkd3B+KwyPOaVBIkkxipNQu4Ujxzwo0s2Z62rb+MWar7ySctdqzSq9RowQUR19VK+9ylNXBIPFT4Q41K6i30l8UjYDzARPxcTwQ5mW1QCuOVxj9CZp0x30pTR1FigTNxVz9W6+wM7BenDwIoLv5BlCJM0jmnWkGr4eMite2eGRZFuGlLKPJb0dUkwC0NQ6OBNJFrJVYPeGSv/In4p6xwR/u46RseB546/ZvSVw7mqdIJUK3vVFbgwLSM9ygRKtQRyv170dwKZ7/hzehMuJVzPrt4l+jeznUndsuOZGXgjL4xV1j/g0dweHO2ouMDpIWfGNSp2+EWZQ9u37tLH8nyKFEA/P1gBuhJLMBDVfG+ZnJ4cHs3sEdNC6e8au7KUViv1aMLak8woX5dm53CvUUhRW7M0KimmIg/kseMgkhD2KaV4WT20SL9IhbsAhxR5qhcRD+IhpXTAcLL9u5XgjGStyhIuQlZZM0obAA5ZNqrNop9qyRvTbt2nGrQ+Bzlx9sUWEJgvvAIie8tNCb5pO2D/el1Ft+nokzAM1sVM/MHAP0Fa3bbHADLHThWeMBzs+V1Olk1CyrbvehtBng==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(13003099007)(3023799007)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xcB+yr03AAIRTQHv6k2IBxTxNolzb1GW/IF9VFDloOXxiyn4a17mgGFt0zmIhTfCUpE8F5PsRsZk5NXubvwKJq7rjVAnDBM2XXrfwuUPwzgOOS6mP9dPcgk5NBzHDaHkro5CK5l7n1w6FivQE+Qy64s2FN7b98xL2boMW8V1VR+WYzdI80+8MsvC614V9pO68GbQaNU1xyVxYe0s26YUvsmcycwtRN6oVcENHh/yuaexVaHf0W3op33KJ7npD+Aj1BoL5Fq0lpdh9I0g+NRqOdr0QKcUsW7lCgaXVGsOH5TwuIrKK6yhQkeW8ql1vMwKw89B9n2lVY2vYBJyMYz1gGtA3k1gBRl9XbKtxHPn47mpHpsnDO8KdPNcmTW7RRoSYAXUQYjcf7HfRF1lMqCKU04sVOoPNGYrdHiTt1BGUPAdXMqMNVk/qlubGitXGxqW
X-Exchange-RoutingPolicyChecked: 
	V/vZKebl/3ZrCtJmY8l7urImg/WQKl5mPhgnkINE/C/qx81J9vIOEQoYdsQCgHqCBz8vBWTqCVra4GUd/pPkiDNYBRtDn6p+9igfmMz4JYxGDYtdyagBXrMLXQbCvjeDAx+xzBCUqRrsB986pydHyVFpJHO28gCXgDQzXKfgBjFA+wVLGuDvsIsEE6TEt6gOG/jafAf9HQ6iiqk4Fx4V8oDZaw1HvWl19EYJCO8jhmVhJqkCw+jqGPTBixqaO5Q568LJmNfZ+wLlQ2E26/u9GVdHjXcE7kMXvvH+ms3TctA8yR5c518CblAFbVzRmeliL/wZLdqwd1BFX+g10+WhYQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 01:14:36.4920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b30ee3fd-b7fc-4f4a-d19f-08defcc611d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997710
X-Proofpoint-ORIG-GUID: z2glQZdgTMPsZHkI0mQ0bJVLOGkpV-V8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNiBTYWx0ZWRfX7/jcb1N+91b5
 GeAEZDEO4od3aoOSZ/sizYhlx4pAkUapdPGuYRyqH0bSwfLC8kNhk3TymsODcdsV2PNRYvOlTt+
 ZNV75Ly1ZeZ6bw+9SEnfj2z8zDR6HSQ=
X-Authority-Analysis: v=2.4 cv=aO3Ab79m c=1 sm=1 tr=0 ts=6a83b200 cx=c_pps
 a=7HTsEC4o+G4Ts3XEwqQVug==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=4jueDUEfbsPAgZO8_EMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: z2glQZdgTMPsZHkI0mQ0bJVLOGkpV-V8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNiBTYWx0ZWRfX7vFLOrpQ2Rva
 zikIdluHP7rnp2szSpmX0/kknr/oONotJ37l7jEKaD+ovxO1Esl3J4nkLTcRDy73M9D5076+dnr
 d8Kr4diEBIqhk3k2rsNz0xjZf5HtiY7LwHwSxtgayUnlyTzND06JFpBEWQSWMB1BHb5suf3Cxts
 aIbcneYbo6HnxBJgLqeXq52G/b9+lumsopECnWzvypMWSfWnlRtvO9sgbhnIw3yrRw1lTwIwtse
 V/lK7sMk/wfp6crkYsEHjcYuRyNgCjMiswp1iFjgk/K5tfKSNJR2F/VayEwPAZr05hWIJXCetV7
 vKfDZ9B9Rc5HZdgm+foy04/Ryqz8ifkK5IDxDNdeFAvvoHiKoxtiPJ7Sdbu1IqiU64JVJkEGZQF
 N5JBwZHKnQVkDa3sBZGbBAXmoDf0Izej5OnvKYjY5+hEeE+EYE/cburk8fNI04z9gbiEUmtJumT
 cn0Ok+UYgqA4cQG47Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67HLo2Sd2179922
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 01:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243641



On 8/17/2026 5:20 PM, Richard Purdie via lists.openembedded.org wrote:
> On Sun, 2026-08-16 at 16:10 -0700, Sumanth Gavini via lists.openembedde=
d.org wrote:
>> Sumanth Gavini (12):
>>  =C2=A0 package_rpm.bbclass: Drop external dependency generator to sup=
port rpm
>>  =C2=A0=C2=A0=C2=A0 6
>=20
> I am still worried about what this means. We've focused on build
> failures and trying to get this to test out ok, but what are the
> implications of the internal vs. external rpmdeps change?
>=20
> What it means is that we go from these dependencies being present for
> all package backends to them only working for rpm.
>=20
> If you use rpm, great, it probably doesn't matter so much to you. If
> you use ipk or deb, bad luck.
>=20
> Do we really want to have different dependencies between packages
> depending on which backend you select?

I would think not.  Part of the purpose of a project like Yocto is to=20
provide consistency regardless of which backend you choose.  And that=20
would include init system (sysvinit vs systemd), windowing system,=20
audio, and even packaging.


> Cheers,
>=20
> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243640): https://lists.openembedded.org/g/openembed=
ded-core/message/243640
> Mute This Topic: https://lists.openembedded.org/mt/120783173/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

