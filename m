Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2625EC54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:40:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.74719.1724755245733040878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=896980ac62=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RAPdYF005256;
	Tue, 27 Aug 2024 10:40:44 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754qaxbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Aug 2024 10:40:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 03:40:42 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 03:40:41 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/2] bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead
Date: Tue, 27 Aug 2024 18:40:40 +0800
Message-ID: <20240827104041.2743023-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tLe8GLE0SGKkuFeInxEiJatq5dQZJInz
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=66cdad2b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=v5dArkq7AAAA:8 a=5o5k-uPN5MWogmgJaFMA:9 a=9FEynwAeegknzarf:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=TEbYHdZSG6lHt7PUBOgh:22
X-Proofpoint-ORIG-GUID: tLe8GLE0SGKkuFeInxEiJatq5dQZJInz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408270079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203828

From: Changqing Li <changqing.li@windriver.com>

Drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead. By default,
it contains 'files/fs-perms-volatile-log.txt', which means volatile log
is enabled. User can disable volatile log by remove
'files/fs-perms-volatile-log.txt' from FILESYSTEM_PERMS_TABLES.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf                        |  7 ++--
 ...tent-log.txt => fs-perms-volatile-log.txt} | 33 +------------------
 meta/files/fs-perms.txt                       |  1 -
 .../base-files/base-files_3.0.14.bb           |  4 +--
 .../initscripts/initscripts_1.0.bb            |  2 +-
 meta/recipes-core/systemd/systemd_256.5.bb    |  2 +-
 6 files changed, 7 insertions(+), 42 deletions(-)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-volatile-log.txt} (52%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1acb56433c..76ae17e644 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -86,10 +86,6 @@ USRBINPATH:class-nativesdk = "/usr/bin"
 # Root home directory
 ROOT_HOME ??= "/home/root"
 
-# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
-# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
-VOLATILE_LOG_DIR ?= "yes"
-
 # if set to 'yes': /tmp links to /var/tmp which links to /var/volatile/tmp
 # otherwise:       /tmp is on persistent storage
 VOLATILE_TMP_DIR ?= "yes"
@@ -384,7 +380,8 @@ FILESEXTRAPATHS ?= "__default:"
 #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
-FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}"
+FILESYSTEM_PERMS_TABLES ?=  "files/fs-perms.txt \
+                             files/fs-perms-volatile-log.txt"
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-volatile-log.txt
similarity index 52%
rename from meta/files/fs-perms-persistent-log.txt
rename to meta/files/fs-perms-volatile-log.txt
index 61f0a6e26a..fc846bbdc5 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-volatile-log.txt
@@ -28,38 +28,7 @@
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
+${localstatedir}/log	link	volatile/log
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index 48191f504c..61f0a6e26a 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -45,7 +45,6 @@ ${includedir}		0755	root	root	true	0644	root	root
 # Items from base-files
 # Links
 ${localstatedir}/run	link	/run
-${localstatedir}/log	link	volatile/log
 ${localstatedir}/lock	link	/run/lock
 ${localstatedir}/tmp	link	volatile/tmp
 
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 1b6e9671e4..dc1292ae55 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -44,7 +44,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
            ${localstatedir}/backups ${localstatedir}/lib \
            ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
-           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
+           ${localstatedir}/${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-log.txt', 'volatile/', '', d)}log \
            /home ${prefix}/src ${localstatedir}/local \
            /media"
 
@@ -55,7 +55,7 @@ dirs755-lsb = "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb = "/var/mail"
 
-volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
+volatiles = "${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-log.txt', 'log', '', d)} tmp"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 65f97a0af2..0879b30623 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -106,7 +106,7 @@ do_install () {
 	install -m 0755    ${S}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${S}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${S}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
+	if ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-log.txt', 'true', 'false', d)}; then
 		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
 	fi
diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
index ee656c81e5..7f66c921ab 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -313,7 +313,7 @@ do_install() {
 		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
 
-	if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'false'}"; then
+	if ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-log.txt', 'true', 'false', d)}; then
 		# base-files recipe provides /var/log which is a symlink to /var/volatile/log
 		rm -rf ${D}${localstatedir}/log
 		printf 'L\t\t%s/log\t\t-\t-\t-\t-\t%s/volatile/log\n' "${localstatedir}" \
-- 
2.25.1


