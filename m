Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2F8C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 09:12:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.13220.1719565941018845595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 02:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZP+Q8GKr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B48C1BF214;
	Fri, 28 Jun 2024 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719565939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRnsQyGisft7aTd3HLBw3e4FSuk56hPgQ6ZwbYCJNSo=;
	b=ZP+Q8GKryaiDWhsErx1CQdU1L+JlOAwptnWq/4MBXGSsZW4vDFixe7lWYbR9IJSV6CIVry
	dJfApn1tcSTLw2u7zYFkX+Pzgouh7NFtv2zeNi0b+ezwwIJPukGjHUOKlo56d4Xx9b6B/m
	M6nstq8WBQIZwzvf9pzMZiBE6flXipE+YpGrmqq+9Vc2TPDEfny3HJbGDguLgVw+87SGHA
	EPy4CUmxHViHD7jszJbT0rgqiuuVDOq5HK6DBUbJkTqX1BlZlmM9ysh28yI49PpLiYTqpe
	y/lrgx/+rf84OISjSsi2z5Ete6vUwWMRQ+KFQl4pPRUgkGG84EUzzkU+aaRsFQ==
Date: Fri, 28 Jun 2024 11:12:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] acl: Fix nfs ptest failure
Message-ID: <20240628091217d7cc99c7@mail.local>
References: <20240627070339.2066255-1-mingli.yu@windriver.com>
 <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 09:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201221

I confirm this still fails.

