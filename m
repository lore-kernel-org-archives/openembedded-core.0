Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E977CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 08:48:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.276899.1697618889511218715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 01:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMQuUE9i;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507973f3b65so8105685e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697618888; x=1698223688; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4G9qmMgA5/m63wxexLclPeHOP4OaaA12/wdNWeAlJA=;
        b=cMQuUE9iw9iPWocPgc0NyPUD8JO5rEQA7OM+/GQ82BixCFvQb1XxcocJwdcmjhPxgj
         s2kC3h4EINRnCG3QK209Kwno5OOjHZ3oxZ8gk9WVcNwwZWX7RhYNJuOiGPMm20Jecu7u
         +XR037HMKe3Yz6rM7D6YsQp3qAxjhnR0wIfL8DhoXDozbYRdLU/Xk19L4A8AUygDr4Xl
         Fg7qZFZYr2rEAl43HDsZcTLIk9ISrJa0kuSDLgvYrKHbjfqSEbDKG8nKkn8zvteJDdcH
         oloC4wB4cfVDV+zHxtdiAOUYRDyDQxDoN+peTuGUVfeREteyCfcYt3MvM5nbfbj8CWyT
         q7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697618888; x=1698223688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4G9qmMgA5/m63wxexLclPeHOP4OaaA12/wdNWeAlJA=;
        b=iNk6JHG4N6LPMeb2qJ6s0k0k75Z7l2Hq5EbsLmh18PMTH9W1LbkR6etYpaNt/dt/jA
         9CfevJyq+cy8R16Yg8Zf8FMtyoX2GaISrYqo1gHQWql2cvHcxLgVhJY68Rz1kNe0ardY
         SIszF/DinVgiN6qwMWRSun1Dtz+ytk6dG9Zk0Nw/8zm+JJecBMPg52/p0VmOgItjs6R4
         xq8avJb512ZwYexUiC1BKICOyExDitV2e7Hto310Cv3oyHnT5zlnyJXoTRQadEKBueNO
         zfSvTq2SQ3wdww69IjD4k0caEvw+4XmDO7H2a0LHC0HDfVLCpYVULRfHTgzcDVCb3Irx
         f2Eg==
X-Gm-Message-State: AOJu0YxjDL3LaX1SoO153Z6l9WC6J8yX2LHTAd5xUrk607sGX6NI8Ee0
	Zpqrxae0AjzHEDGieskUYHyY/yWNRgV5q5FRbhYTPH16
X-Google-Smtp-Source: AGHT+IH6Pl7njGfJTRO7ZPU5OT9JnqR37pGjkE6UqHHaZ4ZJndBRqUuIJ3leHFT6O/AQCvJP+phN70cjLYoB3V4K/mM=
X-Received: by 2002:a05:651c:3dc:b0:2c5:1122:9712 with SMTP id
 f28-20020a05651c03dc00b002c511229712mr2779078ljp.46.1697618887472; Wed, 18
 Oct 2023 01:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231017133050.147000-1-alex@linutronix.de> <20231017133050.147000-2-alex@linutronix.de>
 <CANPvuRmdtKAf6U8Kv1aW0N6VRSxN48q3bPDs3eHRn6NcDGWZkg@mail.gmail.com> <178EEAABEAFD6A58.14388@lists.openembedded.org>
In-Reply-To: <178EEAABEAFD6A58.14388@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Oct 2023 10:47:56 +0200
Message-ID: <CANNYZj_1tjpD9g1vXOJFGMtC1WYf_73FhT1KzbZ-TcE5vTi-tQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189371

I sent a v2 of this patch where this issue is corrected.

Alex

