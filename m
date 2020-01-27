Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id B37FB6C44A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 16:26:03 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id i78so2813941vke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 08:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hib1wyxi4y26lZPWrVzCurZ6hVNZcV3yB3gq6cnv0cA=;
	b=Pk1f/qaL/qED7hpQntxDCXIvVBD0o3uD98bJHHs5+WOZNiHK059xh2ZoAxlq0J3y9W
	ZwL9ZoVXoj12cflD8BryfsCTSTqSQc4xgAbGwPDFiPPFB0TwTv4utVjhRrQgSa+O/KNW
	Y+/8jbuN+tMLR0V/xnDo1jWRgKPo2YNTmBVPUQm7LrS3qJQmCuIPqMWHLEmyVCtDAB2G
	HN6Zu6yosmbFXxPnlc4PHqX/l5L9745BBpIpqOxhON1ITtQadPLQG9ffTvSCTtllFrpT
	VtVitl70mKdbGMkeuLaHYolgNmVS66raVxrFMuAzLOymvv+BvUb17QWA3svcfT7wROQr
	H2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hib1wyxi4y26lZPWrVzCurZ6hVNZcV3yB3gq6cnv0cA=;
	b=FkflTqPWQVRig/NC2x18WTF0oh6V12JFn4ZA+zFxK47gU49VmapZAp/PH8GQIhgmE/
	aVNMCA8EksZ+D1Av7/nG3plBb9Rk7TQ8sy8XNyNd+BLSzC6WXzrPrhKmqnjXUUBvfu9m
	/rqCvUgbo1isniHNVIqPvaGJyZJdxTHSjseRCXz/FEnlgLPKwvDLpaR1jRWnEER+s5mh
	v1aHrWbCVs0h2XFCIMMgG3hsh8ADbW9Mjy0P9hHTs83VltZ0CFHN4TaZVMzX83QYTms+
	hqkNKVxnmayUVvBmR3btr/tOhNOOgeV+boQuHXC8etDN0yvbqWPLqGY/U8jNvSyHw8PS
	pLYQ==
X-Gm-Message-State: APjAAAXunngEXQd2Hwof8X2wzeVHvUOMICSkKbUf13sO20qFEijsHJuu
	J+qbuLY5Hn67nwbBH4bRL0CfkU+o4APiV9H1HH8=
X-Google-Smtp-Source: APXvYqxEur2VlDAlO8suCjBEN7jLqak9BlsbTWnvXx70HQrUD9U9rM7iDs+//QZp4CPkSgDgSvPB5irD/jwPC2/AZk8=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr10783611vkc.29.1580142364197;
	Mon, 27 Jan 2020 08:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-8-alex.kanavin@gmail.com>
	<9e7dbe8d-43f2-494c-02da-65f8bc6194f6@gmail.com>
In-Reply-To: <9e7dbe8d-43f2-494c-02da-65f8bc6194f6@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Jan 2020 17:25:53 +0100
Message-ID: <CANNYZj81UOWvO0AEbBpR3ObLSSeU6b8Z9vrK68v=vKsPAsgOZg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] valgrind: fix the remaining ptest failures
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
X-List-Received-Date: Mon, 27 Jan 2020 16:26:04 -0000
Content-Type: multipart/alternative; boundary="000000000000500b80059d2190df"

--000000000000500b80059d2190df
Content-Type: text/plain; charset="UTF-8"

Now that ptests are actually run on the autobuilder for both x86 and arm64,
we can look at whether anything still fails with this patchset. I tested on
the x86 with 100% pass, but not on arm.

My goal is to drop @expectedfail from ptests, because otherwise ptests keep
regressing with nobody caring or paying attention. Better to catch and
reject regressions when they happen I think.

Alex

