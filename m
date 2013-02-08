Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kKC-0001Vf-R4
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 10:32:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Feb 2013 01:16:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="282550299"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2013 01:16:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:16:51 +0000
Message-Id: <babf8418689667cdd606ea089536a6e55c7708f7.1360314954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360314954.git.paul.eggleton@linux.intel.com>
References: <cover.1360314954.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360314954.git.paul.eggleton@linux.intel.com>
References: <cover.1360314954.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] python-smartpm: show friendly error if YAML output requested without PyYAML
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
X-List-Received-Date: Fri, 08 Feb 2013 09:32:53 -0000

Instead of a python backtrace, tell the user they need to install PyYAML
if they wish to use the --yaml output options.

Fixes [YOCTO #3768].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-smartpm/smart-yaml-error.patch   |   86 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch b/meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch
new file mode 100644
index 0000000..e16c5c1
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch
@@ -0,0 +1,86 @@
+Print a more friendly error if YAML output is requested without PyYAML
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/smart/commands/channel.py b/smart/commands/channel.py
+index 63fbb35..108f3f1 100644
+--- a/smart/commands/channel.py
++++ b/smart/commands/channel.py
+@@ -339,7 +339,10 @@ def main(ctrl, opts):
+                     print
+ 
+     if opts.yaml is not None:
+-        import yaml
++        try:
++            import yaml
++        except ImportError:
++            raise Error, _("Please install PyYAML in order to use this function")
+         yamlchannels = {}
+         for alias in (opts.yaml or sysconf.get("channels", ())):
+             channel = sysconf.get(("channels", alias))
+diff --git a/smart/commands/config.py b/smart/commands/config.py
+index 4fe4366..aa1db78 100644
+--- a/smart/commands/config.py
++++ b/smart/commands/config.py
+@@ -137,7 +137,10 @@ def main(ctrl, opts):
+             pprint.pprint(sysconf.get((), hard=True))
+ 
+     if opts.yaml is not None:
+-        import yaml
++        try:
++            import yaml
++        except ImportError:
++            raise Error, _("Please install PyYAML in order to use this function")
+         if opts.yaml:
+             marker = object()
+             for opt in opts.yaml:
+diff --git a/smart/commands/flag.py b/smart/commands/flag.py
+index ed18999..8b90496 100644
+--- a/smart/commands/flag.py
++++ b/smart/commands/flag.py
+@@ -138,7 +138,10 @@ def main(ctrl, opts):
+             print
+ 
+     if opts.yaml is not None:
+-        import yaml
++        try:
++            import yaml
++        except ImportError:
++            raise Error, _("Please install PyYAML in order to use this function")
+         yamlflags = {}
+         for flag in opts.yaml or pkgconf.getFlagNames():
+             flag = flag.strip()
+diff --git a/smart/commands/mirror.py b/smart/commands/mirror.py
+index ca50a95..f7b019d 100644
+--- a/smart/commands/mirror.py
++++ b/smart/commands/mirror.py
+@@ -218,7 +218,10 @@ def main(ctrl, opts):
+             print
+ 
+     if opts.yaml:
+-        import yaml
++        try:
++            import yaml
++        except ImportError:
++            raise Error, _("Please install PyYAML in order to use this function")
+         yamlmirrors = {}
+         mirrors = sysconf.get("mirrors", ())
+         for origin in mirrors:
+diff --git a/smart/commands/priority.py b/smart/commands/priority.py
+index d850d29..441ea32 100644
+--- a/smart/commands/priority.py
++++ b/smart/commands/priority.py
+@@ -117,7 +117,10 @@ def main(ctrl, opts):
+         print
+ 
+     elif opts.yaml:
+-        import yaml
++        try:
++            import yaml
++        except ImportError:
++            raise Error, _("Please install PyYAML in order to use this function")
+         yamlpriorities = {}
+         priorities = sysconf.get("package-priorities", {})
+         for name in opts.args or priorities:
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 06641ad..d92933f 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "\
           file://smart-metadata-match.patch \
           file://smart-improve-error-reporting.patch \
           file://smart-multilib-fixes.patch \
+          file://smart-yaml-error.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.10.4



