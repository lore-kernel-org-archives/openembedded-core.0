Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7C2CA6004
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 20:35:32 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1266.1791405328065113453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 13:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ibCyES2j;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=fFPDvIBU;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IDRn51425061;
	Wed, 7 Oct 2026 15:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hSpWL3ql/ItOmBWoujHpBAsSA1H8Orc0NQpgryyMG
	vQ=; b=ibCyES2j+3ZARF5rUSvH6Yzm41VX5RxX/u6+Pe3QceoOofOdDF2sFQx01
	uyct6ZOF5ZGY/nokUM8g7z7Wz2qWHYiNbumDz+C6fHWhad114Tsaa1pkGSRb/hC/
	CXBGRQMXgsfvthKIU8vSvjR68+RgzBDJdELPPqOWHm0njSPo6uMat21WBeX7AEMr
	zxcwi1E30r/HDT8u1BNefuoziR3DGDVxKPvZoLGiQyHx6GxHPkmbFlNbIRhKOSUY
	cFKYhx0NE0QL2T90xsczgGVSfr5FIf4vxLOjVPb56ovnVRCTheUut7NeGisEIWsY
	LLik2gH7QCCtPJ8V3TiwhgHx17T/A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5ndb95-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 15:35:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO737NNCjS4cDobJtoRH4KnFSbvqpD2DvIRLw34e+emOAqqbWzjPrXTr6oWe7o/Bv+R8mDkdJVVuv8WGwXbN0QVnYOU9IlT9BhdYqcaPBeJfqQ4j/gnxiVjwJxJeT1mMn4Ep/rG/37p+fZ8bhcIyaUeRjV9Ne6Y+xui4X1zlOHmJ4yvVtHnBbXL6eif9mCD08dtStjelqt/bCCugGXalDkHee6wIUchh/N8b8LsD00mhykzfnkHFkg+FsCz0hQZseOs/XTYm4CDsaAD73K5wdPbmLy+k9vZZGKXO1EpnTuqARTOom+tiyZuNRD/6OTZxx2vYvb7bTiXAlaH7boP9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSpWL3ql/ItOmBWoujHpBAsSA1H8Orc0NQpgryyMGvQ=;
 b=sKEn0yQq3wNcoq/o49rGk57OgLtW+RaUpFv63uVQL7d5I0alMlV1K+/cIWYaHkkUdzxK9G8B/nvgZYqbZGCJnncjqR30bX25oFbtxMFl5ZT0zp/ylpywHZTHnWipCALrGLr2tHcfw1n6P0aVZ6CCiTr6PEjGOfBB0nwsnYtp/+ouP5O6V/0IKust9oxCBBeMaYXEReIdDcYBy5PDzE0n9z8vdiY4a9Fa9B0XOoGSNTMi0N1YsY0IGY83hNwPD6Gxk89lmEuDd34qRoJAV7qmqWHWCux6fQcVppxaPT4a2w7wH6KBpEvSYnSKYbFrqwMmja6z6E/lzP38X6XrOI9pOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSpWL3ql/ItOmBWoujHpBAsSA1H8Orc0NQpgryyMGvQ=;
 b=fFPDvIBUa1X4QyLirv7xXtG1GSDEDnWkGk2cc/2QNHl7NlDZZGIO8kNuFr+RYuzVo282ws8DrQJTNa4sXQJEJIvO2Plj4cg24oWtpKZzpnAtsDPtIjogSC97q2VOdWYO9b+PfsKKJu/fgXyOhp+1wq0fJjpMOMf5eAntgiQAwRY=
