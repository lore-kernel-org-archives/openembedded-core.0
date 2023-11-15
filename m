Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4420DC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 04:30:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6193.1700022647687654956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 20:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9683a39693=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF319pm010479
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:30:47 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua5s4u6mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:30:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRJYeJQQcjuGtAI8Kx6gGdmpyYjldFXOD7QUeGE6BQMznmowDVCv4ngoymfA0inxZdQXV02ZytrLe7ItYLN3sHurZKzzRaEFpDcc6+9WHhXfRo4efi3CdUx/B8CTj0QBo24fEVQik1xep4CSkqRDDO7jzL+meDG5UUbzqhEnKQrP5HbkMvdQWiCTV4QLhJI4mEUl3rCbyzs7RPzU35or5P49laD/J3f0z4ol07Wl4dZvS16FX/vcCJlzwh+dUffIqy1rqe4FsdkU27uuxAj6wIO29o7o9MQJrtUR0DjcugyFOTQ6p8sSuCTQbdIxHqCTMUQi8QfsnvOd+REzHFia1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsbhLhkutfg3fOAlmx+aGZpYstJxAZdesT/IY0C4Cv0=;
 b=QkbjpqZ+oBXkJjSB5tjbVBekjBxBgWjZyYgp3Qfh4KYzvARL9Zx8lobPy/inhkFXgEmwLpxclwV42ziZTEaAtibe7lLnbrk8APz5Cz/X+gHTdzRN4IFERd0I9UURElgA23g0znMxgqyMjzcSSZFpm76pr1IO6knEC1OtHxr9ICrg5eNuqASZUtPeCeKqP3RwES01A+a01Z0yv5hyffOxGbPMlmZAFmyWpv/J7Wu5lOp5MpnK8EXk7tiBQ5OKDuVJG0KOFRYQs4bva/0oU+881uGvXCJeU15mbdLObKa8LRh5KWub44/b6bcEWNPJpVb9Ggm+bJkL/aEWROFgKPeW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 04:30:45 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 04:30:45 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH v2] openssh: add systemd readiness notification support
