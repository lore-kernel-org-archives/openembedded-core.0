Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Z1loNlhYGruSXZWrb0roGAUqG/3KW6QAiSR1/YIlpqx3l8TQu3dueZ/uzeol9RsoDF4I3yPsJg
 UWo7owk2E4uQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392485"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392485"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:35 -0800
IronPort-SDR: y6Ycmgat7EucfrS528dePkzumc5NJob6nkuLT15Am6TJ9KxOtTzlP4dqUgAvJHNGwE6XAKLM+X
 zL4yeP8IgKjQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413803"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/20] image_types_wic: Move wic working directory
Date: Fri, 22 Jan 2021 00:21:59 +0800
Message-Id: <28d2e131555372a79499746057468cb18db69d69.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

By default the wic working directory is placed under the output
directory. When invoking wic under bitbake, the wic output directory is
added to PSEUDO_PATHS_IGNORE to avoid issues with files being removed
from outside a pseudo environment (see oe-core commit ad8f5532ff).

However, wic will copy the rootfs directory into its working directory
if it needs to add or remove content before creating a filesystem image.
This copy of the rootfs directory must be tracked by pseudo in order to
keep the permissions correct in the resulting image. So we can't have
the wic working directory under a path in PSEUDO_PATHS_IGNORE unless
we like broken permissions.

To fix this the new '-w' argument to wic is used to move the working
directory away from the output directory.

Note that wic deletes the temporary working directory automatically
when it finishes creating an image so users won't normally see the
'tmp-wic' directory under WORKDIR.

Fixes [Yocto #14129]

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d07169499c47fa9dc759e6f81843416a6dc25c5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image_types_wic.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 000ee4249f..49be1da77a 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -29,11 +29,17 @@ WIC_CREATE_EXTRA_ARGS ?= ""
 IMAGE_CMD_wic () {
 	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
 	build_wic="${WORKDIR}/build-wic"
+	tmp_wic="${WORKDIR}/tmp-wic"
 	wks="${WKS_FULL_PATH}"
+	if [ -e "$tmp_wic" ]; then
+		# Ensure we don't have any junk leftover from a previously interrupted
+		# do_image_wic execution
+		rm -rf "$tmp_wic"
+	fi
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
-	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
-- 
2.29.2

