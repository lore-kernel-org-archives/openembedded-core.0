Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65AB371234
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4ckLL013745
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:17 -0400
Message-ID: <75fa3742d92bca2b3c6bc4ead45ab1807f1c7722.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/18] images: introduce core-image-kernel-dev
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:47 -0000
Content-Type: text/plain

When building a new kernel, or testing and update to the kernel there
are a set of packages that are sensitive to APIs, build system and
other changes associated with the kernel.

After building this recipe, we can be reasonably sure that a new kernel
package and coupled userspace have been built, installed and tested
via a single image.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-extended/images/core-image-kernel-dev.bb

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
new file mode 100644
index 000000000000..7f95f63f5973
--- /dev/null
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A development image that builds the kernel and packages that are \
+sensitive to kernel updates and version changes"
+
+# Could also be core-image-basic, but we'll keep this small for now
+require recipes-core/images/core-image-minimal.bb
+
+# Note: you must have meta-skeleton in your bblayers to build hello-mod
+KERNEL_DEV_MODULE ?= "hello-mod"
+KERNEL_DEV_UTILS ?= "dropbear"
+KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile"
+
+CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
+                             ${KERNEL_DEV_UTILS} \
+                             ${KERNEL_DEV_TOOLS} \
+                             "
+                             
-- 
1.8.1.2


