Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1S0ZBD-0000iR-3r
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 14:57:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Feb 2012 05:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111195105"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2012 05:49:32 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 21:48:08 +0800
Message-Id: <453fb96940c40cdcf3a5d0ffda4a4a6b3580e9da.1330003047.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330003047.git.dongxiao.xu@intel.com>
References: <cover.1330003047.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1330003047.git.dongxiao.xu@intel.com>
References: <cover.1330003047.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/3] meta-hob: Add a new meta-hob layer
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
X-List-Received-Date: Thu, 23 Feb 2012 13:57:55 -0000

This new layer contains hob-image.bb and hob-toolchain.bb that
are used by hob to build images or toolchain.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta-hob/COPYING.MIT                        |   17 +++++++++++++++++
 meta-hob/conf/layer.conf                    |    9 +++++++++
 meta-hob/recipes-core/images/hob-image.bb   |    1 +
 meta-hob/recipes-core/meta/hob-toolchain.bb |   10 ++++++++++
 4 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-hob/COPYING.MIT
 create mode 100644 meta-hob/conf/layer.conf
 create mode 100644 meta-hob/recipes-core/images/hob-image.bb
 create mode 100644 meta-hob/recipes-core/meta/hob-toolchain.bb

diff --git a/meta-hob/COPYING.MIT b/meta-hob/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-hob/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/meta-hob/conf/layer.conf b/meta-hob/conf/layer.conf
new file mode 100644
index 0000000..5f5eb82
--- /dev/null
+++ b/meta-hob/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH := "${BBPATH}:${LAYERDIR}"
+
+# We have a packages directory, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
+
+BBFILE_COLLECTIONS += "hob"
+BBFILE_PATTERN_hob := "^${LAYERDIR}/"
+BBFILE_PRIORITY_hob = "1"
diff --git a/meta-hob/recipes-core/images/hob-image.bb b/meta-hob/recipes-core/images/hob-image.bb
new file mode 100644
index 0000000..c8d6f49
--- /dev/null
+++ b/meta-hob/recipes-core/images/hob-image.bb
@@ -0,0 +1 @@
+inherit image
diff --git a/meta-hob/recipes-core/meta/hob-toolchain.bb b/meta-hob/recipes-core/meta/hob-toolchain.bb
new file mode 100644
index 0000000..6535253
--- /dev/null
+++ b/meta-hob/recipes-core/meta/hob-toolchain.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "dummy toolchain"
+LICENSE = "MIT"
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+IMAGETEST ?= "dummy"
+inherit populate_sdk imagetest-${IMAGETEST}
-- 
1.7.4.1



