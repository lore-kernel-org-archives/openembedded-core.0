Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77738E9B35D
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:43:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157819.1772448213346556935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q4dehLAU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6224HAj61201972
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 10:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=AlXYGeX9F
	B62yMJZWkZG2qWVA/2ercA+7Nrsk2oI6ic=; b=Q4dehLAUL2q0ln2IO32TyyXXM
	ms8fJmphENTrqk1vcqhfg2kxWhZTESGbtw5xai1j4tvyPE+WO3U/tgLMiIgHPxW4
	ARsMQxrJ/vCRFRvJfbRp082o6Y1h2sPoXbTappfcInpwRIayP9oIs3bu9fxf+nfe
	KYt3gbiqxrfYuLpAWWwbrQWJwn2Bczzo74l/YZ/ekM0o3FJocmSPH6G+dCf/b3gN
	c4lIyoCOAsS+AUJuAtJwcT23yfX/hJYNEteLEDOMihrWMP3R+0c7ZXQY9jgnPTAX
	xuiOsrmDT0gZLWNNWxhNu9hlKwEwo0OhTVNNVsImKe1IJJT+zPQk6mGewmEvQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvj9bc-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJqnGBYgOZT9Qy+H9XKDLCPTN3GFGHhoGDPcK4bFXhhvnmpxvn0Flxg4qxnPLMirYS+uFyqi+ATdW1vSutEWAQwXjewMIpP4e98autqfOcYia+fuJm2Z/tFm5/DbNO14ivKBs3Hm1zRYdSVPtUam3Mz7N8Ej1+9h1QTg2/kTZqiUe85rQXApDmOVa3gQgPZucD6LjXXpCHgk1BcCqTdkkVHLCqm9/ZD3RQ/0wlpYcHx/TGqf4QjkhehHKTgfVHrclZ3hBJbqZALiWvcxksIkrPXdFIBlxKwXB8OP2XF7dJ4XoD5vfO35HqQ97ZGGc+yUzUXeA/2ytx6tsSAwPUFfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlXYGeX9FB62yMJZWkZG2qWVA/2ercA+7Nrsk2oI6ic=;
 b=vBVE6C4K/1OLlqLihXulkXhBJKPFWPv7MvNkV+QxGciPlkSZqIl1FQ85wu9JTt8LMro7lVqKdXXoSFjsq62D+Hk4qBhoYogzN/polhiZV6FhCl8HvB52p1MYGDCUY+lrBU6fukbJoiYt0fyIv4hVFLlIk7Hs8qeszaWcvsGawvM9/eKdfDacd6J36ZQmdOqZnJyJKSBmaGSkShvzpe9axUVro9jzBO6Q0ZvTXmMkktlowxjijD2iQZC5mjzpF314vrXDDpz3xFq/GpJj+EFGARALjH9kM+z7/XEuxlWFjFtBLrJL111xovlgwaMtcLfKf3c1PlwkfMv594I/TFNDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:43:29 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 10:43:27 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 0/4] Oe-selftest for Clang, LLVM, LLD
