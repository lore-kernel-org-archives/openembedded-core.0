Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F977CCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 15:23:53 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37311.1792423428713865201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 08:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=Mmx1CjGF;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=TI64UMHC;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JDwZEx490206;
	Mon, 19 Oct 2026 10:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZG20h2a4mvENcjiQ4QJXmWIScHyXYEcoyjCFexxZ2
	8I=; b=Mmx1CjGF2Q4kigZmbdokLDiVm1QYyKgvDxr6k3Hrvl5nDqxh/dfMvQxMp
	cug426K4WZuSEZJ6lqkO+We3k12pBYCltLmyZudoGNRXOY/dXEMKuiLQURWr9n/a
	yoBZ2cN9mmrBZ+NigpzHsm0cVbPbIJsF0mFJJ7MkuFN584/nwrfWZV0BjghazqSk
	9zA5d9A71r3xNaqH+lALRbO1ONES1hahYZoXLOc5xDivgi/o67YESwv5QJS2PtF9
	Fh7DH6PZ+3B2L1Y4be0KgL0iikCRqow+iwnAH53esweZ3+jCn5GZqEG8smGVUjvU
	WGubQz/FZxi59mWlPHsIEG+HinZIw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hcrd5xwur-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 10:23:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wS8YEuJq/icFOZ19qm4Y0DFNi4N2+Gc8LR/d0+u3SkoHhtU2/aJ8GhuwFOUFqQP1pyJW+MeOO2cadIMF+QEfecG1/p8r1q/FQtv2wG9EF+QdFZ8PdcDddSW/sSA2Mh9/K5ZcF45D52gNr0w4P/qALzT/DzDUb2mzrsIRkMvyAvyayA/k5SE2ksCGJ/xmTecNp6XQ+lXPCs8BxkrM9vx4GT4p1FbHN25apY1IgPi2ihyRI3oo9jxGCsZD9jjkJbRqDVsdnBQ7Bp7d7kWFKHnfCQdnj1ulvJdN1/r6qt+b3Jfuua9D7vwoOZxs0dxev1qJZAX9clO7BkWnTDauYVDfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZG20h2a4mvENcjiQ4QJXmWIScHyXYEcoyjCFexxZ28I=;
 b=cVnsNvYKrFoIrmbX0U0GeuLR96PfhJWJQiB2PdK1PlSCLRTerxJwVBiHxUzEB2nltI2NCyHRh5L04hTpegzgZz3oU9vI7802zYoCEvTEghF+Y+r0H3mtxcmoU/M/7hHw6Yhs+Oe5chCUmyvTVziac3B0Ul0yVAgeCkUVaHG6Bu5TeBp/rSMTNWXCU5UDDm2mj5y/9pS+K1FAChY3Nj5tEhBY/wo/pkolp1T9ewkb2dla+1An8gLappEUKoB91DRV8EcU0trbVvAaKsmROmbjDIic4CBkqhJxXa20UoSh2v0VY3Q7NwnVDxBQhF2dDZOTO1Jt5fbjAkB6cAj35d25Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZG20h2a4mvENcjiQ4QJXmWIScHyXYEcoyjCFexxZ28I=;
 b=TI64UMHCM2cMf/OS20p7kBaf7QT4y1zGbGQLHLE8bc5ZWaf9aL+xO2hQQ0SHJchovibKV6RHugoSsNChqUeeW/uzPCOi2/yW86xdauQhFEqp+k1sjE3u9v5bQqJfRMehX9B5McasEZdsIARtm233QSn9t7bAX+w1Gy7VZTuhMgs=
