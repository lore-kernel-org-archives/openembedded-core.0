Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F34106ACF9
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:59:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19252.1773417585947759246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PYDKLZTL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8sTTa418831
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 08:59:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=252Q3sxkG
	+/SadfVMIy/kBt9ekx7lpNhU+n6I2+9RXA=; b=PYDKLZTL8LC1GGCelUtTeb0EI
	WWOgQD9yK6tmjlejZYJ++oBdizbrzDylCGH/x6Eppmn7RgtXwDkyhOwxM2jzyNq4
	JEjk3u9QurznHul0rAXdKcRi2rlJCqGnUfedwihF17tQMXxPQHwhjAy3rxHScqxE
	gI5jMXgrRyl+UOYKRqCvd2kxeU8VyJMKq2MMnOZs19/pPf4WW5LgqJCrRVwXxJzW
	Z4UCio0+1TYRA903Rl0pEPPtdKPYr+gDoFP87gI1HWVZK7haWazYSY5jTwfyxZIn
	/F0FxTHi4FwzX6649AtBVTW24kxlSXlwqBg2QUFSofH7Ap5G4chFyDYlFAtXQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6taa9m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 08:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgQqHBR4dezTRdaCofvMHw3tI+nxgEjRbHEOLSyRw/CNAdBqvdbI8Jn8Fls1SRio/EjnNXN2nsZsqLItGxncI0AounL11fwOAJvCFf9aFgwMjBt7eXw/R9MCK4DEyYPppl/H4HV1LnW5OPVa82r9NrVRS+iLH/xYBd2b3yuWur5kjPVvS0D0Bel0Af5jUf2Hj/S5QTtIqUwLn9BXWC+krlWaQiSK5P1BX0Xv6uA7PqpP3AdwYXHLDCBvVtB3EQplGyeUnPxCROHJHLKibxi/4zFAarEIJ6jMN3NUwCMp2vegPDQrE30DyBcpTMnM4Jn0aK62VfZG0DTaipannU5bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=252Q3sxkG+/SadfVMIy/kBt9ekx7lpNhU+n6I2+9RXA=;
 b=V9P8hNTt2ue8LmlmKWdnohFZj2PZ9SqFOa0tjv3HK67UW3QnpCoXFCU+bS00FOkQeI0Io0wOLPx1ZN/JpeMyqG7u7Q+t7tG9/C4Nsbz4aGQNbcU5gza3ehA07pf0PbVhr1L1/ArPkr0p3C2HMXuMuaZ4ZXjYGXFCLD2A+Ao4oZVhVXF4V6MnLK9XF7bo2phJzn4pG1IvilDeaYXq+g/uKAIoLBB6Re5pM7fJZDVcwatZ8jGxQepXj0NMv725eXxWJVOCZm5ywoDg9CdAr1tppwtINOpI/o+lsdgKMCSyNUtK3VzWdHvFufPytQ6teupXIe1EdLqybIA9E5dQl5NjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:40 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 00/14]  Enable rust support for linux kernel
