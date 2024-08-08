Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEA7C52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 14:51:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.61944.1723128672982660482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 07:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=895026df3f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478CrS9s019869
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 07:51:12 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c91px4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 07:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlm6ariOOj/HdSEG4kgkssYj7iUgXSTC2x8XcRwyUxEls14SwC0e0NUhzI+8SqSrXj89EZnq+KQaJT1tJLuSeyyzSPmNWR8Sq6Sih3Ma0CHEri7H4LrQ0OB48AFNnJvheYv6CXhinb7RlohmptkgUuPR1Tk+YgCC4A9AVKc5NO19kY0A8/rsW7/xciqnTK39lv2XlOGoMFv6KiCABUu0WGE/mLGvf55WwNN4pf8Z4bskwpOGz3QCqdmEYk/8o56j6t61bJueRUIG4E12SrBn6RxGM76sqe/qDR3w8MSII0pR8yispq3Zrqj9uqXEfbRfTjgg0/vUplYCcuw/MS6nMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2uPjOmuevUR5hTb6xsiTP3/BySF1BiM9qD8ARrw5RQ=;
 b=qVMY/kA4o7//4wT+F4KQwbR9K0b6Da122IYY9/Mk4sk9dnBGnd6NBbRMY1eyREXhDarOgz7sK+v4fA9fxrjT3ET7hiq9B3SKzSaN4D6LhSblPMQ9P23U23IrnsRvX3HSa+b/Cvo3OEI4lEV1YUD4XczuQ1hIBnRgj+REKE+lI6eIgKBt4U229K+0Ardu0nHjCppxhBzM4B65vHv6jBXxL5liR08GaDYFx7kfhBRE70kTzF2tS9yosNb0FEqpQdFYSswzdT8zjW9UTU47hv4WIJ+WeOCJZmEFev7CVWzU/ZpOjd7D6cHlo01ylMe8xV39zteqTwYyAsbQ7Z9rlJHZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 14:51:09 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 14:51:09 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/4] gcc-runtime: enabling "network" task specific flag
