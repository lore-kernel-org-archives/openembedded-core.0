Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264D9CCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:55:12 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36591.1792421708666014702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=ccNIhaLb;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Tf06JoUM;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JDwe6Y280381;
	Mon, 19 Oct 2026 09:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GwVSjNZpOGRhWLtn7+Faf5CZZvMlHBdZ2Ijn+OT9z
	QA=; b=ccNIhaLbDvRPxLQxd4WZjhC8oz0DneIhRulbPFm/0X4YHM/XgYkkoIUVb
	L+y9svCwJQeptwOhAs60dQZYXHRMovlzvs17S58gJra5MoZmlmey7OkZO4bKzO/T
	QGAW5ZQd8RrNPMCgyc4+mV223Hn4wYbeJsTZmDqY3oY2zQ1r9+R/9u1eAJcEzKnb
	c4loyb/H2lhabiOhcJ7bK9jIz5il+bQ1V1Qh7jrEzSHAG90raZKoFpz40kQP9krW
	FKCn4S1TF6ORqeMpxw3nvB9PN3XO9bPQzkw1WctBD24nvyBxlc/evO185R8sFmRu
	DaqQv7LTtBFGBXzSlfM33QqbSsZJg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jpnfc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 09:55:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AT6M8RoPnRY7EmEagM3FDlpBimeaKUV2DX82PXFHSvvd7dFP3kWaY0ZlnEGn6e4/E1HfWtdANI4TsBWTWWhJLes74kn91CBKdce8lOlWYFEbCh7Z8FDtSVNE/IzINmFPvEAm6KiT0Y0I5cstjDC+i6tPgBCiX/In0DQjuVwNQ4m2MmgYVY3Vady16nmjn46FyysCZFQkNWHoVUcf9SaRmb3djHISqNpfD6dLDFWv5Ji1PeEQwsdJ6lGd2xM9RJTCM1ow29J3z9IRQetQTeVAfDYxIQyIgdKBEx9fNH5zWrJVMgCJ4flFFKVwLxM/XgGg+JVRyERucQm8SufqNXA8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwVSjNZpOGRhWLtn7+Faf5CZZvMlHBdZ2Ijn+OT9zQA=;
 b=ZJeSZSY+BmkNEIG9aF6XDjaPTdGLSw78ywCNBgHyQllpjK1KZ3ErGLq2qdh18k7BjHVCMkkOLYd4WxT32CCm7NfCU+1ax9xy61QHskJtrScVYTGIHv/tSPw3o2fg8AHazksx91bjmk6dAGwNsIbIzhDbIKaKZr0vPd1naUCQOIayWRiXGjovOHWRKEjz1AyJ4bNj0eClzMcDzCnl3MUMRi4fGqvyju79F0UhEzOz+Paacx7uESI6/76Mkudy93Krf39b53b5DDpIO+HjKPw8URV4Cap4ufREeGVDqhJhv3BC1x8uNqrpoM3nT9sqY2bs7SvntDavbCUT1EDOG/7c8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwVSjNZpOGRhWLtn7+Faf5CZZvMlHBdZ2Ijn+OT9zQA=;
 b=Tf06JoUMNhexGi2RyU1lwtk0X7iRuc7qcYIMdg3a1Umjd3+08gZGUy30GSjkV3GnVLRQcyC8FDCjii3lGqlelo0Y8iYH1GrqR3+scyu92r3qStsfJ9P44z3or+GWE5xcBUq4HOWHMhArfsHUKCKm0kQbi8DqNsIIGOsa+XamnYo=
