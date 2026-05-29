Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A46CD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 04:35:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3570.1780029300443026330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 21:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nVHPS1N7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0609e57ec2=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T3wA4U3163342
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jqe1qrIuglM2BWeeNv6D
	eNNHEBhl6LHnrJSWGa4icNI=; b=nVHPS1N7rIJOiuCUSj0dSL3gXngEvE87/vjI
	zU9vQpgilKPpvEjJuvH0YB3Z0iOCsnHin41fc+Py6ZurVOurNZ9c7/RvqwEiQX6b
	icmFEaomI3ofct4y9BAuzFKqjJEDKQiwWoZ2dWnQCEYMxXkBY3QacjZWweQda8EG
	ldsxTO6a4ZBmL+U4pJOHCT68mnWLChHg6qWo7VsVJqNlh+SaP+yeYEA4uELMzcU9
	v0PSKJA/7Ig9LfdWX4/vC3/5XnKQn7HuwptZro+vqnQohyM/ffm5+A9lpK1mb0Wn
	APUGMdPrhHPp1A94GfTZPQ9y4ofx1Pg9YFhNeGeX5nQ2Javebw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x8swvm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:34:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/0McNXNWJdAHGD9eByIZLouWEx+ZlBfuY5HVZv6ZhOV1S7GGDubCDkd2jRRIRBin3DG3vBJWZpWuNz5UZCSVFB5JPH8j1BKRFRQU8lZxRdg97k+yg9fYD5DiKrZAPtX1S0Iq2Kv2rtPcTK6jsPpiHaLpneDan7uJ6BiR7chxvoDqyDOYzHsygAbrD+E/lBRFVYXDA5LMK6j5IbROlITPOOF/T19iLnE4xuuikA6cfVZZPbsEAi2V+AIbrHakBzuLyO2RDRS7Eq2g5eGi3z4O0DdqcGu87fDGv8kvYPTcnpKojSFvV8nKsxcQLHpYhEprweEgKCJPKvB8OsJEdvnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqe1qrIuglM2BWeeNv6DeNNHEBhl6LHnrJSWGa4icNI=;
 b=IXG4RNGfiUeeDwTaydueaaTtGtHzolnxZeQwRsBoace2VLU0G4q64lPtqkMB7B4Bqngc6/uT5Rls542dD2E2Nqr9FYDVLH1neA8ryS7u1FeVp9GdhBMXk7scnV+OBEE/OV1GskfcROtinC/wnGkb0TRdnL6B8qT1OTxYMYOLeAdYcFbi2Y2j0RZGAbj+4Qj6fCshpqH5NY7vY6XsNhp2DD/lrQa7Bj39fPqTPyjFbVaRoqcfYQbQU8hRgaW+Mg2io4hzrMjxYMbVpsyAbVhKwJ/yvkAdIlXGy9Me4rlI+Da/SqKE11S1PTPhnGbuJyD5lrr+BdOmXaiMJZnSN3n8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2633.namprd11.prod.outlook.com (2603:10b6:5:c0::14) by
 DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.11; Fri, 29 May 2026 04:34:53 +0000
