Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cGkA3Flg/yevXE/wBuOkzthwNUXXUusA/KGETzrtEG5f7u4ssTL3DR2ucEvZbkPHx/Muw40EmA
 Jczb9nHdWTxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968660"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968660"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:02 -0800
IronPort-SDR: GvHD6DOHgvaEkWdqpssSXzSkwEqH6oDrIrU8kdMODL8tyzEXqfKZ5zab66DL+GozaaiCI1dq6r
 P3VK752Y7LvA==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215485"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:01 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/35] kernel.bbclass: fix deployment for initramfs images
Date: Tue,  9 Feb 2021 23:52:02 +0800
Message-Id: <327317d0162940786ae62ec3da4ae0ea73c81f48.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Awais Belal <Awais_Belal@mentor.com>

The do_bundle_initramfs() only processes kernel image
types that are found in KERNEL_IMAGETYPE_FOR_MAKE whereas
the build system can generate other types that are not
directly supported by the kernel build system. In which
case when we come to the deploy phase not all the images
mentioned in KERNEL_IMAGETYPES would have a respective
initramfs bundled image. An example is using vmlinux.gz
in KERNEL_IMAGETYPES and enabling initramfs and then we
see

install: cannot stat 'arch/arm64/boot/vmlinux.gz.initramfs': No such file or directory

So we align the deploy phase with bundle initramfs phase
and pick up relevant initramfs bundled images using
KERNEL_IMAGETYPE_FOR_MAKE instead of KERNEL_IMAGETYPES.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 526bdd88ccd758204452579333ba188e29270bde)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 1a444efabf..f405b6e523 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -743,7 +743,7 @@ kernel_do_deploy() {
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for imageType in ${KERNEL_IMAGETYPES} ; do
+		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-- 
2.29.2

