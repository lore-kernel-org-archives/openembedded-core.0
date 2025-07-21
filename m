Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6D3C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 06:44:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34508.1753080239046123491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 23:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92976fe5b5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L5Zm1q1159321
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:43:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09p0m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:43:56 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56L6huT01270550;
	Mon, 21 Jul 2025 06:43:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09p0j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 06:43:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxxLqL51dYKn1ue45o9P59g3AWMFiBu/SH5iixwTAXOrlObDbxdsKJRUu4pwiH0afeHL6yVKCJ1WAmJlxRQGKt9da2Ea8/2x/tB8QhLK4sOQ8SEIKYFIFvIV6qIfSqsRv26HPynVIpseSDaDF5QXExLfxurgr0w7yLAWK/2/MMGWDhursZQ3dFRtDToTO5XMXQf/1CHRh57TAErdKqvTWXMyBFi0yfaTNJxFN4pivERZNyGKTn7U/w2ER5eR7ZlF27t9XbrkU5yNjqBWhFKst4rP30fhJxcYmg0eNQOBGgftsnDBvOJxkhWhDMYZ/0dCj2KZoH5YyhOTCKDoaNUy/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAE6XvGJPXu8DzA8GqQDD3Uw5l0dD7VQ9GZkVFCOWLo=;
 b=ox9Vb7vosL1jvIrdhMQvgS4WIzWhSMEuvrJnAxY0SOgt8J5UgO2z0vAmaK76Hvmrj+aiXDiLfqvZchVY+wQHTSv3VwSJXF7bZ/JYCJPB3QUE3A3GrWM6sEWAIzYS4waBmBUunObaKoWF3BC5PnqhsYOD93SJBWQLapdBzFWftI6tapIO1SLg89l7RTJNCPR5S86DOBPW9l14qLxFMsFUpGuaMYk0J+9vz2KoRsshqyYkDesGemWxxuGlxA9Nec0gD/jCp3Io3s26nH0m/UbD5k5S4aQyCQvdjepZpkB6ckJ6leA3h1RVWlRD4GWZYZZmMjc4qjO4MfiumsLcBJvjgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.39; Mon, 21 Jul 2025 06:43:53 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 06:43:53 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][master][walnascar][PATCH 1/1] gnutls: upgrade 3.8.9 ->
 3.8.10
Thread-Topic: [oe-core][master][walnascar][PATCH 1/1] gnutls: upgrade 3.8.9 ->
 3.8.10
Thread-Index: AQHb9y7QlyqDc9EE8kq/WaSEs02yfbQ8JxcV
Date: Mon, 21 Jul 2025 06:43:53 +0000
Message-ID: 
 <DM8PR11MB5703B3DE0E1192C948D18A02845DA@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <20250716141044.1733137-1-archana.polampalli@windriver.com>
 <DBEFMQER8UIT.PFP980KBIKDV@bootlin.com>
