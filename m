Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tDx9magwTpz3W2pLU2Jtpo8+44lJw3x+I7X60cFli9U+ENxX0ndQOuxzP/1cCA3k7f/R7lATTQ
 3O73z4Tof5EQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:53:54 -0700
IronPort-SDR: 4EC2pDO3o+Yy9vHERIzj2v3ZWxu48fg0Rl2j1gMlIcNPM0ENTEYEyKNz/kU8pKQWHCLx3XHCgp
 Gc30cTo4OPHQ==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621848"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 3/9] sanity: check for more bits of Python
Date: Thu, 26 Mar 2020 16:53:30 +0800
Message-Id: <da2df0251098c46a1476983db379cf33010e3035.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>

From: Ross Burton <ross.burton@intel.com>

MJ: icu in master doesn't need distutils anymore, because icu 65.1 currently in
dunfell/master doesn't depend on python3-distutils anymore since:
https://github.com/unicode-org/icu/commit/b4d41b0561b6e8de38b99850ce0e4be8ef536bb1

but the icu-64.2 in zeus and openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb
still need python3-distutils as described in:
http://lists.openembedded.org/pipermail/openembedded-core/2020-March/293984.html

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 936fe91..5c2f8f9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -625,13 +625,14 @@ def check_sanity_version_change(status, d):
     # In other words, these tests run once in a given build directory and then 
     # never again until the sanity version or host distrubution id/version changes.
 
-    # Check the python install is complete. glib-2.0-natives requries
-    # xml.parsers.expat
+    # Check the python install is complete. Examples that are often removed in
+    # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu
+    # requires distutils.sysconfig.
     try:
         import xml.parsers.expat
-    except ImportError:
-        status.addresult('Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n')
-    import stat
+        import distutils.sysconfig
+    except ImportError as e:
+        status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
 
     status.addresult(check_make_version(d))
     status.addresult(check_patch_version(d))
@@ -667,6 +668,7 @@ def check_sanity_version_change(status, d):
         status.addresult('Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n')
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
+    import stat
     tmpdir = d.getVar('TMPDIR')
     status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
     tmpdirmode = os.stat(tmpdir).st_mode
-- 
2.7.4

