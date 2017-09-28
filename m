Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA9660721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 08:06:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8S86oBE001644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 01:06:50 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 28 Sep 2017 01:06:49 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Sep 2017 16:06:05 +0800
Message-ID: <1506585965-244456-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libarchive: CVE-2017-14502
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
X-List-Received-Date: Thu, 28 Sep 2017 08:06:49 -0000
Content-Type: text/plain

read_header in archive_read_support_format_rar.c suffers from an
off-by-one error for UTF-16 names in RAR archives, leading to an
out-of-bounds read in archive_read_format_rar_read_header.
Backport the patch from
https://github.com/libarchive/libarchive/commit
commit 5562545b5562f6d12a4ef991fae158bf4ccf92b6

CVE: CVE-2017-14502

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../libarchive/libarchive/CVE-2017-14502.patch     | 37 ++++++++++++++++++++++
 .../libarchive/libarchive_3.3.2.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
new file mode 100644
index 0000000..72e1546
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
@@ -0,0 +1,37 @@
+From 5562545b5562f6d12a4ef991fae158bf4ccf92b6 Mon Sep 17 00:00:00 2001
+From: Joerg Sonnenberger <joerg@bec.de>
+Date: Sat, 9 Sep 2017 17:47:32 +0200
+Subject: [PATCH] Avoid a read off-by-one error for UTF16 names in RAR
+ archives.
+
+Reported-By: OSS-Fuzz issue 573
+
+CVE: CVE-2017-14502
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ libarchive/archive_read_support_format_rar.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index cbb14c3..751de69 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -1496,7 +1496,11 @@ read_header(struct archive_read *a, struct archive_entry *entry,
+         return (ARCHIVE_FATAL);
+       }
+       filename[filename_size++] = '\0';
+-      filename[filename_size++] = '\0';
++      /*
++       * Do not increment filename_size here as the computations below
++       * add the space for the terminating NUL explicitly.
++       */
++      filename[filename_size] = '\0';
+ 
+       /* Decoded unicode form is UTF-16BE, so we have to update a string
+        * conversion object for it. */
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 9e4588f..edc4d6a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -34,6 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://bug929.patch \
            file://CVE-2017-14166.patch \
+           file://CVE-2017-14502.patch \
           "
 
 SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"
-- 
1.9.1


