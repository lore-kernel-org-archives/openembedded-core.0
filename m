Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9067BC52D7C
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 14:51:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.61887.1723128683231289145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 07:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=895026df3f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4786hYlp002267
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 14:51:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v09rsqat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:51:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEHrsuqAiN7m5gF3Xj2X8hyHI3a2sQrvUfr2b0bG1sMvBHLOfWgFl8JqXXyCeAlq/N98qputotELt6eZGieww9JUZqXOa+uNA6ChUWmSUd1/TyCqMJWr501CUfkPFRBuCEU2Y+JlKgcJCNYFrFy2j2UqID4HaSq/Y7xZBdjuZuEMLzhnuG0m7LIvrOsRIpCq3P22Y8bqPo063/O5NqwhQyc8XQ3O55slTVoOceZswMCRjs//CRqPnDEgCqLgHnjX9Qt0uMcIclgU1a9KSc5toqoxAWX322MZQ96ubQotqC49YGC11Q3udMyDqvp4928EBgeMMcLLeetndwQ4VFyfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf96/ToxApkcjaPEhAmhtRW83fgKKliHgaU3DeyDJtY=;
 b=UJVUHBuItt5E/hvNAQj83tkzM8AtQMHhFV9Vy+EdRouzTd9v9BkgQgV6urdJbqXzDCtH7iCAjmUUj/5dg9skFmKMJtCFxyvCvVNSN1b+Q0t66ADOxEGuR0TlGnNkCIe3QAgPKIqDmqczEQpzldrGJYoR+SQuq1BBP04QUKUQcss4Oq+nEBFGzqlCGIUg7PFTGXGrJunSLM8RvoP+3e6G8PMENLIBdxOrMZd9VhbyCSjGIVYuoylrtMZt8c/7dJdzJ8nuEX3NC25wSzpoMC5nIso/vN4KfoDFR66WjF/i7I8/HW1UM945IuTs0b4CFQkvK303y6oHz772zHOR6HuTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 14:51:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 14:51:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH 4/4] oeqa/selftest/gcc: allowing multiple ssh sessions
