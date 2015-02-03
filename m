Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8746E5D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 20:53:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 03 Feb 2015 12:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="449362921"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.57])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2015 12:39:21 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 14:53:39 -0600
Message-Id: <1422996819-24205-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][dizzy] package_manager.py: fix rootfs failure with multilib enabled
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
X-List-Received-Date: Tue, 03 Feb 2015 20:53:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

With the current code, if we use debian package backend and enable
multilib support, the do_rootfs process would always fail with error
messages like below.

    E: Unable to locate package packagegroup-core-boot

This patch fixes the above problem.

(From OE-Core rev: d140d556ae30b6dbd0ffce8882c3e22b17050820)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 8609156..9657d3b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1722,9 +1722,12 @@ class DpkgPM(PackageManager):
             with open(self.d.expand("${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample")) as apt_conf_sample:
                 for line in apt_conf_sample.read().split("\n"):
                     match_arch = re.match("  Architecture \".*\";$", line)
+                    architectures = ""
                     if match_arch:
                         for base_arch in base_arch_list:
-                            apt_conf.write("  Architecture \"%s\";\n" % base_arch)
+                            architectures += "\"%s\";" % base_arch
+                        apt_conf.write("  Architectures {%s};\n" % architectures);
+                        apt_conf.write("  Architecture \"%s\";\n" % base_archs)
                     else:
                         line = re.sub("#ROOTFS#", self.target_rootfs, line)
                         line = re.sub("#APTCONF#", self.apt_conf_dir, line)
-- 
1.9.1


