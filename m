Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id D81297136A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:01 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id w62so2362796wes.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=AhLmID0Wav0hQqRo6k01f4Yrh0ydsh4tlfkaE0iYH7A=;
	b=IgfyRfR9l/q5i0QxVIFQ3hvsNayqBmBFJpXOzfxkni4mTrpUWe5vTQQp9oZUFMNh8W
	K/U5iVVajVCPqacT1Xv0fe+SusSMbH0AckKl+mpEC9lO0b3IBYDP3fcW7+uZOLR8ihtD
	TshzBdF2/Wt808rKR/CJtO5OgAd2SZaDREIhKh6CxAJoybhIjbDQTKpsejEalZShxTkK
	JH4GHM7Wpyd1i1vzzS+9YNhdB4vxyw4A3oNwyfmadpGnwo3ds+IjoSLQqcpzD39SD2cS
	/OC63DLzdoF2E2OXfHZI2NGLYmdZ7WJBISdDOYkkyLY4GLCwADmnzWtvfj4Wla66lzpc
	Dm1A==
X-Gm-Message-State: ALoCoQnVaiig30bJfU6cW1+D2j9DDeyEIKiT/IFVf6GxNkxM7+5bdEM9uwhQno+VUEC+olkOn7vJ
X-Received: by 10.194.176.68 with SMTP id cg4mr2193955wjc.132.1410177542441;
	Mon, 08 Sep 2014 04:59:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:26 +0100
Message-Id: <e5530f2b932daa35434378cf8b0ab0423ac69052.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 08/27] package_manager.py: use RPM_PREFER_ELF_ARCH
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:02 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Use RPM_PREFER_ELF_ARCH to instead of RPM_PREFER_COLOR as rpm upstream
suggested, and use "4" to instead of "3" since it is a bit mask (not
enumeration), so we need "4" here.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py |   12 ++++++------
 meta/lib/oe/rootfs.py          |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a1ac6eb..b3b3b2d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -819,17 +819,17 @@ class RpmPM(PackageManager):
                            self.d.getVar('localstatedir', True))
         cmd = 'config --set rpm-extra-macros._tmppath=/install/tmp'
 
-        prefer_color = self.d.getVar('RPM_PREFER_COLOR', True)
+        prefer_color = self.d.getVar('RPM_PREFER_ELF_ARCH', True)
         if prefer_color:
-            if prefer_color not in ['0', '1', '2', '3']:
-                bb.fatal("Invalid RPM_PREFER_COLOR: %s, it should be one of:\n"
+            if prefer_color not in ['0', '1', '2', '4']:
+                bb.fatal("Invalid RPM_PREFER_ELF_ARCH: %s, it should be one of:\n"
                         "\t1: ELF32 wins\n"
                         "\t2: ELF64 wins\n"
-                        "\t3: ELF64 N32 wins (mips64 or mips64el only)" %
+                        "\t4: ELF64 N32 wins (mips64 or mips64el only)" %
                         prefer_color)
-            if prefer_color == "3" and self.d.getVar("TUNE_ARCH", True) not in \
+            if prefer_color == "4" and self.d.getVar("TUNE_ARCH", True) not in \
                                     ['mips64', 'mips64el']:
-                bb.fatal("RPM_PREFER_COLOR = \"3\" is for mips64 or mips64el "
+                bb.fatal("RPM_PREFER_ELF_ARCH = \"4\" is for mips64 or mips64el "
                          "only.")
             self._invoke_smart('config --set rpm-extra-macros._prefer_color=%s'
                         % prefer_color)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0424a01..3d8ae81 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -330,7 +330,7 @@ class RpmRootfs(Rootfs):
     @staticmethod
     def _depends_list():
         return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
-                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_COLOR']
+                'RPM_POSTPROCESS_COMMANDS', 'RPM_PREFER_ELF_ARCH']
 
     def _get_delayed_postinsts(self):
         postinst_dir = self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts")
-- 
1.7.10.4


