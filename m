Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6C371D42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:04:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2017 05:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="1099197216"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2017 05:04:18 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 7C2F56A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:03:20 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:40:30 +0200
Message-Id: <82076d1cf5ff440d13cbdda33a26fa53ab074286.1485434085.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485434085.git.ed.bartosh@linux.intel.com>
References: <cover.1485434085.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 02/14] grub-efi: set default desination dir
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
X-List-Received-Date: Thu, 26 Jan 2017 13:04:18 -0000

Function efi_populate requires mandatory parameter DESTDIR.
It makes it impossible to call this function from python code
using bb.build.exec_func as there is no way to pass parameters
this way.

Set default value of DESTDIR to ${WORKDIR}/efi. This destination
will be used in image-wic.bbclass to install EFI artifacts.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/grub-efi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 3dc9146..48b4b34 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -36,7 +36,7 @@ inherit fs-uuid
 efi_populate() {
 	# DEST must be the root of the image so that EFIDIR is not
 	# nested under a top level directory.
-	DEST=$1
+	DEST=${1-${WORKDIR}/efi}
 
 	install -d ${DEST}${EFIDIR}
 
-- 
2.1.4


