Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CD5C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 10:51:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9887.1713437470660660853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=THwRXfG1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48385b6f73=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I7F34E032075
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 03:51:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=dnsxdLV4dYRIPO4VHJkYMRbSnH1WQS/vte6DI3ti3LI=; b=
	THwRXfG1OqErH4Ok43ZH+3LYAHW4N4TN/15HatsELm9gS/ZHQjaRchZg3RwOkxiP
	JUrFXdX8x7Hm9y52NbmfZg0rrV2EittynvdX3BzyEMbh98KRHv8AmV0YUY263iZ6
	Mm5vsKKfio1rW4JR1lFeJHFt27VMcwOUbFjnRqPaoP/eeXgSr9kD4wLLLGAWPfYd
	j412fGYw98FzLvh+lB6eBxpTtDzesijbpRIHqFhITwctcM/lOVug9y/zgq8K4F9N
	fefoR9ge2/kiRsfbyQaE8gwWXJmw9Swr+6HlGFEPRx54gB/PbHGoycdhnE6Pp0/B
	EGaHleuw79wNLgTnRREDWA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb14qry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 03:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDFz2TsE5WF3NBMEF4QDo73lc4eD1rQhg8Chz2oBWC1FhZRpEwuOaTNuIYcxyyrqyUbXBABpW8dMYsE6HZth3iS6ESTahTtjRQynV3msmVbsaVobg2hq0y+5HNybQ/QZGyd+lB7OoOyTuluh1m1eZeOatRxCwC2OomqRGnuALMvKJV8cNW7YNXUFnLIqWfqBCyIlDXiB9N7RWwZA1qU6BwV6olNlgvT0YiL1UR7gwsFat5ysEwl9xjDUZEInmVdYGM890d6nEZEf0xRqe1NEWACEzwFQwiFmoHZoQr7Qeu2KPqaNx4FGaru7OaqWmZQ3y0XALxlTubLjLeOq+Nm3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnsxdLV4dYRIPO4VHJkYMRbSnH1WQS/vte6DI3ti3LI=;
 b=n1ak0CH4KclFAhxuHBJf7RJlYc02o3U8cpq43r4Hg8FjfDRISJ+iSK0h8WcEGC5YIQzfmhRIyfi+mtDNkIx496cMwrFU6DsyCeiV8PNn7UYy+DZLUywjCwHKgDZGDQndlzJ1x5bpMeGuUgIMMa71fChbSkwhK8ylma9ceWiJ/8FVaoLpFwUZryVckQqjbZgHTbAAFmP8yJtubrW485ondMPEc/xkHIyxf12VWOY+qLPhyie/fbTTy9LZbl7ZASrrB8WpOJzj/pUZQx5TxGbkaBbqeo+LX3frkatl3uPP8EH3ABB/PhD2pWn9TZsDez5PvxGN6vdMYaPU5rU+nack0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 10:51:08 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 10:51:08 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH 2/2] gcc: Oe-selftest failure analysis - allowing multiple ssh sessions
