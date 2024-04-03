Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B0ECD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 12:29:47 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.122])
 by mx.groups.io with SMTP id smtpd.web11.9684.1712147384110179341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 05:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=f9y3jJXU;
 spf=pass (domain: witekio.com, ip: 40.107.249.122, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRLOVbS8q1w4ICADMHiG3sFF3YHko5H2sk8VdmC7FcXg9e9yqIZ6gs5FHtXpMs4U/Xc5HuFRbN79H+OihyI6Ox+3iFB1NltMexzLM5DAgPvMnlyu+To7QRkCyBGGhDrdOc8p8foxPmDRjMTA4IpycQy2N9707muT0/VK4/I9aWWKamHk1RKgxLLpPEljyapkVgu/CBpPsAtPRNKR3RzQBm+egvQVygTP7wPXj4q9hqJeGK8Ddd+FCe3dOifAm5mTehOtWEOn24Uo3G4etRbFBDh4PWDR6sJx9D05oaOEDdnAjLxiyDxeCxMlmPXVK4/vv/tntDm6406Jph3E6FRZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF0fmS1Tz6VMKc/8hkw7ro0mv42zm23ACuU1er/zxHY=;
 b=U1xd02WEvrFYSwVhY9dMaqWT9kqd66ERMhtkR3YY0qWCzaJmeWapjbtvSxHQz1RTeAxRw2FcmyuHlvq6xTRSakSI1PI+Bh1KS/H7zMZ6IPbjis9Brr9RmTPWp510wRBXK8Do5nXWU2Dx/dzXK9FnwM+eGEnw4WXIJB0GPIvS+nLujm6B6PCkvXJQ6fLNPc+thOktkwaxpaboeDJCS4lxwZ4b45GhbEFhCw26K0BQFZ73QNtsWP7AL+Fl+K3UG0jclKumUpI6IA6wOPOwlYyv2fC588NQeG/bRH6imJXiaUqgQsRhp2RjkfcAII5SXhLyuqIbz0+3o5CXY4laWz2fnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF0fmS1Tz6VMKc/8hkw7ro0mv42zm23ACuU1er/zxHY=;
 b=f9y3jJXUmKG2I5XK4RiliBXqmpwjZKVBCIJChqTAqL9sdI3AtRqliHF2eKNFrdaQd161QxwM9aTbvY06q8N//gG0wrHzsv1Ey0qLfG8kNRvWVPV7v9yxgl5XWPz/pq4egkqmY2SrJbMMCJqs44s+2LlEdV2RF+oP/bVv85xO5EkymrQp6UC7r2QV7R3oFxCBzLKYzEF0WjGsj6dSdwSuZ1ehdqZYQGfcGiYtzCvw5Whq3yKIE4Zra+vxG/h2VurnoOQA+C0nVY0w64ejPu5bc+zZ08UQo5TQeh/zeuJ3iE5QJacajcIL7RxLnpWFmC6+3LBRAmwxeHIj2xMafIxwFw==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by AS4P192MB1912.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:51f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 12:29:39 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::38ac:7ca0:f299:bf24]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::38ac:7ca0:f299:bf24%3]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 12:29:38 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [dunfell][PATCH] shadow: fix CVE-2023-4641
Date: Wed,  3 Apr 2024 14:29:17 +0200
Message-ID: <20240403122917.29741-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0241.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::7) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|AS4P192MB1912:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZceHw3ffg0rgG3o1CMeYX/v7xKL5iMCZNv6niiXiYBORN5j1OCGiUhVx7AeAqYL2ZI1E2TD7Zpeicz2NU61lefsj1QrJnM3EoYZdrYkj7b6nLEFME9WS0ODIYmnq0ZAfdGT4WtwOv30m861MW1BYcR5+ni7rpuok4rPmrXKF2vxc3p2xWKhRd7JlZROH6rO8v0fwLIvUk2DSHItZYNAw0WsMkFIXIwFZzBNTiP+tpuNUJW5m92Ay2c9obqBrr8N6aWl2nGRfbaLr+/7Exjo9I5vbDwj/SJIg3Y27nPOgBEzJxDbjoRgTZKywIqw/tTaElM5E/sxY7aliUe6du53Sprs0P6cOOfo4XKp1aEI4bFRLhz6y6AQzqsSPlDm+kPSgm2pJfNTlwr6HbnRkyYHAGca5J26LpvSq1WgNYo6QuIA0LzO2E1xWmS838Z9zXdHVMT8EzyDIA5annlwKL4CzmY6ncg0eTC3/DNG7UgxhHhjB6YmXSpsjXJQ0b7EmGpWmvAD87qUk1XMKVOvNBdECX1KkID6vEEtQdp7BeVm3RFluOumJfST10aaDIRyCZLmKp5xUBVQEAo5Ll9aejE0IY9aCPqTEpDrkloaHTL2Jk+E3mwU8PUYhlYPZEot7hyfjdO6dpd6iVcScUPukx5rnj22v6tciTMaOtEPbrOtjgwvSnLylOl5EUsRSD0TaFiQSxm72JuHgyD7T9a7J2CWv4z4ITj807wSHVQ8R8J80EXU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4CniK94L3+PYAa1qT0i3r4yIzK3/WivXv4EbR1khh1oPGTrJxDlN+JTJuD5q?=
 =?us-ascii?Q?M6gq+Yp5OeiyCxjkHoDoyY0kkyN34pJurzzCwkKTZb5Q/hveXGKiGhubcc1E?=
 =?us-ascii?Q?B1bznMLjra+Yf0uV+WYIhX59O1FEZW8sKQDukQJLLyXaprJ3YbXbC/YFqtWY?=
 =?us-ascii?Q?5yTHDkuNYxyW10PiS5vLEGGO6ROCIfrZPPasvpLq5+rubLqgezT2kacfdAt6?=
 =?us-ascii?Q?wczuYk9/tIogXHDFgaZw1/eHjyiaEJJV2+SSesH1P96hU+CVs5WQrXXKeLLu?=
 =?us-ascii?Q?SSk0A9Z09Oth1td6M6n8lK4XG4Ew0KdFvdFDRDfVJcjsBDWVMCUCBWWSxVna?=
 =?us-ascii?Q?KzJH9aAmSazYODb83Rf4zZLUGKG457nXObybnwVhq7xH4sl8Jlq7zVnjvn2l?=
 =?us-ascii?Q?O/J8r9IvJTRPyrhuHHAP1DSZq6mj+VBXNiCgTKj7PyhlqTJr8e+KekfjM+pB?=
 =?us-ascii?Q?DaN3Z/tAvPrvh8KIIbXUef7DM9GJ6QchR0aEZYaADkf8WposJjMx0VA+JA4C?=
 =?us-ascii?Q?PPmQxVrKCIAfd2zo7urwXgrCWia9GeqhHsnCWGtYuVtgUFZa3Lku3skGiKzM?=
 =?us-ascii?Q?5kLG8ltWxytwvQKKJRTmqtt2oD9pMEmweYOK+4eoAEYRXyLLLBsJimI4QXnn?=
 =?us-ascii?Q?HgKJHN1TtW8oQUy+lvyPLrf7RYkExBTp+IWX9OFwoL4u8W8mXH4EaP6aAihB?=
 =?us-ascii?Q?laxX8MjSbvr9qx63ky0kknWNTICs5IhUUdbwW/YtmyLYQkNuC3G0MkHXjFbZ?=
 =?us-ascii?Q?QKlQf0p99ARgczCsQaNOuHFv1/SOsh9lQqGxkIe4ignHuFo82YDVHiqSwb0G?=
 =?us-ascii?Q?4rpUSir0lEJ5fkJwM1cCIt4kec+T0i5r7JSCwVxFdSiR0AqIMzRlj8yVLXXW?=
 =?us-ascii?Q?kTfqafizOlLl34k7XsyaBqsuvdszN4T5QZXBaJtaErOAYn/iEuWlcg70w54f?=
 =?us-ascii?Q?LHXoNzoP/KoSf63OqpXjzYDGIW+byt3UM6ykmFSlq6xGtEPYSFuPDkxI+Par?=
 =?us-ascii?Q?yyDE4o/HL7XDksaJ6UfXbJLZOSa92nvyIx1ltYbnFTNpMMBsrAaOtSfYBNg3?=
 =?us-ascii?Q?VBACCKtbcsafq3uGNAwAOycsTDQLO222jfBhYRt4YdfIhKfiSO/7Z1q5lg7t?=
 =?us-ascii?Q?pPaWAmcYlUPhcLkFkSDdUlJ9BZonRCb6Ky7AdwaJX97rCXOP6koyvX5MT4bx?=
 =?us-ascii?Q?AVr5nXQ5izNeGhSbljbMNcPzw5fDszcvFUcf/fL8wscNoVuOXYjAuxHnlwhk?=
 =?us-ascii?Q?qBvUSAbMlMtsemM+9UWfMd1lKPBTOf8do37IEgD9MxG9plmA4uJGXldQLyqg?=
 =?us-ascii?Q?gIa1AgVrptkW6hwhk2jKLVN9piC3t2IRF4joW5Lmz+RoXhjpnroQOLvRom16?=
 =?us-ascii?Q?QzBwX5j8kLLbx0GhFm1HZfmbAOoWga5/09GbsPpOr3n0A7NeT3Q6nQ0qaHxn?=
 =?us-ascii?Q?v+69zZHyZYJqHl2pykaUzWXuOy21SIIg1vb2QoybjWx4U8eJkTl0S/Jrbvs9?=
 =?us-ascii?Q?ZNv9GDv/IHMZigdURRPqUpdvpSEajR89djCn8IEqI15kd7k6dt72t+gQcYjJ?=
 =?us-ascii?Q?9XxSgSVovUgBYiavrZpC8r8vKAq4MHIJ0k1iHMl3?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ff01ec-dd51-4c7c-e452-08dc53d9ba7a
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:29:38.3429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0coRtOmcQUdH/CAvYVkrHtHuvfdxuQf9iK14voQ+an0FcxCB79CWr6Yx5nbTtAm8dsU5D+VNM3EArmUVcDAAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 12:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197916

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/65=
c88a43a23c2391dcc90c0abda3e839e9c57904]

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../shadow/files/CVE-2023-4641.patch          | 145 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch

diff --git a/meta/recipes-extended/shadow/files/CVE-2023-4641.patch b/meta/=
recipes-extended/shadow/files/CVE-2023-4641.patch
new file mode 100644
index 0000000000..709813ab31
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-4641.patch
@@ -0,0 +1,145 @@
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


