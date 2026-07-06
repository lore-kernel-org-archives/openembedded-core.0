Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0862C44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:29:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148039.1783337364479468546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VQyRYuEE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=164719aade=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666B1KF53047130
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 04:29:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NMHIzS7gc0x9lxPvPVqKRG8e6kKGLcmNRp7zd7hRDyk=; b=
	VQyRYuEEumVbSylNG+RR+8RjTwywVG0rj0eE0Y7JBYW+4al+etKm1qRssx0alAid
	g9/8wLDarbMHG9seIvmSGalYa+hma2/ffwoPO7ILRn883MnVFHQt6esntTwOhs8+
	feddXWoC7c3raF74lZtEBL9oA7cpA1X5x+V5TQxHDqY9n8kEDtEYcvPAMVIYgTlj
	RouONgj7t6t+TpfkQB63KLgj6FRaBlFmvn6VNngNYfwt6d5M0felhc7B46xmNKgz
	nCUkFUzogoMxdHkP79XZdFg5ef+Ors8cgMkIwk8JkWHRRjGSOGYrxuMKmEAGZXqq
	p+mdpm12lCasbcMGeLN4Kw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf19xqq-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/2cHabT0iWg60YMRbJvLw6Mv7qsiCSoB3OtqqsZyeSvXqreo8isCITIf2ciLMs1Fsrs50UlXwY7oz6E66qFazRDDEZkQ9sCpjp0YICqcKvEe7205Upt7x6n5Vl6UP98ZokVpb+n5NxBGMnfE2+9AUXFzPqHRfsAnPyees/8A+WluQ70xavztUCYL7R8kl1gUUjcse8JG9WyS6mflak7trBs6pCK1wFV+NS9nkJnwa4yHruVdxZO/rhXrF5XFpWgc0nvTpOAVg6EpoQ82HGHcS/x8StvSeQeoo0s5wqUqK6eH5Rwx5cb6Y67OGEAk6zsLpekznyiGRYzOtqQU4w2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMHIzS7gc0x9lxPvPVqKRG8e6kKGLcmNRp7zd7hRDyk=;
 b=jG96hv/7Ze2b4XNDjQNjOGvH3lSzl2NWzMkTLHpOJKRnUf6AvTflhjJlAwMe6dBc9S+Mwq5USmR6AP3cv2U6l6FwL/cO+gFe6FGov1/5lSKFVD1PHKaBTu/nNaLQP58xYkm36xnF/1ubh4lO2wqQ6LXL/UyevqbpM77ZOTl9w+MgVLSRRSGPf1FjR3lO3PLSCa7Cga63V3UaJyVahqdXZePAhsvQbkveiO4kWkVHnt+2YIjk9x+bCd2nLA6jmtsAdVKeWf21eCGv99nDuWpjvcpdrZMtFbX3eXCqWEBHvacNj0NIEtcKjl4LX4d3Jw/GnFNsZIO1C6WKqxdJN5U3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM3PPF67FA1A8F8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 11:29:22 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 11:29:22 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH 2/4] kernel-yocto-rust: use clang toolchain for riscv64 when Rust is enabled
