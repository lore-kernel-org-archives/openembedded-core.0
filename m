Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE9FCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 11:50:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52259.1697802648129293370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 04:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=865775a26a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39KBn3OR016832
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 11:50:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuevt8fq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 11:50:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l46f2cCrHxUAknFQLsojvH2Rth/gOqVo2iQQsdQx/yTcmMoan3+PkOgy3lCvnq10b5y5otEwFqIwjYMP9Zr9Kqp5enB+yrYdQAYABcbOgxalI9FmwzGnmGOvblJpu+jWL3duhODSITp0lSlfzWs32Iv0cmn0GgVDvyMkLY1mXVFUyX93Ghdy1NMg18/7UrY0ErpK3Qpze+ircmaWScEFLvSVolpFXgmq9jAjx6ll0XeQTAiXedv81QYLLVi9l4xUpizU12HrtHBbUYod5orSs8o4oVzHYnDr4Cn10XW846xGQVZmUbFs5lfQ47EC2iiq00nNOJWp2e2OLSzAQ2Se+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwuu9n3fGMZFHE89BIwbB6hZizCabU7j5ptqsWdWScM=;
 b=lveZpe3o71ak6Uv0HEfDXfzDc5z/crzXYptThXKtyI9np3TWi1ORLGuunesGP6SESJqQ6HVprvvL8b/ZxfjLhJSIe/cYEZtOGbswj0D7TXyKCk2rVcy9HHxYzrUAvUErqkorP0xipfstcx+0Q1Bu5sZ0Rfyyr/LV6zFFj3S9FWm1IY89Aw7PF/ZEAOBPBMDw33qR6P5HSLeX5xa8AwDIOEZeSDAd3lDmz3Y9uIyyo7twmgU/lBEJAUvyrfW3k4UFnTrlAB3qIwhSK+WRNFyz363On1p2sv9TpAk0yAPdZOJ7oFlrJ4MXzK0r5QK2qB4Ra1/AacmzAbeauaY28HzUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 11:50:44 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::4e4:7eee:356e:cfb7%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 11:50:44 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH] shadow: Fix CVE-2023-4641