Date: Fri, 13 Mar 2026 08:59:06 -0700
Message-ID: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e956a6-bfae-425a-45d9-08de81198900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|56012099003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	MpmOQftr9p9DM9Z9VA//gFCNfUlgh1hqSZ6G8daIc0ZR0ha2fbnb877TWOhKyB8mClaagS2YOCHKWM3/+oagotjLjcRyxhaOJYuBYDGHzfjEpK1TlkM548pe5u1dFT6yA95P2AZ19nfWLLhd8yV2vzj0wzvPto40fJdYIcdadvZ/sXjimvhDfyBwnQMV0ecg2wToR0t4HwOjLDO5jU3GzAmsdahJn8zYsH9n5aXMe5SB3RXuUV1jEgTtaP+qnR2PfwtCQ4+4tqbjzm8Gub70wEUfz0NyarNXaEfTGEYvTjdX1VZzk7D3lIqiUqXSi9MNQMpFMiBcf/bmeb3RWDLThTfEqharoIB1pUBFWBr8k/riET53P4rlS1PU+Bm+g0ly3wXcXOJdoaBpOK8srLLSMJTU3aEArt8SUbvvaWBiUotCs4dnWdRAs3yYfWtwsbIhEOpujgw36aF67QqHP2ojdCFvjzFzvYBvwbSBesVgaVs6NWtWL0FHZarhnCo6G55CVtPL/t0mxCX8JEM3CVEE725On/JkC66TMt+me4fuiR5tt0ULuf35UpI3gvP6Wx60Z3AyEtpkpCmIbJ32na+SN5qSNoa/Ne4z0fnwQDDA2bX/FkQX7lGxS/oIzdWYSyxQrNnDB0hDI1Eqnzo4lV9mkBPwIU/xZSX0pim7i268JtsFvRuSd5/satCMp7sn+mIfVeu+MEYcjB1n3r89IheoMVPELsNbEWQ/KtDSCqa5T+zZsNdw7YjbMyIpr2zl7bWigSeoCPwA7+gbmwkePzwOM4TdcSV8cHtk2gVFL8QpGxQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(56012099003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hWD482+EkQ61JvjxI0/uUhtudLfRmrZ+COjgavnQCyPNcUHl8hW2rj/RWtAJ?=
 =?us-ascii?Q?XKYvF/9SjCI93nAdzhl75++HTsRquDVjDTVjHLQ0ELsbTopKaUBxbSvykBBg?=
 =?us-ascii?Q?jK8NW9eNiAs0uk3rd9S8mcB4MnQ7NMq84T+BAQLbW4L1ICo8tWihkOODCrQl?=
 =?us-ascii?Q?bO5+I50laWC8G+3n+/6NWBEalC4zJm4oV10AzFlbGErd0LOaXkyFAquWXYam?=
 =?us-ascii?Q?ydc4yyGye2Q2EfVzhx7hr93qrXTZOKW1pFCKLvTAJeJydxRWowvuopaEHHzI?=
 =?us-ascii?Q?tu+9x8btyN4imyzfvoLaQTvm3j6G+WoytSHKMvnxLFirIklOtjCpR6kvWReg?=
 =?us-ascii?Q?euy9BfsWmj7k7c+4RiMgYCfgaXWgyZHnF/uxm9tW1O9IzmVMrviwQ4dpjzU6?=
 =?us-ascii?Q?nUsNTfedG88LDToKUCtlFJMhe/OQWHap5IIqCd5vKEjByJC7kiILg/gOcQdZ?=
 =?us-ascii?Q?xfxNhzqh9Nm4Lhqxh9RKUSueQ68XfyxDqy/BE1zkNYDVOpzczg0Kg3HWE5B8?=
 =?us-ascii?Q?7u7ep1zJCLEeOdruGt3nEqgGCpzdPe/M9Y8p1+/kQV3DKsNlxg1jN4c2Mb3t?=
 =?us-ascii?Q?Z8yGx8aQIW3sEGg+i76ccaKZtEFPMPilqFbqZ3wjK6dv17iyFR36KbOPelp7?=
 =?us-ascii?Q?YN1PCj7JdAUkMRW3LEukbIX+ramQCEyJopMkRJ29jPC+bmskANhLNItVgY4x?=
 =?us-ascii?Q?SjbaIOghd2L5v5sUly9r74t5015jrLbBp/Jv3WJ+fLgDXzEm/cfpzEz0boih?=
 =?us-ascii?Q?5JB3FsJnMe5lmIJFLVfcuiWp8OyAIQ5jshSucCTovFGf000d8TJEvnYgaecq?=
 =?us-ascii?Q?yONswtLXO7Hdx7TDECdZ0LTOybudA1jcUZPz9myFMJWVL9wphGSsL5Pkgbqu?=
 =?us-ascii?Q?5TdiwM4RYKjcDIOTu5mTKe4yxIwkj6cmOHPfaCcibqxIyU/KR5CpPWfzC1G1?=
 =?us-ascii?Q?kS2hjaeFFPQ3Y8zC2ZeBiGjV8ORziof0aEAUkTRRQufQYU57GUSFjTFGrb6y?=
 =?us-ascii?Q?x3OLDLVltemKtKx/EVLRlkbGPymMn/sZgBhi0sKHnWXnNfte6PoZ+LhBWcqW?=
 =?us-ascii?Q?l63gX86St/r+f5Hr/5NkZbM/SoJoB5d8rzsMZCNAONjzS9kHj0E91yFBML8H?=
 =?us-ascii?Q?1Oq/tVGjkKb1CfhgvvJvLnKyo6lNC/8tb77nsqaecfRpx8MVWZHkT2MxC94O?=
 =?us-ascii?Q?mRMtRc31jnzVKteaK5OyWSa4jbCps5K3tlmiWc6+Z00wcES7V3SXnMtv8y5Q?=
 =?us-ascii?Q?IsDSRifFoKxYrfe95MdwgQ3Q4MPTgH5lKE79B+lyhX71vb8OtFTnpoUKqxUs?=
 =?us-ascii?Q?e94v8fIewqVkWuMEGYGEP8yU5Uvs0ZdaQRzs85SVA7mn3e6nNK0dKH2hfrX+?=
 =?us-ascii?Q?LxPmfkLCnbIMgYC8pcsudseXg+bakvX+oswmUd/H1ELFz38718wyMhwILCtD?=
 =?us-ascii?Q?Ovs8coPvzwkxMEdpkli//XxDikTjFSe4CYVrVNl/w5Kypcs4R6rBgMlDjWka?=
 =?us-ascii?Q?mrufXbvEFdQMa3mFI4Bm1dgwzwEo5SguOOW8VmfZ5BmgNUWy2DmTJwh5kd5D?=
 =?us-ascii?Q?rdR4T0qg/gc33LfzUeqGrsBhSh6kn7zMj9CN9Lbwwc3lTmkloInvhqf2ZS6h?=
 =?us-ascii?Q?YnXUXHhQs7dbJRed7aVT7oIaip93Ml8mct20tv7Kj1hwXAyaTxRiK3BeJvw7?=
 =?us-ascii?Q?ZQCovChJUjr91USpr9wxwBAQMo1BqY2Nb3lJSQi2Ll1YdZY3Z0+ESy0eGdeu?=
 =?us-ascii?Q?BGvirj7spwBJUHCPWQ9XbrTUatEXSsQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	q2ZUGElc7zaWfgYROjEZD/D2rIpqOd/qkWa9GRccC+dQlAsUK8M79afXoh2PbSTM2EelnVXgHmgBjYYZLU1mXq1D5p8G76n+F7r1fjYk7bJ69ToeCC8qc2H2z8+hpXPwZ7fw2qnNRJiCJFXuncqmXDUSMBndFDgZ1MeDpaNusoW4YAeU7Lr/f3WWKyZ50TknBhrUjWS7wx6mV0N5e7RJiskS96rJ+5vP3+mI7QrXAAwhNfVInFEcSQ2lpfdsu4OD8wKrPJFRKiVyaWCJcKz4IrCGEbZqIKlm+bqWGnFXqxVqf6WsyMPlxjT2WoLIY1cFuHib3LtrpEKkU83mUN9B5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e956a6-bfae-425a-45d9-08de81198900
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:40.7194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MQiI+51yB4JCBab8oobsxHb2h4KxQ6wIku2BdrX/sqyrBFU4rJyjoDRM8TLd2CylOqb4QtRjhyHUFMxghKigYNp5GaeM09+H7r+3YChyRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: mskrQco8RsumheTD5FSe8HlMdy_4_Pho
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b43471 cx=c_pps
 a=6Zlfg0iwFc/B+5Yb0ubQ1w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=WeFqfoNDRtzSbyxFUP4A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ej8Da351WBP8yOKW3koR2UXoZLl7Zo3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX4MeWiPx1oKtI
 4uIw9vWWhAYxy95ygAMKugD1KmyD4iTMoeqKrj9Zy1HFHkYPrIa6ODwmRdv8AZ+k5rL64NtjaJ5
 jE/7HwWKofo9wawExqPYVSuwmthEohbehIqYe8OS/Qa9zyJoq63MJBjCM6KoBEPLTWQpMcq0puM
 Lz0XZr5mpbVeittTuXdWuks1iw1u86LJIbjRVj928FdsXl81wpuanMHsekHpKzA+zxDj0Rym67i
 fjZkXS02Q3K+nyEWChlqLeXZgAUFBM7pAHL6ZRbcStjtMWKH7Km75m1HA5LZIG/qY0IfVDKiClC
 h3ZMMEPD5v7FzOKdzhSvKBlSKVPidUyq36z0L6cXx64tjO7EkZ7O3smBmgO2iDqxkYo6BO3Lf7K
 mu3kBmk66eCSuUjppSODBsBEvlWe0BTbcN+kZlS9JCYgHfBegxifNMi2D+UY8Fc++9ijFPtsa4R
 Gi8BhNi67ljyeZjGLfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233048

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v9:  
- Droped KERNEL_RUST_SUPPORT global variable. Rust support in the kernel is now enabled by adding "rust" to KERNEL_FEATURES.

