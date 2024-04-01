Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66ACACD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 08:10:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32783.1711959045615585433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 01:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FdHm+N84;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48215f78b9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43172kMA004961
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Apr 2024 08:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=9H9bfobrB0QolSpP5e
	kUkBW1lOh9jPTIpUBXmQgAHRs=; b=FdHm+N84aJ8IoVRm3+V2e8GQBJfd/ye8WL
	t5anOcnO0ZkWxjGeASwKBpICebvVHzPXgfP9KuEukPt3y5Ysonbe3Pvwj55ZEuA0
	lYnR/fk49hZvzsqFDS18ecyiD98W0iEyNJXZ8vj67hd3OUa/9UBfRrjAJq+By43/
	VzvPrCAPV7UmlkMMUBccJh/hAK3VX4RZxFi8Elz4NTwhmtzeF3U8VMqIwNnmtXPJ
	wkjgbas4hAhwZLD1Yen84M07UqxhtGavBGbChf/J1NztqKw1oLvKCtRP6mNINDCO
	KqcNPH1RvthDL/QXURjT8e0aCtrCufd3Fhlaxt0dV/1AKif03kZA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x67xy1qrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 08:10:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyXmmH+kh/CuLbESqJHxxNjC4zS9zEGPuiwy6QlEblM37iwhbgE8iF+S50JpeDQHxn2GGElsd9B1K1tqPHgUyzK4AxxRX0c/5vHD4Mr8DF+PqLU9ap447vaCM9cDeKKa94iTKF4mVUb8xBtFgDYqxIbrfmWL9j8iH00Y9ffARAWaEcg/ZCEeNKIxgBdvT0lVUQr0/FyutgAe0nVuK7cECV3XwR5cKiV/go3D9nH3rrpM5dE4201GBSeLJc5x9u/qwZ2a+mMejiKXL6mgSICVsKQ52mJIizevURRC2ixvUC/XAMUuEyFX5/kIxOECljZ7AylrrJD9HDc0olhVmvOI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H9bfobrB0QolSpP5ekUkBW1lOh9jPTIpUBXmQgAHRs=;
 b=EeKxALV5pwQBV1iu333nIOSYiJf8iR8oeY9Qqj5M0q+f6FPoHyktDPSnU5FPxSd3g0KF8GkUo0Pj9QY41b/tgP3Z8kl54ImDz5suoyuSXwYOZxZ0bON5YHTHMQ6HqG6OvAj9Rxs8GE0giKR7Ra4xLKZ3zi7KwWt3hzQ2ptGIox+CYsx32EW37/fLB+ahbqcUoy1EQpJ1VrG6HBp99vTGExx2bd5XB7ade/eWH5Fh0leqYVmBDWmdggvkO8TyRdVhAli4LFlzNt1LlWhFkJM3jhZeOlu1jelHJJ0M2BGWP5H+DY9QumIIp1H5yxlxFSyZShibuRhzJ10csivfMp+9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.23; Mon, 1 Apr
 2024 08:10:39 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 08:10:37 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH] glibc: Fix stale qemu processes left after glibc oe-selftest
