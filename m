Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F14AC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 15:42:24 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24522.1782834141089269129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 08:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=djAtueHI;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=rLiNledx;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UEdQaA804564;
	Tue, 30 Jun 2026 10:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MCnP3XwdalubP5HvUdTx92ZSOjWo0iRFlnQwsot2z
	xc=; b=djAtueHIIvJiAoW70AHKQe3bK1EuU8AmCSQ9V1TZpmlOefWl5WPLtHid6
	nCq0YYEEatzqhupkQ/CdLyuTvYl4YGt5ASh+tVvvEn9zhMjqKMkENic3ILWyeXTG
	jbgX0h9XoAo2hJDl823NNWsYS4+QnC+JrkOJ0GtNxKQvSaRuwEaxR1uBcpzk1608
	m68Bkna9K3oBcRN2ZlgrlRt2eQAuWstHkC6FnyvGViBTi77Fz6hFL2VqozzhNbuP
	QvXkTM/4AMhvNrjUUckv4Bt6zUkAadPAgeKbf+9+xSsn44ZGXl4449NYSAxoM/tC
	vcj3cTBneEqhpFiSTLOCiN/jfXCug==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqj9j45-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 10:42:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAqqs3apFnAi+uN78O7aB3CUuswWllK801w+tDZOLxuv+GXPhwoCguhNT1EUv4HkCj1WoDfA5Y9GbCh4fOpZ7VybzDDTXGG2JzMBppw1IwOAB+0TZVzeU6CC20UMd1tSMGz6tIK+nom/gHJP7ZsNJo7GFNRKjZTNvDE2Deh9ADJ7VaB9mSNnXXYXmOhQxJUGQk+HgS9hp73ehbodar9EWxd9JRhCsbpILH0TD9X2Ch6yKfW2Yjj7f9ZLWFD2eS9e2Jjk5EIa0ToaM7DkaRATZdX5as8CochcZ301uLMv0iDWJJCXdUZ09gTzVodqSWFI1kD7JQWHxWpQXRXivYIalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCnP3XwdalubP5HvUdTx92ZSOjWo0iRFlnQwsot2zxc=;
 b=K6S5PzOFJSqZAd0RbJjkLpuDUCdmo7Hn2r9bQfjbyOPpLPombYJ5BY/ALhdif3mtmaz87yebCX1+253ErHndhgU4aI9BdDtuNMJsOUv4UDFegscqF8DIcDQJRR+2Ylsac4wV3DOr0N6+2HTvdfet1kqb/D9B0I/vD9m3SAK/QgiqXrumvAlBx/4y93xnjBb1g2R9C3Pal0unKD41F8mooPTTze26Ai7NvMl92maLwMA4a+zFqY0fxoGmXmEpIzkt1CQnVm9VRIRp0ZOuJXB9iilk6Ee+TSShHOWA22onQ0sIdTO/CjrsH/YGG/+lLK0j6XD5K+R1ftTsaQhoi0kEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=smile.fr smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCnP3XwdalubP5HvUdTx92ZSOjWo0iRFlnQwsot2zxc=;
 b=rLiNledxXMGb7Zn6C7RVkUEK0SQZAiKSb395ezn6BKp53/hFAJ4Fc7UBECw8PvRyFM4CG+J9Khwq0E+Ic8ye6Ly+6ENsWfnuz/LYKmTKKGbGU4opNNsl6F66zVjsrfLrVoE/DFdMxr8I8ftP5RM8WG5DDypUs9c/9EpG35sq6uw=
Received: from PH7P221CA0070.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::22)
 by SAWPR10MB997814.namprd10.prod.outlook.com (2603:10b6:806:4e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 15:42:14 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:510:328:cafe::88) by PH7P221CA0070.outlook.office365.com
 (2603:10b6:510:328::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 15:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 15:42:11 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 10:42:11 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 10:42:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 10:42:11 -0500
Received: from [10.249.65.118] ([10.249.65.118])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UFgBSJ3397196;
	Tue, 30 Jun 2026 10:42:11 -0500
Message-ID: <ea0fb7c2-b5be-4b40-b8ba-27de7c40da21@ti.com>
Date: Tue, 30 Jun 2026 10:42:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v1] create-spdx-image-3.0: correct
 SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
