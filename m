Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACDBFCA161
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20756.1773078261668738911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bc5FIQjt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295GhrO2099754
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6TPABAdje5kjy5ONdTBXqpGzAlaV2xjYJ6Hn+tBLWwA=; b=
	Bc5FIQjtjlE9hvhZO9KGhROi1qj3DfJJXtyVwGGWUbrqPl43Bn+ADuaYKdMcmRSO
	dUIFZaB0cnAoohsmKt59ASVOG+5iTdlBRN2Dla+q7L8aC6zki/jCRRJ71hpcsVmu
	lhPdYBLh+LGKiJyIiBE7bA91zaKN0yYbkfmtmn1Ct/8GzITC1Ydp1Ds/8iZeuWxe
	4n3sJ3B8Hu8QRKyQe8kTEsflMnbXVMEq2ul7jmDTrygi9rK0ru5Iq/6XvU3aw90O
	BNxAUhlBQIqQ223lEdInLFbbB/1LMI+NGPYQrFKQX9xqHcQ/YDanEnNLKmIx7Lnp
	gs3fhYH1+G9DeDQmW4zEyA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97va9b9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HynuoPnGSrGG9hNifKh279MrVILVkzsm6atnOPo/D61q3ZGmTqKnZw0ROgKo/Kcs6Pe+VTaYQ9Q1FChfwqJTUQUpwSnIr3dMCgr43N3eu9AbcbBAJmyqctylJASXkEXV+OxiBtw7eZpdB9N2PTnOlSElu4DBDhEXyjOdhlzrF6ithsXUFL9rEmhsmDLLMy5eQ702CFPtjKQxP4LkOMF/qR0KInWHj0lDFk2C1Mxf5emUiltyUMkHjpY5IxtllpkFqCpI+GlW4U1sO69IeYV11QQ1qwth8NHlyiuRJs7BAAItTpAlTCztxwwUylAs9i0HSG8+IKecrXYosyxXO5QPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TPABAdje5kjy5ONdTBXqpGzAlaV2xjYJ6Hn+tBLWwA=;
 b=YVWEqgYpunN+EYvH4sVEArO18oSkxPqMsvIaevK2CkEEtgu6c2VVEU4Gmi8YnxKY/ZlDB0TE3VZ8nJZ7nI2htCUpPYuwY4AA2pW9wEjUnCDqK8m5V9/53Z9orYaoR5xau1QG/5Fej/3aKGeTycW0keP/7ngKS9BzB4LdSsQynu9NE0u+1idcNUWmHvmHioqeKuCxoHkXdNC01mrzBJjJC7wo+fjBfecXuaxqbwwLk461i/wlevCBT5DY/Dpo5ZY4orHMzfUc0r5oeF0ylmFTsWS0Y+IkJ5OlkrVtvvBVqFFrfYr4etXAoC4QS41O+jQ6DULjNzJ99GciKFsxj0yACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:17 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:17 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 04/14] linux-yocto: enable Rust support in kernel configuration
