Return-Path: <william.c.randle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2423B601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 22:26:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Mar 2016 15:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,413,1455004800"; d="scan'208";a="947581394"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.0.231])
	by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2016 15:26:39 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 15:26:39 -0700
Message-Id: <1459290399-9789-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCHv3] man: fix src/Makefile to work with parallel make
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
X-List-Received-Date: Tue, 29 Mar 2016 22:26:58 -0000

The Makefile for man has a rule to create two generated targets with
a program run from the shell. Because the rule was run twice, with
parallel make, the generated files were being overwritten at the same
time they were being compiled. This patch forces the rule to be run
only once.

[YOCTO #9333]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
v3: clean up patch submission for mailing list

 .../man/man/man-1.6g-parallel.patch                | 30 ++++++++++++++++++++++
 meta/recipes-extended/man/man_1.6g.bb              |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-extended/man/man/man-1.6g-parallel.patch

diff --git a/meta/recipes-extended/man/man/man-1.6g-parallel.patch b/meta/recipes-extended/man/man/man-1.6g-parallel.patch
new file mode 100644
index 0000000..72a88b8
--- /dev/null
+++ b/meta/recipes-extended/man/man/man-1.6g-parallel.patch
@@ -0,0 +1,30 @@
+The Makefile for man has a rule to create two generated targets with
+a program run from the shell. Because the rule was run twice, with
+parallel make, the generated files were being overwritten at the same
+time they were being compiled. This patch forces the rule to be run
+only once.
+
+Upstream-Status: Pending
+
+Signed-off-by: Bill Randle <william.c.randle at intel.com>
+
+--- man-1.6g/src/Makefile.in.orig	2010-12-31 12:28:46.000000000 -0800
++++ man-1.6g/src/Makefile.in	2016-03-28 09:09:16.845458798 -0700
+@@ -43,8 +43,10 @@
+ makemsg:
+ 	$(BUILD_CC) -o makemsg makemsg.c
+ 
+-msg.c gripedefs.h: ../msgs/mess.en makemsg
++msg.c gripedefs.h: genfiles-stamp
++genfiles-stamp: ../msgs/mess.en makemsg
+ 	./makemsg ../msgs/mess.en gripedefs.h msg.c
++	touch genfiles-stamp
+ 
+ # glob.c does not have prototypes
+ glob.o: glob.c ndir.h
+@@ -117,4 +119,4 @@
+ 
+ spotless: clean
+ 	rm -f Makefile config.status paths.h version.h man.conf
+-	rm -f gripedefs.h msg.c mess.*.cat
++	rm -f gripedefs.h msg.c mess.*.cat genfiles-stamp
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index fa4736b..9b057b6 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -53,6 +53,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
            file://manpath.5.gz;unpack=false \
            file://man-1.6g-whatis3.patch \
            file://configure_sed.patch \
+           file://man-1.6g-parallel.patch \
 "
 
 SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
-- 
2.5.0


