Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7473.1593080529610313350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=phCXjXib;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3227; q=dns/txt; s=axis-central1;
  t=1593080529; x=1624616529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BrVcIhkOowiuP45YoBGc7VH7XrTyh59JssIayCHfRsw=;
  b=phCXjXibcFBBI3UP+y+3u8bX7+MVBG64unLb85zJNp60blJmwcHBdsrQ
   YLXApTVgy0F9sXlegQta4iIwvy92f/cA1zLR3XQmCXVXnxNhYHOpPH5aN
   CKtDxGPVJ0e3BvqrQmflB1uRIrMyP3xPb5ZNOZzMEVG+eHOf5EBuSjghf
   TXNcanIzKut160VfVFsidHJ56QQldyGZLKhYksJMMBCI+gJn0mbPmszTd
   TMKzAUnbGXp8aR36Hr+gdOm9K+xXiy+Kfp1g4V43OM8TPU5eZ4iq7a5NN
   CvhULprGQoasz54TZO/ZijfI3R+4LQb+SqxpKkt/FVfla1JPXbw38WrO0
   Q==;
IronPort-SDR: i+C/UEc6FGHmGYTiXDyx+oOq/m8tv4RjrF8um2HnedrKblCaKHBfUDRcrzv1ORejq5jVk2nZ/6
 ZYxAxLZYeVT5krPQiWfrzvrtt7ooFDCKfVJdUFBupzWRGm3LDOXStFUVNd9KWshkfQVNc3J2hg
 L73N2fFd1OxHOea62KnhW/ezPaXSMv9Lf94l2gLTiUtTAhVgVR8RhRgl6LWaxaG2QZam6O4BVC
 lK6v47ZWKpRMo5iB/dsoaX5Uvx2kMAEwpO2vMsHVPmwSge3oo5TUZp3k1naBpB4LcCqs20dA3O
 AyQ=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893885"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 10/26] sdk.py: Dynamic load of sdk
Date: Thu, 25 Jun 2020 12:21:29 +0200
Message-ID: <20200625102145.7139-11-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Decide which sdk we should load in run time without any hard coded
values but look at which package type that is used.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/deb/sdk.py |  4 ++--
 meta/lib/oe/package_managers/ipk/sdk.py |  4 ++--
 meta/lib/oe/package_managers/rpm/sdk.py |  4 ++--
 meta/lib/oe/sdk.py                      | 13 ++-----------
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/package_managers/deb/sdk.py b/meta/lib/oe/package_managers/deb/sdk.py
index 154ec5ab17..950455988a 100644
--- a/meta/lib/oe/package_managers/deb/sdk.py
+++ b/meta/lib/oe/package_managers/deb/sdk.py
@@ -5,9 +5,9 @@
 from oe.sdk import *
 from oe.package_managers.deb.manifest import *
 
-class DpkgSdk(Sdk):
+class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
-        super(DpkgSdk, self).__init__(d, manifest_dir)
+        super(PkgSdk, self).__init__(d, manifest_dir)
 
         self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
         self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
diff --git a/meta/lib/oe/package_managers/ipk/sdk.py b/meta/lib/oe/package_managers/ipk/sdk.py
index 4862616c08..bd7bab6ebe 100644
--- a/meta/lib/oe/package_managers/ipk/sdk.py
+++ b/meta/lib/oe/package_managers/ipk/sdk.py
@@ -5,9 +5,9 @@
 from oe.sdk import *
 from oe.package_managers.ipk.manifest import *
 
-class OpkgSdk(Sdk):
+class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
-        super(OpkgSdk, self).__init__(d, manifest_dir)
+        super(PkgSdk, self).__init__(d, manifest_dir)
 
         self.target_conf = self.d.getVar("IPKGCONF_TARGET")
         self.host_conf = self.d.getVar("IPKGCONF_SDK")
diff --git a/meta/lib/oe/package_managers/rpm/sdk.py b/meta/lib/oe/package_managers/rpm/sdk.py
index fc120b6171..d2f7447657 100644
--- a/meta/lib/oe/package_managers/rpm/sdk.py
+++ b/meta/lib/oe/package_managers/rpm/sdk.py
@@ -5,9 +5,9 @@
 from oe.sdk import *
 from oe.package_managers.rpm.manifest import *
 
-class RpmSdk(Sdk):
+class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
-        super(RpmSdk, self).__init__(d, manifest_dir)
+        super(PkgSdk, self).__init__(d, manifest_dir)
 
         self.target_manifest = PkgManifest(d, self.manifest_dir,
                                            Manifest.MANIFEST_TYPE_SDK_TARGET)
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d8a00c04d1..3b7869f071 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -130,17 +130,8 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
-    img_type = d.getVar('IMAGE_PKGTYPE')
-
-    from oe.package_managers.rpm.sdk import RpmSdk
-    from oe.package_managers.ipk.sdk import OpkgSdk
-    from oe.package_managers.deb.sdk import DpkgSdk
-    if img_type == "rpm":
-        RpmSdk(d, manifest_dir).populate()
-    elif img_type == "ipk":
-        OpkgSdk(d, manifest_dir).populate()
-    elif img_type == "deb":
-        DpkgSdk(d, manifest_dir).populate()
+    import importlib
+    importlib.import_module('oe.package_managers.' + d.getVar('IMAGE_PKGTYPE') + '.sdk').PkgSdk(d, manifest_dir).populate()
 
     os.environ.clear()
     os.environ.update(env_bkp)
-- 
2.20.1

