Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D097C78678
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:41:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2018 07:41:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,539,1511856000"; d="scan'208";a="31430829"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 20 Feb 2018 07:41:23 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 61B10580578
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 07:41:22 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 17:44:01 +0200
Message-Id: <1519141444-25953-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] glib-2.0: upgrade to version 2.54.3
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
X-List-Received-Date: Tue, 20 Feb 2018 15:41:23 -0000

2.54.2 -> 2.54.3

Remove upstreamed patch:
        1. glib-mkenums-replace-and-warn-decoding.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../glib-mkenums-replace-and-warn-decoding.patch   | 104 ---------------------
 .../{glib-2.0_2.54.2.bb => glib-2.0_2.54.3.bb}     |   5 +-
 2 files changed, 2 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.54.2.bb => glib-2.0_2.54.3.bb} (81%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch
deleted file mode 100644
index a5dae7e..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From ba043ef4f2c713662f89425aed70dfd78e3955ee Mon Sep 17 00:00:00 2001
-From: Patrick Welche <prlw1@cam.ac.uk>
-Date: Mon, 23 Oct 2017 13:59:58 +0100
-Subject: [PATCH] glib-mkenums: best effort attempt on non-utf8 encoded files.
-
-Some source files aren't valid utf-8 containing for example
-iso8859-1 accented characters in author's names.
-Replace invalid data with a replacement '?' character and print a
-warning to keep things working.
-Based on a patch from Christoph Reiter in
-https://bugzilla.gnome.org/show_bug.cgi?id=785113#c20
-
-Upstream-Status: Submitted [https://bug785113.bugzilla-attachments.gnome.org/attachment.cgi?id=362098]
-
-Author: Patrick Welche <prlw1@cam.ac.uk>
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- gobject/glib-mkenums.in | 41 ++++++++++++++++++++++++++++++-----------
- 1 file changed, 30 insertions(+), 11 deletions(-)
-
-diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 7cc55053c..9790a65a2 100755
---- a/gobject/glib-mkenums.in
-+++ b/gobject/glib-mkenums.in
-@@ -26,14 +26,6 @@ the GNU General Public License which can be found in the
- GLib source package. Sources, examples and contact
- information are available at http://www.gtk.org'''
- 
--# Python 2 defaults to ASCII in case stdout is redirected.
--# This should make it match Python 3, which uses the locale encoding.
--if sys.stdout.encoding is None:
--    output_stream = codecs.getwriter(
--        locale.getpreferredencoding())(sys.stdout)
--else:
--    output_stream = sys.stdout
--
- # pylint: disable=too-few-public-methods
- class Color:
-     '''ANSI Terminal colors'''
-@@ -81,6 +73,31 @@ def write_output(output):
-     global output_stream
-     print(output, file=output_stream)
- 
-+
-+# Python 2 defaults to ASCII in case stdout is redirected.
-+# This should make it match Python 3, which uses the locale encoding.
-+if sys.stdout.encoding is None:
-+    output_stream = codecs.getwriter(
-+        locale.getpreferredencoding())(sys.stdout)
-+else:
-+    output_stream = sys.stdout
-+
-+
-+# Some source files aren't utf-8 and the old perl version didn't care.
-+# Replace invalid data with a replacement character to keep things working.
-+# https://bugzilla.gnome.org/show_bug.cgi?id=785113#c20
-+decoding_errors = "replace_and_warn"
-+
-+def replace_and_warn(err):
-+    # 7 characters of context either side of the offending character
-+    print_warning('UnicodeWarning: {} at {} ({})'.format(
-+        err.reason, err.start,
-+        err.object[err.start - 7:err.end + 7]))
-+    return ('?', err.end)
-+
-+codecs.register_error('replace_and_warn', replace_and_warn)
-+
-+
- # glib-mkenums.py
- # Information about the current enumeration
- flags = None # Is enumeration a bitmask?
-@@ -157,7 +174,8 @@ def parse_entries(file, file_name):
-         m = re.match(r'\#include\s*<([^>]*)>', line)
-         if m:
-             newfilename = os.path.join("..", m.group(1))
--            newfile = io.open(newfilename, encoding="utf-8")
-+            newfile = io.open(newfilename, encoding="utf-8",
-+                              errors=decoding_errors)
- 
-             if not parse_entries(newfile, newfilename):
-                 return False
-@@ -253,7 +271,7 @@ def read_template_file(file):
-            }
-     in_ = 'junk'
- 
--    ifile = io.open(file, encoding="utf-8")
-+    ifile = io.open(file, encoding="utf-8", errors=decoding_errors)
-     for line in ifile:
-         m = re.match(r'\/\*\*\*\s+(BEGIN|END)\s+([\w-]+)\s+\*\*\*\/', line)
-         if m:
-@@ -408,7 +426,8 @@ def process_file(curfilename):
-     firstenum = True
- 
-     try:
--        curfile = io.open(curfilename, encoding="utf-8")
-+        curfile = io.open(curfilename, encoding="utf-8",
-+                          errors=decoding_errors)
-     except IOError as e:
-         if e.errno == errno.ENOENT:
-             print_warning('No file "{}" found.'.format(curfilename))
--- 
-2.14.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
similarity index 81%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
index 963f6b4..faf5945 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.54.3.bb
@@ -16,10 +16,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
-           file://glib-mkenums-replace-and-warn-decoding.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "50f83e08f080f99b1e2f0ad2b760fb81"
-SRC_URI[sha256sum] = "bb89e5c5aad33169a8c7f28b45671c7899c12f74caf707737f784d7102758e6c"
+SRC_URI[md5sum] = "16e886ad677bf07b7d48eb8188bcf759"
+SRC_URI[sha256sum] = "963fdc6685dc3da8e5381dfb9f15ca4b5709b28be84d9d05a9bb8e446abac0a8"
-- 
2.4.0


