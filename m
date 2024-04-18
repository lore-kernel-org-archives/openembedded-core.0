Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027AEC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 11:35:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10579.1713440100518962630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 04:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bgav2aSr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48385b6f73=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43IA9VrL031765
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 04:35:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=dnsxdLV4dYRIPO4VHJkYMRbSnH1WQS/vte6DI3ti3LI=; b=
	Bgav2aSrVn51uHPuPqPWh7JFs0D3GTUTojUg3FJZexqq1GDhtn/c5FEK+NZ1M/0V
	ocfCCYa/+wUuDUzhUOyfKWuC7mfgUuHioPwp/eBpUiiJzQUi0fI3V+sVsTju+hue
	k+A5OkHC67fumsPypAyxHw3e29xPE/hIfwwCcIEAt83DcARAE1ZImW1dM3gntGmm
	O4lznLf+TvJq4nFn9z4oaVu9thdHssP0rgFbAKUNABTV+JTcXkzKcxAwLXdqvEEI
	6xQR246gGmisdu3xtL2HUzOnzUnmyZWfoDZzYxqEGH+y/9KVJiOOkT0oWqVEKJk9
	Ez1p4yC+JmFDD9qDMLOItw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgvk90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 04:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McUQD/J9HMfNwXnHzfjOW3G5J9AjSTibuTtUxG7U2KQrCbW9ZkbLRgRKNItojkWAOobOqoLtVyhBA8wM6/W5W4Mshh1Ngobw1PQttKDbyqdIrJcbyNpNQPA0Gr+TkYpYhr2Oog3UFuR5ZI/EP1/YdjyHh9GwDEHUwo8K4zynuDrYz28NvLaAYisFhjqi4xhFdztvM6PV8oMRUwpAJYszWPz5vX/jwiWDYCTS0bEjhHbKSDuIjV8Dfoikxr8jZfYRKE0EwZFIVc/fvcjK8oxyh+U86OyTm0MQXs9j7oGM1Bew/6ZyJHWvPaeP/YEjaO6ffYeKYktnKw0ZGrSPBnziGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnsxdLV4dYRIPO4VHJkYMRbSnH1WQS/vte6DI3ti3LI=;
 b=C8ecADFgvC09CBhHnbPuzKWtLVDHTJQfe8+D50f1YIYBN8HATxj5V8eJt/kYhU7RsV+9T6l+f96ICxTR/JZRt2LDJoXixY/TmRPbSf7W83TH9p+uiu6NenWlUCm/yodohiWIwA8pF/x47k5Edgu1hSxMvNKI9yBfEHV7JOPIQ/ZD2zradjDJwdIUw8ms42WO9W+Xo4Yvkup2iT8WAm0j3QMsnGL+uB2fuflnBN8jvH647li+M6Yh3DFzbbIA8pJQ94j/ORosgsxV5WgcteTHik9pV7YubEoTvenA8aT5kmAGXG936X4xbR0WSq6YHb6qDnVLt6gpgH0+jfGNlThl2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Thu, 18 Apr
 2024 11:34:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 11:34:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH 2/2] gcc: Oe-selftest failure analysis - allowing multiple ssh sessions