v8:
- updated the code to use bb.utils.to_boolean() when checking KERNEL_RUST_SUPPORT.

v7:
- The rust support in kernel runtime selftest intermittently fails on autobuilder armhost/qemuarm64
  because qemu.run_serial(modprobe <module_name>) occasionally returns incorrect status even when the
  module loads successfully. Since the test already validates module loading via dmesg, Disabled
  status assertion check to avoid flakiness.
  Bug Report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189

v6:
- rust-kernel support is now can be managed with a dedicated KERNEL_RUST_SUPPORT variable instead
  of DISTRO_FEATURES. Kernel rust support changes are now moved to new classes kernel-yocto-rust.bbclass
  & module-rust.bbclass for ease of maintenance.
- Dropped patch "kernel.bbclass: Export artifacts needed for out-of-tree Rust compilation"
- Extended disabling of cache to make-mod-scripts as well.

v5:
- Regression in autobuilder with v4 series is due to applying v4 series together with following patch
  "llvm: enable LLVMgold.so build by adding binutils dependency"(https://lists.openembedded.org/g/openembedded-core/message/229387)
  is fixed by droping Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091).
- Updated patch "rust: install Rust library sources for 'make rustavailable' support" to install
  rust standard library sources for rust-native.

v4:
- Resolved patchtest failures.