Received: from BN0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:141::27)
 by IA0PR10MB6771.namprd10.prod.outlook.com (2603:10b6:208:43c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 20:34:35 +0000
Received: from BN3PEPF00022BCA.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::98) by BN0PR07CA0028.outlook.office365.com
 (2603:10b6:408:141::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 20:34:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BCA.mail.protection.outlook.com (10.167.248.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 20:34:34 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 15:33:56 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 15:33:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 15:33:56 -0500
Received: from [10.249.66.148] ([10.249.66.148])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697KXuex1861032;
	Wed, 7 Oct 2026 15:33:56 -0500
Message-ID: <5982d605-36e8-4a04-810f-d4fdebf75cdd@ti.com>
Date: Wed, 7 Oct 2026 15:33:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libgcc: fix build for baremetal
To: <joerg.vehlow@emlix.com>, <openembedded-core@lists.openembedded.org>
CC: <denis@denix.org>, <richard.purdie@linuxfoundation.org>
References: <20261007055706.1493585-1-joerg.vehlow@emlix.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20261007055706.1493585-1-joerg.vehlow@emlix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCA:EE_|IA0PR10MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b2cc95-6534-4976-f207-08df24b265fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|22082099003|18002099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	++wo+oYiu3Xh3yIdXWE8jjuGygNSDSs0pge9iALZTW7zIx2e8gDmJrwWAv0DWxlr2+mttD0osDBUYXfg6X8xfLgIgK2Tga2GDag3uPT7jATl0AZwdzRUkN02X/+MUApQONy1XuRI27a9XUUHleZPQi2Fg7j6cstlh+G7hIGalwcoxUAVrIcHShOlyXZqNeZZSp/Q2H6LqTPI5o3GRHgCPwUMLwrtd/wBs6H5UH6cmwHUKkzLhmABtqJGcJKXzsAzfow+QrvvCi6FPcOlTnhrz3Hn/zHOCx1YOOagm/DJSV9h4VzU0P0A5qvImwzB7eL9MqwYXaCVcOzimn7/6wge5/6Uby0e8DMtfM+ldZEh+8Y2L2rym8r2Dmgwrb1zvuvuG3y2xJ9LBbR8k5Ihi4zeZC6uld9ogCV7yVc72cgbSRlaTd5rdA0B9cstP8/agL5vadoSCF4tyqAs06xOB1uCecxwhJygH49Rdt4r4mwIoI6aC6UbxE6dt8fvfd5VFm84RKjdhM1q6A7Qc/AOfr1ju8VdRu5vyQn+kvRkmumM5S2frn3/reWq2+J7dSoLzZ5x1R9883jD7bk+tW25DFOozRBwLdJTjbPz7YVlRx3Izensr6c/J/XZCqaPhW20VUZQLYFfcyRMUwKju/VuSBmv0Og9qEVMSjRA+WLejqOQeKSMB3nCrH3ipN5pc0b4CWVbivw+CDcVkG1sejN9pq3rJw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bi1wOyDV2Ut1hBss9efUOLA6u6N3ntTmvFq8bGDVLxQ6+RaUPCYiUfWrt+1zyIoqrC8AtWZqIQ4pp2UMAviM9hYWZX0mATBUrDSbkDgFrl7JvT2KB838WMdZg0JzpeRNultEvaEQCuH+dRtP0zLsvLL111qB1iRtjohL+xCNr0EWiW1Xgo5iBg1QwbbG499svK81ik0ttZwA0uTwERBjzrVppcfLBhhqt+zrn9ONHn/7LkxmCKUoOowfv5QYXbMDL+HCmc0WYByx74eGD6tfCopGZMjxzDdKT5N0DydMQ+pmzQb4U2T0bIVvirbvIjNHldSXOTrvKPamx4Gg+RM3IK7gH+t9wbX0u24/MfKE0+b9fF5HqJZTQA/SrvNcsjt+2SkGvtP4o41sgq/FsMOZfbjCwcaVzf4VKdazWW5OORT8nlw16minYxFZWMSW89ru
X-Exchange-RoutingPolicyChecked: 
	noRBG4J8IcAZrjnNhZImyQsfCZc+JpoPFALE8I6mh/eePyHN2YsWvfpZl417IeXNK18RGUjw1+JRFEkHSdXQo3eya3c0FAtOC+ZcklWPbqwVjd6qB4utferpfMGfjYeUZx18lo9MTEy28vvdgyZTz9IClTr8GAdywVwnHPQJqmDv8ZeaIr6oHdaLEz13gSOiHQuWI59pFIaoh/ViPZ+7x5VmQzmECRBW1hT79nMwGmCxecXeL5fzvD0HKkgfOyW9d2yFFKlDGMxxL1bXt6eA9ZOqn1Mk3n54ONrjznXJ/YEtX4Cna8QwTWzDQpnGulTUn1TJPnd9gCPtLJpxkJk70w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 20:34:34.2377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b2cc95-6534-4976-f207-08df24b265fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BCA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6771
X-Proofpoint-ORIG-GUID: Vuw3IZJf2QWh7pBM-E44yM57Zv0_UXCC
X-Proofpoint-GUID: Vuw3IZJf2QWh7pBM-E44yM57Zv0_UXCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfX9puGQQqE7C1m
 pdF4XvSQqOlbRAaSVfSxqTr9ZmW7qMSqdonzd8I/6skJhDpimeyAOn+26nqUyA5GX2yG+dfwSK1
 SmvIBmDvo2TnOt+/nrTaYhC9DyWBsHL4f/xnwBw//nHOAHwI0OyUHj3F2Bvza2ak8FfYZcXNSfi
 bkSqX9tVEacbxXHBDuPJZJ2tAbjhgkfN5y3XYuZhfC2t89jjh/NMl6mJyRin85PHHWAQR8DeRBI
 wf/REfOZ3gnUmCgY64D+O+gtU7e1Ht8Cn1h8/Q/voC+2AWNgdHmwIzQsnEDSsQVUOzztLCPEq4F
 AgjqPtVuuIrD1oQbkmDfFFyAD8BadBJK91SJIQWXIVh4LAkjKdZ3UilJ4u4MQ5iR1Y1dgXUu8UI
 Ad8bduSDJm/DtzX5PBqqpzNmsV1P3AMXcTV60aoi0lYHAUmdsx0gofCA2v/bw8C4VNiy0IDXbaT
 9EX5kWt5BdOlpv/DT9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MSBTYWx0ZWRfX0F6v6jU4xQ2M
 Yj1ITlIaMoa7T1n/FXrrZOSqyUVXzI6aMmgz08WVTT5RWOlQfDsfDkMhj9VDhaZdjrNe4dXIbB4
 YXfaAvz34qmyWbG53I0jgGha+4sqxRA=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac6ad09 cx=c_pps
 a=Z1Yvi+W4mc/VVWckEa0YUw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=-3QgrcovAAAA:8 a=sozttTNsAAAA:8
 a=GhfjjkeTL6_NPSpzOlUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=sID8nOgl6N6ptD1j8Mz9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 20:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247404



On 10/7/2026 12:57 AM, Joerg Vehlow via lists.openembedded.org wrote:
> By removing the erroneous EXTRA_OECONF override in 020d5f0, gcc-cross is now configured with correct sysroot flags, which removes the hosts include directory from the internal paths.
> This in turn leads to libgcc not finding libc headers (as it should) and breaks libgcc build.
> In order to fix this, libgcc must be built almost like libgcc-initial.
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
> ---
>   meta/recipes-devtools/gcc/libgcc.inc | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
> index e92dadf021..93e217f567 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -37,6 +37,16 @@ LICENSE:${PN}-dev = "GPL-3.0-or-later WITH GCC-exception-3.1"
>   LICENSE:${PN}-dbg = "GPL-3.0-or-later WITH GCC-exception-3.1"
>   LICENSE:${PN}-src = "GPL-3.0-or-later WITH GCC-exception-3.1"
>   
> +# On baremetal there is no libc:
> +# configure need limits.h for its sanity check
> +# libc dependencies have to be patched out just like in libgcc-initial
> +do_configure:prepend:libc-baremetal () {
> +	install -d ${STAGING_INCDIR}
> +	touch ${STAGING_INCDIR}/limits.h
> +	sed -i -e 's#INHIBIT_LIBC_CFLAGS =.*#INHIBIT_LIBC_CFLAGS = -Dinhibit_libc#' ${B}/gcc/libgcc.mvars
> +	sed -i -e 's#inhibit_libc = false#inhibit_libc = true#' ${B}/gcc/Makefile
> +}
> +
>   FILES:${PN}-dev = "\
>       ${base_libdir}/libgcc*.so \
>       ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \


This does fix our build issue.  So it should be safe to pick up this 
patch and not revert the original change.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

