Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7527B76639
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 08:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u148VCdR003452 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 08:31:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3vzXxbSZ4Dft
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 08:31:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u148V7rO003449
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 08:31:08 GMT
Message-ID: <1454574667.27087.233.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Feb 2016 08:31:07 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] patchelf: Add patch to handle large files
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
X-List-Received-Date: Thu, 04 Feb 2016 08:31:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There were "maximum size exceeded" errors from patchelf when processing
qemu-native. There is an issue open for this upstream, add a patch 
proposed there for this issue. "32" was increased to "64" to handle our 
qemu-ppc binary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/patchelf/patchelf/maxsize.patch b/meta/recipes-devtools/patchelf/patchelf/maxsize.patch
new file mode 100644
index 0000000..cc04a89
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/maxsize.patch
@@ -0,0 +1,30 @@
+From f6886c2c33a1cf8771163919f3d20f6340c0ce38 Mon Sep 17 00:00:00 2001
+From: Eelco Dolstra <eelco.dolstra@logicblox.com>
+Date: Fri, 10 Jul 2015 18:12:37 +0200
+Subject: [PATCH] Quick fix for #47
+
+https://github.com/NixOS/patchelf/issues/47
+
+Avoid issues with holes in binaries such as qemu-pcc from qemu-native.
+
+Upstream-Status: Submitted
+RP
+2016/2/3
+
+---
+ src/patchelf.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 8566ed9..df75593 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -248,7 +248,7 @@ static void readFile(string fileName, mode_t * fileMode)
+     if (stat(fileName.c_str(), &st) != 0) error("stat");
+     fileSize = st.st_size;
+     *fileMode = st.st_mode;
+-    maxSize = fileSize + 8 * 1024 * 1024;
++    maxSize = fileSize + 64 * 1024 * 1024;
+ 
+     contents = (unsigned char *) malloc(fileSize + maxSize);
+     if (!contents) abort();
\ No newline at end of file
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.8.bb b/meta/recipes-devtools/patchelf/patchelf_0.8.bb
index c1b87f5..8484a7e 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.8.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.8.bb
@@ -1,4 +1,5 @@
-SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
+           file://maxsize.patch"
 LICENSE = "GPLv3"
 SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
 



