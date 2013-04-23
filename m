Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UUddY-0004CD-Gw
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 15:52:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Apr 2013 06:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,533,1363158000"; d="scan'208";a="323566421"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2013 06:34:17 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 16:37:53 +0300
Message-Id: <1366724273-6680-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] rpm: change arch scoring items
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
X-List-Received-Date: Tue, 23 Apr 2013 13:52:04 -0000

Don't add the first line of /etc/rpm/platform to the list of patterns
to match when computing an arch score, use it just for getting
information about the platform (cpu/vendor/os).

[YOCTO #3864]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../rpm/rpm/rpm-platform-file-fix.patch            |   28 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
new file mode 100644
index 0000000..3e14d4d
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
@@ -0,0 +1,28 @@
+Don't add the first line of /etc/rpm/platform to the list of patterns
+to match when computing an arch score, use it just for getting
+information about the platform (cpu/vendor/os). Fixes #3864.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+diff --git a/lib/rpmrc.c b/lib/rpmrc.c
+index e676601..e433faa 100644
+--- a/lib/rpmrc.c
++++ b/lib/rpmrc.c
+@@ -510,17 +510,6 @@ static rpmRC rpmPlatform(const char * platform)
+ #endif
+ 	}
+ 
+-#if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
+-	/* do not use vendor and GNU attribution */
+-	p = rpmExpand("%{_host_cpu}-%{_host_os}", NULL);
+-#else
+-	p = rpmExpand("%{_host_cpu}-%{_host_vendor}-%{_host_os}",
+-		(cvog && *cvog->gnu ? "-" : NULL),
+-		(cvog ? cvog->gnu : NULL), NULL);
+-#endif
+-	xx = mireAppend(RPMMIRE_STRCMP, 0, p, NULL, &mi_re, &mi_nre);
+-	p = _free(p);
+-	
+ 	init_platform++;
+     }
+     rc = (init_platform ? RPMRC_OK : RPMRC_FAIL);
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 7d2cba4..112d11d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r62"
+PR = "r63"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -86,6 +86,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-platform2.patch \
 	   file://rpm-remove-sykcparse-decl.patch \
 	   file://debugedit-segv.patch \
+     file://rpm-platform-file-fix.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.10.4



