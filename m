Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6276E768
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 13:31:48 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so3172597wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 05:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=J26kLGG4JCBIGsGYz2HvSTDNCF3bOtBSOMGKQJQxOF0=;
	b=TrM0YAtOqivmmFD4Lvlqq+wwmXGHwIWdWsJ0UDryQhW6jbbwjrcPev0BoFLVA87A2s
	Z+Th6QNPyhNsrtMBEx4QxuREZlxBBOt01qlnWOnB6msDkJntAokVVVzl9HfqX4H+GXdT
	hB+3f7GhHCWaRplHupcns0ALKj7aUVTTbY2pi1stiDID5kUHkQ2inuygQaVP6PmckC75
	L5JYTarcMTiJ0vMlU9MTLvc1MUglrbS1dQmCE0bPnQLZMA1keefb/pKedBLQuZxlvkqp
	IYwGucxFJtJfYtweZjW6ogw+wlAzDpiuR31psbDOEFG7A7v2WtRCIeysbywkgZOfOFb2
	wilQ==
X-Gm-Message-State: ALoCoQkdXe4Th3476dZoilp06SxH8rkc4qeDQ7SCZpstBjntmwL3padp5sNzdmVbAggyw+3qiJ09
X-Received: by 10.180.76.103 with SMTP id j7mr7927626wiw.58.1389879106766;
	Thu, 16 Jan 2014 05:31:46 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ux5sm6220322wjc.6.2014.01.16.05.31.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 05:31:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 13:31:39 +0000
Message-Id: <1389879099-27498-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389879099-27498-1-git-send-email-ross.burton@intel.com>
References: <1389879099-27498-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] glib-2.0: fix mapped file ptest
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
X-List-Received-Date: Thu, 16 Jan 2014 13:31:48 -0000

The mappedfile ptest was attempting to write into directories that may not exist
on a non-Sato image.  Instead, write into TMPDIR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/ptest-paths.patch            |   30 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb      |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch b/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
new file mode 100644
index 0000000..f3be027
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/ptest-paths.patch
@@ -0,0 +1,30 @@
+Instead of writing the temporary mapping files in the mappedfile test to the
+user runtime directory, write them to $TMP.  The runtime directory may not
+currently exist if the test is executed on a non-desktop system and the test
+doesn't attempt to create the directory structure.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/glib/tests/mappedfile.c b/glib/tests/mappedfile.c
+index 40e0e60..27a24be 100644
+--- a/glib/tests/mappedfile.c
++++ b/glib/tests/mappedfile.c
+@@ -81,7 +81,7 @@ test_writable (void)
+   const gchar *new = "abcdefghijklmnopqrstuvxyz";
+   gchar *tmp_copy_path;
+ 
+-  tmp_copy_path = g_build_filename (g_get_user_runtime_dir (), "glib-test-4096-random-bytes", NULL);
++  tmp_copy_path = g_build_filename (g_get_tmp_dir (), "glib-test-4096-random-bytes", NULL);
+ 
+   g_file_get_contents (g_test_get_filename (G_TEST_DIST, "4096-random-bytes", NULL), &contents, &len, &error);
+   g_assert_no_error (error);
+@@ -125,7 +125,7 @@ test_writable_fd (void)
+   int fd;
+   gchar *tmp_copy_path;
+ 
+-  tmp_copy_path = g_build_filename (g_get_user_runtime_dir (), "glib-test-4096-random-bytes", NULL);
++  tmp_copy_path = g_build_filename (g_get_tmp_dir (), "glib-test-4096-random-bytes", NULL);
+ 
+   g_file_get_contents (g_test_get_filename (G_TEST_DIST, "4096-random-bytes", NULL), &contents, &len, &error);
+   g_assert_no_error (error);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index a5bfc70..9745a9e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://run-ptest \
            file://0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch \
            file://ptest-dbus.patch \
+           file://ptest-paths.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.7.10.4


