Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B825CD3439
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:16:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34254.1777969009046972099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qepmkj/J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456e4N82244317
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 01:16:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2PTiZ1B1L
	36T9Ug7kWnSJXzkwUWZVCmRMmdj9Fj4JAA=; b=Qepmkj/JFhwLODoOj3VRwJElf
	ftKAOg6dEVkJm/XeKYPqAr6nImIEARqDxZzIyIYEJC5TYWdRS3oO/N7g+5cDsm4R
	NK1AXn0Z1D/tZrp7VI+fiiOzQ1sLoE32RzESV7zuXsFDE1hPGXd9OV+i/egtGbaT
	UBbtf8/VL3jtJgdquE8VX7bteJQzVEEs/W9KthEeKsdCNRfOyq5WP1Cs7JOA4fER
	/axX0iOWJ0Jgu3AfTWt/EZJZH0YhkhEhJpiM44b4DoFfC2jn3TeovEliPcNcapve
	Qybu9qBCWzBqGo4evYrHbibUpU6qcnzdmGx1C+UvA+c8HAxkt5aWdtvfXvstw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchytwck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 01:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bd2owAQvs+f32Ot9W+zlrKClT2IpZB1rrKBvTddeLLK5O90u00/bazkKAJb3eFC81OgaM1STDCLhOOBpOn0b+DG+UsGRNQiMrb2kiZnjtU74DZxcLEewaj2HYcQY5xSKffXLEKk57WBKX4jwZjg8EoKluyCh4rPDDQz7QHBRKOYv8+yl/JWpJZmN0r3/cOKCfT6WVvkmAYuL4eSKQ9goFa9B+VcNEPy1g7k48GCkj5WYXji0nU/eeXEQoR4Lh32i8kWdT6MsevK6MaIJOPaJCNHqsYUKvEql1cxIYt7EgDAPXvzODp4u01wj/mykqC6B0PgdB4Awe9D9+ake3QR9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PTiZ1B1L36T9Ug7kWnSJXzkwUWZVCmRMmdj9Fj4JAA=;
 b=fZjYv6ALElrDAjwZKk0mk2saqmb5YtJsPUThUR3BDH0fDvB+36pBvT6UgXnW2oaETGYHQ2bfOEqUMN3OirOHEf2PvyklSHsKplldkHtzHfQ9u+2zc7CFcEMRxYJ9y7X7yWendWHUFphY4uC33i2KVFuufSXmHfTzVA8u3b/a+r9JTd7bSBUidIODLwF+oIVAOo6C7WsHqNmfspF0THDJxW6OS2RcdjEEQ3N9clTRfDXfvIDdsh1aCbfpnvMZ+b4URH3lYpVZOvkRVwSqPNETQQ8jcWFY56OK5uf+WkhYPwnbIbkcny2dJEkVAFoC4WBvpt1JbjpZkAyZ2dEQnmznSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:16:44 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:16:40 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        mathieu.dubois-briand@bootlin.com