Date: Mon,  6 Jul 2026 04:29:03 -0700
Message-ID: <20260706112905.41381-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
References: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: da7959d0-f8f0-4277-548a-08dedb51d360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0wmtYVDKSlFI7Bak6jzHpXfmpv/Ek36uC1N3AJmwy73SO0MlWnMnFs15mPZYn2dQHOdooLGoQeV2EoUvWhqZxK6uYtkQoBFdWTBoGkyFjImXswr9xGj0dqBGiKoXCdmPf2cuujgKEi/bLf+S+T3EF6EWa1DQsBWdHvxaVt2CGhtinUfobiDTHlzb0o/nbU4wonZi0qFl1qC4tdCsASSfTEAYnThRohOFVGl0FVP7KnHzwSpognpgvuzX3xd2IQmyb/F0yt6YWcYEUyxyv0W7KEMMK7lRBr5D+YY1O05tzf86/xMRtueROT1/AZQ+Maxy+UxEmiErOPaCIfR9AS0vofZROVN3cqX+jcNk9itmMrmFlqsS2BckGig8NqOJQuWoL/DYRstsn/sqY0UDjfbiEHaGesnuuJqVpfEktrZsvSILumAPRQ+YHlarem3VQcTCcHObWysdyjzJjxPQYjW3x5piGC+ImK28j1V3GWirTFHZ7yFyL2XS30xe+38sQOVIsenRIIclzv6pluBLw/PAUlnPkTvqiJh+gYVie9sSPZolmJCkDXHuyyaWZtQw1PQa1QneuDd8OF+iqV4UvQM3ajtUkjYy9nUS6tlXwaQlxru20MdDwuL79j6q9T9Cb+J9Jcdi1F0SmuCtmuJFp5uOh8NWqrR7X9ogTMnJqF1d1iwLymbIZuOrQWZkAn9wNC46vHY1zn0SyJDaBkheiaUJYlGPr4ABzMDMIHK8F/356i0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WJsOISwh3l93Qkj+OGNBJVbxboCtwEoPJwV47quJda1D/j7BN5v/aX4Ea2YM?=
 =?us-ascii?Q?VBTIUTfWY3D5SlZvtclF0/VFhHepZ+cTZFSJMiQb9lYuh+hAztueUafs2Xqx?=
 =?us-ascii?Q?26lGBaF02aFOjMtiiHzS1ZFLxROvmCXyfCY5yNSCwfr6Tw0SDz23Ynbvp3UG?=
 =?us-ascii?Q?deaGL+nqo2YVyw08NhgpoVaar8rDJJlNPiW4spomvF6wX6UmYbogAvLfOkvi?=
 =?us-ascii?Q?6yuTe2CuTenPmXhZszwRlafaprn0QIgj+0TXD/oViENKRotHSGXDs7NTjp8Q?=
 =?us-ascii?Q?BBfUx0Wfvwwwcbl2WvN4sthfSU8rXL/xQ+5OYFAqmgxYbuV5l3TyTSktRlJF?=
 =?us-ascii?Q?iSoQpgSZjeRmlpVG8fghY2MEzwoLIy/uZW6kkg1+lrhe5KVmjvEgqk0kOkSz?=
 =?us-ascii?Q?uhTma2Ow8dFnrQjp2TA+0dUcmYBT30bObH5bDzWjK1AKQaVh8MN4qwgwGpT8?=
 =?us-ascii?Q?nnJStl/gIdKA9TUYR57z8RUR0bUbCYgifu3qNvETzX+HL7xJZNqgTj0fAvvw?=
 =?us-ascii?Q?vXJTD5KRx7rlg8f7wH5C59jLbUV8n0N1eJ1gUYvG6bqOYJLEHdE62O0xEUQ6?=
 =?us-ascii?Q?VBLPne4yDYP4vcmQZvQ9Sc04c+t6sK8fseAUQWOmWB/iot5BDMiIB/XCsDhH?=
 =?us-ascii?Q?KHpi/kJqa9eWplfKPrW6SjBPPOXNzHgzBBel36tR7wXMkYKkQLz3U7TlAZnj?=
 =?us-ascii?Q?Lk6ENWYbw4Jbwqq1kSlRBjLopgt6jTenMdxeeNn40X/0qNxxgHcPfHOOy3q2?=
 =?us-ascii?Q?MHOdbx0yZTfJReG81pqBDw9j/9y69mgKNoM1VABLb0LPkNDib33uZ5OmOqx2?=
 =?us-ascii?Q?hHq6MQH8mmRPEDIIjhFsmL6BueGsVbYIFeuOwUraWuo2w0ITmJdE7ioj2Fen?=
 =?us-ascii?Q?7+dn7GPhRFWUWSdIx5cZLYsC2lLB+pULZ1Fr/B/WpGhGkZDoTief4zIuBJmn?=
 =?us-ascii?Q?5/59jN31daiPusMIBZolmKuOVW3+1ZzamflqOQcWIcUdq1TdgyT4gqLg9qXK?=
 =?us-ascii?Q?rIyJrS9YRVjpNQ/dLW8KYbeCMk4wje1IAEdQ1QxKUzN7A9XN6o9FWnYEDhM4?=
 =?us-ascii?Q?KWdHZIofwltRCGrzFWgjWqh1d0G7phsYQ7wQQq7oZASB5DCPMZBgIyAS/399?=
 =?us-ascii?Q?EETYUB6vndnWf7ebaSLzTBIBCGzVF+0ACwPN3oQvxlQrZYXjdChib0ieHlh9?=
 =?us-ascii?Q?BrD9SoXPn8yoDJgebUA2hCDnGCTZy8NZHrHbDwNJSlRAV3mgOxXs4mGkS8qr?=
 =?us-ascii?Q?FsektZMaQhD7/FhqhONDa0pxBnROLi/AHgeHCcNRhA1AIfmnSbMiNggk6gds?=
 =?us-ascii?Q?ZtGeo+DJ+irHSVzS7x03MtuOC1XN7HSdHC3dhjP0szAX74vgoLGj2R4RV4iB?=
 =?us-ascii?Q?ALxIIHtnboAFldrd1ChmbkVlOthkb8N2zybcx6LFmCp/EwrcgWIu1KvH1l2C?=
 =?us-ascii?Q?uAk1ZDCCqzlqVCB+c35yr4ZKbe7hJT/dK/1H9j4Nancd/hee7rYTRS7isT1D?=
 =?us-ascii?Q?uVt+xha93ClV+UaRdVgqwZiJUCmZVEf289gicKl6Ocvabt24QA1L6pSSHX5i?=
 =?us-ascii?Q?BRsen77V7oQI37HFHH8Iu2WOcnLKw1pM6c/WXsl6DhnRHRG8jN8J6uOyfHg7?=
 =?us-ascii?Q?PgNNOnRYQoqBLzrQd+iTPYz8DOABoay/5R0cMEF2K08L3pUj3qFHwMtnJ6J1?=
 =?us-ascii?Q?h0sjIijn1kR99tQ6hQJaiBP/qYVRRdjum8NX1zFPWCd6BoCGm/IGjcRymfJy?=
 =?us-ascii?Q?oparUaRMFxMXWOYCad1dCgDNZD3fCcw=3D?=
