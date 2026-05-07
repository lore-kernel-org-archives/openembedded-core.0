Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF90CD37AC
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1587.1778175158751629370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SmXw2Ml+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6476c09p3134176
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 17:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=pqhwQhzUf
	VTRe26u/cVD1dtCVISstgx1LUzf91mbbqE=; b=SmXw2Ml+jYW315r3WcXk/HiMK
	5jtSF2JkpPWVxsDUX6wsq93Rghv1sscbGK20FZt2gQ0R4N0TSEepSvtWnjovO2Gc
	ski7KpbN2eH7sMErqYL+uZDxCf2yNywyyoj3Gh8rc/AOGHKKVzgPFZBBl0Ee49RP
	wPp79lIs3JzKXLWuQkjfwOrN2t5aGTE3mG+vOryW8WyY96FeKU7M4iafUtYclnzP
	v5Rn6QoeHsr5sNKG69Vxq0YymNzUTxFSX1qM8Eidc2vWnwjuMSg+EZrFVwClj+tm
	B00MLxM4cV+N+9txccx0WEmlO6ZClS7CV0A4vJIb3KT1eDy1evtpL+77JKM5A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu6x72-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 17:32:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3aGxM1sGcbQyl5NjDMscx7C+8L5AF+TBs0eKF+PKlU3LcN7OoLW1enULWFWDuojsSfs2F9zxh7IIU/T45DGQpQYeTpbeXN0H6L3AnRm2a/SAdZNSB/eVCB8oEUu+g9l3qmYap0v6ZqBsquF6CVMCqqit/rdFD2hiyl8ANmgMspVyIg73zYRa09/I7pFvCgkQYeX623sceIg5MxHgh3CDIoeLPaMqsU3rxj5nYVt+WBBF1SvGlzd6IMmvWKadq3OEVW8Ap7MbHr3PTLrT410u+1w01jup1UZrfXx85cL9C86UEuSb4juIbAIZKexiuoOqzZhVQGLd3W4LihGkqhDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqhwQhzUfVTRe26u/cVD1dtCVISstgx1LUzf91mbbqE=;
 b=IgW6selCtgPvCmIFcgR2/EF5jvuQBa4QMNAIBh1XL3Vk1RcWtO6H6OYoemXIiNAst2X5bhJqW129Id8ERjch+dmxvMaHWzkM16G4ZhMnXSN9nKgwKp58R1kje7Sfgfhd8Tc2I2cvWJ5KZ26A+v/Pnv6fw2a4tCy62mBLCjKmg90KUEM2PpTjgkGz5sm+/6wKqJM3FyjHbIozLPU/3NmI473G+XsOYkMaWhe8y33p5o3xVDujDnhb4WG5d/W3Nksj+8DwzAE1GswF/sDzi/xfDjKkm97sBVv4cs0F14W42dW+30DtTds09R+lhADHLx9js/WWkTLe6spnca0KK0JU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 17:32:33 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:33 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 0/7] gcc: Upgrade GCC to 16.1 release
