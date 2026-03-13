Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE59107BCC3
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19264.1773417605839492483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pKX3awpG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAudrs2320885
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfw1PAEge+LqXWLFfqG+XuKxhc0Ctiy5Fq1+bNUpPzI=; b=
	pKX3awpG3U1i4hK+I5X6/kVQk7h2RzRHFqItwUAQrmtf0VPeGII/skOn4M99/L3o
	ShkN7JZAFVWKro+WQlz/Gv9gP2kfCyPiPCMP5FdC/xyADGTiX7rQ3E5pTmQB9vKs
	jupbO0Fo2vkFEnLEQkglk83GoNJ1MfLxhsjjM44z2ATs0jM50YjlYzNh2FuDUwmy
	2ht1JYLSfpKR9tvyFzDAA5MWBqfALQgJ2UX3Fff6vj4riWLTUuhC1gf7QvYTCoq4
	kaxsdkQ3iDGwWkGL34eCg7kaYVPHxdYmTG6cL8voIeIeAVsChonHvo1Vu4D5X8f/
	bO5yQeCBN7igD/49AVJFLw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78jbc6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 16:00:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxPVeliVG3cWP/r3FMUZn94hey3YfheFiXeI7CBw3Munwcd7wwskCp83vGbbSv9omNU2c81sI7K/lcUKw0rYmWBpE+PeFxvnLnKfazjEZ8BYfYNCHP5DlbXx7TxgM1bUJ3tcliIk0qnWpxBF3FnuVIZo3RH/o0OE0+eppouYHcj3tK28FsgTzTorbCAaDjY5P7dUiEkH33Il1tPgeFX9oywT4Kx36sxPN0J8Vvtx5MtWU3wI/hJmKVwG7hgjM9FKDpvb3L9UiMuty3Us3w8or+cFI+xjoXenC+UZokB6QjBdqoYgauqL9Ifoh2AGdb/gYuG6H8yFT5F6Ob5J7ORyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfw1PAEge+LqXWLFfqG+XuKxhc0Ctiy5Fq1+bNUpPzI=;
 b=Q0/jICFj+FWNjkJoeSR2QaZpKypp2F7EiFtiV2b0FKA87L2eQBjPKvT0f6IXG0aVw+d/YeFILztScynkAj7p84b1CDlWD/5duQ1/3Q5X7z3Dpk9KBIV1IuWWOgWWML6wbUNwN0QqmmRQV+YUJNVXJUZUpb0chNkD0TBY39zw0fufi36kqMjHiPugy9JhmSG5JqmaoyJvLfn/7K7o56zdSfBwJNPhwqw7i+R+GVEsnhvs7dQaPjz3rb9NlWY2vxT0gIQ0+ujLsJg1ozKTMRCvoL3u25rv/0Ybi7DUy8WG8/UXeYYxwONn146AJa2Erj6iIRCHcHd35DzVwC3ohL8JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 16:00:02 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 16:00:02 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 09/14] selftest/cases/runtime_test: Add test for Linux Rust sample
