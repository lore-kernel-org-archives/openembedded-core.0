Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD79719B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 06:31:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9C6VXJs003498
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 23:31:33 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 23:31:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 23:31:28 -0700
Message-ID: <52a517a51e3be6dc15d067fc5c5ba430155a08ac.1476253865.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476253865.git.liezhi.yang@windriver.com>
References: <cover.1476253865.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libxcb: use python3 to build it
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
X-List-Received-Date: Wed, 12 Oct 2016 06:31:32 -0000
Content-Type: text/plain

Backport Fix-inconsistent-use-of-tabs-vs.-space.patch to make it can be
built by python3.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../Fix-inconsistent-use-of-tabs-vs.-space.patch   | 62 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxcb_1.12.bb      |  3 ++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch b/meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
new file mode 100644
index 0000000..8992386
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
@@ -0,0 +1,62 @@
+From 8740a288ca468433141341347aa115b9544891d3 Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <wiz@NetBSD.org>
+Date: Thu, 19 May 2016 17:31:18 +0200
+Subject: [PATCH] Fix inconsistent use of tabs vs. space.
+
+Needed for at least python-3.5.x.
+
+Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
+Signed-off-by: Uli Schlachter <psychon@znc.in>
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/c_client.py | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/c_client.py b/src/c_client.py
+index 57de3fb..043338d 100644
+--- a/src/c_client.py
++++ b/src/c_client.py
+@@ -1364,7 +1364,7 @@ def _c_serialize(context, self):
+             _c('    unsigned int xcb_align_to = 0;')
+         if self.is_switch:
+             _c('    unsigned int xcb_padding_offset = %d;',
+-	       self.get_align_offset() )
++               self.get_align_offset() )
+         prefix = [('_aux', '->', self)]
+         aux_ptr = 'xcb_out'
+ 
+@@ -1390,7 +1390,7 @@ def _c_serialize(context, self):
+         _c('    unsigned int xcb_align_to = 0;')
+         if self.is_switch:
+             _c('    unsigned int xcb_padding_offset = %d;',
+-	       self.get_align_offset() )
++               self.get_align_offset() )
+ 
+     elif 'sizeof' == context:
+         param_names = [p[2] for p in params]
+@@ -1930,14 +1930,14 @@ def _c_accessors_list(self, field):
+                     # from the request size and divide that by the member size
+                     return '(((R->length * 4) - sizeof('+ self.c_type + '))/'+'sizeof('+field.type.member.c_wiretype+'))'
+                 else:
+-		    # use the accessor to get the start of the list, then
+-		    # compute the length of it by subtracting it from
++                    # use the accessor to get the start of the list, then
++                    # compute the length of it by subtracting it from
+                     # the adress of the first byte after the end of the
+                     # request
+-		    after_end_of_request = '(((char*)R) + R->length * 4)'
+-		    start_of_list = '%s(R)' % (field.c_accessor_name)
++                    after_end_of_request = '(((char*)R) + R->length * 4)'
++                    start_of_list = '%s(R)' % (field.c_accessor_name)
+                     bytesize_of_list = '%s - (char*)(%s)' % (after_end_of_request, start_of_list)
+-		    return '(%s) / sizeof(%s)' % (bytesize_of_list, field.type.member.c_wiretype)
++                    return '(%s) / sizeof(%s)' % (bytesize_of_list, field.type.member.c_wiretype)
+             else:
+                 raise Exception(
+                     "lengthless lists with varsized members are not supported. Fieldname '%s'"
+-- 
+2.9.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
index 62b8bab..a38bdea 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://xcbincludedir.patch \
            file://disable-check.patch \
            file://gcc-mips-pr68302-mips-workaround.patch \
+           file://Fix-inconsistent-use-of-tabs-vs.-space.patch \
           "
 SRC_URI[md5sum] = "28e552bd78bc1050b6b26ca1db0e5bb6"
 SRC_URI[sha256sum] = "4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b"
@@ -31,6 +32,8 @@ inherit autotools pkgconfig distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native = ""
 
+export PYTHON = "python3"
+
 python populate_packages_prepend () {
     do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
 }
-- 
2.9.0


