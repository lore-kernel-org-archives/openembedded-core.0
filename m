Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHmaV-0002rN-5y
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 03:43:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2012 18:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129434394"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2012 18:33:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 18:33:46 -0700
Message-Id: <ad12e7da22c3eb883b621adc78cea8e2c755739f.1334107957.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (for RC3) 5/5] tclibc-eglibc.inc: make locale packages dependency conditional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 01:43:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Only add locale package dependencies if the eglibc is configured
with locale support.
  This avoids dependencies issues for distros such as poky-tiny

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/tclibc-eglibc.inc |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index 8b8a214..aed82d1 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -23,10 +23,19 @@ LIBC_DEPENDENCIES = "libsegfault \
     		     eglibc-dev \
     		     eglibc-utils \
     		     eglibc-thread-db \
-    		     eglibc-localedata-i18n \
-    		     eglibc-gconv-ibm850 \
-    		     eglibc-gconv-cp1252 \
-    		     eglibc-gconv-iso8859-1 \
-    		     eglibc-gconv-iso8859-15 \
-    		     locale-base-en-us \
-    		     locale-base-en-gb "
+		     ${@get_libc_locales_dependencies(d)}"
+
+LIBC_LOCALE_DEPENDENCIES = "\
+	eglibc-localedata-i18n \
+	eglibc-gconv-ibm850 \
+	eglibc-gconv-cp1252 \
+	eglibc-gconv-iso8859-1 \
+	eglibc-gconv-iso8859-15 \
+	locale-base-en-us \
+	locale-base-en-gb"
+
+def get_libc_locales_dependencies(d):
+    if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or '').split() :
+        return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
+    else:
+        return ''
-- 
1.7.7.6



