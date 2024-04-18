Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C5EC04FFF
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 11:35:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10506.1713440098916709630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 04:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fLP1y1KN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48385b6f73=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I7F35U032075
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 04:34:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=bsMd7Zaxpg2wQ7SfkO
	lFzOOKOgVU7lpLy/QDociz+VM=; b=fLP1y1KN0zDzL4Yt47kqAirXMtJuetwD2E
	d5wfeKPlEBYzybNryU4NLaOuDeHYlxuN6Ve+DDeMHVI1czrW2DGmxa+MtChO3fwZ
	O9MXUig+GYdWQEkowRfuQK6VzfqQIqPqQSODuKa9xffHRJhwMHbn4DYu0ZxoOKq3
	jA2EyAQDDb/VhXyvZyqX4YN2BrLP5/1T9ppxW25zENCwsdU0+ztdu42MmOLraron
	n86ilLw5GOcDoo0lQ1H0BwGyt9vx1nI3I9fgapnZuEqrcah2aJTlA+c2rMaCOhQf
	Vpv18t4U9gPtUI3SKo2X/oevbnel/TzY85Vc95xFm7gof2XvRVJg==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb14rv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 04:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIXZeEr/IZcJib7YsjHEHEQQrvaMarHlzOJWFlGOpLFyrLGQ2xTexXCDF7hkyLwG2h5l9iYTjst6OzyVVAYXn7L1nLqeiEE52YaeyNB73Z8WiSd7GCy02cu/DHf+A3W/d02HUxporMPbqJIU4XF2O1sNGgkSMxibHa+bNp7E844ufMJJjWDNKAwl98fRzlayyZpIRHG6OiZ9/hZyTQB1XR5u2TDVMT0TxoRLpF+HStiM2R5L5RhDy+VJiT2EavHj3T17P7plvwJs3aQNXHpncrRZ06KUi1/GRcx1BBiwSRtOorUBvzAzXpe2EAjNbn/e4uDdpjGUb6WbYrbyOUNd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsMd7Zaxpg2wQ7SfkOlFzOOKOgVU7lpLy/QDociz+VM=;
 b=HXUs49ijNabM8UuW4+g7ZdO4pBdn//sqoqjucix7ruOjkaR0igc0H0N8/3SbYtGhRXg/ldGqAScnqteKhVr8M6hG00gbKf0dMKgkXQ6yCdYKVssY58YkVQFpnOZQIc8sXnBk7XP1SWjqv9B+f3Mc63WpfIk/HxgKII9OiB+K6nmx7AIkp0+YF8PvWoD6u/TV2bzc3u5UoPGfFbKRCIr4uey6/ZwNHXA3YDCyFwv+lLhr52h7//6eeCGrC6fwAgLU/elx9uPJJv133LpbFFSAAwIaNOdPrAfF0gtbJrn29R+AuY9ar3M5YxbXkIGNzAsirEx8J643seK+MiQXC7/Nnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Thu, 18 Apr
 2024 11:34:56 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 11:34:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH 1/2] gcc: fix for host key verfication & kex exchange identification failures
