Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.7573.1605783639732055690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 03:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: cAMgQ4r08uadxImObLTH8bA0pH04IWuyPLU726SRG+M5K9944dEKidYNXQ6aZTIgDOOxssAsID
 rQKn2GFHfHvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="167760003"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="167760003"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 03:00:39 -0800
IronPort-SDR: Ohu5WmxY/9R6DL8QtZODZ1ui0j+WTK9b17/7snG3CMMNMTRCK/FIjjvfYeFOvhxNchIt5I3WC5
 LvEhnGL5zbMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="368726368"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2020 03:00:38 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 4/5] python3: fix CVE-2020-27619
Date: Thu, 19 Nov 2020 19:00:34 +0800
Message-Id: <20201119110035.70647-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119110035.70647-1-chee.yang.lee@intel.com>
References: <20201119110035.70647-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/python3/CVE-2020-27619.patch       | 70 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
new file mode 100644
index 0000000000..bafa1cb999
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
@@ -0,0 +1,70 @@
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
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 506b60a547..edc23bf11e 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
+           file://CVE-2020-27619.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

