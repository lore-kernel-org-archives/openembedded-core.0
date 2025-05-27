Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595CEC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 12:13:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50364.1748348019651090134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 05:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=724287ab7c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RASGii026717
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 12:13:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5392kh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 12:13:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfxX4Fo8VDtkTtO9HpENJAg+wJYnEDFzBw9hBgX51XHsF1YB4h6cKg8hV4nay7M8mv5dg2GgJ9Y+cePmuVtLt6+SY38bwDXLdXPE1xx9N0V82VAJQhsO1F64Ep4WiJc9jh9XNy8q1rPHcDvXDAGSSfbTYSMW0Nhg2ofiGudvoVrg+o1UaWBlKAstwi6B1gGgNKow15yMsYNdSB7rae4Ka7T7gITnoH/73f1R2aThTvldmaLF4+stWK9su/54BhV7LqdUAUI9tsTEkcnQVxhhy01VzNlHGxVMRbkfmD3nvxfG20SV3oMZc8rAUx8Hfj8XXscwDjGB99ETa7CbpFxIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3LbAvHO/tQSZxIE9OanbOxl4nlb364beMzf/UOI9nE=;
 b=Nml3pvCMKA4noWxSx/3YgwpFTKsj2agwNMaxcYTxj5Oz4l9vmzesT0tFdb/sqj7MFWgtRo1ucy9RR7GWdp4Rt+dBnZ3RYI04e6bnLyOJN7htpTZ2zcm5nw56NKXuDIg45kirECaWFkOBhphnc1YybX/JPWFKB4w9RWP2n2VmEn9gwjZ/BMGaws94U2pGkmoV6UY/mEG1Gij/s2niDMnUYc6aiFxJMLnxG+ySgzMeokExkperG2SvitK/qUzWthAS6/Opeg4riBsCZkGUZ5QhMCexQGHoPiuYxkw5vVIUfcg/94vtqF/S7LJ/9pXXfnVz/UNlU+zPwRnQC0uiEs30sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 12:13:33 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:13:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-1182