Date: Thu,  7 May 2026 10:32:04 -0700
Message-ID: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: b2323878-6ee0-40dd-980a-08deac5e9f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	e5PwvlrMsSOw3j+AyqBe02i+gKbTmVPU4Ut+rC4RN3YllW5sf86CGdEUvXOmDmCKIY811JLoT7qib4iqn9uGjgJKNCw+wtK4lKEeyYosS+FQ4CjLHOgfA8nB7SAyslbx08jSXpc2S0M1l2weOvXhwZJfaauNZ4KYg3mq8IR72LiF8tttwjQq9KuDp5EbhaNFbC5CpTNk8iUeNUhYdbRJw9+hyp2Qt0wmEd1pcnzF69DbqS3v6WS0mQOUT2hb3adq+NXu9MZ5F/gE24EeWOPgdhoDHoqldGrEQjXd28h6pYF0tl6K1pBepa5pRIIYDJBvmMdv9JKVsHIegSn4oehC18V1BHf/T+xJQFOAobTvuy2bSuja3hQ/84/6GjOfWar93TJKNZi0T6aq8dljUD86WnrmOT9EuS+ncwHOopSDUz+C2MLhFkLB60fuVZ64cMgtt8o2AhY2UWGjr6Sm7QTeNZOTftNd0XNNgW13cktve5dVPiGTPNlmAgmiSm9ivmL5Onqjhnz+LXpnNLO4x3ygZdiNQ1gjJHjaRJCQT5ZRw/7jrszuSVIIjqsbrdaS9AcCkRL96Jj35bx3sjQD/MR7Hhy9fah9hdEP/WU9HLwyPqdBfXLL565EbWm50rwKsx5cImLEJ2xMRuTeGTXRdDe901KsTKUmRjD2QZOaq32OsHcn6ryTTQN5vBnZ1wJnum+V6jltr2JzG4OlNjS4sZK6sGSx2B1ybM4PUixViGRKPqPAJI2hsxvMziVfjCz/pmPU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qWOjUhbwmKtYsgzTP8hU6lLIRVl3I0R3g3Jld8B+opqWrxXebQKqwavA/GHD?=
 =?us-ascii?Q?oBZo63+waEnBBa/vXmnD2UwCwQDKJkkFxLLR473OkX8H0X7T+NLCaIZHJQBd?=
 =?us-ascii?Q?AckJ9k66p5CvLRmAXo4ZJcq005DUqDto/scpMHBAN7knnYzDwtOSpRjezdtp?=
 =?us-ascii?Q?9jQ3aLqum1G+xDsMgjmNsswvVokMtItpEqxHq/iLej0l54mKOAT5M1hYi4h/?=
 =?us-ascii?Q?LPG7NusAt5pj11RTbni3c+hwqE+G9k6+A27Uudl7ZKc2jn1zDLgWAlixW5fJ?=
 =?us-ascii?Q?KvfDBAFfmK+94HgzFhFfH4vOOoRLXe+CGLfTrSNAc6wsVpublZRikf2UnoPo?=
 =?us-ascii?Q?lFMWjEF8yg+TlRijj8F9rxu+ta4Qo4wUSxX4jCR4PxuQhEvemhKXaous0JBR?=
 =?us-ascii?Q?Ag5mKMz/2Y+7gqkqpJYlfHS+HYGogWrZoykm3ZgqKvMdtCaLiwY4bOpH8QPS?=
 =?us-ascii?Q?LCFzISrUjieqWTgwHFAfutO1HLUKrFBBfNtZSkuQfkSo1rXdp30vtxvMXga6?=
 =?us-ascii?Q?gv2qvlCE5bw+aNQeK/qSOFP3uo3tk00VyKjF/ieoYwG+lii2r/RDPtk4sjft?=
 =?us-ascii?Q?k/IRtqPznY374ConO6PLc528/oTLyv/4Hdo1xyO/EHZ8EPZTMmhQS1xctzFk?=
 =?us-ascii?Q?vkQlN7ms6ARkQ+Jw+1BQuJvouXjwDDz0xuJpRlOytwMYCREp3DY1K7GNiO0x?=
 =?us-ascii?Q?dCHyMFAfL9RJqo2R7v87J3uSz4nnB8af+XJ0r/Clwrr63W7+AxXa6fHv7rQ8?=
 =?us-ascii?Q?qSbevVpeXWq1hJbEvKA4JAK0Sx+X7byGVIzdUADB7DfiLdrQHlCqRcXjDNcd?=
 =?us-ascii?Q?tuZSbn8R6JuZ2YN/wVg/Q1ARNMXvbTkk3kzDu8TSTuvsrItJypU2flxmexdX?=
 =?us-ascii?Q?/lsQ2CaIrO65TupuqYeKeFgidkM69tEZMY9G79WZhevABMg6/QHk6KhDjd7e?=
 =?us-ascii?Q?lubxoTVj2ZLuYfBhznfHQ6ukF/QDgCwsKcxFhSQfK7Dl3/QTQ3NiH0G+agIW?=
 =?us-ascii?Q?0tHqX9UGPBBUlx3xzWUlJaPP9p8KCOn3JYHra2CeJulC15MafKW004r4aO7i?=
 =?us-ascii?Q?TLRJ8yhRMC2M98yC+qlA6mWvv3mfuoPd0Lu8dBqg72zFgh9Xur22oJmOF38z?=
 =?us-ascii?Q?6eZqIdo5JO84Q2EA26ztdjiyMbvXAA5KVdk4UXTHruiJi5qtHVVTYbtoqI5V?=
 =?us-ascii?Q?/tGtOUvp7+Pta3uHfXRzfgNaek++0ebnw1GWInO+s+wutOuAzYcElCSqu++A?=
 =?us-ascii?Q?LlOUzKIouesibPvMVt0JnSDiZBAo2qR0rkDAJVgTz8vw89B7NyknsmMs9VMH?=
 =?us-ascii?Q?ll7XPb98LghhVEPvGqncn8vaX9x4iewBfFXMyc3W27Gg49dWtNV/tAntqrAs?=
 =?us-ascii?Q?3VSjegG84iH1gW7fNsG0A+d4vTBrTN9JrAp+UOjSroI62HB6z5iQ7+dP3jq1?=
 =?us-ascii?Q?LItum2CaGvKrWkfECQMSMaNWkaBTNSp9TTalGr1V2mRbKOq4bZ6Dz9Y47ftD?=
 =?us-ascii?Q?K2Oue4oqf/9ulQFTsaTMGmeIffjfo27Qmk/1mRVlqBVB2wJaWiQBg56dQAtW?=
 =?us-ascii?Q?Fq/K3/2eA25vhZ6aDRQAH06TvKUyg5Ag8EUZALIFhyVLayn6gwEBtTJXF2Ds?=
 =?us-ascii?Q?5OugBJz0VP079YbWKbX5Xb+oeoHW1dvhsgbhVkaOyggLxXnCdGkeehOwvJ6w?=
 =?us-ascii?Q?KmAfec3zrOZXRTj7Su8rPzIvLSh8RZ9OmTBBZLGkwEq52mZCNEmn7gSXE1be?=
 =?us-ascii?Q?TGDmZjgfxYuUfNtWKFTjhR0zFUa/P+M=3D?=
