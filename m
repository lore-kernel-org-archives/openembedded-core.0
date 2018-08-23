Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA4E79506
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:56:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7N7usES000605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:56:54 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 00:56:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:07:27 +0800
Message-ID: <3b9562e49fad08bde7eff868be27af6d4439cb29.1535011588.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011588.git.liezhi.yang@windriver.com>
References: <cover.1535011588.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] psplash: Clean up getstatusoutput usage
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
X-List-Received-Date: Thu, 23 Aug 2018 07:56:53 -0000
Content-Type: text/plain

Replace usage of oe.utils.getstatusoutput() with direct subprocess calls.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index aab2c03..3ad1ef4 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -73,6 +73,8 @@ ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
 
 python do_compile () {
     import shutil
+    import subprocess
+    import shlex
 
     # Build a separate executable for each splash image
     workdir = d.getVar('WORKDIR')
@@ -82,8 +84,7 @@ python do_compile () {
     outputfiles = d.getVar('SPLASH_INSTALL').split()
     for localfile, outputfile in zip(localfiles, outputfiles):
         if localfile.endswith(".png"):
-            outp = oe.utils.getstatusoutput('%s %s POKY' % (convertscript, os.path.join(workdir, localfile)))
-            print(outp[1])
+            subprocess.call(shlex.split('%s %s POKY' % (convertscript, os.path.join(workdir, localfile))))
             fbase = os.path.splitext(localfile)[0]
             shutil.copyfile("%s-img.h" % fbase, destfile)
         else:
-- 
2.7.4


