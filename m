Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 424D360053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 08:20:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t888Kaas008328
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 01:20:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 01:20:35 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 16:15:12 +0800
Message-ID: <1cf690b74e5ceabf29a819ff0d426937176a06f6.1441700018.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1441700018.git.kai.kang@windriver.com>
References: <cover.1441700018.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] screen: backport to fix build error
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
X-List-Received-Date: Tue, 08 Sep 2015 08:20:39 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile screen rarely with:

|.../4.3.1-r0/screen-4.3.1/display.h:154:19: error: 'T_N' undeclared here (not in a function)
|   union tcu d_tcs[T_N]; /* terminal capabilities */
|                      ^

Macro T_N is defined in header file term.h but it may not be created
then fails. Backport patch to make sure term.h is created before compile
other source codes.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../screen/0002-comm.h-now-depends-on-term.h.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.3.1.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch

diff --git a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch b/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
new file mode 100644
index 0000000..b5d71cc
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Backport
+
+Backport from:
+
+http://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 39c5f1c76f1fcef4b5958bf828a63f53426b6984 Mon Sep 17 00:00:00 2001
+From: Mike Gerwitz <mike@mikegerwitz.com>
+Date: Tue, 24 Dec 2013 22:16:31 -0500
+Subject: [PATCH] comm.h now depends on term.h
+
+---
+ src/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index e791e79..d4f7c0b 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -113,7 +113,7 @@ term.h: term.c term.sh
+ 
+ kmapdef.c: term.h
+ 
+-comm.h: comm.c comm.sh config.h
++comm.h: comm.c comm.sh config.h term.h
+ 	AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh $(srcdir)/comm.sh
+ 
+ docs:
+-- 
+2.4.1
+
diff --git a/meta/recipes-extended/screen/screen_4.3.1.bb b/meta/recipes-extended/screen/screen_4.3.1.bb
index 6aea56d..92457af 100644
--- a/meta/recipes-extended/screen/screen_4.3.1.bb
+++ b/meta/recipes-extended/screen/screen_4.3.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Skip-host-file-system-checks-when-cross-compiling.patch \
            file://Avoid-mis-identifying-systems-as-SVR4.patch \
            file://0001-fix-for-multijob-build.patch \
+           file://0002-comm.h-now-depends-on-term.h.patch \
           "
 
 SRC_URI[md5sum] = "5bb3b0ff2674e29378c31ad3411170ad"
-- 
1.9.1