Subject: [PATCH 0/5 v5] Oe-selftest for Clang, LLVM, LLD
Date: Tue,  5 May 2026 01:16:20 -0700
Message-ID: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 015e0107-cf5e-4444-ab6e-08deaa7ea26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	173eITLBkjLWd4bDGYEYbSxqPPypkBwkQe5Qv/wExgAPzn3JQTn43aDvSMjDpE2zmBjfWjtgvraoGCM2lYXUnotb3nIudwbzeXfGIvqkH8cLGtpR2URU0171o9VwJ2D+y7394T6PIZxx09hVfeWbuZiGfAAEQlPpMWmbQdjgBeV2MzMR6ssREoRh40rI4uwx1jrCFvIuJY/viyPrMOOzQx84KfhZUTxiXbPiD0xq8G1Slp+yxjSyBr7ivmP50zvQoGj+6Q+jKAo17LYfgkDmrGiYV7lTOmX0znVwunrKqjfzV+V0RgvsGY3EHT/ib42/guSrpr3qvoOC2/lpXkzs8kYLgHGlnPtTwA72e3skOgIjDz1v+G58hAlMeEV9e09Im8E3FEDl+tjhefNZSQWlSzZFiJf2qYJSsby+WtjN+WmkDeWYsjWcT2Wapaf/OrQ5AfZNneSElnKfnDqLUrNYJLFd0R4FaU76HMIoEFDQEtsI6D5keTfMTNkjTATyboHA14tgaGfuOtryEiWuXxrBxN8R+eHQL+F6UpE9iwoe94nrJEsxUP4API2QHfeAKDK6wp6p73B2Zf9UfHXdJa6cTwBomFsN5v22SgA1j5CvLvmk9xcvR0dmt3IMAuoelFefk2KNQzKji5rOSnCAlkdDLy7YX/f3N+e6ePBwC/dWRIeQPfYs6vt4fs2c3ewbVLJUYu9Ph8Ca2MKDofzubkxsYURScajQ93V8IuM7KfiUBS88I6aXfbfPy4s5cG2vLGQN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DFRBwfip2UHFlMhi0CGRFqq7Zw3WZ+gaE4uUAgVjaK9E14e+dNl34yriDvZi?=
 =?us-ascii?Q?+oN9XUO03DlNiYNYf7wTZm1MEq46Quw9gGg82ZkV3pT3Jo2lCdr8RHKIF9fB?=
 =?us-ascii?Q?YMcP75M41A+U/TrebMg57jS5G6ziu1+10kTH248LgJO21uKDb6mkkpHkJoR8?=
 =?us-ascii?Q?LbbcISINTyAeHdznjr/I1NbXZgHYElBmHTnKh2vjfC79aCyyRCYI6AZynfWV?=
 =?us-ascii?Q?wMtpA/v6fK+s6gbMmXOKWsGxWKy0m0B9iYZhFvy382/xnk4u4QSdGQBywvUN?=
 =?us-ascii?Q?7qgClqr7MNW7m9UfHn2l3KNlZPdIqEGfYRZ+gsSvIJJ+Tw2UK9tYgf7zISt8?=
 =?us-ascii?Q?ZOhMrCh/oR1vq7V6rZ/p5g9932CWrEjYb9o9Z4PCKZpqI9ukGnGZlqT28YVK?=
 =?us-ascii?Q?qqMx26lsPxGfhX8kH6KpwqW8TBgxB7vssLLzWasZinMotMy3eYWIQ1ofFXxX?=
 =?us-ascii?Q?FX7vIs0ReUznkQ/SYFp9hc9a0mr56TinL7P9rHxHj6KZlSv2sywbBEemYeNl?=
 =?us-ascii?Q?sAGBF0nDgZEnVXmGa/9R4MTMTMGDM48ZCsYSovWaBNA7ZZmc/9FyEwb26kvP?=
 =?us-ascii?Q?Sr3JpbuRw5Prk8f/niNzn3jRK0YYwrnXr2DlI0Dmz1HSO5cfvnek6pjY6CoE?=
 =?us-ascii?Q?YpHdTX7YjjlyRxtoAysPiwfTN8EyzLxUeXJH/QULKGfTp0TcZCopmJyH/puL?=
 =?us-ascii?Q?YlsRWQUMKt4qI5R3dzhNJYNbdWzyF2sLmXzNj+9Uyma8uhX9QPuYOUaZdRmP?=
 =?us-ascii?Q?s/sxVPdbM/RPe/i4sf719K8f4W7zMEx7TMv0SFX7c2ebAFWQFEncKFAzlYeK?=
 =?us-ascii?Q?N4I9OHbnsV7PthSB/j8hgfdK/Q4ba+kkenjxD05/cTILMMR6bC77iLymOJxA?=
 =?us-ascii?Q?a2aq66fG3qXF6zUzChUuSc+uC3rQOaSUZpjqaFhFSn3l5QWmFa0WFdBaauzF?=
 =?us-ascii?Q?VU6i+yzPX2sWvBd20dCNtNP9veYlkrgtmE/OAN9p2d0v6/mxfr13tE61FRNy?=
 =?us-ascii?Q?dZjHf8GywNzdNSwtJKvdK9LA2FmwJDaOQtPDNxltY4eytfM1+r1LO74vWkmd?=
 =?us-ascii?Q?kO8Uty+rkZhf4MpWjbVInaEOhq2290JqWE3Y3+TjVaNXE48rp6wbdcRDLRv2?=
 =?us-ascii?Q?sewkADxdTYf0XYHEqUZO2VXwQmWOblD87UUdyogBfk3Rimyv3cHFQWfsX7X9?=
 =?us-ascii?Q?YKmXjH0DGb+jIRDH8wYOG6+Bu/xgHYwPZWsmHQXy+HITvZ8Qt7z+T8qoD2bp?=
 =?us-ascii?Q?lk5EZ5XCQX4hjEzPd3YBUxfu3APtQJLChLd3C93zFxqEvymuZcXoV5yvz/n4?=
 =?us-ascii?Q?4IGGRA6AzbY0I7o0lPmOXbPYk/kvxOiqt7tGnN5zcFIEFEb9isjNrcWU3Snr?=
 =?us-ascii?Q?dy+eXK5EuSR6/9GTrdyPB8l3F2Iu2ji27mCLmrTlnZkaigmsXt/x3VwqQyGw?=
 =?us-ascii?Q?qCo+24JkVMoyEx/TS2YI5PjSI4O5khh9ZdguMzC+vcSlhrcpS/jaJU/xjna5?=
 =?us-ascii?Q?/eCMq+73vgF3R90iPpplbwgLOq61KzX2Du/kV/oogditCbP9hrL81mphtqIY?=
 =?us-ascii?Q?BDgu7qgGX4R+HgImzdQACFzhe7vF2ZxmCZVwvPMLUy46rtQTC0iE5wmkNHlM?=
 =?us-ascii?Q?29NK7gQl0HW+7a8MuZgl+z4ZTlkLpUcmcsNR9bqCSPjg7VypNKknYgNZWbRt?=
 =?us-ascii?Q?iF6adDGiassig2b8BzFILH4GK3DZC1hMWlQHtyspGbgNHtXvx1KI1i+hBjTb?=
 =?us-ascii?Q?3anK8w/BlnDsGNd6ZHcWexRBHJvii3KpwUi8AaaYOR/vTCo5/Rry?=