Date: Mon,  2 Mar 2026 02:43:10 -0800
Message-ID: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d99c14b-b5c1-429a-3e28-08de784889b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	hpIJVC1Jp5/aaZKbX3S0HHo1Lzgt8q5Nfv5SrIR4WK1nF/rDxKdesI1Y4jzM7zBWjSKBeZRQUPIVrZrpYnqQcLG0JKsILT7oVn+5F/3RZKvz7TMc37H8w7VqbxeaNFFZEIK1gcaRJmmWDtLvbxlzWd+Rxy3QLZ+4YYsBwmU36ZPToQVYu5FUxEcNn+R5UA5CZClFQSjcbwwoZ7peLAPDxpbE9iAULvyTDKIrB1r9afvJy7/Cf/lBvWzRGRibtG6W+RrgI+8HskVhpQ5NqcIh/VhrKzKrsKEmaCGqhEWipUk4jPuwWfk5lUzo90U7kDpnkGvS/Q2NjPF9ZDpqWezzYsOLOZvYkYppVSiG6IxNm+C5rYDwGKh4rWOM0Q9aVsxbwAvIqh0XGrcZIF9tFe/rdFcZpSgHql6J9ibjbbVlLCt3YUnjQK3mHexi+0uXSl4LGy9Q1uMT1YhOuDqGi/GOohujccIWxFMGXHjxI4piqJDAHLvzgyntgoZ5/6nnUrBbDqq61ZXNrr3avUSC6GNR1nYVxabr7Woxd2v6U2gJ5cCUmNyrMfFUKiRqtWk9ZLlHUv/GlhFpasqaeoV0r1xaI4S4sm8Jw6Kpfo4gBJXf8pIqBJgU6pa3No2yTTCtp3OQphPxEfPJtswfkU96Czn8uclxSLKnoE4nDyqE+41kLmWGXKaWDkwGonOqacLS4efqNieBi29Xn6Oft4mAh1T2G2Z8CJCx0IE/UK95XOyKxURtMqSHRZ6+RStkNy//n8Hfj4fmxqiKV0VdB7zl1bsG+Jnla7Z2WuVA3+8KjWl+YVA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EtKijDCQrtVOqHUU71lzIVTqUMwUppvqWSagweRCNnRndB1Sz1Oq9PZCkZyP?=
 =?us-ascii?Q?ejnqW5KSaPfIqd4RCcHJtumuvSuS1sJYEqajrZCm4tLDPZ/6wx9mZBiYxlNC?=
 =?us-ascii?Q?pPkFsMp7zW4YapV44T6tc3FIgzz5vfj03IFvKAxTcQUKRh4kTNz6g6qvrEiI?=
 =?us-ascii?Q?fahpaUaeuGpU1uto/K2zuITVImvHXLMt01iyRG47e+/G692qCNMwgF+nKw0v?=
 =?us-ascii?Q?n75YqigH8vv0Dfv62iUGs95E8zu+kUmIr4hIZyonsU2mWEhaGCK4W/Dd+7Ah?=
 =?us-ascii?Q?+plxSjnkR1fsJPBWJU29qNzq+RkNcfDHXcT8HLUuK5Yl1LZkY1gW6OlGT7D5?=
 =?us-ascii?Q?3BYFYUSozoTXXXgNHzz9vP1tG4hedlyz9ri+GS3fhV+ANOurwRVRKzliBTgC?=
 =?us-ascii?Q?XUKUfc1fLk5GUMmc/+OCYJuX98HBUEEar2jSjYACWkmgS6T8NvZD59xXaOPz?=
 =?us-ascii?Q?/kI3JSZi4tUrzzZBuqXPPWtOdyZbCSE6mR0oaEN11mc2jcZ5f5EjPrjzoxjB?=
 =?us-ascii?Q?+vi9nkvjaSCewCtnVjokM2zgcGJL0UucxIUoDVfBhQCbKvPyy5s07tOtTLFh?=
 =?us-ascii?Q?wqag+j01SPvOH5LaGvrPwPmely3cb/sVu4al/TaqpEwirrBoKFtbPr4QaDdz?=
 =?us-ascii?Q?w+BSDF9YYRcS6kl6nNXQ+sj7QlgYnDO2AWPil0XY2jZVFjM+iujc4PLI1HEJ?=
 =?us-ascii?Q?rpEHp5qwVbiJVqeLmvi2qCyUHP4u2zaFBXYTj3WzkIQYYloENM9bw8YeiZb1?=
 =?us-ascii?Q?j556Z8nig09QMVlEkFab8YUR7gBUkY6MGF/DAkcs6Pp/4WryMJed4t/G4497?=
 =?us-ascii?Q?kR99YnPI3iOi2DGVT9xDn9Aja6HK+YPY/HHuV6y61cIIK07hC04hXi7sHPlY?=
 =?us-ascii?Q?USl2AZfy2WY/USl5h+EOP+PZ+OnCaKE0zAUXDlExmHpKHZQN6s/ZwflBQ4yw?=
 =?us-ascii?Q?o7lWMcg5smxk4SBqWWMgNkB23/iWIP6AsQRCdwQbKBxxbvwXhaGRBOC7Nmpu?=
 =?us-ascii?Q?VwPiIM77hYSGkJ1qGKtgliCchFT1VyqYG0Xg/sfGPejuDg1UwadDpbWwnnuo?=
 =?us-ascii?Q?cEKuPa/tGANhvpbHpoMlWBqlqZI2QOWfz/1eug/6P3LSkk0uggKxXUHWPDFD?=
 =?us-ascii?Q?3cEESlq2ZnRp/6COZsusO9k4DvcvyJ6zFHBT8G7hsBRH35UYFsMS2S3mAiia?=
 =?us-ascii?Q?d9EmKMXoPwUZbGl+5brg7bj1ws92I6B/cZ+xmlfZA5YcYJBsDdRSkGnn7T/T?=
 =?us-ascii?Q?PDFM6sfjAcReKK3JKqVAccE+3j5LAfouH2PkdbYnUs0Xo8Z1cxNfsUnykSxH?=
 =?us-ascii?Q?SEYl/ISScCRkI3x07qm6e9P6qNyPTBy/AtX4Q3m2MjM8W7pFQWQjR5vMXZrv?=
 =?us-ascii?Q?JU45ZeixNpKM0b4AcTYDH2db6ZPdRVhg0NK8ehKRJPcYGDn53DGqA+TShi9E?=
 =?us-ascii?Q?H/baZOCrjwIlXOBL47rEL60d2TVv4LxQZiw6GbWaX7BEBlPW52lUvAkFzBYL?=
 =?us-ascii?Q?T3DetLDDYsukthA1zGmasPVH8Ju8TvhxWwA++obuZLKRVprVZo7xwjHqt4/i?=
 =?us-ascii?Q?FAVJ2xO6qje+LaxdYVcyNCXBdGkLf5ba8PVcWEknvgCRtwx44YgGZ7CHjHJr?=
 =?us-ascii?Q?5VpqO4JEwptVUX7SLdlzzqMAifCQnl1Nxk13fyCLzk90H5aXYnfGevrX1KwH?=
 =?us-ascii?Q?QICGBbqFZdNz/vVPcGfBshfmyGNH8K+8waZZobYQXFn5sRzIfyYlcCl95Wxj?=
 =?us-ascii?Q?HNjEj6FBu3i2JR2ALGrxHN+jeJJv1H+oCJprtOQMmTpJ7vpCHsth?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d99c14b-b5c1-429a-3e28-08de784889b9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:43:27.7785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4Rk4nOElVUv9ZUzKutth8eaVkOWyfL+xVDhwMzflDoRQoZMuKkSxYDgybfg+bgqEidjutPbADFiDFYC5T664ShsKbh0K0PzxkRhKBm4uMfaKg6ZiB+D8iI+rCHWQiKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Proofpoint-GUID: qijAKTvUoDE9cjh_WKKNJZ-fqAAVKi_9
