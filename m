Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BADAC3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:20:07 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.1136.1719850803155814797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTSYvVjZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2598abc6848so1523648fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850802; x=1720455602; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1eVE/+W5xBCZxqjiLuUc3Js810R+hVLhr7QeIavW5g8=;
        b=mTSYvVjZDds9Ej4D+2gwmiigF4KrhIrJf4E18SBAM62tbSIY42v1glm/lSEJGfvdmr
         9/8fZYWv480ZTrx4KBB/ZL+UdY3wqTiKjIbJkQzfTCgeFYnvXu5fIBpCjweP25ZiAk4O
         6t3h9AvoEhYqnc2TMi54zMnoJ5DeFuhfX3J95QIBUypSh4VtfjjnvUqIIWq194BxlUAJ
         080hgYXNGQBK2ABVkJln/L6jWl+8AZmseIm9ld39LmsDLcvcBTnYakOqyToYfwoYotzh
         YPvenPhLSsh41iKWv03b3XfB8xgaOfSZp+l/C8JLASH/jeqRGWTgDa6r24CdEjXn3OjA
         Snbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850802; x=1720455602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eVE/+W5xBCZxqjiLuUc3Js810R+hVLhr7QeIavW5g8=;
        b=rSwkH6+3cRB5JOLBXzDGqMFT8+IKxnX7pvso62pSGVpd0FLQad17ZNjCg9MdWCHIW5
         bsrfY/42gFk7tJhqZActANrngBJSXo/Rwuj3d51YKHkRtAHPyI9xrJwig7W6t7GXidxT
         by0MBCiIQ89I1fRQmi6UDnpB9PxoXb5HW+RYRAsgyv3qCvNnjWB4vMpHs5puoacafzkt
         y/ajZaNFJZFxcft2ftn8eH6pKMJgrI1CnBHTojz3tZX9dY9B+ZKVUeb0A77m1i1U585y
         f5Xz9HMIGlqB5G/51Wh79GAMRe/1/rp29Rdyll79+/lNST6at1WVi4SBmkzmrTQ3oM46
         7nZw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5VxhyZL+4KXxAANyHt0J7Y1fNr6IvXDpGczXij/JVRPB07W6/fk15lTtKx53Vzvto6HOWq5sTX3trk7mxU+H4J3mzc8zmEC1xCjis2y/OK+tOvpXIBmN
X-Gm-Message-State: AOJu0YxeqUVdlid2AN7SxPxeBHS7+12Ix+6QpWkHhQ/Jkm6XjhRbJ6gf
	n5f8gnraGr1nC1oIn/IWE4OpBxqOdZjvk3Y6jNwMXzhldVsGaSyPHUmz/G0QA8+15IHadginqcn
	bRW0HHxwmgl5+CG5pjVOuxUhZ9lU=
X-Google-Smtp-Source: AGHT+IGypsu2z2lC1E6hG/e+7sC+ztHxzGJLhk0Lf9tinIk7Cjyxr/svZOox0Wqh8a5sMrp9+lrdTsgj7C8hIcA8tj8=
X-Received: by 2002:a05:6870:d608:b0:25d:789e:241f with SMTP id
 586e51a60fabf-25d9727d743mr4392872fac.29.1719850802180; Mon, 01 Jul 2024
 09:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240627070339.2066255-1-mingli.yu@windriver.com>
 <CAMKF1sqG1+_VGAFR9N8oaJqrniYoMC6LOWxrMsTadBuaDO9gEQ@mail.gmail.com> <7e47a093-f395-4413-a069-4435942c84bb@windriver.com>
In-Reply-To: <7e47a093-f395-4413-a069-4435942c84bb@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jul 2024 09:19:50 -0700
Message-ID: <CAMKF1srF+BXye5k9dGNVEvAj1D8Y3d9b8FXcU21-vCmWCC+31g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] acl: Fix nfs ptest failure
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: alexandre.belloni@bootlin.com, mingli.yu@eng.windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000217be2061c31f825"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201310

--000000000000217be2061c31f825
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 1:25=E2=80=AFAM Yu, Mingli <mingli.yu@windriver.com>=
 wrote:

>
>
> On 6/28/24 02:21, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > I am seeing two XPASSes which is ok but the test runs reports failure
> back
>
> It is because the two cases defined as XFAIL_TESTS
> https://git.savannah.nongnu.org/cgit/acl.git/tree/test/Makemodule.am#n1
> and per
>
> https://www.gnu.org/software/automake/manual/html_node/Generalities-about=
-Testing.html,
>
>
> ```
> In case a test that is expected to fail ends up passing instead, many
> testing environments will flag the result as a special kind of failure
> called unexpected pass (or xpass).
> ```


It=E2=80=99s fine here we need to treat them as passes so the return from t=
ests do
not confuse the preset runner

