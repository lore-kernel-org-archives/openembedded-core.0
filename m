Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A2CC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 18:21:38 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.1360.1719512497980349283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 11:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GTrbTA6i;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d55e963db5so1622625b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 11:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719512497; x=1720117297; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nJbUNS25F3+vGf5KPyVembGjy9yoaRJAivWInXXb88=;
        b=GTrbTA6iRbmBekFZ9p7aU7dUf0AQjhzmlE+OROYw75XFxWzq9ujRk+t3b/PEg6m0aA
         R0doq4xcKqPSdR5NTfIKDqG3+9hSddlAzxTSadpF53iRvR9lOLjzjnAJaJ3ShK2QJwDd
         +P7un/GVnx/NRZk3tQDCP77g8vp9hWoVor961iQ9pCqlgZOsHazamLiRjiEvMNDVuDCl
         1E6A12H3lh84kT0FtFOTgy/qSos04cntj1cxGHCkQ2NNqDhcHW2zl6CdZH+Ge+QcCF2O
         tZEnAq7XHvAoluWNhzxo3G9QYfUv9mC1NgMSYY8Awf5B+WQardDWERwMUYo8+55hBn+z
         NavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719512497; x=1720117297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nJbUNS25F3+vGf5KPyVembGjy9yoaRJAivWInXXb88=;
        b=KsVH/HPctG8VropMWExBSV04eETW8Z33+Zmhr6P8jysjyBqUogvpvMhUbSJpK4lnQ1
         una3Fzvgm2zPC7UYP15z7gGDuvsHAXe/GZce2EbPCuk4TWHvRKf3gvo0IrF4DqJv/MUF
         kxDtCh0YZMqwM+f3D1dVN+LVxwJaZ0EVcCnr+ON76HKAQTlbTwELwuLt5TrctkQeo6cm
         IiWgjseAOIhk2mPMLY45oaoUNm1J1UBDgfSvHzsPUqa4tunRU+kCtL8Xn0vKXd3dp+z+
         Ap8E2WboAtC++zmosfRB6/Jytekn8oWbrQUmX/e5BQrcMUfGa55/uKAJJrLdepHCnjoG
         mwlA==
X-Gm-Message-State: AOJu0Ywvd7/eMyYXdNw4Km11gsINggfAIS193Ft7JnT0pyMCrVA61FEM
	5N8dV2mHunaJvA3dJeWQgI3glpAWH/P1i63BwE8HSS2CjRLk/EJxrxcm2PcSIVbrDBjFkcwkY8b
	keyOpVDr+Zm3F777NF5/dzVh09tc=
X-Google-Smtp-Source: AGHT+IE8nt0RU4EpIeb+DuCo30o+umoLkJ0lBR4ugB0zADWohHuiOENgFHrfQMPS8EXCScrVwCnXtfomYgVdcs1R+Yo=
X-Received: by 2002:a05:6808:1294:b0:3d5:605d:bf12 with SMTP id
 5614622812f47-3d5605dc187mr8006963b6e.21.1719512496772; Thu, 27 Jun 2024
 11:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240627070339.2066255-1-mingli.yu@windriver.com>
In-Reply-To: <20240627070339.2066255-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jun 2024 11:21:10 -0700
Message-ID: <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] acl: Fix nfs ptest failure
To: mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 18:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201210

I am seeing two XPASSes which is ok but the test runs reports failure back

root@qemux86-64:/usr/lib/acl/ptest# ./run-ptest
PASS: test/cp.test
PASS: test/getfacl-lfs.test
PASS: test/getfacl-noacl.test
PASS: test/getfacl-recursive.test
PASS: test/malformed-restore.test
PASS: test/misc.test
PASS: test/sbits-restore.test
PASS: test/setfacl-X.test
PASS: test/utf8-filenames.test
PASS: test/root/getfacl.test
PASS: test/root/permissions.test
PASS: test/root/restore.test
PASS: test/root/setfacl.test
XPASS: test/nfs/nfsacl.test
XPASS: test/nfs/nfs-dir.test
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for acl 2.3.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
# TOTAL: 15
# PASS:  13
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 2
# ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
See ./test-suite.log
Please report to acl-devel@nongnu.org
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
make: *** [Makefile:2064: test-suite.log] Error 1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
   acl 2.3.2: ./test-suite.log
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

# TOTAL: 15
# PASS:  13
# SKIP:  0
# XFAIL: 0
# FAIL:  0
# XPASS: 2
# ERROR: 0

.. contents:: :depth: 2

