Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TlGLX-0001Uc-Mq
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 10:53:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ9d8EQ024382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 01:39:08 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 19 Dec 2012 01:39:07 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:39:38 +0800
Message-ID: <ef4e19ad2852e4ef6ea4a30f3ab92737b85fa334.1355902677.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1355902677.git.kai.kang@windriver.com>
References: <cover.1355902677.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/4] base-passwd: use configurable root home directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 09:54:14 -0000
Content-Type: text/plain

Use configurable variable ROOT_HOME as root home directory.
Drop root-home.patch because it is not needed any more.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../base-passwd/base-passwd-3.5.26/root-home.patch |   16 ----------------
 .../recipes-core/base-passwd/base-passwd_3.5.26.bb |    4 ++--
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch
deleted file mode 100644
index eab77f1..0000000
--- a/meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-we use /home/root instead of /root
-
-Comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- base-passwd/passwd.master.orig	2005-07-08 06:26:22.000000000 +0200
-+++ base-passwd/passwd.master	2005-07-08 06:31:58.000000000 +0200
-@@ -1,4 +1,4 @@
--root::0:0:root:/root:/bin/sh
-+root::0:0:root:/home/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
index 3eae214..2b1dc1c 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
@@ -6,8 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
-           file://nobash.patch \
-           file://root-home.patch"
+           file://nobash.patch"
 
 SRC_URI[md5sum] = "74245e5c21dc74d9675c77cd8dfa02e6"
 SRC_URI[sha256sum] = "258a78317aa563143d10375c6e1e63a60898e503887f00fffd70b6b297c1b429"
@@ -25,6 +24,7 @@ do_install () {
 		${D}${mandir}/pl/man8/update-passwd.8
 	gzip -9 ${D}${mandir}/man8/* ${D}${mandir}/pl/man8/*
 	install -d -m 755 ${D}${datadir}/base-passwd
+	sed -i 's#:/root:#:${ROOT_HOME}:#' ${S}/passwd.master
 	install -o root -g root -p -m 644 ${S}/passwd.master ${D}${datadir}/base-passwd/
 	install -o root -g root -p -m 644 ${S}/group.master ${D}${datadir}/base-passwd/
 
-- 
1.7.5.4