Date: Fri, 13 Mar 2026 08:59:15 -0700
Message-ID: <20260313155920.2347101-10-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b311483-972f-43ff-c791-08de811995a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	8aT+qvgCLzJT2kk4Pi1pANPUbHS6E5WHrY3G7t4OSoJDC39xSIlRIKANLVTQEPL234A/SF9dfVRpUH8znc43IEcC+qrRutjQzVNb6XVV3XKuaBlpJDfBtKJeLJvCzJb4VBmyaGhsU7Nf6tiYHYXOgnmDZCJ+SLfvNyPlMl9LW5SOIpyCj37769oe9aawdyAXC0nJRrXykrXL3Mk+EKCp8FztOl2x2j0kgHYzkq8OLDT9KIlNz22Negd+xgiAYeKRFU5D0m4dK4iKW6iPW/YfcCcJLOU96KueVsBwcrZk48Dk7jqwto3aAm5M2ZY4Vvhvh7ZcuQ6UDuV8j2mH8VvNpa6V2CqmdGTSiETiFwzjxGZISnTu+xnRRpHLsJdu7QwePP3wpneqUu0siLTB/JKLCskK0if7qRQdoWnwtgzxH8P4Kz1hoxQ+7/5ZyqOCGJOhHawtsM5WgRVR6SwBsBCx28hbTqpv47lmcAPq/tA816hm7YaPv4RY1DWBaqQ4uT1r2ow7e+L+W2HmK1J+P4YDw8B7E5af7FTzUG6I+ZM+f/qn/LF13Fzg/zhRpDpQCW+8y96lc81v/m/TxNkZR2MXYSSq08SkZkeqvOQBf/B8wR9apwecPbDwb6v/bj5Jz1queSTtmW9IyqyvzczCPOKmNoHeIynLxXl+mXnGbaMy/GV7QfQt7G6aLTuJ94zmtp/p/oNyAHVz7PSmEgnBK3exmWh4XywLE+a9ezQCbEu7lQfsSqClr5CqeK8UfgZikP5/nTUXPoRVWD/rdc7/q0Rnnh6n3qZqyNcoPlr4SaiJAOg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rBjfp8ChzB/Qe2uOVTknqHmYQglg9Zbqd4qkHsDi6dyR8tHXkF2rXge996Z3?=
 =?us-ascii?Q?F7nxDh0IB2jFEEbrRSrPPT5QLGkNabEQ6ubgzgmViJZHg5yG4Lh8SR547nRX?=
 =?us-ascii?Q?mOL4NDVGtPYfU+luQQG5WV7JftLZLPdNoSgnaWERIeqOyOwz6eeLMZf3Oghs?=
 =?us-ascii?Q?7FgX7vsMCODcCUNqizfsvNpo4zLHuuCA/wr52JV+HWnF3oXvOvmdPb0MrD19?=
 =?us-ascii?Q?Ooy0Y1O7KVPZcCRZIuauGqmuQv8VsPc9sW0NNi1kJzNqrjgevDm9KDtBL4ql?=
 =?us-ascii?Q?xr5moNAFU7mZ4ktd9A11fz/5+ZqOAcyYvB0pRv6nKbIBtonwk5ieMg99I5sY?=
 =?us-ascii?Q?tIakFKH2mBRLq5R3e21QEBajjjqYbofeU3GT0toxanBxAuugVgfZnKs6wXme?=
 =?us-ascii?Q?eSxekgOYsPjVsZjQW8MtZJu+7zTE9FXQPPJfymnYcpHS9mm2ixegZuoHS+H0?=
 =?us-ascii?Q?mmrFCaZG5xMISWLpLPOYf/r6bvIvA7enj6TSHjLhac9LvNxj/5snHGGmxU9i?=
 =?us-ascii?Q?uhY0B8x1O5/i6+VP8ssr6o/WFlIg1BqMv2+1ykNdAclPG8TjENrxOWWjyVfm?=
 =?us-ascii?Q?5e0r0kqz+i4j7RNbo6CnKeAJw9t21tpAtKZivS5uVpisVKLHpX4hliyZNMtN?=
 =?us-ascii?Q?rjMO6lXj9bTOUmI4IYVMmH7ppf4NW4Ll9+h+MJ6+Uxou6tduY2y9d9DkWQPi?=
 =?us-ascii?Q?OCjyZ3JjsVMU7IBPehU/zTglcqMSv1bjA9S+HxFGpv91hcPCfhJUU7dSWIwa?=
 =?us-ascii?Q?fxq7tzH5KWkdxu7bElFcnINv2MuTf9PWwAezUasPfYHZ4rHR7sXPw/VUeSrM?=
 =?us-ascii?Q?20RpoAQq5pOriC5/Au/5V1vrvHEioWN6lb6jpggan9D4gzaxDr5+ANgQBA36?=
 =?us-ascii?Q?Z8u8pvZFqx1R7AZuGEOO2G/SEwi1HGPc3kY3wCCap2K8c5xI5it6PPVydqOT?=
 =?us-ascii?Q?NzUr6Gd5nEovaXLOjVeowQ+Tz+t5XJyBck6aG7BR2rvr6U5qZvWdzOcTSOeF?=
 =?us-ascii?Q?lkquvHNdIINInbtoQDqmXqJHx8xw2EhxnZLGuy5cXHR18BVbYhwIW87T9MfK?=
 =?us-ascii?Q?VQNEP7DxtGotiTtXEoVMRqd9QSWsf/R7VYxkHFKOplN0Sp0pgjyIKYlrsDb8?=
 =?us-ascii?Q?VWzhV3rND6N5K88tpyhQ1LdB24YyPljDmyr5VPjipJfQAqH5RgexS2YShr4U?=
 =?us-ascii?Q?8JFYsmD+hXePcsfMqDDN0hmb8r/w0z4oUh5QPRW01ztrZhMnec0aEaYbK1eX?=
 =?us-ascii?Q?CkhbuCTQc/tboYZPEortLbOoEo5Q/H65bzbbfau6SBc3Yo6eUuRlgElTr5v9?=
 =?us-ascii?Q?Xwfld9NU0rrlQ54126JCq95WphFxGfkq50sSUcyz7WQzNtudu14PSZvsgbhc?=
 =?us-ascii?Q?jOh5tuA1xHZ5CoQinYjv+/89pDOSN735dg4t6IjzzPeU0SG2NVY5NKKUsKT/?=
 =?us-ascii?Q?SPbbCF4BXA3Fz7SciLQu7ZvX8zZ/rYnr/bO4oKrjiTMknvpaj/dSZDPYz73T?=
 =?us-ascii?Q?3f6cp/6J8zW4lGeg1favNJAKiYBJoGs2xYjqpEOSG6uUUJ1wbtSsPPSfNiiy?=
 =?us-ascii?Q?49KNiyvxTxxsvAFF+m+HGhuQF/QzBVTjXAIoWAaAT/Ok7XY9r5r+rxuDpsvo?=
 =?us-ascii?Q?HGAQc+D4E3HH/m47pxfrqz4A7Q2KOh3E7jCqXSURK3FTSggyQb+98NoeNFmt?=
 =?us-ascii?Q?shaMWtS6ymm7JMwyYzVVnjrrv3skF5is1NTJtbifL96nYpgWYg1+aSI7OoGb?=
 =?us-ascii?Q?lVJTJKobZKEiCur4DE9fLfU3yfsjVYM=3D?=
