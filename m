Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGIh7-0004bT-6Z
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 02:08:09 +0200
Received: by padfa11 with SMTP id fa11so1004293pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 16:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6MTVmgvKpeLmHmTEzUT11GiQSI8ulslgYQt7m1pgACY=;
	b=tQ73QpTXj8xwwPY/PgyrlLqP5lbDrxB9e6ej2flMxIBQgVBLqimjRNQvIPg+KjE1RZ
	LBiGeSVxKQ8WFas+NQhgRu+3PIE3gE4SvzOE5hAm9Bs3em5xXHbzNWqraQGCoELHrJ1I
	Z7K95Wj9t2/gCTt29/35irAYfaXYoUif1yCNcja0GZ3U7v9aR/o9NiovagiWhXYWx3a4
	fiUHGmuGdBpjExNIRf0n5et6JIO404JS8jYNjqWF2tCUx5hj9fOQyb6GAfQSmE50JFwb
	jgDSrokeTu3CIhvldp9sVjs6xk8su1BKxc6zITaxWYOnjCGRy67iQ2oF0HUxkAYpVOCZ
	qT2A==
Received: by 10.66.90.1 with SMTP id bs1mr36334093pab.13.1348530920160;
	Mon, 24 Sep 2012 16:55:20 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ox5sm10326470pbc.75.2012.09.24.16.55.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 16:55:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 16:55:10 -0700
Message-Id: <1348530910-9917-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] jpeg-native: Do not use libtool-cross for native recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 00:08:09 -0000

This fixes errors when building native recipes like below
Additionally fix some space issues.

 /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool:
line 981: /work/yocto/poky/build/tmp/sysroots/x86_64-linux//bin/sed: No
such file or directory
| x86_64-linux-libtool: compile: Failed to create `.libs'
| make[1]: *** [jaricom.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
|
/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool:
line 981: /work/yocto/poky/build/tmp/sysroots/x86_64-linux//bin/sed: No
such file or directory
|
/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool:
line 981: /work/yocto/poky/build/tmp/sysroots/x86_64-linux//bin/sed: No
such file or directory
| x86_64-linux-libtool: compile: Failed to create `.libs'
| x86_64-linux-libtool: compile: Failed to create `.libs'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/jpeg/jpeg_8d.bb |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/jpeg/jpeg_8d.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
index 6781619..1f6366b 100644
--- a/meta/recipes-core/jpeg/jpeg_8d.bb
+++ b/meta/recipes-core/jpeg/jpeg_8d.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 DEPENDS = "libtool-cross"
 DEPENDS_virtclass-native = "libtool-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
 	   file://debian-libjpeg7_7-1.diff \
@@ -22,8 +22,10 @@ SRC_URI[sha256sum] = "00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a80
 
 inherit autotools 
 
-EXTRA_OECONF="--enable-static --enable-shared"
-EXTRA_OEMAKE='"LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"'
+EXTRA_OECONF = "--enable-static --enable-shared"
+EXTRA_OEMAKE = '"LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"'
+
+EXTRA_OEMAKE_class-native = ""
 
 CFLAGS_append = " -D_REENTRANT"
 
-- 
1.7.9.5



