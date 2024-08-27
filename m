Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C6AC54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:40:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.75534.1724755246583683087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=896980ac62=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RAPdYG005256;
	Tue, 27 Aug 2024 10:40:45 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754qaxbn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Aug 2024 10:40:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 03:40:43 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 03:40:42 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead
Date: Tue, 27 Aug 2024 18:40:41 +0800
Message-ID: <20240827104041.2743023-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827104041.2743023-1-changqing.li@windriver.com>
References: <20240827104041.2743023-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: R_egIXzwS1kUWYd4Jo1-afbECqz1xAXw
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=66cdad2d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=v5dArkq7AAAA:8 a=hsMeTk97ebtgPbgoDVcA:9 a=Nk84JyB_S_9gBxnZ:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=TEbYHdZSG6lHt7PUBOgh:22
X-Proofpoint-ORIG-GUID: R_egIXzwS1kUWYd4Jo1-afbECqz1xAXw
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203829

From: Changqing Li <changqing.li@windriver.com>

* Drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead. By default,
FILESYSTEM_PERMS_TABLES ?=  "files/fs-perms.txt \
                             files/fs-perms-volatile-log.txt \
                             files/fs-perms-volatile-tmp.txt"
it contains 'files/fs-perms-volatile-tmp.txt', which means volatile tmp
is enabled. User can disable volatile tmp by remove
'files/fs-perms-volatile-tmp.txt' from FILESYSTEM_PERMS_TABLES.
* If volatile tmp is disabled, both /tmp and /var/tmp are persistent

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf                        |  7 ++---
 ...fs-perms.txt => fs-perms-volatile-tmp.txt} | 27 -------------------
 meta/files/fs-perms.txt                       |  2 --
 .../base-files/base-files_3.0.14.bb           |  5 ++--
 .../initscripts/initscripts_1.0.bb            |  2 +-
 meta/recipes-core/systemd/systemd_256.5.bb    |  2 +-
 6 files changed, 7 insertions(+), 38 deletions(-)
 copy meta/files/{fs-perms.txt => fs-perms-volatile-tmp.txt} (59%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 76ae17e644..d8252c5b82 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -86,10 +86,6 @@ USRBINPATH:class-nativesdk = "/usr/bin"
 # Root home directory
 ROOT_HOME ??= "/home/root"
 
-# if set to 'yes': /tmp links to /var/tmp which links to /var/volatile/tmp
-# otherwise:       /tmp is on persistent storage
-VOLATILE_TMP_DIR ?= "yes"
-
 BB_RENAMED_VARIABLES[PNBLACKLIST] = "SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] = "CVE_CHECK_SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] = "CVE_CHECK_IGNORE"
@@ -381,7 +377,8 @@ FILESEXTRAPATHS ?= "__default:"
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
 FILESYSTEM_PERMS_TABLES ?=  "files/fs-perms.txt \
-                             files/fs-perms-volatile-log.txt"
+                             files/fs-perms-volatile-log.txt \
+                             files/fs-perms-volatile-tmp.txt"
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms-volatile-tmp.txt
similarity index 59%
copy from meta/files/fs-perms.txt
copy to meta/files/fs-perms-volatile-tmp.txt
index 61f0a6e26a..26247acda8 100644
--- a/meta/files/fs-perms.txt
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
index 61f0a6e26a..d2266c1b26 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -46,7 +46,6 @@ ${includedir}		0755	root	root	true	0644	root	root
 # Links
 ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -56,7 +55,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index dc1292ae55..8bcd91e699 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -31,7 +31,7 @@ UNPACKDIR = "${S}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 docdir:append = "/${P}"
-dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
+dirs1777 = "/tmp ${localstatedir}/${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-tmp.txt', 'volatile/', '', d)}tmp"
 dirs2775 = ""
 dirs555 = "/sys /proc"
 dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -55,7 +55,8 @@ dirs755-lsb = "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb = "/var/mail"
 
-volatiles = "${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-log.txt', 'log', '', d)} tmp"
+volatiles = "${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-log.txt', 'log', '', d)} \
+             ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-tmp.txt', 'tmp', '', d)}"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 0879b30623..98693fa66e 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -110,7 +110,7 @@ do_install () {
 		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
 	fi
-	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
+	if ! ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-tmp.txt', 'true', 'false', d)}; then
 		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
 	fi
 	install -m 0755    ${S}/dmesg.sh		${D}${sysconfdir}/init.d
diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
index 7f66c921ab..1485614c71 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -327,7 +327,7 @@ do_install() {
 
 	# if the user requests /tmp be on persistent storage (i.e. not volatile)
 	# then don't use a tmpfs for /tmp
-	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
+	if ! ${@bb.utils.contains('FILESYSTEM_PERMS_TABLES', 'files/fs-perms-volatile-tmp.txt', 'true', 'false', d)}; then
 		rm -f ${D}${rootlibexecdir}/systemd/system/tmp.mount
 		rm -f ${D}${rootlibexecdir}/systemd/system/local-fs.target.wants/tmp.mount
 	fi
-- 
2.25.1


