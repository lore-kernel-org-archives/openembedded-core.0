Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A342FCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 09:27:35 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.277292.1697621246554462658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 02:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kG5iPe0+;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7a52a27fe03so2806990241.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 02:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697621245; x=1698226045; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I5A7PhZ0BYzrZTnXEr3u9R0OZ4eO2HXReG3SIRmrx1M=;
        b=kG5iPe0+8G5YivJHOSkvgh52Gkwvy7AiZwPHAuZ9CutUUDMk0q+9zQGsfZdJKcITpr
         QhElTBqVgyyak8A3/ytJHSzDbUCHWZbOvrZ5EhFZLWjJuA7niROxM1Tzl0YLkcpv04Hb
         hm+1ThYG3WbyySvBmWiRo4Z/K78kM9JkihLQsyhR7ug6wLdi8fWA1JH6c0G932inYaG1
         gkoSD1I7syk1cGgSmgdZbh5HCRUMNR893DWNUlFtoeSAJxyNuzaECxaUMfThpxC2B7PE
         QuKIaaZkuu7SwlkFd4KfIx1dh0BIDztQmvx5OaS8KpQOc4568QZTVsJ1K9l0arfCz7qo
         CJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697621245; x=1698226045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5A7PhZ0BYzrZTnXEr3u9R0OZ4eO2HXReG3SIRmrx1M=;
        b=m7yEWbxZAdHULLnT/NtwqP4fPvKQjtOIAlTapQ/QmRvI8TeCbzycXpLdym6T+6p/if
         DB6lIxtsZoyq/HWUy4PJE1wLgK9E4gg2A0UYf/8//fxdzSdfzXGXg2hTM1jOHWEHKYC1
         2D6ZWabHYe2OyVfLyT4va6qb0gBEjWY8StjeinmMBAccxXtWTeF5xf2NvgwInGTqcjKi
         Y97O4cTf671ArUw7sFgb4lE2g/jPvKM3E3H7iLT6TnmeOGm/lkBNdx1wqHgAWbdMhzVo
         FYfy+ZAVVLYa6My7Tgu1tm3AxB9266BU8EpXH5oCrTUIjGH+PodfovmrRC0dUmchAj15
         HqNw==
X-Gm-Message-State: AOJu0YzjaV8PejAB3oG+mWUSuGNpTf51jv1yvBDiLYyc6yzlbcG+TvFU
	a+IquGX0NmTGKsXtVNGUlWhaRC7ydfwiH01teZMKWL5vR9Y=
X-Google-Smtp-Source: AGHT+IF7eRjtXqTUg2qPoDII5so+O0LNYk8AbGXqRVK8MJ6TNBygk1glIotirbDNzd2CslzWh7hF8rBKlwRDA1QUNV0=
X-Received: by 2002:a67:b744:0:b0:457:cb2a:e917 with SMTP id
 l4-20020a67b744000000b00457cb2ae917mr4827419vsh.15.1697621245478; Wed, 18 Oct
 2023 02:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231017133050.147000-1-alex@linutronix.de> <20231017133050.147000-2-alex@linutronix.de>
 <CANPvuRmdtKAf6U8Kv1aW0N6VRSxN48q3bPDs3eHRn6NcDGWZkg@mail.gmail.com>
 <178EEAABEAFD6A58.14388@lists.openembedded.org> <CANNYZj_1tjpD9g1vXOJFGMtC1WYf_73FhT1KzbZ-TcE5vTi-tQ@mail.gmail.com>
In-Reply-To: <CANNYZj_1tjpD9g1vXOJFGMtC1WYf_73FhT1KzbZ-TcE5vTi-tQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 18 Oct 2023 10:27:14 +0100
Message-ID: <CANPvuRmJh2cPomiVmzNk7Nj-SwKSRHWYpPkXdkbxt241ZE1M_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004cd1840607fa3f0d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 09:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189373

--0000000000004cd1840607fa3f0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quarta,
18/10/2023 =C3=A0(s) 09:48:

> I sent a v2 of this patch where this issue is corrected.
>

Thanks


