Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60769CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 14:15:39 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.216140.1697552133229038598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 07:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5LnFfbU;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c16757987fso72648061fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697552131; x=1698156931; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeBoFoYnrOc2AZDt7b1G8Dz3rdxOMGhzahIjD2djUBo=;
        b=i5LnFfbUaHE/AmFtG11IAV+tDY7aCkT6VA99+eGXyODBD0alDCZGe2IjMN57Y7ok6N
         ndHJfy1F6Z478koNOZfJ797VwXirezN9aFg6vCYZo3GFsNFCDtKMUDCUShAy5TiTmml0
         hyGXZywzAKVDcYJofavLFScP4VUQwt1WawvOJ+rDxTid04pHdvm96Lda1orwnyE9o4FG
         Xs60XLphhTKzBUec/e2aICTpmV2XsFoSu6L7Y85dTyo2x/qhYgzSZ4FNOkjVpVc2jbWT
         q79wod6U+InsO+rxYBMrRDc6tE7HSsMfvK2X4VdQYp1mNB631KJL5gpuXb+zxbQg/3yj
         7d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697552131; x=1698156931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeBoFoYnrOc2AZDt7b1G8Dz3rdxOMGhzahIjD2djUBo=;
        b=TxkHayrLsNV1/z+I20CPk4U6XQ357ySntHTj67DL8VNCqBPb+p+DOj1v612oI1sNoD
         w198RR/CMwsjpka+SV8u9iojmhI9EMrV8JsBXSYlvufeD0LVew/Cf3ZESPNgENYUB77I
         3WS7Uj81GgL0ry6J3F8kNtPvllO6wjt7xaLFg6aHmNqxmmrBh1GuhOcw4/v1AWcOtnFx
         7waTSJ56IuaC0D/pfFejU6EXB99YeFvYM/ovSGlUSsvpd4z4A5cHCPdWCPWX6xINxp5u
         gMBqYRADzQjQE4F4KOTWIbGEY7yu79g7ntsp77yTpvMyt8816AMTPk2CXP9tWPpWiBMV
         2bOQ==
X-Gm-Message-State: AOJu0Ywzuv7isBesKLuuphihtsxxlbztpPXDyNunSLS6qW2j/CbEoHvS
	Gf4Z3EwdqbfTgTr6SjnhEcmINAvpjKz+0uby7SE=
X-Google-Smtp-Source: AGHT+IFfliqHLysRkOHh74dZzVUbQJRdjfr6M9jIJFDLqF/KeapuYXKxfszqq/RMLM67GY+lSBT+8Nkw1dhIsfLp7zs=
X-Received: by 2002:a05:651c:32d:b0:2c5:22b4:b573 with SMTP id
 b13-20020a05651c032d00b002c522b4b573mr1495482ljp.36.1697552131114; Tue, 17
 Oct 2023 07:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231017133050.147000-1-alex@linutronix.de> <20231017133050.147000-2-alex@linutronix.de>
 <CANPvuRmdtKAf6U8Kv1aW0N6VRSxN48q3bPDs3eHRn6NcDGWZkg@mail.gmail.com>
In-Reply-To: <CANPvuRmdtKAf6U8Kv1aW0N6VRSxN48q3bPDs3eHRn6NcDGWZkg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Oct 2023 16:15:19 +0200
Message-ID: <CANNYZj9iVfJ0+fbCeMEAw4MaFo4qhsi1a3t=bFaN1_JzKaWhWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 14:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189338

Thanks, I was completely sure in my head I had fixed this, but either
I haven't, or it has been somehow lost.

Alex

On Tue, 17 Oct 2023 at 16:06, Jose Quaresma <quaresma.jose@gmail.com> wrote=
:
>
>
>
> Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a, 17=
/10/2023 =C3=A0(s) 14:31:
>>
>> 'bitbake -S printdiff' is a useful diagnostic facility for finding out
>> why sstate is not being reused, but until now it had no tests that would
>> ensure it works. This commit adds three basic scenarios:
>>
>> 1. make a change in a really basic, common recipe that is at the very ro=
ot
>> of dependency trees (quilt-native), and ensure that change is correctly =
discovered when
>> building an image.
>>
>> 2. make a change in gcc-source recipe, which is somewhat special
>> (operates in work-shared), and ensure that gcc-runtime builds track
>> that down as well.
>>
>> 3. make a change in base_do_configure() definition from base.bbclass,
>> which is not recipe-specific, but affects many basic recipes, and ensure=
 that