Date: Fri, 20 Oct 2023 19:50:30 +0800
Message-Id: <20231020115030.1380003-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc01b23-4476-4dfb-7939-08dbd162caf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m77wYlkQTwsD6k4mCTkv+EnBK5ert5BJEpQlV9ZBdxrZt4ApClmts2T5ijgaiWjkvF6fT7ZwnSXZ3ktOZUFG3pLRZY8nLlzpXRY9MRMamYkJxFw68ClL2SD4Bm6AQ8lm8/ry2wzI6u7ziAThCQlRB0KrgHVuah5SVSgvMl4kxSJD17j4zXxYxKdUOy3hSG3HDUHevaNa0YefQOj5ohzofOh1w5Gttkpx0S6lzZlqOZJD5ff187nnj7eklTqLNetsPvIC3Q9rBhz/a47Atyxa61zi4wnCRvxe+umET9qad/UwtQzjEE/U9166KCwqJt+c3ZAmxA+Ry6fgArxS4/iRIfqEw8gQqxpi6DkkusiP+bx7SQ+4nohMlpng+2q0nGvRLvI91ObD2HyUjXhGj8n65FHTMBFE1O70hVDG4kbwQtsPipASwJGaf2/lwA4VaiqXKUTnWTQARQntbliUHufweaWnU8ZlYaJ/lol4LPyzad33MwPBWXs2JTWpY5ZUl5YjG9UQ5uGGlNK4UYV8I3skn+c5kJLsocd2rnfCcku6wfmSK9Ei874XEiiTK7ZRVzEzOIAvXMwDtuetkLeYD5CNhAtPtH90Q4uHxFYKx6ETmws=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39840400004)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66946007)(66556008)(66476007)(478600001)(6916009)(316002)(6486002)(5660300002)(41300700001)(8936002)(8676002)(83380400001)(44832011)(66574015)(6666004)(52116002)(38100700002)(6506007)(6512007)(2906002)(83170400001)(2616005)(1076003)(26005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4g2SORNKf4MotrIxL48PRUFF/YyysXqXHCzG+G9rtKjIRUbvxM+02edw4DfG?=
 =?us-ascii?Q?5ezAIPxE2kSpEUvYjktSt5luW5W3OXzTCDJ6pC0TxW5OW6GH2LmtcurilH0f?=
 =?us-ascii?Q?LwKaFgyqPjGhFF86yLbDmReO9lBUtEgRXf+eiq1X7ouTqbThpPbRikZJcxxV?=
 =?us-ascii?Q?xyMzCiIvSknzFtPcyoxIYAYzK52blt24b5cJ2M4UMDBcwu5UaYmgr3uW2HqB?=
 =?us-ascii?Q?tZFraA8b/sCohWbYCsEbzBcGTv1uPVNgJg2+upO6s9u8osQmjesx2ezda5/F?=
 =?us-ascii?Q?0SYaYwplcfbmsrKx2F0jZpfnLgHDqN8CSFCoLz1YuBjOhK83Oa6QVbI8xS29?=
 =?us-ascii?Q?J52AN1Dupc/ZNQTMzYg9Kxl9y6+EFOWCtITeJBV/2YKEmWulc1eVwYxUdgYe?=
 =?us-ascii?Q?B9nw5CneGIRJkpFhL5BLYWxnAdZb/vnjK8rj55wrsGSVapGnaf3qfJLu4mPQ?=
 =?us-ascii?Q?YOPVPVUeAyIfXLwjqSTM8tzy4nS5jSG5wG7wfhaZsSM/1msJFWC9giJGXi7j?=
 =?us-ascii?Q?RtIv6jebxRqPjPN0eud7vIfJvmw7nuN1glGeVorfmJtSg69s+r0k9UFGFz+y?=
 =?us-ascii?Q?uhNRhjSgSsIgEnlwhVEDSsuAR0j+oqYuNvLJkCz4pobtVaeLwNzm18Ud9Sj5?=
 =?us-ascii?Q?oMkBhYT9umcjM/MJD6/8nQs1j8Z9m98Y7nrp3xG8BPgrkpWTtiR69CdoR7oM?=
 =?us-ascii?Q?JwgyR7T6eCe0gKbZrOqFlYDRbB2xnvrBH6rBk/Ko0CHyqhL2SCmKVRGV72Qq?=
 =?us-ascii?Q?QeeTA5lOpwh4kB7fHlgs6Zd7yznjLPBWxx15xv+6OhmE0Lsh115QRGEGz8c4?=
 =?us-ascii?Q?O20zvugp+jiAheOkR1kSP3I+0CBB2/k0183q9nih0SbrqA7nySVopLwlcLD5?=
 =?us-ascii?Q?cl6sTmftjUc2JhhcEcxbQMb75d8SfGkjI3bt5rswxSVrRrjAfRcAxP9LCF0U?=
 =?us-ascii?Q?Et//js1UZxAsyz1Rm8JuaPUGcM1f/iAbzGq4bK5JgEoCYnxaAOlU0MCsk7PK?=
 =?us-ascii?Q?UH9rDzjuRfhsKH4GfpBLIJFao6ggWP5QJhq6w/BZpwO9TPHCsekMCqv7fevs?=
 =?us-ascii?Q?LRcninU8vt/PSdo69Nl8gj+XAU/b/NdwESwdQla16ZkOjsXnxnOTPv6OUM+A?=
 =?us-ascii?Q?uq2DjhamlLVymkoYSddNt37AIs9QIbCzHI2OgqA4axpbMDSsh+b0dbHoMTPg?=
 =?us-ascii?Q?hURkff/+xLyEezgJq4X9NL4IqyzsYFBXqXrBQglKa8BljnnNbqnlXQcNGDT5?=
 =?us-ascii?Q?iYRpxkdaNyAO1KyZ8KGjdUS7fB4CDu0n1u2hI99XtDWZzuszjTftPAjD9zKH?=
 =?us-ascii?Q?v2EnQBff+Wx8OVwTyGIdlwIocBd99m3bti9eRPoHlmyRbL8Xm5I91yc40VzN?=
 =?us-ascii?Q?f3OEfErZZl0wUbSAQJKH0jU9rIRFOf0XmYEwJyVNrjRN83TngzlWnS094sNM?=
 =?us-ascii?Q?EdMZxFDPCLRrPv1g/CNUI4fe9+aQB0Gw/52i9ScahE4mqwRme00PRF6Yz2H9?=
 =?us-ascii?Q?Kds8I77jZTMbn+7Wa/VihJ9AjUWZqs/fDKm3T48sgc4JUgnVzcXlwHHLmqzP?=
 =?us-ascii?Q?L13xw4Ns+jlXA8EfaS5t2DiC4uRtpieZTy19DDvmAcaqKe2Ua1IRzG2mP/Kb?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc01b23-4476-4dfb-7939-08dbd162caf0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:50:44.6416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUCvcpBfNu3a2JXCxmtW3vByqkKRlmPtjaMwzbKkhnBCuDeFESOaBblV68kOulwHqqOkkLz0GkWPR8HxlKYRCLNOnL3MvIyzVnGSt897RNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-Proofpoint-ORIG-GUID: x3Gx6Gb_iYBIhl2ht7JG2mycPBBKfiL_
X-Proofpoint-GUID: x3Gx6Gb_iYBIhl2ht7JG2mycPBBKfiL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2310170000
 definitions=main-2310200098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 11:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189519

From: Xiangyu Chen <xiangyu.chen@windriver.com>

shadow-utils: possible password leak during passwd(1) change

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
index cf05a3af93..4014baddc1 100644
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


