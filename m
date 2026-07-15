Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF06C4450B
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 06:00:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.624.1784095244850007215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 23:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Uvu8dZTl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=165692db3c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4c7at3577439
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Z3tScUrrw
	5m6aXdsZ5zdevVqNnAanfw4g4K+VPOx8Bc=; b=Uvu8dZTlo94rrBXei0L9CsvAC
	SVyLj3Qf6JBGVfdjAO7UX4bYTpyROWIyC5mrqwFX+ssTV9kwBWgM4xta4/8TpjTA
	/cxt8ZoIPAMmBAG0b6OOpgntbvMag3/VqxdQhkI14Y4SdTZDHe+AjE07EMPN4B3Z
	GoF8bvVLGlJnLqV94TdSXkIiBLKmHBPUChw1qotAfNpYZWHEFOsyak98mgQ8jPaQ
	4IRuxU6a7osIKLM+rH8sLXty6VviVBNELDTEurocR7m1l8JhYi22h3VXKvsmnACA
	cIbHcWUesLcEagmujIEvFXfKKloczcPxyabnfHtIUG3cHEP7eCDlRFCz6aluQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbnbdn9y9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rz0eGq5xAukgL+6hCvi6xyQIj5LpmPvwyg4PoVoezufThQTO1Vw+odkrMHOg46N8sW7choILFzhSE+G0GBoVeY9AA9bRkk4I2PJQtJfh0PfNkpZbAZdojR57pzaqwfcPGdAN2El/297VtCpZwAlzPxe71kVoEWtuHXMs21dv9JN0SbgYIcx/sgWwHvu2mS7FN+4+uu7/Me5R68eheRLiSfS2ftnreWFLk+7eSFZRK15sqc4eVGHgR/8Gr4QIVtYX6hTxo9rQwnY2WQQV09oZbuLmHKA3TTUwQHswQoUEhbyVozOAHt/6yFbBt0xTIkBtIuhhjg5pmqvMjbYrHWWdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3tScUrrw5m6aXdsZ5zdevVqNnAanfw4g4K+VPOx8Bc=;
 b=tpMqRZ3VR/OrvcXc5ieP3Aw/7THu6SLjem8TYZN01XC6diOUeQ1gUPzhAV5myPxWd+bRzUj64/Qvggp/E2LdHw6bNB62Gj5EkDU74lxAhDRYsoUKFvEfkpPLG3Ysa8Uo+/JEI+Lpjfu4D9L07lTZJ54Wlc4/LQ82MaGGyH5E22CQHbinUy3GgZt3cS7l29lvpK0J9c8g2QAAstc9zVFLnf6jxBx+S1rXOHfzdhWk4QRXU929KpykVv5VeBUXnPRg1gwfamuk4L5MLLBi6cEWL/sXPKaQjd0OEDXMowj/4wp0qc4p7ekCAhJBXtLLtJbhEpy0paq/35b5mR5qd7Tpvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 06:00:40 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 06:00:39 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 0/3 v6] Oe-selftest for Clang, LLVM, LLD
