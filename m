Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E67C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 09:56:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49136.1699696574896785140
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 01:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9679d11d76=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AB9p62f005217
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 01:56:14 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t3sub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 01:56:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2RztPfBN80YGNipmBffwgsDcqrubC2mwIOAgp79OQd4/QEbljaC0rnkmzkLAMkuGJIcL90mIDKAno+E1r0oWcyZF68KqK0pWA0dBBRzFrgcE47+2BqTgM7udwDHClsrooF+msXqu6iR6/jqk3WpvaqlXhibmQl8TY6zCoWSz1gZgpxGGzVyQZbEj3pRFOh/8B0QFPi9qP2Uoq7jAklZ+K9m/9LomOAXuj65/chhEDI9mWUTHwwCH5IQP8Ac0/4/S6urkMdLAVqoglScxrljBvLhMGCdrzPzHLgrGHwZxgruDYuE7rhi7300DyjaOhd5v69ezn1P30SQDFaFQLLxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otqCV9T6Uk2QNCkYUu+GFD4KNW5rQkKU56ixDXoL2dQ=;
 b=fnzftuwOxkPCaOGixhEIckK07JGEP268p7OKRZqq6r+AIG5qI90K0cWw47ZRQpXnwxLxqpZL//lHJAwARmmqqWVeXGax9//HRGDwIHkSAc11pJGVTAJmHG7UawepwfTsLQgbHjQZtpuQS1ZweqIALyji/xKzVe3V3E4phir1E/Weydzg1BPR6uXWsrV5O6O5+exk17pGVZGfw5eJ/rN1bCRda3cdDUjujYLTCVmjN63CcS6ceZ+KEgdS9j4OI9kQ7kKCkxJmzxt2X19sOP7m0fwP50O/hqlm740En0Q368STSD0ydGQuY6ZU/7Kdkrkhar+yfe6aSj2GZ+TUfhVurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Sat, 11 Nov
 2023 09:56:11 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6977.020; Sat, 11 Nov 2023
 09:56:11 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH] openssh: add systemd readiness notification support