X-Exchange-RoutingPolicyChecked: 
	bkfwq+0S0r7bPWAlykUKrIL2bor4nnwZvMFBo+dehziDZH43jVzlYe608pFRPus88hcTo4NODBPtPZ6EqREnO2veqVlo8b6jbqnFIB/bZLZPfq+xLJjGVbUPAVjtVd1EuQMZue/9A2Stgx6gitxcZzrdUKzGaTt4fvCDHjvirPdtMRQQSMCztxmIcYiM9fec217/w1LiTgC4nfzWBLzy5fNJsxElhbWxy/IkyKH7KF18RDzhLOP51AnBJKdjiuAS/neMoGYpmn7Xuyspcq873uewRyGPS/sqaswR7cVodpH4ODxpMqsi8xqA0YTTQA8mOw073OsS+qLw+KNir07RMg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7959d0-f8f0-4277-548a-08dedb51d360
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 11:29:22.0906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JhCQ1InhqWF65w2/KeNAQgULWNSyQMqTn2s6CzmhqYdNLgJpwxaQBJzxT5cktB/WapJrNDRt05cb2ETZGl9EAvz+uunTH/GQTnLv/kFXSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXzyQyWHgwxj8l
 rJwP5dCGn7P1H1VXXhnUR6Z8Dd1RBloVvA/zfiy0UFdLs2/fBxE1AmE0yVjHWXd7BZZHpTToF9F
 qv8NajnOtDFiYAolm7bahtWgC8KpUS267ehy08vuKPaeL+V54D4ofZ5P/Ob1Yi5dybM8YtOhWP5
 86AdtZ7TSOVWFBeOdaa5pnFjGKoQkXuVVjSEOxpxRFGFYLpKvAVIG+RRpHpGJ5B2j0bo/M8qsQd
 enhJZ2du+ITtN0B5HYa3dSE6BjnowjEbOhUn9Vb+aVxFDOtEnBQ7XaKvncyVJQHkYOojYXwl7Oe
 gHb06wH/76bgt3pBleF0ds/L8eKHJHYjFbRzlDMtMwTeZkbBLe09BIG5BipXzwPgN6OF4NI7eNi
 Hg38ZK34eriJpUqosiWWO2YSHiPrnXUtJJAIbFE+vbvbzP7vfhEVkHpG5t1Y0k8iKP/lCuL8hL6
 LOA5CCvxKheF73E6BLg==
X-Proofpoint-ORIG-GUID: rLtF2KZrKXOy3ZBqvyTMCyD1Pt5sHVco
X-Proofpoint-GUID: pOpYPWIhehYH9xFojxRKTOjZyIxDngHz
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4b9193 cx=c_pps
 a=wYVaD1eOHCZ7T07lO2spig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=WrL5Wt0pQTHvqysuuZIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX1469xqmb/5d/
 ldrICfFvOph469XfFPt0PHfcOFhS4Slbd7JvndLOj82g6TVdiTo3yUeJPUDleTLLrC/Itl/lggD
 WtyC48l3iRLMrucPVtWtgw/dpfUhjWIX8r/Y9nv9D6+hyYj9K7/4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240257

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
is enabled, as Rust is only supported with LLVM toolchains for this
architecture.

This aligns with upstream kernel Rust architecture requirements as
documented in:
https://docs.kernel.org/rust/arch-support.html

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..ee0d5abaeb 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -91,3 +91,7 @@ do_devshell:prepend() {
     d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
     d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
 }
+
+# For riscv64, Rust support in kernel only works with LLVM/Clang only.
+# https://docs.kernel.org/rust/arch-support.html
+TOOLCHAIN:riscv64 = "${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', '', d)}"
-- 
2.49.0