On Tue, 17 Oct 2023 at 16:15, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Thanks, I was completely sure in my head I had fixed this, but either
> I haven't, or it has been somehow lost.
>
> Alex
>
> On Tue, 17 Oct 2023 at 16:06, Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
> >
> >
> >
> > Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a, =
17/10/2023 =C3=A0(s) 14:31:
> >>
> >> 'bitbake -S printdiff' is a useful diagnostic facility for finding out
> >> why sstate is not being reused, but until now it had no tests that wou=
ld
> >> ensure it works. This commit adds three basic scenarios:
> >>
> >> 1. make a change in a really basic, common recipe that is at the very =
root
> >> of dependency trees (quilt-native), and ensure that change is correctl=
y discovered when
> >> building an image.
> >>
> >> 2. make a change in gcc-source recipe, which is somewhat special
> >> (operates in work-shared), and ensure that gcc-runtime builds track
> >> that down as well.
> >>
> >> 3. make a change in base_do_configure() definition from base.bbclass,
> >> which is not recipe-specific, but affects many basic recipes, and ensu=
re that
> >> is correctly reported as well.
> >>
> >> The test itself actually runs twice:
> >> - first against a fully populated build directory, where
> >> the printdiff code is guaranteed to find the correct previous
> >> stamp that can be compared with in a predictable manner.
> >>
> >> - then in an empty build directory where the printdiff code
> >> goes to look in the sstate cache, and so the existence of the
> >> previous signature can be tested, but not the difference with it
> >> (what the exact difference would be is unpredictable as the
> >> sstate cache is indeed shared between many builds).
> >>
> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> ---
> >>  .../base-do-configure-modified.bbclass        |   3 +
> >>  .../gcc-source/gcc-source_%.bbappend          |   2 +
> >>  .../quilt-native/quilt-native_%.bbappend      |   2 +
> >>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 104 +++++++++++++++++=
+
> >>  4 files changed, 111 insertions(+)
> >>  create mode 100644 meta-selftest/classes/base-do-configure-modified.b=
bclass
> >>  create mode 100644 meta-selftest/recipes-test/gcc-source/gcc-source_%=
.bbappend
> >>  create mode 100644 meta-selftest/recipes-test/quilt-native/quilt-nati=
ve_%.bbappend
> >>
> >> diff --git a/meta-selftest/classes/base-do-configure-modified.bbclass =
b/meta-selftest/classes/base-do-configure-modified.bbclass
> >> new file mode 100644
> >> index 00000000000..3f96827a428
> >> --- /dev/null
> >> +++ b/meta-selftest/classes/base-do-configure-modified.bbclass
> >> @@ -0,0 +1,3 @@
> >> +base_do_configure:append () {
> >> +       echo "this changes base_do_configure() definiton"
> >> +}
> >> diff --git a/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappe=
nd b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> >> new file mode 100644
> >> index 00000000000..205720982cb
> >> --- /dev/null
> >> +++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> >> @@ -0,0 +1,2 @@
> >> +# This bbappend is used to alter the recipe using the test_recipe.inc=
 file created by tests.
> >> +include test_recipe.inc
> >> diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bb=
append b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> >> new file mode 100644
> >> index 00000000000..205720982cb
> >> --- /dev/null
> >> +++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> >> @@ -0,0 +1,2 @@
> >> +# This bbappend is used to alter the recipe using the test_recipe.inc=
 file created by tests.
> >> +include test_recipe.inc
> >> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oe=
qa/selftest/cases/sstatetests.py
> >> index bdad9088d37..29e31f2ef9f 100644
> >> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> >> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> >> @@ -773,3 +773,107 @@ addtask tmptask2 before do_tmptask1
> >>                  latestfiles =3D sorted(filedates.keys(), key=3Dlambda=
 f: filedates[f])[-2:]
> >>                  bb.siggen.compare_sigfiles(latestfiles[-2], latestfil=
es[-1], recursecb)
> >>                  self.assertEqual(recursecb_count,1)
> >> +
> >> +class SStatePrintdiff(SStateBase):
> >> +    def run_test_printdiff_changerecipe(self, target, change_recipe, =
change_bbtask, change_content, expected_sametmp_output, expected_difftmp_ou=
tput):
> >> +        self.write_config("""
> >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> >> +""")
> >> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> >> +        bitbake(target)
> >> +        bitbake("-S none {}".format(target))
> >> +        bitbake(change_bbtask)
> >> +        self.write_recipeinc(change_recipe, change_content)
> >> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
> >> +
> >> +        self.write_config("""
> >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> >> +""")
> >> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2"=
)
> >> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
> >> +
> >> +        self.delete_recipeinc(change_recipe)
> >> +        for item in expected_sametmp_output:
> >> +            self.assertIn(item, result_sametmp.output)
> >> +        for item in expected_difftmp_output:
> >> +            self.assertIn(item, result_difftmp.output)
> >> +
> >> +    def run_test_printdiff_changeconfig(self, target, change_content,=
 expected_sametmp_output, expected_difftmp_output):