X-Exchange-RoutingPolicyChecked: 
	kZA3cxySxQf0y1J2CkEj6f+F8JWoiBRM6BUm/rkWxcFJd5ybWU8j0pkoOyM2n/qWrKxLfDG2NUxSkWlkU8TYbDzy3izgRJ4bdb5PjuhPCrf4yHq3NsjW979RbedYVBKdC6CxYFRY6autoxGwOWywWivXlXvBelZWitnGKITdBFKW26bmjQxvIrzQ1eumUiQULoTpYKYNzNtBdynPftsZgGw1dE4vI+iS+33T4o5z7LMJGJA9DKubSy9AnqdwMp/yhqZ2ygdu6KZBSwUGobb405a9hkxaPGYt+WoUP9zBYRA8nRdv2trB7vW9gJQFs5k8HmcdQ/0pgUE3/mQzEC26cQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015e0107-cf5e-4444-ab6e-08deaa7ea26e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:16:40.6347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kNocqQMzpojLUIaG/vI+iTZWX7GXaLzASLL54BUzH4yGEuPBq6GB9MaXbMN3bgtd7wo8HNBo5scDVu+Dtlef9RnjO9V/4R5D0occmzmQhh/vPSYLmQjxwa0dDRkF93t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3NiBTYWx0ZWRfX8CanhFPRNbvI
 27PNATWVVJEoqMolN5AmoM8LGOwWMsvmdZbnV1rwLmjhLdyvJ6LkKIIXaFomg2HmczIZOv123p0
 CljNMw4gaAdbkZWjTufi7F4FkOckxHGvI+9YlNZa4a+HPzUxn7+cYG/dZjgZJmOEcUiDqz2AfzP
 veT6lM/UtvPd6oFlQsxXhD4vWz2bKqBzmkPfeiSYGu6BrSPzEY0UoYsP1fFdTw4NFfJXaRzNKsg
 5Vx2fnbqN4XqpPYkIskNaISjoT/m68xnHJLbmK0DiRvWQEYlOeXRW1YjTSbDsigTHx1z7lfNkoj
 ygDQ49A3r4foA9PID2L4WmfzeNmPOqB4t2ik1mQLzIA1Jx14+4/a3CT3kqqksDiijHFqRQzMbhY
 WdAZxXWB83FLyJdMNb+rVk9f5AI5aiOIYKTYuAurg837EmR0HIt3H15GV/TbNwaYH8imfMh2cZ3
 BgfthLxpg1oYgdCzb1Q==
X-Proofpoint-ORIG-GUID: w7ueErq0nFZThna5ImG-H0dsAf1HYtRb
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f9a770 cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=3eaxciRzc6-884s-MfwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: c3C3QcvtgcDXLNUSFcZsNEVQ2aicoNZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236466

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

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
-Patch 3: Set CLANG_ENABLE_TESTSUITE = "1" while running testsuite.
-Patch 4: Selftest script for Clang, LLVM, and LLD including exclude list
-Patch 5: Fix rust build failure by replacing target llvm-config with native

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

Deepesh Varatharajan (5):
  clang-tools-extra: disable tests
  clang: Enable cmake flags for llvm, clang, lld tests
  clang: Set CLANG_ENABLE_TESTSUITE = "1"
  oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
  rust: Fix rust build failure

 .../recipes-devtools/clang/clang_%.bbappend   |   2 +
 .../recipes-devtools/clang/lld_%.bbappend     |   2 +
 .../recipes-devtools/clang/llvm_%.bbappend    |   2 +
 meta/lib/oeqa/selftest/cases/clang.py         | 325 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 ++++
 meta/recipes-devtools/clang/clang_git.bb      |   8 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   5 +
 meta/recipes-devtools/clang/llvm_git.bb       |  18 +-
 meta/recipes-devtools/rust/rust_1.94.1.bb     |   5 +-
 10 files changed, 439 insertions(+), 3 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/clang/clang_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.bbappend
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

-- 
2.44.3


