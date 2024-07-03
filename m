Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FB9C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 12:53:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50276.1720011195990965335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 05:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791485d243=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4635gvlp029123
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jul 2024 12:53:15 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402986bydh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 12:53:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6SHpJWW8TzNWPL6DO0+PfkbTA5hQbu9Xtv9GDLDZc6XIFv2AfCNPCUR5yGpUSfW/UExtmRUAulew9ItPLmqEv/yrhGMbxFzRANUak6zqdZpnahE59xWHmXOrDkdRiRGZ/fKmoVZ14ZpQh/NZyJXTEKVcN4f5ilXiGu7hfBuL8TOiSKLgJWNqCp41Az1j3webCp52bL3SDTh77VM0S2rN9WvrnOC5WZmUpyrtx65mG9Ypo3oaiSneK3sdGs8tsZw8VmBE1bUcF9QY9skfLFN4gctMx+uRmMabJJmhDcRbyLgsMBkf+E5tTv3htubPGyVsmezDWoLAetyhMgqDacaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhAyLd4btJGsN7lh4TdwGbXYMsZ+dMURTnAG81MMSNQ=;
 b=aUg/zGSDzWk6h7LhcyzccAD4EPxWnbGf+74uJtDljYdB9UDgaPg2pwq8yh8PYRdHlPuUYC+rqJJ2EcgNSiscgeGcHvthITNgsQzD3HtMnrxsVm+sQ2vPyCrPH8MoiwdZwOXiw2r6wExwV6RvjkPTJ7KxsurmhpcLdqzdICMs/BZsk63mx/J1NUro0n8sFC7azslLMXOroDteJLbtxCp25Uf5eE9L5MjSZnGN1hSr3SqSx79w/j1FUBfD3o0HAq2DBdtzP3MuYdNtYgOzHw/foz/Th5Gnu2aqsY4dhyXi6OCE9DcqwCe2exPFRkalGJdJr9DzxtlHMlKbrQG4pGS/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Wed, 3 Jul 2024 12:53:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 12:53:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH] linux: Modify kernel configuration to fix runqlat issue