Date: Mon,  9 Mar 2026 10:43:36 -0700
Message-ID: <20260309174346.3384212-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f3c10f-64d1-4620-2e4c-08de7e037cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	vw9g7G0lF47Y/gau8yjpMiWTLQof2k0QI0o7vim5u8nFixRuKPyrY4v+8juEvv8yv8c9cZug8Nhmiva5z8X9OuLhrg4sVAAqJk+bWRw9HjDPKu42vUfhgthtZAZ/V5FJnhl+Zv361O6KpWiUUyFt3gXM/B38UUpIGD7w6FvUgO1gtm4HCSnqQBk10snt4HzQjluBlmjmLm5lwTbv4i8iFX4Pu82ic1PRlajKD3LHF6cFzh5DZRTBJC4somiJOND9jb9EVpuQQKNkb2EUyIbLNJ2wtjcKxomyYtptvxCJLN0TJCusC8qknVmbCx/FSEPJXLs7QOvySwScwwtTRgkLJ7IdONnlvKKAX1VSbiwRyD9QgSXXhTk/X3Ej18EYtIj2MkT0qQmlsbbfeSTrmUo/cAhmS9UNReGJINS59rwPr12f64NIri30fnzlwZsazeKb2PHryuVuviMmHUkSGwySAvjsOV1FERZombZ1K7vPSxTerXCShgX7s4hcYqlmfuWcbarzhW/IWjcNu4F7RS9HndmyuKSFpqlRB+Mj6HebzVnZ/c5eP7dH0ZaRtnFAgH3O0YRVDFcQr3Dp4ndEGpS3vnhIq2QhN52KLvLIyiHsF5Pgm3I/sNF0PL8wd3YolQcZlCMNYkQMxkT6F3h9WqKzOLVw061lhRky6N1u/eeWYErjeFKNVLYF4NoV3RPNtac+L295LUQVqKokn3rJ5BZ0I/7ylokyIRYuTEKdJ+AbXodjeQBF7AV9Ygz+wOqkMYmuptanD+cmHfMCR9itGYMcW9pm2NXKXXG1Uy55iHuaK9Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oEztrDcMLiPhZDSugvec08aP4qfqnfKBYmDEzhfoBBgLTRf85h2fQ4eMEFNa?=
 =?us-ascii?Q?B3qOGoxslj0gI6//5kbGhRSZICwdzjHTxUSwW+TcHv9WWqxllHra3foQEeAL?=
 =?us-ascii?Q?RqryOuPcI3ACWk3n+WqNtM8LpwJh7SU6DghrERYBje49HKyx3MziEtlH6zBx?=
 =?us-ascii?Q?5Qm886N1/1HiJlS54ukzgemKFfQjotvf3XGQgKiaBLOJZuDocGOyckZaO/gu?=
 =?us-ascii?Q?ME2OPwo3J/s30BXJy3ghuphi0GZ28E/rRs6nPLaw0/xEb3f3ZWVnYTt3rdOi?=
 =?us-ascii?Q?sbYHcZSw5i4NpYW6wIramc5VqZmmD+HY/PyKqEguwnTdDehd1pW1HJQkAHgh?=
 =?us-ascii?Q?W43c4bXvDlo+TcqcHQs5J0tdecgBSXXy0M7M6HdjDXWys5JhSS+7YibFyiY4?=
 =?us-ascii?Q?pxBsP93L57kvBnxTmBHQ/4lrZUSjJ46Dnn88ihedxj3gVNgwpd+WwP4z6Rqa?=
 =?us-ascii?Q?+UhUm+gY+MQDTKYfborZFQuuxgEeCQ7QnnYB0O8a8E6M6hmJRKB2zXF1QS+n?=
 =?us-ascii?Q?w5YqDKgsA1BWIJqz6B8lvC8AFUx8D9oENUhu790jQq3Cg5q9br737asgUebI?=
 =?us-ascii?Q?2NlN1k6wTgm6w694KYfsgdd8TbUdqxl/Ngo7TRWUfyWsTz7IpGfuOPskWCcY?=
 =?us-ascii?Q?FcoDSBVm4rLJ+h8ysO3IhK+jj9c7KJJm5RkFK9vKlvMk7vqw1/06UjhizoyN?=
 =?us-ascii?Q?qJapVbtZ7sDeOcfcbXjv6DiPmReSX5EaKHiRF+5NTf9RqUkxaSBk4FHYArdC?=
 =?us-ascii?Q?J/8sCCxX5ABULsARuRUFsgtreCziVbbNWEoLZnwdTq/Rjtacqhb0vNI43piE?=
 =?us-ascii?Q?kadbhOZVYLgdqAhKYbmZ9F/WFzNjJ0mgEJKSNR92u8tYObKsitzTf3A3XPY1?=
 =?us-ascii?Q?oAg/cJPCi4fNWNxCH05VeGXXLxOcG0r6/hPZAFl79QSjp00DzecEQDBIHgWW?=
 =?us-ascii?Q?f487fTR+i92/J2Un0DG7gKm+l7VtKTTaOJdAAW+4F8h4M/Gg1i0GnslLy/3z?=
 =?us-ascii?Q?iju1xsyRbifUNZJBKqILHo4/QHYe/rzKX+QIeluJoIww93DQ3plrf6keT5TL?=
 =?us-ascii?Q?sHNzdbvV7Nl5+qKQ3mv+0tVCUnG0vxhATqky1ymMGsYdiMVWNUT3MAd/QzlJ?=
 =?us-ascii?Q?gimAZHMg+jbKp0smADSeBR0ShfwVS9qBkxyeVcotmp40O6FDNEVnjHAOKsWx?=
 =?us-ascii?Q?C2WYxPue0EzzelqKuvblnlbZBtO/o0oXGlDd4aZCGVPTVTpCVd+aB1gl1Kxf?=
 =?us-ascii?Q?t6CGlyzAGa+cypc2w+LWAWogSBfyucMihC+50f0CdskXmlamUKO83YNZ+BF4?=
 =?us-ascii?Q?C1QUNXuMM3KI0KwyJBb33WRRChl7wpvk5MsT7pddDuQhWINtI/FjVXKesMnN?=
 =?us-ascii?Q?+t714fqNioo61SBpoI/SO4gW9n5jS1j4qCtGSmrTp2+Z3wco5PfS7WYmkE7R?=
 =?us-ascii?Q?KM3sPK2DjIGneeDVKMmCSBfR2CcoCIDIHRsi3XF7EvxvEff3v8SQ43YBbnve?=
 =?us-ascii?Q?M/9h+xSHn00JLe3ycp1YTqlVbMvx/px6tTDcxIWswHTVxAkHF3OqWTZeSkqR?=
 =?us-ascii?Q?9SlwhiEYUoGpFvWjArpXtOwNMqm92Uwtn+BlHeFuA2p5VigakxLJwhoufmM3?=
 =?us-ascii?Q?dnhVaJqHX+YBImfD+g/jI7W9JTX/Ov+m2J5pFBzkfVzDP6u8/MVcR8/w+tbD?=
 =?us-ascii?Q?V/BI/vMe/6ups1501u5N9mwiE0Pmh1vRgU1MTNvHmd3D1cJX/k8fU1YXiM7B?=
 =?us-ascii?Q?Iu8ZSmpuTWgPRc1jEQ92igdjnqsLnOY=3D?=