Date: Sat, 11 Nov 2023 18:30:28 +0800
Message-Id: <20231111103028.2896744-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH0PR11MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bbbd27-c661-4e7e-ce10-08dbe29c6f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Leb+acJlxigTDlBi3fn07UBG7AhGXVVuyqDPJaXhpR3e/DAmJQxPVH7vfKmmZHH9gbzAjomyeGciDIsYhdPyZjUyy7of+TqF//Ui5I4lfq3d4n2M1Lk47oZ3H3AFqCIG0/NYmStqY3jKyYJHVSW2kwyme78BdxRvTx0yqPLI3HB5BRvVuLWUh4HXAJN5ckFMiylV0ao8TAQ1may0ESDiiWZeSLtO6EGWmCU1hJkY3sLDt4uk5f9Kt9lt9gcnRdx480LaYvdPuy65Wkvgde04i/okYWQ1ybsFdRR+be9TczUBtHNzOuMBPOhNuyeXTC4FAtISUC1bYDKAdMEhen/oxH9x7MM/fOt1Bk0bNSyxG3nINAfhDZA0xwZGl+I0kmKafJo6h4B1AXr2rl4TowEQahS2Rn5QFb1c9nSMU7ijg9mHInu5DVBa9iJmVb7cDVih8wPO0e7llXNQOrV9YTwbKJYNgba2WcL3s8ILJxYxU7ylMQpvpW8+Qnv1uXbYP7KgfdVvBieuFQIPBAMaXV4FA4eP3ED5qVZi/uajeYwPaGC9GYhSaEdLnOG7yx5JncZYK91SYXPyNDUNxXURUW3p9235SXrWlbHAVBQECXIkyZU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(346002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(41300700001)(6512007)(478600001)(966005)(52116002)(6486002)(6506007)(66946007)(2616005)(44832011)(8936002)(8676002)(83380400001)(6666004)(5660300002)(15650500001)(1076003)(6916009)(316002)(26005)(2906002)(66556008)(66476007)(38100700002)(83170400001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IcyADwibUzlv+Bl5s0RSqIjPZf2LqrO5UJbP8goah9saVPdAtJQbnspd7DpE?=
 =?us-ascii?Q?Dbd/Cly0kX/lUtAer1z3YliZcY9chHz85cjQjjwOis3fTsn1DpXHArCcoj4+?=
 =?us-ascii?Q?PSBhMt1xt49gR+ewzX6mWao9ln2YJ9L7pbCwnzRPoF6x6Eb7kF01PlVqRJJ5?=
 =?us-ascii?Q?ymzVEDHstL6N3/QmpW7V0s1Waa7IZCLvljbNw2wGHzSQBRiqXAXz98cJowKk?=
 =?us-ascii?Q?qV96c1hDS1UhlCiD2S88/b9o3+OaexQ43A1XMp2zOqYow/g5WqQ2KM0SAob8?=
 =?us-ascii?Q?I8jd+Jh1+F3iVR/1S4vLlOSKenHYS3WS2yKefxEipxmWjdi/MMTcw8I58CTp?=
 =?us-ascii?Q?oUK8i8YA0UX7QE69mXNnlggJvYr48W4+bXxFrlnyR0lklkmiynMYBJNRQSWg?=
 =?us-ascii?Q?FNV/pehAg7doodYyi0DlVIgxBPWggkx5d58N7dOQpsCzqR8qbhgIlBZOWSeF?=
 =?us-ascii?Q?NRn2eHIFACMYBUBFXzztJZWpgzfb/jvRdHCY1JzzEhk6tG+J9xpBwn86UnGb?=
 =?us-ascii?Q?94e2AQqVPQ4m+2Z6AIo0b4cBmBzZeL43uLdui6Q448oMNJuMsOE6USVibHGc?=
 =?us-ascii?Q?eBclYaEVcvN8XKBEsdHQ53zTCtE9IRw6qntJYjzelDNpRrER8JHGiJS0N1H6?=
 =?us-ascii?Q?J8tYvBvWXbawkk7pSVZsnpHh52/z25aGQhiaUGE+Glg0Ehc8bgvLRZuV7Fi5?=
 =?us-ascii?Q?yhpEC1iEenXi77/v2FMm1ky2CSj15UzIkj4Ej3I7brblrIjWdmpkom6jQdNp?=
 =?us-ascii?Q?MTAjeW8MW6thOiQFMyXmIDLis6U5sQY4n1CP8nRqPTvIlAyS6nFLHyYhfDlz?=
 =?us-ascii?Q?s9ciMDzIkwQxHSDFXbQ6xfjdbNibLq+5Q7KoKJ7I1lcSYmcF/igJqnHYQX8o?=
 =?us-ascii?Q?tRahUpY9wA2eKCl5kmSzxGvaGOMuRgwpA7Vc6R5SK8eQH7sUigLWDTstkACZ?=
 =?us-ascii?Q?+YI25lN2xv2+JAPQbLnpskh0Vk28J+TVbTJ4a+VBY3a+8p2L68X1c+vEKMdi?=
 =?us-ascii?Q?t8gqw/n7tC+bizNVxefDFoQ/KdrK6pPvCO9T39ZmlPCUROwmie9PiFMQK5qs?=
 =?us-ascii?Q?nAFNxOC0wJokyGwr5Jm/gW97WaLB5or4IpiMWS+LeudvNoXsx+ZkdZXsnk4/?=
 =?us-ascii?Q?Mj7eA2BTqa16E2RF6677JBE0IN1VCC0WXSD7gcZ+GHErEynGMLoRPkeK3Z1/?=
 =?us-ascii?Q?5AyQk2sxJREzrNH82kN1HYqYlHL56FPtZqU3POtDXCCjLT7AQP+pJcRmp63j?=
 =?us-ascii?Q?xJvWbv2czuN+n6TxshWH/z14S71DW6gUWPGmdcITGYDEkCeR3cF+M8t7R5yO?=
 =?us-ascii?Q?DizLuZSTCUf3pPdLhhNGmwcaWQE3R9S2CCFJd0RogFhSOYejpJ/0tLALZQTz?=
 =?us-ascii?Q?kPmpL5TYL5aKHvkvt4OwmZstJTb3CnVNpK4YNaL7yQeaQyerUd2ngJZ5Qr98?=
 =?us-ascii?Q?8N9IQMdA3FsFHA4V9TCk0CZksuQNMNMenHS5OPRNdEh2VIfPP1NzTo4WGx1r?=
 =?us-ascii?Q?KWURLS29vR0PffnT3mvrF3NAt4kVTnGEChuSwGiEjfGMA2t7cyfEo5zevWh6?=
 =?us-ascii?Q?mRf2VrgUnVGjrY4OfHRtKIvkHsilNq7yLpWbwSF9iTrtv/p/g0f5iYG7y5hC?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bbbd27-c661-4e7e-ce10-08dbe29c6f04
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2023 09:56:11.0534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKE6/e00Y6K1FLV9CeIHXC2Qm+SjhOAYwT9nxCiCIcpLjXVr16QtMDuPhUOsmbtF9cbOjDJ4gZ68zs/c+vVb9repdV4rf/8MnC3Kl8fmtlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
X-Proofpoint-GUID: y-q7oF-p6tfLz87q0aBmAP3G9fZ3NMg9
X-Proofpoint-ORIG-GUID: y-q7oF-p6tfLz87q0aBmAP3G9fZ3NMg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-11_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311110083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 09:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190413

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The sshd keeps on terminating and restarting in servel minutes, we can observe
log from journalctl that the sshd was killed by systemd with signal 15:

    systemd[1]: sshd.service start operation timed out. Terminating.
    sshd[374]: Received signal 15; terminating.

