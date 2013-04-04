Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNnQt-0006JX-9W
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:54:40 +0200
Received: by mail-wg0-f45.google.com with SMTP id x12so2993499wgg.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 09:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=U21C/iSJzvQ1WEPQaeumy4lSUUeLwrXRWEznZP3bXMg=;
	b=YZfPagld0Hwbt6MwobkqKVTa2CG2BbXGUjGv8vrZXwbiVfCvWkPQnDvbNz30SOdk/C
	oYbozKIKHDYDe44bkah2CJMPAUD/vxUBeQJ2S1bN3RE6ZwIq7Nlck2wJ3kaY6gNYhabk
	q1fh0DFv/sX6NLWU5/2nL9WaJSLHQXDuAsiJi9G7Sh0y5OtJod5G1y6whwRnnAujM74p
	kPGPvj9oDXgGexDSqqPOt28tnjOM2/0jknn+yW03LIeM7Hmu0iFtDhH1E05k9U/7aoog
	lfS0r2P8V94Qxk+GZuizieqgKEQFgMqrnJWJ+XPf/Omr8/3jfYl4fowtYpO9pZ757Qp4
	Uv5g==
X-Received: by 10.194.81.40 with SMTP id w8mr10840161wjx.14.1365093446458;
	Thu, 04 Apr 2013 09:37:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ej8sm32135190wib.9.2013.04.04.09.37.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 09:37:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 17:34:39 +0100
Message-Id: <1365093279-12593-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnvY04wlcybkJ1pbFBbK63fK+u1/WQbHt+h2lvKDCgZxn+x4X5+11iq/clwEPNylXSUqMRv
Subject: [PATCH] utils: add helper to get all non-system packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 16:54:40 -0000

For example if PACKAGES is "foo foo-data foo-dev foo-doc", this will return
"foo-data".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/tests/test_utils.py |   27 +++++++++++++++++++++++++++
 meta/lib/oe/utils.py            |   16 ++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/lib/oe/tests/test_utils.py

diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oe/tests/test_utils.py
new file mode 100644
index 0000000..466c47e
--- /dev/null
+++ b/meta/lib/oe/tests/test_utils.py
@@ -0,0 +1,27 @@
+import unittest
+import bb, oe.utils
+
+class TestPackagesFilterOutSystem(unittest.TestCase):
+    def test_filter(self):
+        """
+        Test that oe.utils.packages_filter_out_system works.
+        """
+
+        d = bb.data_smart.DataSmart()
+        d.setVar("PN", "foo")
+
+        d.setVar("PACKAGES", "foo foo-doc foo-dev")
+        pkgs = oe.utils.packages_filter_out_system(d)
+        self.assertEqual(pkgs, [])
+
+        d.setVar("PACKAGES", "foo foo-doc foo-data foo-dev")
+        pkgs = oe.utils.packages_filter_out_system(d)
+        self.assertEqual(pkgs, ["foo-data"])
+
+        d.setVar("PACKAGES", "foo foo-locale-en-gb")
+        pkgs = oe.utils.packages_filter_out_system(d)
+        self.assertEqual(pkgs, [])
+
+        d.setVar("PACKAGES", "foo foo-data foo-locale-en-gb")
+        pkgs = oe.utils.packages_filter_out_system(d)
+        self.assertEqual(pkgs, ["foo-data"])
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index b269f32..acd3969 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -107,3 +107,19 @@ def features_backfill(var,d):
 
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
+
+
+def packages_filter_out_system(d):
+    """
+    Return a list of packages from PACKAGES with the "system" packages such as
+    PN-dbg PN-doc PN-locale-eb-gb removed.
+    """
+    pn = d.getVar('PN', True)
+    blacklist = map(lambda suffix: pn + suffix, ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev'))
+    localepkg = pn + "-locale-"
+    pkgs = []
+
+    for pkg in d.getVar('PACKAGES', True).split():
+        if pkg not in blacklist and localepkg not in pkg:
+            pkgs.append(pkg)
+    return pkgs
-- 
1.7.10.4