Date: Wed, 15 Nov 2023 13:05:07 +0800
Message-Id: <20231115050507.3572177-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:404:e2::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 449466e7-99af-470d-97ca-08dbe593a1f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+b/Z9GlviNTrnodQRXz+WGoP8XOvq7A7MJFxcSfzmFTp3h2T3CVwLBip24fzWl8b9LSUQVH+87F3fJ5ErVXrSrcKIbkHy0YbszAsaysK+wWPevA5s8oarDXtfkSD3+xLePW3GD+j0fHoYW1rnokAvwlqFjogb1T+sz/AMSb34r2uEb1z4locof/Z8niE5d/AgCniC0ofyPg3HAkaFB7O2BJ1doaFW/ojCXUo5KAKbPV1MN96Ex75zjx7VMHbgXcqfHK9IM4GTW2l8+iki96/TstuwVNEUtABxkqx4SbjqpyQn8PMdoCZcmOz0I3VPSvngw31qZvOeBPfLjsl2e3L4rExSdqophNAM/mLDj4b39KUfJmRGouSP1BJGihfkXHIsH/4o/l1/10+A5Pi095DRGgflDPGvE9ah5oPqsIxJpW4S6xsmeoMav0eUTb4rlqoMYh6Q8YZgtgp+JeJeVLQhcOoNiDdPrrIZjNIPTUHMti6N89/4Tygy0mAnBZ0YD1FXN5MJnfUUYftiPM8RBVxWX4RF0SNenPpPdaJTda0Aiusg3OOCPO+1E0/zctzK5h+oEHLENJi5V/DFH5vAMaJjNZH3GsvX9oCT5kVAargWcM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(136003)(376002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38350700005)(83170400001)(38100700002)(2906002)(5660300002)(41300700001)(478600001)(83380400001)(966005)(6486002)(6506007)(52116002)(8936002)(8676002)(6666004)(66556008)(66946007)(66476007)(316002)(6916009)(2616005)(26005)(1076003)(44832011)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KU9lYdg37vXz4cv4OmxjOhY33LvmFWDo9jT49yldxmNHDppiR2a8QMirsCK7?=
 =?us-ascii?Q?OBJRdWqQjhBj8QGkIzyzRLdiRh8SQO8E+uQCwMw/1jIWZI2lkQn1d8sOcIUH?=
 =?us-ascii?Q?yBOBMrsGPTeqvc7nc3zeAKFORMPQIuSB+uKC+I4RLxuT4EXX3MkghTB/6dV+?=
 =?us-ascii?Q?gRTWiMliV2/Wo8yJuseWDTXdacxhlm0jBCxc9ZwU3MrQdYiG0u8QJ00B1yVz?=
 =?us-ascii?Q?CSolyPY/U5tMTGk9EAt3JS0ZceJyAg4CatIiPKnL8EPJgPH72hUJW/hGMAe/?=
 =?us-ascii?Q?6EVpz5XJiZ2YsH2vgwQMLWSJ4v4xOli1vmXtYsXk2llFD8CH2PxfFreJILdx?=
 =?us-ascii?Q?r1MixpLUo45vsPwKdWYy7S0eoY/sLnIcwVLA5ik/KFYtYbijB7g/QL3VGCbq?=
 =?us-ascii?Q?jrqJnVNEN7zAPXVtA3gWmBFctEt0V8zH/N/R1ky/JaKm678RMLUsx24Y5xZj?=
 =?us-ascii?Q?kiUsfY63LpvcGdRyLH0qpdVXhYjIvZbz3GbCPc7sejQKTXXYnv6TkZhxdgFF?=
 =?us-ascii?Q?Lp7KVP5gSHVXiqt9c6zRs7HAYlxi/T11gHGihcy65l7PCK9ncAsOMgik7Xj5?=
 =?us-ascii?Q?f4Gmt/bxFTWWcJPObfUQ+4xClMFpNnl8PMMpbaehAldh2Tdx0JkqsIFplFZ2?=
 =?us-ascii?Q?jyFWypYIFgGn+DHFEqZEJTcnZZ5IYzafkB/ktutkfTOMFOiv3N0ay9ZXHYfq?=
 =?us-ascii?Q?HVNN90++GfYFk1hnD2+9yOpkhhdAYx+iQBslV/qAFPPh/b+0RLyQvhl6nImK?=
 =?us-ascii?Q?hHsrOmVuRvGFIkYQ/HVuRFp99eaK2gYn/Wu6w3H4NIeprj41mDaXlsPHWNSV?=
 =?us-ascii?Q?v0O93S43wFwEqas3fHc6d3V1bHTITX0L4vPwAIfCLKnnMiJxG62Jf1xGdz4P?=
 =?us-ascii?Q?7sOVg8yp/yH3se0fcJTpo0LfT9G0x3FQduFrx6exLydnqLS3J8Vrg5XDDnQm?=
 =?us-ascii?Q?zjbhcHV+jC8nafQkPWjycvF8ERH7uwmA/mX2TWM+VkNCQ/IqipEoW7fMDjj1?=
 =?us-ascii?Q?O80r+dngRR3dKv5GdjoEw73ieJuqDV5c79A+GpWvm/+7/xNVT5LCpzUh+iww?=
 =?us-ascii?Q?h97qk+IPh7mh0v7UhucLKFLHQDB68B9bcp0tzLw0gMLQn9cieiY4N65QPCaP?=
 =?us-ascii?Q?GjHfCHMYZlayvMj9tQy4lKorAQ837fLobNHxsOWXioNb+mAahQ24Et3Nj/hO?=
 =?us-ascii?Q?fLryvb7Y7ZtqyP5FuTON29IzLNKSyedVZgYhzFkgPdAHnoJn0Av7U3jAhUyN?=
 =?us-ascii?Q?9ZAOrWu6L0Bv/lz9u7aOEr2GUk7e+H9v/wqm2sf79MmJL3p4rsuPV/jOVbB8?=
 =?us-ascii?Q?WJRzvtQBjGxad64Hil0PEcvKwLaCWHfSV7w7ESzgpiCjPAshYBfdIFlp9TYN?=
 =?us-ascii?Q?EYhRkmMlgRs5lMGTC3Bn7Sw4QpL1bP/Fmu6D6EnOT34uBbEhVf87AHCvGgnJ?=
 =?us-ascii?Q?XsKBoweXJnuFA245CoscKz5YFmamdZL2X+aMYZ075DHxmSyjWACpQqUvuE61?=
 =?us-ascii?Q?9P79+Wp5F86HkveZqVi3LATzoNqZCXPfDyHDiWr4PDxIcWrvXetBj47tCiz7?=
 =?us-ascii?Q?U40cJQG4OjdueUh6sfQDz6S0yjbZU7/HMGoTgkOiWPb63bwk6C7AQ8v3+6YS?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449466e7-99af-470d-97ca-08dbe593a1f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 04:30:44.5087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4FngriWkV27jqiLUBmGt9SbQqIA27H08FXTlZOw2xQA9GlLc7qBY5HE0n9WgTQINQDv8sLcWhcH9NfJ7CQTbf+VUsEky5zG/Hn/ybVkbcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
X-Proofpoint-GUID: UO01sAASVmZckfPsiAj0DahLYL2QqBfH
X-Proofpoint-ORIG-GUID: UO01sAASVmZckfPsiAj0DahLYL2QqBfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_02,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311150034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 04:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190553

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The sshd keeps on terminating and restarting in servel minutes, we can observe
log from journalctl that the sshd was killed by systemd with signal 15:

    systemd[1]: sshd.service start operation timed out. Terminating.
    sshd[374]: Received signal 15; terminating.