Date: Thu,  8 Aug 2024 07:50:42 -0700
Message-ID: <20240808145042.3914762-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
References: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 628649cd-6fe9-4370-441e-08dcb7b98d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0PHPHa4Z9nuhYEqQlsxqSgf6XZnMBRWsTCF3kF4q2Ij85We0Bp0cP0XwVbap?=
 =?us-ascii?Q?M+Mjh8hADhDQTzUtRoI0sy3nICNr9LSbAtUgydOs8Hcjqp+VjhBYn/2Uq6DL?=
 =?us-ascii?Q?rFeOCJRNwMxdQgZbnOCvE8eRFu3VGYtF3DzeqEpub9i2sUaX0ZsAqoEJI8g7?=
 =?us-ascii?Q?tVOi1FMT9O7efZYKsLlsX3Ain7L41SXyysfofl4tozFleafieIqMySePG9Bq?=
 =?us-ascii?Q?fXM3xfs20doy6INIZtpAcBCb3rVWvT3i1NMvj5BwIDuVsY0NISXS98hv1mI1?=
 =?us-ascii?Q?Y3J0jy/JYJWO6CtaqgqmqjOjsaURYSBH9w3+czmMto9h5FlaC5MWQeA7IUZa?=
 =?us-ascii?Q?tPeuJoyB5qJHb7SJb4+Y1JDPcisbfECa3cpb4RBCSOe1ecVUiE51Z1X8Yx29?=
 =?us-ascii?Q?GLXI8BYmjuZ+SjD1sowoXts2FNceRUaR5Lum3k8V/jsz4hl4xAwsg4P7yVLG?=
 =?us-ascii?Q?BpGLjAjEXfZZ/qIC1k8o916zfkuvnT/jLxoJNh36ADW7FIX0EsoMEwmB7TZl?=
 =?us-ascii?Q?ukYt7CRxC/mFRkuDc92q9AHcU99HYBwjnzbi+SslkCEVXkRLkSD+4WD1gSJ4?=
 =?us-ascii?Q?9QLriy9FXrCuTzkWOJXjwqWkscDNb5XEmSG2qHFYRphOQtIVdbRS77fmMQ9B?=
 =?us-ascii?Q?oK0XTpEE/kYZaJnJT+HIKKlTPqPmrJperdh6Zm0F+RGuG82jEL/DuyWlHWA6?=
 =?us-ascii?Q?0CRXZ/dmoYNxY6MLHr0hEZH/nHZF4SckGqXe8NZmYARap+x2T+mESPG44akP?=
 =?us-ascii?Q?oKesL9sbez84pGi+6FRGf3iDnoWfBdRytVQir5q+2kLMJM6/DD6UfynKH3Ys?=
 =?us-ascii?Q?i7hkwEtVh2X6i3zYcTWDx6Hcd7LVpu9PadDpVvvhNGcU6YvHkp5azlLytouk?=
 =?us-ascii?Q?B7ljEGxJHP7FAE/KBZowmhDWrzmkQ7X31ytatR1Sh03YKa6yUU9uwCWZc2mS?=
 =?us-ascii?Q?f7BnGKB09v8mzyWb522HVtx+UxJvW65IyUcM8w+P0TrgwyWYCXOqzlhH4Aoz?=
 =?us-ascii?Q?PPA4Q2k5z/sNVERGvMHsSvGMSFrLq2is9ktIHv83ITBa4yZUcGvIpD9sghDc?=
 =?us-ascii?Q?ZazwqZW6VhCT9VqkRUxvpM3PMgZpGtddFWsfuJoyh3O4ETi/CnZcfQyeYRZA?=
 =?us-ascii?Q?WbObpCPsEf+CQ+ToUe3vXjTquZfSt7Ej2NJFbrvmw/vTn09V0UJfxhnTSGDF?=
 =?us-ascii?Q?nqrOT144fbX+FY7SFQNSUvRTZqoKua89EKGMwtUe3mhzo9zlOnxzGcs6m810?=
 =?us-ascii?Q?9MRz09fO59zuPSzs2Cl2U+eiUg80IQAqDhd2tIIA101bNPFw6dRRBhah6LsL?=
 =?us-ascii?Q?DnRVw2TVDNBPqoQDmf3GwnDPW2mzgZDCngomYFN6+v043YpEKMz8O+T0sqgY?=
 =?us-ascii?Q?LKmmipWBcOJNMy/s49/LaU7npLtob87ypK2b+9wWeh3bVWrZEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wUYtYba/HBQqd3kp4FO1PHx0Shu8HeaNg7eZEQZ4F9yrysv2Jie+ywTMz5jS?=
 =?us-ascii?Q?TK4fFo9VHpPuk3KQZd3aiAX7cCLen1IJaNOa/JUPL4FknajkNGALFkWN9dY7?=
 =?us-ascii?Q?XUD235OgPryuQ3blUNB3/5FKlagxpCUw+J13na9ln5P8pGOcjDt93110OX8B?=
 =?us-ascii?Q?Ikt/C1mGHlOY6ImaIgTaZE5R19JW8I/Hw/Bzvk4Xm4wMVD8rdu1WAI271gOp?=
 =?us-ascii?Q?YFa+AZJVK7H2ifnsr+G0cyyzPqknNvpPJRUwzdWq8p+KGtKxX/dZO4r7GGZ6?=
 =?us-ascii?Q?cjMJlD9ZUkAzQ/vVd+zDoER92UyRXI6DMfVl/yreuNipmnIBxisqzdH2z31X?=
 =?us-ascii?Q?NIm+bl04iC8uEbUfJHVY1Qio54athA+kpmRMWcYrb/jy2bUm6iAJBbYf2JuJ?=
 =?us-ascii?Q?cJjPWrC7CZ6Rd0ewJosc86DtwZDSEvPgxYIirYO3GI9pVQlKO9Nsy8ehdzsj?=
 =?us-ascii?Q?L0lfBFSZJrkyFntQEDQCxzE8tFKCNJNBUWxXJuvPqFNjQzz7VuwPWxyZ9+b/?=
 =?us-ascii?Q?8nZ2FMx7u3m6p0uHDSFgAZthQPeBh6VjcVnZOSqS1JNat/mS8U87ze6/n2b9?=
 =?us-ascii?Q?siZnVvFqJehfFbJXRM4TZd7WKcD7SgU287VDmqoSGrsBGglUffkCPslmQ9/p?=
 =?us-ascii?Q?o+5ZHOLewS+zr6vdt7QtNKTQz8CB8y8+ouHyviL7sKungb26Lt7RF6GkIMhg?=
 =?us-ascii?Q?Ma0AvVeW81WladbdR9N3PNFRQj12owI4nZFWbN9zk8G+qHDWlhcvpINER+4u?=
 =?us-ascii?Q?H8fCK81glkbVuxXjFD6j9Ma5x61o+ync3oZqw9W+4Hl/5v5qp8ctmC8SWxmP?=
 =?us-ascii?Q?F8zHUkC5h/rqUWwbIrqQHaU2PlCQi56crXrEs1UduBtJEqtTbMFSbJuIVOx5?=
 =?us-ascii?Q?hTaUvwqLysfAb2bQ6TuOiom7IhkIRa+FRDfuh5uHP89h2cKZwhQZ4VZFwMNJ?=
 =?us-ascii?Q?Y+vmalNufqfzM51zPe37K0TPE5Lx+EOnzgUdt6E2bOpcjD8HYSeTzIL65kdL?=
 =?us-ascii?Q?M6PPMZCP9HD+r6fSFE84CZ+llEnt0zB89TbaNLVU1FVGvDhuWyfyv4BTfDeH?=
 =?us-ascii?Q?C8PxlyFaQWFKTCd9J7N5EWFExLbJvzeyyxiACFWkfRSBJLF9lTlIKuQi+rlS?=
 =?us-ascii?Q?6SiwQHNg7DiTCevuFH+1BMiFZIAmp2cpUvBwns/wFmX/d66N12VqVj0AhKo9?=
 =?us-ascii?Q?9tBbuItoABX2bUyXFwECG8pUmmwEPh//DNsBphq6oPBBUqIJghQq3OpGqtaZ?=
 =?us-ascii?Q?KRE3Luv9miJ19DmQLBq9jSW3nAM2Oz1WqHI+EMLpqp8RjMPVmGQTsZt9+3Gm?=
 =?us-ascii?Q?HgqarPklQeFabVflI7pNPL4rJSER+4/3v6XKlVjA1nzhZuIu7oqZnpGv1qVK?=
 =?us-ascii?Q?4+xKVKLj6txk42pM/XPHDHXtScZ1bABGoPo8PI2ederFyM3Zgz5U+PO0YUEQ?=
 =?us-ascii?Q?yI/SfM59rtymTDp8bxWe8bUSVgOwaSwFKn+3VPL1FzB1rCi4pBroUsaf/nxy?=
 =?us-ascii?Q?RErIgETiG6PpL8Q9nAfhOEoCTW4xfaq1DC7NmPWUBpDe4akFBIXNXpTboTWr?=
 =?us-ascii?Q?SAmd/NZBBBKnxyCQ+1rHYj2I6ZJ0G5Jffg8sGHe1pjmevzYtA+Q6l1fuD4Zi?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628649cd-6fe9-4370-441e-08dcb7b98d6f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 14:51:15.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dktYRRZbx0C8KJDIYgFdPYUHq/OjDt+H0oNBWlkYD5dlmNoZNuKim8YzT94mI63imSq0HB+36DFiSmqd9Rf3eUyKRGPUoiYKs4Md9+wFnT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
