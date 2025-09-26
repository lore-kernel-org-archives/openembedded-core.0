Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAFACAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 10:24:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14078.1758882278096324981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 03:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EgqHp4jV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q5trvF1865960
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 03:24:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ajCCxgU1n
	YHSKIcbMTMLv4KhX29ZdCUPgkTMi742lho=; b=EgqHp4jVX3XT3ZSquEe9iUKNk
	7D0fwp+2JrLjs8ju1Q5qWzvMKlr/J01n6K6BoRUMjzz1TSuDMG0rVJqIJXJbwZnn
	IsZJ/wkopg79votQLejYspLzWJ0tnqZc51Uz7UGCU72dlTmAKkYZ85zmZlCaQ8k1
	AHFPz7Gyt+SaTxg+kc7hl4au8vgBnkH2CVo76ecXDYvw7vpcMSXpBtdvYg85x8Vf
	gApRVpxiKT6hceWzTm+y1Mqslb+DDVHyewotqYOd2I9sCXTS+z6pYY+hVqBx6Nve
	eVf7wO/WHpJg4z1SN+YkiUmN+92Noa4r/N39lR05bLwbyuvzM/Cm124zP9uXA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh0pbn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 03:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0EyFoA9kOa4BbgTs94Q1Pa46IdyOOakrlpkJ0aQkw5oPo04+Ze7WmLYk5FqjZywMoQgq/erMhZfACMOrM1Uii4rjG9Z6Aefv671N++px6tpqfNAAOL+4piJ2LXXfM2GkGWTlV2gQQYmvXPV6DEvDFThDTD57rE/oLFV3ymEIn8RxGUbk6wfuYSwgqRG+bKj+18mU712bbSvfAQ5nS0eG/AXkLMvjWeeTwRqZDP3YROS8Joes8AMCQRWb+1dUS6ghVmQirik2eUnEc3MriGKOiG4k3r0A9wWTWd1CpdiIhIKESQr7FitGHwPBm4cwOF+Yc06eGGggVODpZ+05eOrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajCCxgU1nYHSKIcbMTMLv4KhX29ZdCUPgkTMi742lho=;
 b=q59t9pusDVN9ecxx8qB3EDahQl8VNkrPUIJdwO2Arqc6QSo16qFy2et4Y/sUyw4LCjsu1EgUfaDRklnfBTOM1JkG7Hcs/9bJZXylnV4RCS3NtFiyM0YjSElKqUALbDEdZnDhHxoHu/96/b3smG1YAsN4X+QXI6lRke0mpfhzIwYu2D4j45ihO+6i5wMz4Ng6XViBIEbGOTNbnRGQVbzzzhod6yXC/A4FgK7FP+9ifa+/ov20RNxFgFwHXMgqZsIlcFcRTiel44AMX4goGODK66MPxHuulNDRkaM7Svp9K4LzDaF1QvBuo1tKvyaPHmWknfUzjG/fO0qmm74a+1tWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 10:24:34 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:24:34 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 1/2] rust: Use clang instead of rust-llvm