>
> Thanks,
>
> >
> > root@qemux86-64:/usr/lib/acl/ptest# ./run-ptest
> > PASS: test/cp.test
> > PASS: test/getfacl-lfs.test
> > PASS: test/getfacl-noacl.test
> > PASS: test/getfacl-recursive.test
> > PASS: test/malformed-restore.test
> > PASS: test/misc.test
> > PASS: test/sbits-restore.test
> > PASS: test/setfacl-X.test
> > PASS: test/utf8-filenames.test
> > PASS: test/root/getfacl.test
> > PASS: test/root/permissions.test
> > PASS: test/root/restore.test
> > PASS: test/root/setfacl.test
> > XPASS: test/nfs/nfsacl.test
> > XPASS: test/nfs/nfs-dir.test
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > Testsuite summary for acl 2.3.2
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > # TOTAL: 15
> > # PASS:  13
> > # SKIP:  0
> > # XFAIL: 0
> > # FAIL:  0
> > # XPASS: 2
> > # ERROR: 0
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > See ./test-suite.log
> > Please report to acl-devel@nongnu.org
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > make: *** [Makefile:2064: test-suite.log] Error 1
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     acl 2.3.2: ./test-suite.log
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > # TOTAL: 15
> > # PASS:  13
> > # SKIP:  0
> > # XFAIL: 0
> > # FAIL:  0
> > # XPASS: 2
> > # ERROR: 0
> >
> > .. contents:: :depth: 2
> >
> > XPASS: test/nfs/nfsacl
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > [6] $ umask 022 -- ok
> > [7] $ mkdir -p test/sub -- ok
> > [8] $ echo blah > test/sub/blah -- ok
> > [10] $ cp -rp test/sub test/sub2 -- ok
> > [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> > [15] $ rm -rf test/sub2 -- ok
> > [17] $ setfacl -m u:daemon:rwx test/sub -- ok
> > [18] $ setfacl -dm u:daemon:rwx test/sub -- ok
> > [19] $ getfattr -m- test/sub -- ok
> > [25] $ cp -rp test/sub test/sub2 -- ok
> > [26] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> > [30] $ rm -rf test/sub2 -- ok
> > [32] $ setfacl -m u:daemon:rw test/sub/blah -- ok
> > [33] $ cp -rp test/sub test/sub2 -- ok
> > [34] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}' -- ok
> > [38] $ rm -rf test/sub2 -- ok
> > [42] $ rm -rf test -- ok
> > 17 commands (17 passed, 0 failed)
> > XPASS test/nfs/nfsacl.test (exit status: 0)
> >
> > XPASS: test/nfs/nfs-dir
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > [10] $ umask 022 -- ok
> > [11] $ mkdir /tmp/acl-ptest/test/test -- ok
> > [12] $ echo blah > /tmp/acl-ptest/test/test/blah -- ok
> > [16] $ su bin -- ok
> > [17] $ cat /tmp/acl-ptest/test/test/blah -- ok
> > [22] $ su -- ok
> > [23] $ chmod go-rwx /tmp/acl-ptest/test/test -- ok
> > [24] $ setfacl -m u:bin:rx /tmp/acl-ptest/test/test -- ok
> > [25] $ ls -dl /tmp/acl-ptest/test/test | awk '{print $1, $3, $4}' -- ok
> > [27] $ getfacl --omit-header /tmp/acl-ptest/test/test 2> /dev/null -- o=
k
> > [38] $ su bin -- ok
> > [39] $ cat /tmp/acl-ptest/test/test/blah -- ok
> > [41] $ sleep 3 -- ok
> > [42] $ cat /tmp/acl-ptest/test/test/blah -- ok
> > [44] $ cat /tmp/acl-ptest/test/test/blah -- ok
> > [49] $ su -- ok
> > [50] $ rm -rf /tmp/acl-ptest/test/test -- ok
> > 17 commands (17 passed, 0 failed)
> > XPASS test/nfs/nfs-dir.test (exit status: 0)
> >
> > On Thu, Jun 27, 2024 at 12:04=E2=80=AFAM Yu, Mingli via lists.openembed=
ded.org
> > <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> * The date such as "Jun 13" should take 2 columns, so the expected che=
ck
> >> item "test/sub2" should the column 9.
> >>   # ls test/sub2 -dl
> >>   drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
> >>
> >>    Corret the check item to fix the below failure in the
> test/nfsacl.test.
> >>    [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -=
-
> failed
> >>    drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
> >>    -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/bla=
h
> >>
> >> * Use the abosulte path otherwise we won't find the expected file blah=
.
> >>
> >> * The calls to getgrnam_r would always fail because the size of the
> >> buffer was smaller than the minimum (170000) specified in the test
> >> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match
> directly
> >> because getpwnam and getgrnam should never fail on ERANGE.
> >>
> >> This commit fixes the following failure in the test/nfs/nfs-dir.test
> test:
> >>
> >> [16] $ su bin -- failed
> >> su: user bin does not exist           !=3D ~
> >>
> >> * Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix belo=
w
> >> test/nfs/nfsacl failure.
> >>    [19] $ getfattr -m- test/sub -- failed\n'
> >>         'Can\'t exec "getfattr": Nosuch file or directory at ./test/ru=
n
> line '
> >>         369, <TEST_FILE> line 24. !=3D # file: test/sub\n'
> >>         'getfattr: No such file or directory   !=3D
> system.posix_acl_access\n'
> >>         '~                                 !=3D
> system.posix_acl_default\n'
> >>         '~
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
> >>   ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
> >>   ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++=
++
> >>   meta/recipes-support/attr/acl/run-ptest       |  2 +
> >>   meta/recipes-support/attr/acl_2.3.2.bb        |  4 ++
> >>   5 files changed, 170 insertions(+)
> >>   create mode 100644
> meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosulte=
-path.patch
> >>   create mode 100644
> meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-check=
-item.patch
> >>   create mode 100644
> meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patch
> >>
> >> diff --git
> a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosul=
te-path.patch
> b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosul=
te-path.patch
> >> new file mode 100644
> >> index 0000000000..c48ee9f820
> >> --- /dev/null
> >> +++
> b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-abosul=
te-path.patch
> >> @@ -0,0 +1,46 @@
> >> +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 200=
1
> >> +From: Mingli Yu <mingli.yu@windriver.com>
> >> +Date: Mon, 17 Jun 2024 11:22:21 +0800
> >> +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
> >> +
> >> +Use the abosulte path otherwise we won't find the expected file blah.
> >> +
> >> +Upstream-Status: Submitted [
> https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00001.html]
> >> +
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> +---
> >> + test/nfs/nfs-dir.test | 8 ++++----
> >> + 1 file changed, 4 insertions(+), 4 deletions(-)
> >> +
> >> +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
> >> +index 33e5f5f..7216a6e 100644
> >> +--- a/test/nfs/nfs-dir.test
> >> ++++ b/test/nfs/nfs-dir.test
> >> +@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the
> working directory.
> >> +       Make sure the file can be accessed before.
> >> +
> >> +       $ su bin
> >> +-      $ cat test/blah
> >> ++      $ cat %{EXPORT_PATH}/test/blah
> >> +       > blah
> >> +
> >> +       Set up a situation that triggers the bug.
> >> +@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at the
> working directory.
> >> +       fail with "Stale NFS file handle" or "Input/output error".
> >> +
> >> +       $ su bin
> >> +-      $ cat test/blah
> >> ++      $ cat %{EXPORT_PATH}/test/blah
> >> +       > blah
> >> +       $ sleep 3
> >> +-      $ cat test/blah
> >> ++      $ cat %{EXPORT_PATH}/test/blah
> >> +       > blah
> >> +-      $ cat test/blah
> >> ++      $ cat %{EXPORT_PATH}/test/blah
> >> +       > blah
> >> +
> >> +       Clean up.
> >> +--
> >> +2.34.1
> >> +
> >> diff --git
> a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-che=
ck-item.patch
> b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-che=
ck-item.patch
> >> new file mode 100644
> >> index 0000000000..f990ca4a31
> >> --- /dev/null
> >> +++
> b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the-che=
ck-item.patch
> >> @@ -0,0 +1,51 @@
> >> +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 200=
1
> >> +From: Mingli Yu <mingli.yu@windriver.com>
> >> +Date: Mon, 17 Jun 2024 11:00:43 +0800
> >> +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
> >> +
> >> +The date such as "Jun 13" should take 2 columns, so the expected chec=
k
> >> +item "test/sub2" should the column 9.
> >> + # ls test/sub2 -dl
> >> +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
> >> +
> >> +Upstream-Status: Submitted [
> https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00002.html]
> >> +
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> +---
> >> + test/nfs/nfsacl.test | 6 +++---
> >> + 1 file changed, 3 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
> >> +index 4f37322..dfcc323 100644
> >> +--- a/test/nfs/nfsacl.test
> >> ++++ b/test/nfs/nfsacl.test
> >> +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with AC=
L
> support.
> >> +       $ echo blah > test/sub/blah
> >> +
> >> +       $ cp -rp test/sub test/sub2
> >> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> >> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> >> +       > drwxr-xr-x test/sub2
> >> +       > -rw-r--r-- test/sub2/blah
> >> +
> >> +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with
> ACL support.
> >> +       >
> >> +
> >> +       $ cp -rp test/sub test/sub2
> >> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> >> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> >> +       > drwxrwxr-x+ test/sub2
> >> +       > -rw-r--r-- test/sub2/blah
> >> +
> >> +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with
> ACL support.
> >> +
> >> +       $ setfacl -m u:daemon:rw test/sub/blah
> >> +       $ cp -rp test/sub test/sub2
> >> +-      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
> >> ++      $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
> >> +       > drwxrwxr-x+ test/sub2
> >> +       > -rw-rw-r--+ test/sub2/blah
> >> +
> >> +--
> >> +2.34.1
> >> +
> >> diff --git
> a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patc=
h
> b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patc=
h
> >> new file mode 100644
> >> index 0000000000..2fea254fec
> >> --- /dev/null
> >> +++
> b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.patc=
h
> >> @@ -0,0 +1,67 @@
> >> +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@red=
hat.com>
> >> +Date: Wed, 19 Jun 2024 11:11:30 +0800
> >> +Subject: [PATCH] tests: fix getpwnam and getgrnam
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +The calls to these functions would always fail because the size of th=
e
> buffer
> >> +was smaller than the minimum (170000) specified in the test
> implementations
> >> +of getgrnam_r and getpwnam_r.  Use test_get*_match directly because
> getpwnam
> >> +and getgrnam should never fail on ERANGE.
> >> +
> >> +This commit fixes the following failure in the test/root/restore.test
> test:
> >> +
> >> +[21] $ chown bin passwd -- failed
> >> +chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
> >> +
> >> +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe
> getpwnam_r
> >> +and getgrnam_r")
> >> +
> >> +Upstream-Status: Submitted [
> https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00000.html]
> >> +
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> +---
> >> + test/test_group.c  | 2 +-
> >> + test/test_passwd.c | 4 ++--
> >> + 2 files changed, 3 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/test/test_group.c b/test/test_group.c
> >> +index 96dd612..42d6b07 100644
> >> +--- a/test/test_group.c
> >> ++++ b/test/test_group.c
> >> +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
> >> +       static struct group grp;
> >> +       struct group *result;
> >> +
> >> +-      (void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
> >> ++      (void) test_getgr_match(&grp, buf, sizeof buf, &result,
> match_name, name);
> >> +       return result;
> >> + }
> >> +
> >> +diff --git a/test/test_passwd.c b/test/test_passwd.c
> >> +index 9428bf8..97f2673 100644
> >> +--- a/test/test_passwd.c
> >> ++++ b/test/test_passwd.c
> >> +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd
> *pwd, char *buf, size_t buflen,
> >> +               *result =3D NULL;
> >> +               return ERANGE;
> >> +       }
> >> +-      last_buflen =3D- 1;
> >> ++      last_buflen =3D -1;
> >> +
> >> +       return test_getpw_match(pwd, buf, buflen, result, match_name,
> name);
> >> + }
> >> +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
> >> +       static struct passwd pwd;
> >> +       struct passwd *result;
> >> +
> >> +-      (void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
> >> ++      (void) test_getpw_match(&pwd, buf, sizeof(buf), &result,
> match_name, name);
> >> +       return result;
> >> + }
> >> +
> >> +--
> >> +2.34.1
> >> +
> >> diff --git a/meta/recipes-support/attr/acl/run-ptest
> b/meta/recipes-support/attr/acl/run-ptest
> >> index 3af75c84fe..bc7947c3ad 100644
> >> --- a/meta/recipes-support/attr/acl/run-ptest
> >> +++ b/meta/recipes-support/attr/acl/run-ptest
> >> @@ -6,8 +6,10 @@
> >>
> >>   mkdir -p /tmp/acl-ptest/test
> >>   cp test/test.* /tmp/acl-ptest/test
> >> +export EXPORT_PATH=3D"/tmp/acl-ptest/test"
> >>
> >>   set +e
> >> +rm -rf test-suite.log
> >>   make test-suite.log
> >>   exitcode=3D$?
> >>   if [ $exitcode -ne 0 -a -e test-suite.log ]; then
> >> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb
> b/meta/recipes-support/attr/acl_2.3.2.bb
> >> index 6178473873..5ac085c322 100644
> >> --- a/meta/recipes-support/attr/acl_2.3.2.bb
> >> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
> >> @@ -19,6 +19,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz=
 \
