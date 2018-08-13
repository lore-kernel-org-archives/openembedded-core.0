Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0509478F71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:28:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q8-v6so9075579wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VLwOy3FqxMl8/g5NIpmI7A9jSfif0OQmk11IW+BD8Vk=;
	b=FJhNEig34y00Sz3jHQGH934Hzof0TnxWfKhS+/Vbf0Ea3h8s3RajDMtRuw4WsQZtTM
	hSGdU9eFLiprCJJ5GxF0r13NF46UU3SaHxGm+JRAzumS5vVDq6zIcQtmvf3+vuyRDbol
	9r7T0P4ikeSslUNW+na8au6p4jKOSNugmbVKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VLwOy3FqxMl8/g5NIpmI7A9jSfif0OQmk11IW+BD8Vk=;
	b=hN/f7Nk9qCkP7SSmgLNDC5DjpzRmKRjVFafXGcrvoqkuBbuFk5YHD5iLrBe2kEudSq
	uCd3OZKo45CSmwm4gbNj2agPNnV1qhnTEhWSxRdmtcMYyX7sAxiTMIp0nnS2038tKvPn
	Czcd/G3fYRpLRN7YgrCVefSJ7Tkhg3xqLGrXywiSMUumvt9KzFRTy5Myl9u91EyN3fNb
	DRbaVRMb45EcYLC/zv/r59RNTc92BR2a3JQPz21XF5yZbs7GMwf9jViE8OSUOvikXNYd
	i9xSVoeOjv3fdCalXjuorTGyt+AD2rWzd6DgGX5owkogquoMTnCadk9J+nA/QTAZnU/2
	E66A==
X-Gm-Message-State: AOUpUlHUuedgn8iK6L4Mv+PWMmYx92gV8cozHnd6KrO9SnJzzt36cdbu
	6gXHnyh1Tq4XfvmPkn679bP2Eq0NeMI=
X-Google-Smtp-Source: AA+uWPzW2tcYt+wyyuA3mT4aydf6r9BxLcLzV1//8XZrjnpph5ujYLbxNvVkmStXRobzl9WgsF1kJA==
X-Received: by 2002:a1c:4143:: with SMTP id
	o64-v6mr8847475wma.123.1534170524332; 
	Mon, 13 Aug 2018 07:28:44 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm13488254wrr.95.2018.08.13.07.28.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:28:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:28:34 +0100
Message-Id: <20180813142835.5309-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/7] image: Add locale archive optimisation
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
X-List-Received-Date: Mon, 13 Aug 2018 14:28:44 -0000

Refactor the locale archive function from the SDK to also make it work during
general image creation. This reduces the size of the locales from 900MB to 220MB
in core-image-lsb-sdk.

The exception handling around subprocess was dropped as the standard subprocess
exception printing is better handled than the catchall exception.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass     |  2 +-
 meta/lib/oe/package_manager.py | 49 ++++++++++++++++++++++++++++++++++
 meta/lib/oe/sdk.py             | 45 ++-----------------------------
 3 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c3e73676dca..c0a2714288d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -22,7 +22,7 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
 
 LICENSE ?= "MIT"
 PACKAGES = ""
-DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross"
+DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross cross-localedef-native"
 RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 PATH_prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 64c8a912160..6011e873503 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -12,6 +12,7 @@ import oe.path
 import string
 from oe.gpg_sign import get_signer
 import hashlib
+import fnmatch
 
 # this can be used by all PM backends to create the index files in parallel
 def create_index(arg):