Date: Fri, 26 Sep 2025 03:24:06 -0700
Message-ID: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 87db0f79-4fb1-4629-5447-08ddfce6e343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kms0RBV0bkl1TYO73YbpenZfDqU0oizTCtCqjF8ut6W8jS5ueqKhywhjhxyz?=
 =?us-ascii?Q?2Skd6oKw6qQLx6iAiGySBjVOU+faFGwT61bBDYBm54FCkrXMAkbXTt53dM1k?=
 =?us-ascii?Q?QkQUQe0kri+gCpVBgf97fw0bZxm+EXm0Fwx4w+sYucHpqT62cW3ox+NasNec?=
 =?us-ascii?Q?r73rsOiUZhzZinJVpF3DuD5+ij4Sd/GmFPYMVXS5rsEo0WF6Nr1Op9gfH5N5?=
 =?us-ascii?Q?iZpIZF0hQTZWM5hPWHWBs8mpHg0lFapoge2g4Q99ORzuINz7ZoIzcMBiQlVg?=
 =?us-ascii?Q?YNF6ic+1e0Trn51/4xbPqECPEGQC7n8mF+dLP/XvtFsGCZNRykS5UOUWYO5u?=
 =?us-ascii?Q?oxowLBuFYhSEa++oYYsaCjBxcJDqIfmtiRQh90mtd/mQ9LFAi189+g4RecQj?=
 =?us-ascii?Q?rwQ1+UZOL1Uj0sfgaGFk8Rv1zaQN4MTxKZH/XwqO49ITdc1AlLxsWskFd/pK?=
 =?us-ascii?Q?lCauTP0zSNcRRI46QMdJQQ1SJPWgwR5KocmD39Y85BBAIxf/T2cAEFIPXlJH?=
 =?us-ascii?Q?h1UwnCtpNxgfg9Imi7NmSuOgJoU7FHHnqnU7gqSEqnmMN5HoX/KvzYnJPuJp?=
 =?us-ascii?Q?r1xLI+ysIOzGbX1dqOq6QBFrwK5Xf/0n2LAWlOII/dZ1W1VkKuqPtIhA2KOl?=
 =?us-ascii?Q?6+PeJy4GEYL9WfI8g9EY1HJxJfFrne3OqNrmy+qXT465pU+RrCar1AsORCPZ?=
 =?us-ascii?Q?Qa7RYoUT5nqHbYpNcOXigBWPNQu5eltLKdltxGJE+VA4TqkICnnPg2Z1H/1E?=
 =?us-ascii?Q?qjYWcYAfu+4n3IRnSEw8uCHFWmbrLGD0JgSYiJwRs1ljCSXMc26FXOJE3sxj?=
 =?us-ascii?Q?0wPoOElK4lsANFw6+n2MzqrxJKEP1vDXoyMaN+iPzqYK8fRU81/Bylx5TcE3?=
 =?us-ascii?Q?kuQhsSGGkWHJ07+FakrbaFLhyEg7n08SXTxOv3diVd+v1Ec9vvt/vERRB+jv?=
 =?us-ascii?Q?bDTNbDgfIsAPtxlck5jM4DThGMGDIQB67EgbqTlPwwUl7H3So2gRu2IV5s/O?=
 =?us-ascii?Q?NRIVZ8oqP/I46Uw/zSWK7ISPh6ALer05QTllAeGiCFcTMvsnSi96/JzhwdnI?=
 =?us-ascii?Q?QXebtQEUvKW1zDoVS/C40umQGlZ540wJfK6/oVWdOyYRAPohIwoMDBntBUA0?=
 =?us-ascii?Q?hifm9CuP5Z92hksecWYRCFb0xpef6O7ZYie1xfPgyCLcCnGX6BsO9qxySC8e?=
 =?us-ascii?Q?xoYTnluDnjEWwQX96d2opqfyn6MUoxMheRO5KfSj3VCBR9OUhiwwDpqwkP7A?=
 =?us-ascii?Q?lDfQFvriRohILvX6tnzID/Um0Bg+/5WnFdw6FY6FI1sLOJttoyGeAudRh1Gh?=
 =?us-ascii?Q?cmweYryOb3cureR/xXwr+phOMYQ/he9OjwNcPTuhavuIZ41oWpuk261LjPBl?=
 =?us-ascii?Q?HZ34KhU40ALcvk3kebRgAzMZ+DG3COxd0413Bp+jqw0jnZ4CT+/6f3mWMiwC?=
 =?us-ascii?Q?idWiRP+PdbE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vES9xDEwmV61sylXr3kiDm+lCmOVG8BHKYu0H84iu2+vviyXRaCiBn6IhvWT?=
 =?us-ascii?Q?agIUNg0gLSTribJk8GnA5ayTkneTsa+/0DRmkguiOl7XVtGnLj92VlMGbOjv?=
 =?us-ascii?Q?WqMh2Bzp9U9vVN3NDqMAGM68yp/oOV7+wv8HCYM09JUjv/1k5dvM8zyw0+tA?=
 =?us-ascii?Q?32lTG3XxSerS5OKrxptVdlvVsk/qpXNqkhcCUxzSKYW4RbbSFqRx2OIAZ0Yi?=
 =?us-ascii?Q?0WXqefDQAkwqlzexdWHdyglkjF2OMFqqHzcT8A7lVbuWaAqVElrsC+lMqdER?=
 =?us-ascii?Q?u1xdi5qWEOh4ZbjigYIYDxgdRdr60vTBY/Ckjk1ShEfb7jdMLAYjYrYVqCZz?=
 =?us-ascii?Q?YTPN1nL+3meWJfdmXbKNHm8+zrqTk91F/4/SXefaMV17InRPBIp1AdZHExVg?=
 =?us-ascii?Q?828Wm1QC/mQZh1GRvqz8m+hXP872yManxYqXHLMwecRBManXCJ4eseW52+CH?=
 =?us-ascii?Q?X+kro6KcAXWyD5eJeamuVFFPG2YC4OjAv0Etg/U7ekWyLmVVz0EWwIjZhC5J?=
 =?us-ascii?Q?+ecBEG0aPEFPrJ95iVGi8LCDmNMM+kf1cc+dIUoVVnMgUjgo/VTowJjoB956?=
 =?us-ascii?Q?fIItzftqDKJzu58O7JDVQOQUJoB/viyzpus53b+X9g9qCfl9xD7DAPysECnW?=
 =?us-ascii?Q?/OUN5l3iWNq1ahDhdtgd7u7wAnHt2k/79CR+8fPxW2MtADFzNuogDncOB5Xv?=
 =?us-ascii?Q?L3TQnQi1FbozCelK4kqHvADbc+YsQXlbpg4y/lKWnz4avSp6QjyjPXUJ9HL0?=
 =?us-ascii?Q?xxYsQE3pzmoaxef5I+O4Hix8GhWm7135YGM/Ge8SyL9uZCcj0EYPXLLnqz7Q?=
 =?us-ascii?Q?6pGswiSChhVGm72WvgUmUH9n24Y58I/ResFh84JevDTbRFDgGNJTV+3Ik/jY?=
 =?us-ascii?Q?HSuvcoUyILf1zMb+5XEjKIpyfPM9yO7tLZ8Wc2Ovbo9Nv0doHclC8PlAXTRm?=
 =?us-ascii?Q?rqxz2yQPbjA+PGktuT2dwkRuHPS7Eaqdrpl5Cx2dc1AVzMUN3lq0hllPzYll?=
 =?us-ascii?Q?8PcOQV8R/BvyyntqfhzFhBxHiFukBXNmD58hjNmbsLHPgJk/R7SEJ0IHsa5N?=
 =?us-ascii?Q?rJjwK5XQo7tmQ+Cf0a8RBlis2N64bLctr5ywH36J5Iy6898XYjysBTv4RYTJ?=
 =?us-ascii?Q?VEKwXkaRE7iN/RD/kv92W9BZxV7ZRVzjunkUohL4DA6LZEq6kqETW009DdPS?=
 =?us-ascii?Q?dq/tuNFiU2uoMVzwDAQPwbLbA7wYOkauqHTrvxRjWeTRLhmdy7Vx+Yknz1I6?=
 =?us-ascii?Q?Rd9cMUDdZG++L857r9LuKOi1t00uDYGFIUabY+RtbnyNhBopKB9ZWfwB8K0U?=
 =?us-ascii?Q?xAWtBgapZ78OQ02uV4vaQ+NOlYFPyB7ibcvRioGFtA3d+2VSPBzGmBFApXdh?=
 =?us-ascii?Q?Iyrq3c+O4G4e6Cr7jizWknbOgKlQ5dKEh3Oj3gnpDsJo6OqbvUwswfvGmweF?=
 =?us-ascii?Q?BVeAcYoUvtuObch7oj0wRb94d2mqQKrxBpBwDbV2ZDnn/QsIMCyqhfJcHF8u?=
 =?us-ascii?Q?Nth6GGUbfsiF35izSZN6k56o7gw8svPXLkrZxXYmO+wuzbAQuCDBP3OBgw9C?=
 =?us-ascii?Q?hO7haQQCLvB34ukvOnBxPwYQPNqXWK9/W6XTlvq8HmGrWZha5qahSPdEXhM0?=
 =?us-ascii?Q?FsEnO/WKRqAHnlDtUhKvP0Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87db0f79-4fb1-4629-5447-08ddfce6e343
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:24:34.2972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdfEQ643MzQvtpz9ooBB5Ah1vwUehtDjbw+X8trhQEITTuv7Ffk/G1ZtXhovTX1QnTi9pbSwpWMOxRfMxaliQCiG80ZQQLWn0+3rtQ0cdwfPPIL733FeFVtIzfH7C4Yy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
X-Authority-Analysis: v=2.4 cv=ebUwvrEH c=1 sm=1 tr=0 ts=68d669e5 cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ckCNTkt6AjYl-fCN-5sA:9 a=Hqou25T6mLgA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jHG8fxgkctUBFIEVce55YX9B9ydkx73e
X-Proofpoint-GUID: jHG8fxgkctUBFIEVce55YX9B9ydkx73e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA5NSBTYWx0ZWRfX3pnSUkvUK6G5
 VOokwXlhwXPDXd6AqEqmPT0gN7P1NCF9BbZxQgxkjHrSg4jnUuvaI9sjSmAZ6RTaQWsKIH1Wgre
 8ceGhPayPYIAOEvhE7nTxxlHp3zYJaGpW5bGi+hpv2aXKrOthReM/y0QoT87JqMTZEVsvDZLuhw
 xilx6GzUTyDmI0P87BK+jS63eamnu5/zYNfot8S0iOWgF9fpHEVxDJk1uIeWXHrYT2DVMsTOTTU
 5zHRCEfdBO2Jc1c8r3kvnNeBvr2nIKwY3N9HHXLu3y0FkgJfDUtj7/Xg5HbatnoxrGw4RDAW+NG
 CDFekiMkVWvoVNHfIuyhZGQQaUXyzlVyVkNxH129eT49O7OuZDSeZf+mvTOVa3KBrf1iuqEN/gv
 sQWo0Vu3X0H2vQhFtTwbR1Ml65TCXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224075

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Updated the Rust build to depend on Clang instead.

