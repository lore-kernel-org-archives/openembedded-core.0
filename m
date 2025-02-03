Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5776C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:19:18 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.85448.1738581550846730920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IXshm1i3;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7be8efa231aso437035585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738581550; x=1739186350; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl2aFNrZ5JGe7S+uTKJ60HqPvq25b4rGV/AE4G2qRGI=;
        b=IXshm1i3g1ez3kowrGNu5c14/tIw/X1HUkhquZAdbyu9WaxD2bQlgq4hjrQmM1E1C2
         AlNFaTMRYHFErZ2OrHwYE7yD/DQhzSAvDxpN8iP/+fbrxRDChfaAKLoLZaA5tJWpbIiZ
         KnI/PNReQlX2Lc7DmxpJVQO/k82kk3UNPT3YoXB/rL288NFw2fnWJJR917Ur80+vkEQj
         +Cf54SYTIDPNPr8XHZuIaRl21N8ZMAJWQMB3nAYddO9ANtFdpilEBa0HjxXyNreraYB1
         GRHTT+bbiSUSJ9rljSvdg1WqClHi1eI1JjC/8zCsKLvA83cE5yo1Iw1fafsjor2YnxYo
         pXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581550; x=1739186350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wl2aFNrZ5JGe7S+uTKJ60HqPvq25b4rGV/AE4G2qRGI=;
        b=qp1hFhiIRvUglmnf8FADKVl8hauFOlH63pxFp7dTaOTH/vIEsRr+8am7Wf9BN6eL+O
         Fd3A8bDhozoti/5ui9AUK3wS4NOS+decoI4oUixg1/OHCPujjW03g1bQyXDATFu+UFJM
         eK/0cPYWE/uj7AJ6g8j/zUReFf9DxTqVF6Bxk5hz7zmsh2rfulPGd70ST20xHGryOKEZ
         HzNWPdnXhhrdWjnguL7UhcfZS4BStOS7x5ofk1ldr7o4aVYBIIqJmrWbfjMcX2y7m/Du
         iI1S0wsIjNVpJRgvrDSfRraX1884vWIXuMehY3KZU9+7yVvUry1jbppl/Wyv3erE48wl
         /qWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsTN45Q2u0eMi8dGuz/DlyBCIxaOBwO4NYSgQ2qs+0ujvpZj+PEgR7csJv7/dyeojnHx7SMnlYQvPzSs5UFfgOig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTMMSC9K86fn+vPXtmj9OGWZ7C+/z8pyJWkc1GRCQ/iN2igc9A
	6t7I6a6rBqtbaevd9X4m3hzz8W3vrhBQn7GaDfwOwaFbe1S2URC2iJtkfzMBhCUdM1EoNhkgO28
	WcQr6e3rzyqt/hNi13AS4QwHWqIQ=
X-Gm-Gg: ASbGncvLANnSxqdTHfsty/v7YdA3aSxBpW0Vcc77MHhhnKyg1XwHToaBJ8UfM5Wj4B0
	w5cuoJ0xqmryH1x+VFhZ3LxjUCsE0uxBYMXRvtlWhBPzvRlDvYCZgH45UKJeZvdJmUujGktO8Xj
	LyXbB/Ax/ejOri7Z9KwuFiuRj10wi58KE=
X-Google-Smtp-Source: AGHT+IFdrDTk4QJX+PTxz8BmaeZjMy9I/oZX69XS3smk8JQY9q7PAF9F8zqOlu9yMJmIDkeK1v/c2oOmMjCp5ZFAEh0=
X-Received: by 2002:a05:620a:3949:b0:7b6:d870:ca2d with SMTP id
 af79cd13be357-7bffcce22eamr3270140485a.13.1738581549794; Mon, 03 Feb 2025
 03:19:09 -0800 (PST)
MIME-Version: 1.0
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com> <20250131064352.2613105-1-zboszor@gmail.com>
 <20250131064352.2613105-2-zboszor@gmail.com> <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
 <182057ACF258490B.1760@lists.openembedded.org> <e75d75e4-2b55-4199-b2ee-e9eb26abafca@gmail.com>
In-Reply-To: <e75d75e4-2b55-4199-b2ee-e9eb26abafca@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 12:18:58 +0100
X-Gm-Features: AWEUYZmpqNKcKUkP_ABhuXgdMXBUMCOU-17ZFMb3wB8ohB8-L7vFRExUFh5vYZ0
Message-ID: <CANNYZj__itq2zLjW2_ZN4zGw0dvw2oYhXtSVGBOxpKEqZkmALQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210643

I would recommend you send this change as a proper patch. You should
not be asking integrators to produce patches out of ad hoc mailing
list tweaks.