> >> +        self.write_config("""
> >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> >> +""")
> >> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> >> +        bitbake(target)
> >> +        bitbake("-S none {}".format(target))
> >> +        self.append_config(change_content)
> >> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
> >> +
> >> +        self.write_config("""
> >> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> >> +""")
> >> +        self.append_config(change_content)
> >> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2"=
)
> >> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
> >> +
> >> +        for item in expected_sametmp_output:
> >> +            self.assertIn(item, result_sametmp.output)
> >> +        for item in expected_difftmp_output:
> >> +            self.assertIn(item, result_difftmp.output)
> >> +
> >> +
> >> +    # Check if printdiff walks the full dependency chain from the ima=
ge target to where the change is in a specific recipe
> >> +    def test_image_minimal_vs_quilt(self):
> >> +        expected_output =3D ("Task quilt-native:do_install couldn't b=
e used from the cache because:",
> >> +"We need hash",
> >> +"most recent matching task was")
> >> +        expected_sametmp_output =3D expected_output + ("Variable do_i=
nstall value changed",'+    echo "this changes the task signature"')
> >> +        expected_difftmp_output =3D expected_output
> >> +
> >> +        self.run_test_printdiff_changerecipe("core-image-minimal", "q=
uilt-native", "-c do_install quilt-native",
> >> +"""
> >> +do_install:append() {
> >> +    echo "this changes the task signature"
> >> +}
> >> +""",
> >> +expected_sametmp_output, expected_difftmp_output)
> >> +
> >> +    # Check if changes to gcc-source (which uses tmp/work-shared) are=
 correctly discovered
> >> +    def test_gcc_runtime_vs_gcc_source(self):
> >> +        expected_output =3D ("Task gcc-source-13.2.0:do_preconfigure =
couldn't be used from the cache because:",
> >
> >
> > We should avoid using the PV=3D13.2.0 explicitly imo otherwise it will =
need to be updated with the recipe forever.
> >
> > The archiver selftest have a gcc-source-PV example
> > https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selft=
est/cases/archiver.py#n141
> >
> >> +"We need hash",
> >> +"most recent matching task was")
> >> +        expected_sametmp_output =3D expected_output + ("Variable do_p=
reconfigure value changed",'+    print("this changes the task signature")')
> >> +        #FIXME: printdiff is supposed to find at least one preconfigu=
re task signature in the sstate cache, but isn't able to
> >> +        #expected_difftmp_output =3D expected_output
> >> +        expected_difftmp_output =3D ()
> >> +
> >> +        self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-sour=
ce", "-c do_preconfigure gcc-source-13.2.0",
> >
> >
> > Same here
> >
> > Jose
> >
> >>
> >> +"""
> >> +python do_preconfigure:append() {
> >> +    print("this changes the task signature")
> >> +}
> >> +""",
> >> +expected_sametmp_output, expected_difftmp_output)
> >> +
> >> +    # Check if changing a really base task definiton is reported agai=
nst multiple core recipes using it
> >> +    def test_image_minimal_vs_base_do_configure(self):
> >> +        expected_output =3D ("Task zstd-native:do_configure couldn't =
be used from the cache because:",
> >> +"Task texinfo-dummy-native:do_configure couldn't be used from the cac=
he because:",
> >> +"Task ldconfig-native:do_configure couldn't be used from the cache be=
cause:",
> >> +"Task gettext-minimal-native:do_configure couldn't be used from the c=
ache because:",
> >> +"Task tzcode-native:do_configure couldn't be used from the cache beca=
use:",
> >> +"Task makedevs-native:do_configure couldn't be used from the cache be=
cause:",
> >> +"Task pigz-native:do_configure couldn't be used from the cache becaus=
e:",
> >> +"Task update-rc.d-native:do_configure couldn't be used from the cache=
 because:",
> >> +"Task unzip-native:do_configure couldn't be used from the cache becau=
se:",
> >> +"Task gnu-config-native:do_configure couldn't be used from the cache =
because:",
> >> +"We need hash",
> >> +"most recent matching task was")
> >> +        expected_sametmp_output =3D expected_output + ("Variable base=
_do_configure value changed",'+     echo "this changes base_do_configure() =
definiton"')
> >> +        expected_difftmp_output =3D expected_output
> >> +
> >> +        self.run_test_printdiff_changeconfig("core-image-minimal",
> >> +"""
> >> +INHERIT +=3D "base-do-configure-modified"
> >> +""",
> >> +expected_sametmp_output, expected_difftmp_output)
> >> --
> >> 2.39.2
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189338): https://lists.openembedded.org/g/openembedde=
d-core/message/189338
> Mute This Topic: https://lists.openembedded.org/mt/102017475/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

