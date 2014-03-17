Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF4E6F465
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:30:47 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id e16so3554116lan.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1ksIM16F45gUFqQDnphWmoyPobZkIUjVH+u8N041l/4=;
	b=GP9pC1c7N3URKVPompJuXtxYc0Fiohv2lujk8A1Rex7idhqqd4/peLcVXmNKeE3z0G
	aJJx8+uK1Lo6dqLOerzHyOrQmuMHIJu8gxsFs49fuQkS2we96GSDBikXsr+qqgLSI/6e
	1D2SsXhpHNsGnkdg35jeMa1DHjlaBFftANM5DSTZuyYkvD8Lnud4a1eL3P0eGAH522Lz
	Av5+11ABlVAn2emTj+gbCCL6Ne/L9iA907Y0NnSTOk4ZJGcFNF0ZFRaCd9ig9+7fbaXF
	hzrK0PaMgaCqUoyc+DYWuUqPPgSX1zJvp0iHeGLe7ywz9EqIabs4mUwiV11hso/Wv5wu
	qgSw==
X-Received: by 10.112.151.146 with SMTP id uq18mr776638lbb.38.1395048647477;
	Mon, 17 Mar 2014 02:30:47 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217]) by mx.google.com with ESMTPSA id
	kz7sm13124728lab.16.2014.03.17.02.30.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Mar 2014 02:30:46 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com
Date: Mon, 17 Mar 2014 10:30:37 +0100
Message-Id: <1395048637-22413-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1395048637-22413-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1395048637-22413-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2 v2] package_manager: Use apt-ftparchive for deb packages
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
X-List-Received-Date: Mon, 17 Mar 2014 09:30:50 -0000

Use apt-ftparchive to create a Release file compatible with SecureApt.

apt-ftparchive is also a more efficient replacement of
dpkg-scanpackages:

root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
_64# time PSEUDO_UNLOAD=1 apt-ftparchive packages . >/tmp/kkk
real 0m26.873s
user 0m20.968s
sys 0m1.212s

root@neopili:~/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/bobcat
_64# time PSEUDO_UNLOAD=1 dpkg-scanpackages . >/tmp/kkk
dpkg-scanpackages: info: Wrote 6022 entries to output Packages file.
real 0m59.721s
user 0m16.668s
sys 0m11.164s

apt-ftparchive is not compatible with libpseudo. The calls to ftw()
returns the path in absolute format instead of relative. This
produces
wrong Packages and Release files.

ie:
MD5Sum:
d20227a958f6870137ce0e41b7b84307             1453
/home/ricardo/curro/qtec/qt5022/build-qt5022-cesium/build/tmp/deploy/deb/all/Release

This is why it is called with PSEUDO_UNLOAD.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

This v2 is a port of the previous patch (package_deb: Use apt-ftparchive) to master

This patch HAS NOT BEEN TESTED on master, just on dora. I do not have a working build
system for my platform with master.

 meta/lib/oe/package_manager.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1279b50..ec96bb3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -180,7 +180,7 @@ class DpkgIndexer(Indexer):
         if sdk_pkg_archs is not None:
             arch_list += sdk_pkg_archs.split()
 
-        dpkg_scanpackages = bb.utils.which(os.getenv('PATH'), "dpkg-scanpackages")
+        apt_ftparchive = bb.utils.which(os.getenv('PATH'), "apt-ftparchive")
         gzip = bb.utils.which(os.getenv('PATH'), "gzip")
 
         index_cmds = []
@@ -190,11 +190,17 @@ class DpkgIndexer(Indexer):
             if not os.path.isdir(arch_dir):
                 continue
 
+            index_cmds.append("cd %s; PSEUDO_UNLOAD=1 %s packages > Packages" %
+                              (arch_dir, apt_ftparchive))
+
+            index_cmds.append("cd %s; %s Packages -c > Packages.gz" %
+                              (arch_dir, gzip))
+
             with open(os.path.join(arch_dir, "Release"), "w+") as release:
                 release.write("Label: %s" % arch)
 
-            index_cmds.append("cd %s; %s . | %s > Packages.gz" %
-                              (arch_dir, dpkg_scanpackages, gzip))
+            index_cmds.append("cd %s; PSEUDO_UNLOAD=1 %s release >> Release" %
+                              (arch_dir, apt_ftparchive))
 
             deb_dirs_found = True
 
-- 
1.9.0


