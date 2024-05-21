Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEE5C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 09:33:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.15551.1716284004633899339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 02:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GVvauXD0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3124EE0009;
	Tue, 21 May 2024 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716284003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm5n+nLPxYIy7Z0teV64JMO4vmg1BAmRjEZG7Zlf++8=;
	b=GVvauXD07i7Htr/URAuDaqlXuOoh1gnujIurJ+8JiRNKCVEHxYl2Bz1gzakdd1r+m6TcgM
	9VD7m9kESeRBxHNjUDxIp62+CgcLkhnQ0BJgFIOTJXC1qBFdWSfoFxCeOeTbOPaBLLrpwm
	huDtm75rgxDta8U+X3SenjhK8NqvG1dM2D+hgx6VBNHHLW0hKODlV4CGUYzX8IGjmpaZIw
	6C+qpBFxqkY31E5hnlgHn6l5PjALRi2Fe9W+NAHKghgsalBO7JTMoPGgQGExsUUPl0JWwv
	+tvF87bRLd40l8B4kPFfX11lw/F+FNNA/cbRtTbyLM2RsM9qQn/tCseLr9Uy/A==
Date: Tue, 21 May 2024 11:33:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 2/6] util-linux/util-linux-libuuid: upgrade from
 2.39.3 to 2.40.1
Message-ID: <2024052109332259282d0c@mail.local>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
 <20240520081040.2380736-2-Qi.Chen@windriver.com>
 <20240521093229dcd3708b@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521093229dcd3708b@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 09:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199605

This one is a different failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/377/steps/11/logs/stdio