Date: Thu, 18 Apr 2024 04:34:15 -0700
Message-ID: <20240418113416.93878-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 078a8b33-06c2-409d-182d-08dc5f9b927e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V18a+lrB7DpaDi8EkjFk5CD9/0AEtJ3jr5uuO7CQ7/rc7DwNfxofLO0jgZMYd5KgsDlNpQ5DqV08VDRZ5trbhwwapWqffuNM3iCCxQ3ui5H3bOpmBki19t/8HXd3PYCCxAiR+khaf8u63v01LwCR0T7BpAQ7V9OoGdQJiOBZMJK24flWJcsqVxg+BJjJ1hwTpsD5EdFPkd9idpGsPl0YZYR3Qjzswimgc/Aov4i0xFGW3yy3QpV+Wq5lfDNBX4AupS7T2Jvvbcz6hCTuy7le5HXLl1RbICm/KNHwhnauiZ0hTuslyfiaNHpSujy+Gc6Tw9bl8hx+kbrVYFK1ljGW0FeHxHd5kmgOmYob//a7z242755qcEt9xSRfRWEVbXh60jcWma+NO+9K+kuqjvhy5oUlbFof2zUopFoy0znKuCr+XKW2kIJIsbvCjIyGJKTVC9wWPQAqbDWTZBZXUMZAC/PEhl+CmWTQ61aNQEfeRBV5IaDnJJUOL6eGZWPIcqffIJxBe7q6P3b6H7lVJeuGEWyHmbzWWXzNdpV7pPCv480vPdjSD8qmA7zWxQaRYy80wcSCDspP5BHyxM+hiEspDFHbmIGANjRQu8r2wC03e0fV123aOT4WFk97S4aHpO8nRcvyg2dfQmWc8n7aF6p7AmsAeSmHg0t6Lk/tplddnxuMcG35+7DgLdM3pXJddDlpFuQeSKa9+2/1+gNPEFgpsI8iZd2xN9kWDWvqjztvVKU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8pmbva81Vee0iGhxSY4lIa4Izx6Y1s3HUn3LKXZQJPj9aWUv5ffJaUDGQG35?=
 =?us-ascii?Q?I6/SpohQxo+PQ9jVM8l9ogW5R5pwD6DAu3qcSH+/K6UHB8JCzzJrVo9YVRJJ?=
 =?us-ascii?Q?DAEp7+xc6iFFqk1NQnSrIhtrfNlL8ApU36oBY/7OZlXA7JuT+P09wo304K1v?=
 =?us-ascii?Q?k3K5PVCCpIsU4BbgoAsWOB/8Wn0BJxKAisK4MsHe9CIPXyRcnEruocqJIX9A?=
 =?us-ascii?Q?fPFo9MOVlMsfgaz0/4mpCSD0Jmv5xinZADi14PyEjN8EW4aAqL5Bd+1EvPR6?=
 =?us-ascii?Q?6ye33wd1akS4/8PoZFHQ3+5A1di/iMS+v0kepLHkBtktlfBbRwLprw99yxBz?=
 =?us-ascii?Q?2pPMK54o1hRzl+dgOvY/BUvTbWE1UX2Vayp+9n313nmwiPVhPeqGOauYGckz?=
 =?us-ascii?Q?/XGsR0JsqEdOvpRQ66FLmcIGdNuSUGHBimXXKYlluURfTRaIK7Dmp4sRFkHL?=
 =?us-ascii?Q?/e6OxawZpR2bO5jmsUsKSGsc4MpbYdj2Y0Ss19d6jK3zoNhb/q3PDbxP/51W?=
 =?us-ascii?Q?vlDfQqh6oasv2boBcv4qFSOk/AKV09ZQJIiShtPzRHciUt++8oJMbU1cZyw2?=
 =?us-ascii?Q?VcAhduMXJp+6w97kfK4xlrZ9C3I1TIJLmUcJ+3Pnx/6iLB2zei5Fjk4Sx8sF?=
 =?us-ascii?Q?a3sfTztNkxarhh6Mwj3xfFy4D2VOVfOozDe6ylMDwPFdqSSTLHgkMeEk3ljl?=
 =?us-ascii?Q?chJBqRSk9GrJ5YZcD8TJNks0uwcGolESfye6yiwCr0bCJaUdehTZ1+JhCU1i?=
 =?us-ascii?Q?sdLCL54Tp1WMAiaRjbc01aH906cttjCgTXVWowReP+RPQegHfti4aL0oUuFF?=
 =?us-ascii?Q?ylfi6bEKu+bdgajGXrEPiylCySqo8CkyUQ46sUc1fKojR9rsuElGQPHBJwJi?=
 =?us-ascii?Q?06npNGKvRkabfICJ49Q58oW8rXZD8jesLc5JbdIgqMjO8wCmKrg1XUTGjreI?=
 =?us-ascii?Q?s1cnG/knPtYqPFvyN8KI719FlGQ5rL+vFEBprs8amhbjtaYXt1SXTQtgLTlR?=
 =?us-ascii?Q?5qjXGB1nlj+/LjiObaT5QXtPoAMxUhVTI/uPMnMrxnOWfJ7vxFK2pp5nmx2P?=
 =?us-ascii?Q?bnHN8OuUjKrdEzBdqvA06Zduqc1Dsu8IqAUShTmb6XBzRyCkXT3xzYUw9DAK?=
 =?us-ascii?Q?GLEBGSw8ibwFNgl/mkFrkzXukcREhdh+67s+D0xEZQhzbjCUfx9cgwS0qjWU?=
 =?us-ascii?Q?J0z72eIa+W2jBmFqXXo75cbi2WOB2kU/oOLiAjbTg5J7byQjs6wB6guGkcWy?=
 =?us-ascii?Q?68xMcOJG0VOpAXh2VtEd8vUkFm8nZ7z0wwef0MTbEjp0TONd9SVkkJb6iYZ2?=
 =?us-ascii?Q?H3THc46yMyfgp4w6LvwoOSOD9duMQD6uDvo9Yjm0gQw64K5Rn0KZ7LdoIvm/?=
 =?us-ascii?Q?WeoxNDjdLDbAhyZMKvuTbeeI9YYMjvn78yQN4PfSkh2lN3D5Y+ulubzx/rTf?=
 =?us-ascii?Q?5AA6OPvohOtmxSCYqLRWrtkVPPP+gpCQsObwS73J5GVLI2ivvc+Ru+paTAA7?=
 =?us-ascii?Q?6G6+8Ip+6UN5IwGKtnqh0z6ncMnBqH8nNHmyqAkKv5bbYufhTkHNIofh7RVD?=
 =?us-ascii?Q?9Rt5+ED08KmyIYYkpshL5C3ctFehe9vhZnh+9pGjbcdWV07EANil0v4iyc0M?=
 =?us-ascii?Q?cwSvbcF4C7yFrb7HoJDubjk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078a8b33-06c2-409d-182d-08dc5f9b927e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 11:34:56.2968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVc8CkXUa5P5t1lCMwhPanTh0xoE3+Zy0nytrIXL9jc8kEp//nY62oYtnPZyE6kKJDapYpAACjixB9J/TDYv1Vkq5sOsZoM0qUoQKKnETsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
