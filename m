Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63B94725C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 05:47:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBT5lcSJ011431
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 28 Dec 2014 21:47:38 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Dec 2014 21:47:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 29 Dec 2014 13:47:22 +0800
Message-ID: <9a695a050fe7af96c88b7c993019a85c7e111caf.1419823474.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419823473.git.hongxu.jia@windriver.com>
References: <cover.1419823473.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] groff: upgrade 1.22.3
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
X-List-Received-Date: Mon, 29 Dec 2014 05:47:41 -0000
Content-Type: text/plain

Rebase groff-1.22.2-correct-man.local-install-path.patch to 1.22.3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...off-1.22.2-correct-man.local-install-path.patch | 32 ---------------
 .../groff-correct-man.local-install-path.patch     | 45 ++++++++++++++++++++++
 .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |  6 +--
 3 files changed, 48 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-correct-man.local-install-path.patch
 rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (90%)

diff --git a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
deleted file mode 100644
index f7e9a74..0000000
--- a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Correct the install path of man.local to fix following error:
-    /yocto/build/tmp/sysroots/x86_64-linux/usr/share/groff/1.22.2/tmac/an-old.tmac:690: warning: can't find macro file `man.local'
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-Upstream-Status: Pending
-
---- groff-1.22.2/tmac/Makefile.sub.orig	2013-02-07 20:06:08.000000000 +0800
-+++ groff-1.22.2/tmac/Makefile.sub	2013-06-26 19:11:23.572259001 +0800
-@@ -114,9 +114,9 @@
- 	  rm -f $(DESTDIR)$(mdocdir)/$$f; \
- 	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
- 	done
--	-test -f $(DESTDIR)$(localtmacdir)/man.local || \
-+	-test -f $(DESTDIR)$(tmacdir)/man.local || \
- 	  $(INSTALL_DATA) $(srcdir)/man.local \
--	    $(DESTDIR)$(localtmacdir)/man.local
-+	    $(DESTDIR)$(tmacdir)/man.local
- 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local || \
- 	  $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
- 
-@@ -158,9 +158,9 @@
- 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
- 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
- 	-rm -f $(DESTDIR)$(tmacdir)/www.tmac
--	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
-+	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
- 	           $(srcdir)/man.local; then \
--	  rm -f $(DESTDIR)$(localtmacdir)/man.local; \
-+	  rm -f $(DESTDIR)$(tmacdir)/man.local; \
- 	fi
- 	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
- 	           $(srcdir)/mdoc.local; then \
diff --git a/meta/recipes-extended/groff/groff-1.22.3/groff-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.3/groff-correct-man.local-install-path.patch
new file mode 100644
index 0000000..e5db6cf
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.22.3/groff-correct-man.local-install-path.patch
@@ -0,0 +1,45 @@
+Correct the install path of man.local to fix following error:
+
+ /yocto/build/tmp/sysroots/x86_64-linux/usr/share/groff/1.22.2/tmac/an-old.tmac:690:
+ warning: can't find macro file `man.local'
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+Upstream-Status: Pending
+
+Rebase to 1.22.3
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tmac/Makefile.sub | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tmac/Makefile.sub b/tmac/Makefile.sub
+index 1506232..f1468c5 100644
+--- a/tmac/Makefile.sub
++++ b/tmac/Makefile.sub
+@@ -121,9 +121,9 @@ install_data: $(NORMALFILES) $(SPECIALFILES) man.local \
+ 	  $(RM) $(DESTDIR)$(mdocdir)/$$f; \
+ 	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
+ 	done
+-	-test -f $(DESTDIR)$(localtmacdir)/man.local \
++	-test -f $(DESTDIR)$(tmacdir)/man.local \
+ 	  || $(INSTALL_DATA) $(srcdir)/man.local \
+-	       $(DESTDIR)$(localtmacdir)/man.local
++	       $(DESTDIR)$(tmacdir)/man.local
+ 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local \
+ 	  || $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
+ 
+@@ -164,9 +164,9 @@ uninstall_sub:
+ 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
+ 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
+ 	$(RM) $(DESTDIR)$(tmacdir)/www.tmac
+-	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
++	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
+ 	           $(srcdir)/man.local; then \
+-	  $(RM) $(DESTDIR)$(localtmacdir)/man.local; \
++	  $(RM) $(DESTDIR)$(tmacdir)/man.local; \
+ 	fi
+ 	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
+ 	           $(srcdir)/mdoc.local; then \
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
similarity index 90%
rename from meta/recipes-extended/groff/groff_1.22.2.bb
rename to meta/recipes-extended/groff/groff_1.22.3.bb
index 63f0425..22c0946 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -9,11 +9,11 @@ PR = "r1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
-	file://groff-1.22.2-correct-man.local-install-path.patch \
+	file://groff-correct-man.local-install-path.patch \
 "
 
-SRC_URI[md5sum] = "9f4cd592a5efc7e36481d8d8d8af6d16"
-SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a13d2076"
+SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
+SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5"
 
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
-- 
1.9.1