On 21/05/2024 11:32:30+0200, Alexandre Belloni wrote:
> This fails on the autobuilders:
> 
> ERROR: util-linux-2.40.1-r0 do_package: QA Issue: util-linux: Files/directories were installed but not shipped in any package:
>   /lib/security/pam_lastlog2.so
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9011/steps/15/logs/stdio
> 
> On 20/05/2024 16:10:36+0800, Chen Qi via lists.openembedded.org wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> > 
> > License-Update:
> > ===============
> > GPL-2.0 is changed to GPL-2.0-only in README.licensing.
> > 
> > The following two patches are removed as they've been there in new release:
> > 
> >   0001-login-utils-include-libgen.h-for-basename-API.patch
> >   mit-license.patch
> > 
> > Other existing patches are refreshed to avoid patch-fuzz error.
> > 
> > A new PACKAGECONFIG, lastlog2, is added, which serves as a switch to build Y2038
> > safe lastlog pam module. This is a new functionality added in 2.40.
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  ...2.39.3.bb => util-linux-libuuid_2.40.1.bb} |  0
> >  meta/recipes-core/util-linux/util-linux.inc   |  8 +--
> >  ...ls-include-libgen.h-for-basename-API.patch | 60 -------------------
> >  .../util-linux/avoid_parallel_tests.patch     |  5 +-
> >  .../util-linux/configure-sbindir.patch        |  7 +--
> >  .../display_testname_for_subtest.patch        |  7 +--
> >  .../util-linux/util-linux/mit-license.patch   | 45 --------------
> >  .../util-linux/util-linux/ptest.patch         | 11 ++--
> >  ...l-linux_2.39.3.bb => util-linux_2.40.1.bb} |  3 +-
> >  9 files changed, 18 insertions(+), 128 deletions(-)
> >  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.3.bb => util-linux-libuuid_2.40.1.bb} (100%)
> >  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
> >  delete mode 100644 meta/recipes-core/util-linux/util-linux/mit-license.patch
> >  rename meta/recipes-core/util-linux/{util-linux_2.39.3.bb => util-linux_2.40.1.bb} (99%)
> > 
> > diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
> > similarity index 100%
> > rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb
> > rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> > index d506783f9a..0f5f838e84 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -6,7 +6,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
> >  
> >  SECTION = "base"
> >  
> > -LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
> > +LICENSE = "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
> >  LICENSE:${PN}-fcntl-lock = "MIT"
> >  LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
> >  LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
> > @@ -14,7 +14,7 @@ LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
> >  LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
> >  LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
> >  
> > -LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba \
> > +LIC_FILES_CHKSUM = "file://README.licensing;md5=ddd58b6c94da86ff4f03e91208eb9cfc \
> >                      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                      file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                      file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
> > @@ -30,7 +30,6 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=cc80239f106687ab39ef0271ff5cf4ba
> >  FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
> >  MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> >  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
> > -           file://mit-license.patch \
> >             file://configure-sbindir.patch \
> >             file://runuser.pamd \
> >             file://runuser-l.pamd \
> > @@ -38,8 +37,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
> >             file://run-ptest \
> >             file://display_testname_for_subtest.patch \
> >             file://avoid_parallel_tests.patch \
> > -           file://0001-login-utils-include-libgen.h-for-basename-API.patch \
> >             file://fcntl-lock.c \
> >             "
> >  
> > -SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
> > +SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
> > diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch b/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
> > deleted file mode 100644
> > index 6258710e1e..0000000000
> > --- a/meta/recipes-core/util-linux/util-linux/0001-login-utils-include-libgen.h-for-basename-API.patch
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -From d44e3ad1f6f8b5c1b3098bb7d537943a4c21d22f Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sun, 3 Dec 2023 19:59:46 -0800
> > -Subject: [PATCH] login-utils: include libgen.h for basename API
> > -
> > -musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
> > -
> > -include libgen.h for using the posix declaration of the funciton.
> > -
> > -Fixes
> > -
> > -../util-linux-2.39.2/login-utils/su-common.c:847:20: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > -  847 |                 shell_basename = basename(shell);
> > -      |                                  ^
> > -
> > -[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
> > -
> > -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2615]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > ----
> > - login-utils/su-common.c | 10 +++++++---
> > - 1 file changed, 7 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/login-utils/su-common.c b/login-utils/su-common.c
> > -index b674920..3297c78 100644
> > ---- a/login-utils/su-common.c
> > -+++ b/login-utils/su-common.c
> > -@@ -26,6 +26,7 @@
> > - #include <sys/types.h>
> > - #include <pwd.h>
> > - #include <grp.h>
> > -+#include <libgen.h>
> > - #include <security/pam_appl.h>
> > - #ifdef HAVE_SECURITY_PAM_MISC_H
> > - # include <security/pam_misc.h>
> > -@@ -840,17 +841,20 @@ static void run_shell(
> > - 				su->simulate_login ? " login" : "",
> > - 				su->fast_startup ? " fast-start" : ""));
> > - 
> > -+  char* tmp = xstrdup(shell);
> > - 	if (su->simulate_login) {
> > - 		char *arg0;
> > - 		char *shell_basename;
> > - 
> > --		shell_basename = basename(shell);
> > -+		shell_basename = basename(tmp);
> > - 		arg0 = xmalloc(strlen(shell_basename) + 2);
> > - 		arg0[0] = '-';
> > - 		strcpy(arg0 + 1, shell_basename);
> > - 		args[0] = arg0;
> > --	} else
> > --		args[0] = basename(shell);
> > -+	} else {
> > -+    args[0] = basename(tmp);
> > -+  }
> > -+  free(tmp);
> > - 
> > - 	if (su->fast_startup)
> > - 		args[argno++] = "-f";
> > diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
> > index 85ad7a5575..8ea00dbb95 100644
> > --- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
> > +++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
> > @@ -1,4 +1,4 @@
> > -From 0b05e4695a0616badef71dfa459a00ef6ff1b521 Mon Sep 17 00:00:00 2001
> > +From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
> >  From: Tudor Florea <tudor.florea@enea.com>
> >  Date: Mon, 14 Jun 2021 14:00:31 +0200
> >  Subject: [PATCH] util-linux: Add ptest
> > @@ -9,13 +9,12 @@ Revert run.sh script accordingly to serialize running tests
> >  
> >  Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
> >  Upstream-Status: Inappropriate
> > -
> >  ---
> >   configure.ac | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >  
> >  diff --git a/configure.ac b/configure.ac
> > -index 890212f..870e817 100644
> > +index 651ef2b..2a8012e 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> >  @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
> > diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> > index 75adeca188..74abdc2038 100644
> > --- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> > +++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
> > @@ -1,4 +1,4 @@
> > -From c79222a9a5e3425c55e150edc0b7ac59c573aa2f Mon Sep 17 00:00:00 2001
> > +From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
> >  From: Phil Blundell <pb@pbcl.net>
> >  Date: Mon, 24 Sep 2012 07:24:51 +0100
> >  Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
> > @@ -9,16 +9,15 @@ fix the test, the [ ] syntax was getting eaten by autoconf
> >  Signed-off-by: Phil Blundell <pb@pbcl.net>
> >  Signed-off-by: Saul Wold <sgw@linux.intel.com
> >  Upstream-Status: Inappropriate [configuration]
> > -
> >  ---
> >   configure.ac | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >  
> >  diff --git a/configure.ac b/configure.ac
> > -index 36c24b4..890212f 100644
> > +index 23594ff..651ef2b 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -102,7 +102,10 @@ AC_SUBST([runstatedir])
> > +@@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
> >   usrbin_execdir='${exec_prefix}/bin'
> >   AC_SUBST([usrbin_execdir])
> >   
> > diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
> > index 815ae9c915..871b0b2d30 100644
> > --- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
> > +++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
> > @@ -1,20 +1,19 @@
> > -From fc5de1de898fd1a372a2fd2fa493dc57323a029d Mon Sep 17 00:00:00 2001
> > +From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
> >  From: Tudor Florea <tudor.florea@enea.com>
> >  Date: Thu, 3 Dec 2015 04:08:00 +0100
> >  Subject: [PATCH] Display testname for subtest
> >  
> >  Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> >  Upstream-Status: Pending
> > -
> >  ---
> >   tests/functions.sh | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >  
> >  diff --git a/tests/functions.sh b/tests/functions.sh
> > -index 5a562a3..098145e 100644
> > +index 5fe5ba0..a6c703e 100644
> >  --- a/tests/functions.sh
> >  +++ b/tests/functions.sh
> > -@@ -437,7 +437,7 @@ function ts_init_subtest {
> > +@@ -450,7 +450,7 @@ function ts_init_subtest {
> >   
> >   	if [ "$TS_PARSABLE" != "yes" ]; then
> >   		[ $TS_NSUBTESTS -eq 1 ] && echo
> > diff --git a/meta/recipes-core/util-linux/util-linux/mit-license.patch b/meta/recipes-core/util-linux/util-linux/mit-license.patch
> > deleted file mode 100644
> > index afbec98f18..0000000000
> > --- a/meta/recipes-core/util-linux/util-linux/mit-license.patch
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -From 5b8fab1584017d9d9be008c23b90128bba41a7b5 Mon Sep 17 00:00:00 2001
> > -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -Date: Thu, 28 Mar 2024 12:16:57 +0000
> > -Subject: [PATCH] README.licensing/flock: Add MIT license mention
> > -
> > -Looking at the license text, flock.c is under the MIT license (see
> > -https://spdx.org/licenses/MIT).
> > -
> > -Add an SPDX license identifier header and add to the list of licenses the
> > -source so everything is correctly listed/identified.
> > -
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/2870]
> > -
> > ----
> > - README.licensing  | 2 ++
> > - sys-utils/flock.c | 4 +++-
> > - 2 files changed, 5 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/README.licensing b/README.licensing
> > -index 4454f8392a..535ad34813 100644
> > ---- a/README.licensing
> > -+++ b/README.licensing
> > -@@ -12,6 +12,8 @@ There is code under:
> > - 
> > -    * LGPL-2.1-or-later  - GNU Lesser General Public License 2.1 or any later version
> > - 
> > -+   * MIT                - MIT License
> > -+
> > -    * BSD-2-Clause       - Simplified BSD License
> > - 
> > -    * BSD-3-Clause       - BSD 3-Clause "New" or "Revised" License
> > -diff --git a/sys-utils/flock.c b/sys-utils/flock.c
> > -index fed29d7270..7d878ff810 100644
> > ---- a/sys-utils/flock.c
> > -+++ b/sys-utils/flock.c
> > -@@ -1,4 +1,6 @@
> > --/*   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
> > -+/*   SPDX-License-Identifier: MIT
> > -+ *
> > -+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
> > -  *
> > -  *   Permission is hereby granted, free of charge, to any person
> > -  *   obtaining a copy of this software and associated documentation
> > diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
> > index 6221de7182..7345926b88 100644
> > --- a/meta/recipes-core/util-linux/util-linux/ptest.patch
> > +++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
> > @@ -1,24 +1,23 @@
> > -From d0a69ce80c579cbb7627a2f20e8b92e006a8d8ad Mon Sep 17 00:00:00 2001
> > +From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
> >  From: Tudor Florea <tudor.florea@enea.com>
> >  Date: Thu, 3 Dec 2015 04:08:00 +0100
> >  Subject: [PATCH] Define TESTS variable
> >  
> >  Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> >  Upstream-Status: Pending
> > -
> >  ---
> >   Makefile.am | 1 +
> >   1 file changed, 1 insertion(+)
> >  
> >  diff --git a/Makefile.am b/Makefile.am
> > -index effbb02..7d2bd1e 100644
> > +index 50ab8d0..7e2340d 100644
> >  --- a/Makefile.am
> >  +++ b/Makefile.am
> > -@@ -57,6 +57,7 @@ systemdsystemunit_DATA =
> > +@@ -64,6 +64,7 @@ tmpfiles_DATA =
> >   dist_bashcompletion_DATA =
> >   check_PROGRAMS =
> >   dist_check_SCRIPTS =
> >  +TESTS = $(check_PROGRAMS)
> >   
> > - PATHFILES =
> > - ADOCFILES_COMMON =
> > + BUILT_SOURCES =
> > + 
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> > similarity index 99%
> > rename from meta/recipes-core/util-linux/util-linux_2.39.3.bb
> > rename to meta/recipes-core/util-linux/util-linux_2.40.1.bb
> > index 2cd7750afc..eceb0495a7 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> > @@ -90,7 +90,7 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
> >  # build host versions during development
> >  #
> >  PACKAGECONFIG ?= "pcre2"
> > -PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
> > +PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)}"
> >  # inherit manpages requires this to be present, however util-linux does not have
> >  # configuration options, and installs manpages always
> >  PACKAGECONFIG[manpages] = ""
> > @@ -106,6 +106,7 @@ PACKAGECONFIG[pcre2] = ",,libpcre2"
> >  PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
> >  PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
> >  PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
> > +PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
> >  
> >  EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
> >  
> > -- 
> > 2.34.1
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199557): https://lists.openembedded.org/g/openembedded-core/message/199557
> > Mute This Topic: https://lists.openembedded.org/mt/106199572/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

