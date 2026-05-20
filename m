Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4E5CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 02:38:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3686.1779244696362630598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 19:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q5xNoKs8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9600e0cf49=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K1fZoq1028272
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 19:38:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=HvDDvQPPoHEPdhMVAYTo
	yaCUJLUKPTP274CJrWEFte4=; b=q5xNoKs8Xzvpsm93xqe6KEecS/e2OT+BI78g
	qYUQElP6DchAOb4bgttMnUe/4Fh3jwKJMKUIPwGhbe8LSTLSlQ14BKSEmHbXHQoc
	hYOTxUB2K7TzMpr2vtpsNwMlZW/npApZQmqz1zPGViPwMaOmQR5ZSMNCT62gowYW
	Sy3euHqdL20HHlz4GUfPbGlUG37pEG3PortQGkwMtz0+6p1p2CkTXPZ8y1LRVwrc
	wAVNZxyHvsvi3xPmr2cuU8jwA2ox+504AHE1ND3u0m8v6wrvifSCE3fxCoUwPeJ5
	y4rlFd58XmAiNkrEErgfO0GdqTDb2aCLV3Gz/eNq9nP3TiosYg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gcenr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 19:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUjWQyVZD6hRT2D2tfRua/8/GN91yw+Y5u8hVGwUZ9xA18TaEfCAM7uLw7EdJ1hIhArBd7aMewqXfNgEPLklAk0b5uVxyWPUE2KOvh5BvTEOe/8tKzdmsVveQdKF7U1p5nsQljjwGZA1IddDWUCLQkaohf6qgV3uNbb+kAI7yGGUEtlCFT2YWyMZR6RQXIgmfRZ+kXN/ti8r0/5vnHo0Y5klkaVYVRr4ss7e4B6HcoD3I0GuN+aJBwE4qkaJ1LZMMvEGhOOFwd9p38Z+7tuxLAqChHeCnqot1Y/CCeAmWg2c+XLH7/eNGAr0Hl5TM5Y1RKfmH7duh2of65JXfJW5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvDDvQPPoHEPdhMVAYToyaCUJLUKPTP274CJrWEFte4=;
 b=KWr2pX7pBGfERSq7/hKXbPtW1n5g+y1zyrPCIc37S/MURDXXUuwfAOTlUdnCljAtIuGXZeNb5uEJxQDAgRteiC3lczGlpv3C2LWGTDjkTYbgKYGtqN2HL58I6cZwlR2aOnkjAA43Ng33P+q3clAjV6u81CwowHFMA1xcD4bF4veTIxdYWl/KrK6nWIrkW0K2MEhkik3TbWysqRZpfP3K3YA6jqZ8ZonxAcDKgrVvvmb7zPa5AXAPpaww5rsck3WKgszKsHIK3ngPY/hT5bjzwhgiFl/NMaxO4EOuVEJz6AvYkxdfQsTfYhfevz7Pi8V/b1CYtkS7gN0r5bZ7zAk9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 02:38:10 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 02:38:10 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] subversion: fix svn-revision.txt conflict when building for qemux86-64