On Mon, 27 Jan 2020 at 16:53, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 1/27/20 6:19 AM, Alexander Kanavin wrote:
> > Particularly, one test is disabled as it is failing everywhere,
> > two patches that actually cause failures are dropped and
> > some binaries are prevented from being stripped where that is
> > expected.
> So this will address either
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13666  and
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13520 ?
>
> - armin
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 +++++++++++++++++++
> >  ...rind-adjust-std_list-expected-output.patch | 32 -----------------
> >  ...Dereference-pthread_t-before-adding-.patch | 32 -----------------
> >  .../valgrind/valgrind_3.15.0.bb               | 23 +++++++++++--
> >  4 files changed, 55 insertions(+), 66 deletions(-)
> >  create mode 100644
> meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> >  delete mode 100644
> meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> >  delete mode 100644
> meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> >
> > diff --git
> a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> > new file mode 100644
> > index 00000000000..d641998d721
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> > @@ -0,0 +1,34 @@
> > +From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Fri, 24 Jan 2020 17:55:39 +0100
> > +Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
> > +
> > +In oe-core, /tmp is linked to /var/volatile/tmp and
> > +valgrind output changes accordingly
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + none/tests/fdleak_cmsg.stderr.exp | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/none/tests/fdleak_cmsg.stderr.exp
> b/none/tests/fdleak_cmsg.stderr.exp
> > +index 6e5a797b9..0ede1ab18 100644
> > +--- a/none/tests/fdleak_cmsg.stderr.exp
> > ++++ b/none/tests/fdleak_cmsg.stderr.exp
> > +@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
> > +
> > +
> > + FILE DESCRIPTORS: 6 open at exit.
> > +-Open file descriptor ...: /tmp/data2
> > ++Open file descriptor ...: ...
> > +    ...
> > +
> > +-Open file descriptor ...: /tmp/data1
> > ++Open file descriptor ...: ...
> > +    ...
> > +
> > + Open AF_UNIX socket ...: <unknown>
> > +--
> > +2.17.1
> > +
> > diff --git
> a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> b/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> > deleted file mode 100644
> > index a82972ec1b6..00000000000
> > ---
> a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From 6e1e9265b03cf51d09c028d657fe826d7156a783 Mon Sep 17 00:00:00 2001
> > -From: Randy MacLeod <Randy.MacLeod@windriver.com>
> > -Date: Mon, 13 May 2019 17:26:26 -0400
> > -Subject: [PATCH 2/2] valgrind: adjust std_list expected output
> > -
> > -The run-ptest script uses a custom --yocto-ptest option
> > -to change the summary statistics that valgrind issues
> > -to a format that matches what ptest-runner expects.
> > -
> > -Only this std_list test which checks that strcpy() works
> > -properly on Ubuntu-12.04 and later is affected by this change.
> > -It's normal output when called with --yocto-ptest is a blank
> > -line so adjust the expected output.
> > -
> > -Upstream-Status: Inappropriate [Yocto specific]
> > -
> > -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ----
> > - drd/tests/std_list.stderr.exp | 2 --
> > - 1 file changed, 2 deletions(-)
> > -
> > -diff --git a/drd/tests/std_list.stderr.exp
> b/drd/tests/std_list.stderr.exp
> > -index d18786f80..8b1378917 100644
> > ---- a/drd/tests/std_list.stderr.exp
> > -+++ b/drd/tests/std_list.stderr.exp
> > -@@ -1,3 +1 @@
> > -
> > --
> > --ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
> > ---
> > -2.17.0
> > -
> > diff --git
> a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> b/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> > deleted file mode 100644
> > index 05886c743dc..00000000000
> > ---
> a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From a6547fc17c120dbd95b852f50b0c4bdee4fedb9a Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 10 Jun 2017 01:20:32 -0700
> > -Subject: [PATCH 6/6] pth_detached3.c: Dereference pthread_t before
> adding
> > - offset to it
> > -
> > -Fixes
> > -error: invalid use of undefined type 'struct __pthread'
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - drd/tests/pth_detached3.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
> > -index c02eef1..35d43a6 100644
> > ---- a/drd/tests/pth_detached3.c
> > -+++ b/drd/tests/pth_detached3.c
> > -@@ -21,7 +21,7 @@ int main(int argc, char** argv)
> > -   pthread_detach(thread);
> > -
> > -   /* Invoke pthread_detach() with an invalid thread ID. */
> > --  pthread_detach(thread + 8);
> > -+  pthread_detach((pthread_t*)(&thread + 8));
> > -
> > -   fprintf(stderr, "Finished.\n");
> > -
> > ---
> > -2.13.1
> > -
> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> > index 6a3834cfdc6..0f86aa44ca6 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> > @@ -29,7 +29,6 @@ SRC_URI = "
> https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
> >
>  file://0003-correct-include-directive-path-for-config.h.patch \
> >             file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
> >
>  file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
> > -
>  file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
> >
>  file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
> >             file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch
> \
> >
>  file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
> > @@ -38,9 +37,9 @@ SRC_URI = "
> https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
> >
>  file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
> >             file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
> >
>  file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
> > -           file://0002-valgrind-adjust-std_list-expected-output.patch \
> >             file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
> >             file://s390x_vec_op_t.patch \
> > +
>  file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
> >             "
> >  SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
> >  SRC_URI[sha256sum] =
> "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
> > @@ -205,4 +204,24 @@ do_install_ptest() {
> >      # handle multilib
> >      sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
> >      sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
> > +
> > +    # This test fails on the host as well, using both 3.15 and git
> master (as of Jan 24 2020)
> > +    # https://bugs.kde.org/show_bug.cgi?id=402833
> > +    rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
> > +
> > +    # As the binary isn't stripped or debug-splitted, the source file
> isn't fetched
> > +    # via dwarfsrcfiles either, so it needs to be installed manually.
> > +    mkdir -p
> ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
> > +    install ${S}/none/tests/tls.c
> ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
> >  }
> > +
> > +# avoid stripping some generated binaries otherwise some of the tests
> will fail
> > +# run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
> > +INHIBIT_PACKAGE_STRIP_FILES = "\
> > +    ${PKGD}${PTEST_PATH}/none/tests/tls \
> > +    ${PKGD}${PTEST_PATH}/none/tests/tls.so \
> > +    ${PKGD}${PTEST_PATH}/none/tests/tls2.so \
> > +    ${PKGD}${PTEST_PATH}/helgrind/tests/tc09_bad_unlock \
> > +    ${PKGD}${PTEST_PATH}/memcheck/tests/manuel1 \
> > +    ${PKGD}${PTEST_PATH}/drd/tests/pth_detached3 \
> > +"
>
>

