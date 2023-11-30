Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECDBC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 09:28:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.68738.1701336491706378584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 01:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0698bd4b2f=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU8r58v002266
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 01:28:11 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph6dgbgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 01:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ait0wkGBkE2XkH3B8lgFgjrq3dIslslXTjzg0e0qcT7ApHnKW2fGQNCg9hOBTznvXHSY6/P+jfv6yhSKVi4xGmpsAOAXnP1zHf+c2Lu+zGDCzKZUolj4jRTv09T86UmeZb+A1oGJO8AfWnurzhZ7izRuKp279G0dhsjHnh+4XBNIlFPwiPy+NoQdN4q6QDMkAzC2uTelHSM9X0gADmCN7DtN8mKom1UoH4dwpBa4Db0ZmzEV5uLK4g8sRQtEMnXWY3bDDSmuLk1yzuz9v2GnoEItQbPwH/sPzv+PhmXzy5qwQsYaHOMJranacNUTrozJYYShT7uhXjH1XvQRC+GJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqGLGjIG9sYl8T14zF5VSPP0bt8bSLuNQdnlPOPlNhk=;
 b=ZF15u6mfbpiBl9HJiYGbqOpOssHpgv13RtGkvJ72+XqRQap6Oiq1+gxx04THBMB85rLWxEbQOVux1hNrXPK5XqkzpkK3cr4UAmfNhk9y72iMmhK0JSiZPqck3rufOx1FkZU2n5quHwkS37GFaTd8GIwjq5NeoUy97WW9wscf6pdgFsWaVNkFqHhq8uSjgJL4KkuLbdhqLFULGd8sDK+UP5ycpNCWN4vanS97G7WXWIxEdWQaiFBAXxsfS4CTp+wrMZfv+G1ygQN2cNpyja6cpOeaADRJJHGmz7bquqQV8NUwD+du2IR0A2Xzdx49sF35cX1S+xEnWcI6saMXbgTRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 09:28:06 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 09:28:06 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH] shadow: Fix for CVE-2023-4641
