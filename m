Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807C7C27C4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 05:08:19 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.6754.1718428091508592524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 22:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FT+0xwbu;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so2503760e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 22:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718428090; x=1719032890; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M54ISLOeC68FV5sJUgoUu2OnVhmWvi/opdHfyJNA08c=;
        b=FT+0xwbuIKd5SuZCQs5I+hfDxkGjvPLBHCwnimd2LTGjkduE9SOVAXVQ7o6JkSbafE
         yS78wq1paAkaLf7EnFdSO/Ogv4sgFeoDYRnNA4N+hfN9Vg818M5pRvte5awIb4/Wfo7x
         lZStgYQoNTx3gXxPnh4el4NOxxSNJaXDyS0LT3Ux8hxPnJGky16+/RtUlxhX/vsn5v6z
         lWT4TSijenI+NgYOpFiuYPgNU43PFT/11jwAlEIx5IY27a8x6F6Lufs4sPzYX46qEl7Z
         8VkhkrSV/vx1nZZ985wvX5g/xsx6JV7BmEtd0WnrTiE5BHOZP3VZWGqa2pz4CsT/urgb
         aJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718428090; x=1719032890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M54ISLOeC68FV5sJUgoUu2OnVhmWvi/opdHfyJNA08c=;
        b=iGrUl7vzhcmgLEROHG7gPYP2KLJfKsPyjyVK7bLUuHKnaaNNN1ZmCXOGTr5G5QdWkw
         4XpbMhXebjbwPuFAPmVgWUAX9Y2tkj+NNI8KTYwsMqRT8etnyo7oP5jjAhTDWbTQIao/
         GCsJH+4ycBSgH/6Lh8Anp0Vws5LjK4+/fRtMdlUCRg3BvP1KqGmCS7tb/6RoV6BgAEr4
         TZfHyqNZ3Je4j64yIn7qj9QuN9k4we5aU/GCtdlM9wSV7vJ0ZiMAagyTJIEUvvDTCKPe
         wwC/psUdGZMlpkFh4Y/1Q6Q5ZY9YzUSwp2xHIZopktcEJ4NlNBQpB691YB96Ai7C/3Xk
         BC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+27ucQHx94wzrNoxvSSw9928b6ir3WIIrKbax7Y4vnc+1ITC0cV+C1OKzJWnl0ro/1dKcwEGjr0qqDDW3QXQnlH3WM3oGpekNoXodo9jyvTjxQ8G4jPRE
X-Gm-Message-State: AOJu0YyfPJvenNcYxhzJci4YsFXyVRP8rMX59sKK+3y+aISy7l9vg97e
	3uURy7lY0EbqF70OymWmjOIciQ8o7DnOTYqdela/zGEnFeLua1FpKYVoIWCDFZwq/MbIufbUnGw
	YU0kEiPZC2CWs9MOz3glGlRkUgFI=
X-Google-Smtp-Source: AGHT+IG+KeoyhWNC4D8jmkVXGMni421JbdoYMxBx1oEyJM+XCfayR0ESZHollRQJMgRgp15RdcsCHcfPAzIcXqAKL1w=
X-Received: by 2002:a05:6512:2803:b0:52c:72b4:1b24 with SMTP id
 2adb3069b0e04-52ca6cb3058mr1504063e87.12.1718428089105; Fri, 14 Jun 2024
 22:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240606122013.145187-1-Qi.Chen@windriver.com>
 <20240606122013.145187-2-Qi.Chen@windriver.com> <CAMKF1so7WataSnd5UAWVLD0mbjnSXeCseaEg_Qs95Kxuqu-4qA@mail.gmail.com>
 <CO6PR11MB5602E08A795C01D661173BA4EDC32@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CAMKF1soAvPZM3g=cXzxMNRYH+JqV7-CmrEUnzcFbwpwpesbH5Q@mail.gmail.com>
In-Reply-To: <CAMKF1soAvPZM3g=cXzxMNRYH+JqV7-CmrEUnzcFbwpwpesbH5Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 15 Jun 2024 07:07:58 +0200
Message-ID: <CANNYZj8McZXJ_o7v50dQ230vzbuc1NLiOvddO8AaQC0Wh3759w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] findutils: upgrade from 4.9.0 to 4.10.0
To: raj.khem@gmail.com
Cc: "Chen, Qi" <Qi.Chen@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2c504061ae6b75c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 05:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200666

