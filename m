Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37F3C3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 06:47:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43951.1744613263101613734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 23:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61992b229a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E6HvrZ015006
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 06:47:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1hr5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 06:47:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qszb3Cu72cDH/BopPZrweywBPe+t94bco0sjw8tmOauQHbmMemOr7cyN6nD8I/VA+nwazCrIM9HqDjBtiKbSN6FTARwr+UMlyFB7MU9WIVDNfcsmU5k7U9sojOpE8aj1RTDf3v/eJhQm/ed++kSSNXN7e0pRb2pUzlhGm3dc1FE+vrr0qyzgGbq0X/oCYgl7Se4Mf/3jQhrpBlpGhx6EyauDUTHdv5ATjwpFJY9V/hb8+sh51aQbjVz+T1rF8SXVuY/wTTYemZM9EpAtYQb7ofk9RrGucYbTlqy36z0cneRt0vcRbrfsRs2Oy5Wr43jlQaKF99ZhGpb7Te46EEWArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYywCbjXptJg9esv4QGRIARQ2HdJVsKyZwzVTbm30jI=;
 b=Lq+BEVjjN5B3KYiil663DNpbPayP/0KWl9DfEikjjGA9vXIS9udroRqzMvLVlqoGxaKR3d7ak86J5VxTp68bWB0aCc38TO6UtZg8DlEDvrwGNA1YLMOCnusxOWqA8Kx1PgBeO4a34S9I18OBS2tylCF9a6VKPWdlPriZL4iirHqQoXeAl+/zSQFp40ehX6u5P1qVST17zACdMLcHf1sxFvVmu6AqeipzfjfI2+A8VG0VFTPkrrL09aWyw81FvdZSpPfTB6rKQRiprdzg9177CGKvfQSTJsddjsVhwZkdxpVfCOguJ8jwgwNbRGHxcT53IbPLynSfQWpyxkL/ziqCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ5PPF867D7FF5E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 06:47:36 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 06:47:36 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH] glibc: Add single-threaded fast path to rand()
