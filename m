Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD43C47090
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.34250.1649073486024695663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 04:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JNsXD/kE;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id b21so6249397lfb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 04:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jDxHKeZhTVnrw89SIZ8kZaOWo29XYxi01QwtJKilWFE=;
        b=JNsXD/kEXw2Ygnl5Uq7G5nEL6LkuxK1yBzWQz1AmSn9bFXRMXFnQXDjalm1KGhNUjv
         roUbsctGO5Bji5dvsuWuKaS3AQUfCHj2PROLIHWpKXsk/zsenoVCpugRsF7NhfIQuMX7
         PtJHixO90MUYRDuyydodWNQTSxfWH9UADgM83cJ6ce37BxD2/th+qlxQUrBgUIbq+6yF
         +nyIHbG6g/jXNueBVDGCbyNE3WHPYovKGKjfXQMMj4nJ/GF+muX/Y00lH0TU95Q14/F5
         A2KVyL4S5CWHOWLIu+i5Qo9bricb9uWl82izQpY/TJ51qs9/9t5vCG1nMygPSM1gQL9s
         in3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jDxHKeZhTVnrw89SIZ8kZaOWo29XYxi01QwtJKilWFE=;
        b=GtiYJmNHFHjKqqknmAHZBFLyV0SBGZj54JoD8WGFrXbTJ7OzBb9hboxSSMuBjFJYRw
         3BWIYj0hv96EgKXz9oAbELceHIubE5Je+w//ocBTX6GUcBix+R99x329jWAJcmCwhYxd
         BhIPvHCDbg4OYqn7RuaaszFO1/GrzLyo6K3rkhN5fTOSq0jn8MdBIcmHzHC/W/SgvG8W
         vqEbJWVk4VR/bzmHAHvX3XoUeCI9JqmCKQcoxZt3cuqbHcm3LRXWZP/kal7lvsYKR8KW
         u+KhlgcAtOgkmaHsUcFIU71pJJ/NKcwvWRhvP6sNSnh36b9gwFtnVqw/2REGps9/py3A
         CWSQ==
X-Gm-Message-State: AOAM532g2ykFLhFczjpC/+8XsTYhvsz2z+JWQmBnIsG9xpWo44BrKE/8
	ds2k+uqWN/5eSHQcSvHZMs4CdvQ2rK76++ivHss=
X-Google-Smtp-Source: 
 ABdhPJxKeemPNlKN2B1ZXNU1BuAe5LjAQcdLulX+53YRKNtRBeCmoXOtdSF541GxUgfeoV7KJ63QyGAdvVhraSmB70g=
X-Received: by 2002:a19:ca14:0:b0:44a:23ab:90a5 with SMTP id
 a20-20020a19ca14000000b0044a23ab90a5mr21680577lfg.673.1649073483956; Mon, 04
 Apr 2022 04:58:03 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0bdd8781-1174-4002-a3b6-4b3de641d2d3@denue6es010.ebgroup.elektrobit.com>
 <CANNYZj_YPnBK64T_g3kp5K89C9fJH_D3N3AxytSXhHgcVp2O8w@mail.gmail.com>
 <f569c23252caf98c9f79e7402f53e1c06be7a1d9.camel@elektrobit.com>
In-Reply-To: <f569c23252caf98c9f79e7402f53e1c06be7a1d9.camel@elektrobit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Apr 2022 13:57:51 +0200
Message-ID: 
 <CANNYZj_6xuyZOXVc+dfdB6gN52dycfxKWHJjiSfDf9vEfaULYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] popt: add ptest
To: =?UTF-8?Q?Wei=C3=9F=2C_Simone?= <Simone.Weiss@elektrobit.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163989

Hello Simone,

if they were involved in making this patch, then signed-off-by should
be changed to their current email address. Or you can simply remove
that line if you don't know how to reach them.

Alex

