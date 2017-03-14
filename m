Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4FE37783D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489512528; x=1521048528;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=mLTn8aKV0D8/HHywIFD1wD4IYyDqx6abQNLsqX1YoIk=;
	b=Zp6orabsQB/h2/VaaZqp3HHA3HAlxbxLJlSl9FLSWliAZ1C0kd6OUpTj
	1xKT7NUYGliswTiMjCof77qGBTTQ1A==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2017 10:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,165,1486454400"; d="scan'208";a="67345918"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 14 Mar 2017 10:28:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 19:27:48 +0200
Message-Id: <20170314172749.6643-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] lib/oe/package_manager: import rpm signing key to rpmdb
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
X-List-Received-Date: Tue, 14 Mar 2017 17:28:46 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Import the gpg key used in rpm signing into rpmdb. This makes it
possible again to create images when rpm signing is enabled.

Also, instruct dnf to enforce signature check if rpm signing is enabled.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b016bc32dc5..eeb4c76071a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -520,7 +520,14 @@ class RpmPM(PackageManager):
             open(platformconfdir + "macros", 'a').write("%_prefer_color 7")
 
         if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
-            raise NotImplementedError("Signature verification with rpm not yet supported.")
+            pubkey_path = self.d.getVar('RPM_GPG_PUBKEY')
+            rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmkeys")
+            cmd = [rpm_bin, '--root=%s' % self.target_rootfs, '--import', pubkey_path]
+            try:
+                subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            except subprocess.CalledProcessError as e:
+                bb.fatal("Importing GPG key failed. Command '%s' "
+                        "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
     def create_configs(self):
         self._configure_dnf()
@@ -570,7 +577,8 @@ class RpmPM(PackageManager):
         output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
                          (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
                          (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == 1 else []) +
-                         ["--nogpgcheck", "install"] +
+                         (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
+                         ["install"] +
                          pkgs)
 
         failed_scriptlets_pkgnames = collections.OrderedDict()
-- 
2.11.0


