Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1URaAh-0006On-4r
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 05:33:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3F3G5nj006096
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 20:16:06 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sun, 14 Apr 2013 20:16:05 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <mark.hatle@windriver.com>
Date: Mon, 15 Apr 2013 11:17:55 +0800
Message-ID: <c36637e238a4d08d3f16cfa6039c783eb19327f6.1365995348.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1365995348.git.kai.kang@windriver.com>
References: <cover.1365995348.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] rpm: fix rpm2cpio segmentation fault
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
X-List-Received-Date: Mon, 15 Apr 2013 03:33:45 -0000
Content-Type: text/plain

When run rpm2cpio, it fails with segmentation fault. The root cause is
no macros "_db_path" and "_dbi_config*" defined, when query these macros
get nothing then cause segment fault.

Add patch to parse macro files first to fix this problem.

[YOCTO #3656]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../rpm/rpm/rpm2cpio-fix-segmentation-fault.patch  |   28 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
new file mode 100644
index 0000000..a99769a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+rpm2cpio fails on target with "Segmentation fault". Because macros
+"_dbpath" and "_dbi_config*" need to be defined, otherwise query these
+macros will cause segment fault.
+
+Parse config files first to fix this bug. If parse fails, give a warning.
+
+[YOCTO #3656]
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+--- rpm-5.4.9/tools/rpm2cpio.c.orig	2013-04-15 10:35:14.269398890 +0800
++++ rpm-5.4.9/tools/rpm2cpio.c	2013-04-15 10:44:12.777417885 +0800
+@@ -87,6 +87,13 @@
+ #endif
+ 	(void) rpmtsSetVSFlags(ts, vsflags);
+ 
++	/* If macros "_dbpath" and "_dbi_config*" are not defined,
++	 * sigment fault occurs */
++	rc = rpmReadConfigFiles(NULL, NULL);
++	if (rc) {
++		fprintf(stderr, _("Read RPM config files failed, that may cause sigment fault.\n"));
++	}
++
+ 	/*@-mustmod@*/      /* LCL: segfault */
+ 	rc = rpmReadPackageFile(ts, fdi, "rpm2cpio", &h);
+ 	/*@=mustmod@*/
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 7d2cba4..1defc78 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -86,6 +86,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-platform2.patch \
 	   file://rpm-remove-sykcparse-decl.patch \
 	   file://debugedit-segv.patch \
+	   file://rpm2cpio-fix-segmentation-fault.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.5.4



