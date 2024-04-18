Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDA3C04FF8
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 10:51:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9886.1713437468892692743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 03:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IjFiXYeq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48385b6f73=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I7D0Ti029193
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 03:51:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=bsMd7Zaxpg2wQ7SfkO
	lFzOOKOgVU7lpLy/QDociz+VM=; b=IjFiXYeqgiQfa9VqL6RF26gaPBKT67eoYh
	U14U4Isvmp6CqWDLSGbEtVmpJR0+7gvML2vN4eyg7Jf+hsjF4bpNuxIhd8TcU3Gg
	ZpSdhCBL/OHRcomScMT7Khe+SCORhRAkO+mveionfjkekSVank5W7nFPufVKEj01
	NkfBxFNn5aKpW4T2ilJNYuazDMdGTvqUAFgdMgEckFKrARzWAviEAHLs4sWoNvLj
	XSAWWQ+F0QgROUNGEiEemj1drYhGPr2Tc0PUomibh/xcwo7jFcAXMBCz/QLZRFHn
	i80Q3ATihY9jOISEujnpDnrQJU8dlsxgwy5jX3e1Gw0SwOV0Mkdw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb14qrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 03:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZcsZ4vsEk0pLVQhmrK5IT4IQFIC0hEYceYNLikAOgigzPWSPM4rc4AxrbNvpsE2c/+oAP6YHvELAdOqK21vFUsBPr3e9hiW/1pysFOHychDs2p+0Bd+SCw3UY7so4vsyQ7u/se2FdhuP5T4gFIztsFRp36XXtLuiH2aPZcLmMSi3K1+ddL64KEBfJUOa+QyWJ1ywmpCtYRgeSCjPen7UU1LGy5AmqooCw7WyshW6FYGengPuocC5x7CoHKUNqeJy6GH+dkF4quZ7qvme/n1IRmZuFhgLh26PtbKRl9emosGJ/figxjkUr9axwA3eM+r/Zm7aPom5dQZ2TLTWU6uXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsMd7Zaxpg2wQ7SfkOlFzOOKOgVU7lpLy/QDociz+VM=;
 b=Bn7TRijC80n9sTPQWhjhp7UzE5nmDEfUIlx8ta1qVisOW2K97uQvB3Vqp6LkqtknzFXIEMyKWq2gvP67iW0pVdsKAGlm4cdPl+KRQ/PdHS20jqrarU5O65AcLQYUjOn8M6oLF9T9VNotMLod9eOeRhjegkb6Keiecv9eU76/asio+fJ2MO7S0TqET8yyRS+QvOuZVPMdJR/B6KZmeSRq30nd24Pz2r0Xc67wlw6KutBD7IuepDPjsSATQircNHh8e0v8WyLv8qC2bGUmVwmo4VHVXKDkTRI7g4QIqog1e9iFthaOmaRsEybgxTdI/mpHDclWZypgRcFwx/SxwyiPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 10:51:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 10:51:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH 1/2] gcc: Oe-selftest failure analysis - fix for host key verfication & kex exchange identification failures
