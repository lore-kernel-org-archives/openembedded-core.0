Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A91C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:16:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26926.1786648589065447847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eDSRRz82;
 spf=pass (domain: est.tech, ip: 52.101.83.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY//gBVxpmJbk5qaJsyhX/Jmy9gD5SRcLELqPnkbqDWiVZ8mznwXuQibHFrUthApdlRUVoLqprWOfUzlCeomsjVBfLfOyo+x6rZgJEMvmNCw+hA86+4uJqNRbGhbjJpQRwHRCNt76by8G3p7pIJ9rcU9zrt1/RHIFYoFBIZH8/1KZFannBezoVqX6V+VH3Vc0BkKxv+dX/PSWE0tZocpvZF2zrnSfQ1eU0j4mn5edTVoZ0QEmN6zdb8v/ELsiC5ViSz61xgzeJVmEP7XlkRjdSbNeXqIo9vHs9Tm1vxncXNO8aIvzjtLtyspNQekE2ObmML974B825p3y/abnMXItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWMXfrKhkMGEnrUGHHls+9S3s3Z1/nI5Wfp3GldfcaU=;
 b=Ol9fqMnsiwx870RS+NeXH0QfjCQiyn4LP61qHRNk4nl7QZh7lmaf1BhkRXCDVMg2hkCC9mbppL1fNfloV4Y2PkmjzAQ5SUKAbXI7dfziMBKREnVLvw42Va0AOyAqWaC3LVKS5bMpHNQedDXoPCJNB3iZpUJYHMsftpHtyV0FrMvz+rGy8/95fjzVxDHGNkFMBXfOkDkBwh3FRqg+wWom96NDZQcM2ErDElCZzgYlvyN+GJuO4tnb/Abn9DNpz4P2EOQI4NROaDhdD2Lg98d6oNdaIKwJkbro5sro/vEEY5Ww9+erqlAT7SvOyjarmptXlErbLdtHOKd9GaWf/Rsypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWMXfrKhkMGEnrUGHHls+9S3s3Z1/nI5Wfp3GldfcaU=;
 b=eDSRRz82jYXPXWLRh/CcmpZOCpU6wawcG+IKbF6x4RjWEZu6LTlQNBbqi4mcIj+ye+Qvcwcwe7KZM7ktQUxueB21G6MoyUjIUx9zsXVgY56RI2ZbXKSUAS/Ffcrc150ZNe4s5B6VKKtz6nOnBbeHEqCWEd3njwmTMrzWXqceXMoC4Es/pbTwppBwS7tiazaphtFCdd3qVjkdaJ3AxTjIfmcx+772WRYP87nVnPu8fden35mY0tk7DtAws3wN3xF8y7+Zj8MgsrVDxVQx5koDaOMjo0vPadb0+su9FMi6FtnF/cT0aJ8WpgY4g1yhREJ1ktx5L0QWriEsolhrtOcVgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB3733.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:16:24 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Thu, 13 Aug 2026
 19:16:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/5] classes-global: fix trailing whitespace