In-Reply-To: <DBEFMQER8UIT.PFP980KBIKDV@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-21T06:42:52.292Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|PH7PR11MB7429:EE_
x-ms-office365-filtering-correlation-id: 3dc9baab-7b12-48e4-6886-08ddc821f54d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?dnBKPuap/hdg54O9/dRE2BRvh4c/+eFN2SCOnAIetiWeXh17kUlxZxFNmPM4?=
 =?us-ascii?Q?xxoGRIMwqz+Yop5P8suoJAG4/ljKmMFBTR5sPGPtPdUWHmZVljB9VvP51+bm?=
 =?us-ascii?Q?Np8zhzu+zOkiq3Ic2AOGcpKNYSihlUkYE0JzU0KbGeZDj4SzAzb1+4aybr/T?=
 =?us-ascii?Q?2gYaHw+ljMc7GFnKPyO8txx+D0a0w7A23HD/pyFRH36HS0qdgvQo/JIV+JYm?=
 =?us-ascii?Q?fZz/kRiKqKJJW5ykgbJgfP1whKNffpCuMHlS9+CtXbtNdfNNFxKYXP4b7NBr?=
 =?us-ascii?Q?Lb8egX9ifX8u1FSAAGXYIbxVy8SjKKytYHHWdp+YW6l9rAQBtXdcMbPteZeW?=
 =?us-ascii?Q?CJuwfCjvokbOs6F15f6M9U9N6pSPthrHhbx7aduxEz/2FbMmFcEV+NhoKj5u?=
 =?us-ascii?Q?WuoJLr10jYBeZ7xbSQMHTdZkK3f+T1VW6RPy7TNakIdkKL+R0C4szWBFFDQS?=
 =?us-ascii?Q?mz15x3wFg12g/TFhjzKp+2KM0ctLTuT02X9mL5wx1c8eym+GB4QoJRaRVRbW?=
 =?us-ascii?Q?5Y/Lps+k+Dv0HWrwugYSAs7MyZAYapis6EuvORlS5UGoerr6oYpQSBf/+cpr?=
 =?us-ascii?Q?Fzjz7KbdFBm1MD6R/5/3Dr+Ok7/AqXqUc71R+zY7BjymMyicBqrTwXtzcz+D?=
 =?us-ascii?Q?0WQ8ATSnBkMEo5kkmMKNJfUDZgzy60ZWTmbIuA5thn+Fe6IiWXi5y52fpdmP?=
 =?us-ascii?Q?rFr7OVu41rMSzni63qDkpZ4k1kVdIVSdkDdKkIxmNn8HLovEsFokQDFusaVS?=
 =?us-ascii?Q?R6RJFo9yP4+CC+fCOdHph2YAGcCtnt8NuAJwXBiEDjc74A+q3Z+SHu9+pnr2?=
 =?us-ascii?Q?eM7EiPE4syDvCKRM1CF9CpOljp3ZVfa1QHE1BBqIrloPhZ18ECffoo2d1Mg7?=
 =?us-ascii?Q?Rnu8bWSCjSQ7oAwRmKavNQCqL+wMTVy6C+OeqizWVDBUJLfW1adis4Ej+KA6?=
 =?us-ascii?Q?qdwHhbk3XePh+E+U+dyQNxjxyG5igaaqLzxa7mDSFRJ5hz/Xli2TViJMpsLU?=
 =?us-ascii?Q?e/3S3lo5roLEia+UxmKzcmS4UjyPsjhEdIV7OpOlwJ6JStJZacT7m22tJ0xq?=
 =?us-ascii?Q?H1gXMFHnenzahm4pdxGCrhe4oOiXRmjUX2K90c0THjFbR51gYTAW9KKTzT26?=
 =?us-ascii?Q?rnzyqONtMPzHw1ykdHLVy9BG59XtOaTH9NxC8YTqfKeB1yYAIgXUnX3W44gd?=
 =?us-ascii?Q?7bvf+GXgroVINw1HLyCsZO3GV7/qyOVQpL8WvuSZZsjmpYf0VsSF9S3mIMu2?=
 =?us-ascii?Q?8zsTHtasrpD1PSwclFbWvUiY2BcIMpQjXw5NI3dGNdjLqd9jzfIaNHPmo2ZF?=
 =?us-ascii?Q?iWfIe2YChp5TDdqMU0R6doggIBGtjCjDGhn4pCTZ2eJfBjj9q/lDL8aG5d3Y?=
 =?us-ascii?Q?o/m+sTa8CWWskdCRjJLcGpo3il2glkVM0fo1qSm8kBDkRBt+AzeeitpDZN6B?=
 =?us-ascii?Q?1Hu4MrRtPWc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?B+Jd1rNOd8Oay4WZajDMAqAmYw3/Ae7E6x7nEYDJ02Clw8WqHMzHZ22IZSJX?=
 =?us-ascii?Q?2oJYCnuKkVkpxHx64oq7J5W8lh/XHivNq0Uq6Xtc6Cn8SmZQTsg+Go8Fujlv?=
 =?us-ascii?Q?dvcEWKO8DQi0UqgSaPyCv2cLFwlKxEwyIqakrpb4LcstmE1y2fJO/c64DLb1?=
 =?us-ascii?Q?XsPb5ZM10J0nAa9OV5nXkvdUoSI6lqmQmxH22dEki73JS4Pi5pkmITxXn9Du?=
 =?us-ascii?Q?RihgLnNmVBuxS5rOpTVTxrCzLTf1dl8zp4wBJO3aONJkIZsJgLQmecT74y48?=
 =?us-ascii?Q?kbQLIkzk4B3lNqov1QegXtqZGqEtD3C3WVMcy8e51uB3AWD+Yrs/2Y46I/ZL?=
 =?us-ascii?Q?4/4oZaoWKHBMWG36UH5w5Ub/aejcTPiXPvWGEUVVoZcTokNXybjKfnCHwbcC?=
 =?us-ascii?Q?/btWUTQQVd1Rc2vUO1r3Uwt3tMwbJ6W/E+oyTwt0bR9+Xs6UE2L0n3le2j+7?=
 =?us-ascii?Q?EUOXQcRpbdeP+7xZjb0T3n1VGP7abcoZpggF660AACLxcZSuOZP2CdW4VVqu?=
 =?us-ascii?Q?lGr/uf6RgmwZh5W5axVDk04ppfRSn9HKX/caN4QLmbjGECBTVkZigQ2gYLBO?=
 =?us-ascii?Q?Lem0hAIYIf7r3xxMDotq8lZ3hZBV0xTKWd/FXOQr5drtgsL2tqlQpDdwGdyh?=
 =?us-ascii?Q?DgNxcQ2euthy/60/wA4hqQKbtQWkU15bYz/RdntRez/+4XScDDZMuHwkpsUe?=
 =?us-ascii?Q?C3PM5vNN3g+YOPl3NYebsHt/nKSGdp182QOm6DNbh+C7VesaVSuNWSPCQamU?=
 =?us-ascii?Q?/Kw0KpPPL48LiMxMgbKmfknJ9ZxvvmMlLyoGUFbHHA8zUTQtxX8kVHPtrHcr?=
 =?us-ascii?Q?3Df+E8Eq3qJwZ/+f7ImOijMKmS6xK0PW+8CIAD9zdHtP6eC6hHIMJsE2m2R6?=
 =?us-ascii?Q?Vn26x0oQ1ggt2RYZ2A2twUAvXLy/qe9aFDS30BrAIirO3XRJtTWMr74qXk8w?=
 =?us-ascii?Q?CWPkE1VrC62MSn0JXXTdi9Izt6KBCI3JSLJUc/IadFCosZM9fSB70Bj1J5OJ?=
 =?us-ascii?Q?mhEW9fU1l91pGU8GvIAsmY8cIB0sP4vcDzkwwCahqVFk34I3Ms58O1lIUG1S?=
 =?us-ascii?Q?fQCZEEhUT3tKg1jFu7d8QdAmgqp+/bbjnTlsH1+u7tT7nkHDzZRMsBVAeao7?=
 =?us-ascii?Q?krxa84LzzW2/58pCqvHsv89kevY28Fw0+4EzizEMXI/9q49if2MdVVr6nZL8?=
 =?us-ascii?Q?WMVJ53Rw7AKZosueRi3/x6OYlkeWI86cmEymYV8FAFtOtJxazYr3F+JVfja1?=
 =?us-ascii?Q?MLWeorxoXDFDuBpqmMphDi5yi8AUoP7WuBEBSXKYBFnaWE/rvLRirW8HtUy8?=
 =?us-ascii?Q?DHuTuSqXvJuIbnWnGpRbUbcTMpKaHybEShE31IYFPK8wqCaQ94Ob80KqGYlA?=
 =?us-ascii?Q?qvj1TwAyt/tmmXODcVvQy03cpDYRp4hiEzBsh7r6QKcd6MyWyZJeXZp/oNW/?=
 =?us-ascii?Q?4uqc4tP/xd3PDk/5k28hyl9i9TEeMhIsm6zHTTBfYW2/hvTjP4wdRex/rV6+?=
 =?us-ascii?Q?QGFYkxrYMOR+RmHfQV3n8tEsBVrB2rwWybKAJF7AUZ71FLrQ9zk0rIhSSFUn?=
 =?us-ascii?Q?Ib0o3HwQm+TSZYkkoetsswMosSA/JE3p7ocePeV/eg71TIWVCxPubEXAnsHt?=
 =?us-ascii?Q?jA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5703B3DE0E1192C948D18A02845DADM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc9baab-7b12-48e4-6886-08ddc821f54d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 06:43:53.0920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3iYBaM0GuDerYH7/Sxg9qoAbGcGMSSZeeyGwvAQSo/HE73z4OvKXK5pODpovuOzGg8FS58zSOL4p3dARogRJ+PUJ7RDxQmLsZBrz6LQ/Bmfsp3Wyv8/KNT0SfPlwSwni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
