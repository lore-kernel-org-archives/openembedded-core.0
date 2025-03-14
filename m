Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0750EC35FF1
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 13:09:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13879.1741957744521619964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 06:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51682306ed=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBHvF4018659
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 13:09:03 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bxxp9d6d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 13:09:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1VX3udA42zEPohO8pJWlPvEWeYF6VuVcrB6jCIQnaiVVXLpqBuNB4raYhIpFL3xPHCvRoiV1aIOqJpNiI48ukFCmen3cA9bxhspc1J/O8yYILrT1fegohVKrhvfn3SadfaY/T3/5x6aGWb/AYLPCK2/drsI63Sz/wjer7EnFmF0u/jhHg/LdtMqDOcqWzrPHHR7TdCniCQsB1K/LNXpZn+5a12tR1MiXWF+lmQpfkwhXuHxDqUiGs3gsiqZwZWf6Snaj/YRVhAO2aP8m96jYsTGoXShxnYTguGRfo6uifzewwBZ+/Q067dtu9W0ZDajj6RnlrlIMCyJWvPC60spcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0vMoZ4HPObIHCe1M1NCshwqXldC5ycSL+zjq0Gnr0w=;
 b=WtV1CdtXDfgQUBdfRYwEG/nQaQnmlRl+hGHsXI9YPJAdNt0AwYgpVd5Tq7p4KlV8invN3ZsmWraNY1GBerXUfBSgvp0kqrNjvzL4paLy5F0QQkMgXnT3LZyEdALu9g5BcQ6Krb3dDLXSpA+L4akOWIA92Q/92F/ghdReHwQS2pza5fttAdKMK7TGSh0DH6+5knn+b+7NKY/x0nZihJ78Me0ZyH5nYBmdcEf2S40Jk7dnQY+/I2DSBlZ6U8lc/B+HQoj8mae9+G/IrlzzPpqn0xgbrBCILOcsJiK72tjYHYiHQcajOWf9nV+CUOQfpW904y+TiUp9MCAK67ktLOvQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:08:59 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:08:58 +0000
