Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U0z9x-0000YR-3N
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 19:46:55 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0VIV6YB024375;
	Thu, 31 Jan 2013 10:31:08 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 31 Jan 2013 13:31:04 -0500
Message-Id: <828b1143477da079956a5541f8cc66c07ab6a3cc.1359656303.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359656303.git.bruce.ashfield@windriver.com>
References: <cover.1359656303.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1359656303.git.bruce.ashfield@windriver.com>
References: <cover.1359656303.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] multilib: skip packages that provide virtual/kernel
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
X-List-Received-Date: Thu, 31 Jan 2013 18:47:03 -0000

Rather than keying on recipes that inherit kernel.bbclass, we should
be checking for providers of virtual/kernel when skipping kernel
recipes in multlib builds.

Not all providers of virtual/kernel inherit kernel.bbclass (notably
linux-dummy), so checking on the provider is a more complete check.

We need to be sure to check for inheritance of module-base as well, this
allows for packages that provides modules to avoid the multilib renaming.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/multilib.bbclass |    4 +++-
 meta/lib/oe/classextend.py    |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index f5f3c69..f1696b6 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -10,7 +10,9 @@ python multilib_virtclass_handler () {
     e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DIR', True))
 
     # There should only be one kernel in multilib configs
-    if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data):
+    # We also skip multilib setup for module packages.
+    provides = (e.data.getVar("PROVIDES", True) or "").split()
+    if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data):
         raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
 
     if bb.data.inherits_class('image', e.data):
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 19e1254..61cbb8f 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -5,7 +5,7 @@ class ClassExtender(object):
         self.pkgs_mapping = []
 
     def extend_name(self, name):
-        if name.startswith("kernel-module"):
+        if name.startswith("kernel-module") or name == "virtual/kernel":
             return name
         if name.startswith("rtld"):
             return name
-- 
1.7.10.4



