Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web11.7474.1593080529844279544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YXP2mW+2;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2541; q=dns/txt; s=axis-central1;
  t=1593080532; x=1624616532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zYNULEih51ntHP+iBIEl8MfaRhTEZfeYahrL385No1w=;
  b=YXP2mW+2oa3HsW9CCj2kxDGgbe9MPN8pUcdGGJrNBGxcSpy0l7z3mFAf
   o4uxAXhXPEWcLXfkAGAWaTYmFbCDtcWBG9aZY3ltbXw31562/BsFPvWea
   dr1x9gxmFTTXid/BFv13MAInwHrg4ADK+qPVHRfCErDI8BFiL66oOiSnB
   4MNLxhms/aW9yylmDgmWHyGOKL+7lsLNnHbtlYnq95+UhnfjyT5YD2rBO
   tci/YZXvrUTMc44Q9xfjBJ7C7KFpe9mHimOJZQ/5Ykib0vxUOl4uDCxmL
   OxWwfffbVMZdPfNz7eqi3DJAEuiieQZOUMVXkFX0O2TcBfoGohjJv6kJ3
   A==;
IronPort-SDR: MUdgDsS3+J440Vazzy6jlvXHURmBMFp8UJqbB2ZBqE+XabNH6bs3Hd9cYybW/3Chl+96QnHZ/K
 ZG/Yl5L8kmRoO0D7p8RR7pLWI6t9OJ+/keIkCpAmFPabaWdBe91qJJ7D07URWjwrHPhY7dHvM+
 5/6j9ofB8BzcXk8h9ptX856rInvgKIU9QucUr66DPj1IM/SrlVREFoLl5HVVSzJOCj9q+Cvqrz
 CXTHyWN6a5Gh+Pm96+nHw+CzUYwFAlH6zheY0rL7NN1KZnaU84nVCy/AbdwoB+UapFurVR3rJC
 C5U=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185338"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 23/26] package_manager.py: Move RpmPkgsList
Date: Thu, 25 Jun 2020 12:21:42 +0200
Message-ID: <20200625102145.7139-24-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Let the code that is only used by rpm package manager live in that
package manager owned directory.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_manager.py                      | 5 -----
 meta/lib/oe/package_managers/rpm/package_manager.py | 4 ++++
 meta/lib/oe/rootfs.py                               | 1 +
 meta/lib/oe/sdk.py                                  | 1 +
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index bfddbce93c..20c3400def 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -158,11 +158,6 @@ class PkgsList(object, metaclass=ABCMeta):
     def list_pkgs(self):
         pass
 
-class RpmPkgsList(PkgsList):
-    def list_pkgs(self):
-        from oe.package_managers.rpm.package_manager import PkgPM
-        return PkgPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
-
 class OpkgPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir, config_file):
         super(OpkgPkgsList, self).__init__(d, rootfs_dir)
diff --git a/meta/lib/oe/package_managers/rpm/package_manager.py b/meta/lib/oe/package_managers/rpm/package_manager.py
index e781676183..57a5c9ec38 100644
--- a/meta/lib/oe/package_managers/rpm/package_manager.py
+++ b/meta/lib/oe/package_managers/rpm/package_manager.py
@@ -400,3 +400,7 @@ class PkgIndexer(RpmIndexer):
                         self.do_write_index(dir_path)
 
 
+class RpmPkgsList(PkgsList):
+    def list_pkgs(self):
+        return PkgPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
+
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index fdfb8efafc..b9891455fb 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -371,6 +371,7 @@ def image_list_installed_packages(d, rootfs_dir=None):
         rootfs_dir = d.getVar('IMAGE_ROOTFS')
 
     img_type = d.getVar('IMAGE_PKGTYPE')
+    from oe.package_managers.rpm.package_manager import RpmPkgsList
     if img_type == "rpm":
         return RpmPkgsList(d, rootfs_dir).list_pkgs()
     elif img_type == "ipk":
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 3b7869f071..619ab57caf 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -116,6 +116,7 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
 
         rootfs_dir = [sdk_output, os.path.join(sdk_output, target_path)][target is True]
 
+    from oe.package_managers.rpm.package_manager import RpmPkgsList
     img_type = d.getVar('IMAGE_PKGTYPE')
     if img_type == "rpm":
         arch_var = ["SDK_PACKAGE_ARCHS", None][target is True]
-- 
2.20.1