From: bin.lan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v6 0/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
Date: Fri, 14 Mar 2025 21:08:39 +0800
Message-Id: <20250314130840.84700-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SJ0PR11MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: d935f0a7-8a6b-40b8-4b14-08dd62f961bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uayMFRzNXrqhvt2GKNbh8/JG6bWVmrqShzOuaMbLEIAYIgYj5hmRsCjfRMff?=
 =?us-ascii?Q?E41P+11+Zh8sbAId7IivgWhqrW6+mUqhFt9NHs/mWbdT/GBNqx8bAqOMqdmW?=
 =?us-ascii?Q?pJlO41wHpZOyHC0secKFysdEPCZjmajsSC42QA9bD906ELNyBqYNRXqXalM5?=
 =?us-ascii?Q?TYU7KYoTbmM+I9pMrjkkQz8po/E8bVr45WveauUKfUfCyANuakMgq0LnxE9Z?=
 =?us-ascii?Q?AnMJ/8ehcE2PTKfejhIEKKqWfleq/5ID8doY7LoDmhpeGIr0/Y0udxdi8QWv?=
 =?us-ascii?Q?FPIpNkAsAibT3nbsYBw06jBIz9/8C5ijecISG2//cOqDwelZouz4D6QQQ87S?=
 =?us-ascii?Q?RSPAu6yM8WUqaki8x59rdQxsAMSjrTFIlfGKe9gsxKRTYyHIqrVFvlOfXrRu?=
 =?us-ascii?Q?eMgDhmAydPXLeT+fQR5pD8WMjc5Iu5y8ZFFOepoK8ILMIlFYdLGo/ieWV5yF?=
 =?us-ascii?Q?wf/bdWmQht2JArq4o0jWibEoafE792MYgSBEt0dsHhqIkb2AsZFicTmRPh7Z?=
 =?us-ascii?Q?W5rO1XpyPF7S0U3aZoPohCd/zlIveCKtArL7rPjEZJ6VFX63NEiMWFSCCsst?=
 =?us-ascii?Q?Gd8s2fpjYHEMN8s818Jka3OHAPyMdpeTKY4bDnoVaGTNvLc8J1JPtTaR+dvU?=
 =?us-ascii?Q?nzbLWFDUBfY5klH0HZPxpvDwAHTJS+Y3BDiX/N50kJBT0fVcy7WX/O3Pz25t?=
 =?us-ascii?Q?yypT3J7X9s1Tbsnu6uQIqPNl/u5EJCsn6nSfaNjO7hB3Z2nVKzPFRb3+n7FH?=
 =?us-ascii?Q?xSHGKZ786G6FCOaX/laba8kOv+Nwdhvt5VXP39AkO4TmC0DZEKZwPnVSUhGk?=
 =?us-ascii?Q?7mlsABHiWI7/gbyNxNK03ElWaFghQXrDi0LLE/4m84FIuWRw8vxrU0mkmbsM?=
 =?us-ascii?Q?E/lqQHBmFunzpU8Pxlda98aHIi75BGnl9UTqra0szG44uJ2ZLVbcgqdw9C3Z?=
 =?us-ascii?Q?69+rgybBIHEnM9jV1rYPLM7/dCIl6FxBpAbDyqUDPio3ioRUjNFj+Js92dIx?=
 =?us-ascii?Q?FYUr8Eqfoczl2yQT0QcdjRnFj0wdOcU+w/b3O1BRVP1zKYZ35GDz5eMaVfo3?=
 =?us-ascii?Q?H6Yiwxmfzn6NGk20epTUewfrGm9z9ktmqOa9B9kpHvI6XWm0f7F0ZX/8E2ZF?=
 =?us-ascii?Q?j4OiobwmlHk3wWrSduPCb45wwYKBgczpfHHqWXxEi09KglCZGNDi9vSyv4bU?=
 =?us-ascii?Q?N8LMh3/lyaWi2AkKQIxdftyMT2i41x19amqjCBiwTX0NGYwsCHLhWOEWHPS+?=
 =?us-ascii?Q?RMWUDvRvyZ8P2eT6QeOoqcDbUrGo+98l2CpkVIuJb63TRjk8KQUIazpypSWT?=
 =?us-ascii?Q?BaXAzQPmfDm6th8zidRHvdeeJvb3h7m+WdZQCXGHh/jt3WTGznHbuyrl6Wej?=
 =?us-ascii?Q?SI4FcGThSs7K5WhQo7g6aPrd+xUphnv7mGxCs+EFc1X7S7FYJ5Lxt9a4jLNN?=
 =?us-ascii?Q?/SHL6FYj890XYMTnhxh9UH66atQdt11R?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pyl5FbM0sJp79DQRsjZ+pgrfoH2t/Wj0xO1nBtDW1+eeCtaXESMQYZKc1qjF?=
 =?us-ascii?Q?cIkRGgaWTVEyOP7gPWzFKVwFjgJrEF782KgwLM0boigyaNDBhEPOzmaZ/ewJ?=
 =?us-ascii?Q?wL3YZdVQHiqVvYZnKXMvWKRT87V7IcI1gtnNq0Um++hP7jDqceglNVJE9Fyu?=
 =?us-ascii?Q?Mv0keZhnAplN7S9V6ChZyTldeOGa3tCCtpcuoFU2P0Rwl1MC38s0pJpJdqDW?=
 =?us-ascii?Q?dv8T1HSl0WYRp+tA0t1pnmClIz27A554YewYCthc8HAXNdpM3VMDf7QJe3Yy?=
 =?us-ascii?Q?nLm0GemS5mGosYPanOQ/HRT6oob8sjd15tLi/mQhLa0vjKCaafpADpRg2Ilp?=
 =?us-ascii?Q?on5n2pL02MSCYJ0KnXcUu+o7YSr+gsiAJeHgALHcsZ5nE/ZjaG0AlQQ9lDqx?=
 =?us-ascii?Q?iewQ0max1MxMu0eJwdAMFF+ZjOV9NUF8F0vqTX0RlPo+HmZ3RSYsMWctlS+D?=
 =?us-ascii?Q?43tK4MR1RqLcp58ClCNe8OOPK65XIbz67zaryMsY6Tm8YmLuIbpJIjtw08eB?=
 =?us-ascii?Q?pk0E0lqCSuZTCw2EUAnGzsk3f/QtIUD/wotVzhZFN76Z2utchjT/ez5zDXC/?=
 =?us-ascii?Q?19+HYQS4MjGdCu0MGS7spCcSAT4N7BoGY4uwCofJ2nOpxM6vLCQyw00ZYQL+?=
 =?us-ascii?Q?OBdofQphgzEaL9ngYEtssi5ZWk8R/2XLvVwVVne3dsS9IALTct/woOtj55L3?=
 =?us-ascii?Q?/bTQ938O5Q7RUFsGyjckZKphMQK31DaPRkB9fOc3IKBXjPcnvjCbLnxFAYKI?=
 =?us-ascii?Q?9fd9EKGwtaTkLSnW9PdqmhiAXq4Ver5QK2+z6JzRrCUxGe/70yxY+bsjj7eO?=
 =?us-ascii?Q?p8OMzMvFrFjBJNquOYzt0yMBvs5r8vCyqTNjYAKLFuK6jHrswKertDBLBsZA?=
 =?us-ascii?Q?/UAipfoPQXRIIUMuEsdGmE4iwiSdBheVIXANWJOOktKFz9ubILVNdTPKZldu?=
 =?us-ascii?Q?odm2wyr5TDeb42fMdEs0DSBDquMpsXKhwuqE0r2tu/47LwYb8wa4IcdzBkRp?=
 =?us-ascii?Q?UNyAmf2it1cQN7qV1Uy66BB7zrDsZn9hExFYUmIdPOOPyi8U5737BOxyUjqd?=
 =?us-ascii?Q?gFtkb4p0sGunBFgR0YF7qf3P/AMpLygCails2cILprkBtQXjQTfub3PQUgiW?=
 =?us-ascii?Q?iaE1C0YBXz46RhdultZKU9DE163EM6NG8S/0HCZ95H/2riMkjTG7u94gz/Dx?=
 =?us-ascii?Q?w7ztzxwhZAM3WhJR3Ta7d5qLY4Qn5Cdw0m21OadlwPJojStRZhs/W5Ukuw7A?=
 =?us-ascii?Q?VXXkjfwm66aLwe84aWPIf6r5RBx6DgvfxT7eUlypEzd7MNYHlpl6gDVVxpxL?=
 =?us-ascii?Q?xKCwj1y5nt5aeTbeyYexQt1s0uejid9koqrgGt4DYCfMOb9tAsvC4cGU89RW?=
 =?us-ascii?Q?anlfXYfmdFQjqe1Vszebmce5xz57DVADC2KE+BomMaLnJUNk02t0gwMf6n0r?=
 =?us-ascii?Q?E3wvQ4iVUoE4naCCNQKVZ5Zmch0D+QxIMdDuN2iR5VTn57SGRouJ/F9IL3m/?=
 =?us-ascii?Q?gQwKhYy+XNLbJ+5FQJOxc7j7d3T92z10dP3ZirshpJ0fueNwet6Us0l8diHs?=
 =?us-ascii?Q?QxqRXriOH2xhqTIm0FvupcjTQkW99WRixOu8U0iypKPo8dAzc7OzcrUCDX76?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d935f0a7-8a6b-40b8-4b14-08dd62f961bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 13:08:58.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LrK0OQlaDngbweejLJ5I9v2q6dc5fCtcPDz8WauIonk0Awdk1E7Asf1KpgURhil48fo+RT+bfNA4efhCSv1X15xZ41wAEKgEEyFNHtgTNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
