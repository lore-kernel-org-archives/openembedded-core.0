Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 604246017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 21:59:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2014 14:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1020,1389772800"; d="scan'208";a="529366779"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2014 14:59:19 -0700
Message-ID: <536D4FB7.6060709@linux.intel.com>
Date: Fri, 09 May 2014 14:59:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: gary.robertson@linaro.org, openembedded-core@lists.openembedded.org
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>	<1398377346-19557-1-git-send-email-gary.robertson@linaro.org>
	<1398377346-19557-2-git-send-email-gary.robertson@linaro.org>
In-Reply-To: <1398377346-19557-2-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org, clark.williams@gmail.com
Subject: Re: [PATCH V3 1/1] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Fri, 09 May 2014 21:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2014 03:09 PM, gary.robertson@linaro.org wrote:
> From: Anders Roxell <anders.roxell@linaro.org>
>
> cyclictest was updated to correct some problems with CPU affinity selection
> and display of help and/or execution details.
> These patches were accepted by the maintainer of the cyclictest utility.
> The changes were reflected in an updated release of rt-tests - v0.89
> The cyclictest changes were successfully tested on both an ARM v7 and x86_64
> host environment.
> The OE recipe was updated locally to incorporate the newer rt-tests release
> and the resulting builds were verified for the same ARM v7 target
> and for qemux86.
> Patch files obsoleted by the rt-tests 0.89 release were removed from the recipe
> 	deleted:    meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
> 	deleted:    meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
Did you test build hwlatdetect?  This seems to break the install process 
for hwlatdetect which was part of this patch.

There is also some additional files installed but not shipped in 
/usr/src/backfile.

Please test with hwlatdetect also.

Thanks
	Sau!