To: <eric.meyers15310@gmail.com>, <openembedded-core@lists.openembedded.org>
CC: Eric Meyers <eric.meyers@arthrex.com>, Joshua Watt <JPEWhacker@gmail.com>,
        Yoann Congal <yoann.congal@smile.fr>
References: <20260626131630.1357579-1-eric.meyers@arthrex.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260626131630.1357579-1-eric.meyers@arthrex.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SAWPR10MB997814:EE_
X-MS-Office365-Filtering-Correlation-Id: f44036fd-f1e4-406b-5262-08ded6be270f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|4022899009|13003099007|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Wy3OlGBYGUqg1z3A/KzvdcV2dahmXfJMms2ZBqk9NXjgwZAMyVxsQnlVv3BKyoQAO/kJQIEzQeFOAyrGncTFmYWGBty6gFal2h8Ce3KVD+FV4ME5HOelg3u2q2JPGP3+HFyY3JoKKzvb3MjLGF65Mfox1tsW61ujRgwWdwfnVg4mUfbg0fM5DJHYpnrjKFCQt0R77tF6TzISOpTV1qXe2Zk1U/4mK0u9dau+ucA4lEbB/Zf2lVbYkVL9u01H/PH61d2uVyh3dTXMNzjJ0GtoTPwyPDkddjM2B7SbymkGA5BpdZvtGlBwrYPl+x4PjQTBHLxnt5sU3NSSm1YGjXdmOStSfJRRRncWjbl5rpGTKaZqiMSyB+VEu6Q1lJJCMSKFEAxhyzxP5VnspJiq3dglXmWUxvES1HJbw2NUxdRGAcACcEJlnONZlZ72bb06C/ZflXWbQyfn865voKpv2GlaX2ofMeXRRDQhr7y0RaMuSWzrgW4IsRC7ThBtnyJCA613dM/eR3g+vTsi+QZqwFPW2m/GG9faz7Zfm1tF+ScSYjIrwBujH/9OMnUNdryk6dNAbB8N8oe/xI67atle2xLNTa6SeBlHHp8A9X193RNIKbiwtwdwstWX5w6dOWDqWIqH6RZ2yFJJYhZ0FH/6IXIeK76YiWHz0eYVtHy/zzplURZO3cn9QJfB6BXfzUOU4stWn4mp0qaz0RaxuP8UfY7Isw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(4022899009)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1eqfkdzI2S9xckQMEVYbCn0A88xd9OcaJ/GVzfxEd+RXho/WgcSFpcGFBPmxYLFyVOlZm/Ae2Ah9hUlAgMHLcFYMb867VVbsC6Cojev51dycpt3oZoOy8i83eOogNlzSec11hDfYTGLl8O+Uvz8EnXLmEZvxXYfPz5Deal2PQrehw7Cgx+3biCI39/FaNrRSOV5u312N+FQX4PssO8o5Jd27nVcb8Qrfm/tLBER9TKzCQKamiY19Jo1fXZiH1oGruUO5rI5va3nn8U0PRnZChtS2S4UhJnqT3zLHQwR4kE2olY63uCdzdtG/K+fnkS8pHFzxmbmc34cIntOalGhkVkUZbvokhsVQGzKXZxpUm5RK7UggT/3+C6wBhhIrKZyB4OjpTn+XxpMevjVIQB2lBFBLuW94EnBE1PJSjMu0DNn+CH/28qpPTvGbhzXz4/JW
X-Exchange-RoutingPolicyChecked: 
	HThRxwxQf5ij/i/M3qiqZQX0RQB6tu0z7+uw+PfULEfAuczYvAf1fEqlGnS2LW2tqKRXOlzVYvt7Ul3fKzeiebNJUQyQ2RjExtm8bjokmv+iJH6m1d8CYcTtgYUv+9t7g4EWq0/Ni3R5QeY9IMoFa0hCSQA+ORnypmR44KZ8CtCISnrwEnH+0K6qp+xD3X+DXW2G2Y4G6I7ruw/nSG1AfMBUYK/MGoR1FfZYrD+rpL06+ixAkB2RyKhCinY/eA7OF3gjnLA7xkcjiqL3lvDw3GqNKlaEuiTsjd9pMZnp2uDWjw5zHYOVdGxkWdeDQzlFYl5tkeP5mrOMmeOWOEIGlw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:42:11.9961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f44036fd-f1e4-406b-5262-08ded6be270f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997814
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0OCBTYWx0ZWRfX7P0e79p1j3E/
 8RPUQVNnOQh5ESB7gYyjZjZg+6x+Fa/BvN1UcU8tQY7apGMFmTCZCPCotsAEhdkPF7upMyIPKqT
 UhWpTt+CYWltDwbEcr43iRUoPONXL0fNdsyFAhLJPvRkTF9+pqoWl5XtayRVl7YKHbhUDfRhXB7
 eID2VIZ1lYXMCZXyHxLtxF/ddwNwLia4bzuTPhOu7qRbO6rrzKTGI+CvJMYuxARvOwzDnpgXRU4
 2PF4RVopS7ZlE/yd0LQckfPRRjYTinh0ibBfJ5YCDl/9uG1cEpWD5l6POWu9SMZL2PT0F3NUlYi
 CxPSxvdCOvhVvO6fYDSiAD3bmcDuo9NAR7CBXX9pUttxHiCeCMFdLob8x/GhT4nP0AtSxAteT6n
 Xq//hg4ypXBhT9nr4AVh14Rf//YxNFyFhL96gRdCfmBzG2Q+Z2CEHevcBbcCdiGELo2Lp0sUYAG
 fsnowIyk+wrnK7VZecg==
