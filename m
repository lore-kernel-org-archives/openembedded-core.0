Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1UFBr8-0003vx-Pu
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:10:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Mar 2013 15:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,825,1355126400"; d="scan'208";a="276776772"
Received: from wrk.jf.intel.com ([10.7.202.65])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2013 15:53:31 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 15:51:22 -0700
Message-Id: <ef21fcf1adf6da74d0770982070dfc78db886154.1363041436.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363041435.git.kevin.strasser@linux.intel.com>
References: <cover.1363041435.git.kevin.strasser@linux.intel.com>
Subject: [PATCH 1/2] archive-*-source.bbclass: fix scripts_with_logs build error
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
X-List-Received-Date: Mon, 11 Mar 2013 23:10:11 -0000

Log and script archives are only generated when explicitly enabled by
setting the environment variable SOURCE_ARCHIVE_LOG_WITH_SCRIPTS to
'logs_with_scripts'. When left disabled, the path specified to be
handled by sstate is never created, resulting in a build error.

Only attempt to archive scripts and logs when explicitly enabled.

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 meta/classes/archive-configured-source.bbclass |    5 +++--
 meta/classes/archive-original-source.bbclass   |    5 +++--
 meta/classes/archive-patched-source.bbclass    |    5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 4fc5129..2738cab 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -28,9 +28,10 @@ python () {
         """
         d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_configured_sources' %pn)
         build_deps = ' %s:do_archive_configured_sources' %pn
-        build_deps += ' %s:do_archive_scripts_logs' %pn
+        if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
+            build_deps += ' %s:do_archive_scripts_logs' %pn
+            d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
         d.appendVarFlag('do_build', 'depends', build_deps)
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     else:
         d.prependVarFlag('do_configure', 'postfuncs', "do_archive_configured_sources")
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 3aea4f4..2858d33 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -28,9 +28,10 @@ python () {
         """
         d.appendVarFlag('do_patch', 'depends', ' %s:do_archive_original_sources_patches' %pn)
         build_deps = ' %s:do_archive_original_sources_patches' %pn
-        build_deps += ' %s:do_archive_scripts_logs' %pn
+        if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
+            build_deps += ' %s:do_archive_scripts_logs' %pn
+            d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
         d.appendVarFlag('do_build', 'depends', build_deps)
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     else:
         d.prependVarFlag('do_unpack', 'postfuncs', "do_archive_original_sources_patches")
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index d7ed6c8..b47d36c 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -28,9 +28,10 @@ python () {
         """
         d.appendVarFlag('do_configure', 'depends', ' %s:do_archive_patched_sources' %pn)
         build_deps = ' %s:do_archive_patched_sources' %pn
-        build_deps += ' %s:do_archive_scripts_logs' %pn
+        if d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True) == 'logs_with_scripts':
+            build_deps += ' %s:do_archive_scripts_logs' %pn
+            d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
         d.appendVarFlag('do_build', 'depends', build_deps)
-        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     else:
         d.prependVarFlag('do_patch', 'postfuncs', "do_archive_patched_sources")
-- 
1.7.9.5