Date: Mon, 14 Apr 2025 14:47:20 +0800
Message-Id: <20250414064720.2676957-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Type: text/plain; charset=y
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: aadecbaa-e6d4-44c8-d58b-08dd7b203de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ynhr3SWepRTZ/Z4WdUm3emlp97fUpYvzA2uzpfFCtd6Qd65qPaa6p8F2XWu6?=
 =?us-ascii?Q?lthhMlllKu1ElbEEAA+oZYCx+35X4Bl8yRO1hKx/RgeiZyvscsOdsBkv6+Hg?=
 =?us-ascii?Q?oYesUs3U6u+GjrAX9scQ3AFqx0cb/bQUzjmxcObnuAg4/MvW9kMCeJce+1hM?=
 =?us-ascii?Q?moSuT8tmeQhb3n+pl0br+Dif9nBXK0qg6f9hjyot2EwjixV4stCX5ouibp9l?=
 =?us-ascii?Q?+YdURmTjyCqfjZLY/zwX8mmHBXalBR7mG0mBXGmgRiaBpMTzo7y8xDzAIw9t?=
 =?us-ascii?Q?V/cjv5XXzraEjxXCgc1yqS9EW6fj635AtmEGG3tCTKUjKFvxuBVmt6Kwl+zR?=
 =?us-ascii?Q?PnQcuPM9zCSfFEfmS4gk7TtBJyMD02n1hzJQ583WcaF2wH3DncwZHprBwdZN?=
 =?us-ascii?Q?dPD0cwJGW77qnzHSRbsef3TtcLXKkS6YHV3tnsarXPZ89IzP0PcKuNCbTcmv?=
 =?us-ascii?Q?uzigl1m5TWqWjhbXsqHsDdyRB+K/I2OF9T5Ls7EMtqqiO25GazBNaOKu2mnQ?=
 =?us-ascii?Q?uMvq6pujz88meeiXNT4lD+6ErTS3dLtkvss1W0ZszS1CS2MXQfMG7TjtZBWa?=
 =?us-ascii?Q?MYszfjuiBiGRnm8wuiklJNABtfRI6mcxy+oa59p7mI6jHmLVSa5sYJP7a3g+?=
 =?us-ascii?Q?iEUxKpXbkanB3AttFjEUL3azDDFb8wgEBRglc4SFiaa51+/AGD2HG82z+sBF?=
 =?us-ascii?Q?GT2VwR97ng5m1JX9t/sReQqqQzwAn5Exa28pUxUcGc/+VF6LJme/18puhTbT?=
 =?us-ascii?Q?9eL3Mn3sSwLFavl4CzivsePBcLvCnaRyqqAjlnnPaBDv1qrFgR5mZDVtsIyM?=
 =?us-ascii?Q?//mv6MAy/tQzH25LkQDXnT2WV0bx36zKJ/5u2ehzKoh9unUTOD0t5gGt2hQw?=
 =?us-ascii?Q?FB53ZXPtZIYst7h17vQ9SpAn3DWdpwdneSC7vvEa9+Nqi/vq9cn2Z/Q+SpNu?=
 =?us-ascii?Q?iKNuKTBORCXZit54DvxrVYlkY9htmIuuaac9Cv97/7EHPsDrd+nLLZ8QUBYa?=
 =?us-ascii?Q?4ZMoDu9OPjMWmu3p+7ackQg0K6LcnanDCF5UAYmSKEX91Ur+GZ6ztLXkQ3Eo?=
 =?us-ascii?Q?Z5CdSXvcvD7F0JDW6JgO51cWRxISyhv16fVix2nFa3++teaT4E1L5fmHSFeU?=
 =?us-ascii?Q?JgluZL+Axq2WQ+FgtPo/b48mtArgjyg4W9Rg2+m4GkVoL+uZfaM3/sfrYZkX?=
 =?us-ascii?Q?aDB9+dG/dFZwJGBsAYLKMq1cxAczTYL1oZJ7xZI4dWroOL3KnpPPhh85yEbt?=
 =?us-ascii?Q?P3EA4baNkbaClhLORTJmeYvlBsWXcYpmOuksEOkOSJ1PnLfYstQp73aA8st2?=
 =?us-ascii?Q?N9L42luinTER4GR4bBcs0/ACRpzViDSRejPDAc/hRCw3alZbIBwX+iGSiNi/?=
 =?us-ascii?Q?XKi4RxmezQEEBSEmj5D1qA4lLYr+csZ7ahTZHnhKtONCOBl1exZ7XXMRnPZV?=
 =?us-ascii?Q?4kCm2HfiViiWOB2B/KwLvq010021n2ra?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EqG345oi0H/HxY+b0p+mNsS1XDTkzLONdeV+rKzdJ9nkgyAKqArfyiyNbMWA?=
 =?us-ascii?Q?+FVJSuzESfTc4rzZqu7MEN1hPX21MDmleYM5N5I5bb4rmixqTh/kvDjR4rf1?=
 =?us-ascii?Q?oSe+46JcdQNWYwlj0ozFGdKB6X/DUe64SJrQfmIeKviPFomjKDSlugykqZOI?=
 =?us-ascii?Q?WpCtKIq9k6ATuycmCQ2j0fTiIuAtQ1WLm4x09sp/x7pVwY4AxORrD8yq6tH8?=
 =?us-ascii?Q?KYZJuptOmapWVv3WF/OCmI/4ncHVL1TdkNruE45drG4WCissY/Bubc1APhtU?=
 =?us-ascii?Q?R2/R1fjodgx4h+OkRCbk6//XxpsdoK/Yd6EDyYDDUJwnSldpnlYZFJUOI4LT?=
 =?us-ascii?Q?+ytPV2G59Qg/PV1GwErtUIdTr6MBqwQDznqym9bJoLp1ZiVG5cHBcPIWezAG?=
 =?us-ascii?Q?vFrIW1PfCmuziYzwFZY/Jsh/ysgCphP78CMWhu6kjnhSawywPaNwW2I4ipBs?=
 =?us-ascii?Q?azQPJc6qjo1L4kTk0qlI4FMnioRIYLfZG7RlDBlmy5wo0c5YUGkGV4wwrH4V?=
 =?us-ascii?Q?4uHS3I6hl3dc0kMEABQTdzHd+4x+e+NrOhRUhqGIRFF0WMFgxceNb3YOXtrF?=
 =?us-ascii?Q?zMsf7R7fDWFI4De4qxDT97CYad8d4CUgMBsxAzVvZ3xiUfptrinuF9aSWqV2?=
 =?us-ascii?Q?rUDEL2AgfmQEp7KzO75icPT74kpt5dS57cInqMUJ5ghrdN0QdXimsW04fgRj?=
 =?us-ascii?Q?Cxyjok+8iiwvZuLpcUcsJVfQub6e04WDsX0wkbg6kM7VY6T30+NW80vcgAx5?=
 =?us-ascii?Q?iKwyDphmQLsVRIIY1AuHygOQRzJsJf7W7ZsVrC9/G9+mtAXCw/lE8uiyavse?=
 =?us-ascii?Q?HtVQwlgtBvHUSC5lt/83yKuDGCo4CyLmGWDxBmrTgLM+kQdYPQF3cfjeFIxR?=
 =?us-ascii?Q?UUtA0h2MCnfFE55Z3yEtBdHM8IcotFrlLKaFgv6GG2dH41v8saYaFsCd9qLI?=
 =?us-ascii?Q?/DudHteleNZOagpAO3cTM5p/jj3tfr0PVeD/3hnPJLt9lcZBlBg+tWv240G3?=
 =?us-ascii?Q?Jy1NIcbIJu4rpIVQzjm3TK2ZO894J6095n6iMYycKG8OzCdA6UucaIJ6FQAO?=
 =?us-ascii?Q?+/scy+TK0l50yAVL7DyoS7WEdWVN05kYaW3EanV6B4rYCoMSzWEPZQ1a163p?=
 =?us-ascii?Q?HFdecxrWYTsx5e8yhrLy8KO2goUuRYM6MI1jX3TfzOvV3utNsf2FgV1ZOfH1?=
 =?us-ascii?Q?6Y8B2KRh5gS45PrmrYWuN3ax0JVXjjDnFdWHctOJhG1rMYj8iqq3gC7Jl/sn?=
 =?us-ascii?Q?vPRzs7GXGB11ubkjcnegw95Ek2gYW/VTME1w7tOCr79FQ6Yg79Xc9cH6Y7+I?=
 =?us-ascii?Q?zKHccqPD172+5USeKM4NCVkuYjVTSZiXX65TplY/R27NSY+qAW4FdYW/my3w?=
 =?us-ascii?Q?MsfskvVPBL6w/tdKGFhwmVAAW8YpiT94lcrZVk67Ty9AAPlEfNDzCcN5Ah7M?=
 =?us-ascii?Q?9n/gxzPtJJvB91NSMQs3G9i6whKG2JcKLKCX05WKYap5WHTA1spF034OPqRb?=
 =?us-ascii?Q?0gzX11rmLEooPJLtfoy6DfbsP/IZfi+UtNEqz0bNdsHTMQgvtOVNVSHMlf/j?=
 =?us-ascii?Q?H9243oFJDXNMMhckCuA13S5IrrXv6khIalHvLL6yV2OtFRepLROGFr1udLna?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aadecbaa-e6d4-44c8-d58b-08dd7b203de3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 06:47:36.6584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCreWoPfPs+9gGAR4k2E80ZTWQqSsDocYWZdDYOgktNvFOBjK+K8uIH8pyiDftdHiT5BhfgTFtPcLKhUbt+l1LmbHdI7TQV3PjfcT59zgpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
