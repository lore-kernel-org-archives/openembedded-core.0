Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.68])
 by mx.groups.io with SMTP id smtpd.web08.8937.1608625786038543187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 00:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ude9LZJc;
 spf=pass (domain: windriver.com, ip: 40.107.243.68, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eruxbn0V4SSgoUxVVAEjAds3wj2I4wLICpepuENPX8L3odOmyTchVZyYSGiQZDZ2wuOa0m6vNQUXH1m/vC0ODXaKwkWNo9xdw/fNsC2FWRj1z1nvEO/9DeAI2UTfwbsK7x73EE2lLP4Z8B0QsrCti9mLFEB2HIfqRJoPNYq/6nvN6Tmhz0pr9ZeXIodFR4tfga3X4rQeH44+iGF+2B4CyMK0SgdvXTqARdeQAKZpbJn2UtyhDw5mJmKwL/Mif/TCJKHDXSKEsCBg0tRFKqOKiksaMd49V+jvTii7L/gauAsY+brcK216JGLCkGzoEpR5NqlKBzGpP/j2rcbqd+/J2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xilN4pZtAhqG5ThBEcIYnO+Ex4injs4cw+dYM1RhuVA=;
 b=DaqjabInEznayIr1jaHbYETv521j+oQrHNSUkpTPyAniPB+lxvWteHOvOOPPko4XuI3MAoEiQfNXuTphf95a2cKhzZgiRXQFEqb4GYel17Lr0oQvc4tkwmgXhXs3b2BfknHJxoAlIwq0GxvnkV5hJpWDvD31q48xueA30GzG7c1QXrtO6LzLfwC3cV6bXj+Il6pdbzPkkTTJX5k4DiyzYEjxvXKi3x1jpALT76BB565azU1CfGdgXCiVUEqkA4THi8a5P9Be/qWmnIntGqf+bJjd2e7/omFF3xBvnKFu02/9xA+340uYoyk8YHiTzBiG8xTrm1v1GGggokKTjqKbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xilN4pZtAhqG5ThBEcIYnO+Ex4injs4cw+dYM1RhuVA=;
 b=Ude9LZJcRbB2lhxVr+HXZRkFz5wq1AiuAaCl9d/Hw74MldKi9jmE/JwPeaL9HVE7zkN6gliiGiE8eoYDi+cNgUr05pzFdvEs14rUpN/p9nn9m209+8NiA8GWfCgOpZBsHcS0cvXJlWTduhRs7/GJOv9iGlnf17vwZq2F2ruQBAQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 08:29:44 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 08:29:44 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dhcpcd: fix SECCOMP for i386
Date: Tue, 22 Dec 2020 16:29:33 +0800
Message-ID: <20201222082934.208800-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.19 via Frontend Transport; Tue, 22 Dec 2020 08:29:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b26ee2f-f8ef-4bfa-c080-08d8a653bc8c
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB516996E7544DCBA0919CA8B1F9DF0@CO1PR11MB5169.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FV/CVj67/JBRm2fxhBWvs92rLFCHwcGWgpVML12EFoaB9FpgFBVvZxutq5aWdW5sgJ3sdAasOJLyoTSuT76Zb1PLh/b26eRfbKYXA8bKQ3AVzz9KwaOnl+mi9YdYNgiT0WfRzC9Ufv92zY2EVo1hb434t1xCVqncU+PjdTkTKYze2Q93BhXjRejvjM1GJiKY4713Xro0TQMGolrldcEXTuL15FOWOa1zkh7CQHo6pu7dmlRoj+1x9t1l1t/nXyxA1f9r1dzi4Jbm/4lyjhSZpUN79hj4f+qaCsxh5BDoR7ihceJASfNQGgjOYU3EZjselNggNyB0kHkaV0cWB29et0anG6gQtmfaQhxW9cNlmZHc++UD3V5GRGJH0e+Y1QyFdklqp4pIl27+J/4SwqlWLp9g8mr3RfGGisApLtv1Z6cm2qO+2kNzKi+lAq7COd5NSkt7SCb5ZEiBepDuhRADjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(2616005)(44832011)(8936002)(956004)(316002)(5660300002)(36756003)(8676002)(66556008)(2906002)(83380400001)(45080400002)(66946007)(66476007)(1076003)(478600001)(6506007)(6486002)(86362001)(52116002)(6916009)(186003)(6666004)(6512007)(26005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Ep41Yrch6yR305MehPwgOgzTn3ak86ygpy8RR7Pl2uzOueurixZhnOSyWyCo?=
 =?us-ascii?Q?GHndYOffbmqI6JjW0DgZ6pZf73c/4MRHGOT9/SDNYrvFgWNdC6Lkpv8lBUtZ?=
 =?us-ascii?Q?NSnQ2rQcEt2i1+QlWdQK4d5c3ijBqHAQZL9kT1Ys3Db5o1n/cPRJqNqghImD?=
 =?us-ascii?Q?5r//4VZrzFNkMORP92V3goHeYudNvTnAetIg+jzCL5+BBOqZIrrh4mNvCadT?=
 =?us-ascii?Q?sawa3U4/H5NvfuTkSHzxc3eI3MqmkcNQY/Zgrt6E3SLvzaw4w430j1MDe6yi?=
 =?us-ascii?Q?gB6ObUD/ixjD/CDsgcBkNhIKsWP55aPuZjRo3gDf3GDTSoY5t+LdAbdLtuET?=
 =?us-ascii?Q?LRIaeLv3RwHzgm68l6m4KNxylE1YSZnHqqrt6mf8I9ljWbl4Yzs4AdAlF3bn?=
 =?us-ascii?Q?ulH/uGM/eKIDf/YpSw1sLZKnodCZZHAWPKHOUugU15r6mWPYFqYeLadD6dqY?=
 =?us-ascii?Q?fqGFD05BWOxYFEFTz5wmdI0ekyhyCvGQXA2bqDj1/TXOAREnahkQYibK2YES?=
 =?us-ascii?Q?dOf5DA4ddr8MeCAqIUYKeY8b8Hqit1Kr6S8lgYVGsQBFRaGmlIuZJXgeOD2x?=
 =?us-ascii?Q?GRuPRpnFJgm2enA/u/YOH05ZGRJiSUwjj2loKjdtie48vERfLMYHLRz+032O?=
 =?us-ascii?Q?XnGOTYXTgXE23w/4irJQDRkeKSXg6I4fiLrAtOwuOtkBR7J7p6nqUKalf+HZ?=
 =?us-ascii?Q?2tLwBa2ZiWlMOHA+DKP9h8T//f0cd+k9RWDFMKVNCI1MKSwCkEfQFb/Q4Rcg?=
 =?us-ascii?Q?1wCIrWbupibEPhckg+9jkms1tSiGaHim04ymET6W4ic9gJfVstoP7T+do6vl?=
 =?us-ascii?Q?knEBfZ05DMRpsGcuT/qdBztWO5677XfUDfNB6IzchfSPjMihBe40iUcS4GBC?=
 =?us-ascii?Q?ggNysb/OY/diIwPZb/XG/HInaFC6MSe3KJbMNdNaVat8+U1/n4xOlbngRAD9?=
 =?us-ascii?Q?42UbGQo2hlOrAMaaMPGUJr0RTxMPoKzjYkQoJIvC5Ctuk76ag2V93UHuJS0b?=
 =?us-ascii?Q?BOzB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 08:29:44.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b26ee2f-f8ef-4bfa-c080-08d8a653bc8c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdUQekvgzQl5J+/LRjumEJdTwI+n9L4gDsx268BZ1hgT692zNkJDl1tMqZwYqCWWXM8oJLe5jc7sG11WRlP1DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The dhcpcd doesn't work on Intel 32bit platform. Backport a patch to fix
the issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcpcd/dhcpcd_9.3.4.bb                    |  1 +
 ...x-i386-for-SECCOMP-as-it-just-uses-s.patch | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Fix=
-Linux-i386-for-SECCOMP-as-it-just-uses-s.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb b/meta/recipe=
s-connectivity/dhcpcd/dhcpcd_9.3.4.bb
index cd81f17773..69a07760b4 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
@@ -14,6 +14,7 @@ UPSTREAM_CHECK_URI =3D "https://roy.marples.name/download=
s/dhcpcd/"
 SRC_URI =3D "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz=
 \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
            file://0001-Linux-Fix-privsep-build-by-including-sys-termios.h-=
f.patch \
+           file://0001-privsep-Fix-Linux-i386-for-SECCOMP-as-it-just-uses-=
s.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Fix-Linux-=
i386-for-SECCOMP-as-it-just-uses-s.patch b/meta/recipes-connectivity/dhcpcd=
/files/0001-privsep-Fix-Linux-i386-for-SECCOMP-as-it-just-uses-s.patch
new file mode 100644
index 0000000000..b79d5f04ce
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Fix-Linux-i386-fo=
r-SECCOMP-as-it-just-uses-s.patch
@@ -0,0 +1,57 @@
+From 12cdb2be46e25e1ab99df18324b787ad8749dff7 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Sat, 12 Dec 2020 22:12:54 +0000
+Subject: [PATCH] privsep: Fix Linux i386 for SECCOMP as it just uses
+ socketcall
+
+Rather than accept(2), recv(2), etc..... which is horrible!
+
+Thanks to Steve Hirsch <stevehirsch49@msn.com> for testing.
+
+Upstream-Status: Backport
+[https://roy.marples.name/cgit/dhcpcd.git/commit/?id=3D12cdb2be46e25e1ab99=
df18324b787ad8749dff7]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/privsep-linux.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 050a30cf..d31d720d 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -34,6 +34,7 @@
+=20
+ #include <linux/audit.h>
+ #include <linux/filter.h>
++#include <linux/net.h>
+ #include <linux/seccomp.h>
+ #include <linux/sockios.h>
+=20
+@@ -311,6 +312,23 @@ static struct sock_filter ps_seccomp_filter[] =3D {
+ #ifdef __NR_sendto
+ 	SECCOMP_ALLOW(__NR_sendto),
+ #endif
++#ifdef __NR_socketcall
++	/* i386 needs this and demonstrates why SECCOMP
++	 * is poor compared to OpenBSD pledge(2) and FreeBSD capsicum(4)
++	 * as this is soooo tied to the kernel API which changes per arch
++	 * and likely libc as well. */
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_ACCEPT),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_ACCEPT4),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_LISTEN),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_GETSOCKOPT),	/* overflow */
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_RECV),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_RECVFROM),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_RECVMSG),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SEND),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SENDMSG),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SENDTO),
++	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SHUTDOWN),
++#endif
+ #ifdef __NR_shutdown
+ 	SECCOMP_ALLOW(__NR_shutdown),
+ #endif
+--=20
+2.25.1
+
--=20
2.25.1

