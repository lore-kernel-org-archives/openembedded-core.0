Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8F4B7E73D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:45:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5KHj6WQ013551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:45:16 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 20 Jun 2019 10:44:55 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 10:44:55 -0700
Message-ID: <20190620174455.155106-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [v2][PATCH 1/1] glib-2.0: Fix CVE-2019-12450
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
X-List-Received-Date: Thu, 20 Jun 2019 17:45:27 -0000
Content-Type: text/plain

Unchanged patch from glib.git which was added after current release.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-12450.patch         | 62 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
new file mode 100644
index 0000000..59e4919
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
@@ -0,0 +1,62 @@
+glib-2.0: fix CVE-2019-12450
+
+Not in release 2.61.1.
+
+CVE: CVE-2019-12450
+
+Upstream-Status: Backport [github.com/GNOME/glib.git]
+Signed-off-by: Joe Slater <joe.slater@windrivere.com>
+---
+From d8f8f4d637ce43f8699ba94c9b7648beda0ca174 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:41:53 +0200
+Subject: [PATCH] gfile: Limit access to files when copying
+
+file_copy_fallback creates new files with default permissions and
+set the correct permissions after the operation is finished. This
+might cause that the files can be accessible by more users during
+the operation than expected. Use G_FILE_CREATE_PRIVATE for the new
+files to limit access to those files.
+---
+ gio/gfile.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/gio/gfile.c b/gio/gfile.c
+index 24b136d80..74b58047c 100644
+--- a/gio/gfile.c
++++ b/gio/gfile.c
+@@ -3284,12 +3284,12 @@ file_copy_fallback (GFile                  *source,
+         out = (GOutputStream*)_g_local_file_output_stream_replace (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+                                                                    FALSE, NULL,
+                                                                    flags & G_FILE_COPY_BACKUP,
+-                                                                   G_FILE_CREATE_REPLACE_DESTINATION,
+-                                                                   info,
++                                                                   G_FILE_CREATE_REPLACE_DESTINATION |
++                                                                   G_FILE_CREATE_PRIVATE, info,
+                                                                    cancellable, error);
+       else
+         out = (GOutputStream*)_g_local_file_output_stream_create (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+-                                                                  FALSE, 0, info,
++                                                                  FALSE, G_FILE_CREATE_PRIVATE, info,
+                                                                   cancellable, error);
+     }
+   else if (flags & G_FILE_COPY_OVERWRITE)
+@@ -3297,12 +3297,13 @@ file_copy_fallback (GFile                  *source,
+       out = (GOutputStream *)g_file_replace (destination,
+                                              NULL,
+                                              flags & G_FILE_COPY_BACKUP,
+-                                             G_FILE_CREATE_REPLACE_DESTINATION,
++                                             G_FILE_CREATE_REPLACE_DESTINATION |
++                                             G_FILE_CREATE_PRIVATE,
+                                              cancellable, error);
+     }
+   else
+     {
+-      out = (GOutputStream *)g_file_create (destination, 0, cancellable, error);
++      out = (GOutputStream *)g_file_create (destination, G_FILE_CREATE_PRIVATE, cancellable, error);
+     }
+ 
+   if (!out)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
index bb77294..5942241 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
+           file://CVE-2019-12450.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.7.4


