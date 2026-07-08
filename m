Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EF2C44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:19:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11208.1783523947088832596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tD/7ikjt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3xNY3879451
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 15:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=m3zSiq0OW
	//Rax+Ks48GUhYTFebyfhp9KU9OXD2Y+wc=; b=tD/7ikjtA/NIuFSJksBC8tbPo
	07qO8x5ZTbtuVYtxzyQmlNjpYd1IEdE809YVyFanhEADgL9xni04yeyc9A/E7heq
	joGXIke51P+WBuKSysgcdbG/G9aSe8519Xy71HIKEnXfHi/+G/XFPJ5c6dUoOd/I
	v74OrfWRmu59UiCMfeIzXP8kbAD2hCQ7ggoETxXa5bafH5hlM/s4KwmazSFLzt6A
	+nFSIvakubqIvViRjEnjwktN0TXaHG4ySHPp6MYaf2afss6b860DWqonsabZFLt6
	tYMQEbGOGRmJTBjYunNAJE1dMukndZXfxEUpf9q48uVTx1HjnCLj3MRljtABA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58eh6n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 15:19:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvrkWgegjVhioB1285NxQ8PxbXLD/Umhdn1GSzctUTvDlnpQ5PCKg+O39ROl21wkULf3gmebSohDoD7yh8JNGRHqkvO6Fh5vHV5MKFzHWaMasNhtc50yuskdChk+WNWDyu627UbL8yxcacrM5DEb8FseWbTBWqBdy7pSN6exIZSU8PHhOKm9JDWV3S4Xxa/FCxFEUray8RXC2lfW9xma2RHrC0DvI+LFMlrspjNMjB63gWGGRQRbIrqEKRup6swy2AMF4oQ5czUxjLcVulff3jrKaIVfpWjcpEoiJJB5L703r/To2gfN+O+acvdMsQ/CQtFNYagRMWa2s8QPh4fWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3zSiq0OW//Rax+Ks48GUhYTFebyfhp9KU9OXD2Y+wc=;
 b=w7Og51wpm9OPjuSv/lBu6lV1lV5IcqC95YG/gwDIXoPkE0UuUT07hSStkU0kNIOu8d/cg2DtrgwoMsQmSoJ0WMyHhFx5QeIyvD/OfEXGHAgNookp/6vbWrEbYH5QENxvOsPY0TzHBga+/5qoNfF9VExmi90RQNakKk1k+jtHTNMxzuN7ySxizxRmS2PxDtgPaHeT5MFoJyxqzkXZ1Ow34h0cpxz9zDQjoIopLU03Cf8VIhO1O++izmZVeEwwydKhbB6xnJ+R0K+S+7VsTqCaKXTUFUMTRUZ9+8TMk+5fV9OSImFk5wNIR3gDaXMkrgZZLpzEoyWS0luwLn5A6d825A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LVUPR11MB9810.namprd11.prod.outlook.com (2603:10b6:408:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 15:19:03 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 15:19:02 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v3 0/4] Add Clang toolchain support for kernel builds
