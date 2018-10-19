Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05F7D79C6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 02:38:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9J2bRhM019969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2018 19:37:37 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 18 Oct 2018 19:37:24 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2018 10:37:23 +0800
Message-ID: <1539916643-171209-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] buildtools-tarball: add nativesdk-rpcsvc-proto
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
X-List-Received-Date: Fri, 19 Oct 2018 02:38:03 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Fedora28 repackages rpcgen program to rpcgen
package and the program will no longer be
part of the glibc-common package.
fedora 28:
$ rpm -qf /usr/bin/rpcgen
rpcgen-1.3.1-4.fc28.x86_64

fedora 27:
$ rpm -qf /usr/bin/rpcgen
glibc-common-2.26-27.fc27.x86_64

Once build a project on fedora28 host without
installing the extra rpcgen package, there
comes below error:
ERROR: Unable to start bitbake server
ERROR: Last 10 lines of server log for this session (/yocto/builds/upgrade2/bitbake-cookerdaemon.log):
    self.cooker = bb.cooker.BBCooker(self.configuration, self.featureset)
  File "/yocto/poky/bitbake/lib/bb/cooker.py", line 197, in __init__
    self.initConfigurationData()
  File "/yocto/poky/bitbake/lib/bb/cooker.py", line 356, in initConfigurationData
    self.databuilder.parseBaseConfiguration()
  File "/yocto/poky/bitbake/lib/bb/cookerdata.py", line 317, in parseBaseConfiguration
    raise bb.BBHandledException
bb.BBHandledException
ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:
  rpcgen

So add nativesdk-rpcsvc-proto to provide the
program rpcgen to fix the gap.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 7ab7907..91df6f1 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -24,6 +24,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-ca-certificates \
     nativesdk-texinfo \
     nativesdk-libnss-nis \
+    nativesdk-rpcsvc-proto \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.7.4