Alex

On Mon, 3 Feb 2025 at 11:11, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
>
> 2025. 02. 02. 9:44 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openemb=
edded.org =C3=ADrta:
> > 2025. 02. 01. 15:37 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADrta:
> >> On Fri Jan 31, 2025 at 7:43 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi wrote:
> >>> Enable building rpm with rpm-seqouia for the test.
> >>>
> >>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >>> ---
> >> Sorry, I still get some errors while building:
> >>
> >> 2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/618 (56.20=
s) (0 failed)
> >> (signing.Signing.test_signing_packages)
> >> 2025-02-01 14:28:32,979 - oe-selftest - INFO -
> >> testtools.testresult.real._StringException: Traceback (most recent cal=
l last):
> >>    File
> >> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/se=
lftest/cases/signing.py",
> >> line 113, in test_signing_packages
> >>      runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
> >>    File
> >> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/ut=
ils/commands.py",
> >> line 214, in runCmd
> >>      raise AssertionError("Command '%s' returned non-zero exit status =
%d:\n%s" %
> >> (command, result.status, exc_output))
> >> AssertionError: Command
> >> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811=
/tmp/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-native/usr/bin/rpmke=
ys
> >> --define "_dbpath /tmp/oeqa-rpmdbsj05eco3" --import
> >> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/=
meta-selftest/files/signing/key.pub'
> >> returned non-zero exit status 1:
> >> error: Certificate 7B31316B5D64AD52:
> >>    Policy rejects 7B31316B5D64AD52: No binding signature at time 2025-=
02-01T14:28:26Z
> >> error:
> >> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/=
meta-selftest/files/signing/key.pub:
> >> key 1 import failed.
> >>
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/893=
/steps/14/logs/stdio
> >>
> >> Do you mind having a look at this ?
> >
> > I have run the self test on a Fedora 41 host and it succeeded there.
> >
> > Probably you need to fix the crypto policy to allow such a cert with a
> > "no binding signature" or replace the cert.
> >
> > This github issue may have some useful pointers:
> > https://github.com/rpm-software-management/rpm-sequoia/issues/46
>
> Can you please try this below?
>
> Setting the envvar SEQUOIA_CRYPTO_POLICY to an empty string
> will use the built-in default policy. See
> https://github.com/rpm-software-management/rpm-sequoia/blob/main/src/lib.=
rs#L54
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/self=
test/cases/signing.py
> index 51d1c3fa64..9a820ebc72 100644
> --- a/meta/lib/oeqa/selftest/cases/signing.py
> +++ b/meta/lib/oeqa/selftest/cases/signing.py
> @@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
>           """
>           import oe.packagedata
>
> -        self.skipTest('This test requires rpm-sequoia support in rpm')
>           self.setup_gpg()
>
>           package_classes =3D get_bb_var('PACKAGE_CLASSES')
> @@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):
>           feature +=3D 'RPM_GPG_PASSPHRASE =3D "test123"\n'
>           feature +=3D 'RPM_GPG_NAME =3D "testuser"\n'
>           feature +=3D 'GPG_PATH =3D "%s"\n' % self.gpg_dir
> +        feature +=3D 'PACKAGECONFIG:append:pn-rpm-native =3D " sequoia"\=
n'
> +        feature +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'
>
>           self.write_config(feature)
>
> +        # Test rpm-sequoia's default built-in policy
> +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> +
>           bitbake('-c clean %s' % test_recipe)
>           bitbake('-f -c package_write_rpm %s' % test_recipe)
>
> @@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):
>
>           self.write_config(feature)
>
> +        # Test rpm-sequoia's default built-in policy
> +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> +
>           with self.create_new_builddir(os.environ['BUILDDIR'], builddir)=
:
>
>               os.environ["PATH"] =3D nsysroot + ":" + os.environ["PATH"]
> @@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):
>           feature +=3D 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "warn"\n'
>           self.write_config(feature)
>
> +        # Test rpm-sequoia's default built-in policy
> +        os.environ['SEQUOIA_CRYPTO_POLICY'] =3D ''
> +
>           # Build a locked recipe
>           bitbake(test_recipe)
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> It succeeded for me:
>
> $ oe-selftest -r signing
> ...
> 2025-02-03 10:53:11,900 - oe-selftest - INFO - oe-selftest () - Ran 3 tes=
ts in 2801.617s
> 2025-02-03 10:53:11,900 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests
> passed (successes=3D3, skipped=3D0, failures=3D0, errors=3D0)
>
> As for an actual crypto policy for rpm-sequoia, I am not sure
> how appropriate it would be to create a recipe for Fedora's
> crypto-policies package in Yocto.
>