Date: Wed,  8 Jul 2026 08:18:12 -0700
Message-ID: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LVUPR11MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e64424-9f62-4307-7ede-08dedd043e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	zHCtK83hgMkNUqN67mVuevcoRTD3HKsoh26Rj5F2B2ZqZaNU4xpDDSOSmmgKCi7Cyv5KsWsEUxGFT4pS0d7qXfPQPY4XmsYEguT1ew7W2kTZd373IWsWKW11f1vhHpmnhxW6ZoKWAguC9ISbMWR70xChE57+xLNrbdv4IciJT81C54G0DnCaDRQv98zzCIWa83s6BjoFu8VqIPz8cl4M5Xq+6kn1p1G8A1rREoZsxEk4jqNBqdvjN5wzdxarItM0wjopK/pw1ioM8eX53gZBK2qh0UAJX9G9706cdnrqKKXdm2ffL1eB03+XM1KfMGmI05jhfTJ1auZZPZhrqpFtJtx9/RvibgDFuAo2X+XU7aTh7CF2XB8fnInTRAl8dh4qq23R2eoUM8X78+OISUnM3PCu5S+yWW5SFh0qzY0G8G2O7UzqhA1CzxHFB2zYOpEpA31FlC3+vCD+KwyD0BNWLs0xYo+XGkNb4JOmy0KvoacLA+/Iqw1ksJrbHBfxu6tnz4Y4zvsjupZXXCcBxzk+dEbb4jYAkitF6uR17eLXIyWMQdg07uxXQOuiIzi6k4phszMqC3CsLyJXbhGM2H9CeptpqxhgP+GCWPU2YkvqJCfmH1P4F4vOHv0uMAt4u4Tx6rDtvA3lf0WScAgFeZpLjL07bEFRDkIOqEfI9Lnh+aTF05ejoXT3RceW317avi7TGpkRAl9/luNIE7ZOlhLugtuCXzNO0/5zDxFGhOtxmHQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qsHCRRttkjGl+EcYA5YIu0CS4mTO9JFoQCnOugjFu797wlZ83qoaTTR6Ncri?=
 =?us-ascii?Q?jPo3vEASWGTUlhYVqZghLiKxvoVRbridmG7v6m+GAoE4iZcoWsJrUm3c4g3B?=
 =?us-ascii?Q?VObzrmdZmqEMS1QP77hI6r+uqvkstWvDd3UabU8PBcPvUkroiW2v1rvd3I2d?=
 =?us-ascii?Q?4fJHhEpdp70Fhji0bu9dC8S/LN+B1rmgyD0hFLo0UtCn9EjsH6C0ZbKgZE3r?=
 =?us-ascii?Q?IKcWvDeSQY5orCpfb92/ZpaSlKPwPFHtmFtiBbT/6OgPYYKNQmOc4R2Wr4X/?=
 =?us-ascii?Q?/1ZJlwPeslkxTtDA/nBiYFKDzJQSRRBxUYrgYVOo7Vo9a62Q6r1bIyO7o9ZD?=
 =?us-ascii?Q?kY7AHftsygbZOjoQ0CTVbkI6HU5fr3lO8G5JNIVlBg/ezi7R5KZp52+DnTt/?=
 =?us-ascii?Q?Rky9YnxNwRqnIKvmKNyi0VNcnWSYJrkkkcN0elrTAhie0mXV6BRoEbBgXjoo?=
 =?us-ascii?Q?3mBKQrQdxjCDpW5EXR9QeGWt5CeOZVAuusjDLw8jxJWj/QMHXb0qUUo5bg3f?=
 =?us-ascii?Q?MWp3ZDcsEWtcYDE7+kHUfyoFENCKB18gTjmiyaYK6JSWzt6rOSkUzKOzDuOt?=
 =?us-ascii?Q?3nSVp46++c6Wi/XgOEf+4vmroDSgHJKNp/UPerJJeDhmMuDKEi4hvy9Fjom8?=
 =?us-ascii?Q?geF0pyRMy8CtDGX0asyPHXeV4As60IC3Xr/t+kZjqu6f+ciwMO6PpzVWz2ri?=
 =?us-ascii?Q?4vPBqqfWIH+f8SlAQj8VGnkF5l3xzuTxe0SlDt0JArBNYXD0mALDR9hffyRP?=
 =?us-ascii?Q?WoZwiihGGLR40DQsB8yI1PEtgskaZMu3oVS1pu784qpiJptA3/IagC7ZL8Il?=
 =?us-ascii?Q?2gdoPlHsLoOSDXWRp7DWtW3qzFYfzdV/s2hTpB7qbQylMxxcqniZOLTbLS9j?=
 =?us-ascii?Q?kfcZX8l4ZpGWSSX3qFaxw4AFbTCCO+G2m8Kd6ZHF4Sac0hlv4BsnLN1oMXdw?=
 =?us-ascii?Q?leZUzliQTFd6+lrlD9PtaZNRhJjbA2Z/bFmkGzE3MiqUJ4feeVjuA4K1Vf+X?=
 =?us-ascii?Q?ovdctDJtZ7eGJcbtC1AoiUzSPzJT1ICVy8Fbw0SHjMZJoH5n1VeqJgxcGxc2?=
 =?us-ascii?Q?8fUUfaGSZ57NHbs2TeHvt5ZdOv2w+ktktPsYd6JY5Un5R8lRSjx2gRWwUHX0?=
 =?us-ascii?Q?VDJ4dY+mY6jp60Bp3zHwZRvhwsdudMK9DzwI94G3eSVYv0PKEFljRnGkgLcu?=
 =?us-ascii?Q?m1Y/I0qN5Ejm8SDVRspbfnTFSMFX+7R7sznWM0sdmcQHjz7xdZvgTfY0vpsI?=
 =?us-ascii?Q?4sfMA350/oSL+lG6MOF2+Btt4EXFMV2QpGoBoBMtZE9XvoqDvbYz8ZGhI9cB?=
 =?us-ascii?Q?ko1poC1b48I57sp+C8AfwE/P9yTjTX6DdNusj41/l2tjJHb3cQLs0LVJWBeU?=
 =?us-ascii?Q?Ge+37njpbv8N7+2Uzrrdz1qePkimGjpW+rCS3LZN2bsr+F2u/4ei5wCiBlWk?=
 =?us-ascii?Q?VGuS48G11pvgJWOm2IqJTByqwh6cuKMYODv+m5Vt8WikjdGXkXWCP2asJp0V?=
 =?us-ascii?Q?aWtRDVjhJLidRZNYiKXAMex+9hIvqRpluzcfk12u8P3L0j0b6fI5kcME3say?=
 =?us-ascii?Q?BE1kk/Q41OMSZyq1xlXE66yENZIoNX5+y1Q1mK3vpAyMtiRC2e3IA9MxJ2Fd?=
 =?us-ascii?Q?gXlHRgzbAMkazNlP8cx9oh1lt4pEz+++8jFxu68KYC3MntRpvJ/6oXsdsViU?=
 =?us-ascii?Q?kFYLXFXMd76mn+Kk0+/Rhh4m9CFVNl7lNxeMx66Bp06UjA4lciuyXXC8Fwfk?=
 =?us-ascii?Q?deV6ZGcNyREOp2uNhHj9E6RGdVSxnD4=3D?=