X-Proofpoint-GUID: sH8FFOp_0ThM6ABsVI4-Q5ONN1skpXDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDIwMSBTYWx0ZWRfX24W0triW10qU
 pB+R7/t41Gn4lqjvDRSUw1GONPdfgUpf8c+poSnj5WhhwhhQWBI0GJLbkVcMnGAjzza00l5wY3j
 eCcwyrZ/t9VSQUE1ABNoqM9orsNUWp4KtBSsKPdm/GVfS412TPRL0e+xLSHUsFnxhzQBheDZW6j
 yx24t4L+rP0k9ysiaSBjyF8O/dRXXh3UPLi7nJty7n0IqBy70/Se7YZH00ZElv0vBIYd+2CEs5Z
 gULLtcKGgB0f7fXbv/PIjz0x+tAcdV+FpQTvEiDbOiryXihIpphw/fZ08dpDK047aFwKjxcUUeP
 6wdRIV70pKpD2b13Om4/iSkR8sFsUl/MDogiuJOoOKWjlKOrNwRHcJyCv1SsV4bNTmo6mjNtGFx
 mgvph09r
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687de1ac cx=c_pps
 a=EEbzfBuTrpn0kuaIXlprqg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GwUem0DFAAAA:8 a=iGHA9ds3AAAA:8
 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=wvPkM9v7g1_ikmSEda4A:9 a=CjuIK1q_8ugA:10 a=VO3SqhUBEN0A:10
 a=zdL2SvzDhUJeuIrY:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=r0dl5i_q2XGqDZkti5dn:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: m_FFm2YpDJc-cvCkQyrdtyYzJ-Z7pMKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220659

