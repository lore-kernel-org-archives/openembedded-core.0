Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5C77829E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:35:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 13 Jun 2017 07:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1181892488"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2017 07:35:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B63F458010F;
	Tue, 13 Jun 2017 07:35:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 17:34:02 +0300
Message-Id: <1497364442-23446-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAJTo0LYMK_QA0oBOpU5t9pNgYM+XmiB_B37AcAFR-hQa0RE9fA@mail.gmail.com>
References: <CAJTo0LYMK_QA0oBOpU5t9pNgYM+XmiB_B37AcAFR-hQa0RE9fA@mail.gmail.com>
Subject: [PATCH v4] mtools-native: disable reading host configs
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
X-List-Received-Date: Tue, 13 Jun 2017 14:35:52 -0000

Removed code that reads /etc/mtools.conf, /etc/default/mtools.conf,
/etc/mtools and /etc/default/mtools to ensure that mtools output
doesn't depend on the global host configs.

It's still possible to use ~/.mtoolsrc config or point MTOOLSRC
environment variable to any configuration file if user want
to configure mtools.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch  | 23 ++++++++++++++++++++++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
new file mode 100644
index 0000000..01455f1
--- /dev/null
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -0,0 +1,23 @@
+Disabled reading host configs.
+
+Upstream-Status: Inappropriate [native]
+
+Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
+
+--- mtools-4.0.18/config.c.orig	2017-06-13 12:27:38.644000000 +0300
++++ mtools-4.0.18/config.c	2017-06-13 12:28:47.576000000 +0300
+@@ -701,14 +701,6 @@
+ 	memcpy(devices, const_devices,
+ 	       nr_const_devices*sizeof(struct device));
+ 
+-    (void) ((parse(CONF_FILE,1) |
+-	     parse(LOCAL_CONF_FILE,1) |
+-	     parse(SYS_CONF_FILE,1)) ||
+-	    (parse(OLD_CONF_FILE,1) |
+-	     parse(OLD_LOCAL_CONF_FILE,1)));
+-    /* the old-name configuration files only get executed if none of the
+-     * new-name config files were used */
+-
+     homedir = get_homedir();
+     if ( homedir ){
+ 	strncpy(conf_file, homedir, MAXPATHLEN );
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index b0efc9e..5d84001 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -33,6 +33,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
            "
 
+SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
 
 inherit autotools texinfo
 
-- 
2.1.4


