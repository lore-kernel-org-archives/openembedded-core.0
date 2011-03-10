Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxj8A-0004G1-7b
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 17:54:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Mar 2011 08:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,297,1297065600"; d="scan'208";a="611382768"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2011 08:52:35 -0800
Message-Id: <cd3ef3b1e6b5801f6b7e121fb0ddf6ec2ce79746.1299775598.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299775598.git.sgw@linux.intel.com>
References: <cover.1299775598.git.sgw@linux.intel.com>
Old-Date: Thu, 10 Mar 2011 17:27:55 +0800
Date: Thu, 10 Mar 2011  8:52:33 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Liping Ke <liping.ke@intel.com>
Subject: [PATCH 8/8] Disable wget server side cache
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
X-List-Received-Date: Thu, 10 Mar 2011 16:54:30 -0000

From: Liping Ke <liping.ke@intel.com>

We found some proxy server has wrong cache for long http file name.
It will cause fetching wrong ipk files from adt repo. To avoid this,
we use wget options --no-cache to disable all server side cache.
It will make the fetch speed slower, yet correct always.

Signed-off-by: Liping Ke <liping.ke@intel.com>
Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../installer/adt-installer_1.0.bb                 |    3 ++-
 .../installer/files/wget_cache.patch               |   10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/installer/files/wget_cache.patch

diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 50290f9..ff7afe6 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -36,11 +36,13 @@ PR = "r0"
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
 YOCTOADT_VERSION = "${SDK_VERSION}"
+S = "${WORKDIR}/trunk"
 
 inherit deploy
 
 PV = "0.1.8+svnr${SRCPV}"
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
+           file://wget_cache.patch \
            file://adt_installer \
            file://scripts/adt_installer_internal \
            file://scripts/util \
@@ -70,7 +72,6 @@ fakeroot do_deploy () {
 	cp ${WORKDIR}/adt_installer.tar.bz2 ${ADT_DEPLOY}
 }
 
-do_patch[noexec] = "1"
 do_install[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
diff --git a/meta/recipes-devtools/installer/files/wget_cache.patch b/meta/recipes-devtools/installer/files/wget_cache.patch
new file mode 100644
index 0000000..6fd38e5
--- /dev/null
+++ b/meta/recipes-devtools/installer/files/wget_cache.patch
@@ -0,0 +1,10 @@
+--- trunk/libopkg/opkg_download.c	2011-03-10 16:41:29.000000000 +0800
++++ trunk/libopkg/opkg_download.c	2011-03-10 16:42:33.000000000 +0800
+@@ -162,6 +162,7 @@
+ 
+       argv[i++] = "wget";
+       argv[i++] = "-q";
++      argv[i++] = "--no-cache";
+       if (conf->http_proxy || conf->ftp_proxy) {
+ 	argv[i++] = "-Y";
+ 	argv[i++] = "on";
-- 
1.7.1.1



