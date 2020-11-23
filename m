Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: GML9Opd/tf1UuuvofXJyns6pIEZpX+gS1qTp4vSD5mnzZv2Bp+Xs6kD7Rc3NNzbXLVLWCzxRGX
 d3vJW2rN6Qsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920768"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920768"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:32 -0800
IronPort-SDR: I7HC6qQHAbkb5vM8cJl73vucNgl5/tt8qVuFN68v45jeoyLvV50Bre956bGQNHJ0DKzrxsU09S
 pP9HIyIpAxGA==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475248"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/21] python3: fix CVE-2020-27619
Date: Mon, 23 Nov 2020 23:06:50 +0800
Message-Id: <0edf9f32929c462b9b53f0cdc7e5ecf816fbb7b3.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3/CVE-2020-27619.patch       | 71 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.5.bb |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
new file mode 100644
index 0000000000..5a225ab760
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
@@ -0,0 +1,71 @@
+From 6c6c256df3636ff6f6136820afaefa5a10a3ac33 Mon Sep 17 00:00:00 2001
+From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 6 Oct 2020 05:38:54 -0700
+Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
+ in the CJK codec tests (GH-22566) (GH-22577)
+
+(cherry picked from commit 2ef5caa58febc8968e670e39e3d37cf8eef3cab8)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/6c6c256df3636ff6f6136820afaefa5a10a3ac33]
+CVE: CVE-2020-27619
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ Lib/test/multibytecodec_support.py            | 22 +++++++------------
+ .../2020-10-05-17-43-46.bpo-41944.rf1dYb.rst  |  1 +
+ 2 files changed, 9 insertions(+), 14 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+
+diff --git a/Lib/test/multibytecodec_support.py b/Lib/test/multibytecodec_support.py
+index cca8af67d6d1d..f76c0153f5ecf 100644
+--- a/Lib/test/multibytecodec_support.py
++++ b/Lib/test/multibytecodec_support.py
+@@ -305,29 +305,23 @@ def test_mapping_file(self):
+             self._test_mapping_file_plain()
+ 
+     def _test_mapping_file_plain(self):
+-        unichrs = lambda s: ''.join(map(chr, map(eval, s.split('+'))))
++        def unichrs(s):
++            return ''.join(chr(int(x, 16)) for x in s.split('+'))
++
+         urt_wa = {}
+ 
+         with self.open_mapping_file() as f:
+             for line in f:
+                 if not line:
+                     break
+-                data = line.split('#')[0].strip().split()
++                data = line.split('#')[0].split()
+                 if len(data) != 2:
+                     continue
+ 
+-                csetval = eval(data[0])
+-                if csetval <= 0x7F:
+-                    csetch = bytes([csetval & 0xff])
+-                elif csetval >= 0x1000000:
+-                    csetch = bytes([(csetval >> 24), ((csetval >> 16) & 0xff),
+-                                    ((csetval >> 8) & 0xff), (csetval & 0xff)])
+-                elif csetval >= 0x10000:
+-                    csetch = bytes([(csetval >> 16), ((csetval >> 8) & 0xff),
+-                                    (csetval & 0xff)])
+-                elif csetval >= 0x100:
+-                    csetch = bytes([(csetval >> 8), (csetval & 0xff)])
+-                else:
++                if data[0][:2] != '0x':
++                    self.fail(f"Invalid line: {line!r}")
++                csetch = bytes.fromhex(data[0][2:])
++                if len(csetch) == 1 and 0x80 <= csetch[0]:
+                     continue
+ 
+                 unich = unichrs(data[1])
+diff --git a/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+new file mode 100644
+index 0000000000000..4f9782f1c85af
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+@@ -0,0 +1 @@
++Tests for CJK codecs no longer call ``eval()`` on content received via HTTP.
diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
index 2a3c52a116..3720b364bb 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           file://CVE-2020-27619.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.28.0

