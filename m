Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2866B7B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTN0H026621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:29:23 -0400 (EDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:22 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:30:03 -0500
Message-ID: <1376512209-11622-6-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 05/11] package_rpm.bbclass: NO_RECOMMENDATIONS support
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:23 -0000
Content-Type: text/plain

Add NO_RECOMMENDATIONS support.  A way to disable all recommended
packages from being installed.  This will help shrink the size of
the resulting filesystem.

Add documentation on NO_RECOMMENDATIONS and BAD_RECOMMENDATIONS.

Note, using NO_RECOMMENDATIONS has side effects such that kernel-modules may
not have been installed.  A user will need to manually add to their image
any kernel-modules required to be on the image for functionality.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 3 +++
 meta/conf/bitbake.conf           | 1 +
 meta/conf/documentation.conf     | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 74ae0ed..ee01aab 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -357,6 +357,9 @@ EOF
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._tmppath=/install/tmp
 		package_write_smart_config ${target_rootfs}
 		# Do the following configurations here, to avoid them being saved for field upgrade
+		if [ "x${NO_RECOMMENDATIONS}" = "x1" ]; then
+			smart --data-dir=$1/var/lib/smart config --set ignore-all-recommends=1
+		fi
 		for i in ${PACKAGE_EXCLUDE}; do
 			smart --data-dir=$1/var/lib/smart flag --set exclude-packages $i
 		done
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 07eb473..43acc07 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -753,6 +753,7 @@ COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 SERIAL_CONSOLE ??= ""
 SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"
 
+NO_RECOMMENDATIONS ?= ""
 BAD_RECOMMENDATIONS ?= ""
 
 # Make sure MACHINE isn't exported
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index b930611..e83981c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -114,6 +114,9 @@ SYSVINIT_ENABLED_GETTYS[doc] = "Specify which VTs should be running a getty, the
 IPK_FEED_URIS[doc] = "List of ipkg feed records to put into generated image."
 FEED_DEPLOYDIR_BASE_URI[doc] = "Allow to serve ipk deploy dir as an adhoc feed (bogofeed). Set to base URL of the dir as exported by HTTP. Set of adhoc feed configs will be generated in image."
 
+BAD_RECOMMENDATIONS[doc] = "List of packages to not install if recommended.  These will still be installed if required."
+NO_RECOMMENDATIONS[doc] = "When set to 1, no recommended packages will be installed.  Note: some recommended packages may be required for certain system functionality, such as kernel-modules.  It is up to the user to add packages to IMAGE_INSTALL as needed."
+
 IMAGE_INSTALL[doc] = "Used by an image recipe to list the packages to be installed.  See PACKAGE_INSTALL."
 
 PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation, if required an error will be generated."
-- 
1.8.1.2.545.g2f19ada