Date: Wed,  3 Jul 2024 05:52:44 -0700
Message-ID: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 6978dfaa-ae82-4ce8-6341-08dc9b5f18a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LP88DIaNOnDg9WROrklM99rZEDGbvYK8RvxJfTsWV6aJGmx9leSRXPEjhN4M?=
 =?us-ascii?Q?KIiUd4WibNv4zEYrmytIb8rzZX4zqwJPV2RhxZuNRaTmkzyyCyzgxUdkH5RZ?=
 =?us-ascii?Q?oDXIkOrAVzJXfa0g0XMciM1IzUxfkIx7DlL+8FZTa7jwRRdcxbZHuQjdHIbY?=
 =?us-ascii?Q?02k/1SWlvg94f24srD5//EwVwfhP3eOSHIdugMy0uYrXCCRUHapIJCHmIc+a?=
 =?us-ascii?Q?YSsxCWSFTKLH+JpYHkP4MJVrAUbFHn08IlSXiOmNXu1SjhPBlvmyw8+u1LuQ?=
 =?us-ascii?Q?Kvq3HFGWZH9v+/1GPNBtgp1K+QCamam2zUMT7gpMoFcZrHiqYOZI5ts9GlLo?=
 =?us-ascii?Q?vkpmcWQfZ5j6nutH5uTTn6sSD8rB1VhKM+ZNh371TdYnIK4qEKmt2mb4g0eB?=
 =?us-ascii?Q?JXsa3FBPPgtnuoCs3Jlhr2WHHmfAhThmQhrUZSoHuKX+3LHtP1NW2q+NeVZL?=
 =?us-ascii?Q?H1YqKuKZ8lRgzs4QVTdzRO1jGF+EZwyXfnQlgbshadwSMiKbYYBiGLOb5wFY?=
 =?us-ascii?Q?5TqOhYcQYu73Ye7jx3XPCMUgN3G2jRUCzxnTxycHdWJofXXsr/1hi7CnWvx+?=
 =?us-ascii?Q?EuVIwUeeXE/wmvQLDpsL1spySOwBXaVB7j5yaMVIU9UiSIzRzU3Ap+MgYglB?=
 =?us-ascii?Q?bdxkQHt1NqiAKUt8CdzQqaFf9AV5BEUy9VMcGgfA5MlRDfoUy1ZQkWkpuvlk?=
 =?us-ascii?Q?I/c6mHgMqVEABEN7IjPmvFRdYRi6ZqYROjRpIg9RZznsYoVZY7GPsLECA/g5?=
 =?us-ascii?Q?eeijlSuxK9eRESyKlO1peadc3siy4SW2eP1qsOrkwEWfKl3NGKFR2UssUZvu?=
 =?us-ascii?Q?ezkCo0ihPWW0Kr/6pbiphyc2HHWC0fAXQ7nD0S6i93Tk6wWmJwYv2ilQ3OlT?=
 =?us-ascii?Q?9aXuAn1yhik+izkJjzxvRJB1uhdRftcJ79eZQ8lat2zCFWW4+sRE96FI/MGl?=
 =?us-ascii?Q?8fm81Iyo14Wxd82zLVVWubBtLZ3B3GyQKCH1pv2shntfYDQPgkwY5b94tBsS?=
 =?us-ascii?Q?1z2gKpzgNLDAojMLOYPpp4gPJdHaFdUJS4AwM90w+LJRvcvxOuU/jeDtkMqo?=
 =?us-ascii?Q?CIWhfGaS1OgvWTRzmjvO50ggipI3IzRN8qC7nuIGcyjr5SwGV06OxlB4U9b5?=
 =?us-ascii?Q?BzY/qwT9XmBjBAqJwB14keZpgsKlIRSuB5bB1WVyzmCcKP7kPi+RiiMD5MQ7?=
 =?us-ascii?Q?g8ng+i2agapWiZD2UYFkmiv5r8uI082opJ4KipTSLhmq8Igck9C29JVYFn8G?=
 =?us-ascii?Q?GxxkZAO97j1IJ/slGlFWBL0pgEeIkXBZ9aXMUYf62bP/u2nb/d4jV75KPTD0?=
 =?us-ascii?Q?QcImrW9V1UMBnZPEuy4JpKSRTSRTLoVMj9UKBOjLaERKxRjwsb2Yn+Ke2gxW?=
 =?us-ascii?Q?jo1VKp0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rt89m6a+K2YWnz13/Rj0Kb1LUJtWYP17cL/k5ovHsUg3tqUpBONLCUs8GJ0W?=
 =?us-ascii?Q?nxBcw9mZiJXx8ddB5FO34dOj23uQqyjz1F0ZSWEV3wvsAUsySlD+34yfg5Y8?=
 =?us-ascii?Q?q85svzTjE5Wr3f4/J3WOoESLQynBChNqPnI8t8yXL4TWoc5RBn98Gcq1xik5?=
 =?us-ascii?Q?37+/wSxggxps4jpreS8CYu2pIFJQPtgZYO7Ky5OEcLYKjCNxwI1P+O7UQwRE?=
 =?us-ascii?Q?lcJKhlRIYFxKMbGt4117MrzKB37WAUL6/ysnf3Zgm5uy4MYdgvdj2nJM9khm?=
 =?us-ascii?Q?TR2hGnHEW/lhBH0jGIARq6aBe20gqz+/TS7EXgXFpsLO/ejopZOgdKJNP7s/?=
 =?us-ascii?Q?kibXvaqVVIxR82khEisNEdjbdXlMQsZcUtLoG5JtMXmEhZmZq0Y++T672pCH?=
 =?us-ascii?Q?Fi6/ZNsrI0USmrg0K3DBnPfFzKggPbGwWiBInZuKIxRGew9Pgcvv+gPXwAxR?=
 =?us-ascii?Q?wRbN2rDIO6AmdmQjK38dZrihiUKP+OyZl/6vM61CZGN8PxBqj+PSDtvd+jt4?=
 =?us-ascii?Q?IoOfrqjCKvF3h5XrTYp8bsBvq5fJiuuhvIjfylSiT/ht9JyNwNtcV/ufH3fg?=
 =?us-ascii?Q?jBvoJQupZn/y2JeSZsn43+VXr+94ay2e2Xe/+gl8NvELQYHouHGVVYTcADqn?=
 =?us-ascii?Q?VRXc1LQYI+aoskv3IIrNCP2o8iFfX0LWJXVypFRoH/hp4I7AJ65JimFFHqDL?=
 =?us-ascii?Q?pGtpSrC14MFSp8ZyomRfey42fYWqch90lPHaOJJBjODR4NR+KFl4vN3Ehg2l?=
 =?us-ascii?Q?oY7xeD915rZmhdCv/oPO8rAW5swNwUa77XtvhBcoQnruVXwUFC2om/KNvhkj?=
 =?us-ascii?Q?LmwBkHdvfiuxwhM2rBo3mzd+IRvmKyVODNuncFsaQEFsAejn3OkSkiGaFlqA?=
 =?us-ascii?Q?m+mqX7HbZDBG/LreH8hINJ0L9eLuzJWGzI7C9wpotL0mSn+mhnhG9zxtbV7X?=
 =?us-ascii?Q?VnyoCvwLoa2hGUW/RhFJyrLi53DZhyki0c5+vRN1UTOrZnBzua9hODdVlbWo?=
 =?us-ascii?Q?7CFgzVvOVOCo5BtRpT2rnLwtHqrep+R48wjPUeellgRDfggW61SZmDDfOMiW?=
 =?us-ascii?Q?Bt7c60/anCRjla8OOiLbohumodm9i8M2a0qCCWaDXnLMkMbgjJvD32qbe+Lj?=
 =?us-ascii?Q?UtMoKR0r/1d3S0IYy2iIrxF+fslrrkm7cz8DKqAWKOR4gJG1/zs7zY2oniuB?=
 =?us-ascii?Q?+/fw1fIezwwdhv/8q5sJrp9nlkg8JnOxfd99DeEKA9mvJ4PR+27hOg4qx+Rm?=
 =?us-ascii?Q?AAml8lBc9P0JqAt2JitU5LfeNDcC2jlcE9jbd0k72s4xvJNU+vCt+sLGAsUL?=
 =?us-ascii?Q?COYiVYC0RzwL2LdMqkK2nGBgQwT6Kbhv85gZINekYXb2bAD2EJ92m+Ajd9BA?=
 =?us-ascii?Q?IjEsrMiRngqgZHmCwDn+Y14/s18cJxce+Yt5CrJPkcQ8I5uYruRX8x0NIitS?=
 =?us-ascii?Q?maEUKtW4AMjYvHqih7Vu2raCH+Y79RFTDWv3S4EfehlJwuFO1leX/D7tq4MJ?=
 =?us-ascii?Q?8QSb+Sbfipousqw5pz2z1rr5uNpcNrJLwVFNRuL54l2ao6Ahz+4Qca4bXdpA?=
 =?us-ascii?Q?P+tzWFL9eKNL7gEvyfZ8CPlLGy4YMIn/YQEXMlxLRk8q/VWQ0/yzzewG5Q+4?=
 =?us-ascii?Q?UFXzObPM/ut1U5VafATZxZY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6978dfaa-ae82-4ce8-6341-08dc9b5f18a0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 12:53:11.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9AgD/dYsBsHLwFJjbYcp3g96I7VO4WQ9rpL1/TlSCD6L23ij+pXi04ift7wFelSo2505hXBEap/WSO543i514sjHSEhI7NF9Ii3KoQTIGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