>
> Alex
>
> On Tue, 17 Oct 2023 at 16:15, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Thanks, I was completely sure in my head I had fixed this, but either
> > I haven't, or it has been somehow lost.
> >
> > Alex
> >
> > On Tue, 17 Oct 2023 at 16:06, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> > >
> > >
> > >
> > > Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a=
,
> 17/10/2023 =C3=A0(s) 14:31:
> > >>
> > >> 'bitbake -S printdiff' is a useful diagnostic facility for finding o=
ut
> > >> why sstate is not being reused, but until now it had no tests that
> would
> > >> ensure it works. This commit adds three basic scenarios:
> > >>
> > >> 1. make a change in a really basic, common recipe that is at the ver=
y
> root
> > >> of dependency trees (quilt-native), and ensure that change is
> correctly discovered when
> > >> building an image.
> > >>
> > >> 2. make a change in gcc-source recipe, which is somewhat special
> > >> (operates in work-shared), and ensure that gcc-runtime builds track
> > >> that down as well.
> > >>
> > >> 3. make a change in base_do_configure() definition from base.bbclass=
,
> > >> which is not recipe-specific, but affects many basic recipes, and
> ensure that
> > >> is correctly reported as well.
> > >>
> > >> The test itself actually runs twice:
> > >> - first against a fully populated build directory, where
> > >> the printdiff code is guaranteed to find the correct previous
> > >> stamp that can be compared with in a predictable manner.
> > >>
> > >> - then in an empty build directory where the printdiff code
> > >> goes to look in the sstate cache, and so the existence of the
> > >> previous signature can be tested, but not the difference with it
> > >> (what the exact difference would be is unpredictable as the
> > >> sstate cache is indeed shared between many builds).
> > >>
> > >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > >> ---
> > >>  .../base-do-configure-modified.bbclass        |   3 +
> > >>  .../gcc-source/gcc-source_%.bbappend          |   2 +
> > >>  .../quilt-native/quilt-native_%.bbappend      |   2 +
> > >>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 104
> ++++++++++++++++++
> > >>  4 files changed, 111 insertions(+)
> > >>  create mode 100644
> meta-selftest/classes/base-do-configure-modified.bbclass
> > >>  create mode 100644
> meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> > >>  create mode 100644
> meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> > >>
> > >> diff --git a/meta-selftest/classes/base-do-configure-modified.bbclas=
s
> b/meta-selftest/classes/base-do-configure-modified.bbclass
> > >> new file mode 100644
> > >> index 00000000000..3f96827a428
> > >> --- /dev/null
> > >> +++ b/meta-selftest/classes/base-do-configure-modified.bbclass
> > >> @@ -0,0 +1,3 @@
> > >> +base_do_configure:append () {
> > >> +       echo "this changes base_do_configure() definiton"
> > >> +}
> > >> diff --git
> a/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> > >> new file mode 100644
> > >> index 00000000000..205720982cb
> > >> --- /dev/null
> > >> +++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> > >> @@ -0,0 +1,2 @@
> > >> +# This bbappend is used to alter the recipe using the
> test_recipe.inc file created by tests.
> > >> +include test_recipe.inc
> > >> diff --git
> a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> > >> new file mode 100644
> > >> index 00000000000..205720982cb
> > >> --- /dev/null
> > >> +++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappen=
d
> > >> @@ -0,0 +1,2 @@
> > >> +# This bbappend is used to alter the recipe using the
> test_recipe.inc file created by tests.
> > >> +include test_recipe.inc
> > >> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
> b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > >> index bdad9088d37..29e31f2ef9f 100644
> > >> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> > >> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > >> @@ -773,3 +773,107 @@ addtask tmptask2 before do_tmptask1
> > >>                  latestfiles =3D sorted(filedates.keys(), key=3Dlamb=
da f:
> filedates[f])[-2:]
> > >>                  bb.siggen.compare_sigfiles(latestfiles[-2],
> latestfiles[-1], recursecb)
> > >>                  self.assertEqual(recursecb_count,1)
> > >> +
> > >> +class SStatePrintdiff(SStateBase):
> > >> +    def run_test_printdiff_changerecipe(self, target, change_recipe=
,
> change_bbtask, change_content, expected_sametmp_output,
> expected_difftmp_output):
> > >> +        self.write_config("""
> > >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> > >> +""")
> > >> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff"=
)
> > >> +        bitbake(target)
> > >> +        bitbake("-S none {}".format(target))
> > >> +        bitbake(change_bbtask)
> > >> +        self.write_recipeinc(change_recipe, change_content)
> > >> +        result_sametmp =3D bitbake("-S printdiff {}".format(target)=
)
> > >> +
> > >> +        self.write_config("""
> > >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> > >> +""")
> > >> +        self.track_for_cleanup(self.topdir +
> "/tmp-sstateprintdiff-2")
> > >> +        result_difftmp =3D bitbake("-S printdiff {}".format(target)=
)
> > >> +
> > >> +        self.delete_recipeinc(change_recipe)
> > >> +        for item in expected_sametmp_output:
> > >> +            self.assertIn(item, result_sametmp.output)
> > >> +        for item in expected_difftmp_output:
> > >> +            self.assertIn(item, result_difftmp.output)
> > >> +
> > >> +    def run_test_printdiff_changeconfig(self, target,
> change_content, expected_sametmp_output, expected_difftmp_output):
> > >> +        self.write_config("""
> > >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> > >> +""")
> > >> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff"=
)
> > >> +        bitbake(target)
> > >> +        bitbake("-S none {}".format(target))
> > >> +        self.append_config(change_content)
> > >> +        result_sametmp =3D bitbake("-S printdiff {}".format(target)=
)
> > >> +
> > >> +        self.write_config("""
> > >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> > >> +""")
> > >> +        self.append_config(change_content)
> > >> +        self.track_for_cleanup(self.topdir +
> "/tmp-sstateprintdiff-2")
> > >> +        result_difftmp =3D bitbake("-S printdiff {}".format(target)=
)
> > >> +
> > >> +        for item in expected_sametmp_output:
> > >> +            self.assertIn(item, result_sametmp.output)
> > >> +        for item in expected_difftmp_output:
> > >> +            self.assertIn(item, result_difftmp.output)
> > >> +
> > >> +
> > >> +    # Check if printdiff walks the full dependency chain from the
> image target to where the change is in a specific recipe
> > >> +    def test_image_minimal_vs_quilt(self):
> > >> +        expected_output =3D ("Task quilt-native:do_install couldn't=
 be
> used from the cache because:",
> > >> +"We need hash",
> > >> +"most recent matching task was")
> > >> +        expected_sametmp_output =3D expected_output + ("Variable
> do_install value changed",'+    echo "this changes the task signature"')
> > >> +        expected_difftmp_output =3D expected_output
> > >> +
> > >> +        self.run_test_printdiff_changerecipe("core-image-minimal",
> "quilt-native", "-c do_install quilt-native",
> > >> +"""
> > >> +do_install:append() {
> > >> +    echo "this changes the task signature"
> > >> +}
> > >> +""",
> > >> +expected_sametmp_output, expected_difftmp_output)
> > >> +
> > >> +    # Check if changes to gcc-source (which uses tmp/work-shared)
> are correctly discovered
> > >> +    def test_gcc_runtime_vs_gcc_source(self):
> > >> +        expected_output =3D ("Task gcc-source-13.2.0:do_preconfigur=
e
> couldn't be used from the cache because:",
> > >
> > >
> > > We should avoid using the PV=3D13.2.0 explicitly imo otherwise it wil=
l
> need to be updated with the recipe forever.
> > >
> > > The archiver selftest have a gcc-source-PV example
> > >
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftes=
t/cases/archiver.py#n141
> > >
> > >> +"We need hash",
> > >> +"most recent matching task was")
> > >> +        expected_sametmp_output =3D expected_output + ("Variable
> do_preconfigure value changed",'+    print("this changes the task
> signature")')
> > >> +        #FIXME: printdiff is supposed to find at least one
> preconfigure task signature in the sstate cache, but isn't able to
> > >> +        #expected_difftmp_output =3D expected_output
> > >> +        expected_difftmp_output =3D ()
> > >> +
> > >> +        self.run_test_printdiff_changerecipe("gcc-runtime",
> "gcc-source", "-c do_preconfigure gcc-source-13.2.0",
> > >
> > >
> > > Same here
> > >
> > > Jose
> > >
> > >>
> > >> +"""
> > >> +python do_preconfigure:append() {
> > >> +    print("this changes the task signature")
> > >> +}
> > >> +""",
> > >> +expected_sametmp_output, expected_difftmp_output)
> > >> +
> > >> +    # Check if changing a really base task definiton is reported
> against multiple core recipes using it
> > >> +    def test_image_minimal_vs_base_do_configure(self):
> > >> +        expected_output =3D ("Task zstd-native:do_configure couldn'=
t
> be used from the cache because:",
> > >> +"Task texinfo-dummy-native:do_configure couldn't be used from the
> cache because:",
> > >> +"Task ldconfig-native:do_configure couldn't be used from the cache
> because:",
> > >> +"Task gettext-minimal-native:do_configure couldn't be used from the
> cache because:",
> > >> +"Task tzcode-native:do_configure couldn't be used from the cache
> because:",
> > >> +"Task makedevs-native:do_configure couldn't be used from the cache
> because:",
> > >> +"Task pigz-native:do_configure couldn't be used from the cache
> because:",
> > >> +"Task update-rc.d-native:do_configure couldn't be used from the
> cache because:",
> > >> +"Task unzip-native:do_configure couldn't be used from the cache
> because:",
> > >> +"Task gnu-config-native:do_configure couldn't be used from the cach=
e
> because:",
> > >> +"We need hash",
> > >> +"most recent matching task was")
> > >> +        expected_sametmp_output =3D expected_output + ("Variable
> base_do_configure value changed",'+     echo "this changes
> base_do_configure() definiton"')
> > >> +        expected_difftmp_output =3D expected_output
> > >> +
> > >> +        self.run_test_printdiff_changeconfig("core-image-minimal",
> > >> +"""
> > >> +INHERIT +=3D "base-do-configure-modified"
> > >> +""",
> > >> +expected_sametmp_output, expected_difftmp_output)
> > >> --
> > >> 2.39.2
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189338):
> https://lists.openembedded.org/g/openembedded-core/message/189338
> > Mute This Topic: https://lists.openembedded.org/mt/102017475/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004cd1840607fa3f0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia q=
uarta, 18/10/2023 =C3=A0(s) 09:48:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">I sent a v2 of this patch where this issue is corrected.=
<br></blockquote><div><br></div><div>Thanks</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
On Tue, 17 Oct 2023 at 16:15, Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Thanks, I was completely sure in my head I had fixed this, but either<=
br>
&gt; I haven&#39;t, or it has been somehow lost.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 17 Oct 2023 at 16:06, Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrot=
e:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" t=
arget=3D"_blank">alex.kanavin@gmail.com</a>&gt; escreveu no dia ter=C3=A7a,=
 17/10/2023 =C3=A0(s) 14:31:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &#39;bitbake -S printdiff&#39; is a useful diagnostic facilit=
y for finding out<br>
&gt; &gt;&gt; why sstate is not being reused, but until now it had no tests=
 that would<br>
&gt; &gt;&gt; ensure it works. This commit adds three basic scenarios:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 1. make a change in a really basic, common recipe that is at =
the very root<br>
&gt; &gt;&gt; of dependency trees (quilt-native), and ensure that change is=
 correctly discovered when<br>
&gt; &gt;&gt; building an image.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 2. make a change in gcc-source recipe, which is somewhat spec=
ial<br>
&gt; &gt;&gt; (operates in work-shared), and ensure that gcc-runtime builds=
 track<br>
&gt; &gt;&gt; that down as well.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 3. make a change in base_do_configure() definition from base.=
bbclass,<br>
&gt; &gt;&gt; which is not recipe-specific, but affects many basic recipes,=
 and ensure that<br>
&gt; &gt;&gt; is correctly reported as well.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The test itself actually runs twice:<br>
&gt; &gt;&gt; - first against a fully populated build directory, where<br>
&gt; &gt;&gt; the printdiff code is guaranteed to find the correct previous=
<br>
&gt; &gt;&gt; stamp that can be compared with in a predictable manner.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; - then in an empty build directory where the printdiff code<b=
r>
&gt; &gt;&gt; goes to look in the sstate cache, and so the existence of the=
<br>
&gt; &gt;&gt; previous signature can be tested, but not the difference with=
 it<br>
&gt; &gt;&gt; (what the exact difference would be is unpredictable as the<b=
r>
&gt; &gt;&gt; sstate cache is indeed shared between many builds).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@l=
inutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 .../base-do-configure-modified.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt; &gt;&gt;=C2=A0 .../gcc-source/gcc-source_%.bbappend=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;=C2=A0 .../quilt-native/quilt-native_%.bbappend=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/sstatetests.py=C2=A0 =C2=
=A0| 104 ++++++++++++++++++<br>
&gt; &gt;&gt;=C2=A0 4 files changed, 111 insertions(+)<br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-selftest/classes/base-do-config=
ure-modified.bbclass<br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-selftest/recipes-test/gcc-sourc=
e/gcc-source_%.bbappend<br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-selftest/recipes-test/quilt-nat=
ive/quilt-native_%.bbappend<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta-selftest/classes/base-do-configure-modified=
.bbclass b/meta-selftest/classes/base-do-configure-modified.bbclass<br>
&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; index 00000000000..3f96827a428<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++ b/meta-selftest/classes/base-do-configure-modified.bbclas=
s<br>
&gt; &gt;&gt; @@ -0,0 +1,3 @@<br>
&gt; &gt;&gt; +base_do_configure:append () {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;this changes base_do_c=
onfigure() definiton&quot;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; diff --git a/meta-selftest/recipes-test/gcc-source/gcc-source=
_%.bbappend b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend<b=
r>
&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; index 00000000000..205720982cb<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbap=
pend<br>
&gt; &gt;&gt; @@ -0,0 +1,2 @@<br>
&gt; &gt;&gt; +# This bbappend is used to alter the recipe using the test_r=
ecipe.inc file created by tests.<br>
&gt; &gt;&gt; +include test_recipe.inc<br>
&gt; &gt;&gt; diff --git a/meta-selftest/recipes-test/quilt-native/quilt-na=
tive_%.bbappend b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bb=
append<br>
&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; index 00000000000..205720982cb<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.=
bbappend<br>
&gt; &gt;&gt; @@ -0,0 +1,2 @@<br>
&gt; &gt;&gt; +# This bbappend is used to alter the recipe using the test_r=
ecipe.inc file created by tests.<br>
&gt; &gt;&gt; +include test_recipe.inc<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/me=
ta/lib/oeqa/selftest/cases/sstatetests.py<br>
&gt; &gt;&gt; index bdad9088d37..29e31f2ef9f 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
&gt; &gt;&gt; @@ -773,3 +773,107 @@ addtask tmptask2 before do_tmptask1<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 latestfiles =3D sorted(filedates.keys(), key=3Dlambda f: filedates[f])[-2:=
]<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)<br=
>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 self.assertEqual(recursecb_count,1)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +class SStatePrintdiff(SStateBase):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 def run_test_printdiff_changerecipe(self, targ=
et, change_recipe, change_bbtask, change_content, expected_sametmp_output, =
expected_difftmp_output):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&q=
uot;<br>
&gt; &gt;&gt; +TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff&quot;<br>
&gt; &gt;&gt; +&quot;&quot;&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topd=
ir + &quot;/tmp-sstateprintdiff&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(target)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;-S none {}&quot;.f=
ormat(target))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(change_bbtask)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_recipeinc(change_reci=
pe, change_content)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_sametmp =3D bitbake(&quot=
;-S printdiff {}&quot;.format(target))<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&q=
uot;<br>
&gt; &gt;&gt; +TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff-2&quot;<br>
&gt; &gt;&gt; +&quot;&quot;&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topd=
ir + &quot;/tmp-sstateprintdiff-2&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_difftmp =3D bitbake(&quot=
;-S printdiff {}&quot;.format(target))<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.delete_recipeinc(change_rec=
ipe)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_sametmp_out=
put:<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item=
, result_sametmp.output)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_difftmp_out=
put:<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item=
, result_difftmp.output)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 def run_test_printdiff_changeconfig(self, targ=
et, change_content, expected_sametmp_output, expected_difftmp_output):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&q=
uot;<br>
&gt; &gt;&gt; +TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff&quot;<br>
&gt; &gt;&gt; +&quot;&quot;&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topd=
ir + &quot;/tmp-sstateprintdiff&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(target)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;-S none {}&quot;.f=
ormat(target))<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(change_conten=
t)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_sametmp =3D bitbake(&quot=
;-S printdiff {}&quot;.format(target))<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&q=
uot;<br>
&gt; &gt;&gt; +TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff-2&quot;<br>
&gt; &gt;&gt; +&quot;&quot;&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(change_conten=
t)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topd=
ir + &quot;/tmp-sstateprintdiff-2&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_difftmp =3D bitbake(&quot=
;-S printdiff {}&quot;.format(target))<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_sametmp_out=
put:<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item=
, result_sametmp.output)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_difftmp_out=
put:<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item=
, result_difftmp.output)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # Check if printdiff walks the full dependency=
 chain from the image target to where the change is in a specific recipe<br=