--000000000000500b80059d2190df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Now that ptests are actually run on the autobuilder f=
or both x86 and arm64, we can look at whether anything still fails with thi=
s patchset. I tested on the x86 with 100% pass, but not on arm.</div><div><=
br></div><div>My goal is to drop @expectedfail from ptests, because otherwi=
se ptests keep regressing with nobody caring or paying attention. Better to=
 catch and reject regressions when they happen I think.<br></div><div></div=
><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Jan 2020 at 16:53, akuster808=
 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 1/27/20 6:19 AM, Alexander Kanavin wrote:<br>
&gt; Particularly, one test is disabled as it is failing everywhere,<br>
&gt; two patches that actually cause failures are dropped and<br>
&gt; some binaries are prevented from being stripped where that is<br>
&gt; expected.<br>
So this will address either<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13666" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13666</a>=C2=A0 and<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13520" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13520</a> ?<br>
<br>
- armin<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 +++++++++++++=
++++++<br>
&gt;=C2=A0 ...rind-adjust-std_list-expected-output.patch | 32 -------------=
----<br>
&gt;=C2=A0 ...Dereference-pthread_t-before-adding-.patch | 32 -------------=
----<br>
&gt;=C2=A0 .../valgrind/<a href=3D"http://valgrind_3.15.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">valgrind_3.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 +++++++++++--<br>
&gt;=C2=A0 4 files changed, 55 insertions(+), 66 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-=
none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-=
valgrind-adjust-std_list-expected-output.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0006-=
pth_detached3.c-Dereference-pthread_t-before-adding-.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-f=
dleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgri=
nd/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 00000000000..d641998d721<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_c=
msg.stderr.exp-adjust-tmp-paths.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 24 Jan 2020 17:55:39 +0100<br>
&gt; +Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths=
<br>
&gt; +<br>
&gt; +In oe-core, /tmp is linked to /var/volatile/tmp and<br>
&gt; +valgrind output changes accordingly<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + none/tests/fdleak_cmsg.stderr.exp | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cm=
sg.stderr.exp<br>
&gt; +index 6e5a797b9..0ede1ab18 100644<br>
&gt; +--- a/none/tests/fdleak_cmsg.stderr.exp<br>
&gt; ++++ b/none/tests/fdleak_cmsg.stderr.exp<br>
&gt; +@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null<br>
&gt; + <br>
&gt; + <br>
&gt; + FILE DESCRIPTORS: 6 open at exit.<br>
&gt; +-Open file descriptor ...: /tmp/data2<br>
&gt; ++Open file descriptor ...: ...<br>
&gt; +=C2=A0 =C2=A0 ...<br>
&gt; + <br>
&gt; +-Open file descriptor ...: /tmp/data1<br>
&gt; ++Open file descriptor ...: ...<br>
&gt; +=C2=A0 =C2=A0 ...<br>
&gt; + <br>
&gt; + Open AF_UNIX socket ...: &lt;unknown&gt;<br>
&gt; +-- <br>
&gt; +2.17.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adj=
ust-std_list-expected-output.patch b/meta/recipes-devtools/valgrind/valgrin=
d/0002-valgrind-adjust-std_list-expected-output.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a82972ec1b6..00000000000<br>
&gt; --- a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std=
_list-expected-output.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -From 6e1e9265b03cf51d09c028d657fe826d7156a783 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com=
" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
&gt; -Date: Mon, 13 May 2019 17:26:26 -0400<br>
&gt; -Subject: [PATCH 2/2] valgrind: adjust std_list expected output<br>
&gt; -<br>
&gt; -The run-ptest script uses a custom --yocto-ptest option<br>
&gt; -to change the summary statistics that valgrind issues<br>
&gt; -to a format that matches what ptest-runner expects.<br>
&gt; -<br>
&gt; -Only this std_list test which checks that strcpy() works<br>
&gt; -properly on Ubuntu-12.04 and later is affected by this change.<br>
&gt; -It&#39;s normal output when called with --yocto-ptest is a blank<br>
&gt; -line so adjust the expected output.<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [Yocto specific]<br>
&gt; -<br>
&gt; -Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@wind=
river.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; - drd/tests/std_list.stderr.exp | 2 --<br>
&gt; - 1 file changed, 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/drd/tests/std_list.stderr.exp b/drd/tests/std_list.stder=
r.exp<br>
&gt; -index d18786f80..8b1378917 100644<br>
&gt; ---- a/drd/tests/std_list.stderr.exp<br>
&gt; -+++ b/drd/tests/std_list.stderr.exp<br>
&gt; -@@ -1,3 +1 @@<br>
&gt; - <br>
&gt; --<br>
&gt; --ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)<br>
&gt; --- <br>
&gt; -2.17.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached=
3.c-Dereference-pthread_t-before-adding-.patch b/meta/recipes-devtools/valg=
rind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.pat=
ch<br>
&gt; deleted file mode 100644<br>
&gt; index 05886c743dc..00000000000<br>
&gt; --- a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Der=
eference-pthread_t-before-adding-.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -From a6547fc17c120dbd95b852f50b0c4bdee4fedb9a Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 10 Jun 2017 01:20:32 -0700<br>
&gt; -Subject: [PATCH 6/6] pth_detached3.c: Dereference pthread_t before ad=
ding<br>
&gt; - offset to it<br>
&gt; -<br>
&gt; -Fixes<br>
&gt; -error: invalid use of undefined type &#39;struct __pthread&#39;<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - drd/tests/pth_detached3.c | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c<br=
>
&gt; -index c02eef1..35d43a6 100644<br>
&gt; ---- a/drd/tests/pth_detached3.c<br>
&gt; -+++ b/drd/tests/pth_detached3.c<br>
&gt; -@@ -21,7 +21,7 @@ int main(int argc, char** argv)<br>
&gt; -=C2=A0 =C2=A0pthread_detach(thread);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0/* Invoke pthread_detach() with an invalid thread ID. */=
<br>
&gt; --=C2=A0 pthread_detach(thread + 8);<br>
&gt; -+=C2=A0 pthread_detach((pthread_t*)(&amp;thread + 8));<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0fprintf(stderr, &quot;Finished.\n&quot;);<br>
&gt; - <br>
&gt; --- <br>
&gt; -2.13.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind=
_3.15.0.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.15.0.bb</a> b/m=
eta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.15.0.bb" rel=3D"=
noreferrer" target=3D"_blank">valgrind_3.15.0.bb</a><br>
&gt; index 6a3834cfdc6..0f86aa44ca6 100644<br>
&gt; --- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.15.0=
.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.15.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.15.0=
.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.15.0.bb</a><br>
&gt; @@ -29,7 +29,6 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/=
pub/valgrind/valgrind-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blan=
k">https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-correct-inc=
lude-directive-path-for-config.h.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-pth_atfork1=
.c-Define-error-API-for-musl.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-tc20_verify=
wrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-pth_detached3.c-=
Dereference-pthread_t-before-adding-.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-memcheck-ar=
m64-Define-__THROW-if-not-already-defined.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-memcheck-x8=
6-Define-__THROW-if-not-defined.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-seg_o=
verride-Replace-__modify_ldt-with-syscall.patch \<br>
&gt; @@ -38,9 +37,9 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/=
pub/valgrind/valgrind-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blan=
k">https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Make-local-=
functions-static-to-avoid-assembler-error.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Return-a-va=
lid-exit_code-from-vg_regtest.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-valgrind-fi=
lter_xml_frames-do-not-filter-usr.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-valgrind-adjust-=
std_list-expected-output.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-adjust-path=
-filter-for-2-memcheck-tests.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://s390x_vec_op_t.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-none-tests-fdlea=
k_cmsg.stderr.exp-adjust-tmp-paths.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;46e5fbdcbc3502a5976a317a0860a975&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;417c7a9da8f60dd05698b3a7bc6002e4ef9=
96f14c13f0ff96679a16873e78ab1&quot;<br>
&gt; @@ -205,4 +204,24 @@ do_install_ptest() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # handle multilib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/ru=
n-ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/ru=
n-ptest<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # This test fails on the host as well, using both 3.15 =
and git master (as of Jan 24 2020)<br>
&gt; +=C2=A0 =C2=A0 # <a href=3D"https://bugs.kde.org/show_bug.cgi?id=3D402=
833" rel=3D"noreferrer" target=3D"_blank">https://bugs.kde.org/show_bug.cgi=
?id=3D402833</a><br>
&gt; +=C2=A0 =C2=A0 rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # As the binary isn&#39;t stripped or debug-splitted, t=
he source file isn&#39;t fetched<br>
&gt; +=C2=A0 =C2=A0 # via dwarfsrcfiles either, so it needs to be installed=
 manually.<br>