Date: Mon,  1 Apr 2024 01:10:11 -0700
Message-ID: <20240401081011.479084-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7659:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DocDA/H/DmcH01eCOHiCHBdYkBqCoiSBkN29Rp4NGdobVhieXljm1iFEwC2iT+tpZsotkz18xU1rad3+Bk7wDtGkbQhYKrjuTUXmFTR/PzJLijxw6XnKju34iyi65Ex2xaInuOvQkf9kSABw2A0/5nYtNxx4Zx00KqH4Dnnx+ge+qxjzmPF56jEEsCe2hXT9M2iE8ERKwgDZBi17hXEGtngGWtxaii6qUkwKNM27MddIXtkU8qaP8hjDpQnOwxKQqwrwEN/o4gaXRNxOnkfZW7Ak2D6H4respnzrLy+NBRjd4Lc5J2MXQy78ptqt8o79S23QcIhcRQljFRNDVW05fRw5oHXzU4+ns9CweakWXQBbhgedC9D+aSDYCflV4B4UeHtXwIvLoadtkuBwbVb7PMkO55m4+hZ0CzbZ9HzmrHhcnGABaqpSp6Iwej5CDRm2YMYCK4hTz66GGKUThqOPQOZaxvPw28myYV/cwCRhk6nPrnkNaMRMkOXsQOCXdD5DN0FEI9kNB062VoJ1IWoMlzfxXbX75ZHfOv4SNW2ypTVXWDmmq87v4xA4tBTvcBYzryDfbC11EWIbazyzhEjHgdMhT2EQYhCCB7KHSWy+wwETmxfM/uCqK0xpSGDetamL4AJhxTtqW6qTMF+7fgrZ0SXqvJCJ9iIvHz2NUNZPu8M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D4yKi3a04ESJWDVj9mrv4dJqYcPe5oksFCtnbGJKbay+atfscAKKnOZr47ZM?=
 =?us-ascii?Q?EAdhq+TJ2VSbE4VXTdT4BGSmqj9/j/A3QVnoeIfIzMGNydmpEtWdt9MIlaoK?=
 =?us-ascii?Q?03opqXKOVnpbLjz+2qmtXgf8Hhocfh0tG7WNBfuF8PiGV/OLmvcYexXO74AV?=
 =?us-ascii?Q?HOOVS/7QjgSk9vP2/XId8ZFGiNVTt6rM0Ul11qE/97M/pKYBHqpgwBIt13B6?=
 =?us-ascii?Q?bjtT3zgu1Mr8IjiVMJAN1k1xoHiEjmkti0cF7ixJrH+KH4U3sUWavDlhCkiI?=
 =?us-ascii?Q?XfLlb5ZDMfrHoDoKG7vIC8RSXzANNEmpWGKAEpjvvjXz0RSKvNLPnwEL19Yf?=
 =?us-ascii?Q?iVqd07WxOpqKoIGpxK7vuWQYuA5vCjWHIGpK6j8ElCzhpScu3g3ocpuPpvPK?=
 =?us-ascii?Q?H3t5gei4lzuJ2T0M9VRka0P2YZeB/VGYzthen0FPW3ge4ZUOHaH7CKZQtccj?=
 =?us-ascii?Q?yYIzb7DsRXAR1IAEMRdZzQ7t5BbFxjP5h0anCHi51efTusJtyEAWRxOV5Lso?=
 =?us-ascii?Q?75B1kPa7jh6Q/JMEzu979vkRASy/vnS0Dxe7YW4GDwyCzbksr0dc1YV99q7n?=
 =?us-ascii?Q?knGimFO2/2cq1NkjZJG9EVI2+weQSxipXXVD7bekMWcxMAFRTYwlDIUePKPh?=
 =?us-ascii?Q?vCr45zaomQ7xHMSkFBL+f8kj6AycdQ21hdDJN6ZO/ucIkR1q0YyKbL4uO35z?=
 =?us-ascii?Q?gQXXLpj/RexulLttoYgLyJXG+Ai2FwfSvkcLbgaRDCd598W556uPn/YgC5ZJ?=
 =?us-ascii?Q?dg4lgYJ2KK+zFm7dBP4dvPP/Yyzok6JeEt5+AuAjiB9KfihN+haJCjFU3O0g?=
 =?us-ascii?Q?GfBY7YryK3GfU91Dt/XteLMy4KDoc32K/VojWjmadJbUV7cNT6pI7AEuA6GM?=
 =?us-ascii?Q?dMrx/YLLEZpqo1ojK/H4t16Vv9f5KQWr5ecmnDT+88R60VyVx8vSKbEpIylj?=
 =?us-ascii?Q?V2Nm9ozYyR2Gl4Sako6Eb8qcqY6O6yxYTK2cD+4YkGznKBnYvbpXCtkWGcfa?=
 =?us-ascii?Q?4s5BYdDbJ4AJzWeh+1iNE8VQt0Z+6nEoTJCsaTHBlK1iLr17T8fqWQ+uSB6x?=
 =?us-ascii?Q?G+d+yx3SGBNBgfbGdbPfUuMvCxd/mYHgggTQnAOBK83mxl2wF+e0K1ftVp1E?=
 =?us-ascii?Q?BiOihqX5VFWEe9s9BfCCOhqKqYFOBc9sSOdztYyMawFu7Dm9FHSjPIXg/n7X?=
 =?us-ascii?Q?f0Lzi7uWsYRBRTZAclqJFi45LFNQKUBeTXHXyx7Q+x9I31G+OFj2YeibPVaQ?=
 =?us-ascii?Q?8axP+AijrEW1e6fHbL0Z7FWHd+lGxleStFq/xZEGPH8W5PZhtkHDgrcwiIh8?=
 =?us-ascii?Q?/qAZ9RgqmuLuBszauUW/LLMH41MDU7kScO4smmlbDRarNm2xw/+G53b5HgW8?=
 =?us-ascii?Q?2hegxAm0lFdq+kmZQuosjEWe5/sxPsby2W6Id27pA4cX/Cf8qXIIXJ9f/Via?=
 =?us-ascii?Q?S8BG/4tRa/7XtcYWjg+PI62oQK+scw/fTVdRE+bAxI6e4USLuzsSNK2muiOF?=
 =?us-ascii?Q?t/Oaz9jT75+1Y7oGoK654rSYDJP5vLwOshFM69cV7TnOyPJD0VOl/pkpfNAh?=
 =?us-ascii?Q?rY2wlfGrvVsvkgU3SSe3VZ+gE5Xmm1NygfGZG0mhCkiJa7fVTaxwfd+rWuIk?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa302edb-a16f-47e1-fa33-08dc522336b0
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 08:10:37.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eVGY/VZeG8RDLq4Xp+4jF9ZsDlOYWgQQFKNTr4vqn95kZHQWdBi7tEtylzjDp+tH07FwJAcfsAcmWYlhVIa3NShE39BmKfYkV0JgSgsK28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
X-Proofpoint-GUID: ya7lGF5LDDDXHKRhOVvpf8o-UF6LxbU8
X-Proofpoint-ORIG-GUID: ya7lGF5LDDDXHKRhOVvpf8o-UF6LxbU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_04,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=519 clxscore=1011
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 08:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197678

