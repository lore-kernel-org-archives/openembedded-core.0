Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4D967F349
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 12:55:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x78CtBmH021329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 05:55:11 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 05:55:11 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 51B25AA4823;
	Thu,  8 Aug 2019 05:55:11 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 05:55:06 -0700
Message-ID: <20190808125509.120784-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/4] image_types_wic.bbclass: Copy the .wks and .env files to deploy image dir
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
X-List-Received-Date: Thu, 08 Aug 2019 12:55:10 -0000
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
 meta/classes/image_types_wic.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 519aeb1b04..ce94138b3c 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -77,6 +77,11 @@ python do_write_wks_template () {
     wks_file = d.getVar('WKS_FULL_PATH')
     with open(wks_file, 'w') as f:
         f.write(template_body)
+    f.close()
+    # Copy the finalized wks file to the deploy directory for later use
+    depdir = d.getVar('DEPLOY_DIR_IMAGE')
+    basename = d.getVar('IMAGE_BASENAME')
+    bb.utils.copyfile(wks_file, "%s/%s" % (depdir, basename + '-' + os.path.basename(wks_file)))
 }
 
 python () {
@@ -127,6 +132,10 @@ python do_rootfs_wicenv () {
             value = d.getVar(var)
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
+    envf.close()
+    # Copy to deploy directory for later use with stand alone wic
+    depdir = d.getVar('DEPLOY_DIR_IMAGE')
+    bb.utils.copyfile(os.path.join(outdir, basename) + '.env', os.path.join(depdir, basename) + '.env')
 }
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
-- 
2.21.0