> >>              file://run-ptest \
> >>
> file://0001-tests-do-not-hardcode-the-build-path-into-a-helper-l.patch \
> >>              file://0001-test-patch-out-failing-bits.patch \
> >> +
>  file://0001-test-nfs-nfsacl.test-Correct-the-check-item.patch \
> >> +
>  file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch \
> >> +           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
> >>              "
> >>
> >>   SRC_URI[sha256sum] =3D
> "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
> >> @@ -65,6 +68,7 @@ do_install_ptest:append:libc-musl() {
> >>   }
> >>
> >>   RDEPENDS:${PN}-ptest =3D "acl \
> >> +                        attr \
> >>                           bash \
> >>                           coreutils \
> >>                           perl \
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#201188):
> https://lists.openembedded.org/g/openembedded-core/message/201188
> >> Mute This Topic: https://lists.openembedded.org/mt/106904866/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000217be2061c31f825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 1, 2024 at 1:25=E2=80=AFAM Yu, Mingli &lt;<a hr=
ef=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 6/28/24 02:21, Khem Raj wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt; <br>
&gt; I am seeing two XPASSes which is ok but the test runs reports failure =
back<br>
<br>
It is because the two cases defined as XFAIL_TESTS <br>
<a href=3D"https://git.savannah.nongnu.org/cgit/acl.git/tree/test/Makemodul=
e.am#n1" rel=3D"noreferrer" target=3D"_blank">https://git.savannah.nongnu.o=
rg/cgit/acl.git/tree/test/Makemodule.am#n1</a> <br>
and per<br>
<a href=3D"https://www.gnu.org/software/automake/manual/html_node/Generalit=
ies-about-Testing.html" rel=3D"noreferrer" target=3D"_blank">https://www.gn=
u.org/software/automake/manual/html_node/Generalities-about-Testing.html</a=
>, <br>
<br>
```<br>
In case a test that is expected to fail ends up passing instead, many <br>
testing environments will flag the result as a special kind of failure <br>
called unexpected pass (or xpass).<br>
```</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s =
fine here we need to treat them as passes so the return from tests do not c=
onfuse the preset runner=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"a=
uto"><br>
Thanks,<br>
<br>
&gt; <br>
&gt; root@qemux86-64:/usr/lib/acl/ptest# ./run-ptest<br>
&gt; PASS: test/cp.test<br>
&gt; PASS: test/getfacl-lfs.test<br>
&gt; PASS: test/getfacl-noacl.test<br>
&gt; PASS: test/getfacl-recursive.test<br>
&gt; PASS: test/malformed-restore.test<br>
&gt; PASS: test/misc.test<br>
&gt; PASS: test/sbits-restore.test<br>
&gt; PASS: test/setfacl-X.test<br>
&gt; PASS: test/utf8-filenames.test<br>
&gt; PASS: test/root/getfacl.test<br>
&gt; PASS: test/root/permissions.test<br>
&gt; PASS: test/root/restore.test<br>
&gt; PASS: test/root/setfacl.test<br>
&gt; XPASS: test/nfs/nfsacl.test<br>
&gt; XPASS: test/nfs/nfs-dir.test<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; Testsuite summary for acl 2.3.2<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; # TOTAL: 15<br>
&gt; # PASS:=C2=A0 13<br>
&gt; # SKIP:=C2=A0 0<br>
&gt; # XFAIL: 0<br>
&gt; # FAIL:=C2=A0 0<br>
&gt; # XPASS: 2<br>
&gt; # ERROR: 0<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; See ./test-suite.log<br>
&gt; Please report to <a href=3D"mailto:acl-devel@nongnu.org" target=3D"_bl=
ank">acl-devel@nongnu.org</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; make: *** [Makefile:2064: test-suite.log] Error 1<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0acl 2.3.2: ./test-suite.log<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; # TOTAL: 15<br>
&gt; # PASS:=C2=A0 13<br>
&gt; # SKIP:=C2=A0 0<br>
&gt; # XFAIL: 0<br>
&gt; # FAIL:=C2=A0 0<br>
&gt; # XPASS: 2<br>
&gt; # ERROR: 0<br>
&gt; <br>
&gt; .. contents:: :depth: 2<br>
&gt; <br>
&gt; XPASS: test/nfs/nfsacl<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; <br>
&gt; [6] $ umask 022 -- ok<br>
&gt; [7] $ mkdir -p test/sub -- ok<br>
&gt; [8] $ echo blah &gt; test/sub/blah -- ok<br>
&gt; [10] $ cp -rp test/sub test/sub2 -- ok<br>
&gt; [11] $ find test/sub2 | sort | xargs ls -dl | awk &#39;{print $1,$9}&#=
39; -- ok<br>
&gt; [15] $ rm -rf test/sub2 -- ok<br>
&gt; [17] $ setfacl -m u:daemon:rwx test/sub -- ok<br>
&gt; [18] $ setfacl -dm u:daemon:rwx test/sub -- ok<br>
&gt; [19] $ getfattr -m- test/sub -- ok<br>
&gt; [25] $ cp -rp test/sub test/sub2 -- ok<br>
&gt; [26] $ find test/sub2 | sort | xargs ls -dl | awk &#39;{print $1,$9}&#=
39; -- ok<br>
&gt; [30] $ rm -rf test/sub2 -- ok<br>
&gt; [32] $ setfacl -m u:daemon:rw test/sub/blah -- ok<br>
&gt; [33] $ cp -rp test/sub test/sub2 -- ok<br>
&gt; [34] $ find test/sub2 | sort | xargs ls -dl | awk &#39;{print $1,$9}&#=
39; -- ok<br>
&gt; [38] $ rm -rf test/sub2 -- ok<br>
&gt; [42] $ rm -rf test -- ok<br>
&gt; 17 commands (17 passed, 0 failed)<br>
&gt; XPASS test/nfs/nfsacl.test (exit status: 0)<br>
&gt; <br>
&gt; XPASS: test/nfs/nfs-dir<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
&gt; <br>
&gt; [10] $ umask 022 -- ok<br>
&gt; [11] $ mkdir /tmp/acl-ptest/test/test -- ok<br>
&gt; [12] $ echo blah &gt; /tmp/acl-ptest/test/test/blah -- ok<br>
&gt; [16] $ su bin -- ok<br>
&gt; [17] $ cat /tmp/acl-ptest/test/test/blah -- ok<br>
&gt; [22] $ su -- ok<br>
&gt; [23] $ chmod go-rwx /tmp/acl-ptest/test/test -- ok<br>
&gt; [24] $ setfacl -m u:bin:rx /tmp/acl-ptest/test/test -- ok<br>
&gt; [25] $ ls -dl /tmp/acl-ptest/test/test | awk &#39;{print $1, $3, $4}&#=
39; -- ok<br>
&gt; [27] $ getfacl --omit-header /tmp/acl-ptest/test/test 2&gt; /dev/null =
-- ok<br>
&gt; [38] $ su bin -- ok<br>
&gt; [39] $ cat /tmp/acl-ptest/test/test/blah -- ok<br>
&gt; [41] $ sleep 3 -- ok<br>
&gt; [42] $ cat /tmp/acl-ptest/test/test/blah -- ok<br>
&gt; [44] $ cat /tmp/acl-ptest/test/test/blah -- ok<br>
&gt; [49] $ su -- ok<br>
&gt; [50] $ rm -rf /tmp/acl-ptest/test/test -- ok<br>
&gt; 17 commands (17 passed, 0 failed)<br>
&gt; XPASS test/nfs/nfs-dir.test (exit status: 0)<br>
&gt; <br>
&gt; On Thu, Jun 27, 2024 at 12:04=E2=80=AFAM Yu, Mingli via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; &lt;mingli.yu=3D<a href=3D"mailto:eng.windriver.com@lists.openembedded=
.org" target=3D"_blank">eng.windriver.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; * The date such as &quot;Jun 13&quot; should take 2 columns, so th=
e expected check<br>
&gt;&gt; item &quot;test/sub2&quot; should the column 9.<br>
&gt;&gt;=C2=A0 =C2=A0# ls test/sub2 -dl<br>
&gt;&gt;=C2=A0 =C2=A0drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 Corret the check item to fix the below failure in the=
 test/nfsacl.test.<br>
