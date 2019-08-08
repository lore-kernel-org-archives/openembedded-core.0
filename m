Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE2847F2E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 20:24:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x78KNxfN001132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 13:24:15 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 13:24:02 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 25EEFAA4824;
	Thu,  8 Aug 2019 13:24:02 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 13:23:57 -0700
Message-ID: <20190808202400.60710-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2 1/4] image_types_wic.bbclass: Copy the .wks and .env files to deploy image dir
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
X-List-Received-Date: Thu, 08 Aug 2019 20:24:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When using a .wks.in file, the only place that the generated .wks file
exists in the tmp/work area.  A copy should be left behind in the
deploy directory so that you can easily run the wic tool to
re-generate or modify a new image without running bitbake.  Custom
.wks.in files can reference any number of bitbake variables, so it is
important to save the result.

below is an example of using the generated .wks file in the deploy
area.  The full name of my generated .wks file was
core-image-minimal-ostree-uboot-ab.wks, but since you usually only
have a single .wks file per image you can use a wild card like:

  cd tmp*/deploy/images/*
  wic create --vars . -e core-image-minimal -s -m core-image-minimal-*.wks

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/image_types_wic.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 519aeb1b04..f350dc2723 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -77,6 +77,11 @@ python do_write_wks_template () {
     wks_file = d.getVar('WKS_FULL_PATH')
     with open(wks_file, 'w') as f:
         f.write(template_body)
+    f.close()
+    # Copy the finalized wks file to the deploy directory for later use
+    depdir = d.getVar('IMGDEPLOYDIR')
+    basename = d.getVar('IMAGE_BASENAME')
+    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
 }
 
 python () {
@@ -105,7 +110,7 @@ python () {
                 # file in process_wks_template as well, so just put it in
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
-                bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
+                bb.build.addtask('do_write_wks_template', 'do_image_wic', 'do_image', d)
         bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
 }
 
@@ -127,6 +132,10 @@ python do_rootfs_wicenv () {
             value = d.getVar(var)
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
+    envf.close()
+    # Copy .env file to deploy directory for later use with stand alone wic
+    depdir = d.getVar('IMGDEPLOYDIR')
+    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
-- 
2.21.0


