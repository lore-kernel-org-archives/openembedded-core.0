Return-Path: <d.falko@partner.samsung.com>
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
	[210.118.77.12])
	by mail.openembedded.org (Postfix) with ESMTP id B40A06FFEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 12:42:09 +0000 (UTC)
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
	by mailout2.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0O8X00FGP1Y860A0@mailout2.w1.samsung.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2016 13:42:08 +0100 (BST)
X-AuditID: cbfec7f4-f796c6d000001486-d7-5763f0209e3a
Received: from eusync3.samsung.com ( [203.254.199.213])
	by eucpsbgm1.samsung.com (EUCPMTA) with SMTP id 4E.BD.05254.020F3675;
	Fri, 17 Jun 2016 13:42:08 +0100 (BST)
Received: from falko-work.rnd.samsung.ru ([106.109.129.11])
	by eusync3.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTPA id <0O8X0084D1Y12470@eusync3.samsung.com>; Fri,
	17 Jun 2016 13:42:08 +0100 (BST)
From: Dmitriy Falko <d.falko@partner.samsung.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:41:36 +0300
Message-id: <1466167297-19753-1-git-send-email-d.falko@partner.samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMJMWRmVeSWpSXmKPExsVy+t/xq7oKH5LDDS7tl7Q4eHgas8Wdn+/Y
	HZg8zm1cwehx8N0epgCmKC6blNSczLLUIn27BK6M+Z+OsRa8FarYfGs3awNjm0AXIyeHhICJ
	xJe5P5ggbDGJC/fWs3UxcnEICSxllHg7fTMbSEJIoJVJ4utFFhCbTcBQ4k/zQaAGDg4RAR2J
	Nx+9QMLMAvoSn272g80RFrCS+LzsIZjNIqAqseXuW3YQm1fAW+LpxQ9Qu+Qkbp7rZJ7AyL2A
	kWEVo2hqaXJBcVJ6rqFecWJucWleul5yfu4mRohXv+xgXHzM6hCjAAejEg/vCtHkcCHWxLLi
	ytxDjBIczEoivAdeA4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzzt31PkRIID2xJDU7NbUgtQgm
	y8TBKdXAKKKW+tCHe+c1busS15s5Lyewv2Bn9GIsTT/DsFxDQCvW86KL/Krkq9Miavqm/v8Q
	wXDwFse8q/OvTr0ludnnXtWtP9Ymmhk8WU/bRW/tqOX8pZT/1VPgxtfivZdPZjh+au7lPhoi
	LpjklDyxQ3je5vrjLNW61acPr/owt1Wq5PH8N0ftVnkbKLEUZyQaajEXFScCAEpyn6HmAQAA
Subject: [PATCH] Alias _obstack_free to fix binutils build
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
X-List-Received-Date: Fri, 17 Jun 2016 12:42:10 -0000

Binutils as(sembler) trying to referency _obstack_free when building
it for ARM uclibc(not cross compile version).

Enables it(just alias to uclibc obstack_free) to fix build of binutils.

[YOCTO #9781]

Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 ...Alias-_obstack_free-to-fix-binutils-build.patch | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index a56fa7c..ea1d37d 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -6,6 +6,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
 SRC_URI = "git://uclibc-ng.org/git/uclibc-ng \
         file://0001-Disable-lrount_tes-function.patch \
+        file://0001-Alias-_obstack_free-to-fix-binutils-build.patch \
         file://uClibc.machine \
         file://uClibc.distro \
         file://obstack.cfg \
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch
new file mode 100644
index 0000000..8f97ab8
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Alias-_obstack_free-to-fix-binutils-build.patch
@@ -0,0 +1,31 @@
+From f795fc77a2cf90ce77707faddc93a51f736a4553 Mon Sep 17 00:00:00 2001
+From: Dmitriy Falko <d.falko@partner.samsung.com>
+Date: Fri, 17 Jun 2016 11:31:02 +0300
+Subject: [PATCH] Alias _obstack_free to fix binutils build
+
+Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
+---
+ libc/misc/gnu/obstack.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
+index 38cfd83..2689263 100644
+--- a/libc/misc/gnu/obstack.c
++++ b/libc/misc/gnu/obstack.c
+@@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void *obj)
+     abort ();
+ }
+
+-# if 0
++
+ /* Older versions of libc used a function _obstack_free intended to be
+    called by non-GCC compilers.  */
+ strong_alias (obstack_free, _obstack_free)
+-# endif
++
+
+ int
+ _obstack_memory_used (struct obstack *h)
+--
+2.7.4
+
-- 
2.7.4