>
&gt; &gt;&gt; +=C2=A0 =C2=A0 def test_image_minimal_vs_quilt(self):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D (&quot;Task =
quilt-native:do_install couldn&#39;t be used from the cache because:&quot;,=
<br>
&gt; &gt;&gt; +&quot;We need hash&quot;,<br>
&gt; &gt;&gt; +&quot;most recent matching task was&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_sametmp_output =3D expe=
cted_output + (&quot;Variable do_install value changed&quot;,&#39;+=C2=A0 =
=C2=A0 echo &quot;this changes the task signature&quot;&#39;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_difftmp_output =3D expe=
cted_output<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_printdiff_changere=
cipe(&quot;core-image-minimal&quot;, &quot;quilt-native&quot;, &quot;-c do_=
install quilt-native&quot;,<br>
&gt; &gt;&gt; +&quot;&quot;&quot;<br>
&gt; &gt;&gt; +do_install:append() {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 echo &quot;this changes the task signature&quo=
t;<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +&quot;&quot;&quot;,<br>
&gt; &gt;&gt; +expected_sametmp_output, expected_difftmp_output)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # Check if changes to gcc-source (which uses t=
mp/work-shared) are correctly discovered<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 def test_gcc_runtime_vs_gcc_source(self):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D (&quot;Task =
gcc-source-13.2.0:do_preconfigure couldn&#39;t be used from the cache becau=
se:&quot;,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; We should avoid using the PV=3D13.2.0 explicitly imo otherwise it=
 will need to be updated with the recipe forever.<br>
&gt; &gt;<br>
&gt; &gt; The archiver selftest have a gcc-source-PV example<br>
&gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/tree/me=
ta/lib/oeqa/selftest/cases/archiver.py#n141" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/se=
lftest/cases/archiver.py#n141</a><br>
&gt; &gt;<br>
&gt; &gt;&gt; +&quot;We need hash&quot;,<br>
&gt; &gt;&gt; +&quot;most recent matching task was&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_sametmp_output =3D expe=
cted_output + (&quot;Variable do_preconfigure value changed&quot;,&#39;+=C2=
=A0 =C2=A0 print(&quot;this changes the task signature&quot;)&#39;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #FIXME: printdiff is supposed to=
 find at least one preconfigure task signature in the sstate cache, but isn=
&#39;t able to<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #expected_difftmp_output =3D exp=
ected_output<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_difftmp_output =3D ()<b=
r>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_printdiff_changere=
cipe(&quot;gcc-runtime&quot;, &quot;gcc-source&quot;, &quot;-c do_preconfig=
ure gcc-source-13.2.0&quot;,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Same here<br>
&gt; &gt;<br>
&gt; &gt; Jose<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +&quot;&quot;&quot;<br>
&gt; &gt;&gt; +python do_preconfigure:append() {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 print(&quot;this changes the task signature&qu=
ot;)<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +&quot;&quot;&quot;,<br>
&gt; &gt;&gt; +expected_sametmp_output, expected_difftmp_output)<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # Check if changing a really base task definit=
on is reported against multiple core recipes using it<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 def test_image_minimal_vs_base_do_configure(se=
lf):<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D (&quot;Task =
zstd-native:do_configure couldn&#39;t be used from the cache because:&quot;=
,<br>
&gt; &gt;&gt; +&quot;Task texinfo-dummy-native:do_configure couldn&#39;t be=
 used from the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task ldconfig-native:do_configure couldn&#39;t be used=
 from the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task gettext-minimal-native:do_configure couldn&#39;t =
be used from the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task tzcode-native:do_configure couldn&#39;t be used f=
rom the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task makedevs-native:do_configure couldn&#39;t be used=
 from the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task pigz-native:do_configure couldn&#39;t be used fro=
m the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task update-rc.d-native:do_configure couldn&#39;t be u=
sed from the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task unzip-native:do_configure couldn&#39;t be used fr=
om the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;Task gnu-config-native:do_configure couldn&#39;t be us=
ed from the cache because:&quot;,<br>
&gt; &gt;&gt; +&quot;We need hash&quot;,<br>
&gt; &gt;&gt; +&quot;most recent matching task was&quot;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_sametmp_output =3D expe=
cted_output + (&quot;Variable base_do_configure value changed&quot;,&#39;+=
=C2=A0 =C2=A0 =C2=A0echo &quot;this changes base_do_configure() definiton&q=
uot;&#39;)<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_difftmp_output =3D expe=
cted_output<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_printdiff_changeco=
nfig(&quot;core-image-minimal&quot;,<br>
&gt; &gt;&gt; +&quot;&quot;&quot;<br>
&gt; &gt;&gt; +INHERIT +=3D &quot;base-do-configure-modified&quot;<br>
&gt; &gt;&gt; +&quot;&quot;&quot;,<br>
&gt; &gt;&gt; +expected_sametmp_output, expected_difftmp_output)<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.39.2<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#189338): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/189338" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/189338</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10201747=
5/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102017475/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000004cd1840607fa3f0d--