> 	deleted:    meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>   ...1-rt-tests-Allow-for-user-specified-PYLIB.patch |   35 ----------
>   ...02-rt-tests-Break-out-install_hwlatdetect.patch |   68 --------------------
>   .../files/added-missing-dependencies.patch         |   50 --------------
>   meta/recipes-rt/rt-tests/rt-tests.inc              |    7 +-
>   .../{rt-tests_0.87.bb => rt-tests_0.89.bb}         |    0
>   5 files changed, 2 insertions(+), 158 deletions(-)
>   delete mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
>   delete mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
>   delete mode 100644 meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
>   rename meta/recipes-rt/rt-tests/{rt-tests_0.87.bb => rt-tests_0.89.bb} (100%)
>
> diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
> deleted file mode 100644
> index 8b493eb..0000000
> --- a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 66765522b634952346f1a3ab7d00c7222a1f9361 Mon Sep 17 00:00:00 2001
> -Message-Id: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
> -From: Darren Hart <dvhart@linux.intel.com>
> -Date: Tue, 11 Sep 2012 15:19:30 -0700
> -Subject: [PATCH 1/2] rt-tests: Allow for user-specified PYLIB
> -
> -Upstream-Status: Submitted
> -
> -Allow users (build systems) to specify PYLIB. This allows for a
> -cross-build-system to specify the target PYLIB rather than the host
> -PYLIB.
> -
> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> -CC: Clark Williams <williams@redhat.com>
> -CC: John Kacur <jkacur@redhat.com>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 3a82407..61e2f9f 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -23,7 +23,7 @@ endif
> - CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
> - LDFLAGS ?=
> -
> --PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
> -+PYLIB  ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
> -
> - ifndef DEBUG
> - 	CFLAGS	+= -O2
> ---
> -1.7.11.4
> -
> diff --git a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch b/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
> deleted file mode 100644
> index bc6136f..0000000
> --- a/meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From af93e580d005a2bba6ed36528003af4cf631adb8 Mon Sep 17 00:00:00 2001
> -Message-Id: <af93e580d005a2bba6ed36528003af4cf631adb8.1347419597.git.dvhart@linux.intel.com>
> -In-Reply-To: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
> -References: <66765522b634952346f1a3ab7d00c7222a1f9361.1347419597.git.dvhart@linux.intel.com>
> -From: Darren Hart <dvhart@linux.intel.com>
> -Date: Tue, 11 Sep 2012 14:51:10 -0700
> -Subject: [PATCH 2/2] rt-tests: Break out install_hwlatdetect
> -
> -Upstream-Status: Submitted
> -
> -Allow hwlatdetect to be installed independently of the rest of the
> -tests. This is convenient for build systems that package it separately
> -due to the python dependency.
> -
> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> -CC: Clark Williams <williams@redhat.com>
> -CC: John Kacur <jkacur@redhat.com>
> ----
> - Makefile | 18 +++++++++++-------
> - 1 file changed, 11 insertions(+), 7 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 61e2f9f..636e63b 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -119,21 +119,15 @@ changelog:
> - 	git log >ChangeLog
> -
> - .PHONY: install
> --install: all
> -+install: all install_hwlatdetect
> - 	mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man4"
> - 	mkdir -p "$(DESTDIR)$(srcdir)" "$(DESTDIR)$(mandir)/man8"
> - 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
> --	if test -n "$(PYLIB)" ; then \
> --		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
> --		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> --		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> --	fi
> - 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
> - 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
> - 	gzip src/backfire/backfire.4 -c >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
> - 	gzip src/cyclictest/cyclictest.8 -c >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
> - 	gzip src/pi_tests/pi_stress.8 -c >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
> --	gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz"
> - 	gzip src/ptsematest/ptsematest.8 -c >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
> - 	gzip src/sigwaittest/sigwaittest.8 -c >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
> - 	gzip src/svsematest/svsematest.8 -c >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
> -@@ -141,6 +135,16 @@ install: all
> - 	gzip src/backfire/sendme.8 -c >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
> - 	gzip src/hackbench/hackbench.8 -c >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
> -
> -+.PHONY: install_hwlatdetect
> -+install_hwlatdetect: hwlatdetect
> -+	if test -n "$(PYLIB)" ; then \
> -+		mkdir -p "$(DESTDIR)$(bindir)" "$(DESTDIR)$(mandir)/man8" ; \
> -+		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
> -+		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> -+		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
> -+		gzip src/hwlatdetect/hwlatdetect.8 -c >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
> -+	fi
> -+
> - .PHONY: release
> - release: clean changelog
> - 	mkdir -p releases
> ---
> -1.7.11.4
> -
> diff --git a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch b/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
> deleted file mode 100644
> index e420282..0000000
> --- a/meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 82d28701486ba5a699544a168448bf93b1ccd7b1 Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Thu, 6 Dec 2012 11:26:14 +0800
> -Subject: [PATCH] Added missing dependencies
> -
> -Upstream-Status: Submitted [linux-rt-users]
> -
> -The following targets missed dependency on librttest.a:
> -pi_stress
> -rt-migrate-test
> -hackbench
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - Makefile |    6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index fd3cdb3..60707a7 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -68,14 +68,14 @@ cyclictest: cyclictest.o librttest.a
> - signaltest: signaltest.o librttest.a
> - 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> --pi_stress: pi_stress.o
> -+pi_stress: pi_stress.o librttest.a
> - 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> - hwlatdetect:  src/hwlatdetect/hwlatdetect.py
> - 	chmod +x src/hwlatdetect/hwlatdetect.py
> - 	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
> -
> --rt-migrate-test: rt-migrate-test.o
> -+rt-migrate-test: rt-migrate-test.o librttest.a
> - 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> - ptsematest: ptsematest.o librttest.a
> -@@ -96,7 +96,7 @@ sendme: sendme.o librttest.a
> - pip_stress: pip_stress.o librttest.a
> - 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> --hackbench: hackbench.o
> -+hackbench: hackbench.o librttest.a
> - 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
> -
> - librttest.a: rt-utils.o error.o rt-get_cpu.o
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
> index 81f4f2b..1d876b0 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,10 +1,7 @@
> -# Version v0.87
> -SRCREV = "b0413ae5ed802004fb0c4af74a1757381fd2b91f"
> +# Version v0.89
> +SRCREV = "9164ec4db2645f52ffdd20e6d1b72bb0411ab40e"
>
>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git \
> -           file://0001-rt-tests-Allow-for-user-specified-PYLIB.patch \
> -           file://0002-rt-tests-Break-out-install_hwlatdetect.patch \
> -           file://added-missing-dependencies.patch \
>              file://hackbench-fix-error-check.patch \
>   "
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.87.bb b/meta/recipes-rt/rt-tests/rt-tests_0.89.bb
> similarity index 100%
> rename from meta/recipes-rt/rt-tests/rt-tests_0.87.bb
> rename to meta/recipes-rt/rt-tests/rt-tests_0.89.bb
>

