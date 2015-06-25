Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C12E475A33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 15:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5PF9Qv7004462; Thu, 25 Jun 2015 16:09:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9CIkNA4yuiPQ; Thu, 25 Jun 2015 16:09:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5PF9ECO004444
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 25 Jun 2015 16:09:25 +0100
Message-ID: <1435244954.10583.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 16:09:14 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "markus.Lehtonen" <markus.Lehtonen@intel.com>, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Subject: [PATCH] lib/devtool/standard: Fix patch cleanup
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
X-List-Received-Date: Thu, 25 Jun 2015 15:09:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If patches fail to apply with git, quilt it used as a fallback. If that
happens, the code in this class is meant to handle cleanup of these patch
files. In the case where ${S} is a subdir of the git tree, the code doesn't
correctly set the patches directory.

This change correctly sets the patches directory (which is different to the
location of the git repository).

[YOCTO #7911]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4d3ff02..ea21877 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -299,6 +299,7 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         logger.info('Unpacking...')
         task_executor.exec_func('do_unpack', False)
         srcsubdir = crd.getVar('S', True)
+        patchsubdir = srcsubdir
         if srcsubdir == workdir:
             # Find non-patch sources that were "unpacked" to srctree directory
             recipe_patches = [os.path.basename(patch) for patch in
@@ -319,7 +320,7 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
         scriptutils.git_convert_standalone_clone(srcsubdir)
 
-        patchdir = os.path.join(srcsubdir, 'patches')
+        patchdir = os.path.join(patchsubdir, 'patches')
         haspatches = False
         if os.path.exists(patchdir):
             if os.listdir(patchdir):