On Mon, 4 Apr 2022 at 12:48, Wei=C3=9F, Simone <Simone.Weiss@elektrobit.com=
> wrote:
>
> Hello,
>
> Thanks for the reply. Sure, I can also submit the patch to popt first.
> Regarding David's mail address: The person does not work at my company
> anymore, hence this mail address is not valid. What would be suggested
> in this case?
>
> Thanks,
> Simone
> As it is my first time submitting here
> On Fri, 2022-04-01 at 17:16 +0200, Alexander Kanavin via
> lists.openembedded.org wrote:
> > CAUTION: This email originated from outside of the Elektrobit
> > organization. Do not click links or open attachments unless you
> > recognize the sender and know the content is safe.
> >
> >
> > Also David's email seems incorrect?
> >
> > Fehler bei der Nachrichtenzustellung an folgende Empf=C3=A4nger oder
> > Gruppen:
> >
> > David Niederpruem (david.niederpruem@elektrobit.com)
> >
> > Die eingegebene E-Mail-Adresse konnte nicht gefunden werden.
> > =C3=9Cberpr=C3=BCfen Sie die E-Mail-Adresse des Empf=C3=A4ngers, und ve=
rsuchen Sie,
> > die Nachricht erneut zu senden. Wenn das Problem weiterhin besteht,
> > wenden Sie sich an Ihren E-Mail-Administrator.
> >
> >
> > Alex
> >
> > On Fri, 1 Apr 2022 at 16:46, Simone Weiss <
> > simone.weiss@elektrobit.com> wrote:
> > >
> > > Add a ptest for popt to core-image-ptest-all. Provide a patch to
> > > popt to
> > > adopt the test format to "simple test" and a script for running the
> > > test.
> > > All tests passed on a trial run.
> > >
> > > Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> > > Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
> > > ---
> > >  .../distro/include/ptest-packagelists.inc     |  1 +
> > >  ...01-popt-test-output-format-for-ptest.patch | 68
> > > +++++++++++++++++++
> > >  meta/recipes-support/popt/popt/run-ptest      |  3 +
> > >  meta/recipes-support/popt/popt_1.18.bb        | 21 +++++-
> > >  4 files changed, 91 insertions(+), 2 deletions(-)
> > >  create mode 100644 meta/recipes-support/popt/popt/0001-popt-test-
> > > output-format-for-ptest.patch
> > >  create mode 100644 meta/recipes-support/popt/popt/run-ptest
> > >
> > > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > > b/meta/conf/distro/include/ptest-packagelists.inc
> > > index ac3295d1aa..b51cce4d9e 100644
> > > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > > @@ -48,6 +48,7 @@ PTESTS_FAST =3D "\
> > >      opkg-ptest \
> > >      pango-ptest \
> > >      parted-ptest \
> > > +    popt-ptest \
> > >      python3-atomicwrites-ptest \
> > >      python3-bcrypt-ptest \
> > >      python3-hypothesis-ptest \
> > > diff --git a/meta/recipes-support/popt/popt/0001-popt-test-output-
> > > format-for-ptest.patch b/meta/recipes-support/popt/popt/0001-popt-
> > > test-output-format-for-ptest.patch
> > > new file mode 100644
> > > index 0000000000..020949cc34
> > > --- /dev/null
> > > +++ b/meta/recipes-support/popt/popt/0001-popt-test-output-format-
> > > for-ptest.patch
> > > @@ -0,0 +1,68 @@
> > > +From 330b77081c3a4c7ae76cb08602db385b40fa7ff7 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Simone Weiss <simone.weiss@elektrobit.com>
> > > +Date: Mon, 13 Dec 2021 09:29:53 +0000
> > > +Subject: [PATCH] popt test output format for ptest
> > > +
> > > +patch test output format to match simple-test as it is used in
> > > ptests.
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> > > +Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com
> > > >
> > > +---
> > > + tests/testit.sh | 20 ++++++++------------
> > > + 1 file changed, 8 insertions(+), 12 deletions(-)
> > > +
> > > +diff --git a/tests/testit.sh b/tests/testit.sh
> > > +index 2a7b4aa..50b42e2 100755
> > > +--- a/tests/testit.sh
> > > ++++ b/tests/testit.sh
> > > +@@ -5,12 +5,11 @@ run() {
> > > +     name=3D$1; shift
> > > +     answer=3D$1; shift
> > > +
> > > +-    echo Running test $name.
> > > +-
> > > +     result=3D`HOME=3D$builddir $builddir/$prog $*`
> > > +     if [ "$answer" !=3D "$result" ]; then
> > > +-      echo "Test \"$prog $*\" failed with: \"$result\" !=3D
> > > \"$answer\" "
> > > +-      exit 2
> > > ++        echo "FAIL: $name"
> > > ++    else
> > > ++        echo "PASS: $name"
> > > +     fi
> > > + }
> > > +
> > > +@@ -23,17 +22,17 @@ run_diff() {
> > > +     out=3D$builddir/tmp.out
> > > +     diff_file=3D$builddir/tmp.diff
> > > +
> > > +-    echo Running test $name.
> > > +-
> > > +     $builddir/$prog $in_file > $out
> > > +     ret=3D$?
> > > +     diff $out $answer_file > $diff_file
> > > +     diff_ret=3D$?
> > > +
> > > +     if [ "$diff_ret" !=3D "0" ]; then
> > > +-       echo "Test \"$name\" failed output is in $out, diff is:"
> > > +-       cat $diff_file
> > > +-       exit 2
> > > ++        echo "FAIL: $name"
> > > ++        echo "diff is:"
> > > ++        cat $diff_file
> > > ++    else
> > > ++        echo "PASS: $name"
> > > +     fi
> > > +     rm $out $diff_file
> > > + }
> > > +@@ -174,6 +173,3 @@ Help options:
> > > + #run_diff test3 "test3 - 51" test3-data/01.input test3-
> > > data/01.answer
> > > + #run_diff test3 "test3 - 52" test3-data/02.input test3-
> > > data/02.answer
> > > + #run_diff test3 "test3 - 53" test3-data/03.input test3-
> > > data/03.answer
> > > +-
> > > +-echo ""
> > > +-echo "Passed."
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta/recipes-support/popt/popt/run-ptest
> > > b/meta/recipes-support/popt/popt/run-ptest
> > > new file mode 100644
> > > index 0000000000..85754035d0
> > > --- /dev/null
> > > +++ b/meta/recipes-support/popt/popt/run-ptest
> > > @@ -0,0 +1,3 @@
> > > +#!/bin/sh
> > > +
> > > +./testit.sh
> > > diff --git a/meta/recipes-support/popt/popt_1.18.bb b/meta/recipes-
> > > support/popt/popt_1.18.bb
> > > index 057c44f223..af8add4ad6 100644
> > > --- a/meta/recipes-support/popt/popt_1.18.bb
> > > +++ b/meta/recipes-support/popt/popt_1.18.bb
> > > @@ -8,9 +8,26 @@ LIC_FILES_CHKSUM =3D "
> > > file://COPYING;md5=3Dcb0613c30af2a8249b8dcc67d3edb06d"
> > >
> > >  DEPENDS =3D "virtual/libiconv"
> > >
> > > -SRC_URI =3D "
> > > https://nam12.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fft=
p.rpm.org%2Fpopt%2Freleases%2Fpopt-1.x%2F%24&amp;data=3D04%7C01%7C%7Cc08321=
3936af41f0aafa08da13f29c80%7Ce764c36b012e4216910d8fd16283182d%7C0%7C0%7C637=
844229994294094%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DQLCrgNayolk0racWmUMDZQAE=
L7Qigg1yhpvovU4Bwzc%3D&amp;reserved=3D0{BP}.tar.gz
> > > "
> > > +SRC_URI =3D "\
> > > +
> > > https://nam12.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fft=
p.rpm.org%2Fpopt%2Freleases%2Fpopt-1.x%2F%24&amp;data=3D04%7C01%7C%7Cc08321=
3936af41f0aafa08da13f29c80%7Ce764c36b012e4216910d8fd16283182d%7C0%7C0%7C637=
844229994294094%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DQLCrgNayolk0racWmUMDZQAE=
L7Qigg1yhpvovU4Bwzc%3D&amp;reserved=3D0{BP}.tar.gz
> > >  \
> > > +    file://0001-popt-test-output-format-for-ptest.patch \
> > > +    file://run-ptest \
> > > +"
> > >  SRC_URI[sha256sum] =3D
> > > "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1"
> > >
> > > -inherit autotools gettext
> > > +inherit autotools gettext ptest
> > > +
> > > +RDEPENDS_${PN}-ptest +=3D "bash"
> > > +
> > > +do_compile_ptest() {
> > > +    sed 's#lt-test1#test1#g' ${S}/tests/testit.sh >
> > > ${B}/tests/testit.sh
> > > +}
> > > +
> > > +do_install_ptest() {
> > > +    install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
> > > +    install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
> > > +    install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
> > > +    install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
> > > +}
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#163942):
> > https://lists.openembedded.org/g/openembedded-core/message/163942
> > Mute This Topic: https://lists.openembedded.org/mt/90180554/6639279
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> >  [simone.weiss@elektrobit.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

