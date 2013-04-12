Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UQk49-0001xm-6N
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 21:55:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3CJbsAh024838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 12:37:55 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 12 Apr 2013 12:37:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Apr 2013 14:42:13 -0500
Message-ID: <1365795733-25014-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] hello-mod: Ensure the produced package name begins with kernel-module-
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
X-List-Received-Date: Fri, 12 Apr 2013 19:55:31 -0000
Content-Type: text/plain

The special key kernel-module- is necessary for the system to avoid a package
rename when installing a multilib image.  For example:

local.conf: IMAGE_INSTALL_append = " hello-mod"

bitbake lib32-core-image-minimal

The system will translate names and prepend 'lib32-', unless the package
begins with kernel-module-.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index 64a6dda..621f700 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -13,3 +13,11 @@ SRC_URI = "file://Makefile \
           "
 
 S = "${WORKDIR}"
+
+# Kernel module packages MUST begin with 'kernel-module-', otherwise
+# multilib image generation can fail.
+#
+# The following line is only necessary if the recipe name does not begin
+# with kernel-module-.
+#
+PKG_${PN} = "kernel-module-${PN}"
-- 
1.8.1.2.545.g2f19ada