--000000000000d2c504061ae6b75c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that reporting this does not mean Chen has to reproduce or fix it. And
you Khem should make it clear in your report.

 Ptests are expected to pass only in the standard glibc/gcc configuration
that the autobuilder tests.

Alex

On Sat 15. Jun 2024 at 5.45, Khem Raj via lists.openembedded.org <raj.khem=
=3D
gmail.com@lists.openembedded.org> wrote:

>
>
> On Fri, Jun 14, 2024 at 8:41=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> =
wrote:
>
>> I just checked. The problem could not be reproduced on my side. Commands
>> and output are as below:
>>
>> root@qemux86-64:/usr/lib/findutils/ptest# grep FAIL log
>> root@qemux86-64:/usr/lib/findutils/ptest# grep PASS log
>> PASS: tests/find/arg-nan.sh
>> PASS: tests/find/debug-missing-arg.sh
>> PASS: tests/find/exec-plus-last-file.sh
>> PASS: tests/find/execdir-fd-leak.sh
>> PASS: tests/find/files0-from.sh
>> PASS: tests/find/name-lbracket-literal.sh
>> PASS: tests/find/name-slash.sh
>> PASS: tests/find/newer.sh
>> PASS: tests/find/opt-numeric-arg.sh
>> PASS: tests/find/printf_escape_c.sh
>> PASS: tests/find/printf_escapechars.sh
>> PASS: tests/find/printf_inode.sh
>> PASS: tests/find/refuse-noop.sh
>> PASS: tests/find/type_list.sh
>> PASS: tests/find/used.sh
>> PASS: tests/find/user-group-max.sh
>> PASS: tests/misc/help-version.sh
>> PASS: tests/xargs/conflicting_opts.sh
>> PASS: tests/xargs/verbose-quote.sh
>> root@qemux86-64:/usr/lib/findutils/ptest# rpm
>> rpm        rpmbuild   rpmgraph   rpmlua     rpmsign    rpmspec
>> rpm2cpio   rpmdb      rpmkeys    rpmquery   rpmsort    rpmverify
>> root@qemux86-64:/usr/lib/findutils/ptest# rpm -qa | grep musl
>> musl-1.2.4+git0+79bdacff83-r0.core2_64
>>
>
> I have musl updated staged in contrib/yoe/mut I wonder if it=E2=80=99s se=
en with
> newer musl I also use clang and libc++ so could be that too
>
>>
>> Regards,
>> Qi
>>
>> -----Original Message-----
>> From: Khem Raj <raj.khem@gmail.com>
>> Sent: Saturday, June 15, 2024 6:57 AM
>> To: Chen, Qi <Qi.Chen@windriver.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][PATCH 2/2] findutils: upgrade from 4.9.0 to 4.10.=
0
>>
>> This fails ptests with qemux86_64/musl
>>
>> bitbake core-image-ptest-findutils
>> results in
>>
>> -find: invalid user name or UID argument to -user: '4294967296'
>> +find: invalid user name or UID argument to -user: =E2=80=984294967296=
=E2=80=99
>> --- exp
>> +++ err
>> @@ -1 +1 @@
>> -find: invalid group name or GID argument to -group: '4294967296'
>> +find: invalid group name or GID argument to -group: =E2=80=984294967296=
=E2=80=99
>> FAIL: tests/find/user-group-max.sh
>>
>>
>> On Thu, Jun 6, 2024 at 5:20=E2=80=AFAM Chen Qi via lists.openembedded.or=
g
>> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> >
>> > From: Chen Qi <Qi.Chen@windriver.com>
>> >
>> > autoconf-2.73.patch is dropped as it's not needed any more.
>> >
>> > The run-ptest script is fixed. Instead copying function definitions
>> > from init.cfg file, we should just install init.cfg file in the ptest
>> > package. The coreutils-getlimits is added as a runtime dependency of
>> > the ptest package because the getlimits command is needed.
>> >
>> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > ---
>> >  meta/recipes-extended/findutils/findutils.inc |  1 -
>> >  .../findutils/findutils/autoconf-2.73.patch   | 24 ----------------
>> >  .../findutils/findutils/run-ptest             | 28 ------------------=
-
>> >  ...findutils_4.9.0.bb =3D> findutils_4.10.0.bb} |  6 ++--
>> >  4 files changed, 3 insertions(+), 56 deletions(-)  delete mode 100644
>> > meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
>> >  rename meta/recipes-extended/findutils/{findutils_4.9.0.bb =3D>
>> > findutils_4.10.0.bb} (78%)
>> >
>> > diff --git a/meta/recipes-extended/findutils/findutils.inc
>> > b/meta/recipes-extended/findutils/findutils.inc
>> > index 03cf2a8d72..ddcc05750b 100644
>> > --- a/meta/recipes-extended/findutils/findutils.inc
>> > +++ b/meta/recipes-extended/findutils/findutils.inc
>> > @@ -7,7 +7,6 @@ BUGTRACKER =3D "
>> http://savannah.gnu.org/bugs/?group=3Dfindutils"
>> >  SECTION =3D "console/utils"
>> >
>> >  SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
>> > -          file://autoconf-2.73.patch \
>> >            file://run-ptest \
>> >            "
>> >
>> > diff --git
>> > a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
>> > b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
>> > deleted file mode 100644
>> > index 63728b5f91..0000000000
>> > --- a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
>> > +++ /dev/null
>> > @@ -1,24 +0,0 @@
>> > -The gnulib largefile macro needs updating to work with autoconf 2.73.
>> > Rather -than the full code:
>> > -
>> > -https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?i
>> > d=3Df91f633858cf132e50924224c50d6264a92caabb
>> > -
>> > -Just tweak the exiting code to work with 2.73. The next findutils
>> > upgrade should -update to new gnulib
>> > -
>> > -Upstream-Status: Inappropriate
>> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > -
>> > -Index: findutils-4.9.0/gl/m4/largefile.m4
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > ---- findutils-4.9.0.orig/gl/m4/largefile.m4
>> > -+++ findutils-4.9.0/gl/m4/largefile.m4
>> > -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
>> > - # with _TIME_BITS.  Also, work around a problem in autoconf <=3D 2.6=
9:
>> > - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X
>> > 10.5,
>> > - # or configures them incorrectly in some cases.
>> > --m4_version_prereq([2.70], [], [
>> > -+m4_version_prereq([2.73], [], [
>> > -
>> > - # _AC_SYS_LARGEFILE_TEST_INCLUDES
>> > - # -------------------------------
>> > diff --git a/meta/recipes-extended/findutils/findutils/run-ptest
>> > b/meta/recipes-extended/findutils/findutils/run-ptest
>> > index ec71583c51..3dec117067 100644
>> > --- a/meta/recipes-extended/findutils/findutils/run-ptest
>> > +++ b/meta/recipes-extended/findutils/findutils/run-ptest
>> > @@ -10,34 +10,6 @@ export built_programs=3D"find xargs locate updatedb=
"
>> >  # this gets substituted by sed during build  export
>> > VERSION=3D"__run_ptest_version__"
>> >
>> > -# define missing functions for tests/init.sh -fu_path_prepend_ () {
>> > -       path_prepend_ $@
>> > -}
>> > -
>> > -print_ver_ () {
>> > -       :
>> > -}
>> > -
>> > -skip_if_root_ () {
>> > -       [ $(id -u) =3D 0 ] && exit 77;
>> > -}
>> > -
>> > -require_root_ () {
>> > -       [ $(id -u) =3D 0 ] || exit 77;
>> > -}
>> > -
>> > -expensive_ () {
>> > -       :
>> > -}
>> > -
>> > -export -f fu_path_prepend_
>> > -export -f print_ver_
>> > -export -f skip_if_root_
>> > -export -f require_root_
>> > -export -f expensive_
>> > -
>> > -
>> >  for f in tests/*/*.sh; do
>> >         bash $f ;
>> >         case $? in
>> > diff --git a/meta/recipes-extended/findutils/findutils_4.9.0.bb
>> > b/meta/recipes-extended/findutils/findutils_4.10.0.bb
>> > similarity index 78%
>> > rename from meta/recipes-extended/findutils/findutils_4.9.0.bb
>> > rename to meta/recipes-extended/findutils/findutils_4.10.0.bb
>> > index 074817df27..57f77de16f 100644
>> > --- a/meta/recipes-extended/findutils/findutils_4.9.0.bb
>> > +++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
>> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440464"
>> >
>> >  DEPENDS =3D "bison-native"
>> >
>> > -SRC_URI[sha256sum] =3D
>> "a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe"
>> > +SRC_URI[sha256sum] =3D
>> "1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5"
>> >
>> >  PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselin=
ux"
>> >  # http://savannah.gnu.org/bugs/?27299
>> > @@ -15,13 +15,13 @@ CACHED_CONFIGUREVARS +=3D
>> "gl_cv_func_wcwidth_works=3Dyes"
>> >  EXTRA_OECONF +=3D "ac_cv_path_SORT=3D${bindir}/sort"
>> >
>> >  # need od from coreutils for -t option -RDEPENDS:${PN}-ptest +=3D "ba=
sh
>> > sed grep coreutils"
>> > +RDEPENDS:${PN}-ptest +=3D "bash sed grep coreutils coreutils-getlimit=
s"
>> >
>> >  do_install_ptest:class-target() {
>> >         mkdir -p ${D}${PTEST_PATH}/tests/
>> > +       cp ${S}/init.cfg ${D}${PTEST_PATH}
>> >         cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> >
>> >         # substitute value in run-ptest with actual version
>> >         sed -i -e 's/__run_ptest_version__/${PV}/'
>> > ${D}${PTEST_PATH}/run-ptest
>> > -
>> >  }
>> > --
>> > 2.34.1
>> >
>> >
>> >
>> >
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200665):
> https://lists.openembedded.org/g/openembedded-core/message/200665
> Mute This Topic: https://lists.openembedded.org/mt/106521747/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d2c504061ae6b75c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Note that reporting this does not mean Chen has to reprod=
uce or fix it. And you Khem should make it clear in your report.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0Ptests are expected to pass =
only in the standard glibc/gcc configuration that the autobuilder tests.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 15. Jun 20=
24 at 5.45, Khem Raj via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)"><div><br></div><div><br><div class=3D"gmail_quote"></div></div><d=
iv><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Jun 14, 2024 at 8:41=E2=80=AFPM Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@win=
driver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">I just checked. The problem could not be reproduced on my=
 side. Commands and output are as below:<br>
<br>
root@qemux86-64:/usr/lib/findutils/ptest# grep FAIL log<br>
root@qemux86-64:/usr/lib/findutils/ptest# grep PASS log<br>
PASS: tests/find/arg-nan.sh<br>
PASS: tests/find/debug-missing-arg.sh<br>
PASS: tests/find/exec-plus-last-file.sh<br>
PASS: tests/find/execdir-fd-leak.sh<br>
PASS: tests/find/files0-from.sh<br>
PASS: tests/find/name-lbracket-literal.sh<br>
PASS: tests/find/name-slash.sh<br>
PASS: tests/find/newer.sh<br>
PASS: tests/find/opt-numeric-arg.sh<br>
PASS: tests/find/printf_escape_c.sh<br>
PASS: tests/find/printf_escapechars.sh<br>
PASS: tests/find/printf_inode.sh<br>
PASS: tests/find/refuse-noop.sh<br>
PASS: tests/find/type_list.sh<br>
PASS: tests/find/used.sh<br>
PASS: tests/find/user-group-max.sh<br>
PASS: tests/misc/help-version.sh<br>
PASS: tests/xargs/conflicting_opts.sh<br>
PASS: tests/xargs/verbose-quote.sh<br>
root@qemux86-64:/usr/lib/findutils/ptest# rpm<br>
rpm=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmbuild=C2=A0 =C2=A0rpmgraph=C2=A0 =C2=A0rp=
mlua=C2=A0 =C2=A0 =C2=A0rpmsign=C2=A0 =C2=A0 rpmspec<br>
rpm2cpio=C2=A0 =C2=A0rpmdb=C2=A0 =C2=A0 =C2=A0 rpmkeys=C2=A0 =C2=A0 rpmquer=
y=C2=A0 =C2=A0rpmsort=C2=A0 =C2=A0 rpmverify<br>
root@qemux86-64:/usr/lib/findutils/ptest# rpm -qa | grep musl<br>
musl-1.2.4+git0+79bdacff83-r0.core2_64<br>
</blockquote><div dir=3D"auto"><br></div></div></div><div><div class=3D"gma=
il_quote"><div dir=3D"auto">I have musl updated staged in contrib/yoe/mut I=
 wonder if it=E2=80=99s seen with newer musl I also use clang and libc++ so=
 could be that too=C2=A0</div></div></div><div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"><br>
Regards,<br>
Qi<br>
<br>
-----Original Message-----<br>
From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; <br>
Sent: Saturday, June 15, 2024 6:57 AM<br>
To: Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank"=
>Qi.Chen@windriver.com</a>&gt;<br>
Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Subject: Re: [OE-core][PATCH 2/2] findutils: upgrade from 4.9.0 to 4.10.0<b=
r>
<br>
This fails ptests with qemux86_64/musl<br>
<br>
bitbake core-image-ptest-findutils<br>
results in<br>
<br>
-find: invalid user name or UID argument to -user: &#39;4294967296&#39;<br>
+find: invalid user name or UID argument to -user: =E2=80=984294967296=E2=
=80=99<br>
--- exp<br>
+++ err<br>
@@ -1 +1 @@<br>
-find: invalid group name or GID argument to -group: &#39;4294967296&#39;<b=
r>
+find: invalid group name or GID argument to -group: =E2=80=984294967296=E2=
=80=99<br>
FAIL: tests/find/user-group-max.sh<br>
<br>
<br>
On Thu, Jun 6, 2024 at 5:20=E2=80=AFAM Chen Qi via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.openembedded.org=
" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_=
blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;<br>
&gt; autoconf-2.73.patch is dropped as it&#39;s not needed any more.<br>
&gt;<br>
&gt; The run-ptest script is fixed. Instead copying function definitions <b=
r>
&gt; from init.cfg file, we should just install init.cfg file in the ptest =
<br>
&gt; package. The coreutils-getlimits is added as a runtime dependency of <=
br>
&gt; the ptest package because the getlimits command is needed.<br>
&gt;<br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/findutils/findutils.inc |=C2=A0 1 -<br>
&gt;=C2=A0 .../findutils/findutils/autoconf-2.73.patch=C2=A0 =C2=A0| 24 ---=
-------------<br>
&gt;=C2=A0 .../findutils/findutils/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 28 -------------------<br>
&gt;=C2=A0 ...<a href=3D"http://findutils_4.9.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">findutils_4.9.0.bb</a> =3D&gt; <a href=3D"http://findutils_4.=
10.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a>} |=C2=
=A0 6 ++--<br>
&gt;=C2=A0 4 files changed, 3 insertions(+), 56 deletions(-)=C2=A0 delete m=
ode 100644 <br>
&gt; meta/recipes-extended/findutils/findutils/autoconf-2.73.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/findutils/{<a href=3D"http://findut=
ils_4.9.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.9.0.bb</a> =
=3D&gt; <br>
&gt; <a href=3D"http://findutils_4.10.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">findutils_4.10.0.bb</a>} (78%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/findutils/findutils.inc <br>
&gt; b/meta/recipes-extended/findutils/findutils.inc<br>
&gt; index 03cf2a8d72..ddcc05750b 100644<br>
&gt; --- a/meta/recipes-extended/findutils/findutils.inc<br>
&gt; +++ b/meta/recipes-extended/findutils/findutils.inc<br>
&gt; @@ -7,7 +7,6 @@ BUGTRACKER =3D &quot;<a href=3D"http://savannah.gnu.or=
g/bugs/?group=3Dfindutils" rel=3D"noreferrer" target=3D"_blank">http://sava=
nnah.gnu.org/bugs/?group=3Dfindutils</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;console/utils&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.xz \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://autoconf-2.73.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; diff --git <br>
&gt; a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch <br>
&gt; b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 63728b5f91..0000000000<br>
&gt; --- a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch<br=
>
&gt; +++ /dev/null<br>
&gt; @@ -1,24 +0,0 @@<br>
&gt; -The gnulib largefile macro needs updating to work with autoconf 2.73.=
 <br>
&gt; Rather -than the full code:<br>
&gt; -<br>
&gt; -<a href=3D"https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/lar=
gefile.m4?i" rel=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.=
org/cgit/gnulib.git/commit/m4/largefile.m4?i</a><br>
&gt; d=3Df91f633858cf132e50924224c50d6264a92caabb<br>
&gt; -<br>
&gt; -Just tweak the exiting code to work with 2.73. The next findutils <br=
>
&gt; upgrade should -update to new gnulib<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate<br>
&gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; -<br>
&gt; -Index: findutils-4.9.0/gl/m4/largefile.m4<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- findutils-4.9.0.orig/gl/m4/largefile.m4<br>
&gt; -+++ findutils-4.9.0/gl/m4/largefile.m4<br>
&gt; -@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],<br>
&gt; - # with _TIME_BITS.=C2=A0 Also, work around a problem in autoconf &lt=
;=3D 2.69:<br>
&gt; - # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X <=
br>
&gt; 10.5,<br>
&gt; - # or configures them incorrectly in some cases.<br>
&gt; --m4_version_prereq([2.70], [], [<br>
&gt; -+m4_version_prereq([2.73], [], [<br>
&gt; -<br>
&gt; - # _AC_SYS_LARGEFILE_TEST_INCLUDES<br>
&gt; - # -------------------------------<br>
&gt; diff --git a/meta/recipes-extended/findutils/findutils/run-ptest <br>
&gt; b/meta/recipes-extended/findutils/findutils/run-ptest<br>
&gt; index ec71583c51..3dec117067 100644<br>
&gt; --- a/meta/recipes-extended/findutils/findutils/run-ptest<br>
&gt; +++ b/meta/recipes-extended/findutils/findutils/run-ptest<br>
&gt; @@ -10,34 +10,6 @@ export built_programs=3D&quot;find xargs locate upd=
atedb&quot;<br>
&gt;=C2=A0 # this gets substituted by sed during build=C2=A0 export <br>
&gt; VERSION=3D&quot;__run_ptest_version__&quot;<br>
&gt;<br>
&gt; -# define missing functions for tests/init.sh -fu_path_prepend_ () {<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0path_prepend_ $@<br>
&gt; -}<br>
&gt; -<br>
&gt; -print_ver_ () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt; -}<br>
&gt; -<br>
&gt; -skip_if_root_ () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $(id -u) =3D 0 ] &amp;&amp; exit 77;<br>
&gt; -}<br>
&gt; -<br>
&gt; -require_root_ () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $(id -u) =3D 0 ] || exit 77;<br>
&gt; -}<br>
&gt; -<br>
&gt; -expensive_ () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt; -}<br>
&gt; -<br>
&gt; -export -f fu_path_prepend_<br>
&gt; -export -f print_ver_<br>
&gt; -export -f skip_if_root_<br>
&gt; -export -f require_root_<br>
&gt; -export -f expensive_<br>
&gt; -<br>
&gt; -<br>
&gt;=C2=A0 for f in tests/*/*.sh; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bash $f ;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case $? in<br>
&gt; diff --git a/meta/recipes-extended/findutils/<a href=3D"http://finduti=
ls_4.9.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.9.0.bb</a> <b=
r>
&gt; b/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.10.0.b=
b" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a><br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-extended/findutils/<a href=3D"http://findutil=
s_4.9.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.9.0.bb</a><br>
&gt; rename to meta/recipes-extended/findutils/<a href=3D"http://findutils_=
4.10.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a><br>
&gt; index 074817df27..57f77de16f 100644<br>
&gt; --- a/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.9.=
0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.9.0.bb</a><br>
&gt; +++ b/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.10=
.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.10.0.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1ebbd3=
e34237af26da5dc08a4e440464&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;bison-native&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;a2bfb8c09d436770edc59f50fa483e785b161a3b=
7b9d547573cb08065fd462fe&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;1387e0b67ff247d2abde998f90dfbf70c1491391=
a59ddfecb8ae698789f0a4f5&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[selinux] =3D &quot;--with-selinux,--without-selinu=
x,libselinux&quot;<br>
&gt;=C2=A0 # <a href=3D"http://savannah.gnu.org/bugs/?27299" rel=3D"norefer=
rer" target=3D"_blank">http://savannah.gnu.org/bugs/?27299</a><br>
&gt; @@ -15,13 +15,13 @@ CACHED_CONFIGUREVARS +=3D &quot;gl_cv_func_wcwidth=
_works=3Dyes&quot;<br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot;ac_cv_path_SORT=3D${bindir}/sort&quot;<b=
r>
&gt;<br>
&gt;=C2=A0 # need od from coreutils for -t option -RDEPENDS:${PN}-ptest +=
=3D &quot;bash <br>
&gt; sed grep coreutils&quot;<br>
&gt; +RDEPENDS:${PN}-ptest +=3D &quot;bash sed grep coreutils coreutils-get=
limits&quot;<br>
&gt;<br>
&gt;=C2=A0 do_install_ptest:class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/tests/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/init.cfg ${D}${PTEST_PATH}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests/* ${D}${PTEST_PATH}/=
tests/<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# substitute value in run-ptest with =
actual version<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s/__run_ptest_version_=
_/${PV}/&#39; <br>
&gt; ${D}${PTEST_PATH}/run-ptest<br>
&gt; -<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div><div><div class=3D"gmail_quote"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200665): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200665" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200665</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106521747/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106521747/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d2c504061ae6b75c--

