Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92C2C55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 15:00:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13850.1785423632946518911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 08:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=N/C+UPNx;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kPt9S23d;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEsjoF1710665;
	Thu, 30 Jul 2026 10:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5e8QSZ0kj4nxtkY/6C8hQTWL9r03zrHOle4dktBsd
	VI=; b=N/C+UPNxermcOTnkU9fJPaZMJeNF1iunqUheSFx3MpmhnX3MCyParjOdD
	qPVGzgUSk8Yl2HpjFpdofkDcUUAf8vjyCENNcZRIjwUunNMBK/iB0xsWegWw+ZDJ
	fME9MFF5rNtgxUBvKQxTV83L2TtX0o0OVrSHdWyK1dPzBGFEPZCGr/J/FYA81BY5
	Ssaozy/q1Y2rXzbau9Mz1EQ+3xENrc2fj39GDEacEXnUgSBzOZsLU5Z0FiPLA0JO
	qGpaOI3OdWT7cYdxChwIKTRcPfHzUj01BinSqhCVsQoZoblg86aOe5xVZ63cehEf
	z9VeWyvdbcNu+ONDgm9mqtBVdhcgw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fr8sug1dg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 10:00:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZqCx5DyBTesUKY0q7or+5h7maDzlvo7cx/MCkcyRdx+xMz8IWdnPTeG+O2oma0B/yV9/NH0qryrHx3QwxIHe40ZBL65Np/kfc/72HgQkjKwat79mBSX3E6NlC1vBddiEa5ROH1EpXvLggjl1r1FDzNwod8EAClO4H9/K2qqgrP3qVxRWodnNpEbWGPXF4rGhAyjPshrCktq6Famma7bxi6F6Zo3qNWP0C5TOsT57jY2F5P+yL9b2rSulCesivWe30Hz2BELj0P9dO0hjMAJQZHEBT9N+25vuR02rStG3xPdwn10oJNnsXNhxwERNyJSoJ2nAjS1T+kZcR+jmdd0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e8QSZ0kj4nxtkY/6C8hQTWL9r03zrHOle4dktBsdVI=;
 b=ery2nlofxTDdUvfrdplX2cO212L4SK/b9Z5y2jKaeX1RK6cHiGFCQCKmfhh6m7aE5oWzgjWyCXiFxiqUqVle8cAd6op7YneES109qcLPBHIfx29+ZOKdBKPnNos8AEZFjhjFdISlnMMezjDo9bsPAUjeNPFfEOsfsvBxGgQNvAMpY104kc0VVdS76wa+VSommYiXbDIqICzZuk8cUWVIVGsVIVcdWQkBcTsAZ/IK8kVe95aQwaGqfh1VzrYSnSP9iUng/sEcaDlaig9ZwMDNEndx2GEU2pwZlBY7eLeIUGs50HGoK63mmcKgGM6XRqO0ei0ZNOUYzcbfIciAad6vSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e8QSZ0kj4nxtkY/6C8hQTWL9r03zrHOle4dktBsdVI=;
 b=kPt9S23d6whzkAEkTvv9TDMJzNQJIHukRc10Lk+Vcl+Duxtshsi/9CE02BfLDxsg854VnebXdyGXCU/1tRgMRRTImVR+elIShnZ6dFupf205/+TY2cuVjycPWauKXRN2Gn/aP9Kp8+XIB2DHBb0CVtHIV01ISsi/NSFf/gcnl9A=
