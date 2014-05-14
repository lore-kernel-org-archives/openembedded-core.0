Return-Path: <gary.robertson@linaro.org>
X-Greylist: delayed 354 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 23:45:25 UTC
Received: from mail-ob0-f181.google.com (unknown [209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1352865FE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 23:45:25 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id wm4so334906obc.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 16:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=72P0Pp3SPLM1mKWL3Nfp1pxihFO5n8hGUsK5xqCxt6Q=;
	b=DKKbfFYZXYqEEwhJzOUcF0nS8ywTmKvICNrmrBYrgoxDik9Lue0ZmEEPs97BnESUcd
	XlJdiiOgDtdSoS8TiGaoPoN9jK9iGPJ0aDkgZfu6RtN+k7Yq08kTButD1tijcwSaIHRN
	SRT7Oq5gTiesVJ36HvuynH+rQSwrLv07pnHof52fLh+lqE7BjO/HXDZvzwUZfIW8TF1A
	AV6IxA0ycR5SpRT05fppP0eYwF6MzIzf4VGVMg9K0Rm3ejerf76Csks+o8oSZDu/qY5B
	m7cVmgToJfBXo03b9rxc8EKFoS7EE5KWLwcInySSMXr3G7yuI8/2YE74jCAYYvt1TFlD
	7Npw==
X-Gm-Message-State: ALoCoQkDht9ce8Gq6iZwqJ15q4CQ3zW+I1ppI1qBDap7jToPQmtzi0cDQUp+OmGjDG98LvHsLvZ9
X-Received: by 10.60.115.202 with SMTP id jq10mr6711461oeb.0.1400110772311;
	Wed, 14 May 2014 16:39:32 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id to6sm5877102obb.6.2014.05.14.16.39.31
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 May 2014 16:39:31 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 18:38:41 -0500
Message-Id: <1400110721-23181-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Cc: mike.holmes@linaro.org
Subject: [PATCH] rt-tests: restore erroneously deleted patch files
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
X-List-Received-Date: Wed, 14 May 2014 23:45:26 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

Commit "rt-tests: bump version 0.87 => 0.89" (SHA1 ID: 7996ca) erroneously
deleted several patch files which were still required for proper function
of the rt-tests recipe.  These missing patches adversely affected builds
of the hwlatdetect and hackbench utilities as well as other components.

This commit restores the missing patches and allows the recipe to properly
generate all the components once more.  hwlatdetect and hackbench are
built properly and the /usr/src/backfire directory is properly populated
on the target system.

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |   35 ++++++++++
 ...02-rt-tests-Break-out-install_hwlatdetect.patch |   68 ++++++++++++++++++++
 .../files/added-missing-dependencies.patch         |   50 ++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |    3 +
 4 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch

diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
new file mode 100644
index 0000000..8b493eb
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
@@ -0,0 +1,35 @@
+From 66765522b634952346f1a3ab7d00c7222a1f9361 Mon Sep 17 00:00:00 2001
+Message-Id: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Tue, 11 Sep 2012 15:19:30 -0700
+Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB
+
+Upstream-Status: Submitted
+
+Allow users (build systems) to specify PYLIB. This allows for a
+cross-build-system to specify the target PYLIB rather than the host
+PYLIB.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+CC: Clark Williams <williams@redhat.com>
+CC: John Kacur <jkacur@redhat.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 3a82407..61e2f9f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,7 +23,7 @@ endif
+ CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
+ LDFLAGS ?=
+ 
+-PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
++PYLIB  ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
+ 
+ ifndef DEBUG
+ 	CFLAGS	+= -O2
+-- 
+1.7.11.4
+
diff --git a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
new file mode 100644
index 0000000..bc6136f
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
@@ -0,0 +1,68 @@
+From af93e580d005a2bba6ed36528003af4cf631adb8 Mon Sep 17 00:00:00 2001
+Message-Id: <af93e580d005a2bba6ed36528003af4cf631adb8.1347419597.git.dvhart@linux.intel.com>
+In-Reply-To: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
+References: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Tue, 11 Sep 2012 14:51:10 -0700
+Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect
+
+Upstream-Status: Submitted
+
+Allow hwlatdetect to be installed independently of the rest of the
+tests. This is convenient for build systems that package it separately
+due to the python dependency.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+CC: Clark Williams <williams@redhat.com>
+CC: John Kacur <jkacur@redhat.com>
+---
+ Makefile | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 61e2f9f..636e63b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -119,21 +119,15 @@ changelog:
+ 	git log >ChangeLog
+ 
+ .PHONY: install
+-install: all
++install: all install_hwlatdetect
+ 	mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man4"
+ 	mkdir -p "$(DESTDIR)$(srcdir)" "$(DESTDIR)$(mandir)/man8"
+ 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
+-	if test -n "$(PYLIB)" ; then \
+-		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
+-		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+-		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+-	fi
+ 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
+ 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
+ 	gzip src/backfire/backfire.4 -c >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
+ 	gzip src/cyclictest/cyclictest.8 -c >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
+ 	gzip src/pi_tests/pi_stress.8 -c >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
+-	gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz"
+ 	gzip src/ptsematest/ptsematest.8 -c >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
+ 	gzip src/sigwaittest/sigwaittest.8 -c >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
+ 	gzip src/svsematest/svsematest.8 -c >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
+@@ -141,6 +135,16 @@ install: all
+ 	gzip src/backfire/sendme.8 -c >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
+ 	gzip src/hackbench/hackbench.8 -c >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
+ 
++.PHONY: install_hwlatdetect
++install_hwlatdetect: hwlatdetect
++	if test -n "$(PYLIB)" ; then \
++		mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man8" ; \
++		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
++		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
++		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
++		gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
++	fi
++
+ .PHONY: release
+ release: clean changelog
+ 	mkdir -p releases
+-- 
+1.7.11.4
+
diff --git a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
new file mode 100644
index 0000000..e420282
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
@@ -0,0 +1,50 @@
+From 82d28701486ba5a699544a168448bf93b1ccd7b1 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 6 Dec 2012 11:26:14 +0800
+Subject: [PATCH] Added missing dependencies
+
+Upstream-Status: Submitted [linux-rt-users]
+
+The following targets missed dependency on librttest.a:
+pi_stress
+rt-migrate-test
+hackbench
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fd3cdb3..60707a7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -68,14 +68,14 @@ cyclictest: cyclictest.o librttest.a
+ signaltest: signaltest.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+-pi_stress: pi_stress.o
++pi_stress: pi_stress.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ hwlatdetect:  src/hwlatdetect/hwlatdetect.py
+ 	chmod +x src/hwlatdetect/hwlatdetect.py
+ 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
+ 
+-rt-migrate-test: rt-migrate-test.o
++rt-migrate-test: rt-migrate-test.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ ptsematest: ptsematest.o librttest.a
+@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a
+ pip_stress: pip_stress.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+-hackbench: hackbench.o
++hackbench: hackbench.o librttest.a
+ 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ librttest.a: rt-utils.o error.o rt-get_cpu.o
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 954782c..ee5a1af 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -2,6 +2,9 @@
 SRCREV = "9164ec4db2645f52ffdd20e6d1b72bb0411ab40e"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
+           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
+           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
+           file://added-missing-dependencies.patch \
            file://hackbench-fix-error-check.patch \
 "
 
-- 
1.7.9.5


