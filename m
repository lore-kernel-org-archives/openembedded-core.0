Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id CFABD77277
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:41 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82482932pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7J6EKQKI6S5tGD5aF2nVOtD2k+Z7qtS05KqnuavRUFE=;
	b=yMkJB4ge7B0tTCa0AlqL3cfGNiXysX2tJ5Q2KP2nGCzwXwlksGSXK/jttuMoUlI7G8
	08rPHbUgZWnXSLJVYc6dLIbMduKJE8H8IrkgsDUEN+Vko1BQP9npbFMTRODs2h9B+S1k
	TVxZTTWvoxSVH7nEvsBmsvU7O24K5DyK+c7c28kOrxXm0rfi7Y7aH3WqTrRh0LgWF8Pe
	3UZDgWTHFdFoDgMKwE7nSpOTR9c0k4W97jF1YRlXB1P8tCT3FhXPuJ4tp+YB1bU3iTB2
	IBwwYIBNcoPDnJNwDFEZzK9XtcdB99IFXyA7gWrMhAjkEzS7YKUOBKzWTY9mfXdDVeDl
	H+Ng==
X-Received: by 10.67.4.229 with SMTP id ch5mr26927407pad.79.1447371702367;
	Thu, 12 Nov 2015 15:41:42 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	it10sm16733638pbc.14.2015.11.12.15.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:41 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:41:28 -0700
Message-Id: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1447371049.git.chris_larson@mentor.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] linux-dtb.inc: use absolute upd-alt paths
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

This works around a limitation of the chkconfig update-alternatives, so it
works with all our update-alternatives providers.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index ee3a5e1..5810b10 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -64,7 +64,7 @@ pkg_postinst_kernel-devicetree () {
 	do
 		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
 }
 
@@ -74,6 +74,6 @@ pkg_postrm_kernel-devicetree () {
 	do
 		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+		update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
 }
-- 
2.2.1