X-Proofpoint-GUID: NOWUsRAlUKsJKQfJBsebqteXaVWV0iR9
X-Proofpoint-ORIG-GUID: NOWUsRAlUKsJKQfJBsebqteXaVWV0iR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=802 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203142

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Reusing SSH Connection to speed up remote login process
using multiplexing to reduce time taken while running
oe-selftest for gcc.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py         | 23 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-testsuite.inc |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 4cc0894d42..036c69335b 100644
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
@@ -69,6 +70,19 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
                 for test, result in parse_values(f):
                     self.ptest_result(ptestsuite, test, result)
 
+        if ssh is not None:
+            # Define the control path used for the SSH connection
+            control_path = os.path.expanduser("~/.ssh/control-{}@{}:22".format("root", ssh))
+
+            # Check if the control socket exists
+            if os.path.exists(control_path):
+                # Close the master SSH connection
+                close_command = [
+                    "ssh", "-o", "ControlPath={}".format(control_path),
+                    "-O", "exit", "root@{}".format(ssh)
+                ]
+                subprocess.run(close_command, check=True)
+
     def run_check_emulated(self, *args, **kwargs):
         # build core-image-minimal with required packages
         default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
@@ -83,6 +97,15 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
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
 
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 0a950b6c9e..dbb11c8d78 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -87,7 +87,8 @@ python check_prepare() {
         content.append("set_board_info username {0}".format(d.getVar("TOOLCHAIN_TEST_HOST_USER")))
 
         port = d.getVar("TOOLCHAIN_TEST_HOST_PORT")
-        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+        qemuip_address = d.getVar("TOOLCHAIN_TEST_HOST")
+        content.append("set_board_info rsh_prog \"/usr/bin/ssh -S ~/.ssh/control-root@{0}:{1}   \"".format( qemuip_address, port))
         content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
 
         return "\n".join(content)
-- 
2.43.0


