Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFCEB762B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 01:48:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t871mEv4026950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Sep 2015 18:48:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 6 Sep 2015 18:48:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Sep 2015 18:48:13 -0700
Message-ID: <5915c718a6a692fa534940048feca6c5ffc8dcc7.1441590457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1441590457.git.liezhi.yang@windriver.com>
References: <cover.1441590457.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_manager.py: search provides when not found by pkgname
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
X-List-Received-Date: Mon, 07 Sep 2015 01:48:18 -0000
Content-Type: text/plain

Fixed when:
PACKAGE_CLASSES = "package_rpm"
IMAGE_INSTALL_append = " perl-module-warnings-register"

$ bitbake core-image-minimal
[snip]
ERROR: perl-module-warnings-register not found in the base feeds
[snip]

And it works well when PACKAGE_CLASSES = "package_ipk" since perl
provides perl-module-warnings-register, the "smart install
perl-module-warnings-register" also works well, this was because
_search_pkg_name_in_feeds() only searched pkg name, but no provides,
this patch fixes the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 810b728..292ed44 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -760,6 +760,22 @@ class RpmPM(PackageManager):
                     # bb.note('%s -> %s' % (pkg, pkg + '@' + arch))
                     return pkg + '@' + arch
 
+        # Search provides if not found by pkgname.
+        bb.note('Not found %s by name, searching provides ...' % pkg)
+        cmd = "%s %s query --provides %s --show-format='$name-$version'" % \
+                (self.smart_cmd, self.smart_opt, pkg)
+        cmd += " | sed -ne 's/ *Provides://p'"
+        bb.note('cmd: %s' % cmd)
+        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        # Found a provider
+        if output:
+            bb.note('Found providers for %s: %s' % (pkg, output))
+            for p in output.split():
+                for arch in feed_archs:
+                    arch = arch.replace('-', '_')
+                    if p.rstrip().endswith('@' + arch):
+                        return p
+
         return ""
 
     '''
-- 
1.7.9.5