>> is correctly reported as well.
>>
>> The test itself actually runs twice:
>> - first against a fully populated build directory, where
>> the printdiff code is guaranteed to find the correct previous
>> stamp that can be compared with in a predictable manner.
>>
>> - then in an empty build directory where the printdiff code
>> goes to look in the sstate cache, and so the existence of the
>> previous signature can be tested, but not the difference with it
>> (what the exact difference would be is unpredictable as the
>> sstate cache is indeed shared between many builds).
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>  .../base-do-configure-modified.bbclass        |   3 +
>>  .../gcc-source/gcc-source_%.bbappend          |   2 +
>>  .../quilt-native/quilt-native_%.bbappend      |   2 +
>>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 104 ++++++++++++++++++
>>  4 files changed, 111 insertions(+)
>>  create mode 100644 meta-selftest/classes/base-do-configure-modified.bbc=
lass
>>  create mode 100644 meta-selftest/recipes-test/gcc-source/gcc-source_%.b=
bappend
>>  create mode 100644 meta-selftest/recipes-test/quilt-native/quilt-native=
_%.bbappend
>>
>> diff --git a/meta-selftest/classes/base-do-configure-modified.bbclass b/=
meta-selftest/classes/base-do-configure-modified.bbclass
>> new file mode 100644
>> index 00000000000..3f96827a428
>> --- /dev/null
>> +++ b/meta-selftest/classes/base-do-configure-modified.bbclass
>> @@ -0,0 +1,3 @@
>> +base_do_configure:append () {
>> +       echo "this changes base_do_configure() definiton"
>> +}
>> diff --git a/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend=
 b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
>> new file mode 100644
>> index 00000000000..205720982cb
>> --- /dev/null
>> +++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
>> @@ -0,0 +1,2 @@
>> +# This bbappend is used to alter the recipe using the test_recipe.inc f=
ile created by tests.
>> +include test_recipe.inc
>> diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbap=
pend b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
>> new file mode 100644
>> index 00000000000..205720982cb
>> --- /dev/null
>> +++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
>> @@ -0,0 +1,2 @@
>> +# This bbappend is used to alter the recipe using the test_recipe.inc f=
ile created by tests.
>> +include test_recipe.inc
>> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa=
/selftest/cases/sstatetests.py
>> index bdad9088d37..29e31f2ef9f 100644
>> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
>> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
>> @@ -773,3 +773,107 @@ addtask tmptask2 before do_tmptask1
>>                  latestfiles =3D sorted(filedates.keys(), key=3Dlambda f=
: filedates[f])[-2:]
>>                  bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles=
[-1], recursecb)
>>                  self.assertEqual(recursecb_count,1)
>> +
>> +class SStatePrintdiff(SStateBase):
>> +    def run_test_printdiff_changerecipe(self, target, change_recipe, ch=
ange_bbtask, change_content, expected_sametmp_output, expected_difftmp_outp=
ut):
>> +        self.write_config("""
>> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
>> +""")
>> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
>> +        bitbake(target)
>> +        bitbake("-S none {}".format(target))
>> +        bitbake(change_bbtask)
>> +        self.write_recipeinc(change_recipe, change_content)
>> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
>> +
>> +        self.write_config("""
>> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
>> +""")
>> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
>> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
>> +
>> +        self.delete_recipeinc(change_recipe)
>> +        for item in expected_sametmp_output:
>> +            self.assertIn(item, result_sametmp.output)
>> +        for item in expected_difftmp_output:
>> +            self.assertIn(item, result_difftmp.output)
>> +
>> +    def run_test_printdiff_changeconfig(self, target, change_content, e=
xpected_sametmp_output, expected_difftmp_output):
>> +        self.write_config("""
>> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
>> +""")
>> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
>> +        bitbake(target)
>> +        bitbake("-S none {}".format(target))
>> +        self.append_config(change_content)
>> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
>> +
>> +        self.write_config("""
>> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
>> +""")
>> +        self.append_config(change_content)
>> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
>> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
>> +
>> +        for item in expected_sametmp_output:
>> +            self.assertIn(item, result_sametmp.output)
>> +        for item in expected_difftmp_output:
>> +            self.assertIn(item, result_difftmp.output)
>> +
>> +
>> +    # Check if printdiff walks the full dependency chain from the image=
 target to where the change is in a specific recipe