Received: from SJ0PR13CA0170.namprd13.prod.outlook.com (2603:10b6:a03:2c7::25)
 by DS0PR10MB8200.namprd10.prod.outlook.com (2603:10b6:8:1fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 14:55:03 +0000
Received: from SJ1PEPF000037BB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::c) by SJ0PR13CA0170.outlook.office365.com
 (2603:10b6:a03:2c7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 14:55:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037BB.mail.protection.outlook.com (10.167.244.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 14:55:02 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:54:29 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:54:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 09:54:29 -0500
Received: from [10.249.33.254] ([10.249.33.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JEsTu33006491;
	Mon, 19 Oct 2026 09:54:29 -0500
Message-ID: <750ba0a1-c139-4cb5-8d5a-49d7b68efdc8@ti.com>
Date: Mon, 19 Oct 2026 09:54:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] pseudo: Pull in various fixes and logging
 improvements
To: <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20261016112606.1072360-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20261016112606.1072360-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037BB:EE_|DS0PR10MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 3950e25e-fb8e-49ae-eb4d-08df2df0f474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|4022899009|82310400026|376014|1800799024|23010399003|6133799003|18002099003|10067099003|22082099003|3023799007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ZLpT9653rzOSua9IVIwdv+yX+xhe4NCkx7z/hJgVw1d3kXzt6oRMgI/YOVA/9IeQdp0Ovgi6i12qTf3YpAPK0JwtP4AZ9iK/lEbpup0/YlW9OGrXwMb3RA6ps8nT5/z3QrMjBwM5gI1Y7MQPSWjhkfmZqJsa9lYvKv4RzvaxfvwEQt+2FAvQVw6Ou0C4hmlgkoo/d2dXxHEojFO7FK1LKw8buzMD8IYGU9KvK69tR+r6Mqevj5xj09h9YUP2nXhvkuNEbZUjj4HL+axgx022yJoykzzfZx4zrpO5X0dnH/Ngs/2vw7C+rIVWkAh/pGz2TjZ03twp5z+R6TpwosHBLm23eCVHj8pJ1Ac9H9hRtlxcrPosTA13zO8RVGxQj5UJedQgDmOTVpAFviTzmIx7fH5CYviFmWpZ0Ft52n4grQ4jZMwGAFivdvbCtFvwVmSIkPiv4yyIJ6Srcf1T1vGttZw+auW9FUGEBFXhwdKpfkawcsDkUN4cyl3C/oGiTg21jR3uUMPy2V+ee94GCxmpSUxLSkCsNpqcku3tO95fBq8z3IhPwHWgEivBmv64tNGVL+u9g1tJ6a6h6XCKJivnRdZ8iOELgP4y0EF1xs4q2NxcJMCUO/B5CrUJrPQcqZVrcfs2VLBq1cNPjRIzT0PAYw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(4022899009)(82310400026)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fQSv4smR1KzJXu+SG7ar2bLydBHaTo6eUDlBF+RfSFki7vdZSHbZWRi212iCVtwfrQ9ZdPq/jEYQAzSWk4TrieJvjcLzDte5Cq1XzNQsaCMW4OM/1Bbxh159uL4wAe3Tted3mjd+ecjG5OACIN+ShzVIDmOQtpu481QbchlAAgEllL+zbNWp8qo/1sA+A1r2KT4whwJycixD0eHtIuuqeqr7xumnp7MPE9SQbIdZE9CThWv16EtwRYBsEQRSDXEe8Tct2iAYw37iqLMn4laVZQngOX9OZYhmyZAldR2g2MF0PaISi9M8p9oiObaUGYFfX4RT15/Teh9pr26Jll2j5+/3biGXXsPrwXAtD/osNnR0Gx3M2dBHYGzM3C1/RTqyKa4NJMxcUS215jyGQeK8of/N3hqZyLtignweLNZHPth/iAKngd+9btJJT/jLRHCg
X-Exchange-RoutingPolicyChecked: 
	ss+U2m9kZAmLAEnAvL5qjO7WsqT1SoT+ARACUfZMJ3qnLRiVFxV5S1OBCzl9Ft4wNc85yJX/Z6i8+IuFZfgEJ6rY3IVAgCnS4b64H3Lhpy+B0kyyqhjv4IuzikdVcI2x7kBcnOxWr3RPtUeBnL1mEi4QqSrKQU4gbmU3SMcKrdRIAlf7w1JI3hnPOBkkg42nUUAlf38jhcqtd/dcYDYuboBpOGSxrUamLE8N545sG37Aqxcn6+TTOgNO+uqsvIwWZ84the2huLuKgMRI+fzUGggLFe3XJmCx8hDD+nBv+JRI06L9CuDOAEXl3B8yUQXXBOihcmTA3TxPqTGMYJDIuA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:55:02.5340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3950e25e-fb8e-49ae-eb4d-08df2df0f474
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037BB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8200
X-Proofpoint-ORIG-GUID: qqXzSALFYz-qFhKIaZHSrg_rTvzEWzGW
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad62f4b cx=c_pps
 a=+iTzTTZpyf9i2pLb45wEOw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8
 a=ag1SF4gXAAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=L8TnT4LmUHCJy1i8q0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX6OVrgiQafMOL
 0aZlbhCMGrESZqSkQ+GU8ImOnMfyWy5FlM1u4mrOAv3IeiApfZk+r81XOxdLnYyyhpejqVn6/yQ
 R1//EnX0xqD0wWCQPfSK/Wd7L4aeR24+TyoDBWOwr5Ny3nAGmUd/rHx04aerDzq7W+wKstHagZT
 BY0gugfIpDOO1jEgamlmWqY2uuVTFc2Sd9Aq7i6b14qRWrKn302xWHPChLzXq2cZUL8sYk3wLHL
 9QNKGFmSpRX+92WM6gr0dGDZyC4x8uOrgeYsfxA2nX0KtVlWGUQ3HredwTPJ3jRibxzNA8odbEF
 azGhf5PwLJOSBNeo6f44JKsclETS88oRYzFBlZpZ6bO4bzPe6+pZW/4pMFtVY8jXdoPGjKqaNVt
 5+s0b4y4H1aqK7qElvAvdxvKy91Q/Q0Qz6QZ8wTvrfJntAhmPB6hciJSUB1IcUCx7TzPaK/kX12
 zJMriDF1OclD1eBJ9BA==
X-Proofpoint-GUID: qqXzSALFYz-qFhKIaZHSrg_rTvzEWzGW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX8TBRGzZIFcG3
 ojStinIWrBRquRb9GmxpVR/n+Tuw4Yt17wkFmHTru2p6oT+cHFNNmZcEvL6ooQWX8Y7j3856crs
 G1n9VcSN4wRFVWlqs6dlpZWy1AMt098=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 69JDwe6Y280381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248181


I'm getting build errors with this:

pseudo_wrapfuncs.c:12012:14: error: conflicting types for=20
=E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,  const =
char *, unsigned int,=20
struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,  const c=
har *, unsigned=20
int,  struct mount_attr *, long unsigned int)=E2=80=99}
12012 | static int (*real_open_tree_attr)(int dirfd, const char *path,=20
unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
       |              ^~~~~~~~~~~~~~~~~~~
In file included from pseudo_wrappers.c:45:
pseudo_wrapfuncs.h:535:14: note: previous declaration of=20
=E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,  co=
nst char *, unsigned=20
int,  struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,  c=
onst char *,=20
unsigned int,  struct mount_attr *, long unsigned int)=E2=80=99}
535 | static int (*real_open_tree_attr)(int dirfd, const char *path,=20
unsigned int flags, struct mount_attr *attr, size_t size);
     |               ^~~~~~~~~~~~~~~~~~~