Date: Thu, 30 Nov 2023 17:27:51 +0800
Message-Id: <20231130092751.1382519-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::16) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: bc365aa3-ce94-449c-4d64-08dbf186a8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bNC431NGtqNlQQ1oP1hYk246lARtefa5401mUtOHbBDNYtzAoH6TLydKGoR2cFdp0byvwEQxEdnXpCUjWPF0pOx/83DA7ZlXaVmJj/AGC+fdLBy61c6QbsEJ2dDoOQyVL/4Gu/EXurF52/1iAnfSfsfnrrg/vvZa97XyNWmwkON4mfLKZRSNYemyPu3hIpYUipMySgQ7nOxUFUkFNdapGiWOCcf2FW1pN8godvBFuTaaSQoX6RR8ix5VPDn/Wwo7m2gMAPdkAyoERNPmfgdMGAXQID1qBnDHodDmM5XSw2SRNHea1OkpMEyiJQI4Kr6URqzrJxKzafs6xPoBdwR7jxCdZ6yQUtkKnRb7kM0gGVfEBq6+TiyypqpPekh3iykFIs+JX8z3afOj4sBVWMddYM+M7FufpDJzDxDXqJM/rU0g1ZF6CYdFmE8XVWF3ApOrGlD5H/wjwT0UhxWciqieQGzIQVsDiyWOIE6tVi//CgEv6FEYc5N6O4YRBp297Vt3zrp2G8yr/1ZOjUydOgkHa/330t7tNfNc7hW9+bfqHFzXcyWyjWIou3y9McilRUtoiG36dXu//AkaY3lShlZ0EyEb24UohbAfAvT0CK1aUfC8nhYZpnx9Jrrilv54w2cLIQGACF+1WlbNc0wR277qsQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39850400004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66946007)(6916009)(8936002)(8676002)(316002)(66556008)(44832011)(66476007)(6486002)(478600001)(41300700001)(38350700005)(2906002)(5660300002)(38100700002)(83170400001)(2616005)(1076003)(6512007)(52116002)(6506007)(6666004)(83380400001)(66574015)(202311291699003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A9u1KoiWncRHlCM7DK7VhbGtG+w+7dat3vvi1A+wmH8JWPU1qrl+Qck9nO0j?=
 =?us-ascii?Q?/7zR8hsGETrFN1B2dMrxdQ2LkSdJqPI8G+9R6KUfjqzkEQl2V7IZqRmGnbPl?=
 =?us-ascii?Q?/0K/B3P7GmFW4TDZ9VexBvtungHSOcoI2/nm1ZsRCgxdgNiwuVKaWJ/eJopY?=
 =?us-ascii?Q?C6kgHf7/i4QsbCYrk45+bjMl6bmN+LDX1Vbv69jEpFD9TUJ08ZPQNphQrvQq?=
 =?us-ascii?Q?+HznAr7r6avp27EM8dA8aUGbkQvD5d082GN3Wd4tIa0ZdUiYu0fHfqymnc/M?=
 =?us-ascii?Q?UAtEURgvwPjj8bLraRZ7XpKTV5IEqwL5j6f3X4iybr95ycBECkUE9ZCXBYi8?=
 =?us-ascii?Q?dR+6qDeI3X8r1nC2qgkxxKFVG5qqvuKYkUy8G9DLDy4buhxisap0GOqT1qKt?=
 =?us-ascii?Q?liqAPTm4O+0K2uAyGV5NY5qkW4I9D8qOEgEVVpoisjpGiFssPOPmgh1zw2h9?=
 =?us-ascii?Q?Po5/EyDea40G5pJ/jJt4PNjU0HguIRvMcJybmXnGy8bnzZjsj9qe7NkiJfkB?=
 =?us-ascii?Q?VeWMPRZ60HrFQ6q/6j/vKQaK/vFcNKuzEc/+DEMP4jS5Vxnw16/yhvo+lpxg?=
 =?us-ascii?Q?saFFU+hLKRx1Dp4JFSflk8o6/a3XicWCh53uF/EwRbuBZ+DmI7UR+D0gBxiN?=
 =?us-ascii?Q?cQWYov6woU0ZPNFwH6AyvnOtR0Zqtvi8WzqyBc0D3uZGjbT89LQGlR74qsDc?=
 =?us-ascii?Q?AVXZqpR9oJIWzlisFOlE3a8uTPIrEHw94Ex42dGfky67hzvVJhJKqVv9DU0L?=
 =?us-ascii?Q?dwfe8zX3sF/x3BO9gawAurfsmZt4O+9q9URjQGtYtpuOibc6jQWOKKdHB2Z7?=
 =?us-ascii?Q?51QOqHOA6qycEtvYWetTHk3sGLRMdIM8PQhKCnkv6QKxcagH1xIIo10NuyuA?=
 =?us-ascii?Q?8ZICYiueYO/Z9Xw0o2hHw8ZinIXWhQ9hPY8Wo084eNxcFLPfKCR34bEpNJT/?=
 =?us-ascii?Q?6508VvHgXKEtcRFa8to9cqQJJReVXdu+WVWtCWBaoALeOaltWL8/EQfRUhRr?=
 =?us-ascii?Q?ykgMOBG3HvqkhIiAheuo6wRmOcukXFS0OAMMcJEHgChvrHocdJiy4SRZESwI?=
 =?us-ascii?Q?d2oCmRUtfOgOhE9+0uFCf+U50UYSD4VrouoTxI6ZjQusZHNg7c+ADb5+wRYE?=
 =?us-ascii?Q?zyRQYACa3qdcHEFVStrO+UHqS/B75HO/lq23ylrix/H/Ua9F9+oLm2oWnA7Q?=
 =?us-ascii?Q?NW1KlcHAY+1+Jlh69IimPDqB4cMii6e+0n7SQirCutn4EjeBLiwoeRlc0X+O?=
 =?us-ascii?Q?Ofjr9epA8Gci4FtSjJmdjynbdsD3FqbhIBnFhfP6iARsmSN4xXoTnoK+Ct8n?=
 =?us-ascii?Q?oQXRYkRNhZEDoOb0QH6GkwRkMqcmMapV+OeKMHii/oE11+YxgkfPaFxhAJe+?=
 =?us-ascii?Q?BDs4Ku1VnH4+0tV4N+P9yd0qdR1U9+e6q5Fl8H1/QNW6RxLZpMZo1UH2khU8?=
 =?us-ascii?Q?u7eHDrVEBCgGxGZRgKghqlwJ5XRrCCWVAFROu/XEVDSRk4VNnzcwX5u1YDb/?=
 =?us-ascii?Q?fsrn4K5KzAsM50h/TLXJs1hAaAqqwFq+4usn9kcQpVciEDRlEjBZl/yRBu1V?=
 =?us-ascii?Q?A1SeptO+RCHKF9JQKlgfSJr246rGWaZVaRxAeaRioXDzxBScBfXKiWc5c09w?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc365aa3-ce94-449c-4d64-08dbf186a8a2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 09:28:06.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc/fyvQFETgzEmxux38UrCAteNjzEXyb0XYfc4/92Vjb5wf5O/7Xrvb8xUkbWhJeIMi/ZYlcKWEE6GLOnFHyttnyai36EI1TbGVLol6tfnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
