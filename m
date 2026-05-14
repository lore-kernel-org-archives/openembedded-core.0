Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4919CCD37AC
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 20:06:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20391.1778789203156461108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 13:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gmw9AGwG;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so8324614e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778789201; cv=none;
        d=google.com; s=arc-20240605;
        b=ic2ISW+qfjTC4gb9RAQNxtWzL0FO9QHdbsTHHaQZwew1jpCzSljL4aLKii6aqROM6f
         EuG2IyXyq90pomYSStSt78+7d90siT1VQqO8ATqt4uX3xP63QYUxwo/RKhSj/HGbbsuv
         HA92Rb1/dPJIWhdIYI41fLaBIW2Kmrf3lLd/Ia62z3VBFHB2lQwTdTWPiTDSNRgEqCr5
         YUfp70x64m47hTEoRx/2rnN11ZLT+ewkH9f8cOP1i5xxw6G/wtngO/YJnNnXm9tNiXvH
         ClbRIHm65mnIW5KIVuwr8XttINyJ4aWClHVvOp9n8JXzsf8a3YBKXZt+aXWGoDidvVbq
         EkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0GWVYSqwQN532smdyd0yTAvyeif7W1sDfxjX8blj0lo=;
        fh=CHpSOhgxz2LkTWRnKrWWgwy0UfjnaPgkq8nQFz+IujM=;
        b=Qz5c5n+MVIMrkxcLBTXFrG5hl1rFe0gHUuj0sIlQT/Ru1NR8RBwCiVg7saKgq5z7VT
         6UXeacY8xNSDAsDYgELEnIJEU1BH8f2TkhzdKe1k/IFUlO4bzVvRqG4+W6EWppdX+a9d
         kWvSrpgwySexp4pMGHi6MRuUtYaNwykHOygmZRMAooq2wiuKUmFBNIX643bTyFwYh1qa
         HOOnfHq8TBr+rKG4Vb3oAX7hUKRIBdLtHs5lOpppEcI2VdYfWrJFQ4fzD9B0HkHi2xNx
         6wPazrpUcd2hxXNEeEECqikvbg5tdkAuxZA3eOhMNdy58iTH7v44M244gygp7HuupRmk
         XYAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778789201; x=1779394001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0GWVYSqwQN532smdyd0yTAvyeif7W1sDfxjX8blj0lo=;
        b=Gmw9AGwGq/fDsiv2jktTV3ssaplg3Xwa3t+mmBoEWnvs9MlpCVHGsuNqY8GSdhmlUh
         rWoLrXs0X0Nh09UrNfb6zn7AC7afL7qwcR3rfmpoRtdWtd8X7TyrgV1FkOuySjsXjCLU
         gqE0laLnh8jjLTOk53ZAuUXkgswFx4Jt+ryzSmJwsyoaaUfXjRhDrszM/iWbmRSwFR0s
         N7EjVyvUjyH4vB+U74we3bQt7K7aYaPyZwZwXoCKP89ak+DOp19PS6J59uNehZOTEExI
         aMVCEhD+bx+8/pbgb4MPchEYRKJlEcK0zBL+gisIrbeTCVziQTLR7uoJukUI9AEd+iD+
         u/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778789201; x=1779394001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GWVYSqwQN532smdyd0yTAvyeif7W1sDfxjX8blj0lo=;
        b=g0gPYPZBQwd3FLsi9KD60d2k7fUolfHexxGsPcmAIe9Nx2EB1knci6gObNYGGYifOq
         IAnKrDfD2OoigvA3oaAp07T5SAshroBmR20w9Cvz7glyQ+KH77l2n314mW3KrJ9ZCXk6
         pmu0JE7nqE+9ZufYDPhn6VQta6f8pOUiULH6eHdilZM5IDS/V4Lfilxh+6F+Wd3RLd4M
         RjQv+Rj4Ta/geV+8Y08i9V1r5GdXw1hnI0ADoBlsqpY7S9KuiIm4/Chq2MFOik2BnrB4
         u8Csy9GnMB8svdYmquyD0l3IJpfxm5RSvvqCFyJwwOzc7zfODXkfHUDRkfx1Ty9vg0DA
         Bi0g==
X-Gm-Message-State: AOJu0YyOSVHzTxZz0UUs13kur7ilgv7XUZPG8wIVXdtvMGOKlCDdAb7l
	0KtBF5S5yOqDB/ctIk7vjg2v0CilZsu9ZqeQdjkh9UReQu9Ra0LfwIZr9325yYVsJZNb34Fht5T
	LOuT+/arTK1/zG2HaLpEMh7uGaYM+OLA=
X-Gm-Gg: Acq92OH8yBP5++IS0KlIxY5j+XwPFRwCuLP42ZQ1a6zU4F+0fnwCvot4Jc1FALFhu3Q
	Kdi4Xq/ox+3jXU7/XjXANm6bir74+Mt4t+Gf+q/WuXO+qXKwlexyoUrex220R0fwkTXwZpBzm1d
	qraeBE/zAGqSlgRJaqnsyBTI5xtv+ZQnBTNStp0VkqeeQzd7/01GBt5BeaPmN/Cjg6Dq2HD0ooG
	E719Y50tQ1BiXkjA7fYcQAr+QMPZUwa3YQmUvH4BIHfcoQqQPfEwWK5PqaEYx363w2ofrs3SJ8D
	anF7l2c=
X-Received: by 2002:a05:6512:2309:b0:5a8:fca6:a537 with SMTP id
 2adb3069b0e04-5aa0e73061dmr125716e87.22.1778789200762; Thu, 14 May 2026
 13:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260513135633.3197130-1-daniel.turull@ericsson.com>
In-Reply-To: <20260513135633.3197130-1-daniel.turull@ericsson.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 14 May 2026 13:06:27 -0700
X-Gm-Features: AVHnY4JwdoA3gSNQaUddLXAIWa0kjMd_BZ7NUxl9MYTpuw8_sIXQ1mCZKSFzrYQ
Message-ID: <CANx9H-C+LOXUqnctwK3LicLdZb-qeW4erwH5SkOWTTiGOA3Uyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] devtool: upgrade: extract changelog between versions
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Content-Type: multipart/mixed; boundary="0000000000007139cf0651cca2fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 20:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237059

--0000000000007139cf0651cca2fc
Content-Type: multipart/alternative; boundary="0000000000007139cd0651cca2fa"

--0000000000007139cd0651cca2fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tested this with python3-cryptography, python3-maturin and vim
(output attached). In all three cases the resulting <recipe>.txt file
looked like what I expected. It is interesting that the "changes"
output can succeed and provide information when the recipe
upgrade itself fails (python3-cryptography and vim fall into that
category).

I'll warn that automatically including the results in AUH upgrade
runs the risk of creating some fairly large "wall of text" commit logs.
I personally prefer more information rather than no information, so
I like this approach. Not everyone agrees with me.

One other idea would be to include the GitHub "compare" type URLs
when those are available [1][2][3].

Another idea might be including a link to the detected "changes" file,
or files depending on the recipe's upstream pattern.

I have a similar approach in progress forked from 'changelogs', but
it is limited by the tool to pypi, npm, rubygems [4] and also requires
too much manual fixing to detect the "changes" file.

On Wed, May 13, 2026 at 6:56=E2=80=AFAM Daniel Turull via lists.openembedde=
d.org
<daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Automatically extract changelog information when upgrading a recipe.
> Uses the devtool-base tags created during upgrade to diff known
> changelog files (NEWS, ChangeLog, CHANGES, etc.) between the old and
> new versions. For git-based sources, falls back to git log --oneline
> if no changelog file changed.
>
> Also match per-version release notes files like git's
> Documentation/RelNotes/2.53.0.adoc or mesa's docs/relnotes/26.0.3.rst.
>
> These are detected by matching filenames that contain a version
> number with a documentation extension (.txt, .md, .rst, .adoc).
> Their full content is read via git show since they are new files
> rather than modifications to an existing changelog.
>
> Collapse runs of multiple blank lines into a single blank line and
> strip leading/trailing whitespace from the extracted changelog. This
> produces cleaner output that is suitable for inclusion in commit
> messages by tools like AUH.
>
> Output is written to workspace/changelogs/<pn>.txt and cleaned up on
> devtool reset. This allows AUH and other tools to pick up the changelog
> without implementing their own extraction logic.
>
> Add test cases for existings test recipes
>
nit pick: typo s/existings/existing/


> Assisted-by: kiro:claude-opus-4.6
>
Our current standard is "AI-generated: <description of tool and LLM model>"
[5]


[1] https://github.com/pyca/cryptography/compare/46.0.7...48.0.0
[2] https://github.com/PyO3/maturin/compare/v1.13.1...v1.13.3
[3] https://github.com/vim/vim/compare/v9.2.0341...v9.2.0481
[4] https://github.com/moto-timo/changelogs/tree/dev-pyproject.toml
[5]
https://docs.yoctoproject.org/dev/singleindex.html#acceptance-of-ai-generat=
ed-code

Tested-by: Tim Orling <tim.orling@konsulko.com>

> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
>
> ---
>
> v2:
> - squash v1 patches into one commit and keep commit messages
> - Integrate test cases with exiting devtool selftests
>
> v3:
> - do not silently skip the test if changelog is missing
> ---
>  .../python3-guessing-game_git.bb.changelog    |  3 +
>  .../devtool-upgrade-test1_1.5.3.bb.changelog  | 24 +++++
>  .../devtool-upgrade-test2_git.bb.changelog    |  3 +
>  .../devtool-upgrade-test3_1.5.3.bb.changelog  | 24 +++++
>  .../devtool-upgrade-test4_1.5.3.bb.changelog  | 24 +++++
>  .../devtool-upgrade-test5_git.bb.changelog    |  3 +
>  meta/lib/oeqa/selftest/cases/devtool.py       | 27 ++++++
>  scripts/lib/devtool/standard.py               |  8 ++
>  scripts/lib/devtool/upgrade.py                | 95 +++++++++++++++++++
>  9 files changed, 211 insertions(+)
>  create mode 100644
> meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.change=
log
>  create mode 100644
> meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.changel=
og
>  create mode 100644
> meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.changelog
>  create mode 100644
> meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.changel=
og
>  create mode 100644
> meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.changel=
og
>  create mode 100644
> meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.changelog
>
> diff --git
> a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.chan=
gelog
> b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.chan=
gelog
> new file mode 100644
> index 0000000000..571220b2a4
> --- /dev/null
> +++
> b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.chan=
gelog
> @@ -0,0 +1,3 @@
> +Changelog for python3-guessing-game: 0.1.0 -> 0.2.0
> +
> +40cf004 Sync with maturin tutorial source
> diff --git
> a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.chang=
elog
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.chang=
elog
> new file mode 100644
> index 0000000000..04d9be5103
> --- /dev/null
> +++
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.chang=
elog
> @@ -0,0 +1,24 @@
> +Changelog for devtool-upgrade-test1: 1.5.3 -> 1.6.0
> +
> +1.6.0 - 15 March 2015
> +  - fix lstat64 support when unavailable - separate patches supplied by
> +    Ganael Laplanche and Peter Korsgaard
> +  - (#1506) new option "-D" / "--delay-start" to only show bar after N
> +    seconds (Damon Harper)
> +  - new option "--fineta" / "-I" to show ETA as time of day rather than
> time
> +    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
> +  - (#1509) change ETA (--eta / -e) so that days are given if the hours
> +    remaining are 24 or more (Jacek Wielemborek)
> +  - (#1499) repeat read and write attempts on partial buffer fill/empty =
to
> +    work around post-signal transfer rate drop reported by Ralf Ramsauer
> +  - (#1507) do not try to calculate total size in line mode, due to bug
> +    reported by Jacek Wielemborek and Michiel Van Herwegen
> +  - cleanup: removed defunct RATS comments and unnecessary copyright
> notices
> +  - clean up displayed lines when using --watchfd PID, when PID exits
> +  - output errors on a new line to avoid overwriting transfer bar
> +
> +1.5.7 - 26 August 2014
> +  - show KiB instead of incorrect kiB (Debian bug #706175)
> +  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
> +  - work around "awk" bug in tests/016-numeric-timer in decimal ","
> locales
> +  - fix "make rpm" and "make srpm", extend "make release" to sign releas=
es
> diff --git
> a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.changel=
og
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.changel=
og
> new file mode 100644
> index 0000000000..b7f0019d56
> --- /dev/null
> +++
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.changel=
og
> @@ -0,0 +1,3 @@
> +Changelog for devtool-upgrade-test2: 0.1+git -> 0.1+git
> +
> +6cc6077 dbus-wait.c: Fix typo
> diff --git
> a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.chang=
elog
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.chang=
elog
> new file mode 100644
> index 0000000000..d9994fe063
> --- /dev/null
> +++
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.chang=
elog
> @@ -0,0 +1,24 @@
> +Changelog for devtool-upgrade-test3: 1.5.3 -> 1.6.0
> +
> +1.6.0 - 15 March 2015
> +  - fix lstat64 support when unavailable - separate patches supplied by
> +    Ganael Laplanche and Peter Korsgaard
> +  - (#1506) new option "-D" / "--delay-start" to only show bar after N
> +    seconds (Damon Harper)
> +  - new option "--fineta" / "-I" to show ETA as time of day rather than
> time
> +    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
> +  - (#1509) change ETA (--eta / -e) so that days are given if the hours
> +    remaining are 24 or more (Jacek Wielemborek)
> +  - (#1499) repeat read and write attempts on partial buffer fill/empty =
to
> +    work around post-signal transfer rate drop reported by Ralf Ramsauer
> +  - (#1507) do not try to calculate total size in line mode, due to bug
> +    reported by Jacek Wielemborek and Michiel Van Herwegen
> +  - cleanup: removed defunct RATS comments and unnecessary copyright
> notices
> +  - clean up displayed lines when using --watchfd PID, when PID exits
> +  - output errors on a new line to avoid overwriting transfer bar
> +
> +1.5.7 - 26 August 2014
> +  - show KiB instead of incorrect kiB (Debian bug #706175)
> +  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
> +  - work around "awk" bug in tests/016-numeric-timer in decimal ","
> locales
> +  - fix "make rpm" and "make srpm", extend "make release" to sign releas=
es
> diff --git
> a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.chang=
elog
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.chang=
elog
> new file mode 100644
> index 0000000000..3a37271eb7
> --- /dev/null
> +++
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.chang=
elog
> @@ -0,0 +1,24 @@
> +Changelog for devtool-upgrade-test4: 1.5.3 -> 1.6.0
> +
> +1.6.0 - 15 March 2015
> +  - fix lstat64 support when unavailable - separate patches supplied by
> +    Ganael Laplanche and Peter Korsgaard
> +  - (#1506) new option "-D" / "--delay-start" to only show bar after N
> +    seconds (Damon Harper)
> +  - new option "--fineta" / "-I" to show ETA as time of day rather than
> time
> +    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
> +  - (#1509) change ETA (--eta / -e) so that days are given if the hours
> +    remaining are 24 or more (Jacek Wielemborek)
> +  - (#1499) repeat read and write attempts on partial buffer fill/empty =
to
> +    work around post-signal transfer rate drop reported by Ralf Ramsauer
> +  - (#1507) do not try to calculate total size in line mode, due to bug
> +    reported by Jacek Wielemborek and Michiel Van Herwegen
> +  - cleanup: removed defunct RATS comments and unnecessary copyright
> notices
> +  - clean up displayed lines when using --watchfd PID, when PID exits
> +  - output errors on a new line to avoid overwriting transfer bar
> +
> +1.5.7 - 26 August 2014
> +  - show KiB instead of incorrect kiB (Debian bug #706175)
> +  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
> +  - work around "awk" bug in tests/016-numeric-timer in decimal ","
> locales
> +  - fix "make rpm" and "make srpm", extend "make release" to sign releas=
es
> diff --git
> a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.changel=
og
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.changel=
og
> new file mode 100644
> index 0000000000..7c5ecf3505
> --- /dev/null
> +++
> b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.changel=
og
> @@ -0,0 +1,3 @@
> +Changelog for devtool-upgrade-test5: 0.1+git -> 0.1+git
> +
> +0a60d6a Add dummy commit on tip for testing
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py
> b/meta/lib/oeqa/selftest/cases/devtool.py
> index 5ed69aee1b..5a6f38f8d5 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1944,6 +1944,22 @@ class DevtoolUpgradeTests(DevtoolBase):
>          except:
>              self.skip("Git user.name and user.email must be set")
>
> +    def _check_changelog(self, recipe, oldrecipefile):
> +        """Compare extracted changelog against reference data."""
> +        changelog_ref =3D oldrecipefile + '.changelog'
> +        self.assertExists(changelog_ref, 'Changelog reference file must
> exist for %s' % recipe)
> +        changelog_file =3D os.path.join(self.workspacedir, 'changelogs',
> '%s.txt' % recipe)
> +        with open(changelog_ref, 'r') as f:
> +            expected =3D f.read()
> +        if not expected:
> +            self.assertNotExists(changelog_file,
> +                'Changelog file should not exist when reference is empty=
')
> +        else:
> +            self.assertExists(changelog_file, 'Changelog file should
> exist after upgrade')
> +            with open(changelog_file, 'r') as f:
> +                actual =3D f.read()
> +            self.assertEqual(expected, actual)
> +
>      def test_devtool_upgrade(self):
>          # Check preconditions
>          self.assertTrue(not os.path.exists(self.workspacedir), 'This tes=
t
> cannot be run with a workspace directory under the build directory')
> @@ -1982,6 +1998,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>          # Check devtool reset recipe
>          result =3D runCmd('devtool reset %s -n' % recipe)
>          result =3D runCmd('devtool status')
> @@ -2016,11 +2034,14 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>          # Check devtool reset recipe
>          result =3D runCmd('devtool reset %s -n' % recipe)
>          result =3D runCmd('devtool status')
>          self.assertNotIn(recipe, result.output)
>          self.assertNotExists(os.path.join(self.workspacedir, 'recipes',
> recipe), 'Recipe directory should not exist after resetting')
> +        self.assertNotExists(os.path.join(self.workspacedir,
> 'changelogs', '%s.txt' % recipe), 'Changelog file should be removed after
> reset')
>
>      def test_devtool_upgrade_git(self):
>          self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test2'=
,
> '6cc6077a36fe2648a5f993fe7c16c9632f946517')
> @@ -2051,6 +2072,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>
>      def test_devtool_upgrade_all_checksums(self):
>          # Check preconditions
> @@ -2075,6 +2098,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>
>      def test_devtool_upgrade_recipe_upgrade_extra_tasks(self):
>          # Check preconditions
> @@ -2116,6 +2141,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newcratesincfile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>          # Check devtool reset recipe
>          result =3D runCmd('devtool reset %s -n' % recipe)
>          result =3D runCmd('devtool status')
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 42fb13872d..2a3a62d081 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -2046,6 +2046,14 @@ def _reset(recipes, no_clean, remove_work, config,
> basepath, workspace):
>
>          clean_preferred_provider(pn, config.workspace_path)
>
> +        # Clean up changelog if present
> +        changelog_file =3D os.path.join(config.workspace_path,
> 'changelogs', '%s.txt' % pn)
> +        if os.path.exists(changelog_file):
> +            os.remove(changelog_file)
> +            changelog_dir =3D os.path.dirname(changelog_file)
> +            if not os.listdir(changelog_dir):
> +                os.rmdir(changelog_dir)
> +
>  def reset(args, config, basepath, workspace):
>      """Entry point for the devtool 'reset' subcommand"""
>
> diff --git a/scripts/lib/devtool/upgrade.py
> b/scripts/lib/devtool/upgrade.py
> index 8930fde5d6..e37ad07ea1 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -9,6 +9,7 @@
>  import os
>  import sys
>  import re
> +import shlex
>  import shutil
>  import tempfile
>  import logging
> @@ -26,6 +27,31 @@ from devtool import exec_build_env_command,
> setup_tinfoil, DevtoolError, parse_r
>
>  logger =3D logging.getLogger('devtool')
>
> +# Common changelog filenames found in upstream source trees (matched
> case-insensitively):
> +# changelog - util-linux, coreutils, dbus, acpid, hdparm
> +# changelog.md - libslirp, ttyrun, python3-maturin, libjpeg-turbo
> +# changelog.rst - python3-pluggy, python3-packaging
> +# changes - openssl, python3-babel, icu, tcl
> +# changes.md - openssl
> +# changes.rst - python3-babel, python3-pathspec
> +# changes.txt - python3-lxml, icu
> +# news - systemd, glib-2.0, libxml2, dbus
> +# news.md - libxml2
> +# news.rst - python3-sphinx
> +# news.adoc - ccache
> +# history.md - python3-requests, python3-hatch-vcs
> +# history.rst - python3-idna, python3-docutils
> +# releases.md - rust, cargo (includes CVEs)
> +# whatsnew.txt - libsdl2
> +_CHANGELOG_BASENAMES =3D {
> +    'changelog', 'changelog.md', 'changelog.rst', 'changelog.txt',
> +    'changes', 'changes.md', 'changes.rst', 'changes.txt',
> +    'news', 'news.md', 'news.rst', 'news.adoc',
> +    'history', 'history.md', 'history.rst',
> +    'releases.md',
> +    'whatsnew.txt',
> +}
> +
>  def _run(cmd, cwd=3D''):
>      logger.debug("Running command %s> %s" % (cwd,cmd))
>      return bb.process.run('%s' % cmd, cwd=3Dcwd)
> @@ -529,6 +555,63 @@ def _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil)=
:
>          if not res:
>              raise DevtoolError('Running extra recipe upgrade task %s for
> %s failed' % (task, pn))
>
> +def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag,
> workspace_path, is_git_source):
> +    """Extract changelog between old and new version using devtool git
> tags."""
> +    changelog_content =3D None
> +
> +    # Try to find a changelog file that changed between versions
> +    try:
> +        stdout, _ =3D _run('git diff --name-only %s %s' % (old_tag,
> new_tag), srctree)
> +        for fname in stdout.splitlines():
> +            fname =3D fname.strip()  # strip whitespace/CR from git outp=
ut
> +            if not fname:
> +                continue
> +            basename =3D os.path.basename(fname).lower()
> +            if basename in _CHANGELOG_BASENAMES:
> +                diff_out, _ =3D _run('git diff %s %s -- %s' % (old_tag,
> new_tag, shlex.quote(fname)), srctree)
> +                if diff_out.strip():
> +                    # Extract only the added lines from the diff
> +                    lines =3D [line[1:] for line in diff_out.splitlines(=
)
> +                             if line.startswith('+') and not
> line.startswith('+++')]
> +                    if lines:
> +                        changelog_content =3D '\n'.join(lines)
> +                        break
> +            # Per-version release notes (e.g., git RelNotes/2.53.0.adoc,
> mesa relnotes/26.0.3.rst)
> +            elif re.search(r'(\d+[.\-])+\d+\.(txt|md|rst|adoc)$',
> basename):
> +                file_content, _ =3D _run('git show %s' %
> shlex.quote('%s:%s' % (new_tag, fname)), srctree)
> +                if file_content.strip():
> +                    changelog_content =3D file_content.strip()
> +                    break
> +    except bb.process.ExecutionError as e:
> +        logger.warning('Changelog file extraction failed: %s' % str(e))
> +
> +    # For git sources, fall back to git log if no changelog file was fou=
nd
> +    if not changelog_content and is_git_source:
> +        try:
> +            stdout, _ =3D _run('git log --oneline %s..%s' % (old_tag,
> new_tag), srctree)
> +            if stdout.strip():
> +                changelog_content =3D stdout.strip()
> +        except bb.process.ExecutionError as e:
> +            logger.warning('Changelog git log extraction failed: %s' %
> str(e))
> +
> +    if not changelog_content:
> +        return None
> +
> +    # Clean up content for readability and commit message use
> +    changelog_content =3D re.sub(r'\n{3,}', '\n\n',
> changelog_content).strip()
> +    if not changelog_content:
> +        return None
> +
> +    changelog_dir =3D os.path.join(workspace_path, 'changelogs')
> +    bb.utils.mkdirhier(changelog_dir)
> +    changelog_path =3D os.path.join(changelog_dir, '%s.txt' % pn)
> +    with open(changelog_path, 'w') as f:
> +        f.write('Changelog for %s: %s -> %s\n\n' % (pn, old_ver, new_ver=
))
> +        f.write(changelog_content)
> +        f.write('\n')
> +
> +    return changelog_path
> +
>  def upgrade(args, config, basepath, workspace):
>      """Entry point for the devtool 'upgrade' subcommand"""
>
> @@ -610,6 +693,18 @@ def upgrade(args, config, basepath, workspace):
>
>          logger.info('Upgraded source extracted to %s' % srctree)
>          logger.info('New recipe is %s' % rf)
> +
> +        # Extract changelog between versions using the tags created by
> +        # _extract_new_source(): devtool-base-new for git,
> devtool-base-<pv> for tarballs
> +        is_git =3D old_srcrev is not None
> +        newpv =3D args.version or rd.getVar('PV')
> +        new_tag =3D 'devtool-base-new' if is_git else 'devtool-base-%s' =
%
> newpv
> +        changelog_file =3D _extract_changelog(srctree, pn, old_ver, newp=
v,
> +                                            'devtool-base', new_tag,
> +                                            config.workspace_path, is_gi=
t)
> +        if changelog_file:
> +            logger.info('Changelog extracted to %s' % changelog_file)
> +
>          if license_diff:
>              logger.info('License checksums have been updated in the new
> recipe; please refer to it for the difference between the old and the new
> license texts.')
>          preferred_version =3D rd.getVar('PREFERRED_VERSION_%s' %
> rd.getVar('PN'))
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236986):
> https://lists.openembedded.org/g/openembedded-core/message/236986
> Mute This Topic: https://lists.openembedded.org/mt/119297341/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007139cd0651cca2fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I tested this with python3-cryptography, =
python3-maturin and vim</div><div dir=3D"ltr">(output attached). In all thr=
ee cases the=C2=A0resulting &lt;recipe&gt;.txt file</div><div dir=3D"ltr">l=
ooked like what I expected. It is interesting that the &quot;changes&quot;<=
/div><div dir=3D"ltr">output can succeed and provide information when the r=
ecipe</div><div dir=3D"ltr">upgrade itself fails (python3-cryptography and =
vim fall into that</div><div dir=3D"ltr">category).</div><div dir=3D"ltr"><=
div><br></div><div>I&#39;ll warn that automatically including the results i=
n AUH upgrade</div><div>runs the risk of creating some fairly large &quot;w=
all of text&quot; commit logs.</div><div>I personally prefer more informati=
on rather than no information, so</div><div>I like this approach. Not every=
one agrees with me.</div><div><br></div><div><div>One other idea would be t=
o include the GitHub &quot;compare&quot; type URLs</div><div>when those are=
 available [1][2][3].</div><div><br></div><div>Another idea might be includ=
ing a link to the detected &quot;changes&quot; file,</div></div><div>or fil=
es depending on the recipe&#39;s upstream pattern.</div><div><br></div><div=
>I have a similar approach in progress forked from &#39;changelogs&#39;, bu=
t</div><div>it is limited by the tool to pypi, npm, rubygems [4] and also r=
equires</div><div>too much manual fixing to detect the &quot;changes&quot; =
file.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, May 13, 2026 at 6:56=E2=80=AFAM Da=
niel Turull via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@lists.openembe=
dded.org">ericsson.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">From: Daniel Turull &lt;<a hre=
f=3D"mailto:daniel.turull@ericsson.com" target=3D"_blank">daniel.turull@eri=
csson.com</a>&gt;<br>
<br>
Automatically extract changelog information when upgrading a recipe.<br>
Uses the devtool-base tags created during upgrade to diff known<br>
changelog files (NEWS, ChangeLog, CHANGES, etc.) between the old and<br>
new versions. For git-based sources, falls back to git log --oneline<br>
if no changelog file changed.<br>
<br>
Also match per-version release notes files like git&#39;s<br>
Documentation/RelNotes/<a href=3D"http://2.53.0." target=3D"_blank">2.53.0.=
</a>adoc or mesa&#39;s docs/relnotes/26.0.3.rst.<br>
<br>
These are detected by matching filenames that contain a version<br>
number with a documentation extension (.txt, .md, .rst, .adoc).<br>
Their full content is read via git show since they are new files<br>
rather than modifications to an existing changelog.<br>
<br>
Collapse runs of multiple blank lines into a single blank line and<br>
strip leading/trailing whitespace from the extracted changelog. This<br>
produces cleaner output that is suitable for inclusion in commit<br>
messages by tools like AUH.<br>
<br>
Output is written to workspace/changelogs/&lt;pn&gt;.txt and cleaned up on<=
br>
devtool reset. This allows AUH and other tools to pick up the changelog<br>
without implementing their own extraction logic.<br>
<br>
Add test cases for existings test recipes<br></blockquote><div>nit pick: ty=
po s/existings/existing/</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Assisted-by: kiro:claude-opus-4.6<br></blockquote><div>Our current standard=
 is &quot;AI-generated: &lt;description of tool and LLM model&gt;&quot; [5]=
</div><div>=C2=A0</div><div><br></div><div><div>[1]=C2=A0<a href=3D"https:/=
/github.com/pyca/cryptography/compare/46.0.7...48.0.0">https://github.com/p=
yca/cryptography/compare/46.0.7...48.0.0</a></div><div>[2]=C2=A0<a href=3D"=
https://github.com/PyO3/maturin/compare/v1.13.1...v1.13.3">https://github.c=
om/PyO3/maturin/compare/v1.13.1...v1.13.3</a></div><div>[3]=C2=A0<a href=3D=
"https://github.com/vim/vim/compare/v9.2.0341...v9.2.0481">https://github.c=
om/vim/vim/compare/v9.2.0341...v9.2.0481</a></div><div>[4]=C2=A0<a href=3D"=
https://github.com/moto-timo/changelogs/tree/dev-pyproject.toml">https://gi=
thub.com/moto-timo/changelogs/tree/dev-pyproject.toml</a></div><div>[5]=C2=
=A0<a href=3D"https://docs.yoctoproject.org/dev/singleindex.html#acceptance=
-of-ai-generated-code">https://docs.yoctoproject.org/dev/singleindex.html#a=
cceptance-of-ai-generated-code</a></div></div><div><br></div><div>Tested-by=
: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@kons=
ulko.com</a>&gt;</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
<br>
---<br>
<br>
v2:<br>
- squash v1 patches into one commit and keep commit messages<br>
- Integrate test cases with exiting devtool selftests<br>
<br>
v3:<br>
- do not silently skip the test if changelog is missing<br>
---<br>
=C2=A0.../python3-guessing-game_git.bb.changelog=C2=A0 =C2=A0 |=C2=A0 3 +<b=
r>
=C2=A0.../devtool-upgrade-test1_1.5.3.bb.changelog=C2=A0 | 24 +++++<br>
=C2=A0.../devtool-upgrade-test2_git.bb.changelog=C2=A0 =C2=A0 |=C2=A0 3 +<b=
r>
=C2=A0.../devtool-upgrade-test3_1.5.3.bb.changelog=C2=A0 | 24 +++++<br>
=C2=A0.../devtool-upgrade-test4_1.5.3.bb.changelog=C2=A0 | 24 +++++<br>
=C2=A0.../devtool-upgrade-test5_git.bb.changelog=C2=A0 =C2=A0 |=C2=A0 3 +<b=
r>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
7 ++++++<br>
=C2=A0scripts/lib/devtool/standard.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 8 ++<br>
=C2=A0scripts/lib/devtool/upgrade.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 95 +++++++++++++++++++<br>
=C2=A09 files changed, 211 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/recipes-devtools/python/python3-gues=
sing-game_git.bb.changelog<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade=
-test1_1.5.3.bb.changelog<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade=
-test2_git.bb.changelog<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade=
-test3_1.5.3.bb.changelog<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade=
-test4_1.5.3.bb.changelog<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade=
-test5_git.bb.changelog<br>
<br>
diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_gi=
t.bb.changelog b/meta-selftest/recipes-devtools/python/python3-guessing-gam=
e_git.bb.changelog<br>
new file mode 100644<br>
index 0000000000..571220b2a4<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.ch=
angelog<br>
@@ -0,0 +1,3 @@<br>
+Changelog for python3-guessing-game: 0.1.0 -&gt; 0.2.0<br>
+<br>
+40cf004 Sync with maturin tutorial source<br>
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.=
5.3.bb.changelog<br>
new file mode 100644<br>
index 0000000000..04d9be5103<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.cha=
ngelog<br>
@@ -0,0 +1,24 @@<br>
+Changelog for devtool-upgrade-test1: 1.5.3 -&gt; 1.6.0<br>
+<br>
+1.6.0 - 15 March 2015<br>
+=C2=A0 - fix lstat64 support when unavailable - separate patches supplied =
by<br>
+=C2=A0 =C2=A0 Ganael Laplanche and Peter Korsgaard<br>
+=C2=A0 - (#1506) new option &quot;-D&quot; / &quot;--delay-start&quot; to =
only show bar after N<br>
+=C2=A0 =C2=A0 seconds (Damon Harper)<br>
+=C2=A0 - new option &quot;--fineta&quot; / &quot;-I&quot; to show ETA as t=
ime of day rather than time<br>
+=C2=A0 =C2=A0 remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)=
<br>
+=C2=A0 - (#1509) change ETA (--eta / -e) so that days are given if the hou=
rs<br>
+=C2=A0 =C2=A0 remaining are 24 or more (Jacek Wielemborek)<br>
+=C2=A0 - (#1499) repeat read and write attempts on partial buffer fill/emp=
ty to<br>
+=C2=A0 =C2=A0 work around post-signal transfer rate drop reported by Ralf =
Ramsauer<br>
+=C2=A0 - (#1507) do not try to calculate total size in line mode, due to b=
ug<br>
+=C2=A0 =C2=A0 reported by Jacek Wielemborek and Michiel Van Herwegen<br>
+=C2=A0 - cleanup: removed defunct RATS comments and unnecessary copyright =
notices<br>
+=C2=A0 - clean up displayed lines when using --watchfd PID, when PID exits=
<br>
+=C2=A0 - output errors on a new line to avoid overwriting transfer bar<br>
+<br>
+1.5.7 - 26 August 2014<br>
+=C2=A0 - show KiB instead of incorrect kiB (Debian bug #706175)<br>
+=C2=A0 - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn=
)<br>
+=C2=A0 - work around &quot;awk&quot; bug in tests/016-numeric-timer in dec=
imal &quot;,&quot; locales<br>
+=C2=A0 - fix &quot;make rpm&quot; and &quot;make srpm&quot;, extend &quot;=
make release&quot; to sign releases<br>
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.=
bb.changelog<br>
new file mode 100644<br>
index 0000000000..b7f0019d56<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.chang=
elog<br>
@@ -0,0 +1,3 @@<br>
+Changelog for devtool-upgrade-test2: 0.1+git -&gt; 0.1+git<br>
+<br>
+6cc6077 dbus-wait.c: Fix typo<br>
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.=
5.3.bb.changelog<br>
new file mode 100644<br>
index 0000000000..d9994fe063<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.cha=
ngelog<br>
@@ -0,0 +1,24 @@<br>
+Changelog for devtool-upgrade-test3: 1.5.3 -&gt; 1.6.0<br>
+<br>
+1.6.0 - 15 March 2015<br>
+=C2=A0 - fix lstat64 support when unavailable - separate patches supplied =
by<br>
+=C2=A0 =C2=A0 Ganael Laplanche and Peter Korsgaard<br>
+=C2=A0 - (#1506) new option &quot;-D&quot; / &quot;--delay-start&quot; to =
only show bar after N<br>
+=C2=A0 =C2=A0 seconds (Damon Harper)<br>
+=C2=A0 - new option &quot;--fineta&quot; / &quot;-I&quot; to show ETA as t=
ime of day rather than time<br>
+=C2=A0 =C2=A0 remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)=
<br>
+=C2=A0 - (#1509) change ETA (--eta / -e) so that days are given if the hou=
rs<br>
+=C2=A0 =C2=A0 remaining are 24 or more (Jacek Wielemborek)<br>
+=C2=A0 - (#1499) repeat read and write attempts on partial buffer fill/emp=
ty to<br>
+=C2=A0 =C2=A0 work around post-signal transfer rate drop reported by Ralf =
Ramsauer<br>
+=C2=A0 - (#1507) do not try to calculate total size in line mode, due to b=
ug<br>
+=C2=A0 =C2=A0 reported by Jacek Wielemborek and Michiel Van Herwegen<br>
+=C2=A0 - cleanup: removed defunct RATS comments and unnecessary copyright =
notices<br>
+=C2=A0 - clean up displayed lines when using --watchfd PID, when PID exits=
<br>
+=C2=A0 - output errors on a new line to avoid overwriting transfer bar<br>
+<br>
+1.5.7 - 26 August 2014<br>
+=C2=A0 - show KiB instead of incorrect kiB (Debian bug #706175)<br>
+=C2=A0 - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn=
)<br>
+=C2=A0 - work around &quot;awk&quot; bug in tests/016-numeric-timer in dec=
imal &quot;,&quot; locales<br>
+=C2=A0 - fix &quot;make rpm&quot; and &quot;make srpm&quot;, extend &quot;=
make release&quot; to sign releases<br>
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.=
5.3.bb.changelog<br>
new file mode 100644<br>
index 0000000000..3a37271eb7<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.cha=
ngelog<br>
@@ -0,0 +1,24 @@<br>
+Changelog for devtool-upgrade-test4: 1.5.3 -&gt; 1.6.0<br>
+<br>
+1.6.0 - 15 March 2015<br>
+=C2=A0 - fix lstat64 support when unavailable - separate patches supplied =
by<br>
+=C2=A0 =C2=A0 Ganael Laplanche and Peter Korsgaard<br>
+=C2=A0 - (#1506) new option &quot;-D&quot; / &quot;--delay-start&quot; to =
only show bar after N<br>
+=C2=A0 =C2=A0 seconds (Damon Harper)<br>
+=C2=A0 - new option &quot;--fineta&quot; / &quot;-I&quot; to show ETA as t=
ime of day rather than time<br>
+=C2=A0 =C2=A0 remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)=
<br>
+=C2=A0 - (#1509) change ETA (--eta / -e) so that days are given if the hou=
rs<br>
+=C2=A0 =C2=A0 remaining are 24 or more (Jacek Wielemborek)<br>
+=C2=A0 - (#1499) repeat read and write attempts on partial buffer fill/emp=
ty to<br>
+=C2=A0 =C2=A0 work around post-signal transfer rate drop reported by Ralf =
Ramsauer<br>
+=C2=A0 - (#1507) do not try to calculate total size in line mode, due to b=
ug<br>
+=C2=A0 =C2=A0 reported by Jacek Wielemborek and Michiel Van Herwegen<br>
+=C2=A0 - cleanup: removed defunct RATS comments and unnecessary copyright =
notices<br>
+=C2=A0 - clean up displayed lines when using --watchfd PID, when PID exits=
<br>
+=C2=A0 - output errors on a new line to avoid overwriting transfer bar<br>
+<br>
+1.5.7 - 26 August 2014<br>
+=C2=A0 - show KiB instead of incorrect kiB (Debian bug #706175)<br>
+=C2=A0 - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn=
)<br>
+=C2=A0 - work around &quot;awk&quot; bug in tests/016-numeric-timer in dec=
imal &quot;,&quot; locales<br>
+=C2=A0 - fix &quot;make rpm&quot; and &quot;make srpm&quot;, extend &quot;=
make release&quot; to sign releases<br>
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.b=
b.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.=
bb.changelog<br>
new file mode 100644<br>
index 0000000000..7c5ecf3505<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.chang=
elog<br>
@@ -0,0 +1,3 @@<br>
+Changelog for devtool-upgrade-test5: 0.1+git -&gt; 0.1+git<br>
+<br>
+0a60d6a Add dummy commit on tip for testing<br>
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py<br>
index 5ed69aee1b..5a6f38f8d5 100644<br>
--- a/meta/lib/oeqa/selftest/cases/devtool.py<br>
+++ b/meta/lib/oeqa/selftest/cases/devtool.py<br>
@@ -1944,6 +1944,22 @@ class DevtoolUpgradeTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.skip(&quot;Git <a href=
=3D"http://user.name" rel=3D"noreferrer" target=3D"_blank">user.name</a> an=
d user.email must be set&quot;)<br>
<br>
+=C2=A0 =C2=A0 def _check_changelog(self, recipe, oldrecipefile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Compare extracted changelog =
against reference data.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 changelog_ref =3D oldrecipefile + &#39;.change=
log&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertExists(changelog_ref, &#39;Changelo=
g reference file must exist for %s&#39; % recipe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 changelog_file =3D os.path.join(self.workspace=
dir, &#39;changelogs&#39;, &#39;%s.txt&#39; % recipe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(changelog_ref, &#39;r&#39;) as f:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected =3D f.read()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not expected:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertNotExists(changelog_f=
ile,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Changelog fil=
e should not exist when reference is empty&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertExists(changelog_file=
, &#39;Changelog file should exist after upgrade&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(changelog_file, &#39;r=
&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actual =3D f.read(=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(expected, actua=
l)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def test_devtool_upgrade(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check preconditions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(not os.path.exists(self.w=
orkspacedir), &#39;This test cannot be run with a workspace directory under=
 the build directory&#39;)<br>
@@ -1982,6 +1998,8 @@ class DevtoolUpgradeTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(newrecipefile, &#39;r&#39;) as =
f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newlines =3D f.readlines()<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(desiredlines, newlines)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check changelog<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._check_changelog(recipe, oldrecipefile)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check devtool reset recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;devtool reset %s -=
n&#39; % recipe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;devtool status&#39=
;)<br>
@@ -2016,11 +2034,14 @@ class DevtoolUpgradeTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(newrecipefile, &#39;r&#39;) as =
f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newlines =3D f.readlines()<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(desiredlines, newlines)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check changelog<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._check_changelog(recipe, oldrecipefile)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check devtool reset recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;devtool reset %s -=
n&#39; % recipe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;devtool status&#39=
;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertNotIn(recipe, result.output)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertNotExists(os.path.join(self.wo=
rkspacedir, &#39;recipes&#39;, recipe), &#39;Recipe directory should not ex=
ist after resetting&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertNotExists(os.path.join(self.workspa=
cedir, &#39;changelogs&#39;, &#39;%s.txt&#39; % recipe), &#39;Changelog fil=
e should be removed after reset&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_devtool_upgrade_git(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._test_devtool_upgrade_git_by_recipe(=
&#39;devtool-upgrade-test2&#39;, &#39;6cc6077a36fe2648a5f993fe7c16c9632f946=
517&#39;)<br>
@@ -2051,6 +2072,8 @@ class DevtoolUpgradeTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(newrecipefile, &#39;r&#39;) as =
f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newlines =3D f.readlines()<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(desiredlines, newlines)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check changelog<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._check_changelog(recipe, oldrecipefile)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0def test_devtool_upgrade_all_checksums(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check preconditions<br>
@@ -2075,6 +2098,8 @@ class DevtoolUpgradeTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(newrecipefile, &#39;r&#39;) as =
f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newlines =3D f.readlines()<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(desiredlines, newlines)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check changelog<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._check_changelog(recipe, oldrecipefile)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0def test_devtool_upgrade_recipe_upgrade_extra_tasks(sel=
f):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check preconditions<br>
@@ -2116,6 +2141,8 @@ class DevtoolUpgradeTests(DevtoolBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(newcratesincfile, &#39;r&#39;) =
as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newlines =3D f.readlines()<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(desiredlines, newlines)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check changelog<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._check_changelog(recipe, oldrecipefile)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check devtool reset recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;devtool reset %s -=
n&#39; % recipe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;devtool status&#39=
;)<br>
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py<br>
index 42fb13872d..2a3a62d081 100644<br>
--- a/scripts/lib/devtool/standard.py<br>
+++ b/scripts/lib/devtool/standard.py<br>
@@ -2046,6 +2046,14 @@ def _reset(recipes, no_clean, remove_work, config, b=
asepath, workspace):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clean_preferred_provider(pn, config.works=
pace_path)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Clean up changelog if present<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 changelog_file =3D os.path.join(config.workspa=
ce_path, &#39;changelogs&#39;, &#39;%s.txt&#39; % pn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(changelog_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(changelog_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 changelog_dir =3D os.path.dirnam=
e(changelog_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.listdir(changelog_dir)=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rmdir(changelog=
_dir)<br>
+<br>
=C2=A0def reset(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Entry point for the devtool &#39;rese=
t&#39; subcommand&quot;&quot;&quot;<br>
<br>
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y<br>
index 8930fde5d6..e37ad07ea1 100644<br>
--- a/scripts/lib/devtool/upgrade.py<br>
+++ b/scripts/lib/devtool/upgrade.py<br>
@@ -9,6 +9,7 @@<br>
=C2=A0import os<br>
=C2=A0import sys<br>
=C2=A0import re<br>
+import shlex<br>
=C2=A0import shutil<br>
=C2=A0import tempfile<br>
=C2=A0import logging<br>
@@ -26,6 +27,31 @@ from devtool import exec_build_env_command, setup_tinfoi=
l, DevtoolError, parse_r<br>
<br>
=C2=A0logger =3D logging.getLogger(&#39;devtool&#39;)<br>
<br>
+# Common changelog filenames found in upstream source trees (matched case-=
insensitively):<br>
+# changelog - util-linux, coreutils, dbus, acpid, hdparm<br>
+# changelog.md - libslirp, ttyrun, python3-maturin, libjpeg-turbo<br>
+# changelog.rst - python3-pluggy, python3-packaging<br>
+# changes - openssl, python3-babel, icu, tcl<br>
+# changes.md - openssl<br>
+# changes.rst - python3-babel, python3-pathspec<br>
+# changes.txt - python3-lxml, icu<br>
+# news - systemd, glib-2.0, libxml2, dbus<br>
+# news.md - libxml2<br>
+# news.rst - python3-sphinx<br>
+# news.adoc - ccache<br>
+# history.md - python3-requests, python3-hatch-vcs<br>
+# history.rst - python3-idna, python3-docutils<br>
+# releases.md - rust, cargo (includes CVEs)<br>
+# whatsnew.txt - libsdl2<br>
+_CHANGELOG_BASENAMES =3D {<br>
+=C2=A0 =C2=A0 &#39;changelog&#39;, &#39;changelog.md&#39;, &#39;changelog.=
rst&#39;, &#39;changelog.txt&#39;,<br>
+=C2=A0 =C2=A0 &#39;changes&#39;, &#39;changes.md&#39;, &#39;changes.rst&#3=
9;, &#39;changes.txt&#39;,<br>
+=C2=A0 =C2=A0 &#39;news&#39;, &#39;news.md&#39;, &#39;news.rst&#39;, &#39;=
news.adoc&#39;,<br>
+=C2=A0 =C2=A0 &#39;history&#39;, &#39;history.md&#39;, &#39;history.rst&#3=
9;,<br>
+=C2=A0 =C2=A0 &#39;releases.md&#39;,<br>
+=C2=A0 =C2=A0 &#39;whatsnew.txt&#39;,<br>
+}<br>
+<br>
=C2=A0def _run(cmd, cwd=3D&#39;&#39;):<br>
=C2=A0 =C2=A0 =C2=A0logger.debug(&quot;Running command %s&gt; %s&quot; % (c=
wd,cmd))<br>
=C2=A0 =C2=A0 =C2=A0return bb.process.run(&#39;%s&#39; % cmd, cwd=3Dcwd)<br=
>
@@ -529,6 +555,63 @@ def _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil):<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not res:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DevtoolError(&#39;Run=
ning extra recipe upgrade task %s for %s failed&#39; % (task, pn))<br>
<br>
+def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, wo=
rkspace_path, is_git_source):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Extract changelog between old and new vers=
ion using devtool git tags.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 changelog_content =3D None<br>
+<br>
+=C2=A0 =C2=A0 # Try to find a changelog file that changed between versions=
<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout, _ =3D _run(&#39;git diff --name-only %=
s %s&#39; % (old_tag, new_tag), srctree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for fname in stdout.splitlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D fname.strip()=C2=A0 # =
strip whitespace/CR from git output<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not fname:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basename =3D os.path.basename(fn=
ame).lower()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if basename in _CHANGELOG_BASENA=
MES:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diff_out, _ =3D _r=
un(&#39;git diff %s %s -- %s&#39; % (old_tag, new_tag, shlex.quote(fname)),=
 srctree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if diff_out.strip(=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ex=
tract only the added lines from the diff<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line=
s =3D [line[1:] for line in diff_out.splitlines()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if line.startswith(&#39;+&#39;) and not line=
.startswith(&#39;+++&#39;)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if l=
ines:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 changelog_content =3D &#39;\n&#39;.join(lines)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Per-version release notes (e.g=
., git RelNotes/2.53.0.adoc, mesa relnotes/26.0.3.rst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif re.search(r&#39;(\d+[.\-])+=
\d+\.(txt|md|rst|adoc)$&#39;, basename):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file_content, _ =
=3D _run(&#39;git show %s&#39; % shlex.quote(&#39;%s:%s&#39; % (new_tag, fn=
ame)), srctree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if file_content.st=
rip():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chan=
gelog_content =3D file_content.strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
+=C2=A0 =C2=A0 except bb.process.ExecutionError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&#39;Changelog file extraction =
failed: %s&#39; % str(e))<br>
+<br>
+=C2=A0 =C2=A0 # For git sources, fall back to git log if no changelog file=
 was found<br>
+=C2=A0 =C2=A0 if not changelog_content and is_git_source:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout, _ =3D _run(&#39;git log =
--oneline %s..%s&#39; % (old_tag, new_tag), srctree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if stdout.strip():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 changelog_content =
=3D stdout.strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except bb.process.ExecutionError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&#39;Changelog gi=
t log extraction failed: %s&#39; % str(e))<br>
+<br>
+=C2=A0 =C2=A0 if not changelog_content:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 # Clean up content for readability and commit message use<br=
>
+=C2=A0 =C2=A0 changelog_content =3D re.sub(r&#39;\n{3,}&#39;, &#39;\n\n&#3=
9;, changelog_content).strip()<br>
+=C2=A0 =C2=A0 if not changelog_content:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 changelog_dir =3D os.path.join(workspace_path, &#39;changelo=
gs&#39;)<br>
+=C2=A0 =C2=A0 bb.utils.mkdirhier(changelog_dir)<br>
+=C2=A0 =C2=A0 changelog_path =3D os.path.join(changelog_dir, &#39;%s.txt&#=
39; % pn)<br>
+=C2=A0 =C2=A0 with open(changelog_path, &#39;w&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;Changelog for %s: %s -&gt; %s\n\n=
&#39; % (pn, old_ver, new_ver))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(changelog_content)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;\n&#39;)<br>
+<br>
+=C2=A0 =C2=A0 return changelog_path<br>
+<br>
=C2=A0def upgrade(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Entry point for the devtool &#39;upgr=
ade&#39; subcommand&quot;&quot;&quot;<br>
<br>
@@ -610,6 +693,18 @@ def upgrade(args, config, basepath, workspace):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info" rel=3D"nor=
eferrer" target=3D"_blank">logger.info</a>(&#39;Upgraded source extracted t=
o %s&#39; % srctree)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.info" rel=3D"nor=
eferrer" target=3D"_blank">logger.info</a>(&#39;New recipe is %s&#39; % rf)=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Extract changelog between versions using the=
 tags created by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # _extract_new_source(): devtool-base-new for =
git, devtool-base-&lt;pv&gt; for tarballs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_git =3D old_srcrev is not None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newpv =3D args.version or rd.getVar(&#39;PV&#3=
9;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_tag =3D &#39;devtool-base-new&#39; if is_g=
it else &#39;devtool-base-%s&#39; % newpv<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 changelog_file =3D _extract_changelog(srctree,=
 pn, old_ver, newpv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;devtool-base&#39;, new_tag,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 config.workspace_path, is_git)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if changelog_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Changelog extracte=
d to %s&#39; % changelog_file)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if license_diff:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;License check=
sums have been updated in the new recipe; please refer to it for the differ=
ence between the old and the new license texts.&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preferred_version =3D rd.getVar(&#39;PREF=
ERRED_VERSION_%s&#39; % rd.getVar(&#39;PN&#39;))<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236986): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236986" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236986</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119297341/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/119297341/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007139cd0651cca2fa--

--0000000000007139cf0651cca2fc
Content-Type: text/plain; charset="US-ASCII"; name="python3-cryptography.txt"
Content-Disposition: attachment; filename="python3-cryptography.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mp5wh5ot0>
X-Attachment-Id: f_mp5wh5ot0

Q2hhbmdlbG9nIGZvciBweXRob24zLWNyeXB0b2dyYXBoeTogNDYuMC43IC0+IDQ4LjAuMAoKLi4g
X3Y0OC0wLTA6CjQ4LjAuMCAtIDIwMjYtMDUtMDQKfn5+fn5+fn5+fn5+fn5+fn5+fgoKKiAqKkJB
Q0tXQVJEUyBJTkNPTVBBVElCTEU6KiogU3VwcG9ydCBmb3IgUHl0aG9uIDMuOCBoYXMgYmVlbiBy
ZW1vdmVkLgogIGBgY3J5cHRvZ3JhcGh5YGAgbm93IHJlcXVpcmVzIFB5dGhvbiAzLjkgb3IgbGF0
ZXIuCiogKipCQUNLV0FSRFMgSU5DT01QQVRJQkxFOioqIExvYWRpbmcgYW4gWC41MDkgQ1JMIHdo
b3NlIGlubmVyCiAgYGBUQlNDZXJ0TGlzdC5zaWduYXR1cmVgYCBhbGdvcml0aG0gZG9lcyBub3Qg
bWF0Y2ggdGhlIG91dGVyCiAgYGBzaWduYXR1cmVBbGdvcml0aG1gYCBub3cgcmFpc2VzIGBgVmFs
dWVFcnJvcmBgLiBQcmV2aW91c2x5LCBzdWNoIENSTHMKICB3ZXJlIHBhcnNlZCBzdWNjZXNzZnVs
bHkgYW5kIG9ubHkgcmVqZWN0ZWQgZHVyaW5nIHNpZ25hdHVyZSB2YWxpZGF0aW9uLgoqIEFkZGVk
IHN1cHBvcnQgZm9yIDpkb2M6YC9oYXptYXQvcHJpbWl0aXZlcy9hc3ltbWV0cmljL21sa2VtYCBh
bmQKICA6ZG9jOmAvaGF6bWF0L3ByaW1pdGl2ZXMvYXN5bW1ldHJpYy9tbGRzYWAgd2hlbiB1c2lu
ZyBPcGVuU1NMIDMuNS4wIG9yCiAgbGF0ZXIsIGluIGFkZGl0aW9uIHRvIHRoZSBleGlzdGluZyBB
V1MtTEMgYW5kIEJvcmluZ1NTTCBzdXBwb3J0LiBUaGlzIG1lYW5zCiAgcG9zdC1xdWFudHVtIGFs
Z29yaXRobXMgYXJlIG5vdyBhdmFpbGFibGUgdG8gdXNlcnMgb2Ygb3VyIHdoZWVscy4KCiAgKiAq
Kk5vdGU6KiogR29pbmcgZm9yd2FyZCwgd2UgZG8gbm90IGd1YXJhbnRlZSB0aGF0IGFsbCBmdW5j
dGlvbmFsaXR5CiAgICBpbiBgYGNyeXB0b2dyYXBoeWBgIHdpbGwgYmUgYXZhaWxhYmxlIHdoZW4g
YnVpbGRpbmcgYWdhaW5zdAogICAgT3BlblNTTC4gU2VlIDpkb2M6YC9zdGF0ZW1lbnRzL3N0YXRl
LW9mLW9wZW5zc2xgIGZvciBtb3JlIGluZm9ybWF0aW9uLgoKLi4gX3Y0Ny0wLTA6Cgo0Ny4wLjAg
LSAyMDI2LTA0LTI0Cn5+fn5+fn5+fn5+fn5+fn5+fn4KCiogU3VwcG9ydCBmb3IgUHl0aG9uIDMu
OCBpcyBkZXByZWNhdGVkIGFuZCB3aWxsIGJlIHJlbW92ZWQgaW4gdGhlIG5leHQKICBgYGNyeXB0
b2dyYXBoeWBgIHJlbGVhc2UuCiogKipCQUNLV0FSRFMgSU5DT01QQVRJQkxFOioqIFN1cHBvcnQg
Zm9yIGJpbmFyeSBlbGxpcHRpYyBjdXJ2ZXMKICAoYGBTRUNUKmBgIGNsYXNzZXMpIGhhcyBiZWVu
IHJlbW92ZWQuIFRoZXNlIGN1cnZlcyBhcmUgcmFyZWx5IHVzZWQgYW5kCiAgaGF2ZSBhZGRpdGlv
bmFsIHNlY3VyaXR5IGNvbnNpZGVyYXRpb25zIHRoYXQgbWFrZSB0aGVtIHVuZGVzaXJhYmxlLgoq
ICoqQkFDS1dBUkRTIElOQ09NUEFUSUJMRToqKiBTdXBwb3J0IGZvciBPcGVuU1NMIDEuMS54IGhh
cyBiZWVuIHJlbW92ZWQuCiAgT3BlblNTTCAzLjAuMCBvciBsYXRlciBpcyBub3cgcmVxdWlyZWQu
IExpYnJlU1NMLCBCb3JpbmdTU0wsIGFuZCBBV1MtTEMKICBjb250aW51ZSB0byBiZSBzdXBwb3J0
ZWQuCiogKipCQUNLV0FSRFMgSU5DT01QQVRJQkxFOioqIERyb3BwZWQgc3VwcG9ydCBmb3IgTGli
cmVTU0wgPCA0LjEuCiogKipCQUNLV0FSRFMgSU5DT01QQVRJQkxFOioqIExvYWRpbmcga2V5cyB3
aXRoIHVuc3VwcG9ydGVkIGFsZ29yaXRobXMgb3IKICBrZXlzIHdpdGggdW5zdXBwb3J0ZWQgZXhw
bGljaXQgY3VydmUgZW5jb2RpbmdzIG5vdyByYWlzZXMKICA6Y2xhc3M6YH5jcnlwdG9ncmFwaHku
ZXhjZXB0aW9ucy5VbnN1cHBvcnRlZEFsZ29yaXRobWAgaW5zdGVhZCBvZgogIGBgVmFsdWVFcnJv
cmBgLiBUaGlzIGNoYW5nZSBhZmZlY3RzCiAgOmZ1bmM6YH5jcnlwdG9ncmFwaHkuaGF6bWF0LnBy
aW1pdGl2ZXMuc2VyaWFsaXphdGlvbi5sb2FkX3BlbV9wcml2YXRlX2tleWAsCiAgOmZ1bmM6YH5j
cnlwdG9ncmFwaHkuaGF6bWF0LnByaW1pdGl2ZXMuc2VyaWFsaXphdGlvbi5sb2FkX2Rlcl9wcml2
YXRlX2tleWAsCiAgOmZ1bmM6YH5jcnlwdG9ncmFwaHkuaGF6bWF0LnByaW1pdGl2ZXMuc2VyaWFs
aXphdGlvbi5sb2FkX3BlbV9wdWJsaWNfa2V5YCwKICA6ZnVuYzpgfmNyeXB0b2dyYXBoeS5oYXpt
YXQucHJpbWl0aXZlcy5zZXJpYWxpemF0aW9uLmxvYWRfZGVyX3B1YmxpY19rZXlgLAogIGFuZCA6
bWV0aDpgfmNyeXB0b2dyYXBoeS54NTA5LkNlcnRpZmljYXRlLnB1YmxpY19rZXlgIHdoZW4gY2Fs
bGVkIG9uCiAgY2VydGlmaWNhdGVzIHdpdGggdW5zdXBwb3J0ZWQgcHVibGljIGtleSBhbGdvcml0
aG1zLgoqICoqQkFDS1dBUkRTIElOQ09NUEFUSUJMRToqKiBXaGVuIHBhcnNpbmcgZWxsaXB0aWMg
Y3VydmUgcHJpdmF0ZSBrZXlzLCB3ZSBub3cKICByZWplY3Qga2V5cyB0aGF0IGluY29ycmVjdGx5
IGVuY29kZSBhIHByaXZhdGUga2V5IG9mIHRoZSB3cm9uZyBsZW5ndGggYmVjYXVzZQogIHN1Y2gg
a2V5cyBhcmUgaW1wb3NzaWJsZSB0byBwcm9jZXNzIGluIGEgY29uc3RhbnQtdGltZSBtYW5uZXIu
IFdlIGRvIG5vdAogIGJlbGlldmUga2V5cyB3aXRoIHRoaXMgcHJvYmxlbSBhcmUgaW4gd2lkZSB1
c2UsIGhvd2V2ZXIgd2UgbWF5IHJldmVydCB0aGlzCiAgY2hhbmdlIGJhc2VkIG9uIHRoZSBmZWVk
YmFjayB3ZSByZWNlaXZlLgoqIERlcHJlY2F0ZWQgcGFzc2luZyA2NC1iaXQgKDgtYnl0ZSkgYW5k
IDEyOC1iaXQgKDE2LWJ5dGUpIGtleXMgdG8KICA6Y2xhc3M6YH5jcnlwdG9ncmFwaHkuaGF6bWF0
LmRlY3JlcGl0LmNpcGhlcnMuYWxnb3JpdGhtcy5UcmlwbGVERVNgLiBJbiBhCiAgZnV0dXJlIHJl
bGVhc2UsIG9ubHkgMTkyLWJpdCAoMjQtYnl0ZSkga2V5cyB3aWxsIGJlIGFjY2VwdGVkLiBVc2Vy
cyBzaG91bGQKICBleHBhbmQgc2hvcnRlciBrZXlzIHRoZW1zZWx2ZXMgKGUuZy4sIGZvciBzaW5n
bGUgREVTOiBgYGtleSArIGtleSArIGtleWBgLAogIGZvciB0d28ta2V5OiBgYGtleSArIGtleVs6
OF1gYCkuCiogVXBkYXRlZCB0aGUgbWluaW11bSBzdXBwb3J0ZWQgUnVzdCB2ZXJzaW9uIChNU1JW
KSB0byAxLjgzLjAsIGZyb20gMS43NC4wLgoqIFN1cHBvcnQgZm9yIGBgeDg2XzY0YGAgbWFjT1Mg
KGluY2x1ZGluZyBwdWJsaXNoaW5nIHdoZWVscykgaXMgZGVwcmVjYXRlZAogIGFuZCB3aWxsIGJl
IHJlbW92ZWQgaW4gdGhlIG5leHQgcmVsZWFzZS4gV2Ugd2lsbCBzd2l0Y2ggdG8gcHVibGlzaGlu
ZyBhbgogIGBgYXJtNjRgYCBvbmx5IHdoZWVsIGZvciBtYWNPUy4KKiBTdXBwb3J0IGZvciAzMi1i
aXQgV2luZG93cyAoaW5jbHVkaW5nIHB1Ymxpc2hpbmcgd2hlZWxzKSBpcyBkZXByZWNhdGVkCiAg
YW5kIHdpbGwgYmUgcmVtb3ZlZCBpbiB0aGUgbmV4dCByZWxlYXNlLiBVc2VycyBzaG91bGQgbW92
ZSB0byBhIDY0LWJpdAogIFB5dGhvbiBpbnN0YWxsYXRpb24uCiogYGBwdWJsaWNfYnl0ZXNgYCBh
bmQgYGBwcml2YXRlX2J5dGVzYGAgbWV0aG9kcyBvbiBrZXlzIG5vdyByYWlzZQogIGBgVHlwZUVy
cm9yYGAgKGluc3RlYWQgb2YgYGBWYWx1ZUVycm9yYGApIGlmIGFuIGludmFsaWQgZW5jb2Rpbmcg
aXMgcHJvdmlkZWQKICBmb3IgdGhlIGdpdmVuIGBgZm9ybWF0YGAuCiogTW92ZWQgOmNsYXNzOmB+
Y3J5cHRvZ3JhcGh5Lmhhem1hdC5kZWNyZXBpdC5jaXBoZXJzLm1vZGVzLkNGQmAsCiAgOmNsYXNz
OmB+Y3J5cHRvZ3JhcGh5Lmhhem1hdC5kZWNyZXBpdC5jaXBoZXJzLm1vZGVzLk9GQmAsIGFuZAog
IDpjbGFzczpgfmNyeXB0b2dyYXBoeS5oYXptYXQuZGVjcmVwaXQuY2lwaGVycy5tb2Rlcy5DRkI4
YCBpbnRvCiAgOmRvYzpgL2hhem1hdC9kZWNyZXBpdC9pbmRleGAgYW5kIGRlcHJlY2F0ZWQgdGhl
bSBpbiB0aGUgYGBtb2Rlc2BgIG1vZHVsZS4KICBUaGV5IHdpbGwgYmUgcmVtb3ZlZCBmcm9tIHRo
ZSBgYG1vZGVzYGAgbW9kdWxlIGluIDQ5LjAuMC4KKiBNb3ZlZCA6Y2xhc3M6YH5jcnlwdG9ncmFw
aHkuaGF6bWF0LnByaW1pdGl2ZXMuY2lwaGVycy5hbGdvcml0aG1zLkNhbWVsbGlhYAogIGludG8g
IDpkb2M6YC9oYXptYXQvZGVjcmVwaXQvaW5kZXhgIGFuZCBkZXByZWNhdGVkIGl0IGluIHRoZSBg
YGNpcGhlcmBgIG1vZHVsZS4KICBJdCB3aWxsIGJlIHJlbW92ZWQgZnJvbSB0aGUgYGBjaXBoZXJg
YCBtb2R1bGUgaW4gNDkuMC4wLgoqIEFkZGVkIDptZXRoOmB+Y3J5cHRvZ3JhcGh5Lmhhem1hdC5w
cmltaXRpdmVzLmtkZi5oa2RmLkhLREYuZXh0cmFjdGAKICB0byA6Y2xhc3M6YH5jcnlwdG9ncmFw
aHkuaGF6bWF0LnByaW1pdGl2ZXMua2RmLmhrZGYuSEtERmAuIFRoZSBwcmV2aW91cwogIHByaXZh
dGUgaW1wbGVtZW50YXRpb24gd2lsbCBiZSByZW1vdmVkIGluIDQ5LjAuMC4KKiBBZGRlZCBzdXBw
b3J0IGZvciBsb2FkaW5nIGVsbGlwdGljIGN1cnZlIGtleXMgdGhhdCBjb250YWluIGV4cGxpY2l0
IGVuY29kaW5ncwogIG9mIHRoZSBjdXJ2ZXMgYGBzZWNwMjU2cjFgYCwgYGBzZWNwMzg0cjFgYCwg
YW5kIGBgc2VjcDUyMXIxYGAuCiogQWRkZWQgc3VwcG9ydCBmb3IgOmNsYXNzOmB+Y3J5cHRvZ3Jh
cGh5Lmhhem1hdC5wcmltaXRpdmVzLmtkZi5hcmdvbjIuQXJnb24yZGAKICBhbmQgOmNsYXNzOmB+
Y3J5cHRvZ3JhcGh5Lmhhem1hdC5wcmltaXRpdmVzLmtkZi5hcmdvbjIuQXJnb24yaWAKICB3aGVu
IHVzaW5nIE9wZW5TU0wgMy4yLjArLgoqIEFkZGVkIGBgZGVyaXZlX2ludG9gYCBtZXRob2RzIHRv
CiAgOmNsYXNzOmB+Y3J5cHRvZ3JhcGh5Lmhhem1hdC5wcmltaXRpdmVzLmtkZi5oa2RmLkhLREZg
LAogIDpjbGFzczpgfmNyeXB0b2dyYXBoeS5oYXptYXQucHJpbWl0aXZlcy5rZGYuaGtkZi5IS0RG
RXhwYW5kYCwKICA6Y2xhc3M6YH5jcnlwdG9ncmFwaHkuaGF6bWF0LnByaW1pdGl2ZXMua2RmLmNv
bmNhdGtkZi5Db25jYXRLREZIYXNoYCwKICA6Y2xhc3M6YH5jcnlwdG9ncmFwaHkuaGF6bWF0LnBy
aW1pdGl2ZXMua2RmLmNvbmNhdGtkZi5Db25jYXRLREZITUFDYCwKICA6Y2xhc3M6YH5jcnlwdG9n
cmFwaHkuaGF6bWF0LnByaW1pdGl2ZXMua2RmLmFyZ29uMi5BcmdvbjJpZGAsCiAgOmNsYXNzOmB+
Y3J5cHRvZ3JhcGh5Lmhhem1hdC5wcmltaXRpdmVzLmtkZi5wYmtkZjIuUEJLREYySE1BQ2AsCiAg
OmNsYXNzOmB+Y3J5cHRvZ3JhcGh5Lmhhem1hdC5wcmltaXRpdmVzLmtkZi5rYmtkZi5LQktERkhN
QUNgLAogIDpjbGFzczpgfmNyeXB0b2dyYXBoeS5oYXptYXQucHJpbWl0aXZlcy5rZGYua2JrZGYu
S0JLREZDTUFDYCwKICA6Y2xhc3M6YH5jcnlwdG9ncmFwaHkuaGF6bWF0LnByaW1pdGl2ZXMua2Rm
LnNjcnlwdC5TY3J5cHRgLCBhbmQKICA6Y2xhc3M6YH5jcnlwdG9ncmFwaHkuaGF6bWF0LnByaW1p
dGl2ZXMua2RmLng5NjNrZGYuWDk2M0tERmAgdG8gYWxsb3cKICBkZXJpdmluZyBrZXlzIGRpcmVj
dGx5IGludG8gcHJlLWFsbG9jYXRlZCBidWZmZXJzLgoqIEFkZGVkIGBgZW5jcnlwdF9pbnRvYGAg
YW5kIGBgZGVjcnlwdF9pbnRvYGAgbWV0aG9kcyB0bwogIDpjbGFzczpgfmNyeXB0b2dyYXBoeS5o
YXptYXQucHJpbWl0aXZlcy5jaXBoZXJzLmFlYWQuQUVTQ0NNYCwKICA6Y2xhc3M6YH5jcnlwdG9n
cmFwaHkuaGF6bWF0LnByaW1pdGl2ZXMuY2lwaGVycy5hZWFkLkFFU0dDTWAsCiAgOmNsYXNzOmB+
Y3J5cHRvZ3JhcGh5Lmhhem1hdC5wcmltaXRpdmVzLmNpcGhlcnMuYWVhZC5BRVNHQ01TSVZgLAog
IDpjbGFzczpgfmNyeXB0b2dyYXBoeS5oYXptYXQucHJpbWl0aXZlcy5jaXBoZXJzLmFlYWQuQUVT
T0NCM2AsCiAgOmNsYXNzOmB+Y3J5cHRvZ3JhcGh5Lmhhem1hdC5wcmltaXRpdmVzLmNpcGhlcnMu
YWVhZC5BRVNTSVZgLCBhbmQKICA6Y2xhc3M6YH5jcnlwdG9ncmFwaHkuaGF6bWF0LnByaW1pdGl2
ZXMuY2lwaGVycy5hZWFkLkNoYUNoYTIwUG9seTEzMDVgIHRvCiAgYWxsb3cgZW5jcnlwdGluZyBk
aXJlY3RseSBpbnRvIGEgcHJlLWFsbG9jYXRlZCBidWZmZXIuCiogQWRkZWQgc3VwcG9ydCBmb3Ig
UEtDUzF2MTUgc2lnbmluZyB3aXRob3V0IERpZ2VzdEluZm8gdXNpbmcKICA6Y2xhc3M6YH5jcnlw
dG9ncmFwaHkuaGF6bWF0LnByaW1pdGl2ZXMuYXN5bW1ldHJpYy51dGlscy5Ob0RpZ2VzdEluZm9g
LgoqIEFkZGVkIDptZXRoOmB+Y3J5cHRvZ3JhcGh5Lmhhem1hdC5wcmltaXRpdmVzLmhhc2hlcy5I
YXNoLmhhc2hgLCBhIG9uZS1zaG90CiAgbWV0aG9kIGZvciBjb21wdXRpbmcgaGFzaGVzLgoqIEFk
ZGVkIDpkb2M6YC9oYXptYXQvcHJpbWl0aXZlcy9ocGtlYCBzdXBwb3J0IGltcGxlbWVudGluZyA6
cmZjOmA5MTgwYCBmb3IKICBoeWJyaWQgYXV0aGVudGljYXRlZCBlbmNyeXB0aW9uLgoqIEFkZGVk
IG5ldyA6ZG9jOmAvaGF6bWF0L3ByaW1pdGl2ZXMvYXN5bW1ldHJpYy9tbGtlbWAgbW9kdWxlIHdp
dGgKICBzdXBwb3J0IGZvciBNTC1LRU0ga2V5IGVuY2Fwc3VsYXRpb24gd2l0aCBBV1MtTEMgYW5k
IEJvcmluZ1NTTC4KCiAgKiAqKk5vdGU6KiogUG9zdC1xdWFudHVtIGFsZ29yaXRobSBzdXBwb3J0
IHJlcXVpcmVzIEFXUy1MQyBvciBCb3JpbmdTU0wuCiAgICBBcyB3ZSBzaGlwIG91ciB3aGVlbHMg
d2l0aCBPcGVuU1NMLCBtb3N0IHVzZXJzIHdpbGwgbm90IGhhdmUgYWNjZXNzIHRvCiAgICB0aGVz
ZSBBUElzIHlldC4gU2VlIDpkb2M6YC9zdGF0ZW1lbnRzL3N0YXRlLW9mLW9wZW5zc2xgIGZvciBt
b3JlCiAgICBpbmZvcm1hdGlvbiBvbiBPcGVuU1NMIHN1cHBvcnQuCiogQWRkZWQgbmV3IDpkb2M6
YC9oYXptYXQvcHJpbWl0aXZlcy9hc3ltbWV0cmljL21sZHNhYCBtb2R1bGUgd2l0aAogIHN1cHBv
cnQgZm9yIE1MLURTQSBzaWduaW5nIGFuZCB2ZXJpZmljYXRpb24gd2l0aCBBV1MtTEMgYW5kIEJv
cmluZ1NTTC4KCiAgKiAqKk5vdGU6KiogUG9zdC1xdWFudHVtIGFsZ29yaXRobSBzdXBwb3J0IHJl
cXVpcmVzIEFXUy1MQyBvciBCb3JpbmdTU0wuCiAgICBBcyB3ZSBzaGlwIG91ciB3aGVlbHMgd2l0
aCBPcGVuU1NMLCBtb3N0IHVzZXJzIHdpbGwgbm90IGhhdmUgYWNjZXNzIHRvCiAgICB0aGVzZSBB
UElzIHlldC4gU2VlIDpkb2M6YC9zdGF0ZW1lbnRzL3N0YXRlLW9mLW9wZW5zc2xgIGZvciBtb3Jl
CiAgICBpbmZvcm1hdGlvbiBvbiBPcGVuU1NMIHN1cHBvcnQuCiogQWRkZWQgbmV3IDpkb2M6YC9o
YXptYXQvYXNuMS9pbmRleGAgbW9kdWxlIHdpdGggc3VwcG9ydCBmb3IgZGVjbGFyYXRpdmVseQog
IGRlZmluaW5nIGN1c3RvbSBBU04uMSB0eXBlcyBhbmQgZW5jb2RpbmcvZGVjb2RpbmcgdGhlbS4K
KiBGaXhlZCBjb21waWxhdGlvbiB3aGVuIHVzaW5nIExpYnJlU1NMIDQuMy4wIGFuZCBPcGVuU1NM
IDQuMC4wLgoqIFVwZGF0ZWQgV2luZG93cywgbWFjT1MsIGFuZCBMaW51eCB3aGVlbHMgdG8gYmUg
Y29tcGlsZWQgd2l0aCBPcGVuU1NMIDQuMC4wLgoKLi4gX3Y0Ni0wLTc6Cgo0Ni4wLjcgLSAyMDI2
LTA0LTA3Cg==
--0000000000007139cf0651cca2fc
Content-Type: text/plain; charset="US-ASCII"; name="python3-maturin.txt"
Content-Disposition: attachment; filename="python3-maturin.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mp5wi7rr1>
X-Attachment-Id: f_mp5wi7rr1

Q2hhbmdlbG9nIGZvciBweXRob24zLW1hdHVyaW46IDEuMTMuMSAtPiAxLjEzLjMKCiMjIDEuMTMu
MwoKKiBGaXg6IGRpc2FibGUgYWJpMyBpbiBweW8zIGNvbmZpZyBmb3IgdmVyc2lvbi1zcGVjaWZp
YyBmYWxsYmFjayBidWlsZHMgKFsjMzE4MF0oaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJp
bi9wdWxsLzMxODApKQoKIyMgMS4xMy4yCgoqIEZpeDogcmVzb2x2ZSB0ZXN0IGZhaWx1cmVzIGlu
IGRpc3RybyBwYWNrYWdpbmcgZW52aXJvbm1lbnRzIChbIzMxMjldKGh0dHBzOi8vZ2l0aHViLmNv
bS9weW8zL21hdHVyaW4vcHVsbC8zMTI5KSkKKiBGaXg6IHJlZGlyZWN0IHRyYWNpbmcgb3V0cHV0
IHRvIHN0ZGVyciB0byBhdm9pZCBicmVha2luZyBQRVAgNTE3IChbIzMxMzFdKGh0dHBzOi8vZ2l0
aHViLmNvbS9weW8zL21hdHVyaW4vcHVsbC8zMTMxKSkKKiBGaXg6IHNraXAgaW50ZXJwcmV0ZXJz
IHdpdGggZW1wdHkgb3V0cHV0IGZvciBXU0wyIGNyb3NzLWNvbXBpbGUgKFsjMzEzN10oaHR0cHM6
Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbi9wdWxsLzMxMzcpKQoqIEZpeDogc2V0IGV4cGxpY2l0
IGxpYl9uYW1lIGluIHB5bzMgY29uZmlnIGZvciBBbmRyb2lkIGFiaTMgY3Jvc3MtY29tcGlsYXRp
b24gKFsjMzEzMF0oaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbi9wdWxsLzMxMzApKQoq
IENob3JlOiBhZGQgc3lzY29uZmlnL2NweXRob24tZnJlZWJzZC0xNS4wLWFtZDY0LnR4dCAoWyMz
MTQwXShodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwvMzE0MCkpCiogUXVvdGUg
cHl0aG9uLXZlcnNpb24gaW4gZ2VuZXJhdGVkIEdpdEh1YiBBY3Rpb25zIHdvcmtmbG93CiogVXBk
YXRlIHJ1c3Rscy13ZWJwa2kKKiBGaXg6IHR3by1waGFzZSBicmlkZ2UgZGV0ZWN0aW9uIGZvciBj
b25kaXRpb25hbCBhYmkzIGZlYXR1cmVzIChbIzMxNDRdKGh0dHBzOi8vZ2l0aHViLmNvbS9weW8z
L21hdHVyaW4vcHVsbC8zMTQ0KSkKKiBVcGRhdGUgY2FyZ28temlnYnVpbGQgdG8gMC4yMi4yCiog
VXBkYXRlIHB5bzMgdG8gMC4yOC4zCiogVHJlYXQgcHlvMyAwLjI5LjArIGFzIGhhdmluZyBXaW5k
b3dzIGltcG9ydCBsaWIgc3VwcG9ydCAocmF3LWR5bGliKSAoWyMzMTQ1XShodHRwczovL2dpdGh1
Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwvMzE0NSkpCiogRml4IGJpbiBiaW5kaW5ncyB3aXRoIGV4
dGVybmFsIHNoYXJlZCBsaWJyYXJ5IGRlcGVuZGVuY2llcyAoWyMzMTQ3XShodHRwczovL2dpdGh1
Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwvMzE0NykpCiogVXBncmFkZSBNU1JWIHRvIDEuODkuMCAo
WyMzMTQ5XShodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwvMzE0OSkpCiogTXVz
bGxpbnV4IG9jaSBpbWFnZSAoWyMzMTUyXShodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmlu
L3B1bGwvMzE1MikpCiogUmVtb3ZlIENpcnJ1cyBDSSBmb3IgRnJlZUJTRCAoWyMzMTU2XShodHRw
czovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwvMzE1NikpCiogUGVyZjogZGVmZXIgc3Rh
Z2VfYXJ0aWZhY3QgY29weS1iYWNrLCBmaW5hbGl6ZSB2aWEgcmVuYW1lIHdoZW4gdW5wYXRjaGVk
IChbIzMxNTVdKGh0dHBzOi8vZ2l0aHViLmNvbS9weW8zL21hdHVyaW4vcHVsbC8zMTU1KSkKKiBQ
ZXJmOiBlbGltaW5hdGUgc3RhZ2VfYXJ0aWZhY3QgZG91YmxlLWNvcHksIGRyb3Agd2FzX3BhdGNo
ZWQgZmxhZyAoWyMzMTU3XShodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwvMzE1
NykpCiogRml4IHJlbGVhc2UgcGlwZWxpbmUgKFsjMzE1OF0oaHR0cHM6Ly9naXRodWIuY29tL3B5
bzMvbWF0dXJpbi9wdWxsLzMxNTgpKQoqIEF1ZGl0d2hlZWw6IGNvcHkgdW5wYXRjaGVkIGNhcmdv
IG91dHB1dCBiYWNrIGJlZm9yZSBpbi1wbGFjZSBwYXRjaGluZyAoWyMzMTU5XShodHRwczovL2dp
dGh1Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwvMzE1OSkpCiogRGV2ZWxvcDogZmFpbCBsb3VkbHkg
d2hlbiBwaXAgbGVhdmVzIGEgc3RhbGUgYH5gIGluc3RhbGwgYmVoaW5kICgjMTkyMikgKFsjMzE2
MV0oaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbi9wdWxsLzMxNjEpKQoqIFByb3ZpZGUg
YSBsaW5rIGZvciB0aGUgYGxpYi5uYW1lYCBpbiBDYXJnby50b21sIChbIzMxNjddKGh0dHBzOi8v
Z2l0aHViLmNvbS9weW8zL21hdHVyaW4vcHVsbC8zMTY3KSkKKiBGaXggZHVwbGljYXRlZCB2ZXJz
aW9uIGluIGNoYW5nZWxvZyAoWyMzMTcxXShodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmlu
L3B1bGwvMzE3MSkpCiogU3dpdGNoIHRvIGFjdGlvbnMvYXR0ZXN0IGZyb20gYXR0ZXN0LWJ1aWxk
LXByb3ZlbmFuY2UgKFsjMzE2OV0oaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbi9wdWxs
LzMxNjkpKQoqIFN3aXRjaCBnZW5lcmF0aW9uIHRvIGFjdGlvbnMvYXR0ZXN0IGFjdGlvbiwgdXBn
cmFkZSB0byB2NCAoWyMzMTcwXShodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluL3B1bGwv
MzE3MCkpCiogRml4OiBhdm9pZCBkdXBsaWNhdGUgYC0taW50ZXJwcmV0ZXJgIHBhbmljIGluIFBF
UCA1MTcgYmFja2VuZCAoWyMzMTc1XShodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluL3B1
bGwvMzE3NSkpCiogQWRkIHRydXN0ZWQgcHVibGlzaGluZyBvcHRpb25zIHRvIGBnZW5lcmF0ZS1j
aWAgKFsjMzE3Nl0oaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbi9wdWxsLzMxNzYpKQoq
IEZpeChzZGlzdCk6IGhhbmRsZSBzeW1saW5rZWQgYENhcmdvLnRvbWxgIHBvaW50aW5nIG91dHNp
ZGUgcHJvamVjdCByb290IChbIzMxNzhdKGh0dHBzOi8vZ2l0aHViLmNvbS9weW8zL21hdHVyaW4v
cHVsbC8zMTc4KSkKKiBTdG9wIGluc3RhbGwgY2ZmaSBmb3IgUHl0aG9uIDMuOCBpbiBEb2NrZXJm
aWxlCiogRml4OiBzdXBwb3J0IHBpeGktbWFuYWdlZCB2aXJ0dWFsZW52cyBpbiBtYXR1cmluIGRl
dmVsb3AgKFsjMzE2NV0oaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbi9wdWxsLzMxNjUp
KQoqIFN1cHBvcnQgUEVQIDc4MyBgcHllbXNjcmlwdGVuXypfd2FzbTMyYCB3aGVlbCBwbGF0Zm9y
bSB0YWcgKFsjMzE2M10oaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbi9wdWxsLzMxNjMp
KQoKIyMgMS4xMy4xCg==
--0000000000007139cf0651cca2fc
Content-Type: text/plain; charset="UTF-8"; name="vim.txt"
Content-Disposition: attachment; filename="vim.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mp5wimtu2>
X-Attachment-Id: f_mp5wimtu2

Q2hhbmdlbG9nIGZvciB2aW06IDkuMi4wMzQwIC0+IDkuMgoKOGU0MWMzNGFiIHBhdGNoIDkuMi4w
NDgxOiBydW50aW1lKG5ldHJ3KTogY29tbWFuZCBpbmplY3Rpb24gcG9zc2libGUgdmlhIG1hcHMK
OGFmMGYwOThjIHBhdGNoIDkuMi4wNDgwOiBbc2VjdXJpdHldOiBydW50aW1lKG5ldHJ3KTogY29k
ZSBpbmplY3Rpb24gdmlhIG1mIGNvbW1hbmQKM2ZiNWU1OGZiIHBhdGNoIDkuMi4wNDc5OiBbc2Vj
dXJpdHldOiBydW50aW1lKHRhcik6IGNvbW1hbmQgaW5qZWN0aW9uIGluIHRhciBwbHVnaW4KOTUw
ZjUwMWExIHJ1bnRpbWUoZG9jKTogRml4IGZpbGUgbW9kZSBmb3IgdGhlIEl0YWxpYW4gbWFucGFn
ZQo3MDJkMzJlMTYgcnVudGltZShjb21waWxlcik6IHNldCB6aWcgZXJyb3Jmb3JtYXQKOGFlY2Qz
NzdmIHBhdGNoIDkuMi4wNDc4OiBjaGFubmVsOiByZWR1bmRhbnQgc3RyL2xlbmd0aCBhc3NpZ25t
ZW50cyBpbiBjaGFubmVsX3BhcnRfaW5mbygpCjNhOWUxYmI3ZSBwYXRjaCA5LjIuMDQ3NzogcG9w
dXA6IGxlZnRvdmVyIGNvbnRlbnQgYWZ0ZXIgcG9wdXBfZnJlZSB1bmRlciBsYXlvdXQgY2hhbmdl
CjM4MjM3NDExZSBwYXRjaCA5LjIuMDQ3NjogcGF0dGVybiBjb21wbGV0aW9uIGxlYWtzIG1lbW9y
eSBvbiBhbGxvYyBmYWlsdXJlcwo3ODMwMmI3YjQgdHJhbnNsYXRpb24oaXQpOiBVcGRhdGUgSXRh
bGlhbiBtYW5wYWdlCmY0NWVkNjQ2NSBydW50aW1lKGhseWFtayk6IEFsbG93IHRvIGhpZ2hsaWdo
dCBwdXQgcmVnaW9ucyB1c2luZyBUZXh0UHV0UG9zdAo3NDAxOWJlYTggcGF0Y2ggOS4yLjA0NzU6
IHJ1bnRpbWUobmV0cncpOiBib29rbWFyayBwYXRocyBub3Qgbm9ybWFsaXplZAo3Nzg0ZmFjMTUg
cGF0Y2ggOS4yLjA0NzQ6IE1TLVdpbmRvd3M6IGhhcmQgdG8gdGVsbCB3aGljaCBWaXN1YWwgU3R1
ZGlvIHZlcnNpb24gd2FzIHNlbGVjdGVkIHdpdGggTVNWQwphNzBiN2E4NWEgcGF0Y2ggOS4yLjA0
NzM6IFBhc3RpbmcgIi4gcmVnaXN0ZXIgd2l0aG91dCBhdXRvY29tbWFuZHMgYnJlYWtzIFRleHRQ
dXQqCjUxZjE0NDdkMiBwYXRjaCA5LjIuMDQ3MjogcG9wdXA6IGNvbHVtbiBqaXR0ZXJzIHdoZW4g
c2Nyb2xsZWQgb3V0c2lkZSB2aWV3cG9ydAoxYjY1Y2ZiYWMgcGF0Y2ggOS4yLjA0NzE6IHZpbXZh
cnMgZGlfa2V5IGluaXRpYWxpemVkIGF0IHJ1bnRpbWUKODUyZjRmNDNjIHJ1bnRpbWUoZG9jKTog
Rml4IG1hbnBhZ2UgdHlwbyBpbiBkZXNjcmlwdGlvbiBvZiAnLS10dHlmYWlsJwpiZmViZDEyMDkg
cnVudGltZShqYXZhY2MpOiBDaGVjayBmb3IgZXhpc3RlbmNlIG9mIGphdmFGdW5jRGVmIHN5biBn
cm91cCBiZWZvcmUgY2xlYXJpbmcgaXQKZTA3ODFiZDViIHBhdGNoIDkuMi4wNDcwOiBObyB3YXkg
dG8gaG9vayBpbnRvIHB1dCBjb21tYW5kcwplM2Q5OTI5MTAgcGF0Y2ggOS4yLjA0Njk6IHBvcHVw
OiB0ZXh0cHJvcC1hbmNob3JlZCBwb3B1cHMgYmxlZWQgcGFzdCBob3N0IHdpbmRvdyBlZGdlcwpl
ZjFlY2MzYjYgcGF0Y2ggOS4yLjA0Njg6IHBvcHVwczogbm90IGNvcnJlY3RseSB1cGRhdGVkIGZy
b20gYSBDbWRsaW5lQ2hhbmdlZCBhdXRvY29tbWFuZAo1ZWYxZWVjNWMgcGF0Y2ggOS4yLjA0Njc6
IG11bHRpLWxpbmUgc3RhdHVzbGluZSBsb3NlcyBoaWdobGlnaHRpbmcgYXR0cmlidXRlcwozYThi
OWUwOWIgcGF0Y2ggOS4yLjA0NjY6IHBvcHVwOiByZWRyYXcgY2FuIHVzZSBzdGFsZSBibGVuZGVk
IGNlbGxzCjIwMjBlMGJhZCBwYXRjaCA5LjIuMDQ2NTogbW9kZWxpbmU6IGZvbGRtYXJrZXIgY2Fu
bm90IGJlIHNldCB3aXRoIG1vZGVsaW5lc3RyaWN0CmVjNzZhYzYyMCBwYXRjaCA5LjIuMDQ2NDog
cnVudGltZShuZXRydyk6IGJvb2ttYXJraW5nIGRpcmVjdG9yeSB1c2VzIGN1cnJlbnQgZGlyCjZi
OGQyMjYyZCBwYXRjaCA5LjIuMDQ2MzogTm90IGFibGUgdG8gdXNlIGxlZ2FjeSBleHByZXNzaW9u
IGV2YWx1YXRpb24gaW4gYSB2aW05c2NyaXB0IG1hcHMKM2ExYWM3Y2VkIHBhdGNoIDkuMi4wNDYy
OiBNUy1XaW5kb3dzOiB3b3JrYXJvdW5kIGZvciBhc3NlcnQgZXJyb3Igb24gR1VJCjRmNjEwZjA3
YiBwYXRjaCA5LjIuMDQ2MTogQ29ycnVwdGVkIHVuZG9maWxlIGNhdXNlcyB1c2UtYWZ0ZXItZnJl
ZQphYmQ3NGZhMTIgcGF0Y2ggOS4yLjA0NjA6IGRpZF9zZXRfc2hlbGxwaXBlX3JlZGlyKCkgaW4g
d3JvbmcgZmlsZQoxMjRmOGJlY2UgcGF0Y2ggOS4yLjA0NTk6IHRlc3RzOiB0ZXN0X3Rlcm1jb2Rl
cyBmYWlscyAoYWZ0ZXIgdjkuMi4wNDU2KQpmYmVjODI4YzcgQ0k6IEJ1bXAgdGhlIGdpdGh1Yi1h
Y3Rpb25zIGdyb3VwIGFjcm9zcyAxIGRpcmVjdG9yeSB3aXRoIDIgdXBkYXRlcwo4NGFlMDlkZDcg
cGF0Y2ggOS4yLjA0NTg6IENyYXNoIHdpdGggaW52YWxpZCBzaGVsbHJlZGlyL3NoZWxscGlwZSB2
YWx1ZQoyZjAwNjU2YjMgcGF0Y2ggOS4yLjA0NTc6IENvbXBpbGUgd2FybmluZyBhYm91dCB1bnVz
ZWQgdmFyaWFibGUKNzY0NGQ5ZDYxIHBhdGNoIDkuMi4wNDU2OiBzdHJheSBwIGNoYXJhY3RlciBk
aXNwbGF5ZWQgb24gc29tZSB0ZXJtcwo5Njk0ZmY1OGYgcGF0Y2ggOS4yLjA0NTU6ICdmaW5kZnVu
Yycgb25seSBhbGxvd3MgZXh0cmEgaW5mbyBmb3IgY21kbGluZSBjb21wbGV0aW9uCmIyMDdiNWEy
YSBwYXRjaCA5LjIuMDQ1NDogdGVzdHM6IG5vIHRlc3QgdGhhdCAiYWJiciIgaW4gY3VzdG9tbGlz
dCBjb21wbGV0aW9uIGlzIHNob3duCmM4OTUzOTBlNSBwYXRjaCA5LjIuMDQ1MzogdmVydGljYWwg
c2VwYXJhdG9yIG9mIHN0YXR1c2xpbmUgYmxlbmQgaW50byBhY3RpdmUgc3RhdHVzbGluZQpiOTg3
MWNlZjEgcGF0Y2ggOS4yLjA0NTI6IHNjcmVlbi5jIHBvcHVwIG9wYWNpdHkgYmxlbmQgbG9naWMg
aXMgZHVwbGljYXRlZAo1ODEyNDc4OWEgcGF0Y2ggOS4yLjA0NTE6ICdmaW5kZnVuYycgY2FuJ3Qg
cmV0dXJuIGV4dHJhIGluZm8gZm9yIGNtZGxpbmUgY29tcGxldGlvbgo5Mjk5MzMyOTEgcGF0Y2gg
OS4yLjA0NTA6IFtzZWN1cml0eV06IGhlYXAgYnVmZmVyIG92ZXJmbG93IGluIHNwZWxsZmlsZS5j
IHJlYWRfY29tcG91bmQoKQo0Y2JkZWY4ZTMgcnVudGltZSh2aW05KTogQ2hlY2sgY21kLmV4ZSBv
biBXU0wgaXMgZXhlY3V0YWJsZQowYWI0MzE2ZmMgcGF0Y2ggOS4yLjA0NDk6IE1ha2UgcHJvdG8g
ZmFpbHMgaW4gbm9uIEdUSyBidWlsZHMKNGJjYzhiYTkzIHBhdGNoIDkuMi4wNDQ4OiBWaW05OiBk
YW5nbGluZyBjbWRsaW5lIHBvaW50ZXIgYWZ0ZXIgc2tpcF9leHByX2NjdHgoKQpjMDYwMDJmM2Mg
cGF0Y2ggOS4yLjA0NDc6IGNpbmRlbnQgZG9lcyBub3QgaWdub3JlIGNvbW1lbnRzCjdjY2MyNzNh
NCBwYXRjaCA5LjIuMDQ0NjogcnVudGltZShuZXRydyk6IG9mZi1ieS1vbmUgYnVnIGluIHM6TmV0
cndVbk1hcmtGaWxlKCkKNDBmYzc4ZjBhIHBhdGNoIDkuMi4wNDQ1OiB3aW5fZml4X3Njcm9sbCgp
IGNhbGxlZCBiZWZvcmUgd2luX2NvbXBfcG9zKCkgaW4gY29tbWFuZF9oZWlnaHQoKQo4OGZiNzM5
OTEgcGF0Y2ggOS4yLjA0NDQ6IENhbm5vdCBzZXQgJ3BhdGgnIG9wdGlvbiB2aWEgbW9kZWxpbmUK
Y2Y5NDdlN2VmIHBhdGNoIDkuMi4wNDQzOiBHVUk6IGNhbmNlbGxpbmcgc2F2ZSBkaWFsb2cgb3Zl
cndyaXRlcyBvciBkaXNjYXJkcyB1bm5hbWVkIGJ1ZmZlcgoyYmZkZGJlYTQgcGF0Y2ggOS4yLjA0
NDI6IGNvbXBsZXRpb246IGlfQ1RSTC1YX0NUUkwtViBkb2Vzbid0IHVzZSBkaWN0IGZyb20gY3Vz
dG9tbGlzdAoxOTAzMDIwYjggcnVudGltZShhdXRvcGtndGVzdCk6IHVwZGF0ZSBzeW50YXggc2Ny
aXB0CmIxMDE1OWJjYyBGaXggd3JvbmcgY29tbWVudCBpbiBnZXRjaGFyLmMKOGM3ZDgyNGI3IHBh
dGNoIDkuMi4wNDQxOiBzdGF0dXNsaW5lOiBjbGljayBoYW5kbGVyIG5vdCBjYWxsZWQgb24gbXVs
dGktbGluZSBzdGF0dXNsaW5lCjBjOTk4MDAzYiBwYXRjaCA5LjIuMDQ0MDogTVMtV2luZG93czog
Y3Vyc29yIGZsaWNrZXIgZHVyaW5nIHVwZGF0ZV9zY3JlZW4oKQozYmZmZmNjMjkgcGF0Y2ggOS4y
LjA0Mzk6IGNvbXBsZXRpb246IGluZm8gcG9wdXAgbm90IHJlbW92ZWQgaW4gY21kbGluZSBtb2Rl
CjIwYTEyNGE2ZSBwYXRjaCA5LjIuMDQzODogdGVzdHM6IHRlc3RfcGx1Z2luX3Rlcm1kZWJ1ZyBp
cyBmbGFreQpiYjgwN2ViYzggcnVudGltZShkb2MpOiBUd2VhayBkb2N1bWVudGF0aW9uIHN0eWxl
CmNiMGI0Y2Y0NSBGaXggYSBmZXcgbW9yZSB0eXBvcwo5ZDMwMTkxMDQgcGF0Y2ggOS4yLjA0Mzc6
IE1TLVdpbmRvd3M6IGN1cnNvciBmbGlja2VyIGluIHZ0cCBtb2RlCjc3Njc3YzMzZCBwYXRjaCA5
LjIuMDQzNjogQnVmZmVyIG92ZXJmbG93IHdoZW4gcGFyc2luZyBvdmVybG9uZyBlcnJvcmZvcm1h
dCBsaW5lcwoxOTBjYjNjMmIgcGF0Y2ggOS4yLjA0MzU6IFtzZWN1cml0eV06IGJhY2t0aWNrcyBp
biAncGF0aCcgbWF5IGNhdXNlIHNoZWxsIGV4ZWN1dGlvbiBvbiBjb21wbGV0aW9uCmZkZTVhNTZl
YyBwYXRjaCA5LjIuMDQzNDogY3Njb3BlOiBmaWxlbmFtZSBpbnRlcnByZXRlZCBieSAvYmluL3No
CjVjNzAwMTUyYSBwYXRjaCA5LjIuMDQzMzogY3VzdG9tbGlzdCBjb21wbGV0aW9uIGNhbm5vdCBz
dXBwbHkgcHVtIG1ldGFkYXRhCjNiZDI1YzYzYiBwYXRjaCA5LjIuMDQzMjogYmxvYiB0byBzdHJp
bmcgY29udmVyc2lvbiBjYW4gYmUgaW1wcm92ZWQKZTFlOTJmZWE5IHBhdGNoIDkuMi4wNDMxOiBi
bG9iIGVuY29kaW5nIGNhbiBiZSBpbXByb3ZlZAoyMjE5Yzg5MDEgcGF0Y2ggOS4yLjA0MzA6IHRl
c3RzOiBUZXN0X3Nob3J0bWVzc19GMygpIGlzIGZsYWt5IG9uIE1TLVdpbmRvd3MKZTI1OTMzMDE0
IHBhdGNoIDkuMi4wNDI5OiB0ZXN0czogZmxha3kgc2NyZWVuZHVtcCBUZXN0X3Ntb290aHNjcm9s
bF9pbmNzZWFyY2goKQplNDQxM2M1ZGYgcnVudGltZShhbGdvbDY4KTogVXBkYXRlIHN5bnRheCBm
aWxlLCBtYXRjaCBzeW1ib2xpYyBpZGVudGl0eSByZWxhdG9ycwo1OWU1OWE2MmIgcGF0Y2ggOS4y
LjA0Mjg6IHBvcHVwOiBubyBvcGFjaXR5IHN1cHBvcnQgZm9yIGNvbXBsZXRlcG9wdXAvcHJldmll
d3BvcHVwCjdiMjE4YWU5OCBwYXRjaCA5LjIuMDQyNzogcG9wdXA6IG9wYWNpdHkgYmxlbmQgbWF5
IGxlYWtzIHdoaXRlIGJnIGNvbG9yCmNmNWQ3MTAyYiBwYXRjaCA5LjIuMDQyNjogdGVzdHM6IHN0
aWxsIHNvbWUgZmxha3kgc2NyZWVuZHVtcCB0ZXN0cwpkMjVmOGQxYjIgcGF0Y2ggOS4yLjA0MjU6
IENhbm5vdCBzaWxlbmNlIHVuZG8vcmVkbyBtZXNzYWdlcwplYzhiOGJkODIgcGF0Y2ggOS4yLjA0
MjQ6IHBvcHVwOiBmbGlja2VyIHdoZW4gd2lsZHRyaWdnZXIoKSByZWZyZXNoZXMgdGhlIHBvcHVw
IG1lbnUKNTg3NDQ3ZWM2IHBhdGNoIDkuMi4wNDIzOiBwb3B1cDogd3JhcHBlZCBjbWRsaW5lIHRy
dW5jYXRlZCB3aXRoIHdpbGRvcHRpb25zPXB1bQpiYTg1Zjg4ZmUgcGF0Y2ggOS4yLjA0MjI6IHBv
cHVwOiBsZWF2ZSBzdHJheSBjaGFyIHdoZW4gc2Nyb2xsYmFyIGNoYW5nZXMKN2YzMjQzZTNhIHRy
YW5zbGF0aW9uKHNyKTogVXBkYXRlIG9mIFNlcmJpYW4gdHJhbnNsYXRpb24KN2RhOTBkZTFjIHJ1
bnRpbWUoY2FiYWwpOiBhZGQgbWlzc2luZyBoYXNrZWxsIGxhbmd1YWdlIGVkaXRpb25zCmY3OTNl
OTgwNiBydW50aW1lKGRvYyk6IGNsYXJpZnkgc2VwYXJhdG9yIGNlbGwgb24gc3RhdHVzIGxpbmUg
cm93cwo2MjA1NTdiZDQgcnVudGltZShkb2MpOiBVcGRhdGUgaGVscCB0YWdzIGZpbGUKZTdlMzVi
OWUzIHJ1bnRpbWUoZG9jKTogY2xhcmlmeSB0aGF0IHZpbWluZm8gZmlsZSBzaG91bGQgYmUgdHJ1
c3RlZAo3NzQ5OWUwMDkgcGF0Y2ggOS4yLjA0MjE6IHZpbWJhbGw6IGNhbiBzbXVnZ2xlIFZpbXNj
cmlwdCBpbnRvIFZpbWJhbGxSZWNvcmQgZmlsZQozYWM3Yjk3NDMgcGF0Y2ggOS4yLjA0MjA6IGNo
YW5uZWw6IGNhbm5vdCBoYW5kbGUgYmluYXJ5IGRhdGEgdmlhIGNoYW5uZWwgY2FsbGJhY2tzCmJk
ODcxNjE3OCBwYXRjaCA5LjIuMDQxOTogcG9wdXA6IHJlbmRlcmluZyBpc3N1ZXMKMjBlOThmZjFj
IHBhdGNoIDkuMi4wNDE4OiB3aWxkY2FyZHMgaW4gZXhwYW5kZWQgZW52IHZhcnMgcmVpbnRlcnBy
ZXRlZCBieSBnbG9iCmFmNDk0YWY1ZiBwYXRjaCA5LjIuMDQxNzogY29tcGxldGlvbjogbm8gc3Vw
cG9ydCBmb3IgIm5vaW5zZXJ0IiB3aXRoICd3aWxkbW9kZScKYzJiZGEwYWRkIHBhdGNoIDkuMi4w
NDE2OiBVbml4OiBmaWxlbmFtZSBjb21wbGV0aW9uIHNwbGl0cyBhdCBzcGFjZSBmb3Igc2luZ2xl
LWZpbGUgRXggY29tbWFuZHMKNjQ1M2E3YzQ0IHBhdGNoIDkuMi4wNDE1OiBXcm9uZyBiZWhhdmlv
ciB3aGVuIGV4ZWN1dGluZyByZWdpc3RlciB0aGF0IGVuZHMgaW4gSW5zZXJ0IG1vZGUKNDU4ZmVk
NGY2IHBhdGNoIDkuMi4wNDE0OiBGbGlja2VyIHdoZW4gZHJhd2luZyB3aW5kb3cgc2VwYXJhdG9y
IGFuZCBwdW0gaXMgc2hvd24KYzVkZTgyMzFmIHJ1bnRpbWUocW1sKTogQWRkIG9wdGlvbmFsIGNo
YWluaW5nIHRvIFFNTCBzeW50YXgKYmQwZjNlNmRhIHBhdGNoIDkuMi4wNDEzOiBTY3JvbGxpbmcg
d3Jvbmcgd2l0aCAnc3BsaXRrZWVwJyB3aGVuIGNoYW5naW5nICdjbWRoZWlnaHQnCjQxYzMzNzli
ZCBwYXRjaCA5LjIuMDQxMjogY2hhbm5lbDogdGVybV9zdGFydCgpIG91dF9jYi9lcnJfY2Igbm8g
bG9uZ2VyIGRlbGl2ZXIgcmF3IGNodW5rcwplNzc0NWI3Y2IgcGF0Y2ggOS4yLjA0MTE6IHRhYnBh
bmVsOiBubyBWaW0gc2NyaXB0IGZ1bmN0aW9ucyBmb3IgdGhlIHRhYnBhbmVsCjYxNDZmMzM4MiBw
YXRjaCA5LjIuMDQxMDogdGVzdCBzdWl0ZSByYWNlcyB3aGVuIHJ1biB3aXRoIHBhcmFsbGVsIG1h
a2UKMzBiNDI0MDczIHJ1bnRpbWUoZG9jKTogVXBkYXRlIGRvY3MgcmVsYXRlZCB0byB0YWJwYW5l
bAo2Y2I0MTczMjkgcGF0Y2ggOS4yLjA0MDk6IG1lbW9yeSBsZWFrcyBpbiBjb3B5X3N1YnN0cmlu
Z19mcm9tX3BvcygpCmU0N2RhZWQ0NCBwYXRjaCA5LjIuMDQwODogSW5zZXJ0LW1vZGUgPENtZD4g
ZWRpdHMgY2FuIGNvcnJ1cHQgdW5kbwoyZDQzMjQwNjUgcGF0Y2ggOS4yLjA0MDc6IHRhYnBhbmVs
OiBBIGZldyBpc3N1ZXMgd2l0aCB0aGUgdGFicGFuZWwKN2U3NjUxNDg5IHBhdGNoIDkuMi4wNDA2
OiBWaXN1YWxOT1Mgbm90IHVzZWQgd2hlbiBXYXlsYW5kIHNlbGVjdGlvbiBvd25lcnNoaXAgbG9z
dAphZTE5NmIyZDUgcGF0Y2ggOS4yLjA0MDU6IHdoZW4ganVtcGluZyB0byB0YWdzLCB3aWxsIG9w
ZW4gVVJMcwozOTU4MTg4ZjYgcGF0Y2ggOS4yLjA0MDQ6IHJlZHJhd19saXN0ZW5lcl9hZGQoKSBk
b2VzIG5vdCBjaGVjayBzZWN1cmUgZmxhZwpmMWE5NDQ5MjAgcGF0Y2ggOS4yLjA0MDM6IFZpbTk6
IGRlZiBmdW5jdGlvbiBzYW5kYm94IGJ5cGFzcwo3MDcwYTg1ZDkgcGF0Y2ggOS4yLjA0MDI6IHB1
bTogb3BhY2l0eSBub3QgYXBwbGllZCB0byB3aWxkbWVudSBwdW0KMGJjNjRiMTlhIHBhdGNoIDku
Mi4wNDAxOiB0ZXN0czogc3RpbGwgYSBmZXcgZmxha3kgdGVzdHMKZGQ5YjMxZmI2IHBhdGNoIDku
Mi4wNDAwOiBzYW5kYm94IGNhbGxiYWNrcyBzZWxlY3RlZCB0aHJvdWdoICdjb21wbGV0ZScKYTYy
MmRkYTkxIHBhdGNoIDkuMi4wMzk5OiBNUy1XaW5kb3dzOiBjb21waWxlIHdhcm5pbmcgaW4gc3Ry
cHRpbWUuYwo5NmJlMjczMDkgcnVudGltZShkb2MpOiBmaXggOnogY29tbWFuZCBkZXNjcmlwdGlv
biBhZ2FpbgowMzZlNDBlNmQgcGF0Y2ggOS4yLjAzOTg6IE1TLVdpbmRvd3M6IG1pc3Npbmcgc3Ry
cHRpbWUoKSBzdXBwb3J0CjIyYWVkYzRhOSBwYXRjaCA5LjIuMDM5NzogdGFicGFuZWw6IGRvdWJs
ZS1jbGljayBvcGVucyBhIG5ldyB0YWIKMDc2MzY2YmQ0IHJ1bnRpbWUoamF2YXNjcmlwdCk6IEZp
eCByZWdleCBoaWdobGlnaHRpbmcgYWZ0ZXIgYChgCmMyM2JmZDc5MiBydW50aW1lKGhlbHApOiBm
aXggd3JvbmcgY2hlY2sgZm9yIGV4aXN0aW5nIEhlbHBDb21wbGV0ZSBmdW5jdGlvbgozY2M3ZDUw
NzEgcnVudGltZShhbGdvbDY4KTogQWRkIG5ldyBzeW50YXggZmlsZSwgZnRwbHVnaW4gYW5kIGZp
bGV0eXBlIGRldGVjdGlvbgoxY2UwM2Q2NzQgcnVudGltZShkb2NrZXJmaWxlKTogVXBkYXRlIHN5
bnRheCwgZml4IFJVTiBjb21tYW5kIGhpZ2hsaWdodGluZwoyYmFlZjgyY2QgcGF0Y2ggOS4yLjAz
OTY6IHRlc3RzOiBUZXN0X2Vycm9yX2NhbGxiYWNrX3Rlcm1pbmFsIGlzIGZsYWt5IG9uIG1hY09T
CmJmNjg5MmFhYSBydW50aW1lKGRvYyk6IFVwZGF0ZSBkb2N1bWVudGF0aW9uIG9uIDp6CjBjYTEx
MjFkMSBydW50aW1lKGhlbHApOiBtYWtlIGhlbHAgb21uaWZ1bmMgZ2xvYmFsCjhkOWMzODNhYSBw
YXRjaCA5LjIuMDM5NTogdGVzdHM6IFRlc3RfYmFja3Vwc2tpcCgpIG1heSByZWFkIGZyb20gJEhP
TUUKOGY5Y2RlNDU5IHBhdGNoIDkuMi4wMzk0OiB4eGQ6IG9mZnNldHMgZ3JlYXRlciB0aGFuIExP
TkdfTUFYIHByaW50IGFzIG5lZ2F0aXZlCjgwN2YyY2Q3OCBDSTogRml4IHN5bnRheCBlcnJvciBp
biBseWNoZWUgVVJMIGNoZWNrZXIKMWRlODg3NjgxIE5vIGd1aWRhbmNlIGZvciBBSSBjb2Rpbmcg
YWdlbnRzCmU3ZWVmNTU0ZiBDSTogQnVtcCB0aGUgZ2l0aHViLWFjdGlvbnMgZ3JvdXAgYWNyb3Nz
IDEgZGlyZWN0b3J5IHdpdGggMyB1cGRhdGVzCjBjMmFjMzQ4MCBwYXRjaCA5LjIuMDM5MzogTVMt
V2luZG93czogbGluayBlcnJvciB3aXRoIFhQTSBzdXBwb3J0IG9uIFVDUlQ2NAozMmEzMGNiNWEg
cnVudGltZShkb2MpOiBVcGRhdGUgZG9jcyBhYm91dCB0YWJwYW5lbAoxOTQwYmNiMjQgcGF0Y2gg
OS4yLjAzOTI6IHRlc3RzOiBTb21lIHRlc3RzIGFyZSBmbGFreQo1ZjdjNTI0MDggcnVudGltZShk
b2MpOiBVcGRhdGUgdGhlIGdhIG91dHB1dCB0byBtYXRjaCB0aGUgYWN0dWFsIG91dHB1dAoxMGI1
NzI5MGQgcGF0Y2ggOS4yLjAzOTE6IHRlc3RzOiBDb21tZW50IGluIHRlc3RfdmltOV9jbWQgYnJl
YWtzIHN5bnRheCBoaWdobGlnaHRpbmcKMGY5MjE4ODUxIHRyYW5zbGF0aW9uKHJ1KTogRml4IHR5
cG8gaW4gItC80L7QttC1IiB0byAi0LzQvtC20LXRgtC1IiBpbiBsYW5nL1JFQURNRS5ydS50eHQK
NTIxZWFjMTg3IHBhdGNoIDkuMi4wMzkwOiBmaWxldHlwZTogc29tZSBCZWFuY291bnQgZmlsZXMg
YXJlIG5vdCByZWNvZ25pemVkCjQ0ZjcwN2RhNiBwYXRjaCA5LjIuMDM4OTogREVDUlFNIHN0aWxs
IGxlYXZlcyBzdHJheSAicHAiIG9uIEFwcGxlIFRlcm1pbmFsLmFwcApmMTk0Njc2YzkgcGF0Y2gg
OS4yLjAzODg6IHN0cmFuZ2UgaW5kZW50IGluIHVwZGF0ZV90b3BsaW5lKCkKY2VlOGZkNzNlIHBh
dGNoIDkuMi4wMzg3OiBERUNSUU0gcmVxdWVzdCBtYXkgbGVhdmUgc3RyYXkgY2hhcnMgaW4gdGVy
bWluYWwKMmVhNGE3YzNiIHBhdGNoIDkuMi4wMzg2OiBObyBzY3JvbGwvc2Nyb2xsYmFyIHN1cHBv
cnQgaW4gdGhlIHRhYnBhbmVsCjEwMDQwYmM5YyBydW50aW1lKHNoKTogYWxsb3cgIiMiIGluIHNw
ZWNpYWwgZGVyZWZzCjMzZjM5NjUwOCBwYXRjaCA5LjIuMDM4NTogSW50ZWdlciBvdmVyZmxvdyB3
aXRoICJ6ZSIgYW5kIGxhcmdlICdzaWRlc2Nyb2xsb2ZmJwozOTE4ZjMyMzIgcnVudGltZShkb2Mp
OiBmaXggaW5jb3JyZWN0IGRlc2NyaXB0aW9uIG9mICdzY3JvbGxvZmZwYWQnCjE2ZDI4NTQ4ZCBy
dW50aW1lKGdyYXBocWwpOiBVcGRhdGUgc3ludGF4IHNjcmlwdCB0byBTZXB0ZW1iZXIgMjAyNSBz
cGVjCmQ0ZmIzMTc2MiBwYXRjaCA5LjIuMDM4NDogc3RhbGUgSW5zc3RhcnQgYWZ0ZXIgPENtZD4g
Y3Vyc29yIG1vdmUgYnJlYWtzIHVuZG8KNDA1ZTJmYjZkIHBhdGNoIDkuMi4wMzgzOiBbc2VjdXJp
dHldOiBydW50aW1lKG5ldHJ3KTogc2hlbGwtaW5qZWN0aW9uIHZpYSBzZnRwOiBhbmQgZmlsZTog
VVJMcwpkMGI2ZWUzMjAgcGF0Y2ggOS4yLjAzODI6IFdheWxhbmQ6IGZvY3VzLXN0ZWFsaW5nIGlz
IG5vbi13b3JraW5nCmVjM2Y3OWUwMyBwYXRjaCA5LjIuMDM4MTogVmltOTogTWlzc2luZyBjaGVj
a19zZWN1cmUoKSBpbiBleGVjX2luc3RydWN0aW9ucygpCmIzMjg2ODZkNiBwYXRjaCA5LjIuMDM4
MDogY29tcGxldGlvbjogYSBmZXcgaXNzdWVzIGluIGNvbXBsZXRpb24gY29kZQpmZTNjMjdjZTAg
cGF0Y2ggOS4yLjAzNzk6IGd1aS5jb2xvcl9hcHByb3ggaXMgbmV2ZXIgdXNlZAoxNDZkNWRhMGQg
cGF0Y2ggOS4yLjAzNzg6IFVzaW5nIGludCBhcyBib29sIHR5cGUgaW4gd2luX1Qgc3RydWN0CjNj
MzA1MGU2NCBwYXRjaCA5LjIuMDM3NzogVXNpbmcgaW50IGFzIGJvb2wgdHlwZSBpbiBndWlfVCBz
dHJ1Y3QKZjc0YTQxNjIwIHBhdGNoIDkuMi4wMzc2OiBWaW05OiBlbHNlaWYgY29uZGl0aW9uIGNv
bXBpbGVkIGluIGRlYWQgYnJhbmNoCmM5ZDRjMWRjNCBwYXRjaCA5LjIuMDM3NTogcHJvcF9maW5k
KCkgZG9lcyBub3QgZmluZCBhIHZpcnQgdGV4dCBpbiBzdGFydGluZyBsaW5lCmM2MjM0MmU1YyBw
YXRjaCA5LjIuMDM3NDogY19DVFJMLXtHLFR9IGRvZXMgbm90IGhhbmRsZSBvZmZzZXQKNDllODYz
MGEyIHBhdGNoIDkuMi4wMzczOiBDdHJsLVIgbWFwcGluZyBub3QgdHJpZ2dlcmVkIGR1cmluZyBj
b21wbGV0aW9uCjczYmEzNTNjOSBwYXRjaCA5LjIuMDM3MjogcHVtOiByZW5kZXJpbmcgaXNzdWVz
IHdpdGggbXVsdGlieXRlIHRleHQgYW5kIG9wYWNpdHkKMWM4OGFlZTFmIHJ1bnRpbWU6IFJlbW92
ZSB3cm9uZyBzeW4gb25lbGluZSBrZXl3b3JkIGZyb20gYSBmZXcgc3ludGF4IGZpbGVzCmIzMDgw
M2IyMyBwYXRjaCA5LjIuMDM3MTogZmlsZXR5cGU6IGdob3N0dHkgY29uZmlnIGZpbGVzIGFyZSBu
b3QgcmVjb2duaXplZAoyYzQzNmJlNmYgcGF0Y2ggOS4yLjAzNzA6IGR1cGxpY2F0ZSBjb2RlIHdp
dGggbGl0ZXJhbCBzdHJpbmdfVCBhc3NpZ25tZW50CjZlY2ZmNzgxMiBwYXRjaCA5LjIuMDM2OTog
bXVsdGlwbGUgZGVmaW5pdGlvbnMgb2YgU1RSSU5HX0lOSVQgbWFjcm8KYzEzMjMyNjk5IHBhdGNo
IDkuMi4wMzY4OiB0b28gbWFueSBzdHJsZW4oKSBjYWxscyB3aGVuIGFkZGluZyBzdHJpbmdzIHRv
IGRpY3RzCjcyM2MwYWNmMiBwYXRjaCA5LjIuMDM2NzogcnVudGltZShuZXRydyk6IH4gbm90ZSBl
eHBhbmRlZCBvbiBNUyBXaW5kb3dzCjIzN2Q3N2UwNyBwYXRjaCA5LjIuMDM2NjogcHVtOiBmbGlj
a2VyIHdoZW4gdXBkYXRpbmcgcHVtIGluIHBsYWNlCjE5NjZhMWM4OSBwYXRjaCA5LjIuMDM2NTog
dXNpbmcgaW50IGFzIGJvb2wKNjE4YTMyN2NlIHBhdGNoIDkuMi4wMzY0OiB0ZXN0czogdGVzdF9z
bW9vdGhzY3JvbGxfdGV4dG9mZl9zaG93YnJlYWsoKSBmYWlscwpmMmU5MjAzMjEgcGF0Y2ggOS4y
LjAzNjM6IFZpbTk6IHZhcmlhYmxlIHNoYWRvd2VkIGJ5IHNjcmlwdC1sb2NhbCBmdW5jdGlvbgow
ZTMxZmIwMjQgcGF0Y2ggOS4yLjAzNjI6IGRpdmlzaW9uIGJ5IHplcm8gd2l0aCBzbW9vdGhzY3Jv
bGwgYW5kIHNtYWxsIHdpbmRvd3MKMzM2NTMzYjM1IENJOiBCdW1wIHRoZSBnaXRodWItYWN0aW9u
cyBncm91cCBhY3Jvc3MgMiBkaXJlY3RvcmllcyB3aXRoIDQgdXBkYXRlcwowMWQ5YTE5NTEgcGF0
Y2ggOS4yLjAzNjE6IHRlc3RzOiBubyB0ZXN0cyBmb3IgY2hfbGlzdGVuKCkgd2l0aCBJUHMKMzBk
NDI4NTVlIHJ1bnRpbWUodmltOSk6IHJlbW92ZSBleHRyYSBlc2NhcGluZyBpbiBPcGVuCmU2NjY1
OTc2MiBydW50aW1lKGRvYyk6IG1ha2Ugd2luZG93IG9wdGlvbiBkZXNjcmlwdGlvbiBhIGJpdCBs
ZXNzIHZhZ3VlCjY4ZDMxMjlhMCBydW50aW1lKGRqYW5nbyk6IFJlbW92ZWQgdW5zdXBwb3J0ZWQg
dGVtcGxhdGUgc3RhdGVtZW50cyBhbmQgZmlsdGVycyBieSBjdXJyZW50IExUUy4KOGJjYWUzY2E1
IHJ1bnRpbWUoZGphbmdvKTogQWRkIG1pc3NpbmcgZGphbmdvU3RhdGVtZW50IGBnZXRfbGFuZ3Vh
Z2VfaW5mb2AuCjZiMjZhZmVhMyBydW50aW1lKGRqYW5nbyk6IEFkZCBtaXNzaW5nIHN0YXRlbWVu
dHMgYW5kIGZpbHRlcnMuCjQ1MDg5NWQ4NiBydW50aW1lKG1ha2UpOiBmaXggd3JvbmcgaGlnaGxp
Z2h0aW5nIHdpdGggJCBpbnNpZGUgZG91YmxlIHF1b3RlcwoxYzI5OWYyNjMgcGF0Y2ggOS4yLjAz
NjA6IENhbm5vdCBoYW5kbGUgbW91c2UtY2xpY2tzIGluIHRoZSB0YWJwYW5lbAoyNWU5ZmM0NGEg
cGF0Y2ggOS4yLjAzNTk6IHdyb25nIFZlcnRTcGxpdE5DIGhpZ2hsaWdodGluZyBvbiB3aW5iYXIK
YjA3NmM0OTI4IHBhdGNoIDkuMi4wMzU4OiBydW50aW1lKHZpbWJhbGwpOiBzdGlsbCBwYXRoIHRy
YXZlcnNhbCBhdHRhY2tzIHBvc3NpYmxlCmFiMDJkNjViMSBydW50aW1lKGd6aXApOiBSZW1vdmUg
Y29tcGF0aWJpbGl0eSBmYWxsLWJhY2tzLCBoYXJkZW4gcmFuZG9tIGZpbGVuYW1lIGdlbmVyYXRp
b24KMjFjMGNkMjlmIHJ1bnRpbWUobmV0cncpOiBhZGQgbWlzc2luZyBlc2NhcGUoKSBjYWxscwpl
NmE4NGJiNmIgcnVudGltZSh0YXIpOiBtaXNzaW5nIGc6dGFyX3NlY3VyZSBpbiB0YXIjRXh0cmFj
dCgpCmM3ODE5NGU0MSBwYXRjaCA5LjIuMDM1NzogW3NlY3VyaXR5XTogY29tbWFuZCBpbmplY3Rp
b24gdmlhIGJhY2t0aWNrcyBpbiB0YWcgZmlsZXMKYTQxNDYzMDM5IHBhdGNoIDkuMi4wMzU2OiBD
YW5ub3QgYXBwbHkgJ3Njcm9sbG9mZicgY29udGV4dCBsaW5lcyBhdCBlbmQgb2YgZmlsZQo0OTBi
NzM3ZjMgcGF0Y2ggOS4yLjAzNTU6IHJ1bnRpbWUodGFyKTogbWlzc2luZyBwYXRoIHRyYXZlcnNh
bCBjaGVja3MgaW4gdGFyI0V4dHJhY3QoKQowZTAyYmUxOTEgcGF0Y2ggOS4yLjAzNTQ6IGZpbGV0
eXBlOiBub3QgYWxsIEJpdGJha2UgaW5jbHVkZSBmaWxlcyBhcmUgcmVjb2duaXplZAoyMDQxNDc4
ZTIgcnVudGltZShiaXRiYWtlKTogc3VwcG9ydCBmb3J3YXJkLXNsYXNoZXMgaW4gYml0YmFrZSB2
YXJmbGFncwo3Y2M3M2E2YzYgcGF0Y2ggOS4yLjAzNTM6IE1pc3Npbmcgb3V0LW9mLW1lbW9yeSBj
aGVjayBpbiByZWdpc3Rlci5jCjYwZTkyNWNhMCBydW50aW1lKGRvYyk6IFR3ZWFrIGRvY3VtZW50
YXRpb24gc3R5bGUgaW4gY2hhbm5lbC50eHQKMjI1MmQyYzFlIHBhdGNoIDkuMi4wMzUyOiAnd2lu
aGlnaGxpZ2h0JyBvZiBsZWZ0IHdpbmRvdyBibGVuZHMgaW50byByaWdodCB3aW5kb3cKYmZhNDZh
NTJmIHBhdGNoIDkuMi4wMzUxOiByZXBlYXRfc3RyaW5nKCkgY2FuIGJlIGltcHJvdmVkCjM1MWEx
NmM4OCBydW50aW1lKHppcCk6IGFsc28gYmxvY2sgc2luZ2xlIGxlYWRpbmcgc2xhc2ggYW5kIGFi
c29sdXRlIHBhdGhzIGluIEV4dHJhY3QKNGMyODc5NDcxIHBhdGNoIDkuMi4wMzUwOiBFbmFibGlu
ZyBtb2RlbGluZXMgcG9zZXMgYSByaXNrCmM3MjE5NjUyOSBwYXRjaCA5LjIuMDM0OTogY2Fubm90
IHN0eWxlIG5vbi1jdXJyZW50IHdpbmRvdyBzZXBhcmF0b3IKOTFiNDAyZjU3IHBhdGNoIDkuMi4w
MzQ4OiBwb3RlbnRpYWwgYnVmZmVyIHVuZGVycnVuIHdoZW4gc2V0dGluZyBzdGF0dXNsaW5lIGxp
a2Ugb3B0aW9uCmY5Y2IwZDE0ZCBDSTogU2VwYXJhdGUgb3V0IEFTYW4gdGVzdHMKMzk4NzVkYWVj
IHBhdGNoIDkuMi4wMzQ3OiBWaW05OiBzY3JpcHQtbG9jYWwgdmFyaWFibGUgbm90IGZvdW5kCmM0
ZmUxZTk1OCBwYXRjaCA5LjIuMDM0NjogV3JvbmcgY3Vyc29yIHBvc2l0aW9uIHdoZW4gZW50ZXJp
bmcgY29tbWFuZCBsaW5lIHdpbmRvdwplZmJkNDgyMTEgcGF0Y2ggOS4yLjAzNDU6IFdyb25nIGF1
dG9mb3JtYXR0aW5nIHdpdGggJ2F1dG9jb21wbGV0ZScKOTYyYTU0MGQ3IHBhdGNoIDkuMi4wMzQ0
OiBjaGFubmVsOiBjaF9saXN0ZW4oKSBjYW4gYmluZCB0byBuZXR3b3JrIGludGVyZmFjZQo0YjZm
M2YxZDEgcnVudGltZShkb2MpOiBUd2VhayBkb2N1bWVudGF0aW9uIHN0eWxlIGluIG9wdGlvbnMu
dHh0CjlkOTU0MTBhYSBwYXRjaCA5LjIuMDM0MzogdGVzdHM6IHRlc3RfY2xpZW50c2VydmVyIG1h
eSBmYWlsIG9uIHNsb3dlciBzeXN0ZW1zCmM5MjIyMDJlYSBwYXRjaCA5LjIuMDM0MjogdGVzdHM6
IHRlc3RfZXhjbWQudmltIGxlYXZlcyBzd2FwZmlsZXMgYmVoaW5kCmZjYzQyNzZkYiBwYXRjaCA5
LjIuMDM0MTogc29tZSBmdW5jdGlvbnMgY2FuIGJlIHJ1biBmcm9tIHRoZSBzYW5kYm94CjY4MzY1
OTk3MyBydW50aW1lKHppcCk6IERldGVjdCBwYXRoIHRyYXZlcnNhbCBpc3N1ZXMgb24gV2luZG93
cwo4NmRjYjE4NzggUmV2ZXJ0ICJydW50aW1lKGpqZGVzY3JpcHRpb24pOiBhbGxvdyB0byBjb25m
aWd1cmUgc3VtbWFyeSB3aWR0aCIK
--0000000000007139cf0651cca2fc--