XPASS: test/nfs/nfsacl
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[6] $ umask 022 -- ok
[7] $ mkdir -p test/sub -- ok
[8] $ echo blah > test/sub/blah -- ok
[10] $ cp -rp test/sub test/sub2 -- ok
[11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[15] $ rm -rf test/sub2 -- ok
[17] $ setfacl -m u:daemon:rwx test/sub -- ok
[18] $ setfacl -dm u:daemon:rwx test/sub -- ok
[19] $ getfattr -m- test/sub -- ok
[25] $ cp -rp test/sub test/sub2 -- ok
[26] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[30] $ rm -rf test/sub2 -- ok
[32] $ setfacl -m u:daemon:rw test/sub/blah -- ok
[33] $ cp -rp test/sub test/sub2 -- ok
[34] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
[38] $ rm -rf test/sub2 -- ok
[42] $ rm -rf test -- ok
17 commands (17 passed, 0 failed)
XPASS test/nfs/nfsacl.test (exit status: 0)

XPASS: test/nfs/nfs-dir
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[10] $ umask 022 -- ok
[11] $ mkdir /tmp/acl-ptest/test/test -- ok
[12] $ echo blah > /tmp/acl-ptest/test/test/blah -- ok
[16] $ su bin -- ok
[17] $ cat /tmp/acl-ptest/test/test/blah -- ok
[22] $ su -- ok
[23] $ chmod go-rwx /tmp/acl-ptest/test/test -- ok
[24] $ setfacl -m u:bin:rx /tmp/acl-ptest/test/test -- ok
[25] $ ls -dl /tmp/acl-ptest/test/test | awk '{print $1, $3, $4}' -- ok
[27] $ getfacl --omit-header /tmp/acl-ptest/test/test 2> /dev/null -- ok
[38] $ su bin -- ok
[39] $ cat /tmp/acl-ptest/test/test/blah -- ok
[41] $ sleep 3 -- ok
[42] $ cat /tmp/acl-ptest/test/test/blah -- ok
[44] $ cat /tmp/acl-ptest/test/test/blah -- ok
[49] $ su -- ok
[50] $ rm -rf /tmp/acl-ptest/test/test -- ok
17 commands (17 passed, 0 failed)
XPASS test/nfs/nfs-dir.test (exit status: 0)

On Thu, Jun 27, 2024 at 12:04=E2=80=AFAM Yu, Mingli via lists.openembedded.=
org
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * The date such as "Jun 13" should take 2 columns, so the expected check
> item "test/sub2" should the column 9.
>  # ls test/sub2 -dl
>  drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>
>   Corret the check item to fix the below failure in the test/nfsacl.test.
>   [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- fa=
iled
>   drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
>   -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/blah
>
> * Use the abosulte path otherwise we won't find the expected file blah.
>
> * The calls to getgrnam_r would always fail because the size of the
> buffer was smaller than the minimum (170000) specified in the test
> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match direct=
ly
> because getpwnam and getgrnam should never fail on ERANGE.
>
> This commit fixes the following failure in the test/nfs/nfs-dir.test test=
:
>
> [16] $ su bin -- failed
> su: user bin does not exist           !=3D ~
>
> * Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix below
> test/nfs/nfsacl failure.
>   [19] $ getfattr -m- test/sub -- failed\n'
>        'Can\'t exec "getfattr": Nosuch file or directory at ./test/run li=
ne '
>        369, <TEST_FILE> line 24. !=3D # file: test/sub\n'
>        'getfattr: No such file or directory   !=3D system.posix_acl_acces=
s\n'
>        '~                                 !=3D system.posix_acl_default\n=
'
>        '~
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
>  ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
>  ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++++
>  meta/recipes-support/attr/acl/run-ptest       |  2 +
>  meta/recipes-support/attr/acl_2.3.2.bb        |  4 ++
>  5 files changed, 170 insertions(+)
>  create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.t=
est-Use-the-abosulte-path.patch
>  create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.te=
st-Correct-the-check-item.patch
>  create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getpwnam=
-and-getgrnam.patch
>
> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use=
-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-=
dir.test-Use-the-abosulte-path.patch
> new file mode 100644
> index 0000000000..c48ee9f820
> --- /dev/null
> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-ab=
osulte-path.patch
> @@ -0,0 +1,46 @@
> +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Mon, 17 Jun 2024 11:22:21 +0800
> +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
> +
> +Use the abosulte path otherwise we won't find the expected file blah.
> +
> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00001.html]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/nfs/nfs-dir.test | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
> +index 33e5f5f..7216a6e 100644
> +--- a/test/nfs/nfs-dir.test
> ++++ b/test/nfs/nfs-dir.test
> +@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the worki=
ng directory.
> +       Make sure the file can be accessed before.
> +
> +       $ su bin
> +-      $ cat test/blah
> ++      $ cat %{EXPORT_PATH}/test/blah
> +       > blah
> +
> +       Set up a situation that triggers the bug.
> +@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at the wor=
king directory.
> +       fail with "Stale NFS file handle" or "Input/output error".
> +
> +       $ su bin
> +-      $ cat test/blah
> ++      $ cat %{EXPORT_PATH}/test/blah
> +       > blah
> +       $ sleep 3
> +-      $ cat test/blah
> ++      $ cat %{EXPORT_PATH}/test/blah
> +       > blah
> +-      $ cat test/blah
> ++      $ cat %{EXPORT_PATH}/test/blah
> +       > blah
> +
> +       Clean up.
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Corr=
ect-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nfsa=
cl.test-Correct-the-check-item.patch
> new file mode 100644
> index 0000000000..f990ca4a31
> --- /dev/null
> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the=
-check-item.patch
> @@ -0,0 +1,51 @@
> +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Mon, 17 Jun 2024 11:00:43 +0800
> +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
> +
> +The date such as "Jun 13" should take 2 columns, so the expected check
> +item "test/sub2" should the column 9.
> + # ls test/sub2 -dl
> +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
> +
> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00002.html]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/nfs/nfsacl.test | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
> +index 4f37322..dfcc323 100644
> +--- a/test/nfs/nfsacl.test
> ++++ b/test/nfs/nfsacl.test
> +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with ACL s=
upport.
> +       $ echo blah > test/sub/blah
> +
> +       $ cp -rp test/sub test/sub2
> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> +       > drwxr-xr-x test/sub2
> +       > -rw-r--r-- test/sub2/blah
> +
> +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with ACL=
 support.
