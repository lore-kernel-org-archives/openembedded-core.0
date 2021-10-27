Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C41C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456827"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:26 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617197"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/36] patch.bbclass: when the patch fails show
 more info on the fatal error
Date: Wed, 27 Oct 2021 23:16:29 +0800
Message-Id: 
 <0b57a6f07a2d69f809120f1bc1988738c35c095b.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157537

From: Jose Quaresma <quaresma.jose@gmail.com>

There are situations when the user have the 'patchdir' defined
as a parameter on SRC_URI. However he doesn't know that with this
the patch is applied relatively to the receipe source dir 'S'.

- When user have 'patchdir' defined check if this directory exist.
- If the patch fails show addition info to the user:
  - Import: show the striplevel
  - Resolver: show the expanded 'patchdir' to the user.

The next example is from opencv in meta-oe layer, here the
patch is applied on the target directory ${WORKDIR}/git/contrib.

S = "${WORKDIR}/git"
SRCREV_FORMAT = "opencv_contrib"
SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
           git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=../contrib \
           "

* When the patch fail there are no message that indicates the real reason.
  patchdir=../no-found-on-file-system

ERROR: opencv-4.5.2-r0 do_patch: Command Error: 'quilt --quiltrc /build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Applying patch 0001-sfm-link-with-Glog_LIBS.patch
can't find file to patch at input line 37
Perhaps you used the wrong -p or --strip option?

* The check of the patchdir will add a new fatal error
  when the user specifies a wrong path than don't exist.
  patchdir=../no-found-on-file-system

ERROR: opencv-4.5.2-r0 do_patch: Target directory '/build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/git/../no-found-on-file-system' not found, patchdir '../no-found-on-file-system' is incorrect in patch file '0001-sfm-link-with-Glog_LIBS.patch'

* When we can't aplly the patch but the patchdir exist,
  show the expanded patchdir on fatal error.
  patchdir=../git

ERROR: opencv-4.5.2-r0 do_patch: Applying patch '0001-sfm-link-with-Glog_LIBS.patch' on target directory '/build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/git/../git'
Command Error: 'quilt --quiltrc /build/tmp/work/core2-64-poky-linux/opencv/4.5.2-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Applying patch 0001-sfm-link-with-Glog_LIBS.patch
can't find file to patch at input line 37
Perhaps you used the wrong -p or --strip option?

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c44bc7c0fb8b7c2e44dd93607a3bfd9733e1df80)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/patch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index cd491a563d..72bb1eb946 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -131,6 +131,9 @@ python patch_do_patch() {
             patchdir = parm["patchdir"]
             if not os.path.isabs(patchdir):
                 patchdir = os.path.join(s, patchdir)
+            if not os.path.isdir(patchdir):
+                bb.fatal("Target directory '%s' not found, patchdir '%s' is incorrect in patch file '%s'" %
+                    (patchdir, parm["patchdir"], parm['patchname']))
         else:
             patchdir = s
 
@@ -147,12 +150,12 @@ python patch_do_patch() {
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal(str(exc))
+            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], str(exc)))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal(str(e))
+            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, str(e)))
 
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']
-- 
2.31.1


