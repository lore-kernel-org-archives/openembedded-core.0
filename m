Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T9usa-000678-Bq
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 11:29:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2012 02:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,384,1344236400"; d="scan'208";a="142526805"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2012 02:17:08 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2012 11:22:16 +0300
Message-Id: <1347006136-7449-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] autoconf: use --warning=cross only if supported
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
X-List-Received-Date: Fri, 07 Sep 2012 09:29:36 -0000

Adapt autoconf to pass --warning=cross to automake only if
supported.

[YOCTO #842]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../autoconf/check-automake-cross-warning.patch    |   34 ++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch b/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
new file mode 100644
index 0000000..73394d7
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/check-automake-cross-warning.patch
@@ -0,0 +1,34 @@
+Use --warning=cross only if supported by automake
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+--- a/bin/autoreconf.in
++++ b/bin/autoreconf.in
+@@ -127,6 +127,8 @@ my $aclocal_supports_warnings = 0;
+ my $automake_supports_force_missing = 0;
+ # Does automake support -Wfoo?
+ my $automake_supports_warnings = 0;
++# Does automake support --warning=cross
++my $automake_supports_cross_warning = 0;
+ 
+ my @prepend_include;
+ my @include;
+@@ -191,6 +193,7 @@ sub parse_args ()
+   $aclocal_supports_warnings = $aclocal_help =~ /--warnings/;
+   $automake_supports_force_missing = $automake_help =~ /--force-missing/;
+   $automake_supports_warnings = $automake_help =~ /--warnings/;
++  $automake_supports_cross_warning = $automake_help =~ /cross/;
+ 
+   # Dispatch autoreconf's option to the tools.
+   # --include;
+@@ -244,6 +247,8 @@ sub parse_args ()
+       $libtoolize .= ' --debug';
+     }
+   # --warnings;
++  @warning = grep { $_ ne "cross" } @warning
++    if ! $automake_supports_cross_warning;
+   if (@warning)
+     {
+       my $warn = ' --warnings=' . join (',', @warning);
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 478f8ed..1ec1cb5 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r7"
+PR = "r8"
 
 PARALLEL_MAKE = ""
 
@@ -8,6 +8,7 @@ LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI += "file://autoreconf-include.patch \
+	    file://check-automake-cross-warning.patch \
 	    file://autoreconf-exclude.patch \
 	    file://autoreconf-foreign.patch \
 	    file://autoreconf-gnuconfigize.patch \
-- 
1.7.9.5