Date: Thu,  8 Aug 2024 07:50:39 -0700
Message-ID: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN0PR11MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 69faa5b0-8a74-4765-0e4e-08dcb7b98a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pnIp45bCA0ABDd+6XBHHwdlTBK3izBFXUrOioYp3ZzurmiIqk0Yl82O0kw4A?=
 =?us-ascii?Q?WXJ+eJmlhHUXArSN8xm8TtH6s13YUIv/GrtelbTmqmhUh1NrJQA9fiEqI3sT?=
 =?us-ascii?Q?szRbxMHxS/sDsDx1ZL05Y2b3w6VIaHaJP2CauFP0ZvHBf9iWUeaeqzVFFtiT?=
 =?us-ascii?Q?s1TGPXXrZH//b/nAw3+XogahGqdJtnyxhTNVbAxTYg7czVt5rlPHC5LKnwDV?=
 =?us-ascii?Q?cpHQBn/HoDyB3P5eeQO/72ipRN1hm5eX6yt9FAV8UXsvIJuINqGrf+vLyVNf?=
 =?us-ascii?Q?2FzOe0CGgYx/zuK9REzagrD7ZvuVdG1V3M2ZvJNQ7K9mt7yftIPPTCZ6llqN?=
 =?us-ascii?Q?2jFJ4Rca3Q2IBrDURX3K6d4haffguhG+KBX0Z/3w5mPoz360kq0/WiNBAvTK?=
 =?us-ascii?Q?n61fuehPM8w87jS+jyvVsWoWlrCQvEYEhE5/oKMXD16Zq2vXDblyQacCBu7+?=
 =?us-ascii?Q?U4D0ixaez2qst5fowR6nIg9Y3os5b2X9wc2h9n8HTyszWZQ5rcu03BQRCL1R?=
 =?us-ascii?Q?OZJvhVH5MCAZb0t+Ga/Hga9x/iJh1xqs0IyaPV0311zFfPv5qIVDPLr7o7Z1?=
 =?us-ascii?Q?KySX/zKKZ+VvubKYed2cz96cjLLwc4DZxOplVnMS6tcKVWf+usrn+jb9vD+Z?=
 =?us-ascii?Q?Fxr8p/3ONTfTzuzoPQ5iq1lATguEyl4O2oMeZhFO4KAQsJHl6hnOV0HJ9oQx?=
 =?us-ascii?Q?MnTJOEJ50q1CX7uvDnHPlgcc5Nt9qE0nYzxBytXOyUDrZ0vmOeM8Foq9r7mM?=
 =?us-ascii?Q?StkX8Y3Pz+S1KTg9UOSFsxXKF0Y3bA2zirhUCtnpj8qhnV6hfesXKof7xzEj?=
 =?us-ascii?Q?qePQc3nPxwpux9QSEyP0nxGNWH/wE59DbP3syWUZLdSkyMh/KRbX+sHYNFgc?=
 =?us-ascii?Q?5aYlrk/wHvgWt21ium1iCpemFFaeTo3BcLlguLB6w8kPRjkI6wbkjpySuaWD?=
 =?us-ascii?Q?SMyPSHV8hebC/LCuGneWYosKFcx6WKGGGUFHhBrcQFq+dKge1Q4UX6e+vJSe?=
 =?us-ascii?Q?Zc5x2K6cmPgykgpIiW7aHr+EABkLaYPQfCkfELmAJPMr7dqGJ10CmPR5YI1Y?=
 =?us-ascii?Q?raCjcbD90vn7/Iya2fPrEASzmnObq/huPTg9QCqMh7FThJ7HrttQi31rYyeV?=
 =?us-ascii?Q?DVMg3GRrHawRfxyrgHWpR79FZPqqSnGatIx7zcXw02tJP7MEZd4LqsmTWgL+?=
 =?us-ascii?Q?3kh0AHFJogBFkqA8ifHXPWw8yDQ/yOgqxh147KNAsvsNGcXVyugOlXo8ovHE?=
 =?us-ascii?Q?kcgjnnu6eyOiFKy0wYEdcEtFdJUSreYC/+N9BS+nfgl9MVMCw0+q9YDSh076?=
 =?us-ascii?Q?c1W0TLJ6PvbmAn3PvCMaL+iBu1yOFp5wxUYTitMP2mN4JYhpnVnVFSAyB1xc?=
 =?us-ascii?Q?Zb8oq9qm2JN2JGSCc4JCf9WW/i4Aeok+ZScNzLgVqoN2N2G/kw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xbkt8Z1fk38qF8nu2rMrWZR44vRvSc9b/bxKwVPUaiT6TqkT14yoTpCB/mOO?=
 =?us-ascii?Q?zRNCcikhrp27U3n/FR9czgF4NrS+DVPpuEjOCXGowPWycpUSrEIxakYuQGkp?=
 =?us-ascii?Q?z56uMo5sCnoAcr1HsXzRuWy0rlqe127AmKyxxrFtbPuUWsjylaFwoZKVDQ8A?=
 =?us-ascii?Q?LT/r3BICjUHsqvpnAkpA8ZvPpjwhr0q4kFh4ju+gFc7cwreto7/4lBlPkcXG?=
 =?us-ascii?Q?VhkHnM4DzIa3LWQkRwyh+EXf280XjGc0cLTX+AT/JESyxOrBg3O0xJdVESIS?=
 =?us-ascii?Q?KPfauc/5/JF4GGJuCeO42ryjdaTrhi1iSYqt7/HUpYmUnVe0iZQqQFky04FA?=
 =?us-ascii?Q?l1CX6131YIYa5yQU0S0cQzJSHNAP4fPl5JLnf3UWOibbIDIsbNHMT8MwA0NX?=
 =?us-ascii?Q?Ic35zoiYhmwP90jAhCHgbTnN1yXjA4sn2oEXutsK1yYZSAANisBy8scKyE7S?=
 =?us-ascii?Q?zjDg35RSYa7DFbMyqLMXMb0p39pc6mXZDrRdQ+EptS5olixy4hoh7lngEQKd?=
 =?us-ascii?Q?9J1maF4hQk7BjAARiCrRd4RxhqcTBcxznif91SOlF8jxr30e77t7xIvquHdd?=
 =?us-ascii?Q?4/QGb8KN8ORswKkEw6R/2OcSWk8ivt7KEVO9rBq5PFIwGsK4b1xza8xzvs/e?=
 =?us-ascii?Q?MOKwO99Dn5jF1XcQ/9BgDSXskoK1svrMz/BAaI8IyoqnRONJ95lXSDw13OJ1?=
 =?us-ascii?Q?freJOwx6FcNjOyoY2SpBtFUzWmk6fCUrRzW0OoeYWnoqeCjGzutETnpp5lgm?=
 =?us-ascii?Q?mziePTt4jCdYtAQAXb7QTtwORvB3KlKIz/nxLy0Bb00K5LPTO+O7QKyflnTp?=
 =?us-ascii?Q?akKoAmOlGpm27TZVxEjA1oZCkIb4onZyXLoA9cRx6658/7fEVeJIMYiiltUm?=
 =?us-ascii?Q?E5AcLbewAOCvIttTayP+zEyFoTvWcEiUEu/0wGrpVRermAn+CAqa55P1cduK?=
 =?us-ascii?Q?5H8jbUFj+RLICLRk7wgPXTjUxqXotQ9WPeJ5MDpa67DHkFIOrNWQwEqYm76b?=
 =?us-ascii?Q?pyWCWlKKKS+L1v64Dt+WPzMqWduuAQ95DGEhJ7lobR0Q2s3A1SgoOvRDisP/?=
 =?us-ascii?Q?k8j56eGcAs6FMXl4l3L/UXl7JxatCi0yQEhwQ2Gch6St9vkmG0Z2BbJyxOIv?=
 =?us-ascii?Q?Qo0+elso6wAwyzQQwwE36Jo9mYsRDWvHqyNPelDoPD6EBUnPSb2Ymb5MAsDf?=
 =?us-ascii?Q?6Ou/qhAKPMohvcXXjmeYevvBPWkssqvFsFGL3dIWvLXB4uWDp4oHF/O3Uy8f?=
 =?us-ascii?Q?h5WO0cZbAy9JMbS8QmS47cKQcbyhcjQsgQiXEFp+wN+A23DzZlMbCbo6tcX8?=
 =?us-ascii?Q?l+gEmFCRJulQlahnReJgi8LgMtOwe1J8rQfHO/2Z6XiKAR+uu4isP+EU+/LX?=
 =?us-ascii?Q?3n3m7NDA+mv1EjDXO5eTgk3OVNprNrHd1WURHjr1KSFbPQfwVCCEPZKI2rB/?=
 =?us-ascii?Q?pLF32J7D90gou3s6Uk+xyqN1dth/JFCc3+qI7fKfEdbMZCCsgS5L8imMmKP1?=
 =?us-ascii?Q?BSgOGg+I5vktoHjRYX//JE9Q6safEtOaX4D2k3lvr9VBATfM0dvidZf+dQCM?=
 =?us-ascii?Q?ri8KWISTnU0v+/M+fZkrue+zDw425ODY++jwpCDqCB2X/LFUSexrLfzpXS/m?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69faa5b0-8a74-4765-0e4e-08dcb7b98a17
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 14:51:09.5178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SN9bOpAHsytp/Ni2nNZicsugUN5yIBthoaOFwLP6R3gdHbEOztxqiD/uaowM37OYz7FKVuQypLhG42/TGPhYcDtJ312GUH/qHjOSJPfSmDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
X-Proofpoint-ORIG-GUID: QWWgdadm48HhKfi4JPXr-w-7R5mGexWX
X-Proofpoint-GUID: QWWgdadm48HhKfi4JPXr-w-7R5mGexWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203139

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Adding a "network" task specific flag which then triggers networking to
be enabled for this task, it is otherwise disabled which will cause
failures while running oe-selftest.

Fixes the following issues while running oe-selftest for gcc:
1)ssh: connect to host X.X.X.X port 22: Network is unreachable.
2)Bad owner or permissions on /etc/ssh/ssh_config.d/50-redhat.conf.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 8e0d1a6889..7afe34ebed 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -292,6 +292,7 @@ do_check[prefuncs] += "extend_recipe_sysroot"
 do_check[prefuncs] += "check_prepare"
 do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
 do_check[nostamp] = "1"
+do_check[network] = "1"
 do_check() {
     export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
 
-- 
2.43.0


