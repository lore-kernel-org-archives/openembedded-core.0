Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E08C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 06:24:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41361.1718864652199482234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 23:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=69014dff4d=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K6H7RT023806
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 23:24:11 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujaysbfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 23:24:11 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45K6OAkh032364
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 23:24:10 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujaysbfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 23:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4YHJAVGWnoxOGYny10luTHQJVDOu/qxIXqdl054ZVbRCSR3C+YDKMLtLS/lVHhZLXFP6fwxYs5HSdN3GomqmnVDYSBt5JChAxS6wJiJEY4k16Yz7E007Xfi3F49XBrkfSsMJufVBgEq4wa2atJ3gJxPv8MkdyVXr1dZxc+zwsXi0TTLqG5ANpf8SoY3//nyckihQEElkrnscKGWs5Kfh40IfHyeCi5poUdqOm9T2wLBCNIOTDMr+mNlR9tzzRqVfaYoJtenH7Ad5S2UuOYuEtKvK7bOSZbuV4574M4j7uRrwsgqqzE80KLe2Mw9RvFiUj+1sc7EQD9DrBevNH1ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDoeW2F5PghAXc4P9efbhIbfYTU40SsbK3eZhXgQ+AM=;
 b=ZGifwqZ6902mJQmY03jMKLy2hMyA/pQkLdp9sFvopOs4UcyM498IMfAUo10kkgfEr7GjAdQ5msNv4qnP+t/2wLEdB53STLg3OHhbRVKTpT2Sc3ooEw+J33DsXYMrz1SUaqwMms0i/GQtYhLDeEv9kxPb+9Wndup1sfkxVQKxM1gceXKNJ3DiyWerNbPI6FWLHpP9ccFU44gTCfrmO6xN4w+FYzetBpRI3rMU89OLcYvBwRfD01TXiT3eu06hsP2oHStffiEFesLecW0LnWyM1iSCUJycwKsujhXI1WhnfyMYw0WHVF3HJ2yjRAz4rXr1N8VOUoUGebrFA97RLS/PTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 06:24:08 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%5]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 06:24:08 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        raj.khem@gmail.com
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch updates
Date: Wed, 19 Jun 2024 23:23:50 -0700
Message-ID: <20240620062350.3856250-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 90054890-c180-4997-519c-08dc90f19763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|366013|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PgmVeV4qbw6j7Gdolv3yhmUqYL6PQGL0xooAv+76ZpjhbQmRFMBS9Io9pDWL?=
 =?us-ascii?Q?Wo/liMal5ciURL097MWo6V8gDwLszbpAGlTQYDLsdTpEQHg6avubBlpnSDCI?=
 =?us-ascii?Q?zHYVQCAEKIc5h/JWye7JQ7zzPIHGusm3i08swVu9prEj9Z9ydfOHfra2Cnhm?=
 =?us-ascii?Q?cALDubyI1GqwE3dyPV+FVk8naR1HzUE9M83nsKLvKAydvLOerGth5K8oQGYQ?=
 =?us-ascii?Q?Rw9t8kHSGDScUDON0xWsjzLdhxG/cKW9ykz/pTp34hlZ3Smn1u8+6xqLj7GN?=
 =?us-ascii?Q?6zVew6Uu1USHv4+pVepIAfOtbN6BPCUNDd4AFA7k2qsrK/XLVZhvr+rkRfSx?=
 =?us-ascii?Q?3pvS2dODdJFGGsQF743UkRz5SlPKMlppfHJPNIa0wpqd4hjypHyT+NpgGW3i?=
 =?us-ascii?Q?psmxhC/RqRynqQ6VLrrBvOWa1hmIfB4PtBtzkGSXvWuLH22br6aYlA3NEZSp?=
 =?us-ascii?Q?eOYk0YwDI9xMk3sX4NOZNc4Jw9qchzcWitzs72gNzMqK5mpKSRbMoLlEDI4v?=
 =?us-ascii?Q?0a6SPjrO2VT22nRCQYz9LU0kjbBcNb7cvIZAR8CaZE4L8qygHyVBI+WuzmXC?=
 =?us-ascii?Q?7VR7Kj5SEwZ4MX3zAV0tso0pDSaqXukEgiE98NtZ3vRzZwAjLM21/NNgOS/n?=
 =?us-ascii?Q?bQxmeeWER0V4SRWCO/2ILO2tkpgmFyLh80UbsfVcy1M1hF5Bn7wZDM/2kIcN?=
 =?us-ascii?Q?hTjsOLmOPh5yPhvUgwxac8Gh4n6sVwNWk7T8Bod6H1iGXJX7P8OGkK466/go?=
 =?us-ascii?Q?EKTSdikYGPphoxYi+HiCJ1G/JPgma5dE7fDZHSfYwfNuuhBsk0M/XwTNy6SJ?=
 =?us-ascii?Q?8R0HB7tWe+/nQLN/1Lqd6BlBAKOI6a6DIsFqsYL0lr4gXzWw4eC2RHU1AnDt?=
 =?us-ascii?Q?s05jj+BkC3Qpa+AUJ4cn9FGNBVj4OyRRSY0cFy37IuBWpi6OIELZfxe7ACE4?=
 =?us-ascii?Q?FvjnAs+ELEZBgE0l7Tk6iuRCOzFtNbkUu1zOAyzxs3pjrR1ovb8HxPtpapky?=
 =?us-ascii?Q?FptELyINRje05du4t3iqQ1PchMOrt9/1cJctj4EadoL0GQE5DQR5+A1gErdj?=
 =?us-ascii?Q?N4jzk4OAv5ha28KWDE4OoC/lG621XYz0kdDR9tsJCpx843H+DBd0dirfnErI?=
 =?us-ascii?Q?c+4EukisXVXGh2x71x1FkQXbtgWfp4kdK3bnCVkxgoh89sLivPcLkeqhmQ5e?=
 =?us-ascii?Q?v/huTiXHcLSTylh2j2oIjGPLjl6OJHzprLnkEKpvaP+h/KBZMY/aEfpMZOXz?=
 =?us-ascii?Q?iqaovWhtMpRlIIWzXQyGbTBmPFQ8/GNrguVgiQD0JLazx33dK6+ymkmE9OS6?=
 =?us-ascii?Q?fw9XZPtkapP+2ait8kl4KcyL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(366013)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U/KMe6C4Rx0hoXHEt1MRpdMrbaOP4xqkX8GZRekUyUG8QUf579pErxLb6T8o?=
 =?us-ascii?Q?0vFdls+VKH6uKGHUBx05XC4Sj8QU8u+u6WQaSVhFBK/HiOeYlwNpycfTv9qj?=
 =?us-ascii?Q?nqR3FVami6iPromJmJSOqCvQ1BULum11fGivOCbaziq7ZN8F+W3LwTiqCnvj?=
 =?us-ascii?Q?DDCSXH537r90Fsj7VhleKZh0n/Ocae9x7cXxWK7iBVswpMkLePWbC5dRWlqs?=
 =?us-ascii?Q?BmYYTChkkcePFXTavsQAYT9bnBp7DvF63n1jRFn5Keqy9JXhQljBgqYyZxvh?=
 =?us-ascii?Q?MfrG1/42mZLTAp5nvyPsc36AKtBs6Plx6P9y3NWG+4nbVnW6W+GwxzLGNVB5?=
 =?us-ascii?Q?vfXtsMsQRO1LrH8kYLUwN1myYGMIEoXjBLujal9+0prBiVLALOmzlGzxFJ+X?=
 =?us-ascii?Q?IURmDfhYtaSYwcY0M13eMnHnxxdLTbQPxPtQ7ze9TjibQURgUSXTcdZVRBqf?=
 =?us-ascii?Q?3AZPrjb3vMKnA/D3D3FWRist1nSQCBikzgFgJH7gH4Zfq1+3fN5DzBBfuBqj?=
 =?us-ascii?Q?lcWe0LXyJ+C2GHeeLpgpCwj340CTmSch/d0qIaZ8wOZerlYbn8MFTLsbBpQ9?=
 =?us-ascii?Q?Vzr93J3CBqJrCvXSKRq+N20e4m5cCWiReovkSbjxwBOV6g4i8HrPT9RRjyMo?=
 =?us-ascii?Q?n8+k7mGMrXR/zpky73xNNRqydxfCmJV3EZaNQRlPxS+BZGivOYRGkmH9QNF2?=
 =?us-ascii?Q?g3URncKgZ1E/09NEyGlyPjhv8LBme9odmADbKSajJliQh67aNT5IDsvW7igl?=
 =?us-ascii?Q?tXOw8Cz5+0PrV1bCl7E7kljtpf5pbX86c532uvUCCXxDs6H4D0ywmm60gMji?=
 =?us-ascii?Q?kzCvhD2lS+HlQe1Po1udj5Ah+otJcI54+efOfmBeq+qjFtmuDnCQ7oPtSGzK?=
 =?us-ascii?Q?Rt28oMPjTTIIVu7CwSojCgVnQ2taL7VPQ+DhKFuZvSak3P7lqS5a6X6CMck/?=
 =?us-ascii?Q?dUHMXlhYh62L8JO0UIA+TsQx/x5BMtneUqOhb215O7/Kbfq3Jyuikwio3W6h?=
 =?us-ascii?Q?vW5q35ypgZ+iCRLuRhYW79Ld4g5FOBk4E1Ia9GBh9GFErDI54c+m2+0mqHZr?=
 =?us-ascii?Q?ZC3ljBidKE15dlInq5UBD3/fBpK2wAy0QQVPi36jtAoQ7zbP1+KW8F4Vj+7B?=
 =?us-ascii?Q?CpbE4xH+X0E1W1Nw/ioxpcXNwpjzbHqHoMkl2qYbicbRUQ87a3lwYGAZJJ7b?=
 =?us-ascii?Q?16T7kdrqPNXq46aj3wp+TcL2Ojj7TFGpgQ01voSVbPFkSEy8cMKjYn2XfEM4?=
 =?us-ascii?Q?bNPEzet7pH6Mi4XL/iVLYus7lm1qHgwSmF3z4tZhHksoIH2ED/tzX7McLpsX?=
 =?us-ascii?Q?mCKnEbsPiG6JU40RPfMNl9TlQmV8f3iBKqgYe8aV3VeVuYePYQTnqARzRDwg?=
 =?us-ascii?Q?IUm3Gd7UpqtKQ+mgaBQ7apgn9olVpmSp8TJrNdNhQbsD8sbado466iwZS7Jf?=
 =?us-ascii?Q?o6BJTpYwjty+FLCPkaIjHF+GGsVvL6lxcPKcLix6NrideiPuAUgTqkXxvyTh?=
 =?us-ascii?Q?kn6zJ20UWAnBtFv/L/PY9pmXHxN7JUycAjhW0rKX8ghJOCG04ZYjfR0nyohp?=
 =?us-ascii?Q?rsnVk7LBZZMiQxXOFR2XGPzhKhUwUO4lfRV6S8ziZnWOPWoGzO3Du4SJIg/1?=
 =?us-ascii?Q?P/6Duw9rRocMfdsiNZej1BQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90054890-c180-4997-519c-08dc90f19763
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 06:24:08.2044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dk5cu6RDBQ20TjGnzSxY2lO7sC4vTedOqzp7CNwMpGIjwbJjlyEkWv3JTyC0jHiRpO2VMPT0DGPsrMFvIQqEWRBkfxAjXwOAHUGk6b39NHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
X-Proofpoint-GUID: 0gG3RSvmK4MVsUOwb90lJO0GY1L9qVTb
X-Proofpoint-ORIG-GUID: 37VWl7q-pLG3qeJOGF8Mw3MgLmKJ-E8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_03,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406200045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200940

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on binutils-2.42 stable branch are updated.

