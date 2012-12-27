Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToERU-0001tt-BQ
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 15:28:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2012 06:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,362,1355126400"; d="scan'208";a="239466190"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2012 06:13:19 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 16:13:52 +0200
Message-Id: <51a8c0083657fa7c500c2c54c96e3cca62333dbe.1356617488.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
Subject: [PATCH 1/6] libpam: enable multilib
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
X-List-Received-Date: Thu, 27 Dec 2012 14:28:16 -0000

Fix the following warning:
WARNING: QA Issue: lib32-libpam: Files/directories were installed but not shipped
  /usr/sbin/unix_chkpwd
  /usr/sbin/pam_tally2
  /usr/sbin/mkhomedir_helper
  /usr/sbin/unix_update
  /usr/sbin/pam_timestamp_check
  /usr/sbin/pam_tally

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index fae0467..93c98c0 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--with-db-uniquename=_pam \
 
 CFLAGS_append = " -fPIC "
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
@@ -66,12 +66,13 @@ python populate_packages_prepend () {
     pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
 
     do_split_packages(d, pam_libdir, '^pam(.*)\.so$', 'pam-plugin%s', 'PAM plugin for %s', extra_depends='')
-    pam_plugin_append_file('pam-plugin-unix', pam_sbindir, 'unix_chkpwd')
-    pam_plugin_append_file('pam-plugin-unix', pam_sbindir, 'unix_update')
-    pam_plugin_append_file('pam-plugin-tally', pam_sbindir, 'pam_tally')
-    pam_plugin_append_file('pam-plugin-tally2', pam_sbindir, 'pam_tally2')
-    pam_plugin_append_file('pam-plugin-timestamp', pam_sbindir, 'pam_timestamp_check')
-    pam_plugin_append_file('pam-plugin-mkhomedir', pam_sbindir, 'mkhomedir_helper')
+    mlprefix = d.getVar('MLPREFIX', True) or ''
+    pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
+    pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
+    pam_plugin_append_file('%spam-plugin-tally' % mlprefix, pam_sbindir, 'pam_tally')
+    pam_plugin_append_file('%spam-plugin-tally2' % mlprefix, pam_sbindir, 'pam_tally2')
+    pam_plugin_append_file('%spam-plugin-timestamp' % mlprefix, pam_sbindir, 'pam_timestamp_check')
+    pam_plugin_append_file('%spam-plugin-mkhomedir' % mlprefix, pam_sbindir, 'mkhomedir_helper')
     do_split_packages(d, pam_filterdir, '^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
 }
 
-- 
1.7.11.7