X-Proofpoint-ORIG-GUID: 6BwROJzQflKUVoohXf5cHeWDlvLCsio_
X-Proofpoint-GUID: 6BwROJzQflKUVoohXf5cHeWDlvLCsio_
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fcaf8d cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=XR8D0OoHHMoA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=RNnUd5T89QfoQ4j43GIA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53E6HvrZ015006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 06:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214797

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9a=
d7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777

(master rev: b0ded4df5f2d3bb3319978d1a549c72f5daf238e)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-=
threaded-fast-path-to-rand.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threade=
d-fast-path-to-rand.patch b/meta/recipes-core/glibc/glibc/0001-stdlib-Add=
-single-threaded-fast-path-to-rand.patch
new file mode 100644
index 000000000000..736fc51f3874
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-=
path-to-rand.patch
@@ -0,0 +1,47 @@
+From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001
+From: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Date: Mon, 18 Mar 2024 15:18:20 +0000
+Subject: [PATCH] stdlib: Add single-threaded fast path to rand()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Improve performance of rand() and __random() by adding a single-threaded
+fast path.  Bench-random-lock shows about 5x speedup on Neoverse V1.
+
+Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]
+
+Reviewed-by: Adhemerval Zanella=C2=A0 <adhemerval.zanella@linaro.org>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ stdlib/random.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/stdlib/random.c b/stdlib/random.c
+index 17cc61ba8f55..5d482a857065 100644
+--- a/stdlib/random.c
++++ b/stdlib/random.c
+@@ -51,6 +51,7 @@
+    SUCH DAMAGE.*/
+=20
+ #include <libc-lock.h>
++#include <sys/single_threaded.h>
+ #include <limits.h>
+ #include <stddef.h>
+ #include <stdlib.h>
+@@ -288,6 +289,12 @@ __random (void)
+ {
+   int32_t retval;
+=20
++  if (SINGLE_THREAD_P)
++    {
++      (void) __random_r (&unsafe_state, &retval);
++      return retval;
++    }
++
+   __libc_lock_lock (lock);
+=20
+   (void) __random_r (&unsafe_state, &retval);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/gl=
ibc/glibc_2.35.bb
index d9cae79ac2f3..9073e04537b5 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -65,6 +65,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_start=
up_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.p=
atch \
            file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.pa=
tch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
            "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.35.5