When the sshd as a systemd service, it need to tell systemd with a "READY" status,
otherwise, systemd would treat it as failing service and restart it again.

Taken a patch from debain[1] that after sshd listening port, using a signal to tell systemd
it is ready now.

Ref:
[1] https://sources.debian.org/patches/openssh/1:9.4p1-1/systemd-readiness.patch

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../openssh/openssh/systemd-readiness.patch   | 93 +++++++++++++++++++
 .../openssh/openssh_9.5p1.bb                  |  6 +-
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/systemd-readiness.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/systemd-readiness.patch b/meta/recipes-connectivity/openssh/openssh/systemd-readiness.patch
new file mode 100644
index 0000000000..0f3dc23053
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/systemd-readiness.patch
@@ -0,0 +1,93 @@
+From 3a67c50db67d31120bc3e2f25e75632d5ddaaf93 Mon Sep 17 00:00:00 2001
+From: Michael Biebl <biebl@debian.org>
+Date: Mon, 21 Dec 2015 16:08:47 +0000
+Subject: Add systemd readiness notification support
+
+Bug-Debian: https://bugs.debian.org/778913
+Forwarded: no
+Last-Update: 2017-08-22
+
+Patch-Name: systemd-readiness.patch
+
+Add systemd readiness notification support
+
+Patch taken from debian repository
+[https://sources.debian.org/patches/openssh/1:9.4p1-1/systemd-readiness.patch/]
+
+Upstream-Status: Inappropriate [systemd specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ configure.ac | 24 ++++++++++++++++++++++++
+ sshd.c       |  9 +++++++++
+ 2 files changed, 33 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8ff3cdd05..5aec9ce25 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4888,6 +4888,29 @@ AC_SUBST([GSSLIBS])
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
+@@ -5688,6 +5711,7 @@ echo "                   libldns support: $LDNS_MSG"
+ echo "  Solaris process contract support: $SPC_MSG"
+ echo "           Solaris project support: $SP_MSG"
+ echo "         Solaris privilege support: $SPP_MSG"
++echo "                   systemd support: $SYSTEMD_MSG"
+ echo "       IP address in \$DISPLAY hack: $DISPLAY_HACK_MSG"
+ echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
+ echo "                  BSD Auth support: $BSD_AUTH_MSG"
+diff --git a/sshd.c b/sshd.c
+index 29db3a2ac..731b9e400 100644
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
+@@ -2101,6 +2105,11 @@ main(int ac, char **av)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
index 3a94633cf0..9b2f2a42d2 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
@@ -26,7 +26,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
+           file://systemd-readiness.patch \
            "
+
 SRC_URI[sha256sum] = "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
@@ -51,7 +53,8 @@ INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
 SYSTEMD_PACKAGES = "${PN}-sshd"
 SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
 
-inherit autotools-brokensep ptest
+inherit autotools-brokensep ptest pkgconfig
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
@@ -69,6 +72,7 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 --sysconfdir=${sysconfdir}/ssh \
                 --with-xauth=${bindir}/xauth \
                 --disable-strip \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)} \
                 "
 
 # musl doesn't implement wtmp/utmp and logwtmp
-- 
2.25.1


