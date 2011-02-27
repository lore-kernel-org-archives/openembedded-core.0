Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcy8-0007DK-8X
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:12 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:51 -0800 (PST)
Received: by 10.216.60.193 with SMTP id u43mr1075545wec.103.1298798990595;
	Sun, 27 Feb 2011 01:29:50 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r57sm1284343wes.25.2011.02.27.01.29.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:24 +0100
Message-Id: <f0a74608d51dd4c81aae4fbadb840b326b788c08.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 18/50] package.bbclass: Use hard link for package split instead of copy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Feb 2011 09:31:12 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

When doing package split, we use hard link instead of copy, which can
save about 10% disk space when building poky-image-minimal.

If fail, it will fall back to the copyfile function.

[Updated by Richard to use os.link and avoid an exec() call per file]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package.bbclass |   15 +++------------
 1 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index dcece40..2f3e9bf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -427,22 +427,13 @@ python populate_packages () {
 			fpath = os.path.join(root,file)
 			dpath = os.path.dirname(fpath)
 			bb.mkdirhier(dpath)
-
-			# Check if this is a hardlink to something... if it is
-			# attempt to preserve the link information, instead of copy.
 			if not os.path.islink(file):
-				s = os.stat(file)
-				if s.st_nlink > 1:
-					file_reference = "%d_%d" % (s.st_dev, s.st_ino)
-					if file_reference not in file_links:
-						# Save the reference for next time...
-						file_links[file_reference] = fpath
-					else:
-						os.link(file_links[file_reference], fpath)
-						continue
+				os.link(file, fpath)
+				continue
 			ret = bb.copyfile(file, fpath)
 			if ret is False or ret == 0:
 				raise bb.build.FuncFailed("File population failed")
+
 		del localdata
 	os.chdir(workdir)
 
-- 
1.6.6.1