Date: Tue, 14 Jul 2026 23:00:18 -0700
Message-ID: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 847eb6d9-2ace-4f43-9e72-08dee236657c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|18002099003|38350700014|6133799003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4ZMJ/xH29kAcIxbPoz622ZJ8oR1ccpQP6Vhi+gbElj5fFux64L/fTjdhz4asM8pmzfykcA2zM2lJE5yHEA7Jsfn5dyPP5MUu5bW+0vf8e76gxbIP0zPmAytg9G3pXp6IYbLdpeg38X1TRRv1tYnA4A5vFxVt4KsHCdEXKzvXoorqy28M/uaaUcAxgmwp2FgVqOMDFFYPj3MdKFhZnUjLIbedtCwYlmYnLZvbOPMSxnDfAtVJZTy4TiFdn4bDzOu6Q4W6//r2FJJ49nHdA+yT0PO9OzXKOmqyYZijBu8+YkVTi4nu4XcTEX5gqO3KRemjQC/L1aZX/sGXb5N/V5ggX9AQ7kqCpwzAm+BuFr68i7jnjYqqMmS4Wvd8gxiQimhP36GLEuFzgV1hIc5dTHbkLBLGAucV4cqGAPERePTmtLQolvvY0hDlQBz9h1gvh7B4rUFJd3SeBcJkbD/j0uuNxmVUb32PQGsyIha3hqph/gdGgWHgXuuOS1UTTscD5/wN7Js4rRoDw6HDgfmD7WIcg1odOHlmUr1ogf9P9At5yZ7HVQfttytiUznbinHxKfa9bDhfh902akyCBEm2TJLQGt5RFi8BkeGbHDD/PSGQGvORKOt5rDC3NxuEF+5DdaLZh9UcL5lPGcWdhXQKTxBn1cHE59rLlXIZ8pBoxrGuW375RkgzdJDKZfNIAOGGtUay25fRyHXZJ2UGvECgxaZ7sNM57mFMLeJzaNNbWIfdwQs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(18002099003)(38350700014)(6133799003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1FfoDg9Q7RC4zwfO690He5x/t9swTrGYWT7KnBNAcA3eVAdS8QAcONoNlBN0?=
 =?us-ascii?Q?1OlG41UZACyYpLOqzvKliesgVgmQyDYCoBvPKb+JmkSLSx19JPtenyWpxfMm?=
 =?us-ascii?Q?Qizill0iJ7dwOHVuQ2bqjim1zO5MdTmsnzhji3bzyrL0i62Cfq+bTapszTA/?=
 =?us-ascii?Q?34ToZNRI+zuVblxZaPZmbF1qzsJjjN7Rzik/OsobBxGE324rzsSRRgAmz0go?=
 =?us-ascii?Q?TTaK4VP1PHTl8Ru/GHH/juPRa5Uj2jk9huWaPxB6m1zOt2AaPqbRYtZkb/W9?=
 =?us-ascii?Q?pyDe1UpeDA2wFC6kJ5tppmKN+oG0A6IvOJSNYe/mKU2z0Ln/tfn8Sbb0ddye?=
 =?us-ascii?Q?dK1lsfTAhJTRfQHOB5Hki5WHwogmpdM5yzBzkHU4lG/RBzem2TjTZQ4XirKA?=
 =?us-ascii?Q?M7NNNJN/FouEpuvzcdIKWOIe6K70BFoZegTPi38WUUAjNWvEbl925h4sBIFk?=
 =?us-ascii?Q?KoAP0CMmo23d+P0hnPeQB8PV63lLGXkR4E4kBTmJ91kY0aksAx1F+WhLJgsE?=
 =?us-ascii?Q?xS7NemiNXB0P2W6qN0pxHPDo1v8/N/fypUepPfbiW6gYv6gbkwVzSHoJdNnd?=
 =?us-ascii?Q?UujuvVLTkLxc8ytEXn4Bv0rxebIY/bVRd6pJsHhsn+kwk2Clw4TVELJa7lh6?=
 =?us-ascii?Q?kj7IYtYhVqPTN7Z4qRlRzSrOLF3fFhFZL+qfrCDDXeGOD6ekex4BDz20KC64?=
 =?us-ascii?Q?oVFJY3QI80PfYOug90oOu8TQRXKn+64NyyAM0NZL1H/4Pn4S8eaB2xy+Z4Rd?=
 =?us-ascii?Q?Q7VdUbk9aodhMQEUDuHFwsOjcNMJ/w/bLQKyhkLCOTsgA8VabJ0aLNrk/N4n?=
 =?us-ascii?Q?8cHmnijiwa5kReyNbBXh4LKXm2ugBfJIDTX/35aDMJf8jlxKn1G4lqqYz1Bj?=
 =?us-ascii?Q?qeLeVvWLbuJnAapcQ8n0NUh9e46eOZQ1aSvPk/uu+HZMOqpTxlwzRT3EXB5B?=
 =?us-ascii?Q?ie+ZlNo+fshDA513Nm4x+dtKhvcq5Cp/9py4pquYOOMGkhQ4nLinTpHJSo/Q?=
 =?us-ascii?Q?Cqpc9B0iXPfrxd/d1s7B8GZCvEZPGBQXeRQ3/zJ/9qV6V7edofbVxcIgKCq7?=
 =?us-ascii?Q?9kC46yFWrn6/1+0bOd8F69WJeINdxQiidrCY5CXLxU6JoV+7Dw20HQq1mxyx?=
 =?us-ascii?Q?zBrlf+0cWyQtD9WcMVvxsB6PI+ESt3+xMBR52dpbf40wKQ3Ys25bPm/NTEBr?=
 =?us-ascii?Q?/IkjDRF7545Wp2ys5KGNE64/P0wu3bT+P/HjRd2hlJx5I331CF3vPOmp/VqM?=
 =?us-ascii?Q?+NVZpAwBah3YYMCP4Z4+h+6V8DLykAdLar/lbHbeyeOGL7VyB+pH/5O327yu?=
 =?us-ascii?Q?LdRgKL/QuvOIqQoROgGq/H38tM6gKwSuaTkzqQGHVWuWr15ygiWXl07R69JR?=
 =?us-ascii?Q?bxXr1xxxu6SR1UPkI4Cfcxsh9x2o4tleHkT1otyhhp33PHHy0GhGoJeqbjQV?=
 =?us-ascii?Q?OOK13P+EsNikzC7VvQAvIr0dzcfauoeb7OP4brsFJa9rprUH14LBWGD49dld?=
 =?us-ascii?Q?t/zHqbkQ9jBFApQeE7vnRsblelaGY8ZsXcUYSvodlP5sMS4RH8bpzTV82E9l?=
 =?us-ascii?Q?1qH8CcQUNt72aIejPHzd0g/BAr7+z2WFvYejN/pAr5UAKIUj3H489Mk6A8Pz?=
 =?us-ascii?Q?rSVifJBL1OPO+Mr8LNvy6JwVkz3Zkqk/EEuCGWf62BKIJBJwsqg2wkbqGXAe?=
 =?us-ascii?Q?JWEVgLV+Ea+AjgDfJ7XipI/rjjOnG4tO15ihW49SGBENiyRszCb9tKcJyTzB?=
 =?us-ascii?Q?c401RZBqMSlkQuzh4J5Gkol1jShL4wjrzqg2D+K8bvfXc5w/nMAq?=