X-Proofpoint-GUID: tE8UTB_6WqfLi8lBk0_T2IgQLGeo3tqp
X-Proofpoint-ORIG-GUID: tE8UTB_6WqfLi8lBk0_T2IgQLGeo3tqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191484

From: Xiangyu Chen <xiangyu.chen@windriver.com>

shadow-utils: possible password leak during passwd(1) change

CVE: CVE-2023-4641

Upstream-Status: Backport
[https://github.com/shadow-maint/shadow/commit/65c88a43a23c2391dcc90c0abda3e839e9c57904]

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../shadow/files/CVE-2023-4641.patch          | 147 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
new file mode 100644
index 0000000000..1fabfe928e
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
@@ -0,0 +1,147 @@
+From 25dbe2ce166a13322b7536ff2f738786ea2e61e7 Mon Sep 17 00:00:00 2001
+From: Alejandro Colomar <alx@kernel.org>
+Date: Sat, 10 Jun 2023 16:20:05 +0200
+Subject: [PATCH] gpasswd(1): Fix password leak
+
+How to trigger this password leak?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When gpasswd(1) asks for the new password, it asks twice (as is usual
+for confirming the new password).  Each of those 2 password prompts
+uses agetpass() to get the password.  If the second agetpass() fails,
+the first password, which has been copied into the 'static' buffer
+'pass' via STRFCPY(), wasn't being zeroed.
+
+agetpass() is defined in <./libmisc/agetpass.c> (around line 91), and
+can fail for any of the following reasons:
+
+-  malloc(3) or readpassphrase(3) failure.
+
+   These are going to be difficult to trigger.  Maybe getting the system
+   to the limits of memory utilization at that exact point, so that the
+   next malloc(3) gets ENOMEM, and possibly even the OOM is triggered.
+   About readpassphrase(3), ENFILE and EINTR seem the only plausible
+   ones, and EINTR probably requires privilege or being the same user;
+   but I wouldn't discard ENFILE so easily, if a process starts opening
+   files.
+
+-  The password is longer than PASS_MAX.
+
+   The is plausible with physical access.  However, at that point, a
+   keylogger will be a much simpler attack.
+
+And, the attacker must be able to know when the second password is being
+introduced, which is not going to be easy.
+
+How to read the password after the leak?
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Provoking the leak yourself at the right point by entering a very long
+password is easy, and inspecting the process stack at that point should
+be doable.  Try to find some consistent patterns.
+
+Then, search for those patterns in free memory, right after the victim
+leaks their password.
+
+Once you get the leak, a program should read all the free memory
+searching for patterns that gpasswd(1) leaves nearby the leaked
+password.
+
+On 6/10/23 03:14, Seth Arnold wrote:
+> An attacker process wouldn't be able to use malloc(3) for this task.
+> There's a handful of tools available for userspace to allocate memory:
+>
+> -  brk / sbrk
+> -  mmap MAP_ANONYMOUS
+> -  mmap /dev/zero
+> -  mmap some other file
+> -  shm_open
+> -  shmget
+>
+> Most of these return only pages of zeros to a process.  Using mmap of an
+> existing file, you can get some of the contents of the file demand-loaded
+> into the memory space on the first use.
+>
+> The MAP_UNINITIALIZED flag only works if the kernel was compiled with
+> CONFIG_MMAP_ALLOW_UNINITIALIZED.  This is rare.
+>
+> malloc(3) doesn't zero memory, to our collective frustration, but all the
+> garbage in the allocations is from previous allocations in the current
+> process.  It isn't leftover from other processes.
+>
+> The avenues available for reading the memory:
+> -  /dev/mem and /dev/kmem (requires root, not available with Secure Boot)
+> -  /proc/pid/mem (requires ptrace privileges, mediated by YAMA)
+> -  ptrace (requires ptrace privileges, mediated by YAMA)
+> -  causing memory to be swapped to disk, and then inspecting the swap
+>
+> These all require a certain amount of privileges.
+
+How to fix it?
+~~~~~~~~~~~~~~
+
+memzero(), which internally calls explicit_bzero(3), or whatever
+alternative the system provides with a slightly different name, will
+make sure that the buffer is zeroed in memory, and optimizations are not
+allowed to impede this zeroing.
+
+This is not really 100% effective, since compilers may place copies of
+the string somewhere hidden in the stack.  Those copies won't get zeroed
+by explicit_bzero(3).  However, that's arguably a compiler bug, since
+compilers should make everything possible to avoid optimizing strings
+that are later passed to explicit_bzero(3).  But we all know that
+sometimes it's impossible to have perfect knowledge in the compiler, so
+this is plausible.  Nevertheless, there's nothing we can do against such
+issues, except minimizing the time such passwords are stored in plain
+text.
+
+Security concerns
+~~~~~~~~~~~~~~~~~
+
+We believe this isn't easy to exploit.  Nevertheless, and since the fix
+is trivial, this fix should probably be applied soon, and backported to
+all supported distributions, to prevent someone else having more
+imagination than us to find a way.
+
+Affected versions
+~~~~~~~~~~~~~~~~~
+
+All.  Bug introduced in shadow 19990709.  That's the second commit in
+the git history.
+
+Fixes: 45c6603cc86c ("[svn-upgrade] Integrating new upstream version, shadow (19990709)")
+
+CVE: CVE-2023-4641
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/65c88a43a23c2391dcc90c0abda3e839e9c57904]
+
+Reported-by: Alejandro Colomar <alx@kernel.org>
+Cc: Serge Hallyn <serge@hallyn.com>
+Cc: Iker Pedrosa <ipedrosa@redhat.com>
+Cc: Seth Arnold <seth.arnold@canonical.com>
+Cc: Christian Brauner <christian@brauner.io>
+Cc: Balint Reczey <rbalint@debian.org>
+Cc: Sam James <sam@gentoo.org>
+Cc: David Runge <dvzrv@archlinux.org>
+Cc: Andreas Jaeger <aj@suse.de>
+Cc: <~hallyn/shadow@lists.sr.ht>
+Signed-off-by: Alejandro Colomar <alx@kernel.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/gpasswd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gpasswd.c b/src/gpasswd.c
+index 5983f787..2d8869ef 100644
+--- a/src/gpasswd.c
++++ b/src/gpasswd.c
+@@ -896,6 +896,7 @@ static void change_passwd (struct group *gr)
+ 		strzero (cp);
+ 		cp = getpass (_("Re-enter new password: "));
+ 		if (NULL == cp) {
++			memzero (pass, sizeof pass);
+ 			exit (1);
+ 		}
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 83e1a84769..ce3ce62715 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
 	   file://0001-Fix-can-not-print-full-login.patch \
            file://CVE-2023-29383.patch \
            file://0001-Overhaul-valid_field.patch \
+           file://CVE-2023-4641.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