@@ -89,6 +90,47 @@ def failed_postinsts_warn(pkgs, log_path):
 If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.
 Details of the failure are in %s.""" %(pkgs, log_path))
 
+def generate_locale_archive(d, rootfs, target_arch, localedir):
+    # Pretty sure we don't need this for locale archive generation but
+    # keeping it to be safe...
+    locale_arch_options = { \
+        "arm": ["--uint32-align=4", "--little-endian"],
+        "armeb": ["--uint32-align=4", "--big-endian"],
+        "aarch64": ["--uint32-align=4", "--little-endian"],
+        "aarch64_be": ["--uint32-align=4", "--big-endian"],
+        "sh4": ["--uint32-align=4", "--big-endian"],
+        "powerpc": ["--uint32-align=4", "--big-endian"],
+        "powerpc64": ["--uint32-align=4", "--big-endian"],
+        "mips": ["--uint32-align=4", "--big-endian"],
+        "mipsisa32r6": ["--uint32-align=4", "--big-endian"],
+        "mips64": ["--uint32-align=4", "--big-endian"],
+        "mipsisa64r6": ["--uint32-align=4", "--big-endian"],
+        "mipsel": ["--uint32-align=4", "--little-endian"],
+        "mipsisa32r6el": ["--uint32-align=4", "--little-endian"],
+        "mips64el": ["--uint32-align=4", "--little-endian"],
+        "mipsisa64r6el": ["--uint32-align=4", "--little-endian"],
+        "i586": ["--uint32-align=4", "--little-endian"],
+        "i686": ["--uint32-align=4", "--little-endian"],
+        "x86_64": ["--uint32-align=4", "--little-endian"]
+    }
+    if target_arch in locale_arch_options:
+        arch_options = locale_arch_options[target_arch]
+    else:
+        bb.error("locale_arch_options not found for target_arch=" + target_arch)
+        bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
+
+    # Need to set this so cross-localedef knows where the archive is
+    env = dict(os.environ)
+    env["LOCALEARCHIVE"] = oe.path.join(localedir, "locale-archive")
+
+    for name in os.listdir(localedir):
+        path = os.path.join(localedir, name)
+        if os.path.isdir(path):
+            cmd = ["cross-localedef", "--verbose"]
+            cmd += arch_options
+            cmd += ["--add-to-archive", path]
+            subprocess.check_output(cmd, env=env, stderr=subprocess.STDOUT)
+
 class Indexer(object, metaclass=ABCMeta):
     def __init__(self, d, deploy_dir):
         self.d = d
@@ -536,6 +578,13 @@ class PackageManager(object, metaclass=ABCMeta):
                          "'%s' returned %d:\n%s" %
                          (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
+        target_arch = self.d.getVar('TARGET_ARCH')
+        localedir = oe.path.join(self.target_rootfs, self.d.getVar("libdir"), "locale")
+        if os.path.exists(localedir) and os.listdir(localedir):
+            generate_locale_archive(self.d, self.target_rootfs, target_arch, localedir)
+            # And now delete the binary locales
+            self.remove(fnmatch.filter(self.list_installed(), "glibc-binary-localedata-*"), False)
+
     def deploy_dir_lock(self):
         if self.deploy_dir is None:
             raise RuntimeError("deploy_dir is not set!")
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 0d39ea8a91e..a579d9ae77f 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -7,51 +7,10 @@ import shutil
 import glob
 import traceback
 
-def generate_locale_archive(d, rootfs):
-    # Pretty sure we don't need this for SDK archive generation but
-    # keeping it to be safe...
+def generate_locale_archive_sdk(d, rootfs):
     target_arch = d.getVar('SDK_ARCH')
-    locale_arch_options = { \
-        "arm": ["--uint32-align=4", "--little-endian"],
-        "armeb": ["--uint32-align=4", "--big-endian"],
-        "aarch64": ["--uint32-align=4", "--little-endian"],
-        "aarch64_be": ["--uint32-align=4", "--big-endian"],
-        "sh4": ["--uint32-align=4", "--big-endian"],
-        "powerpc": ["--uint32-align=4", "--big-endian"],
-        "powerpc64": ["--uint32-align=4", "--big-endian"],
-        "mips": ["--uint32-align=4", "--big-endian"],
-        "mipsisa32r6": ["--uint32-align=4", "--big-endian"],
-        "mips64": ["--uint32-align=4", "--big-endian"],
-        "mipsisa64r6": ["--uint32-align=4", "--big-endian"],
-        "mipsel": ["--uint32-align=4", "--little-endian"],
-        "mipsisa32r6el": ["--uint32-align=4", "--little-endian"],
-        "mips64el": ["--uint32-align=4", "--little-endian"],
-        "mipsisa64r6el": ["--uint32-align=4", "--little-endian"],
-        "i586": ["--uint32-align=4", "--little-endian"],
-        "i686": ["--uint32-align=4", "--little-endian"],
-        "x86_64": ["--uint32-align=4", "--little-endian"]
-    }
-    if target_arch in locale_arch_options:
-        arch_options = locale_arch_options[target_arch]
-    else:
-        bb.error("locale_arch_options not found for target_arch=" + target_arch)
-        bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
-
     localedir = oe.path.join(rootfs, d.getVar("libdir_nativesdk"), "locale")
-    # Need to set this so cross-localedef knows where the archive is
-    env = dict(os.environ)
-    env["LOCALEARCHIVE"] = oe.path.join(localedir, "locale-archive")
-
-    for name in os.listdir(localedir):
-        path = os.path.join(localedir, name)
-        if os.path.isdir(path):
-            try:
-                cmd = ["cross-localedef", "--verbose"]
-                cmd += arch_options
-                cmd += ["--add-to-archive", path]
-                subprocess.check_output(cmd, env=env, stderr=subprocess.STDOUT)
-            except Exception as e:
-                bb.fatal("Cannot create locale archive: %s" % e.output)
+    generate_locale_archive(d, rootfs, target_arch, localedir)
 
 class Sdk(object, metaclass=ABCMeta):
     def __init__(self, d, manifest_dir):
-- 
2.17.1