X-Proofpoint-GUID: jxWS9uDrg810Ko_mE_UHOzx4MKvBMoNI
X-Proofpoint-ORIG-GUID: jxWS9uDrg810Ko_mE_UHOzx4MKvBMoNI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0OCBTYWx0ZWRfXxzXhzIJEYU8A
 cgq43g8YMX8Tk7/9kKAqBZAYdESplAqFqX7kKJIHk0Iy0cOChjWXCA0HfD6FCeuKWdJdY1pxjre
 unkQ8x2PDeV3UhHsQxdV3IbKC1c0c7I=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a43e3d9 cx=c_pps
 a=64b+Fh2X7ngyiwpNPLbe6w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8 a=9c6j8fwxAAAA:8 a=pGLkceISAAAA:8
 a=sozttTNsAAAA:8 a=qE377_TRWmvwzUAm1OkA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=orddK7cku93UzC8moJry:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 15:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239906

Yoann,

This patch needs to be backported to wrynose as well to fix the issue 
introduced with this patch:

https://git.openembedded.org/openembedded-core/commit/?h=wrynose&id=b9f060ea6d54cc419df9ff5f8822a3536934606f



On 6/26/2026 8:16 AM, Eric Meyers via lists.openembedded.org wrote:
> The override was "task-create-image-sbom" but BitBake derives it as
> "task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
> the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
> SBOM in sstate, letting a stale spdx.json be restored via setscene. A
> later do_sbom_cve_check would compute the current IMAGE_NAME and fail with
> "No such file or directory" on the missing timestamped SBOM. Correct the
> key so the image SBOM is always regenerated, never restored from sstate.
> 
> Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
>   meta/classes-recipe/nospdx.bbclass                | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> index 15a91e90e2..cf79ef5b01 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
>   }
>   addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
>   SSTATETASKS += "do_create_image_sbom_spdx"
> -SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
> +SSTATE_SKIP_CREATION:task-create-image-sbom-spdx = "1"
>   do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
>   do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
>   do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
> diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
> index 7c99fcd1ec..aec73ca54c 100644
> --- a/meta/classes-recipe/nospdx.bbclass
> +++ b/meta/classes-recipe/nospdx.bbclass
> @@ -10,4 +10,4 @@ deltask do_create_spdx_runtime
>   deltask do_create_package_spdx
>   deltask do_create_rootfs_spdx
>   deltask do_create_image_spdx
> -deltask do_create_image_sbom
> +deltask do_create_image_sbom_spdx
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239630): https://lists.openembedded.org/g/openembedded-core/message/239630
> Mute This Topic: https://lists.openembedded.org/mt/119989237/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