X-Exchange-RoutingPolicyChecked: 
	d4MbC+56ktm1aQLlFqdptFPuAH3cREkQmizDyKkFpbmBdqdcVf9e1ja7PeIJS6koANq6llPWB4jKywfJtBPVnx/+uRR5DATp7ELmCYxX8oNwzmNDgps486EwgQCFRx4dkWLvn5ZXHA0xkOHC1zXUeeFRnDzLryP6UABx7cdz8qa6uMsyn99V39NcjnydGGE1Oe40E2RFLsYyZ0Wxclp8AfqTjoVlHVU/YIPDMS5/XmCydxy++hjTVyz5V5NR/41y6QOOQ+RBk1O7Mfxk2+FrzE14qluH3fQz9aCFGzDFkrtWK46UyThu+5hG3XL2iuG8qJ6CgHbPu4oDtPwijRWizQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b311483-972f-43ff-c791-08de811995a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:00:02.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KH3j0ejYlfcVlut4yfzVhC2u4GvmN1k23GtZA5cpiRptW6NNGKN/4WNIDXpJtq72Xo3BeqqxmoLa/Pmgtrqg04VHivi4xI8mN7cYbpVicmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b43484 cx=c_pps
 a=O5ql0vl6PVxeYGQXc+vjrA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=p_vdLtrgfc09iYJXKugA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX33lX891xSa6V
 fDXvW/oEpBEvHW+3E2qPEs2zGK68dr/Nre5xGARLIr/wV77gLdLattLEbAl2zDRBuBaIA+754ez
 /yyt9KKPHUF49BQbRH/toqki9/QUu+h3lN7/mUezPCk6cIIG/xZoO/0GhGbiTmaKRhxbGP4A0NM
 M/Vn5fsZlf3J2mJK8fJ67nh99172O/oazUUD9ExUfFf7bUXAKDc57gQwRJ94I/wNK1MW7GjZI0E
 9qO2bf+wtWodUK7gQ496p4vwZmPvktITvVrXcL+8TvPjyo+YsHOXGT8DMluwInmbdpzzaO68K1t
 VQznxIXVwlUijURA3odbFmTTaE1DBlU4IT9edyOxaTShSW0YAJ6wHowBnnlOkE28Ly1zJ+Zxx0r
 Jc6sKUpNyuvW8lJg14CPtpmTrr4bUZqKNTpdmyhmUV2BT+c6HCeYINEIULqmzSp6acSSOqHYZmo
 +D7gLylcZ2IzD6ytXNQ==
X-Proofpoint-ORIG-GUID: XmgDVRv4EZSKslP45ZCneddf9uEBWXy8
X-Proofpoint-GUID: ux8i8PROUC67PfF-ppzQlDxP3a2Rb0hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233056

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust_mininal sample inside the kernel source
tree is buildable and works properly: check that the module can be
loaded and that it prints correctly.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 22b1048838..46d4e99207 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -489,3 +489,30 @@ IMAGE_INSTALL:append = " systemtap-runtime"
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
+@OETestTag("runqemu")
+class RustKernel(OESelftestTestCase):
+        @classmethod
+        def setUpClass(cls):
+            super(RustKernel, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def test_kernel_rust_sample(self):
+            import textwrap
+            self.write_config(textwrap.dedent("""
+                KERNEL_FEATURES += "rust"
+                KERNEL_EXTRA_FEATURES:append = " features/kernel-sample/kernel-rust-sample.scc"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+            """))
+            bitbake(self.image)
+
+            with runqemu(self.image, runqemuparams = "nographic") as qemu:
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_minimal")
+                #Disable status check due to intermittent failures on armhost/qemuarm64.
+                #The module loads successfully, but qemu.run_serial() occasionally
+                #returns an incorrect status.
+                #Bug report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189
+                #self.assertEqual(status, 1, "Loading rust_minimal module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
-- 
2.49.0


