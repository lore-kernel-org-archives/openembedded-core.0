Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: H/jRRL1vpUX/li/cyZ34T1Fc3iv3R9V50Tse376UHG71/dR1vukpdddQNnvc8DqtszZ6HyLG5o
 9TIGxKDjTF2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752373"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752373"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:31 -0800
IronPort-SDR: 0LcXt74r/WtXBJRNbFDMC6RdiBJPWj5uY9C2vWvs3IrRvX4jwVVhyv5qP7HJ+qadAssRosmDHB
 o8YffNEl4KNg==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670763"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:30 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/19] image_types: sort tarball file listings
Date: Mon, 14 Dec 2020 11:35:05 +0800
Message-Id: <383fec3f31d9921be1cb9d9880a62fb866fccde7.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Help rootfs tarballs be reproducible by sorting the file listing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4fa68626bbcfd9795577e1426c27d00f4d9d1c17)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 66884af8e0..9a508a911f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -120,7 +120,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.29.2

