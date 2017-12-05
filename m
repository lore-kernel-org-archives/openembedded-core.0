Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 21ECA7828D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 07:58:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB57wbXB019360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 23:58:38 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 23:58:37 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Dec 2017 15:56:44 +0800
Message-ID: <20171205075644.16232-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: fix for non-utf8 encoded files
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
X-List-Received-Date: Tue, 05 Dec 2017 07:58:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Some source files aren't valid utf-8 containing for example
iso8859-1 accented characters in author's names.
Replace invalid data with a replacement '?' character and
print a warning to keep things working.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../glib-mkenums-replace-and-warn-decoding.patch   | 104 +++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb      |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch
new file mode 100644
index 00000000000..a5dae7e9f46
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-mkenums-replace-and-warn-decoding.patch
@@ -0,0 +1,104 @@
+From ba043ef4f2c713662f89425aed70dfd78e3955ee Mon Sep 17 00:00:00 2001
+From: Patrick Welche <prlw1@cam.ac.uk>
+Date: Mon, 23 Oct 2017 13:59:58 +0100
+Subject: [PATCH] glib-mkenums: best effort attempt on non-utf8 encoded files.
+
+Some source files aren't valid utf-8 containing for example
+iso8859-1 accented characters in author's names.
+Replace invalid data with a replacement '?' character and print a
+warning to keep things working.
+Based on a patch from Christoph Reiter in
+https://bugzilla.gnome.org/show_bug.cgi?id=785113#c20
+
+Upstream-Status: Submitted [https://bug785113.bugzilla-attachments.gnome.org/attachment.cgi?id=362098]
+
+Author: Patrick Welche <prlw1@cam.ac.uk>
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ gobject/glib-mkenums.in | 41 ++++++++++++++++++++++++++++++-----------
+ 1 file changed, 30 insertions(+), 11 deletions(-)
+
+diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
+index 7cc55053c..9790a65a2 100755
+--- a/gobject/glib-mkenums.in
++++ b/gobject/glib-mkenums.in
+@@ -26,14 +26,6 @@ the GNU General Public License which can be found in the
+ GLib source package. Sources, examples and contact
+ information are available at http://www.gtk.org'''
+ 
+-# Python 2 defaults to ASCII in case stdout is redirected.
+-# This should make it match Python 3, which uses the locale encoding.
+-if sys.stdout.encoding is None:
+-    output_stream = codecs.getwriter(
+-        locale.getpreferredencoding())(sys.stdout)
+-else:
+-    output_stream = sys.stdout
+-
+ # pylint: disable=too-few-public-methods
+ class Color:
+     '''ANSI Terminal colors'''
+@@ -81,6 +73,31 @@ def write_output(output):
+     global output_stream
+     print(output, file=output_stream)
+ 
++
++# Python 2 defaults to ASCII in case stdout is redirected.
++# This should make it match Python 3, which uses the locale encoding.
++if sys.stdout.encoding is None:
++    output_stream = codecs.getwriter(
++        locale.getpreferredencoding())(sys.stdout)
++else:
++    output_stream = sys.stdout
++
++
++# Some source files aren't utf-8 and the old perl version didn't care.
++# Replace invalid data with a replacement character to keep things working.
++# https://bugzilla.gnome.org/show_bug.cgi?id=785113#c20
++decoding_errors = "replace_and_warn"
++
++def replace_and_warn(err):
++    # 7 characters of context either side of the offending character
++    print_warning('UnicodeWarning: {} at {} ({})'.format(
++        err.reason, err.start,
++        err.object[err.start - 7:err.end + 7]))
++    return ('?', err.end)
++
++codecs.register_error('replace_and_warn', replace_and_warn)
++
++
+ # glib-mkenums.py
+ # Information about the current enumeration
+ flags = None # Is enumeration a bitmask?
+@@ -157,7 +174,8 @@ def parse_entries(file, file_name):
+         m = re.match(r'\#include\s*<([^>]*)>', line)
+         if m:
+             newfilename = os.path.join("..", m.group(1))
+-            newfile = io.open(newfilename, encoding="utf-8")
++            newfile = io.open(newfilename, encoding="utf-8",
++                              errors=decoding_errors)
+ 
+             if not parse_entries(newfile, newfilename):
+                 return False
+@@ -253,7 +271,7 @@ def read_template_file(file):
+            }
+     in_ = 'junk'
+ 
+-    ifile = io.open(file, encoding="utf-8")
++    ifile = io.open(file, encoding="utf-8", errors=decoding_errors)
+     for line in ifile:
+         m = re.match(r'\/\*\*\*\s+(BEGIN|END)\s+([\w-]+)\s+\*\*\*\/', line)
+         if m:
+@@ -408,7 +426,8 @@ def process_file(curfilename):
+     firstenum = True
+ 
+     try:
+-        curfile = io.open(curfilename, encoding="utf-8")
++        curfile = io.open(curfilename, encoding="utf-8",
++                          errors=decoding_errors)
+     except IOError as e:
+         if e.errno == errno.ENOENT:
+             print_warning('No file "{}" found.'.format(curfilename))
+-- 
+2.14.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
index 60ce1b5f7fb..963f6b471df 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
+           file://glib-mkenums-replace-and-warn-decoding.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.13.0