X-Proofpoint-ORIG-GUID: qijAKTvUoDE9cjh_WKKNJZ-fqAAVKi_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NyBTYWx0ZWRfX+xKxCozZAR6Q
 R5OmPNMWBCuFusExVZ1HR1X7mrcTnOIYUVAmcVoXtJsTEWVR/7HRGEOn9RPyjOQksKXYZ467QiL
 ZdbavSG950Ds+4nTFGJcGl7BzVhNGFK7008sSBClydi7C8uctqbbLfTePOzuAOQIFSZKwtbrYCz
 ZfO/FKnpQTCkzVdhslFXFKqU0INzbO3/CsLyjNWUH3bGmaVAQ+hkbxtxuYkC/ZnaqqurX4X05vC
 Fiw3ptnGMMwMmblolfvGF+Z17qlCOviqESDhGsaSLcun9XZoXW+xw0m+CXaoS3Q10wLtcrx06Tl
 OagkHVv2X4/g3h1gZc1V73/cwohtyEVEUG6q9cZ16wDeAuqWQYJLkKrF9a1x0FDpoTZwfYvUKP+
 4splR7NVySukhvtKhTvzpWmxrJmJUCX+9hTGRhCfcuyt2P/Q5EFDLwxKMSFU0ODu2OQfMIN4EJ2
 m+uxg86j8KP+5rsBC+A==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a569d4 cx=c_pps
 a=Al0BzvsZ99ielPXA9PThCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=3eaxciRzc6-884s-MfwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232189

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

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
-Patch 4: Fix rust build failure by replacing target llvm-config with native

Testing:
1. The test suite has been successfully validated on x86-64, arm64, riscv64
and arm32 for all Clang, LLD & LLVM components.
2. Clang and LLD tests passed successfully on x86. LLVM tests are skipped
on x86 since it's broken. A follow-up bug will be filed and addressed.
3. Clang, LLVM & LLD all together ~80K tests are there and we currently
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

Deepesh Varatharajan (4):
  clang-tools-extra: disable tests
  clang: Use CLANG_ENABLE_TESTSUITE to enable LLVM, Clang, and LLD tests
  oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
  rust: Fix rust build failure

 meta/lib/oeqa/selftest/cases/clang.py         | 299 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
 meta/recipes-devtools/clang/clang_git.bb      |   8 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   5 +
 meta/recipes-devtools/clang/llvm_git.bb       |  18 +-
 meta/recipes-devtools/rust/rust_1.93.0.bb     |   5 +-
 7 files changed, 407 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

-- 
2.49.0