--_000_DM8PR11MB5703B3DE0E1192C948D18A02845DADM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for notifying me, Will check ptest failures.

Regards,
Archana
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Thursday, July 17, 2025 20:53
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][master][walnascar][PATCH 1/1] gnutls: upgrade 3.8.9 =
-> 3.8.10

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed Jul 16, 2025 at 4:10 PM CEST, Archana via lists.openembedded.org Pol=
ampalli wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> Changelog:
> https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.html
>
> Includes security fix for:
> CVE-2025-6395
> CVE-2025-32989
> CVE-2025-32988
> CVE-2025-32990
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---

Hi Archana,

Thanks for your patch.

It looks like this is breaking some ptests:

Failed ptests:
{'gnutls': ['compress-cert-conf']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1909
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1917

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250717-75/testresults/qemux86-6=
4-ptest/core-image-ptest-gnutls/
https://valkyrie.yocto.io/pub/non-release/20250717-75/testresults/qemuarm64=
-ptest/core-image-ptest-gnutls/

Can you have a look at these failures please?

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_DM8PR11MB5703B3DE0E1192C948D18A02845DADM8PR11MB5703namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for notifying&nbsp;me, Will check ptest failures.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Thursday, July 17, 2025 20:53<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;<br>
<b>Subject:</b> Re: [oe-core][master][walnascar][PATCH 1/1] gnutls: upgrade=
 3.8.9 -&gt; 3.8.10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed Jul 16, 2025 at 4:10 PM CEST, Archana via lists.openembedded.org Pol=
ampalli wrote:<br>
&gt; From: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<br>
&gt;<br>
&gt; Changelog:<br>
&gt; <a href=3D"https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004=
883.html">https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.ht=
ml</a><br>
&gt;<br>
&gt; Includes security fix for:<br>
&gt; CVE-2025-6395<br>
&gt; CVE-2025-32989<br>
&gt; CVE-2025-32988<br>
&gt; CVE-2025-32990<br>
&gt;<br>
&gt; Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com=
&gt;<br>
&gt; ---<br>
<br>
Hi Archana,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like this is breaking some ptests:<br>
<br>
Failed ptests:<br>
{'gnutls': ['compress-cert-conf']}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/1909">https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds=
/1909</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/1917">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds=
/1917</a><br>
<br>
Ptest logs can be found here:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20250717-75/testresult=
s/qemux86-64-ptest/core-image-ptest-gnutls/">https://valkyrie.yocto.io/pub/=
non-release/20250717-75/testresults/qemux86-64-ptest/core-image-ptest-gnutl=
s/</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20250717-75/testresult=
s/qemuarm64-ptest/core-image-ptest-gnutls/">https://valkyrie.yocto.io/pub/n=
on-release/20250717-75/testresults/qemuarm64-ptest/core-image-ptest-gnutls/=
</a><br>
<br>
Can you have a look at these failures please?<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB5703B3DE0E1192C948D18A02845DADM8PR11MB5703namp_--

