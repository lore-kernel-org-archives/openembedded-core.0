Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 976AF6B275
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 05:41:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6H5fZ2X024076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 22:41:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 22:41:35 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 13:41:44 +0800
Message-ID: <80a4efb0f4bdcaad20a50c37faf627a036488b24.1374038163.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374038163.git.Qi.Chen@windriver.com>
References: <cover.1374038163.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] tar: remove an erroneous patch
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
X-List-Received-Date: Wed, 17 Jul 2013 05:41:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This removed patch is a workaround for gcc-4.5 manifests buffer
overflow with app-arch/tar-1.{22,23}, according to the information
from https://bugs.gentoo.org/show_bug.cgi?id=317139.

The problem with that patch is that it's only setting the magic
field of the header while the original statement sets both the magic
and the version field of the header. Because of this, all tar balls
created by the tar package in OE will be treated as old V7 format
tar balls.

As a negative effect of this behaviour, the tar package in OE cannot
handle device files correctly. This in turn leads to the udev cache
failure in images like core-image-lsb-sdk.

[YOCTO #4815]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../tar-1.26/tar-1.26-fortifysourcessigabrt.patch  |   36 --------------------
 meta/recipes-extended/tar/tar_1.26.bb              |    1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch

diff --git a/meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch b/meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch
deleted file mode 100644
index 6aef096..0000000
--- a/meta/recipes-extended/tar/tar-1.26/tar-1.26-fortifysourcessigabrt.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-port fedora patch for fortify sources sigabort. See 
-https://qa.mandriva.com/show_bug.cgi?id=61419 for details.
-
-Upstream-Status: Pending
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
-
----
- src/create.c |    8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
---- tar-1.26.orig/src/create.c
-+++ tar-1.26/src/create.c
-@@ -562,8 +562,8 @@ write_gnu_long_link (struct tar_stat_inf
-   GNAME_TO_CHARS (tmpname, header->header.gname);
-   free (tmpname);
-
--  strcpy (header->buffer + offsetof (struct posix_header, magic),
--	  OLDGNU_MAGIC);
-+  strncpy (header->buffer + offsetof (struct posix_header, magic),
-+	  OLDGNU_MAGIC, sizeof(header->header.magic));
-   header->header.typeflag = type;
-   finish_header (st, header, -1);
-
-@@ -900,8 +900,8 @@ start_header (struct tar_stat_info *st)
-     case OLDGNU_FORMAT:
-     case GNU_FORMAT:   /*FIXME?*/
-       /* Overwrite header->header.magic and header.version in one blow.  */
--      strcpy (header->buffer + offsetof (struct posix_header, magic),
--	      OLDGNU_MAGIC);
-+      strncpy (header->buffer + offsetof (struct posix_header, magic),
-+	      OLDGNU_MAGIC, sizeof(header->header.magic));
-       break;
-
-     case POSIX_FORMAT:
diff --git a/meta/recipes-extended/tar/tar_1.26.bb b/meta/recipes-extended/tar/tar_1.26.bb
index d45c2b1..8b774e6 100644
--- a/meta/recipes-extended/tar/tar_1.26.bb
+++ b/meta/recipes-extended/tar/tar_1.26.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 PR = "r5"
 
 SRC_URI += "file://remove-gets.patch \
-           file://tar-1.26-fortifysourcessigabrt.patch\
            "
 
 SRC_URI[md5sum] = "2cee42a2ff4f1cd4f9298eeeb2264519"
-- 
1.7.9.5


