Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81CEB65D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 09:28:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9F9St8a022445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 02:28:56 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 15 Oct 2014 02:28:55 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Oct 2014 05:28:54 -0400
Message-ID: <1413365334-374-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] mtools: fix broken /usr/bin/lz
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
X-List-Received-Date: Wed, 15 Oct 2014 09:28:55 -0000
Content-Type: text/plain

From: Wenlin Kang <wenlin.kang@windriver.com>

When build fs with mtools-3.9.9, has file /usr/bin/lz in rootfs,
it is the symlink to uz:

root@qemu3:~# /usr/bin/lz
-sh: /usr/bin/lz: No such file or directory
$root@qemu3:~# ls -l /usr/bin/lz
lrwxrwxrwx 1 root root 2 Jul 18 18:07 /usr/bin/lz -> uz
root@qemu3:~# uz
-sh: uz: command not found

But the uz isn't actually exist, so the result is that lz is a
broken symlink.

The root cause is that uz hasn't been installed when install-scripts.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch | 16 ++++++++++++++++
 meta/recipes-devtools/mtools/mtools_3.9.9.bb            |  4 +++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch

diff --git a/meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch b/meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch
new file mode 100644
index 0000000..eaa3a5f
--- /dev/null
+++ b/meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Backport
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+
+diff -uarN mtools-3.9.9-org/Makefile.in mtools-3.9.9/Makefile.in
+--- mtools-3.9.9-org/Makefile.in	2014-08-05 16:10:25.782241173 +0800
++++ mtools-3.9.9/Makefile.in	2014-08-05 16:11:30.864155951 +0800
+@@ -250,7 +250,7 @@
+ install-scripts: ${DESTDIR}$(bindir)/mtools
+ 	@$(top_srcdir)/mkinstalldirs ${DESTDIR}$(bindir)
+ 	@for j in $(SCRIPTS) ; do \
+-		$(INSTALL_SCRIPT) $(srcdir)/scripts/$$j ${DESTDIR}$(bindir)/$$j ; \
++		$(INSTALL_PROGRAM) $(srcdir)/scripts/$$j ${DESTDIR}$(bindir)/$$j ; \
+ 		echo ${DESTDIR}$(bindir)/$$j ; \
+ 	done
+ 	rm -f ${DESTDIR}$(bindir)/lz
diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index d995c8f..f6dd336 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -31,7 +31,9 @@ RRECOMMENDS_${PN} = "\
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
 	file://mtools-makeinfo.patch \
 	file://mtools.patch \
-	file://no-x11.patch"
+	file://no-x11.patch \
+	file://fix-broken-lz.patch \
+"
 
 SRC_URI[md5sum] = "3e68b857b4e1f3a6521d1dfefbd30a36"
 SRC_URI[sha256sum] = "af083a73425d664d4607ef6c6564fd9319a0e47ee7c105259a45356cb834690e"
-- 
2.0.0


