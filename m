Return-Path: <kad@kad.name>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 385FE60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 09:47:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Apr 2016 02:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="689831326"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2016 02:47:29 -0700
Received: from akanevsk-mac01.fi.intel.com (akanevsk-mac01.fi.intel.com
	[10.237.68.34])
	by linux.intel.com (Postfix) with ESMTP id 3A6F16A4006;
	Thu, 21 Apr 2016 03:35:05 -0700 (PDT)
From: "Alexander D. Kanevskiy" <kad@kad.name>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 12:47:27 +0300
Message-Id: <1461232047-5393-1-git-send-email-kad@kad.name>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] image.bbclass: don't execute compression commands multiple times
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
X-List-Received-Date: Thu, 21 Apr 2016 09:47:29 -0000

In case of chained conversion methods are used via COMPRESS_CMD_*
there is chance that some of steps would be executed multiple times.

[YOCTO #9482]

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
---
 meta/classes/image.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8bfd241..5d6f4a3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -398,9 +398,13 @@ python () {
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
-                    cmds.append("\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True))
+                    cmd = "\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True)
+                    if cmd not in cmds:
+                        cmds.append(cmd)
                     vardeps.add('COMPRESS_CMD_' + ctype)
-                    subimages.append(type + "." + ctype)
+                    subimage = type + "." + ctype
+                    if subimage not in subimages:
+                        subimages.append(subimage)
                     if type not in alltypes:
                         rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"))
 
-- 
2.8.1