&gt; +=C2=A0 =C2=A0 mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR=
}/${BP}/none/tests/<br>
&gt; +=C2=A0 =C2=A0 install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/=
${EXTENDPE}${PV}-${PR}/${BP}/none/tests/<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +# avoid stripping some generated binaries otherwise some of the tests=
 will fail<br>
&gt; +# run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail<br>
&gt; +INHIBIT_PACKAGE_STRIP_FILES =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 ${PKGD}${PTEST_PATH}/none/tests/tls \<br>
&gt; +=C2=A0 =C2=A0 ${PKGD}${PTEST_PATH}/none/tests/tls.so \<br>
&gt; +=C2=A0 =C2=A0 ${PKGD}${PTEST_PATH}/none/tests/tls2.so \<br>
&gt; +=C2=A0 =C2=A0 ${PKGD}${PTEST_PATH}/helgrind/tests/tc09_bad_unlock \<b=
r>
&gt; +=C2=A0 =C2=A0 ${PKGD}${PTEST_PATH}/memcheck/tests/manuel1 \<br>
&gt; +=C2=A0 =C2=A0 ${PKGD}${PTEST_PATH}/drd/tests/pth_detached3 \<br>
&gt; +&quot;<br>
<br>
</blockquote></div>

--000000000000500b80059d2190df--