Received: from PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::34)
 by PH0PR10MB5731.namprd10.prod.outlook.com (2603:10b6:510:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 15:23:40 +0000
Received: from PH2PEPF00048916.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::16) by PH7P220CA0158.outlook.office365.com
 (2603:10b6:510:33b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 19
 Oct 2026 15:23:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 PH2PEPF00048916.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 15:23:38 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 10:22:52 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 10:22:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 10:22:52 -0500
Received: from [10.249.33.254] ([10.249.33.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JFMpbW3992733;
	Mon, 19 Oct 2026 10:22:51 -0500
Message-ID: <db69765e-0970-4c34-bcf0-de4d821b871f@ti.com>
Date: Mon, 19 Oct 2026 10:22:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] pseudo: Pull in various fixes and logging
 improvements
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20261016112606.1072360-1-richard.purdie@linuxfoundation.org>
 <750ba0a1-c139-4cb5-8d5a-49d7b68efdc8@ti.com>
 <b9729972d5637869372b96d3ac94989f80a4230b.camel@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <b9729972d5637869372b96d3ac94989f80a4230b.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048916:EE_|PH0PR10MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b166992-c5c1-4ed8-6171-08df2df4f309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|18002099003|22082099003|10067099003|3023799007|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	HVboNWUhRF4T1JawaSNOnajEsNI35ZVoG77AqqNIDJzD+viOdVBD4q/mDJvq7kpISC9TPPe/58onqa9UcdYP6iL1QkG6dXnUwmPo/0V37Dj56h/aCad3BX/D75UmvOaUwLIvOLN2HOSNyGkzj/HI2ew2AKBVppNvzAei3ppx6a0fikz2Y1U+l+0VlMmT0QZ3vNanBV8XsYw1eMYCoWV5q5wyBzRpuZwZ5t//xJeQtQapgIf1L1kDpr+ixqbSK9u2CLKl0x1JyZE/QDzPz0kQ7O/Np1le1DGouT1dBhQsbdBzUjD9S0FWH6TPafpb0CsNPW85AafOaM4cuPfD4riKDXHJTqCCVmnXivgJBwImyzqFtwF6vuEqkTks7Hen/XC399PQ8ATEU3aGRE02hmPJ2HZgVgPoModGe9+oRKryZFPd87lXlkioHcsd9RRYfvlZt0GGeYuP/H3ypyjX8v2hAxIhBwxA8B5HQGFgdwFhasOQXyufSgrTQP+r9iBjdcK/Q01DQWIy43odSqxQW1nBiKD2rNJiEoDH2wMYlERtakUB7nN+wQawuNKmilKx3bB0xaJ6/L+s9UfV2BR0DjDl3tW6ZMhckMAPxfGdaNNb83H5NzaCh41X2GEuEQmRzugMvjLEq0R07wP4SRMvRt6jBH9ZhuJjqrSCJIK2oTan/UzcqtpPyWjCuZVGoPLBP/EgtDIVb+h/qSfIFPdVbKhpKg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XFZCPqytSBRXwkNpzbnVs2Rz4XbRNqAcoTXk0og1O6Ih8bHq4CcwpJnJTuYsQXOs+/lu58QHHrHQCA8HStPEV3jBPNqFG1opd717hUBbpBqQrSDnycC7qvcAO0/xZc4kH9bR5fgVBThI1b5ap7EnaE2YgbszlwAomfeoNNwuULHrtsvvV4uVRfTpizIC9eVj+h6v58v6FLq2yv8kzE/NjcyEl19Ha2s8DURSyCkqi1JWRcsYe/wXSzI4KQifD+5xdoOOZE9VE1FSkrisEN2ssmeoLfA3ZrlbLp2dqausIZ3JwNOcqjbBkugaK/z7mH32hkOL0y6El/DJ/eD1EUr7a4q5wNgURQAf3QIZmqy6nesDmB6m+hKOKi+4uXoAaZIkyZMwj2TGyv2yq9Y3YqgFwp7mcFxJl1MDJbhbY8fCE3EwZlLgDOCGyIE4RfGhTxq2
X-Exchange-RoutingPolicyChecked: 
	k7ejb1Y+cSD/GUrozrqgTB5foommo52/qGkk02MZLf5V5R7yuGomMzrsexK9nf9msei7ag950cnf4UbMO0D5BSTHG1jNJRw3rm/HwoX8emYCdnxiOLBxL24p1n2mzoFGwupWrcQTjhSVtY9Sz9iyaqJ9EldOPZpRfcgPH99B7gMEO5GDrFn7Jke1vgXgMHKnhclhjbK9GQx+tEYtRnO1EEVn+7fx74zBcqNKMVvsMjpn7RaXl4Hp56KVGQbHcrtQIBinMLAsMXkr8H/PHCxYcYZVgmaI6kMU16xlgpNweXf9OL/SA7sXq/NcHYiiDOYpaythFw0kY/tAMmTsX2ZFhg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:23:38.1646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b166992-c5c1-4ed8-6171-08df2df4f309
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	PH2PEPF00048916.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5731
X-Proofpoint-ORIG-GUID: UEl6ky68s_coxq-VRMnXC6TF-uS97KmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2MCBTYWx0ZWRfX/vZcqMsCItDA
 sormvNGlrTErl0ipLzswmf/Vs2mACO1tMj5AmmcwEmx52W20eNGll6ziKNHK0+Tazn1/iaCO+HE
 pa9B+jd8O3VVWUevnPXCr95O5/aZVaYXRaz6zEa9f7/tzCPjxrgztuhfKxGRFfgAb3BuYnbPJWT
 41zRSCNpaDEBI/d5x525Pqhtw9Kxgfdi6HXtbLEbPOyOfFTZ2FKWeQSKckKJlYQY7ckQxg8xFHu
 c7ByQ78yNPKDMhtGxOibsA+yxNfAI3si1iT/r3lpvIqsUDnfzuc6zUJgxykesjN8UUFadcryYEr
 Jrhzfg+13mnylD1Gn3Ew39WZUBVgNjJ6slpei6Qk1zv+oNogCF7CKLOJnLkOJvWI5hzG6fn6GK5
 l1CuNnYxw2CgFpyd38ouei20YlZl7Lu3WqVivG5EId0En8kECIw1xDH5L+ULkBZmoeTiUhyIM9H
 xp2hVeKcz8cUrOlWx9Q==
X-Authority-Analysis: v=2.4 cv=ReYFmFtv c=1 sm=1 tr=0 ts=6ad63602 cx=c_pps
 a=VTZ9QiboGVM1ljQMw9N7kA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=C0PxNrEFzC6zKyY3V34A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: UEl6ky68s_coxq-VRMnXC6TF-uS97KmB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2MCBTYWx0ZWRfX2ZDKQSn85g9S
 /ggOJRu5+vAFbHONKPiUvT0AdSjR6qUfI69BX4tef4ayxXBDHd/YxCc7/5ItwKJ8jF4axJmjMpf
 gVXG4kYWouU+DX6kHvhNAYykdZeoUIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 69JDwZEx490206
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 15:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248192



On 10/19/2026 10:00 AM, Richard Purdie wrote:
> On Mon, 2026-10-19 at 09:54 -0500, Ryan Eatmon wrote:
>>
>> I'm getting build errors with this:
>>
>> pseudo_wrapfuncs.c:12012:14: error: conflicting types for
>> =E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned int,
>> struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned
>> int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>> 12012 | static int (*real_open_tree_attr)(int dirfd, const char *path,
>> unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>> In file included from pseudo_wrappers.c:45:
>> pseudo_wrapfuncs.h:535:14: note: previous declaration of
>> =E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,=C2=
=A0 const char *, unsigned
>> int,=C2=A0 struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)=
(int,=C2=A0 const char *,
>> unsigned int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>> 535 | static int (*real_open_tree_attr)(int dirfd, const char *path,
>> unsigned int flags, struct mount_attr *attr, size_t size);
>>  =C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>>
>>
>> pseudo_wrapfuncs.c:12012:14: error: conflicting types for
>> =E2=80=98real_open_tree_attr=E2=80=99; have =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned int,
>> struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)(int,=C2=A0=
 const char *, unsigned
>> int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>> 12012 | static int (*real_open_tree_attr)(int dirfd, const char *path,
>> unsigned int flags, struct mount_attr *attr, size_t size) =3D NULL;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>> In file included from pseudo_wrappers.c:45:
>> pseudo_wrapfuncs.h:535:14: note: previous declaration of
>> =E2=80=98real_open_tree_attr=E2=80=99 with type =E2=80=98int (*)(int,=C2=
=A0 const char *, unsigned
>> int,=C2=A0 struct mount_attr *, size_t)=E2=80=99 {aka =E2=80=98int (*)=
(int,=C2=A0 const char *,
>> unsigned int,=C2=A0 struct mount_attr *, long unsigned int)=E2=80=99}
>>  =C2=A0=C2=A0=C2=A0 535 | static int (*real_open_tree_attr)(int dirfd,=
 const char *path,
>> unsigned int flags, struct mount_attr *attr, size_t size);
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
>> In file included from pseudo_wrappers.c:295:
>> pseudo_wrapfuncs.c:12017:72: warning: =E2=80=98struct mount_attr=E2=80=
=99 declared
>> inside parameter list will not be visible outside of this definition o=
r
>> declaration
>> 12017 | open_tree_attr(int dirfd, const char *path, unsigned int flags=
,
>> struct mount_attr *attr, size_t size) {
>> 2026-10-17 13:57:58 - INFO=C2=A0=C2=A0=C2=A0=C2=A0 - |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |
>>
>>
>>
>> Anyone else seeing this?
>=20
> Which host distro is that with? It will be something to do with the
> system headers not having the declaration we need...
>=20
> Not sure why we didn't see it in testing...

Ubuntu 22.04



> Cheers,
>=20
> Richard

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

