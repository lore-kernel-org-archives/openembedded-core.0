Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49242CD128A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 11:36:26 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.94])
 by mx.groups.io with SMTP id smtpd.web10.15594.1712835384671216043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 04:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=PIqqACWX;
 spf=pass (domain: witekio.com, ip: 40.107.6.94, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8stqbl3q5rmS+Cx87kKk6Tgc4As9fZhI80CY73OMFdIHKuJlkvcBzzAKuep5wjjTGlwnrubandtB4e4BO4wHftTztoAoqWUtUGr9J3PMN0q15xdJaUjTIAQGLbj8hEmf/oqsWHSTHm3dDr4C1jiGY4VcVhtb2Kxd4dyKdtql/B72AaX/XwnYaqUkHCxokpXfh73d+KVHq0ks6URvegY0JJuKzBxOeY/8/LIy8L+0b8qHpK4Yqlz+wqgDu3tb5ooUbZ7w/Eeol67S+aj19Rqpk15q5bOEh533bIZMqP4IKg+4U6d37XjODYX+NtNclWO9LssHHOMBEy4pU/HnUwDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxNlAg/+YQ3W2qnN0/C5wBI/gau2oWZ6j3IND+S+xLI=;
 b=hfx8+uBGfknEza29vFS/R18Tc/eewvgRvagslIqtSjHRVM0klTdvkNNvuunl9cqQOv6zKoiozjVOHUuXID/obm2f6zd6ApCw3p2rhLZjKd9K0vJOza9ErhWBj0uJYjaaKsB9rNBxFvFC4l37ffIQ4P9qe+00DtIkU/eAI8xK9/1DUCebexe91KZNyYVZvIA6TGjy1j5hwQwIRtjF5jN6TzMCTHhUiiaTZCDkqV6eqaaKW0n385UgPMt0Vc1nJOWtMJ0JrL3j2s8W9C/QGhoo8C6pDU80MUGaVjCo1hACfgReklel9Z1+89NxwewWrDuF6U6Lq2Bi7kcgBeyJeZmE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxNlAg/+YQ3W2qnN0/C5wBI/gau2oWZ6j3IND+S+xLI=;
 b=PIqqACWXf2SLLjWWsCMqtGPiYTrNzTRTPRlwFxo6rRPEEUktiXQDXDb9QcoXpRB44ucWF+OfyqIFJtxE8TXHetMKIJXzadz2XwrLdq2//rpa0eHP9C60wYEw4hYyn4Ze/HZamFa3lTz3K8lhaBe7strHl5uX/7skcTS1sxdQOsFAkNyXNLYgXTlx59ZiGgJGG88hmACweSjXJ72iKqQNeHRDuQNL/zX+WCYRt5rQG8cCr53g2ahL4uEKBOOQG9GJlox+bTc1EqYY9VC5amyZw5UdRSX28qa+Ki9mUpVf3tTwlA2epI4gyh6DRh5kt8PE7h53MTjaoGnc4qTUo8bf1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DBAP192MB0892.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 11:36:20 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::d409:73bc:9e1c:a761]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::d409:73bc:9e1c:a761%4]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 11:36:20 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [dunfell][PATCH v2] shadow: fix CVE-2023-4641
Date: Thu, 11 Apr 2024 13:36:08 +0200
Message-ID: <20240411113608.32418-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::12) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|DBAP192MB0892:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9d7206-6b25-459f-a33f-08dc5a1b9bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FEm54Dpj80eGJYs/zP4viU0ySxqHtlP8ND86TGVGoIoS4Pl1lofs5jhmn+vXwEkec/yEGt0eNMQ+UCpN1S+x4jkl4b55b46gF59ClATGb4XcljebjcOO3BxAT+BMyNUsAlEPNNxCWLvH4HVjtBpSPmOSUXagQ+QtqY+cn+gRvby99WRIOutt+wQD3/xmvXb4Y0uUgV2kSTeXgaJ50k5mngebJdQTI2hFOKLFqltWGqbH3tEq9padti7YCguFDlJO77M9h65B488TuwmgDK9oQ7Y+L80Dgmsj6kCpBBEgMgVtGVkrl6jYvTmq0M3E7/HPhGcyNBiqozYCykObq7Cu1IT/vtzFOR4gps3bsx3QfcZsrrCOpvPdF0Ea8GNXWchpK5BTyP9XqfJmFwMquygtq/uoifDL7g6G2e91n106lVTMZfKPJ9wfneyvIfxjHvNASBmtdMK2tqXI0lkGbjHvsap8zWwR8UxnMBjEdvjzxdYthe/Kzg4CKUZ4mlxwiyuOjkiDRmH8Fg6UXsNKmJBop9VpCE2GNjG7FJn2YqE8Z3RZNvirJuqki8d5flrICktQI0/N7ROTlaEV8kEr17ZVdaJFSH/PuXxeeU2jIN9En2UgsD9/sw4qdhNQA3xf0LhXoNSdz7FuDYXWRNMGRvHvQ4IlVadsSfuumVQ9PwGDdDbPfIWYQMX4emLJAiBSpT8Uw9PTPMXW1ePznxdIa9Fe/XNeR096vjh458/Ks2WpXNw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JCIP3bQmwz/u+sTYjY2Z2ZZJaKKdQKX0rX4tMBHRWk9go2FVPQwp19TjGL2f?=
 =?us-ascii?Q?ZPo7bEdBM/ubfUB8DQxJLSzY4zStbi50ReC8VgpLphGu2TbB9onFY/dFJr8b?=
 =?us-ascii?Q?H9q6WBUIwtcbAr4NzQrnvFd4FoJf6zMCMzqL4R2GDZXs6NzcVB6A0X5aJYXz?=
 =?us-ascii?Q?ctDLQ4eFpPTQy97jsYQqxaYCZqnrxf8MgQCT22Kd+fqdKwAZkSpnwNOgzTNq?=
 =?us-ascii?Q?1qTtLSktvirNrQaJ0TxYOUY3i5qu0+lGAEQnYwRKbQ/OBtiDFUZzdJReWvG2?=
 =?us-ascii?Q?IXWO7iIRbdFilnwMlaqRGy8MKWMjvPCoAv5s3fW2jLYFBo6LxPuafpM5lQqL?=
 =?us-ascii?Q?s7H5Wq8plUXqNFtBcZAhkclxV2ynaNp4AoTHAjoNuzqfJkmEnXdiUZfw3lVx?=
 =?us-ascii?Q?oQzc0Lebsct5dX9E0U4+Cel8OktBs9AVCWR3I4Doaflfh4cp3T40BbLo7leH?=
 =?us-ascii?Q?exiUd9kXCEhewCMr+zIk8I6jS0mQ75HOF4GZ9rrqDqK/rD9B1zOBeJ1mSf3h?=
 =?us-ascii?Q?lvKRkzD4+YWOKqaXcgJcs6Ox0lrjJTVXa+cyFLtXKdfJ8FlomvhbvVFGTB6U?=
 =?us-ascii?Q?sklni5H9iYvHoAaToWTNCc91OtK0Bqb6IfTR5U3+rQnDsI/bnt3B+IEDl/x1?=
 =?us-ascii?Q?pI9KyLvJTWT/N5YUa4oCWw550HUYCSKflLMX8OIpOa1NhJXcA53m/vYo/ftv?=
 =?us-ascii?Q?muvjTmb1ZUWh+JLhEgC236N5RQQYNYsW5bd15pepj7on2WQbKEm/XLachqoi?=
 =?us-ascii?Q?APSq61jNRWoECUviyyOnhjjE08j236d8bjTHB0gIKOA1MRieCvr/R91u+pYU?=
 =?us-ascii?Q?GS1X+MyWa4rvu/XSsNZqr2Ssdjq+3x8ElebzOH2gftUUBvvKQbN9icAQdsMe?=
 =?us-ascii?Q?SDtaUHD9oywKsXgbUBDwIQItI4hrV4qtAT9TEZfr8IP7jQlUGUlOIjR5TJ9+?=
 =?us-ascii?Q?6drrknC+xsKBFOAqTawn4UvfoBPcONz8YgrNaRam42BIl9zmZyDeDhFNsgw8?=
 =?us-ascii?Q?CfZeEtMNTBGoebyuEFZJCtVJHm0bsUHp0JI+iiQO+VYsTrjDx6Wec3oUJK94?=
 =?us-ascii?Q?Fs4T2g/T+lfLRlVr2xHOFFfTUZGqB0YO5VUWFEerm9F/VkQqPoXbc1QOfaCV?=
 =?us-ascii?Q?esAOGaAXL6XK7sLQ2NgS1gW3brG7v89Uz+QtZQ9hodl8M2nSo+4e+FOjcA7Z?=
 =?us-ascii?Q?h3PJPO//jbSRhKoCc+Blk0ZG3luXxCgW0YuSD7HmPqY5OPq0Lf/H/taurjV6?=
 =?us-ascii?Q?gxzUwOeCoV83ikZaB+9ECZ812t9FMe0BczmM52EWxwCk7gQye7l4YcxUmNfH?=
 =?us-ascii?Q?9iasPdX+89scgvEflffxDShXnS9BOwvNe5TARqMfat9ZpASC34fWD5adj0fH?=
 =?us-ascii?Q?pb9rn6nwgJzQuYNKeesaiftlfrh9s0xaAZJ3f/cc7WBFmkKxJgJl4bfjp8FN?=
 =?us-ascii?Q?Yn0py6cG1wWl6b0VLUN9vnOwkM0KyeJmjUjPtbmEnBIBbOeIeJwPCw9n6+Ud?=
 =?us-ascii?Q?Z7UlrXhA/7dsYq4O8zTpktJa0ujXWni6MFHNvC2tk5KdiKp6Pdo0UuFwtRa1?=
 =?us-ascii?Q?MzKTNoGmcba/JCrdGG41cp3oopsZ5q/4CzY9sAzJ?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9d7206-6b25-459f-a33f-08dc5a1b9bb8
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 11:36:20.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7s7Qcf0L9hYB/NXELxWOyTfwQTxaFD/qwradRQAXr3idzIxNC2w2szPp5ynULePSf7WLIMP+OFGW4h7NkcKm+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP192MB0892
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 11:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198126

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/65=
c88a43a23c2391dcc90c0abda3e839e9c57904]

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../shadow/files/CVE-2023-4641.patch          | 146 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch b/meta/=
recipes-extended/shadow/files/CVE-2023-4641.patch
new file mode 100644
index 0000000000..75dbbad299
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
@@ -0,0 +1,146 @@
+From 51731b01fd9a608397da22b7b9164e4996f3d4c6 Mon Sep 17 00:00:00 2001
+From: Alejandro Colomar <alx@kernel.org>
+Date: Sat, 10 Jun 2023 16:20:05 +0200
+Subject: [PATCH] gpasswd(1): Fix password leak
+
+CVE: CVE-2023-4641
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/6=
5c88a43a23c2391dcc90c0abda3e839e9c57904]
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
+> existing file, you can get some of the contents of the file demand-loade=
d
+> into the memory space on the first use.
+>
+> The MAP_UNINITIALIZED flag only works if the kernel was compiled with
+> CONFIG_MMAP_ALLOW_UNINITIALIZED.  This is rare.
+>
+> malloc(3) doesn't zero memory, to our collective frustration, but all th=
e
+> garbage in the allocations is from previous allocations in the current
+> process.  It isn't leftover from other processes.
+>
+> The avenues available for reading the memory:
+> -  /dev/mem and /dev/kmem (requires root, not available with Secure Boot=
)
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
+Fixes: 45c6603cc86c ("[svn-upgrade] Integrating new upstream version, shad=
ow (19990709)")
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
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/gpasswd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gpasswd.c b/src/gpasswd.c
+index 4d75af96..a698b32a 100644
+--- a/src/gpasswd.c
++++ b/src/gpasswd.c
+@@ -918,6 +918,7 @@ static void change_passwd (struct group *gr)
+ 		strzero (cp);
+ 		cp =3D getpass (_("Re-enter new password: "));
+ 		if (NULL =3D=3D cp) {
++			memzero (pass, sizeof pass);
+ 			exit (1);
+ 		}
+=20
+--=20
+2.42.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc
index 2ecab5073d..c16292c38a 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/relea=
ses/download/${PV}/${BP}.
            file://shadow-relaxed-usernames.patch \
            file://CVE-2023-29383.patch \
            file://0001-Overhaul-valid_field.patch \
+           file://CVE-2023-4641.patch \
            "
=20
 SRC_URI_append_class-target =3D " \
--=20
2.25.1