X-Exchange-RoutingPolicyChecked: 
	stsXgH6hTLanHh9zsj5kyWIB0H/EU7L7pVrJWaJQVq85saz/Gfjfn1aqfHh5HoO63YX+pP+jqrujq3TpoSS0rsTJqxs2lj4WMPEiXQnPSBPIC2g0dSoC9t+MyAEF2T91C43s/JwT+yKeNAbjmw3Tgv9sJSz8l4NQlcTbVRpUdnpKzg5N5fXEOiLMSmj3UA9wlg+E3f/qx0p2ra9MNjLF46FICR30Ffff5BlfB+fhqwptkN3ieDTXL6/+OYcDOj0qWBkv10oAjSL5drt9px5hM4jd5hIV3ieWNvPmltagPjKYfTK2kObXVf3IlPo2NpyElYL48erocCscNQ9QgU6sUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f3c10f-64d1-4620-2e4c-08de7e037cba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:17.7239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvCcahFmIS2DobEqZiTjGmji79D6sOFhF7ZJJFKWeNleUHfx10LOQsrqn5YDCd7Z2hwjh5r8qZAr0Yp6w1KyHvOPrWqurl+LIYGywCIsaVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 8rcx9uKv_gRuOjWqZXPpfsPXpJ9tDddk
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69af06f4 cx=c_pps
 a=EbvyHBp0GqBzY/XWR/wUiw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX1oCbQosU1YZd
 1ZEz80n1MtUV1EwrY0qzO/HxlBwUBr05ujrFgRh/Jtyvtaryp+bWeeaPvphlFoGzywrFrbZmSxJ
 6djp63u9Ki/S7VOP4XR066SU77lY8pbMqcvH4P6n+UvG6fGdEtOMz4kvtXZQDxcz746l6xDMYdw
 2cJhwX6VDauAaG/vQrxMqY7KH6wEWlH3FZRHRbRwDAqeZmhnLoi1yfaWKKGawe9O1iLTP3WxGYQ
 COHNR+F1j8SOU6p7xklMrqPORyUsf3hJK8AzjEHjdvuWJHEWiwiGAwZyzrtIlRSmEoeugcC+Thh
 oUIjuEl8ozaKmQtU5/nsB7tnVpOsyjMYkcqZ4P//7cpvQra/FF7roF9Xk1JZ0eg/wdUo01pszLQ
 4xohk+MDmtu8/ZMs28CmGjGdx34h3TC2pLZnXhPbG0HjktSe7uny0mrVvDg6LUFq3OJ3a2Wf7pU
 IIcQw3qHYk0sdvqj32A==
X-Proofpoint-GUID: 57lAWZQjGEOWTqxVqU2NJQ4_zSknA_U-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232740

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index f5ad28780e..12ea992e92 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@'features/kernel-rust/kernel-rust.scc' if bb.utils.to_boolean(d.getVar('KERNEL_RUST_SUPPORT')) else ''}"
-- 
2.49.0