> +       >
> +
> +       $ cp -rp test/sub test/sub2
> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> +       > drwxrwxr-x+ test/sub2
> +       > -rw-r--r-- test/sub2/blah
> +
> +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with ACL=
 support.
> +
> +       $ setfacl -m u:daemon:rw test/sub/blah
> +       $ cp -rp test/sub test/sub2
> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> +       > drwxrwxr-x+ test/sub2
> +       > -rw-rw-r--+ test/sub2/blah
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-ge=
tgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-ge=
tgrnam.patch
> new file mode 100644
> index 0000000000..2fea254fec
> --- /dev/null
> +++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.=
patch
> @@ -0,0 +1,67 @@
> +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@redhat=
.com>
> +Date: Wed, 19 Jun 2024 11:11:30 +0800
> +Subject: [PATCH] tests: fix getpwnam and getgrnam
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The calls to these functions would always fail because the size of the b=
uffer
> +was smaller than the minimum (170000) specified in the test implementati=
ons
> +of getgrnam_r and getpwnam_r.  Use test_get*_match directly because getp=
wnam
> +and getgrnam should never fail on ERANGE.
> +
> +This commit fixes the following failure in the test/root/restore.test te=
st:
> +
> +[21] $ chown bin passwd -- failed
> +chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
> +
> +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe getpwn=
am_r
> +and getgrnam_r")
> +
> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00000.html]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/test_group.c  | 2 +-
> + test/test_passwd.c | 4 ++--
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/test/test_group.c b/test/test_group.c
> +index 96dd612..42d6b07 100644
> +--- a/test/test_group.c
> ++++ b/test/test_group.c
> +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
> +       static struct group grp;
> +       struct group *result;
> +
> +-      (void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
> ++      (void) test_getgr_match(&grp, buf, sizeof buf, &result, match_nam=
e, name);
> +       return result;
> + }
> +
> +diff --git a/test/test_passwd.c b/test/test_passwd.c
> +index 9428bf8..97f2673 100644
> +--- a/test/test_passwd.c
> ++++ b/test/test_passwd.c
> +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *pwd,=
 char *buf, size_t buflen,
> +               *result =3D NULL;
> +               return ERANGE;
> +       }
> +-      last_buflen =3D- 1;
> ++      last_buflen =3D -1;
> +
> +       return test_getpw_match(pwd, buf, buflen, result, match_name, nam=
e);
> + }
> +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
> +       static struct passwd pwd;
> +       struct passwd *result;
> +
> +-      (void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
> ++      (void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match_na=
me, name);
> +       return result;
> + }
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-suppo=
rt/attr/acl/run-ptest
> index 3af75c84fe..bc7947c3ad 100644
> --- a/meta/recipes-support/attr/acl/run-ptest
> +++ b/meta/recipes-support/attr/acl/run-ptest
> @@ -6,8 +6,10 @@
>
>  mkdir -p /tmp/acl-ptest/test
>  cp test/test.* /tmp/acl-ptest/test
> +export EXPORT_PATH=3D"/tmp/acl-ptest/test"
>
>  set +e
> +rm -rf test-suite.log
>  make test-suite.log
>  exitcode=3D$?
>  if [ $exitcode -ne 0 -a -e test-suite.log ]; then
> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-suppor=
t/attr/acl_2.3.2.bb
> index 6178473873..5ac085c322 100644
> --- a/meta/recipes-support/attr/acl_2.3.2.bb
> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
> @@ -19,6 +19,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
>             file://run-ptest \
>             file://0001-tests-do-not-hardcode-the-build-path-into-a-helpe=
r-l.patch \
>             file://0001-test-patch-out-failing-bits.patch \
> +           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.patch=
 \
> +           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch=
 \
> +           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de520=
5bac0bf6058a2f7c"
> @@ -65,6 +68,7 @@ do_install_ptest:append:libc-musl() {
>  }
>
>  RDEPENDS:${PN}-ptest =3D "acl \
> +                        attr \
>                          bash \
>                          coreutils \
>                          perl \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201188): https://lists.openembedded.org/g/openembedde=
d-core/message/201188
> Mute This Topic: https://lists.openembedded.org/mt/106904866/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

