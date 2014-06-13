Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BCA36FE86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 18:55:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5DItFWS022741
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 11:55:15 -0700 (PDT)
Received: from yow-pgortmak-d4.wrs.com (128.224.56.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 13 Jun 2014 11:55:14 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 14:54:45 -0400
Message-ID: <1402685685-35265-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gawk: ensure cross compiling doesn't try to remove host files
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
X-List-Received-Date: Fri, 13 Jun 2014 18:55:23 -0000
Content-Type: text/plain

Fixes [YOCTO #6440]

When cross compiling gawk, it is possible to see this fail:

make[4]: Entering directory '/mnt/home/paul/poky/build/tmp/work/corei7-64-poky-
linux/gawk/4.1.1-r0/build/extension'
for i in filefuncs.la fnmatch.la fork.la inplace.la ordchr.la readdir.la readfi
le.la revoutput.la revtwoway.la rwarray.la testext.la time.la ; do \
        rm -f /usr/lib/gawk/$i ; \
done
rm: cannot remove '/usr/lib/gawk/filefuncs.la': Permission denied
rm: cannot remove '/usr/lib/gawk/fnmatch.la': Permission denied
rm: cannot remove '/usr/lib/gawk/fork.la': Permission denied
rm: cannot remove '/usr/lib/gawk/inplace.la': Permission denied
rm: cannot remove '/usr/lib/gawk/ordchr.la': Permission denied
rm: cannot remove '/usr/lib/gawk/readdir.la': Permission denied
rm: cannot remove '/usr/lib/gawk/readfile.la': Permission denied
rm: cannot remove '/usr/lib/gawk/revoutput.la': Permission denied
rm: cannot remove '/usr/lib/gawk/revtwoway.la': Permission denied
rm: cannot remove '/usr/lib/gawk/rwarray.la': Permission denied
rm: cannot remove '/usr/lib/gawk/testext.la': Permission denied
rm: cannot remove '/usr/lib/gawk/time.la': Permission denied
Makefile:1235: recipe for target 'install-data-hook' failed

The problem only manifests itself on hosts where the above files
are already present; for if they are absent then the rm -f does
not fail with -EPERM.

Before looking in mainline gawk for a fix, I fixed it myself.
Then in comparing with mainline gawk, I found their fix was
not 100% complete.  So here we get a backport of the mainline
gawk commit, plus the delta as a commit that I've sent to the
gawk mailing list.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-extended/gawk/gawk-4.1.1/Use-DESTDIR-in-extension-Makefile.am-when-removing-..patch b/meta/recipes-extended/gawk/gawk-4.1.1/Use-DESTDIR-in-extension-Makefile.am-when-removing-..patch
new file mode 100644
index 000000000000..b8b1fcaea767
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk-4.1.1/Use-DESTDIR-in-extension-Makefile.am-when-removing-..patch
@@ -0,0 +1,56 @@
+From 976f73ab03569bb836aa5c949be1c1cc973b2d2e Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Fri, 11 Apr 2014 07:42:16 +0300
+Subject: [PATCH] Use $(DESTDIR) in extension/Makefile.am when removing .la
+ files.
+
+commit 976f73ab03569bb836aa5c949be1c1cc973b2d2e upstream.
+
+[PG: note there was no Author SOB or long log in original.]
+Upstream-Status: Backport [ gawk-4.1.1-3-g976f73ab0356 ]
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+---
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index afd64ff764b6..f3a1c7a81e7d 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,9 @@
++2014-04-11         Arnold D. Robbins     <arnold@skeeve.com>
++
++	* Makefile.am (install-data-hook): Use $(DESTDIR) when removing
++	the .la files. Thanks to Lars Wendler <polynomial-c@gentoo.org>
++	for the report and fix.
++
+ 2014-04-08         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* 4.1.1: Release tar ball made.
+diff --git a/extension/Makefile.am b/extension/Makefile.am
+index 9c49bb81abb2..11826e2b315e 100644
+--- a/extension/Makefile.am
++++ b/extension/Makefile.am
+@@ -100,7 +100,7 @@ testext_la_LIBADD     = $(MY_LIBS)
+ 
+ install-data-hook:
+ 	for i in $(pkgextension_LTLIBRARIES) ; do \
+-		$(RM) $(pkgextensiondir)/$$i ; \
++		$(RM) $(DESTDIR)$(pkgextensiondir)/$$i ; \
+ 	done
+ 
+ # Keep the uninstall check working:
+diff --git a/extension/Makefile.in b/extension/Makefile.in
+index 040cdb8f4e23..d81b16960935 100644
+--- a/extension/Makefile.in
++++ b/extension/Makefile.in
+@@ -1231,7 +1231,7 @@ uninstall-man: uninstall-man3
+ 
+ install-data-hook:
+ 	for i in $(pkgextension_LTLIBRARIES) ; do \
+-		$(RM) $(pkgextensiondir)/$$i ; \
++		$(RM) $(DESTDIR)$(pkgextensiondir)/$$i ; \
+ 	done
+ 
+ # Keep the uninstall check working:
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/gawk/gawk-4.1.1/extension-Add-DESTDIR-prefix-to-remaining-pkgextensi.patch b/meta/recipes-extended/gawk/gawk-4.1.1/extension-Add-DESTDIR-prefix-to-remaining-pkgextensi.patch
new file mode 100644
index 000000000000..b40258761565
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk-4.1.1/extension-Add-DESTDIR-prefix-to-remaining-pkgextensi.patch
@@ -0,0 +1,86 @@
+From a9f3bd754e9e269099cf7a2c931c632fcc12bd8a Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Fri, 13 Jun 2014 13:42:12 -0400
+Subject: [PATCH] extension: Add $(DESTDIR) prefix to remaining pkgextensiondir
+ instances
+
+Commit 976f73ab03569bb836aa5c949be1c1cc973b2d2e ["Use $(DESTDIR) in
+extension/Makefile.am when removing .la files."] fixed an issue
+that manifested itself as follows when cross compiling:
+
+make[4]: Entering directory 'gawk/4.1.1-r0/build/extension'
+for i in filefuncs.la fnmatch.la fork.la inplace.la ordchr.la readdir.la readfi
+le.la revoutput.la revtwoway.la rwarray.la testext.la time.la ; do \
+        rm -f /usr/lib/gawk/$i ; \
+done
+rm: cannot remove '/usr/lib/gawk/filefuncs.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/fnmatch.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/fork.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/inplace.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/ordchr.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/readdir.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/readfile.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/revoutput.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/revtwoway.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/rwarray.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/testext.la': Permission denied
+rm: cannot remove '/usr/lib/gawk/time.la': Permission denied
+Makefile:1235: recipe for target 'install-data-hook' failed
+
+The problem only manifests itself on hosts where the above files
+are already present; for if they are absent then the rm -f does
+not fail with -EPERM.  The fix in 976f73ab0356 ensured that DESTDIR
+was used for the prefix so that it didn't try to delete host files.
+
+However there still remains less used instances of where it is used
+w/o $(DESTDIR) that may still cause similar breakage in the future.
+Here we apply the same change to them.
+
+Upstream-Status: Submitted [http://lists.gnu.org/archive/html/bug-gawk/2014-06/index.html]
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+---
+
+diff --git a/extension/ChangeLog b/extension/ChangeLog
+index f3a1c7a81e7d..b87ac372edc6 100644
+--- a/extension/ChangeLog
++++ b/extension/ChangeLog
+@@ -1,3 +1,10 @@
++2014-06-13         Paul Gortmaker        <paul.gortmaker@windriver.com>
++	* Makefile.am (uninstall-so): Came across below bug while cross
++	compiling, and changed both install-data-hook and uninstall-so
++	to use $(DESTDIR) on v4.1.1 before seeing most of the fix in
++	gawk-4.1.1-3-g976f73ab0356; here we ensure uninstall-so also
++	uses the $(DESTDIR) prefix on its use of pkgextensiondir.
++
+ 2014-04-11         Arnold D. Robbins     <arnold@skeeve.com>
+ 
+ 	* Makefile.am (install-data-hook): Use $(DESTDIR) when removing
+diff --git a/extension/Makefile.am b/extension/Makefile.am
+index 11826e2b315e..b6beaee3fb47 100644
+--- a/extension/Makefile.am
++++ b/extension/Makefile.am
+@@ -105,7 +105,7 @@ install-data-hook:
+ 
+ # Keep the uninstall check working:
+ uninstall-so:
+-	$(RM) $(pkgextensiondir)/*.so
++	$(RM) $(DESTDIR)$(pkgextensiondir)/*.so
+ 
+ uninstall-recursive: uninstall-so
+ 
+diff --git a/extension/Makefile.in b/extension/Makefile.in
+index d81b16960935..294e4f887812 100644
+--- a/extension/Makefile.in
++++ b/extension/Makefile.in
+@@ -1236,7 +1236,7 @@ install-data-hook:
+ 
+ # Keep the uninstall check working:
+ uninstall-so:
+-	$(RM) $(pkgextensiondir)/*.so
++	$(RM) $(DESTDIR)$(pkgextensiondir)/*.so
+ 
+ uninstall-recursive: uninstall-so
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/gawk/gawk_4.1.1.bb b/meta/recipes-extended/gawk/gawk_4.1.1.bb
index a81be3137a9c..1298ee2f4ce1 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.1.bb
@@ -15,6 +15,8 @@ DEPENDS += "readline"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
+           file://Use-DESTDIR-in-extension-Makefile.am-when-removing-..patch \
+           file://extension-Add-DESTDIR-prefix-to-remaining-pkgextensi.patch \
 "
 
 SRC_URI[md5sum] = "45f5b09aa87b4744c4c53bf274e96ed0"
-- 
1.9.1