Date: Wed, 20 May 2026 10:37:53 +0800
Message-ID: <20260520023754.2076160-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0128.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM4PR11MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6907cb24-ded0-4f62-db34-08deb618d533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|3023799007|18002099003|38350700014|11063799006|56012099003|5023799004;
X-Microsoft-Antispam-Message-Info: 
	RT+R9Nq8AwZ/1mMsvIDAxrnn4Y+jlh9Zy9I4KBwUCXC64uOpSCrSovbS7igHGo4arUuYkpVYDGrr35K7tH1cu6/90Jit3ZrUbF9TpJ20X3kWdlsZPa2ngZXJQY67azZZefb9WLZcM6/mdZIoNfTuZ16uzKZvgBka1cTZQKkgXLIeN17qS9OqOjoucu7fQBO0LkemdrbY60Dme0bD7PUdTU9HMglSug7TxcC2TVgA+GcpE7czd/d8d1kP4VhzFDIyuAOyMhtDRWUkmLGsA+n3+I/K5jvOC3Ph4Gpb5SPqGSP28mCsnuLliLSi8ePPMhFTTGcXWhxmdIprp02BD9hjsZdIFUQG8aeFgwWh+2V4KFwSGPRwFAfNXK/qYpPclHcB/+6OHnuuYGRbg8fWU71TZybhFCLHJiRhUnB15GO0ijgklHsDI89fsKP8jqZQi/sXpvjQmgkjhzhwWC67UgElug/7feFS+oqeaiIfp7j1QKNv8g5+C5P1jvXamMip1OiQbGG/fDhuSp/17NSasK8bpdJ4yOOqdxaTbj1NVZP1Cw1iaBV2RKceTPclBT59nW+tbFegt/QM85/DeeCQXaUR2/VirC/TAQmhkpf6Abl7VmmPd/LEVZwdOA8tES/hxnJIFeT8AB/PjUVsG0X8y7HqqVvJkXPwsIvHWkkhRbT2zpg5d78ZFS3OEWam6Cs1fM9GTxECoXUBJAGontWT3ZGBE4H6aPAj+xyghdZ7EW5HXmaIC5CGUMYAcu+UNSckD9+7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(3023799007)(18002099003)(38350700014)(11063799006)(56012099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1/FTvUTA7/0e2Gzke+PVgP0jfH7DON5qRNvrpMIU0FmouxwztYZS4QabqnIp?=
 =?us-ascii?Q?B1rfJL8OsSeS4EdSkyZhHcI3KvZJ53CVJ2Rlnzo1kWpeHod1XYCi4R03ofFe?=
 =?us-ascii?Q?TSmQ4hKI9MUyDlt4LwwWCTIeO8hmEYZDeAVmwKkYF44vgYhN1xtX2B+KGFP9?=
 =?us-ascii?Q?Nu5NVG4uiMb48X8y0pY2e08gsyc79grlaItgL1TC0dXtjHk8H8aAwK7D7Hdp?=
 =?us-ascii?Q?kN3T80Kmsf3fZmm/QHrGIek0CuS5IWoz30sG8dY62MTrO0H6YqPSVOHGPib5?=
 =?us-ascii?Q?rptroPrS9z6JZQ8UEibVAUaYrZiweif6/enf2ZIpRpWSEP+4ksyGesgtKHRy?=
 =?us-ascii?Q?u0we9OYBO9zQm02dzFKRJPb2bSD84b9ZS/6d0ZXnlraDeZsHnNqPJzr09kbf?=
 =?us-ascii?Q?TqUFiTEYK8glmCbcE1rh9DYVRlolS7zCPcpOuuBFI+Sy2xE0aH+PSUNQZBUl?=
 =?us-ascii?Q?Qy3RNqKApCr/SgMXWZcy5pg6jVnaake77WWPVm5feikw+h7j4Xnzjq3ZUX2V?=
 =?us-ascii?Q?YmAEnfAXuSCL64d6XwYP+Cw8G51B9PX+LnaUh59aSVkr3umI4X8O3Q9zfBHN?=
 =?us-ascii?Q?Z/ecD5itXtgkWPYrJa2xGQJsknDAQuA2jHcEH3Lrv4hxQnhOJ+gT5QcMXpVe?=
 =?us-ascii?Q?Q76BfRO5shwP2xtPM1SB+nKvWfYOssacEEwAlTpjWHXxZsN7hJhjdLE3cRrL?=
 =?us-ascii?Q?jdij4Ot/lJmBaXMDK5wmSSG683eakP/6j23PRBJ2y1bKVYSleeHBglqCXp60?=
 =?us-ascii?Q?xQM+Gy9uTflfezw39SG+K9fmpASyBwOl0Lf72IiI/T43Ix+jfLrkmdF1dwoy?=
 =?us-ascii?Q?mnCNveFeWsve+cIJKmc3YXaaCrfaDlCNfHFLh5a8EiOBYEFjaIeLynDBc+hP?=
 =?us-ascii?Q?tJBkKMaYTfs42p4xNxQRwqc5xi7SlVV8QRRoMbRH08HeGVMgW8+UsY6nru1B?=
 =?us-ascii?Q?VJtukavkSU7LgJGru4Og9tR39HRvyc1z2cKvlVA43t03TOfIzPMj//+GIIMQ?=
 =?us-ascii?Q?WtNrBOEU43yK5208jZIqxM5gHcEHZMY087ArDJtcAwNy0Hoe0jYrk/skeZNR?=
 =?us-ascii?Q?r5CdQCcxfLC4Jq6s6pf+3051h86EHYmcc3/M0si2FhVgdl0mmHis/n/5Eugd?=
 =?us-ascii?Q?FnX5WRH+iCcWOJxJm6/LC1orf63mMwVpcoJoCyB7/jjlVaNCLznu+5wCcpds?=
 =?us-ascii?Q?O89+6IsXYG9Sc/d0qMTYPgA46XdPsJn5ElRh82Sgx+ZE3lLgzp96d5Zk2wYe?=
 =?us-ascii?Q?EYbvFWE7RO5HjwSSEzQv9vfWD4n6mASFfMvsS1cd5FUZ4jYrS2PouWz2cGcB?=
 =?us-ascii?Q?ZL9ARDNg5CnI8XrUWl4Mfdj1MO6YFHQQ/9yuGP0fVOxHo8vqgVdvhW2BE7YM?=
 =?us-ascii?Q?YEE26JyStNNbkxnTW5KdwmzrjazIkAizGoc5cncSFhb2DXoxwDL8lk3q6QUN?=
 =?us-ascii?Q?76Mh8WFQ/UxHrlkAaz22DTNowO2mI8PI/WXpSBJvvYDTXXlylfOeETpkwDOt?=
 =?us-ascii?Q?EKYfCNALohYRE08CaWPQfIJlHyrLAqlbQFgpbm95dKGmNofzMizhubGSJlPF?=
 =?us-ascii?Q?HjtVbhHmFDyN4Yoq6ARBEwKc8egSNSYX2OeHxJqRp51wFhRx5YIJ3JYjZsxg?=
 =?us-ascii?Q?ocRi9ipNRC0fkYpuq/9CFt0JItZFKFf67p9GlxZNtn3X01XWxQ7fIim9Ipz2?=
 =?us-ascii?Q?tIq8EcRih9aeG5F0c7Ow2x60g0yM8/O1MA+LgxGSRxY5UrkGDEyoNeEWHN9V?=
 =?us-ascii?Q?+kAQBpmNbYdha+x2d7cEs2AVklGdeRM=3D?=
X-Exchange-RoutingPolicyChecked: 
	C6PqJjM8ux5DXujG2jd+Q0VupbAqDBTJP/kbwDQjMUduVM5d3qynuWwMF+j1bpWlCVCmXpom9QiEhVQ4bWNMwL7NYOi7TbWpH8mi7wdjC4deU897ep5iDVyTrYaqOqSwnFrvsRU1niWNolD2OdCtTAPleKs5Gh6pwgmaUs/khwlGqdr/NHPOE0f2gyZYtAVpVVgemZc2EGpsPIxJx/hIy0Dg2IJgB/alcf5gFn+kmvEIpHO3bMn9LgqlghCfWK7mIqi1sdjiQqRAJAyXKZR+M911HcXHbtIDv+VH2820csrFrvMwA2VwJS6s4Q/JOyuDlhx8dQV2XBtl19XkruFtJQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6907cb24-ded0-4f62-db34-08deb618d533
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 02:38:10.7600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tx/hKgsiD1moIzeF5VzDc1evf/wGekR/dYIndGrRzmH9qLoVeyxM8Lc3kMj8M4Ye98LdmaGvtGINySfzv+xsNqcStyFkx62lofiyoiW4jys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
X-Proofpoint-GUID: jLgkNs2Wqh8e1X0qZ0OPrhsnskdrjGh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyMiBTYWx0ZWRfXxh45Y7CXo6up
 rAP13bu9cNpP4usfjvstKWA2drBpTG4nOtC4urCG9/0urtYTyUZJSyXwNZQpbvdXxPZntjUWOyV
 cVvrSoSZ9zx8neXtGjIHD/x3iW0Dig5+4i8r7Zb6P8unBVKzAsxXstyrRca1dlXhk1px8lMoFMf
 PWoCmJOFa/dVorz2uHZ6RJy6YKbBBlOFd9y1KgwAcFzcqWFfIFxN4ZRU6M9TyPI3gNw9YJR1p1V
 5Sd0G00yLi4o22YtLp3WBhdozY7Ui6wAspIyURffrOR1vq2jWQ4fXfl7X6+QlZGJ0fRGJ9kt+An
 J1wuSwStTGV5XyI/5AnnTetStwR2LF15orJrB8FsqwLC36R+HtTsyF/rkpS/zksPjiHb8F4vGNP
 7wXCAe1QbMOWmQoF3Z9vGcSiUKIkf1utwsJm+6cEOHkgaeNBQeUSvnrdQrOp7Y3US48l/6f8VLi
 55/cmLhseJFejnI5awA==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0d1e97 cx=c_pps
 a=B8vmKHXld1RnS6EAYjBvXA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=N5C7i6JgP_lGezvsZWMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jLgkNs2Wqh8e1X0qZ0OPrhsnskdrjGh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 02:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237378

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The revision-install target in Makefile.in generates svn-revision.txt
by first trying to run the cross-compiled svnversion binary on the host.
When the target architecture is x86-64 (same as the build host), the
cross-compiled binary can execute on the host. If the host has libapr1
installed, the 64-bit svnversion succeeds and outputs "Unversioned
directory", while the 32-bit (lib32) binary lacks the 32-bit libapr1
and fails, falling back to "unknown". The differing content causes an
RPM file conflict on /usr/include/subversion-1/svn-revision.txt when
lib32-subversion-dev and subversion-dev are installed together in
do_rootfs.

This does not affect non-x86-64 targets (e.g. ARM) because the
cross-compiled binary cannot execute on the x86-64 host, so both
64-bit and 32-bit builds fall through to the same fallback.

Since the source is a release tarball with no SVN metadata, the correct
value is always "unknown". Fix by patching Makefile.in to skip the
svnversion invocations entirely.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...-fix-svn-revision-host-contamination.patch | 43 +++++++++++++++++++
 .../subversion/subversion_1.14.5.bb           |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch

diff --git a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
new file mode 100644
index 000000000000..a1851d84e031
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
@@ -0,0 +1,43 @@
+From e6b8f4fd18887d894767b62c0ac4611ea86767e2 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Tue, 19 May 2026 11:00:00 +0800
+Subject: [PATCH] build: do not run svnversion during install
+
+The revision-install target generates svn-revision.txt by first trying
+to run the cross-compiled svnversion binary on the host. When the target
+architecture is x86-64 (same as the build host), the cross-compiled
+binary can execute on the host. If the host has libapr1 installed, the
+64-bit svnversion succeeds and outputs "Unversioned directory", while
+the 32-bit (lib32) binary lacks the 32-bit libapr1 and fails, falling
+back to "unknown". The differing content causes an RPM file conflict
+when lib32-subversion-dev and subversion-dev are installed together.
+
+Since the source is a release tarball with no SVN metadata, the correct
+value is always "unknown". Skip the svnversion invocations entirely.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ Makefile.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 7f0a37dd9a9b..914c1c37790c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -499,10 +499,7 @@ local-install: @INSTALL_RULES@
+ revision-install:
+ 	test -d $(DESTDIR)$(includedir)/subversion-1 || \
+ 	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
+-	(subversion/svnversion/svnversion $(top_srcdir) 2> /dev/null ||  \
+-	 svnversion $(top_srcdir) 2> /dev/null ||                        \
+-	 echo "unknown";                                                 \
+-	) > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
++	echo "unknown" > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
+ 
+ install-static: @INSTALL_STATIC_RULES@
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
index 13bec4ad5956..05f80b3319aa 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -11,6 +11,7 @@ DEPENDS:append:class-native = " file-replacement-native"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            file://parallel.patch \
+           file://0001-fix-svn-revision-host-contamination.patch \
            "
 
 SRC_URI[sha256sum] = "e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1"
-- 
2.43.0