X-Proofpoint-GUID: Hzu9kYwfZru3T59mFhpwOdNCHOqybvQe
X-Proofpoint-ORIG-GUID: Hzu9kYwfZru3T59mFhpwOdNCHOqybvQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_08,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=932 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 12:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201473

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Running /usr/share/bcc/tools/runqlat 1 5 gives following error:-

libbpf: failed to find valid kernel BTF
/virtual/main.c:92:15: error: no member named 'state' in 'struct task_struct'
if (prev->state == TASK_RUNNING) {
~~~~ ^
1 error generated.

It is due to the modification of state to __state in latest kernels.

The following commit addressed the issue which checks whether the struct "task_struct" has __state or state
https://github.com/chenhengqi/bcc/commit/d3cf5dcecfaeb6d8d346e2228626a7dbe506ad38
The above patch requires enabling CONFIG_DEBUG_INFO_BTF in the kernel
and requires pahole.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc     | 3 ++-
 meta/recipes-kernel/linux/linux-yocto/cg2.cfg | 2 ++
 meta/recipes-kernel/linux/linux-yocto/cg2.scc | 1 +
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 2 ++
 4 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/cg2.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/cg2.scc

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 0132fcffb3..d6b4794d32 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -65,11 +65,12 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+DEPENDS += "pahole-native"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
 
-EXTRA_OEMAKE += '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAHOLE=false", d)}'
+EXTRA_OEMAKE += '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "", d)}'
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
diff --git a/meta/recipes-kernel/linux/linux-yocto/cg2.cfg b/meta/recipes-kernel/linux/linux-yocto/cg2.cfg
new file mode 100644
index 0000000000..7c60e87a1a
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/cg2.cfg
@@ -0,0 +1,2 @@
+CONFIG_IKHEADERS=y
+CONFIG_DEBUG_INFO_BTF=y
diff --git a/meta/recipes-kernel/linux/linux-yocto/cg2.scc b/meta/recipes-kernel/linux/linux-yocto/cg2.scc
new file mode 100644
index 0000000000..7047be85f7
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/cg2.scc
@@ -0,0 +1 @@
+kconf non-hardware cg2.cfg
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 62c0f0ab36..cba61aa2d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -72,3 +72,5 @@ KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
 
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
 
+SRC_URI += "file://cg2.scc"
+KERNEL_FEATURES += "cg2.scc"
-- 
2.43.0