Date: Thu, 18 Apr 2024 04:34:16 -0700
Message-ID: <20240418113416.93878-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418113416.93878-1-Harish.Sadineni@windriver.com>
References: <20240418113416.93878-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: c19a3ad2-2ea2-41dc-a929-08dc5f9b93c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iKIm9uMAYKAblrxWseQjq1QvX/UhdFw8hNpF6Yp1gGjufjeTM/oE6mQjtMMI2gRethtBMhBVBYfhB2kILXQGcadU3xraoVwJlSTp1Le6K1LXUKexZ7C1R61xzkAu0YmFisJc+AlOHAWYUSwSqd9NraG2jElg+K3TqnkCQHL5NFhvWlfd1csZRNpjFRtqGPByo1CPtTAJUZIsrOXcg1+mLXZYl49o0tA8Ue75pjouARqRJ09Z4v7thDfSetPyX1+5TJRcrDBZaN3Trk65KllUPwa9GJzWm9ezKaMvo5OfSx9W9nZVMCxpum/KIL9s7yLi3Zwiogw7VvMefPOG/d/M2RK49DILh2x4MyZltdTrBrDl9834naYs8ncuSTYCZ8y/vQeJU2Org4Hem5COUXOjCQXGaYQpb/HQTfE4xSI7d62JGC4oXtW2K0dGm4Y02KP6S+HYpN/Aq1mZAqfo49cjeM3dKaY9KDkFNGnvkplNmOkBRfDXRByluuZWnAsAgGjLAAMzXUml2XhkfvDdOHZELPWNHLsrST0raQ/Cbu06nRx5mqvRyFGJLZcJSu8AczPVCgIkryboAns/C3qUM7w9M45qDK2gA88XhfDv7/qIHusTkOVQIZj9U55xQjf/8kJgJn6OMAqYganh0dHkooOTsUd+vOigMVFo7Ms0B6JMe/1SUFAeNi0OM1C4khMlWmgG7h+MMyYPMphhT3X27hyX6+0kegeee2bW6bbuBGWgyDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oXe/Ez6DShSS8eCKdymsSawmX+2roBFrFEx2FV5z7g7nakc4bwRIAjo30xry?=
 =?us-ascii?Q?MiNQzL+A0C1BlncHcYc1/yGzqZQCk9GHzbAV9Xy5wBPF7UgQ+t/kanXagNd/?=
 =?us-ascii?Q?p2Sqew6ocKqgK2lCzbCYwo8n55OvbEApcVWcap0otaZVZeaNeN9USB30IRB8?=
 =?us-ascii?Q?bV7rJrwMC7qF1GnrDFrh0t1r5Krdw664cqTd7fO29YPFuacEU5GNYw9yChuE?=
 =?us-ascii?Q?j4VaxhjqLeZgsCP0sxGLkrojNJvfgDSE4RnEX2Onbg4x3kUdHbLftquWmkW0?=
 =?us-ascii?Q?4sa+PW4GIJYWZvrwKxBKDpPlRtloEqEvBnW8T5pwOnFTU/bQQ2iTNP7d1/kP?=
 =?us-ascii?Q?tOyklnhkR+a/yS3xXGKgUTL1UyVw6KNKDtTGP1RKZHmLsIOsZWiFAStecqPN?=
 =?us-ascii?Q?ntZD1+W8/DPRZPnQAYHgshXPyJ70qWuvGNIlFzUcWdVEuo65VDtOSOh3BVyo?=
 =?us-ascii?Q?9gw1vTRbgLNVMi6rwgKANACeWPPmp3CS79huxZCzNg85ka2ygAOyPdJMNyGl?=
 =?us-ascii?Q?dM10U1IsYNuaqLgaMkwdO1yU18YGn+1SvgbDbnBv4SMqY/A6VPkQbrcvvsem?=
 =?us-ascii?Q?JMZxz/fiBQRuxmBuT2/TNHqTSdu6L1a0uCagdaR0hCplOL/Omzyzii2v4ONx?=
 =?us-ascii?Q?M13pic3RxMaXtH7mmVYdlBGVR4GQKQhQye8WsF/QCeJ/aL3Sj0SMXONnv0EE?=
 =?us-ascii?Q?Ync1YbCO6qjQRGhY0R7z7kMbKiRptzZtzGdcbT3gUF9pJmSOokye8O3Y1iHp?=
 =?us-ascii?Q?t8gv+cSEPo5kS5zesbPou96mXCmiBOFL+jGHnpYBANVLu1qmaxxi/dBMmieD?=
 =?us-ascii?Q?X69J41MGEaMIKc9553dY3EFY1/zlYZDaBB3dqAZVJ9wbceJ/iJVcreFpFIW1?=
 =?us-ascii?Q?2pLudMf8d6adeJUvKvAAgmm/v2np2kSz3wJGS77MZevWxs6jkuQRERn07FIf?=
 =?us-ascii?Q?a4C1BWRgcnQJaeFR6vaSq2TA4cVcIBHJiec3f6I/nA8yo3ZMMcFfC964pufF?=
 =?us-ascii?Q?kx5gbSVw19nu9l+RjITzc5RDDCGBkGmdNFxgbshAcW4ssgckydnN+IEoxU+c?=
 =?us-ascii?Q?boRCYwB74FLNx+mC0LLs+rt0mVUt1QmcBiYqSIDOhtA4h5R2+xS3NLIMaz1Q?=
 =?us-ascii?Q?NkBQGMICrUXVNttncJK9DHp+Wq0h0P3Mqnucpx45pZICHIWRF22vfGxBp36L?=
 =?us-ascii?Q?u9/0HFmUtAruublTwZ4qDkZMEo6ePgsTGmelu2pCuXPjCNiMoxJCUVmIMupt?=
 =?us-ascii?Q?MAUDcVsvkqLxFS4qC2oJaCqV8jXIIhc0PyQhsP817sfrDuJeYGrHFahepkVk?=
 =?us-ascii?Q?6DE+IyyB61Yb1xVSn2eC//eojGMRolNQ9G9sRp1xgRpjC5oAMR+2Q14fx3a2?=
 =?us-ascii?Q?l/4kpVRQG/xnKcM6sEDA6mKiH/RlrPCosA6HjxrDIi0OooUAJUy3aHTKhmJZ?=
 =?us-ascii?Q?gIUaPOM3LYn0buQ08XRGLF//zZFbrk1jHcJUYlFfSwa0kIZhDwpBVBCV1L6+?=
 =?us-ascii?Q?v/MhR0884OLmGEfumBegAYveO5+quTOEdS5Ffgy3i4FTcoGhc5WYqP8gCGlA?=
 =?us-ascii?Q?8EPM8GfvK94pBJcDqkCUWN73oqOY5m6YJbA0+YJRUWi++8DnflxWAxBlDfh5?=
 =?us-ascii?Q?7InsFK9Sefe9hlVoV8kl1Hg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19a3ad2-2ea2-41dc-a929-08dc5f9b93c6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 11:34:58.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WpBcU3K18JJc49YWfwtpDQZkDZSjBsEqUga0WCgxOHXqQTb8rEr0hOoQlLRHR69MUtOCDq4NndrBQmRAPnwfWucp+ysTvCifplNgQY92WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
