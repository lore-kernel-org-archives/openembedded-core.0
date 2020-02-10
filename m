Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03FFB60F9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 13:20:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01ADKVM3001594
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 10 Feb 2020 05:20:31 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 10 Feb 2020 05:20:31 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <alex.kanavin@gmail.com>
Date: Mon, 10 Feb 2020 21:20:26 +0800
Message-ID: <20200210132026.10962-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] imagefeatures.py: update no busybox cases
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
X-List-Received-Date: Mon, 10 Feb 2020 13:20:37 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Duplicate case test_no_busybox_base_utils with
test_no_busybox_base_utils_systemd in imagefeatures.py. Append
IMAGE_FEATURES "ptest-pkgs" and run task 'testimage' of core-image-sato
in original case test_no_busybox_base_utils.

It takes too much time to run case test_no_busybox_base_utils, so not
update the case to run task 'testimage' in test_no_busybox_base_utils_systemd.

$ time oe-selftest -r imagefeatures.ImageFeatures.test_no_busybox_base_utils

real    394m54.424s
user    0m17.764s
sys     0m4.276s

[Yocto #13736]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 5c519ac3d6..200dfe58db 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -239,8 +239,33 @@ USERADD_GID_TABLES += "files/static-group"
 
     def test_no_busybox_base_utils(self):
         config = """
+INHERIT += "testimage"
+
+# Enable x11
+DISTRO_FEATURES_append = " x11"
+
+# Involve ptest packages
+IMAGE_FEATURES_append = " ptest-pkgs"
+
+# Replace busybox
+PREFERRED_PROVIDER_virtual/base-utils = "packagegroup-core-base-utils"
+VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
+VIRTUAL-RUNTIME_base-utils-hwclock = "util-linux-hwclock"
+VIRTUAL-RUNTIME_base-utils-syslog = "sysklogd"
+VIRTUAL-RUNTIME_login_manager = "shadow-base"
+
+# Blacklist busybox
+PNBLACKLIST[busybox] = "Don't build this"
+"""
+        self.write_config(config)
+
+        bitbake("core-image-sato")
+        bitbake("-c testimage core-image-sato")
+
+    def test_no_busybox_base_utils_systemd(self):
+        config = """
 # Enable x11
-DISTRO_FEATURES_append += "x11"
+DISTRO_FEATURES_append = " x11"
 
 # Switch to systemd
 DISTRO_FEATURES += "systemd"
-- 
2.17.1