*Summary of discussion with the rust upstream about using latest LLVM instead of Rust maintained LLVM fork.
https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489

*Upstream LLVM is generally compatible:
- Rust does support building with upstream (vanilla) LLVM, especially the latest
major release and the one or two preceding ones.
https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm

*Impact on Yocto Rust upgrades:
- Rust upgrades shall always check for updates on rust forked llvm and backport
the relevant patches to clang's llvm.

*Regarding the rust forked llvm local patches:
- There are no local patches on rust forked llvm other than the backported fixes
from llvm master.

*We now add these flags "-Clink-arg=-lz -Clink-arg=-lzstd" because of this following
diff otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=OFF \
-DLLVM_ENABLE_ZSTD=OFF \
-DLLVM_ENABLE_FFI=OFF \

Setup in clang
-DLLVM_ENABLE_FFI=ON \
-DLLVM_ENABLE_ZSTD=ON \

*When multilibs enabled:

llvm-config expects static libraries to be located in the lib directory rather than
lib64. However, since LLVM is built as a non-multilib component, the lib directory
doesn't contain any library files. To accommodate this without breaking multilib
behavior, we copy the required library files appropriately.

Previously, when we depended on rust-llvm, this worked because we specified:
-DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust

With this setup, llvm-config was installed inside ${libdir}/llvm-rust, which included
its own bin and lib directories. Thus, llvm-config located in bin would correctly find
the libraries in the adjacent lib directory.

