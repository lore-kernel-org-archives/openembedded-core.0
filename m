Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UDRgN-00061A-0Q
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 04:39:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r273NK9j023476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2013 19:23:20 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 6 Mar 2013 19:23:18 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2013 11:26:13 +0800
Message-ID: <f8e82b58a65714faefef626ae62e5678b0bce209.1362556792.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1362556792.git.liezhi.yang@windriver.com>
References: <cover.1362556792.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] rootfs_xxx.bbclass: fix bitbake -S hashes mismatch error
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
X-List-Received-Date: Thu, 07 Mar 2013 03:39:54 -0000
Content-Type: text/plain

The bitbake -S <image> has errors, e.g.:

NOTE: Reparsing files to collect dependency data
ERROR: Bitbake's cached basehash does not match the one we just generated
(/buildarea/lyang1/poky/meta/recipes-core/images/core-image-minimal.bb.do_rootfs)!
ERROR: The mismatched hashes were 8e44f2296f2d6cdf2ccb0236910ef59b and
46357d5e36713646b47b0fe2233e3c8c

This is caused by the BUILDNAME which is defined in cooker.py:

if not self.configuration.data.getVar("BUILDNAME"):
    self.configuration.data.setVar("BUILDNAME", time.strftime('%Y%m%d%H%M'))

The time changes during the first parsing and reparsing, so there is the
error, we already have:

do_rootfs[vardepsexclude] += "BUILDNAME"

but what we need is
rootfs_xxx_do_rootfs[vardepsexclude] +=  "BUILDNAME"

The do_rootfs doesn't depend on BUILDNAME directly, but indirectly, the
depends tree is:

do_rootfs -> rootfs_xxx_do_rootfs -> BUILDNAME

So add BUILDNAME to rootfs_xxx_do_rootfs[vardepsexclude] would fix the
problem.

[YOCTO #3299]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/rootfs_deb.bbclass | 2 +-
 meta/classes/rootfs_ipk.bbclass | 2 +-
 meta/classes/rootfs_rpm.bbclass | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index a3c3767..abc9f3b 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -7,7 +7,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
-do_rootfs[vardepsexclude] += "BUILDNAME"
+rootfs_deb_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index a609944..e38ba86 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -11,7 +11,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk"
-do_rootfs[vardepsexclude] += "BUILDNAME"
+rootfs_ipk_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 3442d48..8392a1e 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -24,7 +24,7 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
 do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
-do_rootfs[vardepsexclude] += "BUILDNAME"
+rootfs_rpm_do_rootfs[vardepsexclude] += "BUILDNAME"
 
 RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; "
 RPM_POSTPROCESS_COMMANDS = "rpm_setup_smart_target_config; "
-- 
1.7.11.2



