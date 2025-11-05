Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8307CCCFA1F
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9073.1762348199848091443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g3Noc3oH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A55QQot1582991
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 05:09:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=scTdL8cWH
	PjZs8xQKdfM+qgJBab/yM7aKY4+QzI3tbk=; b=g3Noc3oHIHfi/a2ZLFF76uXon
	wJxvqE6G5vgC5NZvwyIVwPxQvcL75uAUPCPdlnCXN5lOlqXOVaO/+Y0YpGYj9tkq
	0LQVGULLl3+esu0InAES/aAVzonlk9qk3zsFbuHw1q4ctQu9tuqfc8NJOh6u92ON
	hNeioEFYJTVIR46taVAi38VVpJSmMf5sdWmSaQcO4vkpY7e3oijNDJpIZXyD/4kq
	MvvPKtpQw1eJsP6uOzMAZRCz2uxs8zlppYkg+ctldxPhzprFQ9j9CzjWtbN+YuLW
	deqEsoqd5P46VQ5wBfHu+I7gSAIBIRqdi30NjP0fEse9afTVcJhY9/9UOkMFg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7gg0g-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 05:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgxNt0pf9fmKdWjrTMsjiAJyJU4CS0Xvv47eo+NcfRx22ZiZ8LiTaW1FIC+fsELHSf3eXcYuNGsKN0qLFA7vdvdkn3jDXU/dUVhW43t/VGjN2X+B19c8LNQUpmPpjl/i0dA9oM8xEMDDuLipvxCJeoByeUqiRaunPUR7m+XdJMfmbjAV14fPJLxBjHw1Yrzy1YYTmTHWTot3TTafgRr69qOrAcu8B8Y0Dj2szXumV8G5YI40XpbNkQ/HKutXi1Hz2ynQhKt0aqfKpYXJXECrMn7P0YVPIFAFktQRz+vTcCvFUCPIWvLcDqIcSH/snynkP5W1cwWOdUayTVlcAKYq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scTdL8cWHPjZs8xQKdfM+qgJBab/yM7aKY4+QzI3tbk=;
 b=lwKyT7OCdI25HtPtT2ZbEh/xmAfwuFFpKyDEbVx6lt/NichVCet6+PP7qXD3vf7eOWymrR9fbI1+z0UpXxrYSAP8sph0pMxjIxM5uUBQ6gjXwIlHDuHukPDpNFqajOcrZ4RD+xG6YQqQPUeF+WaTkVmy6lvR2W7eMhezH8+qNzUJ5SJ/zsGd+0KrFWFtlmXySO5CrSeDFbGvGu4x6D558UOVPPaV2eLnm0Iyk8eKJ7N6gZEkJPoA6tAsecVZKkIG1R4Z441VjAhuwHPaHJphGFXnop6DPy4yWPFoiFr+BEztEK1Dx5CLrgjNo6C320RfxWab+9PT6Pfhpun9Ta7WJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:56 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 0/8] Enable rust support for linux kernel