Received: from BN9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::35)
 by PH7PR10MB6482.namprd10.prod.outlook.com (2603:10b6:510:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Thu, 30 Jul
 2026 15:00:20 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::a2) by BN9P221CA0018.outlook.office365.com
 (2603:10b6:408:10a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 15:00:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 15:00:19 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 09:59:53 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 09:59:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 30 Jul 2026 09:59:53 -0500
Received: from [10.249.65.118] ([10.249.65.118])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66UExqLO2900988;
	Thu, 30 Jul 2026 09:59:52 -0500
Message-ID: <201b14d0-56e6-4076-834f-b939cd64a4b7@ti.com>
Date: Thu, 30 Jul 2026 09:59:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add KERNEL_DTBVENDORED
 support for FIT_CONF_DEFAULT_DTB
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
        "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
        Paul Barker
	<paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1784364567.git.yoann.congal@smile.fr>
 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
 <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
 <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr> <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
 <df0810bd8195bed1f754fb754f94eb64133491e6.camel@siemens.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <df0810bd8195bed1f754fb754f94eb64133491e6.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|PH7PR10MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 762bd588-ca91-4204-ade8-08deee4b45ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|4022899009|4143699003|10067099003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	S9muiMXYVIT+Fqn8+H4wGfhzuV0P06gUdHgc+OM3Pb7/IhxJFy2dwxgsX1oRTTXiD9VHf9Rolok8hFX656krYQGCWMP2ZLQ71UlT/kkfA8uEOz1RxDCbLdMO8tYkyzqs93vBJZ01u+atgxAHyZOUsO7Zi55naMUp7hKiPTA8sZ0o/sfNCEL9XQcqvbyt1IgIBDfLaCuvSbvmOdJbpIw5xTCYv2v+olsjEJq5S8ufGV7Mwwhpg2ygqroLFoJAUfqx3WE6uD7h58bjBZxWTWiRkeujjooDtenNU48uckp7k9KUp9dR0i2zw/QW2qlAuYdxeFOkZGLZLWbKLLW4gtU5t+79lykc1MXYAP+xJTEG6iVnd8HuJZSum8s6fwWvsM39ufiJtVAVZ2PDZxpOZxZedrdRvUtHKwpyyGNMBuenfebKk1hhSSvKUn8ti8ehpidGr4h5RrBHqAS9jxwSu+EonUy2LEyEaN7xmMThHqqnOPqzzsRPiM54G1Ikp+3at4ivFJlBk1k0rL1QTZ47PzSfqEQQl2MCv5IHvk5YW5sDaYcpkXbnNcfoQoOzv6hESaPEGfgElRHe7tHNfvNFFdnNtVa6Vv19SxSEDFSQza4Td97hqxOL4cwEMfrZ3ca0XznDpzywsjhOwGR1Zcx5ixUEz6w4AQsERKUsf7XOa1ZZyo7uupJq7VNjzp5r57/KxeJWgSrnbJxE1UX+M4uVIj7VQw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(4022899009)(4143699003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6ygkyPu8fYM1w5cPvdEWy1yZYGBiemhlw+yF0vIrMilRA59aL6Ue1zeNUJ7/Z+8XOP+m7TtVmB8KHKOJOBwTKNW1AsMXSg+ucxU9fudAdj/A7DnqQfVy2ogiehzJl37NLEFXf1xRBq5rkXtePQ1zrwkayEM73FB4c/4dtHU3ZFCtOEhflbHFYOpQjA1MwTs2tlRDnx/4L8LjILWOWGwtt/lsD4QJADRJCh1jN4q15dzmr3+3qxyqGQJijQ7CrCvDT3rHE9M8FpPkDiVtY6nLx8b9s+xE5HHNjmG5gdZUPAWHI5p+yi1ENGmYmhu/K4ujs5yPPPd330vT5KSVcnmf7Nmse5qKgi4442oCRA9K6saT3b2P1YO7YhiTprXa1CmQIgHWHmWIHBZ1iKJcWumNmIME2zVOY9xJGDQ6gghvnFjdm2S/VB2kq8vIccJQwwvs
X-Exchange-RoutingPolicyChecked: 
	VgLSTvq9lAjvLGDSOUhr2tvZWWD6XxJWKcukw2edmSkSS7KYnDvFyLzi+nIYOgLQSGpZfmnM7ktACUL1S5ll6yW8UIVtL+VwxE9faEYi9lKbRu3I8enJDeKuoHhVoL4vgNIbdteHZEsBeSH3Ok1sNRGBYz3yCFGmSul6Dm6VzKbf0MHxhrUeplg5KpOZv15Zn29hrqUco3pmvZnQ+09nlXpCj4M1nThh1Wq2NDuRcpUhJPj9PH1ZMODfCchTeFbmFHm8UKsYBNiJkAphjy4wS/z9xILSZPtVinrd7wFZ0ZULkwMciDbPeXfF2n+3zHEpeedxFoEo8CJi3rHVNzfY5Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:00:19.0188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 762bd588-ca91-4204-ade8-08deee4b45ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6482
X-Authority-Analysis: v=2.4 cv=X/Fi7mTe c=1 sm=1 tr=0 ts=6a6b670f cx=c_pps
 a=KwZW/a2w+sB+hZzDdQVeig==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=a_U1oVfrAAAA:8 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=5oV-NIGT91EmHs8hC0AA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfXxUg3RQLoD6F2
 GOx5zLwrJxTTJHt/00aAc8VhuU/+KoTSCc/6XrlTqrY1pjisO01iKXD9TaSYHdrrgM41E2X0CzI
 Vota2m2Zjko7/uk5HQ0aqS068Li+W2o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfX4sxebm58bFKP
 NKo/tsqyfe/HGM/ADDFzZgmbtXcO7ycCadrm/CtHFKw3yWPJ1tcR34wqxl81PI/WpIiMQxBFN7h
 KN0XJnSBv6rKXx5+rS1gUlkz7M3hjjVCQlGgB6ityZXvH/LSNqNDue7KhC25H/iWcd+ti9+psOP
 erZcdJ/j5+ZbwHFX67qwAy13rjWwxlGyODHQAeVMW83vNArKGnkWTYc+rslvlP2EL2bXART7tGZ
 fImu8fkNHKLCSdz0EH3OLQf3lRJno0DIACqsz+eI+LDica2vLqeixzu8Zu3eyfS3VbHcaW19c0l
 oj55yH4c+CuMDvZ10K89S9pUZtq5dxKy45dRq0fbU3Sxd06BzKSTYnKa6w4uhlAgZXlPzJgt5lf
 1O6o8IAbE2oTynJwIllWV88VAIKiTYWeUoSyGcFC37tbE9STM4SWkdpARXVGJ50irjEujp8TrM8
 iJj83wAqOAwl9rgIOfw==
X-Proofpoint-ORIG-GUID: GG39cvxkuH3IGFi8-F6IfUXMzGx127q1
X-Proofpoint-GUID: GG39cvxkuH3IGFi8-F6IfUXMzGx127q1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300113
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 66UEsjoF1710665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 15:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242366



On 7/20/2026 12:11 PM, Freihofer, Adrian wrote:
>=20
> Hi Yoann
>=20
> Just a confirmation from my side: Taking the 4 patches is the best we
> can do. Considering them as a series of bug fixes is right. Getting the
> test back-ported is of course nice to have.
>=20
> Regards
> Adrian


Backporting the test will be challenging as I built the test on top of=20
the 7 patch series from you that overhauled a lot of the fitImage testing.

https://lore.kernel.org/openembedded-core/20260619112046.125876-1-adrian.=
freihofer@siemens.com/
https://lore.kernel.org/openembedded-core/20260619112046.125876-2-adrian.=
freihofer@siemens.com/
https://lore.kernel.org/openembedded-core/20260619112046.125876-3-adrian.=
freihofer@siemens.com/
https://lore.kernel.org/openembedded-core/20260619112046.125876-4-adrian.=
freihofer@siemens.com/
https://lore.kernel.org/openembedded-core/20260619112046.125876-5-adrian.=
freihofer@siemens.com/
https://lore.kernel.org/openembedded-core/20260619112046.125876-7-adrian.=
freihofer@siemens.com/

That means that my backport would need to be making a bunch of changes=20
that these patches may have done.  I can do that, if everyone wants me=20
to.  I know specifically that this patch is a big one that mine is=20
making use of:

https://git.openembedded.org/openembedded-core/commit/meta/lib/oeqa/selft=
est/cases/fitimage.py?id=3D4b08cf6048b6575c39aa9b3bea282cdeae228e8a

>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#241413):
>> https://lists.openembedded.org/g/openembedded-core/message/241413
>> Mute This Topic: https://lists.openembedded.org/mt/120329199/3616858
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
>> adrian.freihofer@siemens.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