>> +    def test_image_minimal_vs_quilt(self):
>> +        expected_output =3D ("Task quilt-native:do_install couldn't be =
used from the cache because:",
>> +"We need hash",
>> +"most recent matching task was")
>> +        expected_sametmp_output =3D expected_output + ("Variable do_ins=
tall value changed",'+    echo "this changes the task signature"')
>> +        expected_difftmp_output =3D expected_output
>> +
>> +        self.run_test_printdiff_changerecipe("core-image-minimal", "qui=
lt-native", "-c do_install quilt-native",
>> +"""
>> +do_install:append() {
>> +    echo "this changes the task signature"
>> +}
>> +""",
>> +expected_sametmp_output, expected_difftmp_output)
>> +
>> +    # Check if changes to gcc-source (which uses tmp/work-shared) are c=
orrectly discovered
>> +    def test_gcc_runtime_vs_gcc_source(self):
>> +        expected_output =3D ("Task gcc-source-13.2.0:do_preconfigure co=
uldn't be used from the cache because:",
>
>
> We should avoid using the PV=3D13.2.0 explicitly imo otherwise it will ne=
ed to be updated with the recipe forever.
>
> The archiver selftest have a gcc-source-PV example
> https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftes=
t/cases/archiver.py#n141
>
>> +"We need hash",
>> +"most recent matching task was")
>> +        expected_sametmp_output =3D expected_output + ("Variable do_pre=
configure value changed",'+    print("this changes the task signature")')
>> +        #FIXME: printdiff is supposed to find at least one preconfigure=
 task signature in the sstate cache, but isn't able to
>> +        #expected_difftmp_output =3D expected_output
>> +        expected_difftmp_output =3D ()
>> +
>> +        self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source=
", "-c do_preconfigure gcc-source-13.2.0",
>
>
> Same here
>
> Jose
>
>>
>> +"""
>> +python do_preconfigure:append() {
>> +    print("this changes the task signature")
>> +}
>> +""",
>> +expected_sametmp_output, expected_difftmp_output)
>> +
>> +    # Check if changing a really base task definiton is reported agains=
t multiple core recipes using it
>> +    def test_image_minimal_vs_base_do_configure(self):
>> +        expected_output =3D ("Task zstd-native:do_configure couldn't be=
 used from the cache because:",
>> +"Task texinfo-dummy-native:do_configure couldn't be used from the cache=
 because:",
>> +"Task ldconfig-native:do_configure couldn't be used from the cache beca=
use:",
>> +"Task gettext-minimal-native:do_configure couldn't be used from the cac=
he because:",
>> +"Task tzcode-native:do_configure couldn't be used from the cache becaus=
e:",
>> +"Task makedevs-native:do_configure couldn't be used from the cache beca=
use:",
>> +"Task pigz-native:do_configure couldn't be used from the cache because:=
",
>> +"Task update-rc.d-native:do_configure couldn't be used from the cache b=
ecause:",
>> +"Task unzip-native:do_configure couldn't be used from the cache because=
:",
>> +"Task gnu-config-native:do_configure couldn't be used from the cache be=
cause:",
>> +"We need hash",
>> +"most recent matching task was")
>> +        expected_sametmp_output =3D expected_output + ("Variable base_d=
o_configure value changed",'+     echo "this changes base_do_configure() de=
finiton"')
>> +        expected_difftmp_output =3D expected_output
>> +
>> +        self.run_test_printdiff_changeconfig("core-image-minimal",
>> +"""
>> +INHERIT +=3D "base-do-configure-modified"
>> +""",
>> +expected_sametmp_output, expected_difftmp_output)
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#189332): https://lists.openembedded.org/g/openembedd=
ed-core/message/189332
>> Mute This Topic: https://lists.openembedded.org/mt/102017475/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [q=
uaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

