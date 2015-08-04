Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB7EE759C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 13:59:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t74Dx5G5015389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Aug 2015 06:59:05 -0700 (PDT)
Received: from brucehead.corp.ad.wrs.com (128.224.56.8) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 4 Aug 2015 06:59:05 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Aug 2015 09:58:53 -0400
Message-ID: <1438696733-234279-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH] linux-libc-headers: exclude drm headers from sysroot
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
X-List-Received-Date: Tue, 04 Aug 2015 13:59:10 -0000
Content-Type: text/plain

While diagnosing a problem with xf86-video-intel I noticed we had two
copies of drm headers in the sysroot; one from here and one from
the libdrm package.   The xf86-video-intel turned out to be another
thing, but that doesn't mean we want two copies in the sysroot with
different content and luck of include path indicating which one we
get.

This one landed in usr/include/drm and the libdrm one put its files
at usr/include/libdrm, so there was no obvious over-write conflict.

The obvious risk here would be unearthing implicit dependencies on
the libdrm; things trying to build before it has populated the sysroot
but two full highly parallel builds containing a full desktop graphics
suite did not show any issues.

Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 566bc1e6154b..bda9d3f765ed 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -61,6 +61,10 @@ do_install() {
 	# Kernel should not be exporting this header
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
 
+	# if we take drm from the kernel, and a different set from libdrm
+	# at different paths in the sysroot, then mayhem can result.
+	rm -rf ${D}${exec_prefix}/include/drm
+
 	# The ..install.cmd conflicts between various configure runs
 	find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
-- 
1.8.2.3


