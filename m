Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id DB60C7970D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 13:42:42 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w9ADghhT014386
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:42:43 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.93])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w9ADghxl030112;
	Wed, 10 Oct 2018 15:42:43 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id EC8EF9550DC;
	Wed, 10 Oct 2018 15:42:41 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 15:40:14 +0200
Message-Id: <20181010134014.21506-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libarchive: fix bug1066
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
X-List-Received-Date: Wed, 10 Oct 2018 13:42:43 -0000

Fix out of bounds read on empty string filename for guntar, pax and v7tar

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libarchive/libarchive/bug1066.patch            | 54 ++++++++++++++++++++++
 .../libarchive/libarchive_3.3.3.bb                 |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/bug1066.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/bug1066.patch b/meta/recipes-extended/libarchive/libarchive/bug1066.patch
new file mode 100644
index 0000000000..0a662b57b4
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/bug1066.patch
@@ -0,0 +1,54 @@
+libarchive-3.3.3: Fix bug1066
+
+[No upstream tracking] -- https://github.com/libarchive/libarchive/pull/1066
+
+archive_write_set_format_*.c: fix out of bounds read on empty string () filename
+for guntar, pax and v7tar
+
+There is an out of bounds read flaw in the archive_write_gnutar_header,
+archive_write_pax_header and archive_write_v7tar_header functions which
+could leds to cause a denial of service.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c246ec5d058a3f70a2d3fb765f92fe9db77b25df]
+Bug: 1066
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/libarchive/archive_write_set_format_gnutar.c b/libarchive/archive_write_set_format_gnutar.c
+index 2d858c9..1966c53 100644
+--- a/libarchive/archive_write_set_format_gnutar.c
++++ b/libarchive/archive_write_set_format_gnutar.c
+@@ -339,7 +339,7 @@ archive_write_gnutar_header(struct archive_write *a,
+ 		 * case getting WCS failed. On POSIX, this is a
+ 		 * normal operation.
+ 		 */
+-		if (p != NULL && p[strlen(p) - 1] != '/') {
++		if (p != NULL && p[0] != '\0' && p[strlen(p) - 1] != '/') {
+ 			struct archive_string as;
+ 
+ 			archive_string_init(&as);
+diff --git a/libarchive/archive_write_set_format_pax.c b/libarchive/archive_write_set_format_pax.c
+index 6a301ac..4cfa8ff 100644
+--- a/libarchive/archive_write_set_format_pax.c
++++ b/libarchive/archive_write_set_format_pax.c
+@@ -660,7 +660,7 @@ archive_write_pax_header(struct archive_write *a,
+ 			 * case getting WCS failed. On POSIX, this is a
+ 			 * normal operation.
+ 			 */
+-			if (p != NULL && p[strlen(p) - 1] != '/') {
++			if (p != NULL && p[0] != '\0' && p[strlen(p) - 1] != '/') {
+ 				struct archive_string as;
+ 
+ 				archive_string_init(&as);
+diff --git a/libarchive/archive_write_set_format_v7tar.c b/libarchive/archive_write_set_format_v7tar.c
+index 62b1522..53c0db0 100644
+--- a/libarchive/archive_write_set_format_v7tar.c
++++ b/libarchive/archive_write_set_format_v7tar.c
+@@ -284,7 +284,7 @@ archive_write_v7tar_header(struct archive_write *a, struct archive_entry *entry)
+ 		 * case getting WCS failed. On POSIX, this is a
+ 		 * normal operation.
+ 		 */
+-		if (p != NULL && p[strlen(p) - 1] != '/') {
++		if (p != NULL && p[0] != '\0' && p[strlen(p) - 1] != '/') {
+ 			struct archive_string as;
+ 
+ 			archive_string_init(&as);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
index eabab16770..46a3d43762 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
@@ -33,6 +33,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://non-recursive-extract-and-list.patch \
+           file://bug1066.patch \
 "
 
 SRC_URI[md5sum] = "4038e366ca5b659dae3efcc744e72120"
-- 
2.11.0


