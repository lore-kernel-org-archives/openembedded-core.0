Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F20C778317
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:23:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 04:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="273606312"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2017 04:23:53 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C1A3558010F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:23:52 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:21:49 +0300
Message-Id: <c9ea2fd10e9cf1b06c06d9a9ea402ba1ba8471ac.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 01/26] mtools-native: disable reading host configs
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
X-List-Received-Date: Tue, 13 Jun 2017 11:23:53 -0000

Removed code that reads /etc/mtools.conf, /etc/default/mtools.conf,
/etc/mtools and /etc/default/mtools to ensure that mtools output
doesn't depend on the global host configs.

It's still possible to use ~/.mtoolsrc config or point MTOOLSRC
environment variable to any configuration file if user want
to configure mtools.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch       | 17 +++++++++++++++++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb           |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
new file mode 100644
index 0000000..92755be
--- /dev/null
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -0,0 +1,17 @@
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
index b0efc9e..88d1d96 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -33,6 +33,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://0001-Continue-even-if-fs-size-is-not-divisible-by-sectors.patch \
            "
 
+SRC_URI_append_class-native = "file://disable-hardcoded-configs.patch"
 
 inherit autotools texinfo
 
-- 
2.1.4


