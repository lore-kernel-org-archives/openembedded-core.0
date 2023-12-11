Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503D4C10F07
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 00:58:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.97617.1702256299302335973
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 16:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=suOGnNcg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0jw7a002081
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=iyVtMYaGjCL6AiTy5VcAS+zb7ourZjMIVijhhK6u9ao=; b=
	suOGnNcgcpftw+QWvFq4CmU2PYSEBLbCMZtWHzRzflYfe6FeUffTPb1JpwWyaDJL
	LnE4sKu+06nMgKyKt8iwfBxumkysx5tlmb9hPiW+NGdBxsQmU3KRFaWxYeJZnwHy
	nJillFVbqvrH2VaR2NvWWZv25iQn09XsAMERencGPxLwwEPxLq5LXIuT8g+Rna7v
	vowYGZpn4qnebs77kxZwNMEuc/3FTWXSp/IZSX2d7gWAE3lHeyHlSEeW/RRRXaZG
	szDCn1f7RuXrt5o80x9iTa0XExjKmkf1xHD8wPDgx8nOjEbTLrfznE6c295xqwnn
	4P8oaoE32ocEDnVerASp6g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvrmkrvw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:18 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:58:22 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:58:22 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] bitbake.conf: set correct FILESYSTEM_PERMS_TABLES
Date: Mon, 11 Dec 2023 08:58:11 +0800
Message-ID: <20231211005815.1119314-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211005815.1119314-1-changqing.li@windriver.com>
References: <20231211005815.1119314-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yrnpdsLD2Mr3aBe3ZVbgs0S0HTaIH_iL
X-Proofpoint-ORIG-GUID: yrnpdsLD2Mr3aBe3ZVbgs0S0HTaIH_iL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=958 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192131

From: Changqing Li <changqing.li@windriver.com>

* Update fs-perms.txt as an common fs-perms file
* Remove fs-perms-persistent-log.txt
* Add fs-perms-volatile-log.txt and fs-perms-volatile-tmp.txt
  to be used when VOLATILE_LOG_DIR/VOLATILE_TMP_DIR set to yes

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf                        |  5 ++-
 ...fs-perms.txt => fs-perms-volatile-log.txt} | 32 -------------------
 ...tent-log.txt => fs-perms-volatile-tmp.txt} | 27 ----------------
 meta/files/fs-perms.txt                       |  3 --
 4 files changed, 4 insertions(+), 63 deletions(-)
 copy meta/files/{fs-perms.txt => fs-perms-volatile-log.txt} (53%)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-volatile-tmp.txt} (59%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7826e7af9..2a8dd2f972 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -384,7 +384,10 @@ FILESEXTRAPATHS ?= "__default:"
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
 #  oldincludedir
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
-- 
2.25.1


