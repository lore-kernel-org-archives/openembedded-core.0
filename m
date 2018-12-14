Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id B81847BDB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 18:15:26 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBEIFQfP015909
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 19:15:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1544811326;
	bh=2iZroZvGhwfTqFLSLLp3ERj/dbE9Cz1zHQgeJtP++ME=; l=3159;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FVcVoJRKNLGsRdFbtW3RpAOUZNRpvh8IDRptgrX+7EcW4ke6AOzjpkGBoSWQWHwfM
	wUOQhO+4pjqG8D1KYBmgdTisNww8UnTLrVDVaQQ5cvFD1u/qP4PhAX+JfGGm3N9iNa
	/MvAJbNzCXUuaxCo8HrVny/+3/XTvHf6T+9ntnJE=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBEIFJW2004131 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 14 Dec 2018 19:15:19 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 3CED8686BC6;
	Fri, 14 Dec 2018 19:15:53 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBEIFAR6004117
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 14 Dec 2018 19:15:10 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.91) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1gXrzS-006VbI-E8; Fri, 14 Dec 2018 19:15:10 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:14:30 +0100
Message-Id: <20181214181430.1517643-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
References: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] pseudo: build with recent attr
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
X-List-Received-Date: Fri, 14 Dec 2018 18:15:27 -0000
Content-Transfer-Encoding: 8bit

Recent attr package removed <attr/xattr.h> which is shipped by libc
for a very long time already.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ...001-use-sys-xattr.h-not-attr-xattr.h.patch | 54 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch b/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch
new file mode 100644
index 0000000000..5eddea5ba1
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-use-sys-xattr.h-not-attr-xattr.h.patch
@@ -0,0 +1,54 @@
+From 7132668ce2409e0919a79d6f236827665f068427 Mon Sep 17 00:00:00 2001
+From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+Date: Fri, 14 Dec 2018 18:41:04 +0100
+Subject: [PATCH, pseudo] use <sys/xattr.h>, not <attr/xattr.h>
+
+<attr/xattr.h> has been removed from recent attr package:
+
+   The xattr syscalls are provided by glibc since ages, so there is
+   no need to use the indirect system call "syscall" anymore. This
+   removes the need for the <attr/xattr.h> header; use <sys/xattr.h>
+   instead.
+
+   http://git.savannah.nongnu.org/cgit/attr.git/commit/include?id=7921157890d07858d092f4003ca4c6bae9fd2c38
+
+For Linux, we have to include <attr/attributes.h> to define ENODATA.
+
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+---
+Upstream-Status: pending
+
+ ports/linux/subports         | 4 ++--
+ ports/linux/xattr/portdefs.h | 3 ++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/ports/linux/subports b/ports/linux/subports
+index a29044a..44e0e9e 100755
+--- a/ports/linux/subports
++++ b/ports/linux/subports
+@@ -29,11 +29,11 @@ fi
+ if	$port_xattr; then
+ 	cat > dummy.c <<EOF
+ #include <sys/types.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ int i;
+ EOF
+ 	if ! ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
+-		echo >&2 "Warning: Can't compile trivial program using <attr/xattr.h>".
++		echo >&2 "Warning: Can't compile trivial program using <sys/xattr.h>".
+ 		echo >&2 "         xattr support will require that header."
+ 	fi
+ 	echo "linux/xattr"
+diff --git a/ports/linux/xattr/portdefs.h b/ports/linux/xattr/portdefs.h
+index 367ca60..bb577f1 100644
+--- a/ports/linux/xattr/portdefs.h
++++ b/ports/linux/xattr/portdefs.h
+@@ -1,2 +1,3 @@
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
++#include <attr/attributes.h>
+ #include <stdint.h>
+-- 
+2.19.2
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 79e0b6bd21..a0147d2d19 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://fallback-group \
            file://moreretries.patch \
            file://toomanyfiles.patch \
+           file://0001-use-sys-xattr.h-not-attr-xattr.h.patch \
            "
 
 SRCREV = "6294b344e5140f5467e6860f45a174440015304e"
-- 
2.19.2