X-Proofpoint-ORIG-GUID: DuBCkSuKND4obXLlZOyR0k_G9RHLcwHa
X-Proofpoint-GUID: DuBCkSuKND4obXLlZOyR0k_G9RHLcwHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_09,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=895 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 11:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198513

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Reusing SSH Connection to speed up remote login process using multiplexing to reduce time taken while running oe-selftest for gcc.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py                   | 10 ++++++++++
 meta/recipes-connectivity/openssh/openssh/sshd_config |  2 +-
 meta/recipes-devtools/gcc/gcc-testsuite.inc           |  3 ++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 4cc0894d42..992a5b74be 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -5,6 +5,7 @@
 #
 import os
 import time
+import subprocess
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
@@ -83,6 +84,15 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # validate that SSH is working
             status, _ = qemu.run("uname")
             self.assertEqual(status, 0)
+            qemu_ip = qemu.ip
+            ssh_command = [
+            "ssh", "-o", "StrictHostKeyChecking=no",
+            "-o", "UserKnownHostsFile=/dev/null",
+            "-o", "ControlMaster=auto",
+            "-o", "ControlPath=~/.ssh/control-%r@%h:%p",
+            "-o", "Controlpersist=yes", "root@{}".format(qemu_ip),
+            "exit" ]
+            subprocess.run(ssh_command, check=True)
 
             return self.run_check(*args, ssh=qemu.ip, **kwargs)
 
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index b9357ef6c5..37ffe28142 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -34,7 +34,7 @@ Include /etc/ssh/sshd_config.d/*.conf
 #PermitRootLogin prohibit-password
 #StrictModes yes
 #MaxAuthTries 6
-#MaxSessions 10
+MaxSessions 1000
 
 #PubkeyAuthentication yes
 
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 0a950b6c9e..62e9691a99 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -87,7 +87,8 @@ python check_prepare() {
         content.append("set_board_info username {0}".format(d.getVar("TOOLCHAIN_TEST_HOST_USER")))
 
         port = d.getVar("TOOLCHAIN_TEST_HOST_PORT")
-        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+        qemuip_address = d.getVar("TOOLCHAIN_TEST_HOST")
+        content.append("set_board_info rsh_prog \"/usr/bin/ssh -S ~/.ssh/control-root@{0}:{1} \"".format( qemuip_address, port))
         content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
 
         return "\n".join(content)
-- 
2.43.0


