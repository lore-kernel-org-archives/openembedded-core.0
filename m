Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A53A9601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 11:10:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9LBAvsR007153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 04:10:58 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 21 Oct 2014 04:10:57 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 19:10:54 +0800
Message-ID: <1413889854-10346-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] rpm: realpath is required before expanding _dbpath in chroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Oct 2014 11:11:01 -0000
Content-Type: text/plain

A regression is introduced by commit 66573093:
[ rpm: Fix rpm relocation macro usage ]

_usr turned out to be a relative path to support dyanmic config after
that, but it's being used somewhere as a indicator to locate substrings,
so we must get the real path of it in advance.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-realpath.patch | 24 ++++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb         |  1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb          |  1 +
 3 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-realpath.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-realpath.patch b/meta/recipes-devtools/rpm/rpm/rpm-realpath.patch
new file mode 100644
index 0000000..d2d9b09
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-realpath.patch
@@ -0,0 +1,24 @@
+chroot: realpath is required before expanding _dbpath
+
+_usr turned out to be a relative path to support dyanmic config, but it's
+being used somewhere as a indicator to locate substrings, so we must get
+the real path of it in advance.
+
+Upstream-Status: Inapproriate (OpenEmbedded specific)
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+
+diff -urpN a/rpmio/rpmrpc.c b/rpmio/rpmrpc.c
+--- a/rpmio/rpmrpc.c
++++ b/rpmio/rpmrpc.c
+@@ -257,7 +257,9 @@ int Open(const char * path, int flags, m
+     /* XXX if the open(2) fails, try to strip a possible chroot(2) prefix. */
+     if (fdno < 0 && errno == ENOENT) {
+ 	const char *dbpath = rpmExpand("%{?_dbpath}/", NULL);
+-	const char * fn = strstr(path + 1, dbpath);
++	char resolved_dbpath[PATH_MAX];
++	realpath(dbpath, resolved_dbpath);
++	const char * fn = strstr(path + 1, resolved_dbpath);
+ 	if (fn)
+ 	    fdno = open(fn, flags, mode);
+ 	dbpath = _free(dbpath);
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index d2dec5f..a85e28f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -109,6 +109,7 @@ SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
 	   file://rpm-db5-or-db6.patch \
 	   file://rpm-rpmpgp-fix.patch \
 	   file://rpm-disable-Wno-override-init.patch \
+	   file://rpm-realpath.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index fb8a507..6cd932d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -93,6 +93,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-db5-or-db6.patch \
 	   file://rpm-disable-Wno-override-init.patch \
 	   file://rpmqv_cc_b_gone.patch \
+	   file://rpm-realpath.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.8.4.1