X-Exchange-RoutingPolicyChecked: 
	QGERCbrGZQ52aGb+k7BZPTWql67L53xtxNGmMeb0Cg2Zq8ogPmGSvJiS+FNk5hOqeBVlZ8vpZlW66zEQFtYb0DnqzCHLh5tmjNHNtthAQZaMPWdB1T+TRrlvmU/bKKH27UzWgE3lYLsgTtD126ZHvas4J6GnFJfuOWfU/XBwhw8HL+stDUmVt5ECM8m7vaMff3aHIn5ueJYE1jeoTxaJZxgjpFaQc4uXiIN5gPtKyxpmNbAnrAMkbqQXSk1hBK4hCNa7rAGWvjWGroGQXb3diYmkhZ+uEj073/xZP4CpCbxj+JrnAOFO8GlrUr+D4YeO8FEZ3RjHYAwfidBtF+iSkQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847eb6d9-2ace-4f43-9e72-08dee236657c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:00:39.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0boUTsts88THJaJU+n4MLiMgUs1E6fQNWAWT+7rNccpfanUiDRam+KWCBZaORwKMnJCfZUh0y6xGNC0mlnmkOYyf0gfSsH/GvtXeSLvEyeA5W4cZ24kJhi4r6M30TDv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX83EM/8AM7uj7
 3iVm6pJ4zFNoACP+FSZvEsJdypanio551VMIUm9yTDV7QojYsjK5UmqyVXetglFuXNCN6O/jASz
 6ighGwQ9qPYHotzE709MdzrqYXy3mqPUvWqKwlMSocUaJDIfG+DFJU+9HVfC+CVuG9xuPpqUWKP
 c91bpICZR9hbeX9Q5lz+J1Kbr2Ax4CB91PHSifVekn8/8Eso4UQfkLNGE8M6hsHAHglW2SdDRBv
 qpQ5dQ8bZsy4iy93O0Ef2I/K0AZ9OSiVtSFdExPIMWbm0BUDXqfHu/y6zJ7290ily4vu8miirE2
 OH2KYuIdbApMjanB36Au/y7HvB/afCy7dKu9Y5sqwObm0EyRXej6T+ki4kHbadU9GQ/ye+8CGjy
 6X0wjvsd27BruEy1CQwa4jjPt0LzC5Pc01NRRJzAqXubGmt3qP1zNACJ3rDt3oM2hVpi9xQyFHG
 MaJ4hnxuG4k+/RVR05A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX//Hn2w46Pq/5
 2mFkixdzgmMZBb68p+TF0ryss6z+EG2bUl3ElMR3xePv9NoMLFxCIehIYtDav+G+4c9oKxxOHv0
 QaZTA2xPI6payVn8F3s/PR0FBAvFLVmkTlRIzudjbqAwaM1LDbgi
