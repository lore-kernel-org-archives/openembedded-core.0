Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F2D2775773
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:07:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 15 Sep 2015 06:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,536,1437462000"; d="scan'208";a="805565745"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2015 06:05:27 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 16:05:26 +0300
Message-Id: <1442322326-10462-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Bogdan Voiculescu <bogdanx.a.voiculescu@intel.com>
Subject: [PATCH] rpm: search for gpg if gpg2 is not found
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
X-List-Received-Date: Tue, 15 Sep 2015 13:07:12 -0000

Some (host) systems only have a binary named 'gpg' (e.g. Fedora) while
some only have 'gpg2' (Ubuntu) and others have both of them (openSUSE).
Currently the behavior of rpm-native with regards to GnuPG depends on
the host platform: rpm(-native) is configured to use GnuPG binary of the
host system if 'gpg2' is found in $PATH. Otherwise, rpm(-native) will
default to using '%{_bindir}/gpg2' which will be pointing to a sysroot
binary which usually does not exist.

This patch changes rpm to look for both 'gpg' and 'gpg2' when searching
for the GnuPG binary in PATH. This makes possible to create signed RPM
packages on different host platforms, using the GnuPG binary of the
host, without the need to explicitly define the gpg binary in bitbake
configuration (via GPG_BIN variable).

[YOCTO #8134]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 .../configure.ac-check-for-both-gpg2-and-gpg.patch | 29 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch

diff --git a/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch b/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
new file mode 100644
index 0000000..f5db167
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
@@ -0,0 +1,29 @@
+configure.ac: search for both gpg2 and gpg
+
+On some platforms the GnuPG binary is named 'gpg2' whereas others have 'gpp'.
+This patch increases compatibility by searching for 'gpg' in addition to
+'gpg2'.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6746b4c..f6922ae 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -562,7 +562,7 @@ AC_PATH_PROG(__DIFF, diff, /bin/diff, $MYPATH)
+ AC_PATH_PROG(__DITTO, ditto, %{_bindir}/ditto, $MYPATH)
+ AC_PATH_PROG(__FILE, file, %{_bindir}/file, $MYPATH)
+ AC_PATH_PROG(__GIT, git, %{_bindir}/git, $MYPATH)
+-AC_PATH_PROG(__GPG, gpg2, %{_bindir}/gpg2, $MYPATH)
++AC_PATH_PROGS(__GPG, [gpg2 gpg], %{_bindir}/gpg2, $MYPATH)
+ AC_PATH_PROG(__GSR, gsr, %{_bindir}/gsr, $MYPATH)
+ AC_PATH_PROG(__GST_INSPECT, gst-inspect-0.10, %{_bindir}/gst-inspect-0.10, $MYPATH)
+ AC_PATH_PROG(__GZIP, gzip, /bin/gzip, $MYPATH)
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 1f9a4bd..b450c6f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -98,6 +98,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-check-rootpath-reasonableness.patch \
 	   file://rpm-macros.in-disable-external-key-server.patch \
 	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
+	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
2.1.4