Date: Thu, 13 Aug 2026 21:16:11 +0200
Message-ID: <20260813191615.34122-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
References: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0302.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV2P189MB3733:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa08a2e-37ee-4fdd-f8d5-08def96f5d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|11063799006|3023799007|22082099003|18002099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	9FiFkwLGtnWzTxFqJQLP/GgsZFoIvWk/Qo4sD7flqgorbKbosN3iyriA2PF0SnRRo8uNwcsxh+COcm64fCqrjRh3CCafA2OSYpmBQ8mkpUV0t2CLrc8RHESWqubvNDQibGkdYmNBi+TPVpnE3O3/ZK1NMjFOPXP/3Dw20/lVRqlz1l5aHZuD+uqd5Qg0llbpfzXA2/Mb4fW6Mp2QX99Zg1XAE0nKmSpZvE89acgpC7WBaj570Ff0ywQe0EKD4/lNymrzgtco/k1725S+RmkmYNO31wZMJ3ujIpuBR7Mqj4F4Gnd5AxEPmOh6WWsiC9yDSmA/T2cU/C9++x4z+V89ij6K4S6swm8xxso4cbkVKRNjHzJHsjz86icSU1zovW/HptOfFdp7ZrsMEK262cCwfcL7yPrXUmvHCIEKb4kqRm2tmlmwICKKRF5oBqxrpdCP4V/LhxUO6NM4gUJTYyYq2Gc2J6hrQ1Bzq+FEGW6GdnU/spGSngt4dQFeIY9qcRpl1sVS9Cq0csAgiY+CUJ5B+4nUPJOnm+wBdasTzX9ISqyqj8FaoQysUwmpZ1Q30j0QNIwJ5eNn03AgIyDsmffqAZBKknD3DlwZPFUaqeMSEbcV3w2G0HCU1aJJVySwReM7twMV5CgK+gaK/f6Q9IAmiiXb2QCiedCl8c31nKQALOQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(11063799006)(3023799007)(22082099003)(18002099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BKzgpNu+xC1LQFYFUA4GS2eit/wuWebmaBiW29oScA6HE5l5xmdsPRCg0bNz?=
 =?us-ascii?Q?grSB9W85Ttvt2dKkt84y40hNAvgxeEA0sJOfHilX32VqPioEikxicQS4wx5b?=
 =?us-ascii?Q?1CQWp3XJMLUSWOj5QGMlNudDLqalnYYlMThlLRLUHPGi0E/+CgtUS7M65Tap?=
 =?us-ascii?Q?EA9rJ0LeOWf6RNn3XU91vyK2AIP8urID8Xd37IDhDMbAdFXnELxlv7izfRKV?=
 =?us-ascii?Q?RFln4xZiny6fsThr4gJKKME3FC+qhwvR31XVrl+DxgkjPv6Qo14+hjeMgKr7?=
 =?us-ascii?Q?MXxVm2/ndglQc46DuHWrbGTfHFqH0RwT3eR7IwRi+NPvBNJGTqwHfpu0r9d2?=
 =?us-ascii?Q?Zcw3TOVOlRamKt04YQpsKcyYuK8w+jYPUNSJ3Xo75BNXpwEoGe9Cz0ymWczq?=
 =?us-ascii?Q?X/mZIQszJcPJShVBD0OAZNjM1sny1vhyNXrZSrp4pbOTn9cQ7ISXmxxsJAYm?=
 =?us-ascii?Q?XcFGgiXFXQmoKzDktPfEBYeZ9cpWT9hrPzDsglNQRHlggCryOJ1KXB2ocjd/?=
 =?us-ascii?Q?bd8Fz1+vrANx+j17y+EueBgCX6P2ZtcIQSuSd4f6dpr1AEY4rp6vJQTjSxFW?=
 =?us-ascii?Q?Beug+9W/rnDsJ0Qmnf8gzMBJ71r2L+GTwQncNvWURKxrvE3vdx7pl+5NgAuv?=
 =?us-ascii?Q?8wIex9mAiEloLC0F+xuo2bBm2McAaEpNg2asJJeL2l505b4y2TH34whchUvh?=
 =?us-ascii?Q?ZJNF8PbHp62zHk81ye3NCnEjEFAgAlO0gT39Mcrp3prNWKD5ZkfJnrlITR4Z?=
 =?us-ascii?Q?A6wzSNPGWcAW44IqAZF7ACeSvWhSoGUMtwW/zuJ6NR2yksqmzSpdpQ2io6z6?=
 =?us-ascii?Q?aNtw78VovhyKSNVCHAmZ1y06wuklyAvNTQHVtv9qFZ70/i8TyyH0LlSSySPB?=
 =?us-ascii?Q?8gS4vJOukG//7XDUjhXz4diTKGMn6OuuivG52C7sXL3qhhnd36usce9/jdJb?=
 =?us-ascii?Q?IcgpnyjOzQLtdeguGxG7F3Hzy1AL8Szdd4lJl38LGUGigf2JDJBoypyj/5ZG?=
 =?us-ascii?Q?Nn1kjJDV1/mJPFN19yRhPc20+3WgknDh6cTrAQo8kSr7Kv3Wt8SUJ9Wvrfqu?=
 =?us-ascii?Q?du3Li46yoMzXSEpk8MjLXsCduzcZTYzitgYu5iqavIN4o8gpgiOou+TQHNlT?=
 =?us-ascii?Q?/HDVlOarLdClTf/pfX2JSWvfmi4FNhJkxgiWLxvxs/Yx39mbO4lCjdVPM/OB?=
 =?us-ascii?Q?Hjp4I+YuB73XlyFD8naXdISB8/68fp2L5PzNmIWJ3yCxf3ksWCjnfosc9Uub?=
 =?us-ascii?Q?WyfWRSMnqYt9csV6KG/Kkeg1f3/sVf3PL58qpFFJrwJpGJcgK9JJ0tPEpUtx?=
 =?us-ascii?Q?DWY2Y5hrZ7k/Q7ZZ8ONYJQOlsa86ZZJJHGXB13Os8SbJ/clJ74TS4zO44WuF?=
 =?us-ascii?Q?GSDYG3L2YHE6ih/nFnCM22H2HdyuylSiT4gfM0t9sF3FqPf9OYPWZwQbaYVT?=
 =?us-ascii?Q?JJiR98O62hiOl36DwXNpl0VaOHvIYQW8t0CWq+cNlBRBgti5bubEaDTtg9hE?=
 =?us-ascii?Q?wOCUDGqEwKQ7gpzC+QnsKqZJ5zUzsLi/Q304ua49UScgygkcCRm7Ti1ESVGt?=
 =?us-ascii?Q?RtF7BDXgXwkW3DghVCyeOTqSUX2pRwqm8d/QK2rltK37x7i43qYifoyISAQa?=
 =?us-ascii?Q?b2N0b+BUsW988F2XavbMbr9f2olE9Wxe97yVgVA9sn57cXsvYd/b6ogsw8jr?=
 =?us-ascii?Q?Q4ltbR7zb+hw6Hr3JMpUNfEH71u+bqi6LMOWs27bglh7/uwrg86PC8kGcaUJ?=
 =?us-ascii?Q?7edtbm2NKwgWFzf/7Ky2ADIMw0v+Z8d3l0VBg6CUyQiJXFoJKzh72antHE8V?=
X-MS-Exchange-AntiSpam-MessageData-1: uoY5IurMUvbfFPW4TleFKyqMJXHvn7ybCmI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa08a2e-37ee-4fdd-f8d5-08def96f5d87
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:16:24.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q07p0nbzXwpjKugmkvWHhpxlnQAPp+Wvvfjkt9k4ppoNgzHBq7MlOC2YQKyGWD3fT2EiKo/3t9L7wtgF+PKUZb3lkq4EhtvkCL3kj45TTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243381

Fix trailing whitespace in classes-global bbclass files to resolve
bitbake parsing warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-global/base.bbclass        |  2 +-
 meta/classes-global/buildstats.bbclass  | 10 +++++-----
 meta/classes-global/debian.bbclass      |  2 +-
 meta/classes-global/devshell.bbclass    |  2 +-
 meta/classes-global/logging.bbclass     |  4 ++--
 meta/classes-global/packagedata.bbclass |  4 ++--
 meta/classes-global/sanity.bbclass      | 16 ++++++++--------
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class
index 5177179d57..5b4996a1e0 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -346,7 +346,7 @@ python base_eventhandler() {
         #
         # If we have multiple providers of virtual/X and a PREFERRED_PROVI=
DER_virtual/X is set
         # skip parsing for all the other providers which will mean they ge=
t uninstalled from the
-        # sysroot since they're now "unreachable". This makes switching vi=
rtual/kernel work in=20
+        # sysroot since they're now "unreachable". This makes switching vi=
rtual/kernel work in
         # particular.
         #
         pn =3D d.getVar('PN')
diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/b=
uildstats.bbclass
index fe64789e10..b97f2fd939 100644
--- a/meta/classes-global/buildstats.bbclass
+++ b/meta/classes-global/buildstats.bbclass
@@ -24,11 +24,11 @@ def get_process_cputime(pid):
     import resource
     with open("/proc/%d/stat" % pid, "r") as f:
         fields =3D f.readline().rstrip().split()
-    stats =3D {=20
+    stats =3D {
         'utime'  : fields[13],
-        'stime'  : fields[14],=20
-        'cutime' : fields[15],=20
-        'cstime' : fields[16], =20
+        'stime'  : fields[14],
+        'cutime' : fields[15],
+        'cstime' : fields[16],
     }
     iostats =3D {}
     if os.path.isfile("/proc/%d/io" % pid):
@@ -161,7 +161,7 @@ def write_host_data(logfile, e, d, type):
             bb.warn("buildstats: Collecting host data failed. BB_HEARTBEAT=
_EVENT interval not enough to run the specified commands. Increase value of=
 BB_HEARTBEAT_EVENT in conf/local.conf.")
             return
=20
-    # set the environment variables=20
+    # set the environment variables
     path =3D d.getVar("PATH")
     opath =3D d.getVar("BB_ORIGENV", False).getVar("PATH")
     ospath =3D os.environ['PATH']
diff --git a/meta/classes-global/debian.bbclass b/meta/classes-global/debia=
n.bbclass
index e2a129d028..aa866f523d 100644
--- a/meta/classes-global/debian.bbclass
+++ b/meta/classes-global/debian.bbclass
@@ -127,7 +127,7 @@ python debian_package_name_hook () {
             add_rprovides(orig_pkg, d)
=20
     # reversed sort is needed when some package is substring of another
-    # ie in ncurses we get without reverse sort:=20
+    # ie in ncurses we get without reverse sort:
     # DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libtic o=
rig_pkg ncurses-libtic debian_pn None newpkg libtic5
     # and later
     # DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg ncurses-libticw =
orig_pkg ncurses-libtic debian_pn None newpkg libticw
diff --git a/meta/classes-global/devshell.bbclass b/meta/classes-global/dev=
shell.bbclass
index 4c23049cf0..1c9eb25696 100644
--- a/meta/classes-global/devshell.bbclass
+++ b/meta/classes-global/devshell.bbclass
@@ -39,7 +39,7 @@ python () {
        # can't manipulate the environment and variables here yet (see YOCT=
O #4795)
        d.setVarFlag("do_devshell", "manualfakeroot", "1")
        d.delVarFlag("do_devshell", "fakeroot")
-}=20
+}
=20
 def pydevshell(d):
=20
diff --git a/meta/classes-global/logging.bbclass b/meta/classes-global/logg=
ing.bbclass
index 136f1e1733..d5ff58fa2f 100644
--- a/meta/classes-global/logging.bbclass
+++ b/meta/classes-global/logging.bbclass
@@ -22,7 +22,7 @@ bbplain() {
 	fi
 }
=20
-# Notify the user of a noteworthy condition.=20
+# Notify the user of a noteworthy condition.
 # Output: logs
 bbnote() {
 	if [ -p ${LOGFIFO} ] ; then
@@ -99,7 +99,7 @@ bbdebug() {
 	if [ $# -lt 2 ]; then
 		bbfatal "$USAGE"
 	fi
-=09
+
 	# Strip off the debug level and ensure it is an integer
 	DBGLVL=3D$1; shift
 	NONDIGITS=3D$(echo "$DBGLVL" | tr -d "[:digit:]")
diff --git a/meta/classes-global/packagedata.bbclass b/meta/classes-global/=
packagedata.bbclass
index 9f72c01d77..748cbe18bf 100644
--- a/meta/classes-global/packagedata.bbclass
+++ b/meta/classes-global/packagedata.bbclass
@@ -8,8 +8,8 @@ python read_subpackage_metadata () {
     import oe.packagedata
=20
     vars =3D {
-        "PN" : d.getVar('PN'),=20
-        "PE" : d.getVar('PE'),=20
+        "PN" : d.getVar('PN'),
+        "PE" : d.getVar('PE'),
         "PV" : d.getVar('PV'),
         "PR" : d.getVar('PR'),
     }
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanit=
y.bbclass
index 9514e7d218..05906d0db2 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -11,7 +11,7 @@
 SANITY_REQUIRED_UTILITIES ?=3D "patch diffstat git bzip2 tar \
     gzip gawk chrpath wget cpio perl file which"
=20
-# Functions added to this variable MUST throw a NotImplementedError except=
ion unless=20
+# Functions added to this variable MUST throw a NotImplementedError except=
ion unless
 # they successfully changed the config version in the config file. Excepti=
ons
 # are used since exec_func doesn't handle return values.
 BBLAYERS_CONF_UPDATE_FUNCS +=3D " \
@@ -28,13 +28,13 @@ python oecore_update_localconf() {
     current_conf  =3D d.getVar('CONF_VERSION')
     conf_version =3D  d.getVar('LOCALCONF_VERSION')
=20
-    failmsg =3D """Your version of local.conf was generated from an older/=
newer version of=20
-local.conf.sample and there have been updates made to this file. Please co=
mpare the two=20
+    failmsg =3D """Your version of local.conf was generated from an older/=
newer version of
+local.conf.sample and there have been updates made to this file. Please co=
mpare the two
 files and merge any changes before continuing.
=20
 Matching the version numbers will remove this message.
=20
-\"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\"=20
+\"${SANITY_DIFF_TOOL} conf/local.conf ${SANITY_LOCALCONF_SAMPLE}\"
=20
 is a good way to visualise the changes."""
     failmsg =3D d.expand(failmsg)
@@ -48,13 +48,13 @@ python oecore_update_siteconf() {
     current_sconf =3D d.getVar('SCONF_VERSION')
     sconf_version =3D d.getVar('SITE_CONF_VERSION')
=20
-    failmsg =3D """Your version of site.conf was generated from an older v=
ersion of=20
-site.conf.sample and there have been updates made to this file. Please com=
pare the two=20
+    failmsg =3D """Your version of site.conf was generated from an older v=
ersion of
+site.conf.sample and there have been updates made to this file. Please com=
pare the two
 files and merge any changes before continuing.
=20
 Matching the version numbers will remove this message.
=20
-\"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\"=20
+\"${SANITY_DIFF_TOOL} conf/site.conf ${SANITY_SITECONF_SAMPLE}\"
=20
 is a good way to visualise the changes."""
     failmsg =3D d.expand(failmsg)
@@ -71,7 +71,7 @@ python oecore_update_bblayers() {
=20
     failmsg =3D """Your version of bblayers.conf has the wrong LCONF_VERSI=
ON (has ${LCONF_VERSION}, expecting ${LAYER_CONF_VERSION}).
 Please compare your file against bblayers.conf.sample and merge any change=
s before continuing.
-"${SANITY_DIFF_TOOL} conf/bblayers.conf ${SANITY_BBLAYERCONF_SAMPLE}"=20
+"${SANITY_DIFF_TOOL} conf/bblayers.conf ${SANITY_BBLAYERCONF_SAMPLE}"
=20
 is a good way to visualise the changes."""
     failmsg =3D d.expand(failmsg)