Date: Thu, 18 Apr 2024 03:50:51 -0700
Message-ID: <20240418105051.2559536-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418105051.2559536-1-Harish.Sadineni@windriver.com>
References: <20240418105051.2559536-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de1acf2-7f90-473f-f715-08dc5f95743f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/MGL8Goq0kHXGOX7rW6+pS/hgRKzqxsgrcWuefK6vL3XNwPDFQB4q/+2A2eq0A/z8ZQZlNMcQBlUNXuUzxJrYEzhRtk743O8czGA8mR+4GTfJ9uhcb3nUgaO2ftntZb45t846WNflfxGMkdW5MS1aJLX7BME6Ixt87bh7L+F4VajaAmXhR/dE0MCLLt2VcRDVsrUKOulBgp/TV6hBEs2rRVJ8EiFbEO/3dfKS0ksIw5qq4B3QeAxF9eK+KonBlqG4POekYofnLC7UPax7+Hov6vu/YPRNuFWP6WBGhO55NySJCmogEQtJjYCKeG1RFF2fUfIanH6hFz8hIAnY6pIjm7rflYu68mxj50Nozk9HHRiYw4hWmCNdZ1o4zWH/pc+6GsAGVE1aK3NvswiRs0lJVK/HulND3nYWJnnCbZkfuNy3a1IPxMy8HEjyYB53/zFm4lQjnNDSbz/rAzeUYyihtpqxVedLhJKxVIl94RD08O/CXk3lWWt0jQAav1HagpIVDbLxzDbjm/xe05QZRu1XmBcA+nYgAHOQdh6eVRgDoa9tRKQKKiH5xgdmsrjtGmpcM58gvwWhqNkMg6L3FnU2KY8UGSKBWKAwFPTyqr5TeIVgnRvNOnvPvl9UcdC+wxRgHkR00I8dv+7FblnM+ea+zC/HxBii8r94S7IdGuU3IhhdKEmM5CVUzNkSuyQAlLpLONLZJ9UQ9G0rjp+yRXCWSS3G/fq6j/DnSMIzskArZU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FGAXz4Qz3zu+sYgtQ9z3maqeTMMS82C/qAaBbTQ5kBKGFHogjJ7VeuvPiJfZ?=
 =?us-ascii?Q?KnLa6Q9O6VcXpJ22SEoBd86wLeV+58QH7dRMkmZ4SyIbt1Vqz35r2VUdj5CY?=
 =?us-ascii?Q?wWRmnBq3Unz6IHUqrRTB50OPEKSR5yEWFZ0Q+yNwe8+9ZvRLVO1zGTBOIdk+?=
 =?us-ascii?Q?Imig2yHcE0R0EfEtmCUdzV9GtnklAY58LFC+XBNZryeHyWxO0mqu+VLOW7eP?=
 =?us-ascii?Q?lXtSoyYSgcre3pXH9neiFMbbjjmot4E/e/27xKriPae1rKnTrI3ofr/L42Ye?=
 =?us-ascii?Q?0X6cT7qZa7adaBU9lWMae/+2UbgvxM5smxXTt0rA/zmedxfagiK29FYgFmCe?=
 =?us-ascii?Q?hlf/5laaqcId4bLVCRYi/rXcXG4kvK9bWVkI70w5M6DCL+Rbo64DEJGPknW2?=
 =?us-ascii?Q?tNHx+oZxyCKt4xm/bi4I59iE/2EMLYoJ1IAZJqq13R1B1rL89vDaqxyBQZg3?=
 =?us-ascii?Q?klKgv3PjNdOx4p/Ixoc1BOmzpMa2c186fSWNj39AHozZF8OVQ9Q5Busa2SvP?=
 =?us-ascii?Q?LuOaGdIlfsHtz+zaEMWNJP8RiXMDZnmQ2n3Prn33s/zRcu6kiajcjCsrJmHm?=
 =?us-ascii?Q?cvVi/+3IzQp0/8c2gKALdY7mBKhrhF95gSIA++ucgCRhNrTrusmZaLLId3Qr?=
 =?us-ascii?Q?NqxUDbXIPxh/6ihbZ6Qg8sjPjntR7+ErVVj8RHIY+nbRtpl2+RKACF9Hs+6I?=
 =?us-ascii?Q?0MjVzo3OAi39udGF2Q/3G0FWn1dYlg5UC8E4iQwCxjzOv4RXjvwPPjdXW9ZA?=
 =?us-ascii?Q?yhZ5i5dKXbCdwt27Y+WFv9mugg9a/QvtbgBgaRnQ4tEHNKLA8kiFqNZcV+Vw?=
 =?us-ascii?Q?uOvhUxBMjtOR5dakL2CZqZeq33r1raaABpLkh4OrRagO5BG777qign+syLRv?=
 =?us-ascii?Q?gp1NzAN8iV1t0reFOjCeGoD8IKf15VCGya0BX8FK3AiT3sDLZ7qThVQTgklk?=
 =?us-ascii?Q?x/upCOL5FUtAEJ/u2Tt41WoDr8RgOLQXdttYrlfQa3sTRWgm9HW4yRqGpbJp?=
 =?us-ascii?Q?XPegLolrlTJ8tgsLmsSF8oCku82ElgAQnlzo8PfP9L5flarQucZJ4VAO5L6u?=
 =?us-ascii?Q?MQlbACaf+ZhRy/TniE8DPuXSoStQ+Ka6OiG2oHmZ8gJBZ2LHfvKJH1tVNILf?=
 =?us-ascii?Q?dLoledNj8MoOaU2qqNqCIBZz+fEd5XjlVkAhUCFM2hqUUp1LP64xEhGfBuyu?=
 =?us-ascii?Q?dyaiMQh9qkFO55kLqIIBAUKDLL3I5gfeRDr9hcc/SQT5SFncnUQ6eTI6vwBX?=
 =?us-ascii?Q?kAJXnMfvY8jn3JKjMY15rJNkvKGgCOl+xE22la1H5siOCQuRciId6x1hzQv6?=
 =?us-ascii?Q?Iq49uZNjgLw54KdFlcpGhoKitzuHQrSO4Ff7s1op6PDlft9pZGcyVhIPpCss?=
 =?us-ascii?Q?BsFpN5ZQys/dnx2OtZCAwESeHi78oBllCnlq0A1adDexfo1BhGk+BcZ+7ipx?=
 =?us-ascii?Q?dPzEMsQRVKUq9cTzLF5F7yiylBjGLceOmNOJExUsY+7rfn99MqU8TGZoeqjL?=
 =?us-ascii?Q?nXgqX+3Yz0jYLKPZoh655GLVoBhCeJg+0l2ap8d9XLO+EhQW3jQDgB+Ut2wp?=
 =?us-ascii?Q?LRTHs+hVzfcqUjwpI2mV94uf6HzCFmFZZgd8Gmftq7idFqtt82tKMPrrr7Vz?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de1acf2-7f90-473f-f715-08dc5f95743f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 10:51:08.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFlC24cFKZ9xCtlF68XFEenSnvu7a1AJe098jRrGsJYoXZkEvXrsQwCXEp5k8IBBdcXKMa8FnEgk0b7y0eL/1a6Ua3tfLazPhMZbE2kCO3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
X-Proofpoint-ORIG-GUID: 6UUK1KZz49I2wXI4okEqsHLtS-q9kvgV
X-Proofpoint-GUID: 6UUK1KZz49I2wXI4okEqsHLtS-q9kvgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_09,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=895 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 10:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198507

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