6c360d37662 PR31898 bug in processing DW_RLE_startx_endx
bfda03eed33 aarch64: Remove asserts from operand qualifier decoders
6224493e457 Re: PR26978, Inconsistency for strong foo@v1 and weak foo@@v1
d125f967537 hppa: Implement PA 2.0 symbolic relocations for long displacements
884fb5373a1 x86/APX: Remove KEYLOCKER and SHA promotions from EVEX MAP4
d816fda3cbd aarch64: Remove B16B16, SVE2p1 and SME2p1
cb11047e34a Re: Move bfd_init to bfd.c
818bcf40efb print cached error messages using _bfd_error_handler
831be495ef1 aarch64: Fix the 2nd operand in gcsstr and gcssttr instructions.

Dropped: 0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 .../binutils/binutils-2.42.inc                |   3 +-
 ...sserts-from-operand-qualifier-decode.patch | 382 ------------------
 2 files changed, 1 insertion(+), 384 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index d2f49560f3..c8f526b5c7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "553c7f61b74badf91df484450944675efd9cd485"
+SRCREV ?= "cbec9028dd3fa9b49e0204f1a989cea67cae32c6"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -36,6 +36,5 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
-     file://0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch b/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
deleted file mode 100644
index 7b52425a38..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From 5b1c70bfe0d8f84dc28237d6150b7b9d57c791a8 Mon Sep 17 00:00:00 2001
-From: Victor Do Nascimento <victor.donascimento@arm.com>
-Date: Tue, 16 Apr 2024 11:49:15 +0100
-Subject: [PATCH] aarch64: Remove asserts from operand qualifier decoders
- [PR31595]
-
-Given that the disassembler should never abort when decoding
-(potentially random) data, assertion statements in the
-`get_*reg_qualifier_from_value' function family prove problematic.
-
-Consider the random 32-bit word W, encoded in a data segment and
-encountered on execution of `objdump -D <obj_name>'.
-
-If:
-
-  (W & ~opcode_mask) == valid instruction
-
-Then before `print_insn_aarch64_word' has a chance to report the
-instruction as potentially undefined, an attempt will be made to have
-the qualifiers for the instruction's register operands (if any)
-decoded.  If the relevant bits do not map onto a valid qualifier for
-the matched instruction-like word, an abort will be triggered and the
-execution of objdump aborted.
-
-As this scenario is perfectly feasible and, in light of the fact that
-objdump must successfully decode all sections of a given object file,
-it is not appropriate to assert in this family of functions.
-
-Therefore, we add a new pseudo-qualifier `AARCH64_OPND_QLF_ERR' for
-handling invalid qualifier-associated values and re-purpose the
-assertion conditions in qualifier-retrieving functions to be the
-predicate guarding the returning of the calculated qualifier type.
-If the predicate fails, we return this new qualifier and allow the
-caller to handle the error as appropriate.
-
-As these functions are called either from within
-`aarch64_extract_operand' or `do_special_decoding', both of which are
-expected to return non-zero values, it suffices that callers return
-zero upon encountering `AARCH64_OPND_QLF_ERR'.
-
-Ar present the error presented in the hypothetical scenario has been
-encountered in `get_sreg_qualifier_from_value', but the change is made
-to the whole family to keep the interface consistent.
-
-Bug: https://sourceware.org/PR31595
-
-Upstream-Status: Backport [commit 2601b201e95ea0edab89342ee7137c74e88a8a79]
-
-Signed-off-by: Mark Hatle <mark.hatle@amd.com>
----
- .../testsuite/binutils-all/aarch64/illegal.d  |  1 +
- .../testsuite/binutils-all/aarch64/illegal.s  |  3 +
- include/opcode/aarch64.h                      |  3 +
- opcodes/aarch64-dis.c                         | 98 +++++++++++++++----
- 4 files changed, 87 insertions(+), 18 deletions(-)
-
-diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.d b/binutils/testsuite/binutils-all/aarch64/illegal.d
-index 4b90a1d9f39..b69318aec85 100644
---- a/binutils/testsuite/binutils-all/aarch64/illegal.d
-+++ b/binutils/testsuite/binutils-all/aarch64/illegal.d
-@@ -8,5 +8,6 @@ Disassembly of section \.text:
- 
- 0+000 <.*>:
- [ 	]+0:[ 	]+68ea18cc[ 	]+.inst[ 	]+0x68ea18cc ; undefined
-+[ 	]+4:[ 	]+9dc39839[ 	]+.inst[ 	]+0x9dc39839 ; undefined
- #pass
- 
-diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.s b/binutils/testsuite/binutils-all/aarch64/illegal.s
-index 216cbe6f265..43668c6db55 100644
---- a/binutils/testsuite/binutils-all/aarch64/illegal.s
-+++ b/binutils/testsuite/binutils-all/aarch64/illegal.s
-@@ -4,4 +4,7 @@
- 	# ldpsw   x12, x6, [x6],#-8 ; illegal because one of the dest regs is also the address reg
- 	.inst 0x68ea18cc
- 
-+	# illegal, resembles the opcode `ldapur' with invalid qualifier bits
-+	.inst 0x9dc39839
-+
- 	# FIXME: Add more illegal instructions here.
-diff --git a/include/opcode/aarch64.h b/include/opcode/aarch64.h
-index 2fca9528c20..e8fe93ef127 100644
---- a/include/opcode/aarch64.h
-+++ b/include/opcode/aarch64.h
-@@ -894,6 +894,9 @@ enum aarch64_opnd_qualifier
-   /* Special qualifier helping retrieve qualifier information during the
-      decoding time (currently not in use).  */
-   AARCH64_OPND_QLF_RETRIEVE,
-+
-+  /* Special qualifier used for indicating error in qualifier retrieval.  */
-+  AARCH64_OPND_QLF_ERR,
- };
- 
- /* Instruction class.  */
-diff --git a/opcodes/aarch64-dis.c b/opcodes/aarch64-dis.c
-index 96f42ae862a..b70e6da9eb7 100644
---- a/opcodes/aarch64-dis.c
-+++ b/opcodes/aarch64-dis.c
-@@ -219,9 +219,10 @@ static inline enum aarch64_opnd_qualifier
- get_greg_qualifier_from_value (aarch64_insn value)
- {
-   enum aarch64_opnd_qualifier qualifier = AARCH64_OPND_QLF_W + value;
--  assert (value <= 0x1
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x1
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given VALUE, return qualifier for a vector register.  This does not support
-@@ -237,9 +238,10 @@ get_vreg_qualifier_from_value (aarch64_insn value)
-   if (qualifier >= AARCH64_OPND_QLF_V_2H)
-     qualifier += 1;
- 
--  assert (value <= 0x8
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x8
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given VALUE, return qualifier for an FP or AdvSIMD scalar register.  */
-@@ -248,9 +250,10 @@ get_sreg_qualifier_from_value (aarch64_insn value)
- {
-   enum aarch64_opnd_qualifier qualifier = AARCH64_OPND_QLF_S_B + value;
- 
--  assert (value <= 0x4
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x4
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given the instruction in *INST which is probably half way through the
-@@ -263,13 +266,17 @@ get_expected_qualifier (const aarch64_inst *inst, int i)
- {
-   aarch64_opnd_qualifier_seq_t qualifiers;
-   /* Should not be called if the qualifier is known.  */
--  assert (inst->operands[i].qualifier == AARCH64_OPND_QLF_NIL);
--  int invalid_count;
--  if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
--			       i, qualifiers, &invalid_count))
--    return qualifiers[i];
-+  if (inst->operands[i].qualifier == AARCH64_OPND_QLF_NIL)
-+    {
-+      int invalid_count;
-+      if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
-+				   i, qualifiers, &invalid_count))
-+	return qualifiers[i];
-+      else
-+	return AARCH64_OPND_QLF_NIL;
-+    }
-   else
--    return AARCH64_OPND_QLF_NIL;
-+    return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Operand extractors.  */
-@@ -355,6 +362,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 	  aarch64_insn value = extract_field (FLD_imm4_11, code, 0);
- 	  /* Depend on AARCH64_OPND_Ed to determine the qualifier.  */
- 	  info->qualifier = get_expected_qualifier (inst, info->idx);
-+	  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
- 	  shift = get_logsz (aarch64_get_qualifier_esize (info->qualifier));
- 	  info->reglane.index = value >> shift;
- 	}
-@@ -374,6 +383,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 	  if (pos > 3)
- 	    return false;
- 	  info->qualifier = get_sreg_qualifier_from_value (pos);
-+	  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
- 	  info->reglane.index = (unsigned) (value >> 1);
- 	}
-     }
-@@ -381,6 +392,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
-     {
-       /* Need information in other operand(s) to help decoding.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       switch (info->qualifier)
- 	{
- 	case AARCH64_OPND_QLF_S_4B:
-@@ -405,6 +418,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 
-       /* Need information in other operand(s) to help decoding.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       switch (info->qualifier)
- 	{
- 	case AARCH64_OPND_QLF_S_H:
-@@ -644,9 +659,15 @@ aarch64_ext_advsimd_imm_shift (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 	 1xxx	1	2D  */
-       info->qualifier =
- 	get_vreg_qualifier_from_value ((pos << 1) | (int) Q);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return false;
-     }
-   else
--    info->qualifier = get_sreg_qualifier_from_value (pos);
-+    {
-+      info->qualifier = get_sreg_qualifier_from_value (pos);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-+    }
- 
-   if (info->type == AARCH64_OPND_IMM_VLSR)
-     /* immh	<shift>
-@@ -773,6 +794,8 @@ aarch64_ext_advsimd_imm_modified (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 
-   /* cmode */
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   switch (info->qualifier)
-     {
-     case AARCH64_OPND_QLF_NIL:
-@@ -1014,6 +1037,8 @@ aarch64_ext_ft (const aarch64_operand *self ATTRIBUTE_UNUSED,
-       if (value > 0x4)
- 	return false;
-       info->qualifier = get_sreg_qualifier_from_value (value);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   return true;
-@@ -1086,6 +1111,8 @@ aarch64_ext_rcpc3_addr_offset (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 			       aarch64_operand_error *errors ATTRIBUTE_UNUSED)
- {
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1105,6 +1132,8 @@ aarch64_ext_addr_offset (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 			 aarch64_operand_error *errors ATTRIBUTE_UNUSED)
- {
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1154,6 +1183,8 @@ aarch64_ext_addr_regoff (const aarch64_operand *self ATTRIBUTE_UNUSED,
-       /* Need information in other operand(s) to help achieve the decoding
- 	 from 'S' field.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       /* Get the size of the data element that is accessed, which may be
- 	 different from that of the source register size, e.g. in strb/ldrb.  */
-       size = aarch64_get_qualifier_esize (info->qualifier);
-@@ -1172,6 +1203,8 @@ aarch64_ext_addr_simm (const aarch64_operand *self, aarch64_opnd_info *info,
- {
-   aarch64_insn imm;
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (FLD_Rn, code, 0);
-@@ -1210,6 +1243,8 @@ aarch64_ext_addr_uimm12 (const aarch64_operand *self, aarch64_opnd_info *info,
- {
-   int shift;
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   shift = get_logsz (aarch64_get_qualifier_esize (info->qualifier));
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1228,6 +1263,8 @@ aarch64_ext_addr_simm10 (const aarch64_operand *self, aarch64_opnd_info *info,
-   aarch64_insn imm;
- 
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-   /* simm10 */
-@@ -2467,6 +2504,8 @@ decode_sizeq (aarch64_inst *inst)
-   if (mask == 0x7)
-     {
-       inst->operands[idx].qualifier = get_vreg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       return 1;
-     }
- 
-@@ -2649,6 +2688,8 @@ do_special_decoding (aarch64_inst *inst)
-       idx = select_operand_for_sf_field_coding (inst->opcode);
-       value = extract_field (FLD_sf, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       if ((inst->opcode->flags & F_N)
- 	  && extract_field (FLD_N, inst->value, 0) != value)
- 	return 0;
-@@ -2659,6 +2700,8 @@ do_special_decoding (aarch64_inst *inst)
-       idx = select_operand_for_sf_field_coding (inst->opcode);
-       value = extract_field (FLD_lse_sz, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
-   /* rcpc3 'size' field.  */
-   if (inst->opcode->flags & F_RCPC3_SIZE)
-@@ -2670,12 +2713,18 @@ do_special_decoding (aarch64_inst *inst)
- 	{
- 	  if (aarch64_operands[inst->operands[i].type].op_class
- 	      == AARCH64_OPND_CLASS_INT_REG)
--	    inst->operands[i].qualifier = get_greg_qualifier_from_value (value & 1);
-+	    {
-+	      inst->operands[i].qualifier = get_greg_qualifier_from_value (value & 1);
-+	      if (inst->operands[i].qualifier == AARCH64_OPND_QLF_ERR)
-+		return 0;
-+	    }
- 	  else if (aarch64_operands[inst->operands[i].type].op_class
- 	      == AARCH64_OPND_CLASS_FP_REG)
- 	    {
- 	      value += (extract_field (FLD_opc1, inst->value, 0) << 2);
- 	      inst->operands[i].qualifier = get_sreg_qualifier_from_value (value);
-+	      if (inst->operands[i].qualifier == AARCH64_OPND_QLF_ERR)
-+		return 0;
- 	    }
- 	}
-     }
-@@ -2709,7 +2758,11 @@ do_special_decoding (aarch64_inst *inst)
-       /* For most related instruciton, the 'size' field is fully available for
- 	 operand encoding.  */
-       if (mask == 0x3)
--	inst->operands[idx].qualifier = get_sreg_qualifier_from_value (value);
-+	{
-+	  inst->operands[idx].qualifier = get_sreg_qualifier_from_value (value);
-+	  if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
-+	}
-       else
- 	{
- 	  get_operand_possible_qualifiers (idx, inst->opcode->qualifiers_list,
-@@ -2744,6 +2797,9 @@ do_special_decoding (aarch64_inst *inst)
-       Q = (unsigned) extract_field (FLD_Q, inst->value, inst->opcode->mask);
-       inst->operands[0].qualifier =
- 	get_vreg_qualifier_from_value ((num << 1) | Q);
-+      if (inst->operands[0].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-+
-     }
- 
-   if ((inst->opcode->flags & F_OPD_SIZE) && inst->opcode->iclass == sve2_urqvs)
-@@ -2753,7 +2809,11 @@ do_special_decoding (aarch64_inst *inst)
- 				       inst->opcode->mask);
-       inst->operands[0].qualifier
- 	= get_vreg_qualifier_from_value (1 + (size << 1));
-+      if (inst->operands[0].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       inst->operands[2].qualifier = get_sreg_qualifier_from_value (size);
-+      if (inst->operands[2].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   if (inst->opcode->flags & F_GPRSIZE_IN_Q)
-@@ -2772,6 +2832,8 @@ do_special_decoding (aarch64_inst *inst)
-       assert (idx == 0 || idx == 1);
-       value = extract_field (FLD_Q, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   if (inst->opcode->flags & F_LDS_SIZE)
--- 
-2.34.1
-
-- 
2.43.0