When the sshd as a systemd service, it need to tell systemd with a "READY" status,
and when it is restarted, it need to tell systemd with a "RELOADING" status, otherwise,
systemd would treat it as failing service and restart it again.

Taken a patch from openssh upstream PR[1], that after using a signal to tell systemd
it is ready or reload now.

Ref:
[1] https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...tional-support-for-systemd-sd_notify.patch | 99 +++++++++++++++++++
 .../openssh/openssh_9.5p1.bb                  |  5 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
new file mode 100644
index 0000000000..acda8f1ce9
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -0,0 +1,99 @@
+From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
+From: Matt Jolly <Matt.Jolly@footclan.ninja>
+Date: Thu, 2 Feb 2023 21:05:40 +1100
+Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
+
+This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
+patch based on Jakub Jelen's <jjelen@redhat.com> original patch
+
+Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ configure.ac | 24 ++++++++++++++++++++++++
+ sshd.c       | 13 +++++++++++++
+ 2 files changed, 37 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 22fee70f..486c189f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
+ AC_SUBST([K5LIBS])
+ AC_SUBST([CHANNELLIBS])
+ 
++# Check whether user wants systemd support
++SYSTEMD_MSG="no"
++AC_ARG_WITH(systemd,
++	[  --with-systemd          Enable systemd support],
++	[ if test "x$withval" != "xno" ; then
++		AC_PATH_TOOL([PKGCONFIG], [pkg-config], [no])
++		if test "$PKGCONFIG" != "no"; then
++			AC_MSG_CHECKING([for libsystemd])
++			if $PKGCONFIG --exists libsystemd; then
++				SYSTEMD_CFLAGS=`$PKGCONFIG --cflags libsystemd`
++				SYSTEMD_LIBS=`$PKGCONFIG --libs libsystemd`
++				CPPFLAGS="$CPPFLAGS $SYSTEMD_CFLAGS"
++				SSHDLIBS="$SSHDLIBS $SYSTEMD_LIBS"
++				AC_MSG_RESULT([yes])
++				AC_DEFINE(HAVE_SYSTEMD, 1, [Define if you want systemd support.])
++				SYSTEMD_MSG="yes"
++			else
++				AC_MSG_RESULT([no])
++			fi
++		fi
++	fi ]
++)
++
+ # Looking for programs, paths and files
+ 
+ PRIVSEP_PATH=/var/empty
+@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MSG"
+ echo "  Solaris process contract support: $SPC_MSG"
+ echo "           Solaris project support: $SP_MSG"
+ echo "         Solaris privilege support: $SPP_MSG"
++echo "                   systemd support: $SYSTEMD_MSG"
+ echo "       IP address in \$DISPLAY hack: $DISPLAY_HACK_MSG"
+ echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
+ echo "                  BSD Auth support: $BSD_AUTH_MSG"
+diff --git a/sshd.c b/sshd.c
+index 6321936c..859d6a0b 100644
+--- a/sshd.c
++++ b/sshd.c
+@@ -88,6 +88,10 @@
+ #include <prot.h>
+ #endif
+ 
++#ifdef HAVE_SYSTEMD
++#include <systemd/sd-daemon.h>
++#endif
++
+ #include "xmalloc.h"
+ #include "ssh.h"
+ #include "ssh2.h"
+@@ -310,6 +314,10 @@ static void
+ sighup_restart(void)
+ {
+ 	logit("Received SIGHUP; restarting.");
++#ifdef HAVE_SYSTEMD
++	/* Signal systemd that we are reloading */
++	sd_notify(0, "RELOADING=1");
++#endif
+ 	if (options.pid_file != NULL)
+ 		unlink(options.pid_file);
+ 	platform_pre_restart();
+@@ -2086,6 +2094,11 @@ main(int ac, char **av)
+ 			}
+ 		}
+ 
++#ifdef HAVE_SYSTEMD
++		/* Signal systemd that we are ready to accept connections */
++		sd_notify(0, "READY=1");
++#endif
++
+ 		/* Accept a connection and return in a forked child */
+ 		server_accept_loop(&sock_in, &sock_out,
+ 		    &newsock, config_s);
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
index 3a94633cf0..bbb8fb091a 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
+           file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            "
 SRC_URI[sha256sum] = "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
 
@@ -51,7 +52,8 @@ INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
 SYSTEMD_PACKAGES = "${PN}-sshd"
 SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep ptest pkgconfig
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
@@ -69,6 +71,7 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --sysconfdir=${sysconfdir}/ssh \
                 --with-xauth=${bindir}/xauth \
                 --disable-strip \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)} \
                 "
 
 # musl doesn't implement wtmp/utmp and logwtmp
-- 
2.25.1