X-Exchange-RoutingPolicyChecked: 
	pyAfH7mmDN/g9Yvb+rlsroV/9VhKCArWb2xyhNF2u/nH9ium5TGTDg6XsLudltnmR0bo6wI8Jxupo+7HoPFXtkbwq+n3LCfjyrWkqW76sAHTxMWtPiyTpmjQ2XtDTQ1FmLmkpVPi0t1peSzLpQahddp6wceXrMCsRIIFW89AGp/0kOLtjpzQo1CTjAXiFPQYIldo6SU+sZ3uZSVrdncfl6MOYNg/MQr2RWe3tFFaTAQJhdc6RZKrviLR1zEmKwEytUUFCbwvjv1Ko19ZctO1fnF/bY2T1dz0cqC6anYUXLEd9vfB7DlFMhQG5JlduHhI5H/K5Htrm4/vLfCEuOGvmA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e64424-9f62-4307-7ede-08dedd043e51
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:19:02.9538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/blTwfybP+wlgiPfDaU7a3CedRciGKuad/pPHp6wUH7jeezK4noiRgMTt3Q2owbt7C9SH0ilulq+VkNoU8FKzcAjbgQkoif9TkGp/DvJvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX9wrUdYWWJHy7
 1SbKHzBmXDsmFqABTaVYHkjvkkn806fOUE5rDSeqqkZg1RW0ZK6fAj7HW2D4xQ1IQ1iDdLmjrIk
 14CLxEWdLwvHXYKwZJvZfEkYy/vkOQBGqnI8+V2M98G1LVNP6fyx
