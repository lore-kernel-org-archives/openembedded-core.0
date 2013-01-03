Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlP-0000dI-DU
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f48.google.com with SMTP id ej20so8673711lab.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=MQLI98y6zy4s0ssHIbTO6Wf0BeuOmtTw7a1tdUdmGtA=;
	b=yI8A+gfu20xk/cfnld3wz3jhTPSpGR7msxdapKXrvFYkrlV7IUee4zLId9uSHMHdJY
	JZSEBOkTPedREF5q7BUqGM/K7/adc5MknxSOB4xl9eBKdxLgyupTG6Rctc3i9Z02WN82
	IEGESX6joI068qCgV9JgO/9KJ6jyP7UcKdeLFGd1tc0jo69+NlbTSS2ZJa6S+jyFb1Mh
	m/f0ERctDkfaLBd3Niwqf8cFKZ2d9WzbeZEFUYj4ImziEpOqQsrmK3W4ZpmLEvy5eutq
	I9E93b7Tu9WuOyM0kBzhc0hEc6YV8LOAxE7HXgNgrYK0nApxfLAxlvbxY0Hs87lxIrBz
	qPYA==
X-Received: by 10.152.147.103 with SMTP id tj7mr48498099lab.54.1357245399370; 
	Thu, 03 Jan 2013 12:36:39 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id er8sm17333447lbb.9.2013.01.03.12.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:37 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWk-0002E1-Ca; Thu, 03 Jan 2013 22:36:34 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:21 +0200
Message-Id: <1357245391-11055-6-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-5-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 05/15] popt: disable tests
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

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
index 0000000..d9f6324
--- /dev/null
+++ b/meta/recipes-support/popt/popt/disable_tests.patch
@@ -0,0 +1,21 @@
+Use of $(top_srcdir) in TESTS is an error which causes
+automake-1.13 to abort. Just remove tests.
+
+Upstream-status: Not sent
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