Date: Wed,  5 Nov 2025 05:09:34 -0800
Message-ID: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: aca6dce2-b377-4957-f03e-08de1c6c9dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CHeK+qDfh62QrSO2S7K9jVMooemHMYckEg1pSuu2S4OoSaZ636HSOzRbZUGG?=
 =?us-ascii?Q?a7Tm0grBDVBxek6lLv9rdltMn8WW83U0ZfqU/veMMwc2MsgzOMU52q9PjPg5?=
 =?us-ascii?Q?V7iVafILPr84iRIL/z6TOuVXHKMtXpvBbV2WfMA8aUmfoKeKm3anLd8RZyXN?=
 =?us-ascii?Q?naHbqTu66Y9Bm8IOjiKI9B57m34JL3sXe2lUAHG24AlGpafVzFCdZsJPHbsT?=
 =?us-ascii?Q?WDxDDXhXIayMzuvSJkSYwzx5pyNGbFgDxCkGrsQZDUpDLRMe6aBWXl82nTBe?=
 =?us-ascii?Q?VKwkrX+Xf3Bz0Lm9naUV0TvAqDDeZ6ayBpdSn32oY8AJT7ADzYvZ3a7sXETG?=
 =?us-ascii?Q?ubfEemAcFfZ32cV4+JcAyUmxawNNnUSifCWRnKNMVwhi4HoUsYNs//9TbkA4?=
 =?us-ascii?Q?dr8Qn9c29XVN5+Y80xXLrGse0uzFKnQsf/CGwTkIxfwEUv3/6rdnj7yJFf3t?=
 =?us-ascii?Q?pMUF4CjwORl4oAxzD3OZBKwXxaz/2GeT0/x+C5niFl7FNHgu3a5USl7ESYoV?=
 =?us-ascii?Q?3FmGwXS7wuwx9hdNf/FOMHkRGF0e233Wunw2J5ja3dDPBUT20y2H0Wywsd18?=
 =?us-ascii?Q?yYX7MfnkheCFVMvmHZ/nhBTeJcuvTojqN8S2WIS5tQJfuYcBWbExOtxRfk8c?=
 =?us-ascii?Q?OJ5mmpKDKnbIAptStaFruMpol8Azyceq/Twdg8IZaYVnZ5/XQVExGufLgK9P?=
 =?us-ascii?Q?E8f2JZvG7OL0zZURvdEW1ehc9CqCXFq0tPjLTsMFil1GUT/66PbZzghGRg3r?=
 =?us-ascii?Q?0JFhUOsea/1ZTz9p6B/135rkIeB4sV6VxW9uYTjlaYh/q2uKhwbEYGX46o5Y?=
 =?us-ascii?Q?0feKeNDX/cT4LeFZTKB8DQiMedtPuMFNjZC0VovH5Vbo3nRxkBWcvGgNK5EV?=
 =?us-ascii?Q?cPBTDjRly2hOcgs09BLssmsJ12VpPivi5EApaAFgoxrMi5UARBlG4HAidTLa?=
 =?us-ascii?Q?fac3IJYjd/dZlU4x07XYFTR+eqhnlw8wMp9nnv+zUNwTqvBqFjAyQ2UUy8OL?=
 =?us-ascii?Q?2kfk4jLNSwHcNxNB0bCrrjxZf/twc4ZbY7nPcoDchsFZT3PD9R/NcGnGIsoS?=
 =?us-ascii?Q?NjBMqqW3pWdV02TIwiEUUYiqCgr6ogIDJxg3Mhp1doHEfEMK88GsY94bkv7O?=
 =?us-ascii?Q?EqoGrfp2PKd0pTLLAbZ0LPLZ1gu4CQyU6q5rpJyIA2iAH9ps9ifzGLz256Wt?=
 =?us-ascii?Q?09ToywT34UlW06p0WiiZMMA0E7/nILoO6k7wT+UFY3I7ARHxigIZR0eaVEPM?=
 =?us-ascii?Q?9sIRcQHCtjKt1K3GwCodB9ZIe6jVl3vx0M+DR4pn1XIqihT4JHDTLBg6ed2r?=
 =?us-ascii?Q?ZFxhKqATpwMpvXZN3H6BS8jNT9jN099wgyd48z2gis3yX/m3yFL5hZ6LKFtn?=
 =?us-ascii?Q?MWAFAYCocHdrQqsqZsP3YHTT3z3/Vs0N5CK636KT+MT9FDOKoZ+d8cksiAJM?=
 =?us-ascii?Q?ZFsJg4WS39LVv5XwNO4KNKsXnPlTdrMas8UdMdJr2G0JtSBzXY8kUR8QLCHu?=
 =?us-ascii?Q?cjyDwBO6daHzxyqmyy0VWsTrW75wZ2KbGtiN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T8sakfIAntxqA0x+3AJo5tWDbo65YpKxeHMMpic6Y1tVSBHk9OP10P5TICmc?=
 =?us-ascii?Q?qXsydBz1/nBfFds3Ay3NPm2krD2djoDiK54TejfK8cHYHtPSoq6hYdg7FqcJ?=
 =?us-ascii?Q?XH+OEUci7KRqEN3nnJtlMfT7yLVXxDtv577ww8FnYpYeVv8Xk5P/A8f1TGpX?=
 =?us-ascii?Q?+YzAkyia0IUtyZq/bf8dTYrsD6IAqwawyk1uO2C1B/diYIXnHkfKi9SrZ3yS?=
 =?us-ascii?Q?0QN2xHq0tC5nH3/MoZlaJ0bEP2HRX7XBLonjuLTeongxS9aWRJ2JYqqsktIC?=
 =?us-ascii?Q?XRwvYRocpihZTXbkulDIJ02Wm+R56KJLtJL0rOeJ4ZyoOlcOINS4bgifgfGq?=
 =?us-ascii?Q?/jsqFWgC12G+We3OKG/vVV9EpQB16UBIv9S5A0228vi64r4Ppww1NwTFP+U0?=
 =?us-ascii?Q?MJnNU1n0awz2pV5mWqTDtlMXEIX4UkU6FMuhcac9ebNEJ3LMKgDcuyBXql1j?=
 =?us-ascii?Q?xrgqQ4znNT/FS1rzV9FnhbUSyQLIx1jwGM217YNimejzUA2lJpubwu49eq+S?=
 =?us-ascii?Q?s+8R4CRcu58/bJeGxaab2LTWlsMhNyty+rmoMFfahNpn7w7GCxiXJrurVZYe?=
 =?us-ascii?Q?XeBXmZ8CLqLo9Qcd9agSA/qKtWbrykbwKXYAAh2HiKOx9v+Ca06ZkAZCdl5D?=
 =?us-ascii?Q?MXYkTbiuPoTRZEbcrOh0CchuncofSN5/sQE1jTisIdXDgQNXsNwqoNVTbFWi?=
 =?us-ascii?Q?T7QvpPF9ltqBBY7dXD1eP8lneC4rptaiJ4qSlm9f01I5oLirrabn9THLJgiC?=
 =?us-ascii?Q?E0bK/S6OVp7JZ2lP0SWD80mB7SrqFMH5YnDsEqthvQ1RLQi7VdAi03Q5Xyqo?=
 =?us-ascii?Q?WvhiX0ejXBUFX0VJPvPyiY7ylzlrKHzDd5DMqC6SRWjul3YGsSAnRvZvphzq?=
 =?us-ascii?Q?dCKJUW/YAOcSHEPQ+uc0/7oBnU5McBUsX0kwAwiYnWMUT6FlslTJj0qMJv5T?=
 =?us-ascii?Q?lpFKgAEkQdLMelnkxYLrmuwDqT+OSrPOKDE/AwXt40QZEJcggex+1Tz5aqKO?=
 =?us-ascii?Q?9dV9NW2Tlfv+4JobUCxIo/RGFApepxVMzD4I6zptgeXinp0K1Za9MODeQeZN?=
 =?us-ascii?Q?E4ngHyXHJFhVDnuZDBTRvkaayV6b6z0jN5qLkIMQxCIFenxoXOd2n4RS1os9?=
 =?us-ascii?Q?uZ9/q/Ly8HaWDuWNV2g3PnEn5/InmE0HdA+zdG2d04l6brUCZob+tAbzeNfu?=
 =?us-ascii?Q?KPIOZK7eF3N+Mdtokpuz0UfU/K+JM17fiH/voKB3bzIrJHPJdagg+Q94CiuE?=
 =?us-ascii?Q?hQq6JzKmtn00v1/4gcrMfHfQ8v3tJtmPbPJ/MKWcsgGkApOGjaRTlaxOJsun?=
 =?us-ascii?Q?pL+1d+218Qe9hu2Z0hiTp5wOL/4+kBEERM9s6vufYq1sfwy5mTDshtUaeHbZ?=
 =?us-ascii?Q?rrJaRbyoDfoKDUMfXHhtsVYnDBSWEkpZMCNWmgd1LJouYM5Nng4CGdlTFLmf?=
 =?us-ascii?Q?T2RKqs4iK7H+sr/GDpQWyo++YEXYNg5pjs+DgJFHiToKCdlKttekO+TRRJbt?=
 =?us-ascii?Q?djNUMD1MuhQt0NKLPKqRVWWG+2SrSgc3c55x9NdmjBYQ+iXdtlmGEtlIEvqL?=
 =?us-ascii?Q?IdCRvcS+o21bRmpnrruEBfdzwHtJR3IimOv37Yp/gQHDsKrp0CSnYkSNdHKR?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca6dce2-b377-4957-f03e-08de1c6c9dd9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:56.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgKZ2V+oschvI/elgsSICWQ4Iq1uwLni8s2S6haDf6JvVvliHIaYyoK4Vn+w1ew4BEbxsbdhmc5leCw/CsyUpboopvDUbvvlLmF4NV+BTuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: gJarz8iZLNEm5GzIjoWfwSnEvAG89UXA
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690b4ca7 cx=c_pps
 a=wodMs23R9wL6gmOfRTd43Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=z3jGt1xE82zkwjaeoi4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Pkb0po1DGa_CaKnVl2msS9ZW85jwWAtt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX53mwh/F3OsSk
 iyERtETZDSqaOHT9qcQFRrz59FC45XyPXYrzXo40bPvqgg3+ZYzpPoilltgIcL1C6nkYygvO1eC
 LPIyJKzuOm+dxiQQvwDZX6Ko/zgtKquNSjWnU1yy3YVIijYs0Y61KjMZ2NyxjogEPQXLFl9DuyF
 0pxsWXon9tzOYOjzh3BIhlm9Uhtfwbk3KEWsrzMKAn7+bbJ5nOJIAtGhb2wkjQ/Hj5nNp7tycCZ
 3tcVVtdQV3+845uYA/bWr85LEJpH5QinjIVCkmdMaL29t5t8zmhIwSGqXukVjVioe0u8nKL0Cdy
 L1P+p2BL2qzotkPRLCgKRE+qW5wo9346ChW9w1mSXCFqTD/SAG0pCsqPC9A1Z8o4+/rILIC63JU
 LVwBco15SXvaRWrgtsfO13tkURIXPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225758

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v2: 
 - Addressed Bruce review comments for Making rust support for linux kernel as optional via distro feature.
 - Fixed buildpaths errors by appending --remap-path-prefix to RUST_DEBUG_REMAP
 - Removed unnecessary flags from rust.cfg 

This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for
building kernel module which is written in rust inside sdk.

Summary of changes:

- Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 2: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
- Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
- Patch 7: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP 
- patch 8: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.

Harish Sadineni (8):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: add clang-native,rust-native and bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  rust: stage rustlib sources for linux-yocto make rustavailable support
  kernel-yocto: add rust support via make rustavailable in
    do_kernel_configme
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel soucre to $kerneldir/build

 meta/classes-recipe/kernel-yocto.bbclass         | 16 ++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb            |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb        | 12 ++++++++++++
 meta/recipes-kernel/linux/files/rust.cfg         |  9 +++++++++
 meta/recipes-kernel/linux/files/rust.scc         |  1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb       |  4 ++++
 meta/recipes-kernel/linux/linux-yocto.inc        |  9 +++++++++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb    |  3 +++
 8 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

-- 
2.49.0