pseudo_wrapfuncs.c:12012:14: error: conflicting types for=20
=E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,  const =
char *, unsigned int,=20
struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,  const c=
har *, unsigned=20
int,  struct mount_attr *, long unsigned int)=E2=80=99}
12012 | static int (*real_open_tree_attr)(int dirfd, const char *path,=20
unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
       |              ^~~~~~~~~~~~~~~~~~~
In file included from pseudo_wrappers.c:45:
pseudo_wrapfuncs.h:535:14: note: previous declaration of=20
=E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,  co=
nst char *, unsigned=20
int,  struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,  c=
onst char *,=20
unsigned int,  struct mount_attr *, long unsigned int)=E2=80=99}
    535 | static int (*real_open_tree_attr)(int dirfd, const char *path,=20
unsigned int flags, struct mount_attr *attr, size_t size);
      |              ^~~~~~~~~~~~~~~~~~~
In file included from pseudo_wrappers.c:295:
pseudo_wrapfuncs.c:12017:72: warning: =E2=80=98struct mount_attr=E2=80=99=
 declared=20
inside parameter list will not be visible outside of this definition or=20
declaration
12017 | open_tree_attr(int dirfd, const char *path, unsigned int flags,=20
struct mount_attr *attr, size_t size) {
2026-10-17 13:57:58 - INFO     - |       |



Anyone else seeing this?


On 10/16/2026 6:26 AM, Richard Purdie via lists.openembedded.org wrote:
> Adds:
>=20
> * pseudo_util: Add default log severity values
> * pseudo: Change pseudo_diag() name to pseudo_log()
> * wrappers: Change pseudo_diag() calls to appropriate macros
> * pseudolog.c: Change pseudo_diag() calls to appropriate macros
> * pseudo.c: Change pseudo_diag() calls to appropriate macros
> * pseudo_server: Change pseudo_diag() calls to appropriate macros
> * pseudo_client: Change pseudo_diag() calls to appropriate macros
> * pseudo_db: Change pseudo_diag() calls to appropriate macros
> * pseudo_util: Change pseudo_diag() calls to appropriate logging macros
> * pseudo: Add new logging macros
> * pseudo_util: Add log severity flags
> * Makefile.in: Move version to 1.99.0 to prep for 2.0 development
> * pseudo_util: bound pseudo_get_value()'s recovery re-init
> * ports/linux/pseudo_wrappers: forward pre-init syscall/prctl to the re=
al function
> * ports/linux/guts: Add open_tree_attr wrapper
> * test: Add open_tree_attr syscall test
> * test: Add open_tree syscall test
> * ports/linux/pseudo_wrappers.c: Add syscall support for open_tree() wr=
apper
> * test: Add open_tree test
> * ports/linux/guts: Add open_tree wrapper
> * pseudo_client: Fix xattr/rename handling with empty paths
>=20
> Moves to the 2.0 pre-release versioning
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-=
devtools/pseudo/pseudo_git.bb
> index d8466b018e1..15d90b4acaa 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,6 +1,6 @@
>   require pseudo.inc
>  =20
> -SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protoco=
l=3Dhttps;tag=3Dpseudo-${PV} \
> +SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protoco=
l=3Dhttps \
>              file://fallback-passwd \
>              file://fallback-group \
>              "
> @@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk =3D " \
>       file://older-glibc-symbols.patch"
>   SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be419=
0d6040282b84c8d97b99072485aa"
>  =20
> -SRCREV =3D "ba8887e5f1e922f866681ec7dec1a00b602a9328"
> -PV =3D "1.9.11"
> +SRCREV =3D "6347db607e9560421a75af6bcc246179eea428b1"
> +PV =3D "1.99.0+git"
>  =20
>   # largefile and 64bit time_t support adds these macros via compiler f=
lags globally
>   # remove them for pseudo since pseudo intercepts some of the function=
s which will be
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248013): https://lists.openembedded.org/g/openembed=
ded-core/message/248013
> Mute This Topic: https://lists.openembedded.org/mt/121786007/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