On 27/06/2024 11:21:10-0700, Khem Raj wrote:
> I am seeing two XPASSes which is ok but the test runs reports failure back
> 
> root@qemux86-64:/usr/lib/acl/ptest# ./run-ptest
> PASS: test/cp.test
> PASS: test/getfacl-lfs.test
> PASS: test/getfacl-noacl.test
> PASS: test/getfacl-recursive.test
> PASS: test/malformed-restore.test
> PASS: test/misc.test
> PASS: test/sbits-restore.test
> PASS: test/setfacl-X.test
> PASS: test/utf8-filenames.test
> PASS: test/root/getfacl.test
> PASS: test/root/permissions.test
> PASS: test/root/restore.test
> PASS: test/root/setfacl.test
> XPASS: test/nfs/nfsacl.test
> XPASS: test/nfs/nfs-dir.test
> ============================================================================
> Testsuite summary for acl 2.3.2
> ============================================================================
> # TOTAL: 15
> # PASS:  13
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 2
> # ERROR: 0
> ============================================================================
> See ./test-suite.log
> Please report to acl-devel@nongnu.org
> ============================================================================
> make: *** [Makefile:2064: test-suite.log] Error 1
> =================================
>    acl 2.3.2: ./test-suite.log
> =================================
> 
> # TOTAL: 15
> # PASS:  13
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 2
> # ERROR: 0
> 
> .. contents:: :depth: 2
> 
> XPASS: test/nfs/nfsacl
> ======================
> 
> [6] $ umask 022 -- ok
> [7] $ mkdir -p test/sub -- ok
> [8] $ echo blah > test/sub/blah -- ok
> [10] $ cp -rp test/sub test/sub2 -- ok
> [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [15] $ rm -rf test/sub2 -- ok
> [17] $ setfacl -m u:daemon:rwx test/sub -- ok
> [18] $ setfacl -dm u:daemon:rwx test/sub -- ok
> [19] $ getfattr -m- test/sub -- ok
> [25] $ cp -rp test/sub test/sub2 -- ok
> [26] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [30] $ rm -rf test/sub2 -- ok
> [32] $ setfacl -m u:daemon:rw test/sub/blah -- ok
> [33] $ cp -rp test/sub test/sub2 -- ok
> [34] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> [38] $ rm -rf test/sub2 -- ok
> [42] $ rm -rf test -- ok
> 17 commands (17 passed, 0 failed)
> XPASS test/nfs/nfsacl.test (exit status: 0)
> 
> XPASS: test/nfs/nfs-dir
> =======================
> 
> [10] $ umask 022 -- ok
> [11] $ mkdir /tmp/acl-ptest/test/test -- ok
> [12] $ echo blah > /tmp/acl-ptest/test/test/blah -- ok
> [16] $ su bin -- ok
> [17] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [22] $ su -- ok
> [23] $ chmod go-rwx /tmp/acl-ptest/test/test -- ok
> [24] $ setfacl -m u:bin:rx /tmp/acl-ptest/test/test -- ok
> [25] $ ls -dl /tmp/acl-ptest/test/test | awk '{print $1, $3, $4}' -- ok
> [27] $ getfacl --omit-header /tmp/acl-ptest/test/test 2> /dev/null -- ok
> [38] $ su bin -- ok
> [39] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [41] $ sleep 3 -- ok
> [42] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [44] $ cat /tmp/acl-ptest/test/test/blah -- ok
> [49] $ su -- ok
> [50] $ rm -rf /tmp/acl-ptest/test/test -- ok
> 17 commands (17 passed, 0 failed)
> XPASS test/nfs/nfs-dir.test (exit status: 0)
> 
> On Thu, Jun 27, 2024 at 12:04 AM Yu, Mingli via lists.openembedded.org
> <mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > * The date such as "Jun 13" should take 2 columns, so the expected check
> > item "test/sub2" should the column 9.
> >  # ls test/sub2 -dl
> >  drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
> >
> >   Corret the check item to fix the below failure in the test/nfsacl.test.
> >   [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- failed
> >   drwxr-xr-x 07:23                      != drwxr-xr-x test/sub2
> >   -rw-r--r-- 07:23                      != -rw-r--r-- test/sub2/blah
> >
> > * Use the abosulte path otherwise we won't find the expected file blah.
> >
> > * The calls to getgrnam_r would always fail because the size of the
> > buffer was smaller than the minimum (170000) specified in the test
> > implementations of getgrnam_r and getpwnam_r.  Use test_get*_match directly
> > because getpwnam and getgrnam should never fail on ERANGE.
> >
> > This commit fixes the following failure in the test/nfs/nfs-dir.test test:
> >
> > [16] $ su bin -- failed
> > su: user bin does not exist           != ~
> >
> > * Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix below
> > test/nfs/nfsacl failure.
> >   [19] $ getfattr -m- test/sub -- failed\n'
> >        'Can\'t exec "getfattr": Nosuch file or directory at ./test/run line '
> >        369, <TEST_FILE> line 24. != # file: test/sub\n'
> >        'getfattr: No such file or directory   != system.posix_acl_access\n'
> >        '~                                 != system.posix_acl_default\n'
> >        '~
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
> >  ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
> >  ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++++
> >  meta/recipes-support/attr/acl/run-ptest       |  2 +
> >  meta/recipes-support/attr/acl_2.3.2.bb        |  4 ++
> >  5 files changed, 170 insertions(+)
> >  create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch
> >  create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch
> >  create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch
> >
> > diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch
> > new file mode 100644
> > index 0000000000..c48ee9f820
> > --- /dev/null
> > +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch
> > @@ -0,0 +1,46 @@
> > +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 2001
> > +From: Mingli Yu <mingli.yu@windriver.com>
> > +Date: Mon, 17 Jun 2024 11:22:21 +0800
> > +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
> > +
> > +Use the abosulte path otherwise we won't find the expected file blah.
> > +
> > +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00001.html]
> > +
> > +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > +---
> > + test/nfs/nfs-dir.test | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
> > +index 33e5f5f..7216a6e 100644
> > +--- a/test/nfs/nfs-dir.test
> > ++++ b/test/nfs/nfs-dir.test
> > +@@ -14,7 +14,7 @@ EXPORT_PATH => the path that is mounted at the working directory.
> > +       Make sure the file can be accessed before.
> > +
> > +       $ su bin
> > +-      $ cat test/blah
> > ++      $ cat %{EXPORT_PATH}/test/blah
> > +       > blah
> > +
> > +       Set up a situation that triggers the bug.
> > +@@ -36,12 +36,12 @@ EXPORT_PATH => the path that is mounted at the working directory.
> > +       fail with "Stale NFS file handle" or "Input/output error".
> > +
> > +       $ su bin
> > +-      $ cat test/blah
> > ++      $ cat %{EXPORT_PATH}/test/blah
> > +       > blah
> > +       $ sleep 3
> > +-      $ cat test/blah
> > ++      $ cat %{EXPORT_PATH}/test/blah
> > +       > blah
> > +-      $ cat test/blah
> > ++      $ cat %{EXPORT_PATH}/test/blah
> > +       > blah
> > +
> > +       Clean up.
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch
> > new file mode 100644
> > index 0000000000..f990ca4a31
> > --- /dev/null
> > +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check-item.patch
> > @@ -0,0 +1,51 @@
> > +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 2001
> > +From: Mingli Yu <mingli.yu@windriver.com>
> > +Date: Mon, 17 Jun 2024 11:00:43 +0800
> > +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
> > +
> > +The date such as "Jun 13" should take 2 columns, so the expected check
> > +item "test/sub2" should the column 9.
> > + # ls test/sub2 -dl
> > +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
> > +
> > +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00002.html]
> > +
> > +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > +---
> > + test/nfs/nfsacl.test | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
> > +index 4f37322..dfcc323 100644
> > +--- a/test/nfs/nfsacl.test
> > ++++ b/test/nfs/nfsacl.test
> > +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with ACL support.
> > +       $ echo blah > test/sub/blah
> > +
> > +       $ cp -rp test/sub test/sub2
> > +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> > ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> > +       > drwxr-xr-x test/sub2
> > +       > -rw-r--r-- test/sub2/blah
> > +
> > +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with ACL support.
> > +       >
> > +
> > +       $ cp -rp test/sub test/sub2
> > +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> > ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> > +       > drwxrwxr-x+ test/sub2
> > +       > -rw-r--r-- test/sub2/blah
> > +
> > +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with ACL support.
> > +
> > +       $ setfacl -m u:daemon:rw test/sub/blah
> > +       $ cp -rp test/sub test/sub2
> > +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> > ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> > +       > drwxrwxr-x+ test/sub2
> > +       > -rw-rw-r--+ test/sub2/blah
> > +
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch
> > new file mode 100644
> > index 0000000000..2fea254fec
> > --- /dev/null
> > +++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch
> > @@ -0,0 +1,67 @@
> > +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Luk=C3=A1=C5=A1=20Zaoral?= <lzaoral@redhat.com>
> > +Date: Wed, 19 Jun 2024 11:11:30 +0800
> > +Subject: [PATCH] tests: fix getpwnam and getgrnam
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +The calls to these functions would always fail because the size of the buffer
> > +was smaller than the minimum (170000) specified in the test implementations
> > +of getgrnam_r and getpwnam_r.  Use test_get*_match directly because getpwnam
> > +and getgrnam should never fail on ERANGE.
> > +
> > +This commit fixes the following failure in the test/root/restore.test test:
> > +
> > +[21] $ chown bin passwd -- failed
> > +chown: invalid user: ‘bin’        != ~
> > +
> > +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe getpwnam_r
> > +and getgrnam_r")
> > +
> > +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00000.html]
> > +
> > +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > +---
> > + test/test_group.c  | 2 +-
> > + test/test_passwd.c | 4 ++--
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/test/test_group.c b/test/test_group.c
> > +index 96dd612..42d6b07 100644
> > +--- a/test/test_group.c
> > ++++ b/test/test_group.c
> > +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
> > +       static struct group grp;
> > +       struct group *result;
> > +
> > +-      (void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
> > ++      (void) test_getgr_match(&grp, buf, sizeof buf, &result, match_name, name);
> > +       return result;
> > + }
> > +
> > +diff --git a/test/test_passwd.c b/test/test_passwd.c
> > +index 9428bf8..97f2673 100644
> > +--- a/test/test_passwd.c
> > ++++ b/test/test_passwd.c
> > +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *pwd, char *buf, size_t buflen,
> > +               *result = NULL;
> > +               return ERANGE;
> > +       }
> > +-      last_buflen =- 1;
> > ++      last_buflen = -1;
> > +
> > +       return test_getpw_match(pwd, buf, buflen, result, match_name, name);
> > + }
> > +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
> > +       static struct passwd pwd;
> > +       struct passwd *result;
> > +
> > +-      (void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
> > ++      (void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match_name, name);
> > +       return result;
> > + }
> > +
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
> > index 3af75c84fe..bc7947c3ad 100644
> > --- a/meta/recipes-support/attr/acl/run-ptest
> > +++ b/meta/recipes-support/attr/acl/run-ptest
> > @@ -6,8 +6,10 @@
> >
> >  mkdir -p /tmp/acl-ptest/test
> >  cp test/test.* /tmp/acl-ptest/test
> > +export EXPORT_PATH="/tmp/acl-ptest/test"
> >
> >  set +e
> > +rm -rf test-suite.log
> >  make test-suite.log
> >  exitcode=$?
> >  if [ $exitcode -ne 0 -a -e test-suite.log ]; then
> > diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
> > index 6178473873..5ac085c322 100644
> > --- a/meta/recipes-support/attr/acl_2.3.2.bb
> > +++ b/meta/recipes-support/attr/acl_2.3.2.bb
> > @@ -19,6 +19,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
> >             file://run-ptest \
> >             file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch \
> >             file://0001-test-patch-out-failing-bits.patch \
> > +           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.patch \
> > +           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch \
> > +           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
> >             "
> >
> >  SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
> > @@ -65,6 +68,7 @@ do_install_ptest:append:libc-musl() {
> >  }
> >
> >  RDEPENDS:${PN}-ptest = "acl \
> > +                        attr \
> >                          bash \
> >                          coreutils \
> >                          perl \
> > --
> > 2.34.1
> >
> >
> > 
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201210): https://lists.openembedded.org/g/openembedded-core/message/201210
> Mute This Topic: https://lists.openembedded.org/mt/106904866/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

