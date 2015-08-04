Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9949B76424
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 03:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t743STp6008916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Aug 2015 20:28:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Mon, 3 Aug 2015 20:28:29 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Aug 2015 11:25:35 +0800
Message-ID: <34faa0d68f340ae6b0a3599d458e8dfe781555fe.1438658497.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438658497.git.kai.kang@windriver.com>
References: <cover.1438658497.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rt-tests: fix redo install error
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
X-List-Received-Date: Tue, 04 Aug 2015 03:28:31 -0000
Content-Type: text/plain

Currently gzip on host is used. If host gzip is provided by pigz, it
fails to redo install that pigz can't handle the option after file name.
When run command for target install in Makefile:

gzip src/backfire/backfire.4 -c > OUTPUT_FILE

File src/backfire/backfire.4 is zipped into backfire.4.gz but the
OUTPUT_FILE is empty. When rerun do_install, it shows warning:

| gzip: src/backfire/backfire.4 does not exist -- skipping

and empty manual gzip files are created:

$ file image/usr/share/man/man4/backfire.4.gz
image/usr/share/man/man4/backfire.4.gz: empty

Fix it by putting option '-c' before the file name.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../rt-tests/files/fix-re-install-failure.patch    | 48 ++++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch

diff --git a/meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch b/meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch
new file mode 100644
index 0000000..e38ec92
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/fix-re-install-failure.patch
@@ -0,0 +1,48 @@
+Currently gzip on host is used. If host gzip is provided by pigz, it fails to
+redo install that pigz can't handle the option after file name. When run:
+
+gzip src/backfire/backfire.4 -c > OUTPUT_FILE
+
+File src/backfire/backfire.4 is zipped into backfire.4.gz but the OUTPUT_FILE
+is empty. When rerun do_install, it shows warning:
+
+| gzip: src/backfire/backfire.4 does not exist -- skipping
+
+and empty manual gzip files are created:
+
+$ file image/usr/share/man/man4/backfire.4.gz
+image/usr/share/man/man4/backfire.4.gz: empty
+
+Fix it by putting option '-c' before the file name.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+--- git/Makefile.orig	2014-11-14 15:47:26.406638419 +0800
++++ git/Makefile	2014-11-14 15:46:53.890637533 +0800
+@@ -127,15 +127,15 @@
+ 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
+ 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
+ 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
+-	gzip src/backfire/backfire.4 -c >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
+-	gzip src/cyclictest/cyclictest.8 -c >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
+-	gzip src/pi_tests/pi_stress.8 -c >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
+-	gzip src/ptsematest/ptsematest.8 -c >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
+-	gzip src/sigwaittest/sigwaittest.8 -c >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
+-	gzip src/svsematest/svsematest.8 -c >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
+-	gzip src/pmqtest/pmqtest.8 -c >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
+-	gzip src/backfire/sendme.8 -c >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
+-	gzip src/hackbench/hackbench.8 -c >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
++	gzip -c src/backfire/backfire.4 >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
++	gzip -c src/cyclictest/cyclictest.8 >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
++	gzip -c src/pi_tests/pi_stress.8 >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
++	gzip -c src/ptsematest/ptsematest.8 >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
++	gzip -c src/sigwaittest/sigwaittest.8 >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
++	gzip -c src/svsematest/svsematest.8 >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
++	gzip -c src/pmqtest/pmqtest.8 >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
++	gzip -c src/backfire/sendme.8 >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
++	gzip -c src/hackbench/hackbench.8 >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
+ 
+ .PHONY: install_hwlatdetect
+ install_hwlatdetect: hwlatdetect
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index e63182a..9a076ad 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -8,6 +8,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
            file://added-missing-dependencies.patch \
            file://hackbench-fix-error-check.patch \
            file://Makefile-fix-gzip-command.patch \
+           file://fix-re-install-failure.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


