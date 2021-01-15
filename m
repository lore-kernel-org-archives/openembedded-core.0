Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.82])
 by mx.groups.io with SMTP id smtpd.web10.197.1610688403942460191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 21:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=E7owgb7s;
 spf=pass (domain: windriver.com, ip: 40.107.92.82, mailfrom: paul.gortmaker@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBc55nDOYvuU69ZSCMoEG2hmClzpfYqCRG4q1QrTGHVF+EIvO9D2caPdsRxKeE16Iks1OJFxvMlHs7oP6r8W26yflikgWU5t9xOwf351yBTlOEvwz96yZSglGfTZ5HT1cCQs4Thwf5ib9GbbcGw7FwUav5L/Mb3cFEKvywITYIIc2L/9R2M468xngwQD2n7HHmVvx8+TzpsoNdNGpUxlNUJ0KUX70FxdCFG8TPkWi6nlSljuJfuXMwDSmr9fEfkc4lxNLp1pyE5AYscZze5EUMJMA57aa42n+A6Idi00xHw5jywGkiv0ALxiLs6jeleS2K3/5x1QUirt8e0wNxoq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKw3dE/pWzDMN/ttPbzjPbDdpxmZUit5OBCxVqZPn3c=;
 b=fh6p/vpTt4Fq6gBxuabBlsRwitR9uPexSSMYQ7HK0yeSF2SsSMRbX83Q5/oDWh1QTvQRFwMHczCrZ/FuxhC3gFLpQGy5MoBEm+O1/E67trzh71sCMcWrZC7lcTWR9lt8FprqRJnlxyMBhPxWHdglfa/CwN2LDSOnuh5lKS3iy5cuuUQpjfCwBfE0P0gIpidnwgMyH0pM+0FpERdeJfrqTu/cAUAyOloTmleDsKM0AMrQaCdBqvLO+IPr0xBvEyJTkfhywXVkUcnhNqcI45PNL5JevbiofL6zUtGC6ndLtADK68GoC7G2DnnlNjb6sqgINBQ7m/s6/R8zUDIAGxCBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKw3dE/pWzDMN/ttPbzjPbDdpxmZUit5OBCxVqZPn3c=;
 b=E7owgb7shPazl1MzK51nVyMHW64dOxDDUc8BlxEzfEjuRoRuoRSG54TBUulyk1Jz/czPFOiipUpe3PLHFJ164fi8StFu5O7rhmndvu+qontI8XCY0ddajVvJ+YAw4VWFUDh/dx2NWZlpfbmcUNjkCQnz/0rEB6RxUPATzJHgu2U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM5PR1101MB2092.namprd11.prod.outlook.com (2603:10b6:4:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 05:26:40 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d%4]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 05:26:40 +0000
From: "Paul Gortmaker" <paul.gortmaker@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: Paul Gortmaker <paul.gortmaker@windriver.com>,
	Luca Boccassi <luca.boccassi@microsoft.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
Date: Fri, 15 Jan 2021 00:26:15 -0500
Message-ID: <20210115052615.29893-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.30.0
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::14) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
Return-Path: paul.gortmaker@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-cube1.wrs.com (128.224.252.2) by YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 05:26:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f639f81b-a78b-4351-cd53-08d8b91622f9
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2092:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2092073DAA161D0B0CA2409283A70@DM5PR1101MB2092.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h2ai1P9N29bDqnsYkT7sMJ63zRW6xYEvAJsAI6efNT840wZFoxSARlZy08gW9w7SBBLlPWJjVe9cZDB1Mdlxj3dW/yn9TYhS5OaboOgs1wvrCeTYkzEbjihrKhZqx5gW/cI7J1CBpZdOed+WZmP/YocC8eGfhgyZ51fB7Bg+4rZNLFAfZO0yTQHrtP88tvktluDbVyxvgaGrBO9nUqa+319aZCdwrM9bFDdFJIuGRP6OImBTh9ZdU1Xhqd/a3tYg7XfptwWxB9JcA3Drmj8r9puTZccRFaPESy5oOeIAmqf97uAHnk4HRKags59wN3ICnUEbA7ie/zpEf1+DcvJ5caSGjmKuq2RMm7WWnaPcNjoTB0D1GIsEnw3xXHqoKj/qoL4WUzDrf5HJw07D19iSOyB0zMJeFgpagF2MAJ19ULrOzSA/7k0Hp7cRuMATSjfwQ3GzhB3yZi0GwNbJ7iR3XAH1s7ConaPtL0lylqOIgQnnlkBLDTGokUFeyt3M02HqimBrii0AONA7bt9gwXu8rw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(66946007)(4326008)(6506007)(6512007)(66556008)(8936002)(966005)(8676002)(54906003)(6486002)(316002)(1076003)(6916009)(5660300002)(66476007)(2906002)(44832011)(956004)(2616005)(478600001)(36756003)(45080400002)(6666004)(186003)(52116002)(86362001)(83380400001)(16526019)(26005)(192303002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?QmgtJQkI/JPblbR6BbCQyjwMBBIGSeM4h/uNvOuSIlw0tq6cfAGUVaSahAi1?=
 =?us-ascii?Q?DX/GRkEzlXJoIuUaYlDDjmDohrml9pQEMsUDH7E0yC7bWPXhcSFOplpNRBlc?=
 =?us-ascii?Q?er+ANT3CtwiJk+t/5f9BYI3O4anCrZt+i7gJyMxmGO9Zg+h91cjLNPXzYJwE?=
 =?us-ascii?Q?OEcFo3TpKYNP37xe1swxWODf5Atbh5lq+hxZwgoxbaugb5xKIyQQO3LMFqzs?=
 =?us-ascii?Q?biebaH0PMM6VS5gprUatBoY8rnxYtX4xvWwnURHzIjROlv5yUG0MPTN3k6bn?=
 =?us-ascii?Q?OZkpYG5xlwPfRdcpQiDuyLsxqTPhCXHcA6R/JskFlG0m6c/kCOwaby43RyHq?=
 =?us-ascii?Q?O7riYZa9uzbfgs8LUgXEFdQML55og//GYLOdLgfy0TXwg5jooWhVdrDY5yud?=
 =?us-ascii?Q?+lgMiTjl/sxp2T03ePRiHHOkZLT4GkaoLXzYhNAcA0yDggHm+r2tFyp33YGq?=
 =?us-ascii?Q?IIbCD2oYbFuY9CPxqRIJPLhIm97+5Lb6NVGcT1FkXtV+Pum8XL/bNnbw/Opd?=
 =?us-ascii?Q?jMssipNt6qZ13e4Yx34lgzJJoKR05Oed64lF2E6rC70gp8hmyss3iDKkpCKw?=
 =?us-ascii?Q?TNu9W5ZMccQBSgLxTM9sRvWRoffalb8jcI63uGzDNyYJZ90pBILdCu4VACNR?=
 =?us-ascii?Q?+pp6BR7oBGfobRJkXLWifkjfnefNYN1uI5QEXPOpkvt30oRu7qGXJK9+5bX9?=
 =?us-ascii?Q?w//w4UQ1M2gAWfDf778UkyN+FYXZLbysZzd6ST1wo1h/HLswRwSgj7f5p32t?=
 =?us-ascii?Q?s/+ZdbmPwFekBSbmYipkDmA9nHcqbD2V6IYEKI+OUChEp7ZxKFCUDNNDusaT?=
 =?us-ascii?Q?SuwGCeW+3Kh1i7Uyt6ZK8wS7pOgX7vHz6llWPXgeP95nfngHgUltPhlg7Eib?=
 =?us-ascii?Q?GR1uzhyZojvwN/NGRIfEl9fMSWApW6zhgHm7/SaY2WwHHHWQDA2SfVzF7FIu?=
 =?us-ascii?Q?ghzJa34Pw3u8/Hz/YWLOyBFyXkz0FWWXd15mrsl3y3rr4XGz4oCEQgu51XRI?=
 =?us-ascii?Q?L0+Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f639f81b-a78b-4351-cd53-08d8b91622f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 05:26:40.1972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BP3ffRxU9KhRzAAKf6HH1znvotF3MgFMfmhhPqiOgJRs/Vs4PpYncQBQf0bZ3MIcjlVmmFppJRyr9FMO8zbIlhM+XaYIB2QaeJ+rF/J+RtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2092
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Recent systemd started using ascii args to "hidepid=3D" mount options
for proc fs - unconditionally -- even though kernels older than v5.8
emit an error message on each attempt:

root@qemux86-64:~# cat /proc/version
Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version 10.2.0 (=
GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
root@qemux86-64:~# dmesg|grep proc:
[   29.487995] proc: Bad value for 'hidepid'
[   43.170571] proc: Bad value for 'hidepid'
[   44.175615] proc: Bad value for 'hidepid'
[   46.213300] proc: Bad value for 'hidepid'
root@qemux86-64:~#

Simply ignoring them as the systemd maintainer unconditionally says
is the resolution is clearly not acceptable, given the above.

Add a kernel version check to avoid calling mount with invalid args.
Further details are within the enclosed systemd commit.

Cc: Luca Boccassi <luca.boccassi@microsoft.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount=
-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/systemd/002=
7-proc-dont-trigger-mount-error-with-invalid-options-o.patch
new file mode 100644
index 000000000000..65e7eca32d05
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-error-=
with-invalid-options-o.patch
@@ -0,0 +1,126 @@
+From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Wed, 13 Jan 2021 21:09:33 +0000
+Subject: [PATCH] proc: dont trigger mount error with invalid options on ol=
d
+ kernels
+
+As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab ("core: introduce
+ProtectProc=3D and ProcSubset=3D to expose hidepid=3D and subset=3D procfs
+mount options") kernels older than v5.8 generate multple warnings at
+boot, as seen in this Yocto build from today:
+
+     qemux86-64 login: root
+     [   65.829009] proc: Bad value for 'hidepid'
+     root@qemux86-64:~# dmesg|grep proc:
+     [   16.990706] proc: Bad value for 'hidepid'
+     [   28.060178] proc: Bad value for 'hidepid'
+     [   28.874229] proc: Bad value for 'hidepid'
+     [   32.685107] proc: Bad value for 'hidepid'
+     [   65.829009] proc: Bad value for 'hidepid'
+     root@qemux86-64:~#
+
+The systemd maintainer has dismissed this as something people should
+simply ignore[1] and has no interest in trying to avoid it by
+proactively checking the kernel version, so people can safely assume
+that they will never see this version check commit upstream.
+
+However, as can be seen above, telling people to just ignore it is not
+an option, as we'll end up answering the same question and dealing with
+the same bug over and over again.
+
+The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
+systemd 247 and above plus kernel v5.7 or older will need this.
+
+[1] https://github.com/systemd/systemd/issues/16896
+
+Upstream-Status: Actively hostile
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+
+diff --git a/src/core/namespace.c b/src/core/namespace.c
+index cdf427a6ea93..f8fc33a89fc2 100644
+--- a/src/core/namespace.c
++++ b/src/core/namespace.c
+@@ -4,7 +4,9 @@
+ #include <linux/loop.h>
+ #include <sched.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <sys/mount.h>
++#include <sys/utsname.h>
+ #include <unistd.h>
+ #include <linux/fs.h>
+=20
+@@ -859,14 +861,34 @@ static int mount_sysfs(const MountEntry *m) {
+ }
+=20
+ static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_info=
) {
++        _cleanup_free_ char *opts =3D NULL;
+         const char *entry_path;
+-        int r;
++        int r, major, minor;
++        struct utsname uts;
++        bool old =3D false;
+=20
+         assert(m);
+         assert(ns_info);
+=20
+         entry_path =3D mount_entry_path(m);
+=20
++        /* If uname says that the system is older than v5.8, then the tex=
tual hidepid=3D stuff is not
++         * supported by the kernel, and thus the per-instance hidepid=3D =
neither, which means we
++         * really don't want to use it, since it would affect our host's =
/proc * mount. Hence let's
++         * gracefully fallback to a classic, unrestricted version. */
++
++        r =3D uname(&uts);
++        if (r < 0)
++               return errno;
++
++        major =3D atoi(uts.release);
++        minor =3D atoi(strchr(uts.release, '.') + 1);
++
++        if (major < 5 || (major =3D=3D 5 && minor < 8)) {
++                log_debug("Pre v5.8 kernel detected [v%d.%d] - skipping h=
idepid=3D", major, minor);
++                old =3D true;
++        }
++
+         /* Mount a new instance, so that we get the one that matches our =
user namespace, if we are running in
+          * one. i.e we don't reuse existing mounts here under any conditi=
on, we want a new instance owned by
+          * our user namespace and with our hidepid=3D settings applied. H=
ence, let's get rid of everything
+@@ -875,9 +897,8 @@ static int mount_procfs(const MountEntry *m, const Nam=
espaceInfo *ns_info) {
+         (void) mkdir_p_label(entry_path, 0755);
+         (void) umount_recursive(entry_path, 0);
+=20
+-        if (ns_info->protect_proc !=3D PROTECT_PROC_DEFAULT ||
+-            ns_info->proc_subset !=3D PROC_SUBSET_ALL) {
+-                _cleanup_free_ char *opts =3D NULL;
++        if (!old && (ns_info->protect_proc !=3D PROTECT_PROC_DEFAULT ||
++            ns_info->proc_subset !=3D PROC_SUBSET_ALL)) {
+=20
+                 /* Starting with kernel 5.8 procfs' hidepid=3D logic is t=
ruly per-instance (previously it
+                  * pretended to be per-instance but actually was per-name=
space), hence let's make use of it
+@@ -891,21 +912,9 @@ static int mount_procfs(const MountEntry *m, const Na=
mespaceInfo *ns_info) {
+                                ns_info->proc_subset =3D=3D PROC_SUBSET_PI=
D ? ",subset=3Dpid" : "");
+                 if (!opts)
+                         return -ENOMEM;
+-
+-                r =3D mount_nofollow_verbose(LOG_DEBUG, "proc", entry_pat=
h, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
+-                if (r < 0) {
+-                        if (r !=3D -EINVAL)
+-                                return r;
+-
+-                        /* If this failed with EINVAL then this likely me=
ans the textual hidepid=3D stuff is
+-                         * not supported by the kernel, and thus the per-=
instance hidepid=3D neither, which
+-                         * means we really don't want to use it, since it=
 would affect our host's /proc
+-                         * mount. Hence let's gracefully fallback to a cl=
assic, unrestricted version. */
+-                } else
+-                        return 1;
+         }
+=20
+-        r =3D mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc=
", MS_NOSUID|MS_NOEXEC|MS_NODEV, NULL);
++        r =3D mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "proc=
", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
+         if (r < 0)
+                 return r;
+=20
+--=20
+2.29.2
+
diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core=
/systemd/systemd_247.2.bb
index 5eea78eff353..84d997196cb6 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -23,6 +23,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash=
.patch \
            file://0001-logind-Restore-chvt-as-non-root-user-without-polkit=
.patch \
+           file://0027-proc-dont-trigger-mount-error-with-invalid-options-=
o.patch \
            "
=20
 # patches needed by musl
--=20
2.30.0