X-Authority-Analysis: v=2.4 cv=VI/tWdPX c=1 sm=1 tr=0 ts=6a57220b cx=c_pps
 a=cj6+QZNyov9unU3rCXIAQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=UkVybHAxW8VqRsf2u68A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2W4DjpF6brACXhyaLCZNBCCiwoGctBGN
X-Proofpoint-GUID: 2W4DjpF6brACXhyaLCZNBCCiwoGctBGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 06:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240938

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

v6 changes:
- Removed the workaround for the llvm-confid to fix Rust build failure
  as it is no longer required.
  https://git.openembedded.org/openembedded-core/commit/?id=8aace29b692a8f3902a675fb4c022c223ba49531
- Removed CLANG_ENABLE_TESTSUITE = "1" from the meta-selftest layer,
  as it caused the check-layer script to fail. Test suite enabling is
  now handled directly within the test suite script.
- x86-32 bit testing for llvm-module is no longer broken.

v5 changes:
- Fix intermittent failure seen for arm64.

v4 changes:
- Fix intermittent failures.

v3 changes:
- llvm_sysroot_preprocess_testsuite function needs be added to
  llvm:class-target not llvm:class-nativesdk.

v2 changes:
- Enable required CMake flags only when running the testsuite.
- Ensure default build time and package sizes remain unaffected.

Summary of changes:
-Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
          detect the llvm-bcanalyzer target.
-Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
          when CLANG_ENABLE_TESTSUITE is set to "1".
-Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list

Testing:
1. The test suite has been successfully validated on x86-64, x86, arm64,
   riscv64 and arm32 for all Clang, LLD & LLVM components.
2. Clang, LLVM & LLD all together ~80K tests are there and we currently
   ~250 tests to exclude list which are failing (0.32%).

Impact on build time:
These builds were executed in a controlled environment without poky-sstate
enabled.

Default(without changes):
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
|   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
|   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
+-----------+------------+------------+------------+----------------+

With the testsuite changes applied:
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
|   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
|   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
+-----------+------------+------------+------------+----------------+

Comparison:
The additional overhead is minimal and primarily due to enabling
test-related build configurations.
+-----------+-------------+------------------+------------------+
|  Target   | Default Avg | With Changes Avg |     **Diff**     |
| --------- | ----------- | ---------------- | ---------------- |
|   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
|   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
|   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
+-----------+-------------+------------------+------------------+

Impact on package size and Fix:
The testsuite changes has a negative impact on certain package sizes,
as below:
+---------------------+----------+----------+-----------+------------+
| Package             | Old (MB) | New (MB) | Diff (MB) | Change (%) |
+=====================+==========+==========+===========+============+
| clang/clang-dbg     |    44.99 |    59.79 |    +14.81 |    +32.92% |
| clang/clang-dev     |    30.22 |    30.22 |     -0.00 |     -0.00% |
| clang/clang-tools   |     5.05 |    29.58 |    +24.53 |   +485.87% |
| llvm/llvm-bin       |    16.40 |    71.77 |    +55.36 |   +337.50% |
| llvm/llvm-dbg       |   386.79 |   646.12 |   +259.33 |    +67.05% |
| llvm/llvm-dev       |    32.67 |    33.67 |     +1.00 |     +3.05% |
| llvm/llvm-src       |   387.54 |   389.44 |     +1.90 |     +0.49% |
| llvm/llvm-staticdev |   609.68 |   616.80 |     +7.12 |     +1.17% |
+---------------------+----------+----------+-----------+------------+

FIX:
All testsuite-related changes are now gated by the CLANG_ENABLE_TESTSUITE
variable (default "0"), ensuring:
- Test-specific CMake flags are applied only during test execution.
- Standard builds remain fully unaffected in both build time and package size.

Deepesh Varatharajan (3):
  clang-tools-extra: disable tests
  clang: Enable cmake flags for llvm, clang, lld tests
  oeqa/selftest/clang: Add oe-selftests for Clang/LLVM/LLD test suites

 meta/lib/oeqa/selftest/cases/clang.py         | 330 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 ++++
 meta/recipes-devtools/clang/clang_git.bb      |   8 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   5 +
 meta/recipes-devtools/clang/llvm_git.bb       |  18 +-
 6 files changed, 435 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

-- 
2.49.0