&gt;&gt;=C2=A0 =C2=A0 [11] $ find test/sub2 | sort | xargs ls -dl | awk &#3=
9;{print $1,$8}&#39; -- failed<br>
&gt;&gt;=C2=A0 =C2=A0 drwxr-xr-x 07:23=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D drwxr-xr-x test/sub2<br>
&gt;&gt;=C2=A0 =C2=A0 -rw-r--r-- 07:23=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D -rw-r--r-- test/sub2/blah<br=
>
&gt;&gt;<br>
&gt;&gt; * Use the abosulte path otherwise we won&#39;t find the expected f=
ile blah.<br>
&gt;&gt;<br>
&gt;&gt; * The calls to getgrnam_r would always fail because the size of th=
e<br>
&gt;&gt; buffer was smaller than the minimum (170000) specified in the test=
<br>
&gt;&gt; implementations of getgrnam_r and getpwnam_r.=C2=A0 Use test_get*_=
match directly<br>
&gt;&gt; because getpwnam and getgrnam should never fail on ERANGE.<br>
&gt;&gt;<br>
&gt;&gt; This commit fixes the following failure in the test/nfs/nfs-dir.te=
st test:<br>
&gt;&gt;<br>
&gt;&gt; [16] $ su bin -- failed<br>
&gt;&gt; su: user bin does not exist=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0!=3D ~<br>
&gt;&gt;<br>
&gt;&gt; * Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix =
below<br>
&gt;&gt; test/nfs/nfsacl failure.<br>
&gt;&gt;=C2=A0 =C2=A0 [19] $ getfattr -m- test/sub -- failed\n&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Can\&#39;t exec &quot;getfat=
tr&quot;: Nosuch file or directory at ./test/run line &#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0369, &lt;TEST_FILE&gt; line 24. !=
=3D # file: test/sub\n&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;getfattr: No such file or di=
rectory=C2=A0 =C2=A0!=3D system.posix_acl_access\n&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;~=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0!=3D system.posix_acl_default\n&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;~<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver=
.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++=
++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0...s-nfsacl.test-Correct-the-check-item.patch | 51 +++=
+++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++=
++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-support/attr/acl/run-ptest=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-support/attr/<a href=3D"http://acl_2.3.2.=
bb" rel=3D"noreferrer" target=3D"_blank">acl_2.3.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;&gt;=C2=A0 =C2=A05 files changed, 170 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/attr/acl/0001-=
test-nfs-nfs-dir.test-Use-the-abosulte-path.patch<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/attr/acl/0001-=
test-nfs-nfsacl.test-Correct-the-check-item.patch<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/attr/acl/0001-=
tests-fix-getpwnam-and-getgrnam.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.t=
est-Use-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-n=
fs-nfs-dir.test-Use-the-abosulte-path.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..c48ee9f820<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use=
-the-abosulte-path.patch<br>
&gt;&gt; @@ -0,0 +1,46 @@<br>
&gt;&gt; +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; +Date: Mon, 17 Jun 2024 11:22:21 +0800<br>
&gt;&gt; +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path<br>
&gt;&gt; +<br>
&gt;&gt; +Use the abosulte path otherwise we won&#39;t find the expected fi=
le blah.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Submitted [<a href=3D"https://lists.nongnu.org/a=
rchive/html/acl-devel/2024-06/msg00001.html" rel=3D"noreferrer" target=3D"_=
blank">https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00001.htm=
l</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windrive=
r.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + test/nfs/nfs-dir.test | 8 ++++----<br>
&gt;&gt; + 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test<br>
&gt;&gt; +index 33e5f5f..7216a6e 100644<br>
&gt;&gt; +--- a/test/nfs/nfs-dir.test<br>
&gt;&gt; ++++ b/test/nfs/nfs-dir.test<br>
&gt;&gt; +@@ -14,7 +14,7 @@ EXPORT_PATH =3D&gt; the path that is mounted at=
 the working directory.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Make sure the file can be accessed bef=
ore.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ su bin<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $ cat test/blah<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $ cat %{EXPORT_PATH}/test/blah<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; blah<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Set up a situation that triggers the b=
ug.<br>
&gt;&gt; +@@ -36,12 +36,12 @@ EXPORT_PATH =3D&gt; the path that is mounted =
at the working directory.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fail with &quot;Stale NFS file handle&=
quot; or &quot;Input/output error&quot;.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ su bin<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $ cat test/blah<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $ cat %{EXPORT_PATH}/test/blah<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; blah<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sleep 3<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $ cat test/blah<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $ cat %{EXPORT_PATH}/test/blah<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; blah<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $ cat test/blah<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $ cat %{EXPORT_PATH}/test/blah<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; blah<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Clean up.<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.te=
st-Correct-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-n=
fs-nfsacl.test-Correct-the-check-item.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..f990ca4a31<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Corr=
ect-the-check-item.patch<br>
&gt;&gt; @@ -0,0 +1,51 @@<br>
&gt;&gt; +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; +Date: Mon, 17 Jun 2024 11:00:43 +0800<br>
&gt;&gt; +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item<br>
&gt;&gt; +<br>
&gt;&gt; +The date such as &quot;Jun 13&quot; should take 2 columns, so the=
 expected check<br>
&gt;&gt; +item &quot;test/sub2&quot; should the column 9.<br>
&gt;&gt; + # ls test/sub2 -dl<br>
&gt;&gt; +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Submitted [<a href=3D"https://lists.nongnu.org/a=
rchive/html/acl-devel/2024-06/msg00002.html" rel=3D"noreferrer" target=3D"_=
blank">https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00002.htm=
l</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windrive=
r.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + test/nfs/nfsacl.test | 6 +++---<br>
&gt;&gt; + 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test<br>
&gt;&gt; +index 4f37322..dfcc323 100644<br>
&gt;&gt; +--- a/test/nfs/nfsacl.test<br>
&gt;&gt; ++++ b/test/nfs/nfsacl.test<br>
&gt;&gt; +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount wit=
h ACL support.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ echo blah &gt; test/sub/blah<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ cp -rp test/sub test/sub2<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $ find test/sub2 | sort | xargs ls -dl | aw=
k &#39;{print $1,$8}&#39;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $ find test/sub2 | sort | xargs ls -dl | aw=
k &#39;{print $1,$9}&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; drwxr-xr-x test/sub2<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r--r-- test/sub2/blah<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount w=
ith ACL support.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ cp -rp test/sub test/sub2<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $ find test/sub2 | sort | xargs ls -dl | aw=
k &#39;{print $1,$8}&#39;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $ find test/sub2 | sort | xargs ls -dl | aw=
k &#39;{print $1,$9}&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; drwxrwxr-x+ test/sub2<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-r--r-- test/sub2/blah<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount w=
ith ACL support.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ setfacl -m u:daemon:rw test/sub/blah=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$ cp -rp test/sub test/sub2<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 $ find test/sub2 | sort | xargs ls -dl | aw=
k &#39;{print $1,$8}&#39;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 $ find test/sub2 | sort | xargs ls -dl | aw=
k &#39;{print $1,$9}&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; drwxrwxr-x+ test/sub2<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; -rw-rw-r--+ test/sub2/blah<br>
&gt;&gt; +<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam=
-and-getgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam=
-and-getgrnam.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..2fea254fec<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-ge=
tgrnam.patch<br>
&gt;&gt; @@ -0,0 +1,67 @@<br>
&gt;&gt; +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D &lt;<a h=
ref=3D"mailto:lzaoral@redhat.com" target=3D"_blank">lzaoral@redhat.com</a>&=
gt;<br>
&gt;&gt; +Date: Wed, 19 Jun 2024 11:11:30 +0800<br>
&gt;&gt; +Subject: [PATCH] tests: fix getpwnam and getgrnam<br>
&gt;&gt; +MIME-Version: 1.0<br>
&gt;&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt;&gt; +Content-Transfer-Encoding: 8bit<br>
&gt;&gt; +<br>
&gt;&gt; +The calls to these functions would always fail because the size o=
f the buffer<br>
&gt;&gt; +was smaller than the minimum (170000) specified in the test imple=
mentations<br>
&gt;&gt; +of getgrnam_r and getpwnam_r.=C2=A0 Use test_get*_match directly =
because getpwnam<br>
&gt;&gt; +and getgrnam should never fail on ERANGE.<br>
&gt;&gt; +<br>
&gt;&gt; +This commit fixes the following failure in the test/root/restore.=
test test:<br>
&gt;&gt; +<br>
&gt;&gt; +[21] $ chown bin passwd -- failed<br>
&gt;&gt; +chown: invalid user: =E2=80=98bin=E2=80=99=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 !=3D ~<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 (&quot;use thread=
-safe getpwnam_r<br>
&gt;&gt; +and getgrnam_r&quot;)<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Submitted [<a href=3D"https://lists.nongnu.org/a=
rchive/html/acl-devel/2024-06/msg00000.html" rel=3D"noreferrer" target=3D"_=
blank">https://lists.nongnu.org/archive/html/acl-devel/2024-06/msg00000.htm=
l</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windrive=
r.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + test/test_group.c=C2=A0 | 2 +-<br>
&gt;&gt; + test/test_passwd.c | 4 ++--<br>
&gt;&gt; + 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/test/test_group.c b/test/test_group.c<br>
&gt;&gt; +index 96dd612..42d6b07 100644<br>
&gt;&gt; +--- a/test/test_group.c<br>
&gt;&gt; ++++ b/test/test_group.c<br>
&gt;&gt; +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0static struct group grp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct group *result;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 (void) getgrnam_r(name, &amp;grp, buf, size=
of(buf), &amp;result);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 (void) test_getgr_match(&amp;grp, buf, size=
of buf, &amp;result, match_name, name);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/test/test_passwd.c b/test/test_passwd.c<br>
&gt;&gt; +index 9428bf8..97f2673 100644<br>
&gt;&gt; +--- a/test/test_passwd.c<br>
&gt;&gt; ++++ b/test/test_passwd.c<br>
&gt;&gt; +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passw=
d *pwd, char *buf, size_t buflen,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*result =
=3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERA=
NGE;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 last_buflen =3D- 1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 last_buflen =3D -1;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return test_getpw_match(pwd, buf, bufl=
en, result, match_name, name);<br>
&gt;&gt; + }<br>
&gt;&gt; +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0static struct passwd pwd;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct passwd *result;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 (void) getpwnam_r(name, &amp;pwd, buf, size=
of(buf), &amp;result);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 (void) test_getpw_match(&amp;pwd, buf, size=
of(buf), &amp;result, match_name, name);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipe=
s-support/attr/acl/run-ptest<br>
&gt;&gt; index 3af75c84fe..bc7947c3ad 100644<br>
&gt;&gt; --- a/meta/recipes-support/attr/acl/run-ptest<br>
&gt;&gt; +++ b/meta/recipes-support/attr/acl/run-ptest<br>
&gt;&gt; @@ -6,8 +6,10 @@<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0mkdir -p /tmp/acl-ptest/test<br>
&gt;&gt;=C2=A0 =C2=A0cp test/test.* /tmp/acl-ptest/test<br>
&gt;&gt; +export EXPORT_PATH=3D&quot;/tmp/acl-ptest/test&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0set +e<br>
&gt;&gt; +rm -rf test-suite.log<br>
&gt;&gt;=C2=A0 =C2=A0make test-suite.log<br>
&gt;&gt;=C2=A0 =C2=A0exitcode=3D$?<br>
&gt;&gt;=C2=A0 =C2=A0if [ $exitcode -ne 0 -a -e test-suite.log ]; then<br>
&gt;&gt; diff --git a/meta/recipes-support/attr/<a href=3D"http://acl_2.3.2=
.bb" rel=3D"noreferrer" target=3D"_blank">acl_2.3.2.bb</a> b/meta/recipes-s=
upport/attr/<a href=3D"http://acl_2.3.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">acl_2.3.2.bb</a><br>
&gt;&gt; index 6178473873..5ac085c322 100644<br>
&gt;&gt; --- a/meta/recipes-support/attr/<a href=3D"http://acl_2.3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">acl_2.3.2.bb</a><br>
&gt;&gt; +++ b/meta/recipes-support/attr/<a href=3D"http://acl_2.3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">acl_2.3.2.bb</a><br>
&gt;&gt; @@ -19,6 +19,9 @@ SRC_URI =3D &quot;${SAVANNAH_GNU_MIRROR}/acl/${B=
P}.tar.gz \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-=
do-not-hardcode-the-build-path-into-a-helper-l.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test-p=
atch-out-failing-bits.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-nfs-nfs=
acl.test-Correct-the-check-item.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-nfs-nfs=
-dir.test-Use-the-abosulte-path.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-fix-ge=
tpwnam-and-getgrnam.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;5f2bdbad629707aa7d85c623f=
994aa8a1d2dec55a73de5205bac0bf6058a2f7c&quot;<br>
&gt;&gt; @@ -65,6 +68,7 @@ do_install_ptest:append:libc-musl() {<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0RDEPENDS:${PN}-ptest =3D &quot;acl \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 attr \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bash \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0coreutils \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perl \<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#201188): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/201188" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/201188</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1069=
04866/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/106904866/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000217be2061c31f825--

