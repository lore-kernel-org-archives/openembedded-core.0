Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLNzo-0001be-2g
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 00:43:56 +0100
Received: by faas16 with SMTP id s16so7836762faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 16:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2vQpaAEIjCxZDoyaBoEruTY2XWDGrFWuGYTDN25OdGg=;
	b=OVmL1EPPyu0Q9ribHG36KCPG/haxTrNrc6XC1s7uE/pYuRD8lseCA1jfvzPQtTivuN
	PEz2xIKIyuxgUqyvumcBg0riryWtikWsk8U9qu2gIY/4oj/Wzvk4033at5d89aAX+fwt
	J3vg82kNTgh+7Bqgh5JZrJqEpfP1KSaHUHIVI=
Received: by 10.223.5.66 with SMTP id 2mr3978850fau.26.1320190669479;
	Tue, 01 Nov 2011 16:37:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k13sm21453746fah.0.2011.11.01.16.37.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 16:37:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 00:37:42 +0100
Message-Id: <1320190662-748-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Subject: [PATCH] libxslt: don't replace COPYING with symlink to Copyright
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 23:43:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dont.replace.COPYING.with.symlink.patch        |   27 ++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch

diff --git a/meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch b/meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch
new file mode 100644
index 0000000..a38b686
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch
@@ -0,0 +1,27 @@
+When it's replaced with symlink to Copyright, then we end with link to nonexistent file like this:
+
+OE om-gta02@shr ~/shr-core $ ll tmp/deploy/licenses/libxslt/
+total 40
+drwxr-xr-x   2 bitbake bitbake  4096 Nov  2 00:27 ./
+drwxr-xr-x 818 bitbake bitbake 32768 Nov  2 00:27 ../
+lrwxrwxrwx   1 bitbake bitbake     9 Nov  2 00:27 COPYING -> Copyright
+lrwxrwxrwx   1 bitbake bitbake    52 Nov  2 00:27 generic_MIT -> /OE/shr-core/tmp/deploy/licenses/common-licenses/MIT
+
+Upstream-Status: Pending
+
+diff -uNr libxslt-1.1.26.orig/configure.in libxslt-1.1.26/configure.in
+--- libxslt-1.1.26.orig/configure.in	2009-09-24 16:27:30.000000000 +0200
++++ libxslt-1.1.26/configure.in	2011-11-02 00:30:47.651452392 +0100
+@@ -671,12 +671,6 @@
+ RELDATE=`date +'%a %b %e %Y'`
+ AC_SUBST(RELDATE)
+ 
+-( cd $srcdir
+-rm -f COPYING.LIB COPYING
+-$LN_S Copyright COPYING
+-)
+-
+-
+ AC_OUTPUT([
+ Makefile
+ libxslt.pc
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index 96bffc6..4dd6b55 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
+           file://dont.replace.COPYING.with.symlink.patch \
            file://pkgconfig_fix.patch"
 
 SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"
-- 
1.7.7.1



