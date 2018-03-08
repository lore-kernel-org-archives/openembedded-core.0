Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BED6E7898C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053995"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:50 +0200
Message-Id: <20180308181804.31261-28-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 28/42] tcp-wrappers: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:25 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../tcp-wrappers-7.6/12_makefile_config.patch      | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
index e8289e44d93..d473fb63429 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
@@ -1,9 +1,10 @@
 Upstream-Status: Backport
 
-diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
---- tcp_wrappers_7.6.orig/Makefile	2003-08-21 01:43:39.000000000 +0200
-+++ tcp_wrappers_7.6/Makefile	2003-08-21 01:43:35.000000000 +0200
-@@ -45,7 +45,7 @@
+Index: tcp_wrappers_7.6/Makefile
+===================================================================
+--- tcp_wrappers_7.6.orig/Makefile
++++ tcp_wrappers_7.6/Makefile
+@@ -45,7 +45,7 @@ what:
  #
  # SysV.4 Solaris 2.x OSF AIX
  #REAL_DAEMON_DIR=/usr/sbin
@@ -12,7 +13,7 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
  # BSD 4.4
  #REAL_DAEMON_DIR=/usr/libexec
  #
-@@ -512,6 +519,7 @@
+@@ -513,6 +513,7 @@ VSYSLOG	= -Dvsyslog=myvsyslog
  # (examples: allow, deny, banners, twist and spawn).
  # 
  #STYLE	= -DPROCESS_OPTIONS	# Enable language extensions.
@@ -20,7 +21,7 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
  
  ################################################################
  # Optional: Changing the default disposition of logfile records
-@@ -535,6 +543,7 @@
+@@ -536,6 +537,7 @@ VSYSLOG	= -Dvsyslog=myvsyslog
  # The LOG_XXX names below are taken from the /usr/include/syslog.h file.
  
  FACILITY= LOG_MAIL	# LOG_MAIL is what most sendmail daemons use
@@ -28,7 +29,7 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
  
  # The syslog priority at which successful connections are logged.
  
-@@ -631,6 +640,7 @@
+@@ -632,6 +634,7 @@ TABLES	= -DHOSTS_DENY=\"/etc/hosts.deny\
  # lookups altogether, see the next section.
  
  PARANOID= -DPARANOID
@@ -36,7 +37,7 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
  
  ########################################
  # Optional: turning off hostname lookups
-@@ -644,6 +654,7 @@
+@@ -645,6 +648,7 @@ PARANOID= -DPARANOID
  # mode (see previous section) and comment out the following definition.
  
  HOSTNAME= -DALWAYS_HOSTNAME
@@ -44,7 +45,7 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
  
  #############################################
  # Optional: Turning on host ADDRESS checking
-@@ -670,6 +681,7 @@
+@@ -671,6 +675,7 @@ HOSTNAME= -DALWAYS_HOSTNAME
  # Solaris 2.x, and Linux. See your system documentation for details.
  #
  # KILL_OPT= -DKILL_IP_OPTIONS
@@ -52,7 +53,7 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
  
  ## End configuration options
  ############################
-@@ -677,9 +689,10 @@
+@@ -678,9 +683,10 @@ HOSTNAME= -DALWAYS_HOSTNAME
  # Protection against weird shells or weird make programs.
  
  SHELL	= /bin/sh
@@ -65,7 +66,7 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
  	$(BUGS) $(SYSTYPE) $(AUTH) $(UMASK) \
  	-DREAL_DAEMON_DIR=\"$(REAL_DAEMON_DIR)\" $(STYLE) $(KILL_OPT) \
  	-DSEVERITY=$(SEVERITY) -DRFC931_TIMEOUT=$(RFC931_TIMEOUT) \
-@@ -712,10 +725,11 @@
+@@ -713,11 +719,12 @@ all other: config-check tcpd tcpdmatch t
  
  config-check:
  	@set +e; test -n "$(REAL_DAEMON_DIR)" || { make; exit 1; }
@@ -81,3 +82,4 @@ diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
 +	@if [ ! -d shared ]; then mkdir shared; fi
  
  $(LIB):	$(LIB_OBJ)
+ 	rm -f $(LIB)
-- 
2.16.1