X-Proofpoint-ORIG-GUID: 3fnvJNHRzeTsTfPF9YyxGcDBVs0FhkZT
X-Proofpoint-GUID: yfgoeTrh-6ktIafBTO6XaHT-_QznZk2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX0gZbMQMpn1S7
 f6XUl4WmJwohr2frk2ttaZPS5SbkdRzKL1Z/Rx5P1N7SYZMmwjP+oG+/GcOhhTvCtMOSzbeJ2Ft
 ctXE46I72vBWknoFk5ALYdy9AHOJXEGZOqopwiNi+Tn0048M5++/+1Z2buzAgAP6hSZ7Bln4ojb
 O36TW61AdVejgj/ksTEg6kec5UzCfSue5sSxfDcM2n/edmmlTYoeYS7TAIFtIOApfbtylP//1/J
 lBeI1xyUvw/vqHUUeafNtDOzdjz7+ibR7/aSX2G3G3JI+HB/F1PgS7mglBrQvAzRXhpV5Qh6bxc
 kZYSFeKv8MKB9ccKRZghagQKPonDLbTYnjoSnbbMPqkOHN50LRwfc6zljcFKMNCuFCWl3Q+3ihl
 BXTWYlW3U16vWARqdYlDlrEVNftYYU8Si0hc4HfwbWuLEW8Wlg8P3UONCFGJIr4nAG8O8DOrh/r
 JuTnDZzQaDPg9gKLyNw==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4e6a69 cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=fCfAUIor7MFZMhRFDUsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240489

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v2 -> v3:
- Guard against TOOLCHAIN being unset: use d.getVar('TOOLCHAIN') or ''
  instead of d.getVar('TOOLCHAIN') directly (suggested by Bruce Ashfield).

v1 -> v2:
- TOOLCHAIN:riscv64 now explicitly falls back to "gcc" instead of ""
  when rust is not in KERNEL_FEATURES, avoiding an empty TOOLCHAIN value.

This series adds LLVM/Clang toolchain support for kernel builds, defaulting to GCC 
but enabling Clang automatically for riscv64 when Rust is enabled.

-Convert existing GCC tool definitions (KERNEL_CC, KERNEL_LD, KERNEL_AR, etc.) 
 to use the :toolchain-gcc override, so they only apply when TOOLCHAIN = "gcc"
 the existing default behavior is preserved as a no-op.
-Introduce parallel :toolchain-clang definitions using clang, ld.lld, llvm-ar, llvm-objcopy, 
 and llvm-strip, making it possible to build the kernel with the LLVM/Clang toolchain.
-Automatically select the Clang toolchain for riscv64 kernel builds when Rust support is enabled,
 since upstream kernel Rust support on riscv64 requires LLVM/clang (per https://docs.kernel.org/rust/arch-support.html).
 GCC remains the default everywhere else, including riscv64 without Rust.
-Add lld-native to DEPENDS, since the lld linker is required when building the kernel with Clang.
-Fix a config-check failure under Clang: do_kernel_configcheck was erroring out with 
 kconfiglib.KconfigError: ... Sorry, this assembler is not supported (from scripts/Kconfig.include). 
 Resolved by setting CLANG_FLAGS = "-fintegrated-as" whenever TOOLCHAIN contains "clang" 
 this flag is picked up by the kernel build system during config checks so the assembler test passes.

Harish Sadineni (4):
  kernel-arch: Add clang toolchain support
  kernel-yocto-rust: use clang toolchain for riscv64 when Rust is
    enabled
  kernel-yocto-rust: Add lld-native to DEPENDS
  kernel-yocto: Set CLANG_FLAGS for kernel config checks when using
    clang

 meta/classes-recipe/kernel-arch.bbclass       | 23 +++++++++++++++----
 meta/classes-recipe/kernel-yocto-rust.bbclass |  3 +++
 meta/classes-recipe/kernel-yocto.bbclass      |  3 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  4 ++++
 4 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.49.0