X-Exchange-RoutingPolicyChecked: 
	Ba9J2R1g06PMeOiNZwlLXdL8fSPlunFALkrVw/bTA/PNjwOj8e0KVixCSi1t8JfRdQAuCOWhAtXeNO15Oa3Cr/RTlQOi6d7SYxBbYi4xNdCRxWxNh6fYM9aJ10Yf4mk7gBl2rnbHl5S0c3Xg9hD+gZj+oiOzOBMvLhL7ChwGTik8hz9pT6W27TVJqJzth/IEVyEsx36KbABk1Psp1MObNVGPddyeKIcIuLM7PI1IJ67srKIt0fix6WiFOfOrfrzP4T8QLOwWDJKp0PKOShkjSLNX2tArr6sB6skk+ZTSxMGBXvythbfihcKUc4TIkPEX5CxbJTKCSkzjGxE5AxnzeQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2323878-6ee0-40dd-980a-08deac5e9f4a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:33.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FW35k/27A+K3Bs2ys5dDcnfH4xD3JOeGAPjuQz8UJuLbJtYO7iiABF/aEeYlKmUGQ0KQAd773HG2sVAtf9PhfhS40W8NTxMGRoMALn8JUSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fcccb5 cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=r5PEhTsYcdBcVfknUroA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfX+LddgfTTRKo7
 PJWwsERbAN8eOJ/jKO6fDIXhk2wpL4LTXXb7DQ498qJm7IQHwZVtjI70jCIaBz4kOtu7DG0TsQ+
 IuS2WiMcCXGUtJSOAs34g2F12dbk/UfcG3//H8Axv9AJG3B4bBGCYU5pCzHl2kTeLJ6QSGn31J2
 3Uy4AhABthYE9hq2cDx2qgxaRNpEv5IzeNFJbAmVtsd3OYmU7cObXANWukKlw2bAsPHVzOw+FZ6
 9qcv+y+rgcnutFz1IdHed5ITpUxfiDop5RhZ+3c5DjUtkIZ6VudW+moWtZ5xaAaGCB2Nv6XYp9r
 JJSroxmdw/UuCqvnqekdXaJQTa1iy3JbQW9tO/FwqQ1HgddU+0GzaciZX9Rhvs1IHEy1JZ9WUQ+
 A4ORiR/UvEHNzSdtcrdKyZKEXEXzPvvBh3a5V5yi997JtmtgMQ1FK8fsIx8EMJOWqtxETHv80B/
 ITWsgye/KtJn2G4d93Q==
X-Proofpoint-ORIG-GUID: bqR0AZwFXB7RZBLAFwli-TCTuHBrk_AB
X-Proofpoint-GUID: jQ_-6JYCSUh85VELaVyRHrO_Vkzs9erp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236607

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This patch series upgrades GCC to 16.1 and includes the required
runtime and compatibility fixes identified during testing in OE-Core.

The series also includes fixes for packages failing to build with
GCC 16, updates for libatomic runtime handling, and packaging
changes for newly generated libatomic_asneeded files.

Summary of patches:

- Patch 01: Backport piglit fix for building with GCC 16.
- Patch 02: Backport rxvt-unicode fix for building with GCC 16.
- Patch 03: Disable automatic libatomic linking in glibc.
- Patch 04: Upgrade GCC to 16.1 release.
- Patch 05: Disable automatic libatomic linking during gcc-runtime build.
- Patch 06: Package new libatomic_asneeded runtime files.
- Patch 07: Avoid passing MULTIBUILDTOP to libatomic in OE builds.

 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/recipes-core/glibc/glibc.inc             |  3 +
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        | 17 ++--
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |  0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |  0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |  0
 meta/recipes-devtools/gcc/gcc-runtime.inc     | 18 ++++-
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |  0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |  0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++---
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 +++++++++++--------
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |  0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |  0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |  0
 ...h-rename-local-lerp-to-linear_interp.patch | 46 +++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    | 61 +++++++++++++++
 23 files changed, 194 insertions(+), 61 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (100%)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch

-- 
2.49.0


