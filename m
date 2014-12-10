Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C256D72369
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYHCN024243
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:17 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:16 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:05 -0500
Message-ID: <749cf0afffcedb367784904decf6ba7517e44286.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207154.git.bruce.ashfield@windriver.com>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] images: introduce core-image-kernel-dev
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:17 -0000
Content-Type: text/plain

When building a new kernel, or testing and update to the kernel there
are a set of packages that are sensitive to APIs, build system and
other changes associated with the kernel.

After building this recipe, we can be reasonably sure that a new kernel
package and coupled userspace have been built, installed and tested
via a single image.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-extended/images/core-image-kernel-dev.bb

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
new file mode 100644
index 000000000000..d14f658726ab
--- /dev/null
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A development image that builds the kernel and packages that are \
+sensitive to kernel updates and version changes"
+
+# Could also be core-image-basic, but we'll keep this small for now
+require recipes-core/images/core-image-minimal.bb
+
+KERNEL_DEV_UTILS ?= "dropbear"
+KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
+KERNEL_DEV_MODULE ?= ""
+
+CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
+                             ${KERNEL_DEV_UTILS} \
+                             ${KERNEL_DEV_TOOLS} \
+                            "
+
+# We need extra space for things like kernel builds, etc.
+IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
-- 
2.1.0


