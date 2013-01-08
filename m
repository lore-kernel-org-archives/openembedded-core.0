Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfF-0000qe-4J
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-la0-f45.google.com with SMTP id ep20so100640lab.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fwKkbzB/vOtelnvQyzeCVZkDlU9HCB9/CvdyHSw7ZVM=;
	b=ZTBH3yY1lkVvQ321LvdlhW0Fa7HHjscaIbV/vWmI6eDXYltFlQ+gbYYWMZlPLIqyfX
	AJdZQg/xImHiiHKgna19a4AS/1gq1NuMnZXWwHsSecVCol9ovtsAlJegdCTXXkpj/phY
	iqFHbxKyPtQLQtzwUE9eqDs/oQOCqT96L+7iQ+ndpGaafMLE3SI5pK8ojAFV2+Gkb+1Q
	CmXE/o+fNjKC/U3+p7r1inoAJSv3El5aKR6efq1Xg4PeYjpnilMRqMBesBMlab8CfAhE
	sGImG+8YmAYFcJrgEiWihEm2PlXNgCb8XO4/fV08MR3H8Ncv7n4hehtH6/HDakgBiEme
	nVUA==
X-Received: by 10.152.125.7 with SMTP id mm7mr61370400lab.2.1357629410888;
	Mon, 07 Jan 2013 23:16:50 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id v7sm22108957lbj.13.2013.01.07.23.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005kI-Cs; Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:35 +0200
Message-Id: <1357629404-22020-4-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-3-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 03/12] popt: disable tests
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
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000

Use of $(top_srcdir) in TESTS is an error causing automake-1.13
to abort. Disable the tests completely.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/popt/popt/disable_tests.patch |   21 ++++++++++++++++++++
 meta/recipes-support/popt/popt_1.16.bb             |    3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/popt/popt/disable_tests.patch

diff --git a/meta/recipes-support/popt/popt/disable_tests.patch b/meta/recipes-support/popt/popt/disable_tests.patch
new file mode 100644
index 0000000..016cf66
--- /dev/null
+++ b/meta/recipes-support/popt/popt/disable_tests.patch
@@ -0,0 +1,21 @@
+Use of $(top_srcdir) in TESTS is an error which causes
+automake-1.13 to abort. Just remove tests.
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd popt-1.16/Makefile.am popt-1.16/Makefile.am
+--- popt-1.16/Makefile.am	2010-05-04 23:55:54.000000000 +0300
++++ popt-1.16/Makefile.am	2013-01-02 13:34:29.540361391 +0200
+@@ -34,11 +34,6 @@
+
+ noinst_SCRIPTS = testit.sh
+
+-TESTS_ENVIRONMENT = \
+-test1="$(top_builddir)/test1"
+-
+-TESTS = $(top_srcdir)/testit.sh
+-
+ include_HEADERS = popt.h
+
+ usrlibdir = $(libdir)
diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 91b0d60..aa4e379 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -4,11 +4,12 @@ SECTION = "libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
+           file://disable_tests.patch \
           "
 
 SRC_URI[md5sum] = "3743beefa3dd6247a73f8f7a32c14c33"
-- 
1.7.10.4