X-Proofpoint-ORIG-GUID: DniMi24xk2sblUs3gLvDz6pwDMPAiYa6
X-Authority-Analysis: v=2.4 cv=C+PpyRP+ c=1 sm=1 tr=0 ts=67d42a6f cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=fb_ayREFa-gelaPdxykA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DniMi24xk2sblUs3gLvDz6pwDMPAiYa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 13:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212844

From: Bin Lan <bin.lan.cn@windriver.com>

Babeltrace 2.1.0 is a major release.

v3:
Some failed test cases are disabled.
All test cases are passed when running in intel-x86-64 board.

v4:
The Upstream-Status of patches is set to Pending, I will discuss it with Babeltrace2 project.
Add some notes in the commit log to explain the license change significantly.
Add more notes in the commit message to explain the change of babeltrace2_2.1.0.bb.
Remove "INSANE_SKIP:${PN}-ptest += "buildpaths" in this patch by setting the correct environment variables in env.sh.
All test cases are passed when running in intel-x86-64 board.

v5:
0001-Make-manpages-multilib-identical.patch and 0001-tests-set-the-correct-plugin-directory.patch
are submitted to Babeltrace project.
All test cases (no skipped test cases) are passed when running in intel-x86-64 

v6:
Fix failing ptests when running in the autobuilder by adding character set conversion (gconv) 
for UTF-16/32 encoding for test cases. Add "virtual/libiconv" to DEPENDS and add the follwing 
line in babeltrace2_2.1.0.bb:
    RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-utf-16 glibc-gconv-utf-32"
Execute "bitbake core-image-ptest-babeltrace2" to build rootfs and kernel image like autobuilder, all
test cases are passed when running in qemux86-64, qemuarm64 and qemuarm (32-bit).
Testsuite summary for babeltrace2 2.1.0
============================================================================
# TOTAL: 2022
# PASS:  2022
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0

Bin Lan (1):
  babeltrace2: upgrade 2.0.6 -> 2.1.0

 ...001-Make-manpages-multilib-identical.patch |  12 +-
 ...not-run-test-applications-from-.libs.patch |  28 ----
 ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
 ...sts-set-the-correct-plugin-directory.patch |  30 ++++
 .../lttng/babeltrace2/run-ptest               |   4 +-
 ...eltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} |  38 +++++-
 6 files changed, 200 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-test-applications-from-.libs.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-test-applications-in-cpp-common.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correct-plugin-directory.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb => babeltrace2_2.1.0.bb} (66%)

-- 
2.34.1