X-Proofpoint-ORIG-GUID: FD7Ahz7LMs2zAiy24dEZcNhNr6hL3rO0
X-Proofpoint-GUID: FD7Ahz7LMs2zAiy24dEZcNhNr6hL3rO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_09,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 11:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198512

From: Harish Sadineni <Harish.Sadineni@windriver.com>

while runnig oe-selftest for gcc, testcases that need to be run on qemu are not running due to below failures.
- Executing on ssh: mkdir -p /tmp/runtest.3549641   (timeout = 300)
   spawn [open ...]
   Host key verification failed.
   ERROR: Couldn't create remote directory /tmp/runtest.3549641 on ssh
- kex_exchange_identification: read: Connection reset by peer^M
   Connection reset by 192.168.7.2 port 22^M
   ERROR: Couldn't create remote directory /tmp/runtest.3549814 on ssh

Host key verification failure is happening when ssh board config file name is defined as "ssh.exp" and there are multiple ssh.exp files generated during the build and a wrong ssh config was taken. To resolve this changed the board config file name to "linux-ssh.exp" which ensures correct ssh settings are used.

To resolve kex exchange identification error increased the MaxStartups.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py                   | 2 +-
 meta/recipes-connectivity/openssh/openssh/sshd_config | 2 +-
 meta/recipes-devtools/gcc/gcc-testsuite.inc           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 89360178fe..4cc0894d42 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -37,7 +37,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         features = []
         features.append('MAKE_CHECK_TARGETS = "{0}"'.format(" ".join(targets)))
         if ssh is not None:
-            features.append('TOOLCHAIN_TEST_TARGET = "ssh"')
+            features.append('TOOLCHAIN_TEST_TARGET = "linux-ssh"')
             features.append('TOOLCHAIN_TEST_HOST = "{0}"'.format(ssh))
             features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
             features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index e9eaf93157..b9357ef6c5 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -100,7 +100,7 @@ ClientAliveInterval 15
 ClientAliveCountMax 4
 #UseDNS no
 #PidFile /var/run/sshd.pid
-#MaxStartups 10:30:100
+MaxStartups 75:30:100
 #PermitTunnel no
 #ChrootDirectory none
 #VersionAddendum none
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index f16d471478..0a950b6c9e 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -101,7 +101,7 @@ python check_prepare() {
         f.write(generate_qemu_linux_user_config(d))
 
     # write out target ssh board config
-    with open(os.path.join(dejagnudir, "ssh.exp"), "w") as f:
+    with open(os.path.join(dejagnudir, "linux-ssh.exp"), "w") as f:
         f.write(generate_remote_ssh_linux_config(d))
 
     # generate site.exp to provide boards
-- 
2.43.0