From: Yash Shinde <Yash.Shinde@windriver.com>

qemumips and qemuppc were leaving stale processes behind after
running glibc oe-selftest. During analysis, it was found that
it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
Disable them so that there are no stale processes left behind.

[YOCTO #15423]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../glibc/glibc/0024-qemu-stale-process.patch | 45 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
new file mode 100644
index 0000000000..c28fa31b89
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
@@ -0,0 +1,45 @@
+glibc: Fix stale qemu processes left after glibc oe-selftest
+
+qemumips and qemuppc were leaving stale processes behind after
+running glibc oe-selftest. During analysis, it was found that
+it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
+Disable them so that there are no stale processes left behind.
+
+[YOCTO #15423]
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux/Makefile
+--- a/sysdeps/unix/sysv/linux/Makefile    2024-03-18 01:15:49.019202881 -0700
++++ b/sysdeps/unix/sysv/linux/Makefile  2024-03-14 06:26:18.581404107 -0700
+@@ -222,7 +222,6 @@
+   tst-process_mrelease \
+   tst-quota \
+   tst-rlimit-infinity \
+-  tst-scm_rights \
+   tst-sigtimedwait \
+   tst-sync_file_range \
+   tst-sysconf-iov_max \
+@@ -233,6 +232,8 @@
+   tst-timerfd \
+   tst-ttyname-direct \
+   tst-ttyname-namespace \
++  # Skip this test to avoid stale qemu process
++  # tst-scm_rights \
+   # tests
+
+ # process_madvise requires CAP_SYS_ADMIN.
+@@ -270,9 +271,10 @@
+   tst-ntp_gettimex-time64 \
+   tst-ppoll-time64 \
+   tst-prctl-time64 \
+-  tst-scm_rights-time64 \
+   tst-sigtimedwait-time64 \
+   tst-timerfd-time64 \
++  # Skip this test to avoid stale qemu process
++  # tst-scm_rights-time64 \
+   # tests-time64
+
+ tests-clone-internal = \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index b203060064..9122472689 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -49,6 +49,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
+           file://0024-qemu-stale-process.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


