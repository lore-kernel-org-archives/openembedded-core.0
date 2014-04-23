Return-Path: <christian.charreyre@cioinfoindus.fr>
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
	[80.12.242.124])
	by mail.openembedded.org (Postfix) with ESMTP id 0222C65D04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:41:32 +0000 (UTC)
Received: from localhost.localdomain ([109.208.223.182]) by mwinf5d56 with ME
	id tLhV1n00B3wkFtH03LhZmM; Wed, 23 Apr 2014 10:41:33 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0aWFuLmNoYXJyZXlyZS5jaW9Ad2FuYWRvby5mcg==
X-ME-Date: Wed, 23 Apr 2014 10:41:33 +0200
X-ME-IP: 109.208.223.182
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Apr 2014 10:41:31 +0200
Message-Id: <1398242491-2373-1-git-send-email-christian.charreyre@cioinfoindus.fr>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] tree: new recipe for version 1.6.0
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
X-List-Received-Date: Wed, 23 Apr 2014 08:41:33 -0000

This patch creates the recipe for the command tree, which is a recursive
directory listing command that produces a depth indented listing of files,
which is colorized ala dircolors if the LS_COLORS environment variable is
set and output is to tty

Signed-off-by: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
---
 .../tree/tree/0001-adapt-Makefile.patch            |   44 ++++++++++++++++++++
 meta/recipes-support/tree/tree_1.6.0.bb |   15 +++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
 create mode 100644 meta/recipes-support/tree/tree_1.6.0.bb

diff --git a/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch b/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
new file mode 100644
index 0000000..bcc19c9
--- /dev/null
+++ b/meta/recipes-support/tree/tree/0001-adapt-Makefile.patch
@@ -0,0 +1,44 @@
+Adapt Makefile to cross compilation and tool environment
+
+Index: tree-1.6.0/Makefile
+===================================================================
+--- tree-1.6.0.orig/Makefile	2011-06-24 16:25:27.000000000 +0200
++++ tree-1.6.0/Makefile	2014-04-22 16:53:14.817331834 +0200
+@@ -16,23 +16,23 @@
+ # along with this program; if not, write to the Free Software
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ 
+-prefix = /usr
++prefix = ${DESTDIR}/usr
+ 
+-CC=gcc
++CC ?= gcc
+ 
+ VERSION=1.6.0
+ TREE_DEST=tree
+ BINDIR=${prefix}/bin
+ MAN=tree.1
+-MANDIR=${prefix}/man/man1
++MANDIR=${prefix}/share/man/man1
+ OBJS=tree.o unix.o html.o xml.o hash.o color.o
+ 
+ # Uncomment options below for your particular OS:
+ 
+ # Linux defaults:
+ #CFLAGS=-ggdb -Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+-CFLAGS=-O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+-LDFLAGS=-s
++CFLAGS ?= -O4 -Wall  -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
++LDFLAGS ?= -s
+ 
+ # Uncomment for FreeBSD:
+ #CFLAGS=-O2 -Wall -fomit-frame-pointer
+@@ -97,7 +97,7 @@
+ 	install -d $(BINDIR)
+ 	install -d $(MANDIR)
+ 	if [ -e $(TREE_DEST) ]; then \
+-		install -s $(TREE_DEST) $(BINDIR)/$(TREE_DEST); \
++		install $(TREE_DEST) $(BINDIR)/$(TREE_DEST); \
+ 	fi
+ 	install doc/$(MAN) $(MANDIR)/$(MAN)
+ 
diff --git a/meta/recipes-support/tree/tree_1.6.0.bb b/meta/recipes-support/tree/tree_1.6.0.bb
new file mode 100644
index 0000000..f1ca376
--- /dev/null
+++ b/meta/recipes-support/tree/tree_1.6.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "a recursive directory listing command."
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+
+SRC_URI = "http://mama.indstate.edu/users/ice/${PN}/src/${PN}-${PV}.tgz \
+	file://0001-adapt-Makefile.patch \
+"
+
+SRC_URI[md5sum] = "04e967a3f4108d50cde3b4b0e89e970a"
+SRC_URI[sha256sum] = "4dc470a74880338b01da41701d8db90d0fb178877e526d385931a007d68d7591"
+
+inherit autotools
+
+CFLAGS_append = " -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
1.7.9.5