Even when multilib was enabled or not, llvm-config would still look for libraries under
lib in this structure, so everything functioned as expected.

*Changes needs to be done when llvm splits from clang:
In rust recipe:
Update the dependency from:
DEPENDS += "ninja-native clang" to DEPENDS += "ninja-native llvm"

In llvm recipe:
Apply the same changes that were made in the Clang recipe, as those
configurations have now been moved to the LLVM recipe after the split.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb     |  4 ++--
 meta/recipes-devtools/clang/common-clang.inc |  6 +++---
 meta/recipes-devtools/rust/rust_1.90.0.bb    | 18 ++++++++++++++----
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 53bca1c24f..3e117b308b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH = "${S}/llvm"
 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
 LLVM_TARGETS_GPU ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
 LLVM_TARGETS_TO_BUILD ?= "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
-LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};BPF;${LLVM_TARGETS_GPU}"
 
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
 
@@ -107,6 +106,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_ENABLE_PIC=ON \
                   -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
                   -DLLVM_BINDINGS_LIST='' \
+		  -DLLVM_INSTALL_UTILS=ON \
                   -DLLVM_ENABLE_FFI=ON \
                   -DLLVM_ENABLE_ZSTD=ON \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
@@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                   -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
-                  -DLLVM_TARGET_ARCH=${HOST_ARCH} \
+                  -DLLVM_TARGET_ARCH=${@get_clang_target_arch(bb, d)} \
                   -DLLVM_DEFAULT_TARGET_TRIPLE=${TARGET_SYS}${HF} \
                   -DLLVM_HOST_TRIPLE=${TARGET_SYS}${HF} \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index bf3a63914a..c22e3c1b19 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
     elif re.match('aarch64$', a):                      return 'AArch64'
     elif re.match('aarch64_be$', a):                   return 'AArch64'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match('riscv32$', a):                      return 'RISCV'
-    elif re.match('riscv64$', a):                      return 'RISCV'
+    elif re.match('riscv32$', a):                      return 'riscv32'
+    elif re.match('riscv64$', a):                      return 'riscv64'
     elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    elif re.match('loongarch64$', a):                  return 'LoongArch'
+    elif re.match('loongarch64$', a):                  return 'loongarch64'
     else:
         bb.fatal("Unhandled architecture %s" % arch_val)
         return ""
diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 5d804c7398..c2cb8f8829 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 inherit rust
 inherit cargo_common
 
-DEPENDS += "rust-llvm"
+DEPENDS += "ninja-native clang"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = " cargo-native rust-native"
@@ -28,8 +28,8 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
 
 export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
 # own vendoring.
@@ -188,6 +188,16 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
 
+#llvm-config expecting static libraries in 'lib' instead of 'lib64'.
+#Since LLVM is built as a non-multilib component, the 'lib' directory 
+#doesn't have any library files when multilibs enabled. So, copying 
+#library files without impacting multilib behavior.
+do_compile:append:class-target() {
+if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
+    cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a ${STAGING_DIR_TARGET}/usr/lib/.
+fi
+}
+
 rust_runx () {
     echo "COMPILE ${PN}" "$@"
 
@@ -199,7 +209,7 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
 
-    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
+    export RUSTFLAGS="${RUST_DEBUG_REMAP} -Clink-arg=-lz -Clink-arg=-lzstd"
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-- 
2.49.0


