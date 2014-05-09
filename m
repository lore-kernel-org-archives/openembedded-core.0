Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 797F665F45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 12:29:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 May 2014 05:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1018,1389772800"; d="scan'208";a="536453549"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2014 05:29:26 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 May 2014 15:29:06 +0300
Message-Id: <1399638546-27715-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH][dora] bitbake: hob: sync after image deploy
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
X-List-Received-Date: Fri, 09 May 2014 12:29:57 -0000

Showing "Deploy image successful" after 'dd' returns
may determine the user to disconnect the usb stick even
though the writing operations are not finished.
This patch makes sure that the entire image is deployed
on the usb stick before the user is informed about any result.

This patch was merged in 1.6. Alex Georgescu thinks it would be
nice to add it to dora also.

[YOCTO #5892]

(Bitbake rev: cc98b19112ab875ebc7cb604cd96acadac4cbf21)

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/ui/crumbs/hig/deployimagedialog.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/ui/crumbs/hig/deployimagedialog.py b/bitbake/lib/bb/ui/crumbs/hig/deployimagedialog.py
index bc1efbb..1d57b27 100644
--- a/bitbake/lib/bb/ui/crumbs/hig/deployimagedialog.py
+++ b/bitbake/lib/bb/ui/crumbs/hig/deployimagedialog.py
@@ -166,7 +166,7 @@ class DeployImageDialog (CrumbsDialog):
                 if cmdline:
                     tmpfile = tempfile.NamedTemporaryFile()
                     cmdline += "\"sudo dd if=" + self.image_path + \
-                                " of=" + combo_item + "; echo $? > " + tmpfile.name + "\""
+                                " of=" + combo_item + " && sync; echo $? > " + tmpfile.name + "\""
                     subprocess.call(shlex.split(cmdline))
 
                     if int(tmpfile.readline().strip()) == 0:
-- 
1.9.1


