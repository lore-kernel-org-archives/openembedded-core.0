Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6AB784B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 19:08:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 12:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,379,1498546800"; d="scan'208";a="1206006167"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 12:08:48 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 12:08:28 -0700
Message-Id: <20170815190828.82873-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20170815190828.82873-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170815190828.82873-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] build-appliance-image: include proxy on pip3 installation
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
X-List-Received-Date: Tue, 15 Aug 2017 19:08:47 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Otherwise, we get timeouts, leading to errors:

    pip._vendor.requests.exceptions.ConnectTimeout: HTTPSConnectionPool(host='pypi.python.org', port=443): Max retries exceeded with url: /pypi/pip/json (Caused by ConnectTimeoutError(<pip._vendor.requests.packages.urllib3.connection.VerifiedHTTPSConnection object at 0x7ff741bb3ef0>, 'Connection to pypi.python.org timed out. (connect timeout=5)'))
    WARNING: TOPDIR/tmp/work/qemux86-poky-linux/build-appliance-image/15.0.0-r0/temp/run.do_populate_poky_src.185123:1 exit 1 from 'pip3 install --user -I -U -v -r TOPDIR/tmp/work/qemux86-poky-linux/build-appliance-image/15.0.0-r0/rootfs/home/builder/poky/bitbake/toaster-requirements.txt'
    DEBUG: Python function do_image finished

Complete log at [1]

[1] http://errors.yoctoproject.org/Errors/Build/43393/

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 927a9310ac..e0566f4300 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -101,7 +101,11 @@ fakeroot do_populate_poky_src () {
 	export STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
 	export HOME=${IMAGE_ROOTFS}/home/builder
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/.cache/pip
-	pip3 install --user -I -U -v -r ${IMAGE_ROOTFS}/home/builder/poky/bitbake/toaster-requirements.txt
+	pip3_install_params="--user -I -U -v -r ${IMAGE_ROOTFS}/home/builder/poky/bitbake/toaster-requirements.txt"
+	if [ -n ${http_proxy} ]; then
+	   pip3_install_params="${pip3_install_params} --proxy ${http_proxy}"
+	fi
+	pip3 install ${pip3_install_params}
 	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.local
 	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.cache
 }
-- 
2.12.3