Received: from DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef]) by DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 04:34:53 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] lttng-modules: Fix trace_hrtimer_start build failure
Date: Fri, 29 May 2026 12:34:38 +0800
Message-Id: <20260529043438.1607750-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0104.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::19) To DM6PR11MB2633.namprd11.prod.outlook.com
 (2603:10b6:5:c0::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2633:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 298126cd-751f-4d8d-5c22-08debd3ba0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|6133799003|18002099003|12006099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 
	JT/v1lLyRpeZUD0xU1zM8r7TnHur5zjt/3Zo6wTPSxJz7X3QFNGxQCcuVAExAJ1GJiJdhBsdKzfpnQuCHvUY6uod9TrGL41OUoxjh1prfvKOPiG85t3L2pwoTGa5IM1TfbWglmLQ5F3hWaW8gwES6rsBIUI0ntH8V4LEtb8yH35JdG/c0Vu2dR1N/S49HWP5xqxVBB8RyapHrYUYLQr2Y++S/JPzNHWMohzbVLorkFNvQuNQ+MMK9GthOTUKgZd+3wOWB3aI+bnziFsP0ZEqUbu9Aw1ByOE/8GxzlE9Ymk8UiEMFiPeCtrg3BcDakAQCs7q6GyDPQzZEjcpdFwmk//DlDaKRTzC6iM8ilD5W2GHMpVj5ksagaiZAWdgdnWVmf4HNCM5E7CcINi7EUje8hkD2YEbReCJJbD8JIxOf51gTYFs6N+2mBKp+ntGJCw2Z8cUM0fqKzLSS8rywBFufXJzq8pvrh5+sTeEnRZADAycTzx+LiVJhl7nbjqvbyAlGZb1pAf8JAGAj6LWLTSeJGNq+UMW1oPb2Vi1MpkWn0o/eXPi6jETYNnmPBKmUXQW3f+sAf8u4Wr/3NcIjEQ4YUc8YgH9DGkN5TfvQHoXtjs2Vp9nS6x5xdBi7FgFfoKj6MNJVJQHm2oTUnSDd1991uAaqTN3IpRVqN4e5X6ETS/6hbLB0cOqRrv0YEl8clLHNeZ3MgzA0aNN+D5IUyuRs8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(6133799003)(18002099003)(12006099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yZKLsCL/YZ6L5qb4UjWwRyQfTZ+cgmiKnYuoL5jUYIGFSUPysyR4CnrVqQEZ?=
 =?us-ascii?Q?q7VT0XcWHaOewmTSGCBU5jzi8G+VrPpQ3eurd1IPDhzD9FmT2thcWtXMsUE/?=
 =?us-ascii?Q?GT/3wF+YR9HoaiAaok11ipARXTDR983Lm433EsC19YtKI/G0UaCvXRAYDiRJ?=
 =?us-ascii?Q?SZZbeD2cz9LOsVCCu6RCWjrqLrf4WxlY5rpiTfhd9IrtT5NbLjFBd6jhSzuM?=
 =?us-ascii?Q?1zvhfbcUJ5RF7wOY8pEKQ6sdXs9/rsUsTWI+T6D8TaGhnMOOKiInkAqnQqNl?=
 =?us-ascii?Q?gjec+1Tv/uK2lKdnXQMSSh4SwGG17RV0R9zZBfesL1N9XJk8FGVXFxpUUZWU?=
 =?us-ascii?Q?tsdeN/2XmAFVy7uIhdVGfvn5MckyO82ewtA/bnikuuVsWbjBh04D5L2nl+Qx?=
 =?us-ascii?Q?fbVp035aOoHf4VmcgpEnxS0pK5aIaMSuYiBNJOnbmlkdp8ehj7CSoT9eAs2+?=
 =?us-ascii?Q?+tFjUCajJkMlR3gdyyejmnyhO60MW3nj0T9AlNUnzkhzY6DLuHfmzgyRR36m?=
 =?us-ascii?Q?Ln1HcZDbKCpHKGnZ5W8mBAepdNRlb5seVg56zo/G1Td3MxxoJg+zyYkP337f?=
 =?us-ascii?Q?g7EgebWrHE5rfqNr2DZVkHA7K0KpQXR1C+r5/tj+qCfrZHRZUQP2x3H51UKP?=
 =?us-ascii?Q?6P6z+BCn5QDXKqvqcXBBEZW3lUrPUvnzYafrfg6VuHDrWW+8Cts/bcNQfFWD?=
 =?us-ascii?Q?Mh66DXa2AoMhz9Q25nGBXVuQjksfaBXZgSLsik2521MB+jFnl5jTX6bc0eG1?=
 =?us-ascii?Q?VmoufLfWahykBGweadnTBKlw1fGoTMwIyIQxPh8CWnoJ01tlB03BAlxD8EMX?=
 =?us-ascii?Q?M+kXhlIabGJjhPJAVnUTsCml7veSO4TgcyjK58fY0LTsCszFJz2Pl7rrkM7Z?=
 =?us-ascii?Q?+NCfm4qXmpm2OpNmneDdyZOnqgKNNdJFRFue7TSSe/PLb5T7XhICmC5r0bMZ?=
 =?us-ascii?Q?a8eTsLleFQoBe2Nlc1ASiym9QAcXwhzfVduYFtIp51Z2BYo8asIZKoBlbLAb?=
 =?us-ascii?Q?KW+h+/OKVgx+ttze7D8J4dKZ7vZ3Hym3KICV6ytTRbCDrSliFKu5xhUVXvfM?=
 =?us-ascii?Q?BIiXR9unnPOdZwBgsrt9ZCdmu8MvKL5zVaho2W7AUSOKeWwreXd1PVGbezf3?=
 =?us-ascii?Q?A9I3pz3K4bN8J5IeiXW9gbwg28Oqu0cjG+of3WHw6LBb3VG/9IAbbg/IQUCg?=
 =?us-ascii?Q?x6PJlH7f6tJH/xoXIHqh/16IpgfHbE9e+By/vMR//cD0/BMQHmP81mw8ruOz?=
 =?us-ascii?Q?p/LiyZWB8SkiQE6wtglYPj5Nq1l4wGy1kA22HiEI2A15mixWd3rGP6mrsYS+?=
 =?us-ascii?Q?FnISwdv8p8lbXYVgQ3Zde9YwyatOsk/XuXwcUL5mX639RTWOMvJWQpYLhSj1?=
 =?us-ascii?Q?BuZSNMpGp2xVD0yc2huCJs12apGfMcls5v7U2SRNql7T1b3L8DPwl3BY8s4l?=
 =?us-ascii?Q?21KvC2+O/j6gyz5Etl+/F6jAi+Fp4r4i1sZdr1328TTgVg8YYLNuQcf0J67Q?=
 =?us-ascii?Q?Jp1PSXAaKUI+LjRciXA4+mcieDIA0vpccMBS60elnPEtzNmqLhbA58MtPw2O?=
 =?us-ascii?Q?gVIlA1yMGXNL17yJPytBJ6y3AATJ4gQxrtR4rpKjb5KG2UWTcsFUxL2Su8Vi?=
 =?us-ascii?Q?O8F+GbmTy17ciI1zjO7UK2aEt2jyNO5BZtSSTSvLltTePUsv0x8agsbu4bvK?=
 =?us-ascii?Q?aLWKIOavJjDINkbk6Hm0Za91tkNL2tlpGVLHn4/ULsNRJqIcNXnMHML054oS?=
 =?us-ascii?Q?JTjA6srIFw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	N9RZkm/FljL66sbyE15tGwX1CqxRJfnWzPKBrAD87xCxTUZhHU+kqaT/AaYX0gEVJcXyJsZJIl1DK0RWVjemb3etkFKxEqaBzUsPy12c5FijKOz8NSs1Z20ovCbCAVkIO5hoT1IW/KCps0v2qP+V9lJ9YljgATYPjxrix+s1AKRi22+ju1T5XLKr1t+wgF2YUysu7eySDiPmrznHysD72czsOyzZUc71MKLQzpJUt5EjFUHtdb0zQOdIBwqgioi2olws4b1LhwmICb1e+r56z/B1cCBSPSECVToH9UfrVr3a6LUFeB9//2LAV1IA6AcbBLhxzBZR7ABoOb5frgS2Dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298126cd-751f-4d8d-5c22-08debd3ba0a8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 04:34:53.1228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9mIOORX31irvovleKsFdp4bbxOvt0VF6PWOBOHkgo8AXgKv8r5Y9DtOPtBp56+MGTmXCPAs5oC1TxZ819tWhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
X-Proofpoint-ORIG-GUID: NcIgADaby2LAICoxPQ8mFp-32Umf5H2L
X-Proofpoint-GUID: NcIgADaby2LAICoxPQ8mFp-32Umf5H2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA0MSBTYWx0ZWRfX1oxtrs4luULv
 ikW2MeVkFQ7EEqiArj/6lz05rlVOlHRJABI0SJlz55+T2Eq3BsIYhkXe/lmpf+uht95dicodP4U
 XH6f+ycfS+Skztbsxr6TOGllV5+Z4KPa15E3YqIgfZN7Sk978cltC0K+zwd8ekR+l7LIMiIx04s
 24nooRqo0KwQeEs+nBP+PTlhbSk8zDFoycm16N/x6MO4t0EAzokGybes179h4aH3NPXZleTW4Gf
 TOxyX7O2Qb3BbnSzKpFe+oo/XSPOgsj9BGrXysSe5K58Awugdym6pRNsLrlPyl9FtsxcztClXnB
 eLNLvg8DBkHqNrpQsWkZvoadnyeh77LLadnM/fUNT5t2xMpgKfPow9Tqh3XS+QklHgDsfI3eAZo
 rxVL9TnxjJWBcIoFQJzyUnaYRiubWDnhb2ZlkCop6LoOsrsH76KB+fwgFqChul45sfCI8EKdvde
 jzChB9v9iUYpwk/q0Qg==
X-Authority-Analysis: v=2.4 cv=E6v9Y6dl c=1 sm=1 tr=0 ts=6a191773 cx=c_pps
 a=y599upwrfiZ3HV94zaFOUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=VwQbUJbxAAAA:8
 a=eVWW7Qq_llWBhZyPi68A:9 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237739

Fix the following build failure

probes/../../include/lttng/tracepoint-event-impl.h:133:6: error: conflicting
types for 'trace_hrtimer_start'; have 'void(struct hrtimer *, enum hrtimer_mode)'
  133 | void trace_##_name(_proto);
      |      ^~~~~~

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ++++++++++++++++++
 .../lttng/lttng-modules_2.14.4.bb             |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
new file mode 100644
index 0000000000..a6fe47737e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
@@ -0,0 +1,103 @@
+From b77f94c7a7109e70a97bf936b72d66d611187d61 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 25 May 2026 10:38:18 -0400
+Subject: [PATCH] fix: hrtimer: Reduce trace noise in hrtimer_start() (v7.1)
+
+See upstream commit:
+
+  commit f2e388a019e4cf83a15883a3d1f1384298e9a6aa
+  Author: Thomas Gleixner <tglx@kernel.org>
+  Date:   Tue Feb 24 17:36:59 2026 +0100
+
+    hrtimer: Reduce trace noise in hrtimer_start()
+
+    hrtimer_start() when invoked with an already armed timer traces like:
+
+     <comm>-..   [032] d.h2. 5.002263: hrtimer_cancel: hrtimer= ....
+     <comm>-..   [032] d.h1. 5.002263: hrtimer_start: hrtimer= ....
+
+    Which is incorrect as the timer doesn't get canceled. Just the expiry time
+    changes. The internal dequeue operation which is required for that is not
+    really interesting for trace analysis. But it makes it tedious to keep real
+    cancellations and the above case apart.
+
+    Remove the cancel tracing in hrtimer_start() and add a 'was_armed'
+    indicator to the hrtimer start tracepoint, which clearly indicates what the
+    state of the hrtimer is when hrtimer_start() is invoked:
+
+    <comm>-..   [032] d.h1. 6.200103: hrtimer_start: hrtimer= .... was_armed=0
+     <comm>-..   [032] d.h1. 6.200558: hrtimer_start: hrtimer= .... was_armed=1
+
+Change-Id: I37ee0ae0af665a51fd4f92adffb6b1dcb2ecd9d2
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/b77f94c7a7109e70a97bf936b72d66d611187d61]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ include/instrumentation/events/timer.h | 39 ++++++++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/include/instrumentation/events/timer.h b/include/instrumentation/events/timer.h
+index f69e069b..dfc295e0 100644
+--- a/include/instrumentation/events/timer.h
++++ b/include/instrumentation/events/timer.h
+@@ -220,12 +220,43 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_init,
+ 	)
+ )
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,1,0) || \
++	LTTNG_KERNEL_RANGE(7,0,10, 7,1,0) || \
++	LTTNG_KERNEL_RANGE(6,18,33, 6,19,0) || \
++	LTTNG_KERNEL_RANGE(6,12,91, 6,13,0) || \
++	LTTNG_KERNEL_RANGE(6,6,141, 6,7,0))
+ /**
+  * hrtimer_start - called when the hrtimer is started
+- * @timer: pointer to struct hrtimer
++ * @hrtimer:	pointer to struct hrtimer
++ * @mode:	the hrtimers mode
++ * @was_armed:	Was armed when hrtimer_start*() was invoked
+  */
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
++LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
++
++	timer_hrtimer_start,
++
++	TP_PROTO(struct hrtimer *hrtimer, enum hrtimer_mode mode, bool was_armed),
++
++	TP_ARGS(hrtimer, mode, was_armed),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, hrtimer, hrtimer)
++		ctf_integer_hex(void *, function, hrtimer->function)
++		ctf_integer(s64, expires,
++			lttng_ktime_get_tv64(hrtimer_get_expires(hrtimer)))
++		ctf_integer(s64, softexpires,
++			lttng_ktime_get_tv64(hrtimer_get_softexpires(hrtimer)))
++		ctf_enum(hrtimer_mode, unsigned int, mode, mode)
++		ctf_integer(bool, was_armed, was_armed)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,16,0) || \
+ 	LTTNG_RT_KERNEL_RANGE(4,14,0,0, 4,15,0,0))
++/**
++ * hrtimer_start - called when the hrtimer is started
++ * @hrtimer:	pointer to struct hrtimer
++ * @mode:	the hrtimers mode
++ */
+ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 
+ 	timer_hrtimer_start,
+@@ -245,6 +276,10 @@ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 	)
+ )
+ #else
++/**
++ * hrtimer_start - called when the hrtimer is started
++ * @hrtimer: pointer to struct hrtimer
++ */
+ LTTNG_TRACEPOINT_EVENT_MAP(hrtimer_start,
+ 
+ 	timer_hrtimer_start,
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
index 722b1ac5dd..b2c697d365 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                    file://0001-fix-adjust-range-in-btrfs-probe-for-v6.18.14.patch \
+                   file://0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch \
                 "
 SRC_URI[sha256sum] = "63deefbc15d9ce7c43d858187533367b01dcb6e8469d6b69ccb757d6d3dbb0ad"
 
-- 
2.34.1