v3:
- Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
- Extended support for on target rust kernel module developmet by installing Rust library sources and
  introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
- Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
  that uses the Rust bootstrap tool to install Rust library sources for rust-native.
- Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
- Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
  module recipes.
- Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
  nativesdk, as it has been merged into oe-core.

v2:
- Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files
 directory previously stored underrecipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample"
 by appending KERNEL_EXTRA_FEATURES:append = 'features/kernel-sample/kernel-rust-sample.scc'
 instead of adding this directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe and
related build infrastructure in the Yocto Project. The goal is to enable building
the Linux kernel with Rust components and provide support for building kernel module
which is written in rust and also provide support to build rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support
for out-of-tree kernel module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Add required dependencies ('clang-native', 'rust-native','bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 02: Install the Rust standard library source ('library/') for  native,target and sdk.
- Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 04: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 05: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
- Patch 07: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 08: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 09: Added oe-selftest case for the Linux Rust sample.
- patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 11: Add support for rust-out-of-tree module compilation
- patch 12: Added rust-out-of-tree-module recipe in meta-skeleton layer
- Patch 13: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
- patch 14: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (10):
  kernel-yocto: Map "rust" feature to kernel-rust.scc
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  kernel-yocto-rust: enable Rust kernel support via 'make
    rustavailable'.
  kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for
    kernel
  make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
  kernel: Disable ccache when kernel rust support is enabled
  kernel-devsrc: copying rust-kernel source to $kerneldir/build
  module-rust.bbclass: Prepare out-of-tree rust module compilation
  make-mod-scripts: fix for buildpath issues with rust-out-of-tree
    compilation

Yoann Congal (4):
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 17 ++++++++
 meta/classes-recipe/kernel-yocto-rust.bbclass | 25 +++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      |  5 +++
 meta/classes-recipe/kernel.bbclass            |  1 +
 meta/classes-recipe/module-rust.bbclass       | 18 ++++++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 41 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.94.0.bb     | 19 ++++++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 ++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 16 +++++++-
 10 files changed, 151 insertions(+), 2 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
 create mode 100644 meta/classes-recipe/kernel-yocto-rust.bbclass
 create mode 100644 meta/classes-recipe/module-rust.bbclass

-- 
2.49.0