Date: Thu, 18 Apr 2024 03:50:50 -0700
Message-ID: <20240418105051.2559536-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eebae1e-ad30-4eae-5ebb-08dc5f9572dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b6Ngt1oWovFNuXCgRnDaUNOff4FHwYsSd74B4ydCwOqUBQmypWNsh98AyBsMhVRC+MbDEsdrJmlY3xnwyxwlhw2NjQqNFu2GQ8T2aksV725snjj8gSa7dujpgYl838jOxOvkkefiBjewcf9VOoWrx7ApCJDVpd8s4F0WWx01zlF8tk1rKsm8WdTCQQeTZ8OtPycDBJkeP2RPp8W5ZE2gZhTYo//BQ6M9hKq4sfDCnh47CtXGX4zwnIvPHh2+XsjaER6xWWiqzBWOj5mr0fAg/BLCl3I8EHeF/upPWCmujeEz5TpYkia5V1BkYt3qanTmlty31p7Rk2BIqwi2Fxr1HFGWCQiWVvdFOwbv9WuH0p5DAFQpW8yv6axTVJrons4AUKR2Sil7YOip3Kwh8PR9CeOSz9nWRkHQ0L4NuesE09b3uxGGMgd+X3EPFhL2Eu4yLeII+VCBWKLoK0eGMqlf331KXouvjpcJAjbl4lgR9eeY8QxTRYi0qdpQo7brylIteDZs9vdMrq5eUzJVNwxtlpeEWvaclP+2mgl/CoBOotC/RaL59oPtuRYQ+qtbLBDVdRXfWDyrJbJwhY2cwGJ7XSk6Ivq74z2/bChqvxW5GgjwsnkoK6brg6Id+XeP6aGItaFAHKX8sjdgOTUl8mdirxqVIJo2y4fY9CUQqzOJy2WQbY8FLFLJ31iQvgcWLWQykbqN8h0jE1P/Ov5Ph54FOW5syTlebWVgG6VALo+rLbc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yxUuSaG119M9PcX3IknhO7wEVWcBJWJLK+9W7bZe/J/QkLazU1W53BQf1ibk?=
 =?us-ascii?Q?K4I0ghrqv2ttCteTG7Hvs+rymY+iWxie9TSx8Ql3/o0ya4waPt2fdZUr5QJ+?=
 =?us-ascii?Q?WCO4D6Zlmk532zHf8w7TTqkzpsDO3YAZ3PcZYeASckO21BJkf5warC7MsO/w?=
 =?us-ascii?Q?LLUOTOL+9cfb3B2SHM+rzW+wPTs+8GhziKrfSr1HxINzXvOpycuaGJh6G1rP?=
 =?us-ascii?Q?zrhEBuTnu+c/mkjjgaLoAW8JyDtNihk9ewl8dM0Y4ykc4AzHWxxcJYNg9blg?=
 =?us-ascii?Q?I4eL4IPchch3ZHjTvrbEy3KfOuBYKoqlY2F6PHkZZuteU0pmJv1cosFFQ4iR?=
 =?us-ascii?Q?1CXgauSh/FdgGMeLKjoObUggfaqvZ52m3xKVjpRZmJVgAfdNit7N0CYTYxLR?=
 =?us-ascii?Q?2HCy+JpIA1JYs6bFe7qP0STohqJqtzFMMeawQ4GjmuZet+sF7tCSN7xSrzHt?=
 =?us-ascii?Q?BYnnD6VnS6xZIEL37s0YDL++LV6h9298QOlYrlxfkDx/G0JqJDth1gXuMSlA?=
 =?us-ascii?Q?tUh0yb1L50W57a6qzIBfTe0C2gnId9fr0F3mW3QtReZscoEFCnQHboZglrQ3?=
 =?us-ascii?Q?JI/V45MOPqS78AffOhuG0h396cfq3wletOQh2esYMM2RE6omHdSYDpG3NJrd?=
 =?us-ascii?Q?QkztCKU5ZkrfMndkKD+XkS/6w1XRyRfHQzQfJEky743cwTFpge4j6c7JUXep?=
 =?us-ascii?Q?c3TlTH9TbAA/OTl7V5pOw25Js2tpQ1wtfOKGompBkbJccu1eLwb7MeTpz/T9?=
 =?us-ascii?Q?lPE21wsy6VwmJ6d12Wl+sAk3tps8QSWoAmnAj2RNDsnLVtbpTGz1V0rh3OWS?=
 =?us-ascii?Q?TmF8U9QXs8gervw0thZb95SZSUDlwtTavHUErB/UGaQ3pwLlSec0yDyJKXxC?=
 =?us-ascii?Q?B5Bn5IRAiwV+zEb16+VOERD/IJslebjkZWTrHrot6FzGTzMkubLQB+5jLU/4?=
 =?us-ascii?Q?YRHeWsgh6uYvVaREXPAHiX/FNl6zG6RAYi0B7LUdu0CtzMlY3+Ws8rZ8MVtK?=
 =?us-ascii?Q?oZs7GpdPYxw4b3J5I6sC6hRZ2exEZ5Tr20PGYker35YucD0v6L2wW3uLZZlh?=
 =?us-ascii?Q?4B9o0yxVW8I/8FDKoJrYBmOsjexj3sP2tlBephYZBUXr3lYkRe2W1qmoNxj3?=
 =?us-ascii?Q?JXT3V/33hYV9czvtYv1KHWSKJMQ9K+rSrj3Y1Sq5i4JkAg31wA6dQbaKiM0w?=
 =?us-ascii?Q?2tGNo47cXxDPoN5xTgWnM+d3+rPjqt3WmBIMeUOEBz5jjcN2XEeFRE14bFKA?=
 =?us-ascii?Q?T8Slzjp/l/oH7w2J2S7xLnaOh1G46//jACM10c1hiAHBC/XCMCeless3999I?=
 =?us-ascii?Q?vZRavFe4fnsFIr73V02XKNclfSO12qNoQFwxwbc4oStNxN0DrnKhniGr+eGh?=
 =?us-ascii?Q?Pogl+nk9IWv3EeT2BaJkpzrrgPJcHHBRh7Ns/F5UotV37ARtoUtSCzam+bwy?=
 =?us-ascii?Q?HeA3bsQ9sjU7wlmtd1V7a2Q0eS+wsBeoWAwmrRKVOn2zrqD0F8wsaRNFbOho?=
 =?us-ascii?Q?J8ZCA4G72BnByublmkuteD5UXOAHO/ynD/cR0YvSvoN5Bnqlxh/nRruQ3L40?=
 =?us-ascii?Q?6XFEgWgY5jWaa1S/yHkBBoYRCMKqeEsZSuP0qoC9ZEmivCv8MZLcP8fM8c/s?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eebae1e-ad30-4eae-5ebb-08dc5f9572dd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 10:51:06.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91sQhcGYhCI5coDC2uei+GsUGX6VWWD72u946L30zXjjxI+UI4Ki9WiZ4ooqRNMgob00/vTq3/52ymClzFLZ2PykQH165SJ6gmV0nAEf2wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
X-Proofpoint-ORIG-GUID: VmhdHEwZ3fC9I2t5uIKbEA0zlMmeuv7a
X-Proofpoint-GUID: VmhdHEwZ3fC9I2t5uIKbEA0zlMmeuv7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_09,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 10:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198506

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


