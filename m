Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F05C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:02:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3851.1717059766773682553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 02:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=68801c3898=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U7pi4P025159
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:02:46 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yeg6y085r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:02:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 02:02:44 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 02:02:43 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] VOLATILE_TMP_DIR: Extend to specify the persistence of /var/tmp
Date: Thu, 30 May 2024 17:02:43 +0800
Message-ID: <20240530090243.3927412-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pto-NnS68AHXRzvewBL8W0reShPSABMz
X-Proofpoint-GUID: pto-NnS68AHXRzvewBL8W0reShPSABMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200015

From: Changqing Li <changqing.li@windriver.com>

Currently, set VOLATILE_TMP_DIR to "no", only make /tmp as persistent.
This patch extends VOLATILE_TMP_DIR to also specify the persistence of
/var/tmp by following changes:

* change FILESYSTEM_PERMS_TABLES to remove symlink /var/tmp -> /var/volatile/tmp
  for the packaging process
* update base-files to create /var/tmp as a dir not symlink to /var/volatile/tmp

Here is an use case:
Steps:
1. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
2. docker run -it --rm poky:latest /bin/sh
3. /var/log /var/tmp are deadlinks, and cause "No such file or directory" errors

Root cause:
By default, /var/tmp links to /var/volatile/tmp, and /var/volatile/tmp
usually created by initscript(sysV) or systemd-tmpfile.d(systemd) during
boot up, but for container, initscript/systemd-tmpfile.d will not be
executed, so /var/volatile/tmp is not created.

This patch provides an option for user want to use container, set
VOLATILE_TMP_DIR to "no" can resolve above case.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf                        |  5 ++-
 ...fs-perms.txt => fs-perms-volatile-log.txt} | 32 -------------------
 ...tent-log.txt => fs-perms-volatile-tmp.txt} | 27 ----------------
 meta/files/fs-perms.txt                       |  3 --
 .../base-files/base-files_3.0.14.bb           |  5 +--
 5 files changed, 7 insertions(+), 65 deletions(-)
 copy meta/files/{fs-perms.txt => fs-perms-volatile-log.txt} (53%)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-volatile-tmp.txt} (59%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ef2deb088..e6ec640809 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -384,7 +384,10 @@ FILESEXTRAPATHS ?= "__default:"
 #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
-FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}"
+FILESYSTEM_PERMS_TABLES ?=  " files/fs-perms.txt \
+                              ${@'files/fs-perms-volatile-log.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else ''} \
+                              ${@'files/fs-perms-volatile-tmp.txt' if oe.types.boolean(d.getVar('VOLATILE_TMP_DIR')) else ''} \
+                            "
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms-volatile-log.txt
similarity index 53%
copy from meta/files/fs-perms.txt
copy to meta/files/fs-perms-volatile-log.txt
index 48191f504c..fc846bbdc5 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms-volatile-log.txt
@@ -28,39 +28,7 @@
 # Note: all standard config directories are automatically assigned "0755 root root false - - -"
 
 # Documentation should always be corrected
-${mandir}		0755	root	root	true	0644	root	root
-${infodir}		0755	root	root	true	0644	root	root
-${docdir}		0755	root	root	true	0644	root	root
-${datadir}/gtk-doc	0755	root	root	true	0644	root	root
-
-# Fixup locales
-${datadir}/locale	0755	root	root	true	0644	root	root
-
-# Cleanup headers
-${includedir}		0755	root	root	true	0644	root	root
-
-# Cleanup debug src
-/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-${localstatedir}/run	link	/run
 ${localstatedir}/log	link	volatile/log
-${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
-
-/home				0755	root	root	false - - -
-/srv				0755	root	root	false - - -
-${prefix}/src			0755	root	root	false - - -
-${localstatedir}/local		0755	root	root	false - - -
-
-# Special permissions from base-files
-# Set 1777
-/tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
-
-# Set 0700
-${ROOT_HOME}			0700	root	root	false - - -
-
-# Set 2775-lsb
-${localstatedir}/mail		02775	root	mail	false - - -
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-volatile-tmp.txt
similarity index 59%
rename from meta/files/fs-perms-persistent-log.txt
rename to meta/files/fs-perms-volatile-tmp.txt
index 61f0a6e26a..26247acda8 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-volatile-tmp.txt
@@ -28,38 +28,11 @@
 # Note: all standard config directories are automatically assigned "0755 root root false - - -"
 
 # Documentation should always be corrected
-${mandir}		0755	root	root	true	0644	root	root
-${infodir}		0755	root	root	true	0644	root	root
-${docdir}		0755	root	root	true	0644	root	root
-${datadir}/gtk-doc	0755	root	root	true	0644	root	root
-
-# Fixup locales
-${datadir}/locale	0755	root	root	true	0644	root	root
-
-# Cleanup headers
-${includedir}		0755	root	root	true	0644	root	root
-
-# Cleanup debug src
-/usr/src/debug		0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-${localstatedir}/run	link	/run
-${localstatedir}/lock	link	/run/lock
 ${localstatedir}/tmp	link	volatile/tmp
 
-/home				0755	root	root	false - - -
-/srv				0755	root	root	false - - -
-${prefix}/src			0755	root	root	false - - -
-${localstatedir}/local		0755	root	root	false - - -
-
 # Special permissions from base-files
 # Set 1777
-/tmp				01777	root	root	false - - -
 ${localstatedir}/volatile/tmp	01777	root	root	false - - -
-
-# Set 0700
-${ROOT_HOME}			0700	root	root	false - - -
-
-# Set 2775-lsb
-${localstatedir}/mail		02775	root	mail	false - - -
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index 48191f504c..d2266c1b26 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -45,9 +45,7 @@ ${includedir}		0755	root	root	true	0644	root	root
 # Items from base-files
 # Links
 ${localstatedir}/run	link	/run
-${localstatedir}/log	link	volatile/log
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +55,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 1b6e9671e4..256dfb214e 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -31,7 +31,7 @@ UNPACKDIR = "${S}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 docdir:append = "/${P}"
-dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
+dirs1777 = "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}tmp"
 dirs2775 = ""
 dirs555 = "/sys /proc"
 dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -55,7 +55,8 @@ dirs755-lsb = "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb = "/var/mail"
 
-volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
+volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} \
+             ${@'tmp' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
-- 
2.25.1


