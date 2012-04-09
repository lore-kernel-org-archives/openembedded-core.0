Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SHNCw-0003s7-3J
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 00:37:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2012 15:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151641390"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2012 15:27:52 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	yocto@yoctoproject.org
Date: Mon,  9 Apr 2012 15:27:50 -0700
Message-Id: <7ad20802c01b5cea250e0fc9d31f603674c4b4fa.1334010389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1334010389.git.nitin.a.kamble@intel.com>
References: <cover.1334010389.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] tclibc-eglibc.inc: make locale packages dependency conditional
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
X-List-Received-Date: Mon, 09 Apr 2012 22:37:10 -0000

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
1.7.7



