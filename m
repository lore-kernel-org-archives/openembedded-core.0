Return-Path: <christian.thaler@tes-dst.com>
X-Greylist: delayed 500 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Sep 2019 12:27:41 UTC
Received: from mail.tes-dst.com (mail.tes-dst.com [212.6.170.45])
	by mail.openembedded.org (Postfix) with ESMTP id D08497E58B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 12:27:41 +0000 (UTC)
Received: from mail.tes-dst.com (localhost [127.0.0.1])
	by mail.tes-dst.com (Postfix) with ESMTPS id 9ACBE52051E;
	Tue, 24 Sep 2019 14:19:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.tes-dst.com (Postfix) with ESMTP id 8D7E3520517;
	Tue, 24 Sep 2019 14:19:21 +0200 (CEST)
Received: from mail.tes-dst.com ([127.0.0.1])
	by localhost (mail.tes-dst.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id n0fXJMLJsy6P; Tue, 24 Sep 2019 14:19:21 +0200 (CEST)
Received: from tesvm.hamburg.tes (unknown [172.20.10.181])
	by mail.tes-dst.com (Postfix) with ESMTPSA id 6A7A25204A1;
	Tue, 24 Sep 2019 14:19:21 +0200 (CEST)
From: Christian Thaler <christian.thaler@tes-dst.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 14:18:53 +0200
Message-Id: <1569327533-1511-1-git-send-email-christian.thaler@tes-dst.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] kernel-devsrc: check for localversion files in the kernel source tree
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
X-List-Received-Date: Tue, 24 Sep 2019 12:27:42 -0000

localversion files are ignored. This might lead to a bad version magic when
building out-of-tree modules via SDK.
(Backport from master https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/linux/kernel-devsrc.bb?id=59fcee90de0cbb5b6b8333ab2b0e36214b174e52)

Signed-off-by: Christian Thaler <christian.thaler@tes-dst.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 361ad21..ec5cf09 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -62,6 +62,12 @@ do_install() {
 	cd ${S}
 	cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*") $kerneldir/build
 	cp --parents $(find  -type f -name "Build" -o -name "Build.include") $kerneldir/build
+
+	# Copy localversion file if any to keep correct version magic after
+	# modules_prepare.
+	if [ -f *localversion* ]; then
+	    cp *localversion* $kerneldir/build
+	fi
     )
 
     # then drop all but the needed Makefiles/Kconfig files
@@ -213,6 +219,9 @@ do_install() {
 
         # required to build scripts/selinux/genheaders/genheaders
         cp -a --parents security/selinux/include/* $kerneldir/build/
+
+	# copy any localversion files
+	cp -a localversion* $kerneldir/build/ 2>/dev/null || :
     )
 
     # Make sure the Makefile and version.h have a matching timestamp so that
-- 
2.7.4