Date: Tue, 27 May 2025 05:13:24 -0700
Message-ID: <20250527121324.4189662-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: f26f1547-c41a-41f2-016b-08dd9d17e6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XUDrAmB3wpFr64Dpx+w+P+Y3ZsEVhWb1zn8QD3V18QvhROS45yoapJVt1vJu?=
 =?us-ascii?Q?wwJYP+csMnEekX7PouN8s4ad4kb8XuBcuXDSMZosT+v8WAjwnl6RwaVQkK6v?=
 =?us-ascii?Q?MeBZpDhnLY4gEspEDReI5kB6IxnDJd6qdkV0NlEQ//hTsForSrofjjuZ2t17?=
 =?us-ascii?Q?KY+rl3PIDMssRV16nm2CTC9puthFnSfFzcDmLhy5ev/6FkcrZvUE+NprhV4a?=
 =?us-ascii?Q?uOVLZbe7AbLv5d7zTPONli8dUbuZ9hgIbKJtpm2T5EJ3uSj8G5hcOcN0rxCL?=
 =?us-ascii?Q?Yt0YyoAys8NFvN30J9mBPBljG2Ighi3Z5iqxSYQFNjDkNHwf0dyyjT6E10cn?=
 =?us-ascii?Q?6h0AyyfJiOZfOO9CRaEyBxy5oylS1jdwGBa+fqlCmaRw5u79OCaTgctzvJEQ?=
 =?us-ascii?Q?WcE40kz/ykRmXmGIg4aTMxwr7bQIqf8hYu3UG5rHJ16W1Nig0OjUxbtvp8gc?=
 =?us-ascii?Q?+/jScS6B64pSP30rlid+F+1Q+bZJV9xUjgdzxQIzcDcJVid7SyqTxAjQot8O?=
 =?us-ascii?Q?i1LC/ZPtLLSMMO5R4JJxT4UZClRrMxu2YH67TwyfL+75BaUg+saUrTnyCbGS?=
 =?us-ascii?Q?+YIjDZiddn/yibKCW+i8IOkW76/qva3DZyVXIcGnZVSJ9IJUhgz5gulok3qT?=
 =?us-ascii?Q?5c0jyGFn8NfLWyztQ05G9QuZtR959JQv2Ow9P3A5QmLm6zQOd6v9a7NDtGjC?=
 =?us-ascii?Q?ZdKY4QUPX9SHPtzJCeC3GBMKJ/gxES+kIe9RkEfZd8A4LTJl8vMWY5rV9FJB?=
 =?us-ascii?Q?dkMTLuoC78As/ik6tJmVYfPwPS8yRUUFPXxox6YCByStzOn9tM4bjPBWN9Rd?=
 =?us-ascii?Q?27/EsBSU6RoTsGZHaMd3BdunJT33rq5UkRjVrwnjS2xlMXbu5JKQwG4L+pQZ?=
 =?us-ascii?Q?kUEFMtulAw8nloaeRa6c1n1jqlEEbM5RG1jla5kFldx8KUstb6X4gSS8c4ht?=
 =?us-ascii?Q?/ZFVR2f3RENZryFjU9c5ybLI7k+ZeL99/4NSw+R8PjZA6lOaoegrsp4mbvCB?=
 =?us-ascii?Q?72UsgIgUArPnmgfciQMOURiNYL/VLPlkI/uObBHZ5Ah8Oy8XliC/mHv1vRzB?=
 =?us-ascii?Q?h6aKN4rQxLpL6Ycpuk940lUtNny+W9CHEmIY3puBrmPeJSnhsA/IALiIfY5f?=
 =?us-ascii?Q?fgDkUC7BvExvE75+zPws79E+P6fk4kMDWhfbFem/ImrctOds/LcDv2r+qpM0?=
 =?us-ascii?Q?EEzA1K6jhR/urH5dwk6bNxSyHNnq1fxsugmWOpL31dsdloPghmo65LkyBt9+?=
 =?us-ascii?Q?WkEW8K5KxE7wigT2ezt2Iz6uqMXmifXb4TkipcjvUtNyVunHoUUZ06VJFpw6?=
 =?us-ascii?Q?9btb33pN9p/XSBCNlmaKYek880ef/n6aWGIgjid7KtFu5v1R/G4gDuCZP4n5?=
 =?us-ascii?Q?lItQF9Eu/gaDZIn/pwfKL9b/rufxqaCTStdWE37v9USFbn39d2k1oNosC53e?=
 =?us-ascii?Q?xNCnvS4O086+De4O1HQ9FiuXLaDNbvit//ZdTpX08kKuQmCTViUhYg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vtDejY2ywlEpqt01HF9u7NkJ+MP0t7iqoCVxu7RryFKEmniFWexSCl2fHFaV?=
 =?us-ascii?Q?mAY5fUIz2nw8R/r4F36FHp4nEHWZvBh+YicoIPYQCTSV92uWD13l/0RFUJuW?=
 =?us-ascii?Q?r71qwvFCHTfZUzgVkAhJwokKrutbitHX0AH/KrYIm41ZegzQfkBkkKRXPIMt?=
 =?us-ascii?Q?o1mrX3lh04zyA4JpLi6hPLKEwIp7aavqEEm/UtIaRh/3c2DjcNpIm5vFdBoF?=
 =?us-ascii?Q?i9T6pCBCgrBBgz7iKRMJIQCRDYnW/SwRvW+NaWELHKQBQYm9z+qVqgO9x4Ra?=
 =?us-ascii?Q?I8p+Y7Wa6b1TItKpqhkuJwrlvfXNAUKxUhqvgKqFrnTQ49HWvVlM9puvYCI2?=
 =?us-ascii?Q?Q9AJ3hiL8PuAlIiN/Ejq42F6wYBbg+H4/C++YFhhSx7pbF5HcWM/czdioC4o?=
 =?us-ascii?Q?pwAxMFAgnKrN+3DevA/A0DvOTkqlzEkp50KeMmcBxvG2ZRsnURQ48pS3gf0M?=
 =?us-ascii?Q?0TtG179tB2dxnyEjVWp5QUvv/oU4nwWdup5YZwJx6IuX1Blk2mlQjqPWuo2h?=
 =?us-ascii?Q?JU9bBOW7UZciTGSfXBrQkHzlhiWfxpdgqadxTcTVB827yDJ08BDd4q3u/n3B?=
 =?us-ascii?Q?XFy2GVEWZTMIACAbO18jdxzYrvFxu9dnMyq2HySViYsGUiW5PmeIveCktW4M?=
 =?us-ascii?Q?XhqoM7NWV17OtnfHmsH92aQpf0kSSCgKhve08An5clzkmQ2tgF5Irk25YTH7?=
 =?us-ascii?Q?Sc/tVpKhgInsPc+0+2RDo1NgRp4fpnGDLJhH1jgetBbEITGDvQAjycwmsUb0?=
 =?us-ascii?Q?HtWEjipRTzLX54gv4JweYkF/U1ZiPb7GfBpMU/86N87+DUu+mZKcJjHLsNUr?=
 =?us-ascii?Q?+cHfEvOPXz/cO3cpE1+Sunqnd4QBJ1/zLIP3refdr9XDEziRQ42xibkhX/Pa?=
 =?us-ascii?Q?QVsZdFhyKzsSLW5ScVboZh9PDJ0t20Hh3RN+KcImzt/5ah7h1PXVztHLf+J2?=
 =?us-ascii?Q?fKkwJwTO09aKg1BRlZk3zgTNDXYjXkLVB9KZBRt9e97QxNWBfmQ69RyEWfCD?=
 =?us-ascii?Q?rMvPq2b62XQflBlxT7CVjJV5CsXAu0QZtphVVJbWFkgPxErl5deMBjALhR00?=
 =?us-ascii?Q?5seyi6wXSiiv3J7R/BI+g7OkEIsXLVoZYairi+pIcqpIZFyXJuoyhVEMBr95?=
 =?us-ascii?Q?Ur4IDCDXfZBjin3EFgpz1wPgIXsOLbv57OB14jXdt6PqQd/lxCfkF9VBuOPZ?=
 =?us-ascii?Q?puNm7BRAwTM3JnVud135MspC2okqTeqgN3R7IndycGkjwzzbg4FFR4ZF2oB1?=
 =?us-ascii?Q?fQzqeyPPxmmZ3I0vLc/BH0uAW8eVnsJowxH6ync0toxwCZi3kg2sb/6Gg4Od?=
 =?us-ascii?Q?cViFAhW5lVsuW634VSGJptTa97mpQKMWiEY37Hjj9fsaHahL/uQ6GRvrN0Wd?=
 =?us-ascii?Q?zJCZJfhGOoM1qhSgQhB4xzFMEWlDDWsSGcOW7GJ6kBsVXSKFecKUsnHb7xUm?=
 =?us-ascii?Q?gcSQOantJ5ri6Ne8EDPvU16JLGoPfB1Vd3wZmG2nyGi/euVHhikRUT3fSR7E?=
 =?us-ascii?Q?3pO3Z8u3GawvLmFQsNRsCVM9e4ZsIS34QfO5bLa1lKgDT4bK6OCML8VtOqGd?=
 =?us-ascii?Q?GQoJjn7v/55fHU74NsKiWEyI2/c5/RNmv6/ohNbxjqif80jGqM+xbgQFL/T2?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f26f1547-c41a-41f2-016b-08dd9d17e6aa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:13:33.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2w0sttdzSsKU7bLwh5mtlGX2cZQJq8qeCtsBDgdltzAqbi1UdJgwu0804i6T6xnynQgAOwtffJEV6cj1ffDS551KxmMnz1u6Zh5wVgqR9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5OSBTYWx0ZWRfX4bHTtCvmvaRK 2HWAL8x7SKgp4Y32WYBzlyXM0RryEZZrj8klIiKKwMkTYK/dyT7ug0mUGUsbPCkEPz+AuZ6l4ZB gSX6wUPdEctcEYvsh1oQWjtSHxp2tf0u3BwdUcxZeVxcfe+1YB18KnszZJVGMX0t8NsN5o5zR0p
 N3PWMTBymzxZdsYHwc0xQk5sMxwUZPQ+txJLBen3y6BDfJ+p5orRKDOrqvkM5xttgtUFCestKUP G+14B4HpTGPQqMuQWJX/xRN3tfwq+8Oos3J+RbgMVtMNBQM2RaafChKA2MRkUv7IRG8bBYexW0h Jyq0FY7ap7DXTsVuBzAFHOWgW8C/SG8hfhONed9SvKrhleFTu5QdwVAOgvpo6tA/kp7ULB0W2aE
 n2IgJNhPiWNX2w8MpoMs9PkMd5GNvVF5EsQ1dC9q31P3cK5cltlSdQIOCwFq+1foOqLg43BI
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6835ac72 cx=c_pps a=wbehbjfXV6i/z4r9WFT21Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Zh-gNNm_EQExXEDG6wgA:9 a=Crtr6NTttn0A:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CpPU5YuJg3jG8ULF7EecaynfoRVd57QC
X-Proofpoint-GUID: CpPU5YuJg3jG8ULF7EecaynfoRVd57QC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 12:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217300

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141415.html]
CVE: CVE-2025-1182

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/binutils/CVE-2025-1182.patch     | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 40a9a53310..7d1de61e10 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -37,5 +37,6 @@ SRC_URI = "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-CVE-2025-1178.patch \
      file://CVE-2025-1180.patch \
+     file://CVE-2025-1182.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
new file mode 100644
index 0000000000..4a3b6f072b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
@@ -0,0 +1,36 @@
+From 92bcd04fcd97f261ff40e9248e00a1dbebf3a536 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 27 May 2025 03:37:50 -0700
+Subject: [PATCH] Backport fix for PR 32644(CVE-2025-1182)
+
+Fix another illegal memory access triggered by corrupt ELF input files.
+
+PR 32644
+
+(cherry picked from commit:b425859021d17adf62f06fb904797cf8642986ad)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141415.html]
+CVE: CVE-2025-1182 
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 6346d7e2b4b..a0b237b2224 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -15084,6 +15084,10 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 	}
+       else
+ 	{
++	  if (r_symndx >= rcookie->locsymcount)
++	    /* This can happen with corrupt input.  */
++	    return false;
++
+ 	  /* It's not a relocation against a global symbol,
+ 	     but it could be a relocation against a local
+ 	     symbol for a discarded section.  */
+-- 
+2.49.0
+
-- 
2.49.0


