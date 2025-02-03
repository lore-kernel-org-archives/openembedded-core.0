Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C61CC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 12:29:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.86383.1738585782224670775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 04:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZWhMkcWG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-438a39e659cso29725445e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 04:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738585780; x=1739190580; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vYdqXnoeh32UM6DLmN0OCK688GtTsv0YVg0moy6ZTzE=;
        b=ZWhMkcWGKQWR71RXNc1YEk3G1f4Y8wYWpYAvb5jSNLp9CPAFQYfK7Jf06tjwDgTnLB
         E3znoNwfIAPPozNZbEDbyCzLf7B13BI4vd3VHM6ygmJh5z/puI8FM32uoimr1LgECOO9
         yy98YfYnmrAq/M3nLng5azBZWChGuEYxATYJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585780; x=1739190580;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYdqXnoeh32UM6DLmN0OCK688GtTsv0YVg0moy6ZTzE=;
        b=KVNc1fWm1mTw+ZRDASe3BLOPUcWXBvd17C3Cujtmof7i1lSDIbWODCqUAwdn0e87qo
         1xFO2p+OBAs6KbS6xES6pHSMRU5m9CKIDv8u2qEHnJgm8Z/4C/EghsRdMS2H/sFtSu8I
         DNoXrlDqY+YLELN7+3Mr/hcPU814QFqwTlJTR7qdRbBXhH/JWqQQgn/ZX1x3zc6lfwoA
         NzqCIzY5EMRCvrzwoIXNUSF9UPp24n0KVk9zYmH+vYHmFia8GlQa1A3CvIG3eULk+el8
         XwRd3zhtxuHI3Wq0vFDkTa0/WOHB/oyStOA11gyj5OeCD3IwOxWAWismF/B1mOSkD+s4
         WLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVae0HTuSNml+xkHaq166T3177Y3MDu2FgigFyI9VBhn/2bqapnRxAoUnvx1GxL4UM5gS/QTsZVGbQfbSVjLP/csQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfEk20EkPJ/7y6pxPqTt1qlmvZaRl55qthDHP1amTjazbhQys3
	Kj4ICCy0KLFWte7jjdfNP0otTEUJW20xXd2tlOril8DY3FlJ7EGFgVqI5K2J1wc=
X-Gm-Gg: ASbGncuaq+KdF/9SjPyrWYc2SWM/YCjPkYfm3zkeXsLq6W23m/fJZ1o1KSd0yhGfuS5
	fUlTfBh4NP+2/H4+5fgxORXoq4/OdGu3zgfeYce4gal4JYuXBRZszpga3w2+a4eSftXC+diX4Z3
	XIaJtJX0p5UGNJVZmci2zkxGR1lvVHGQipHaWIBt6sPyjgKCSiYhIiT/2l3qIhyeK1JnuVo1+w7
	SuqrH0eEwuAvvAn8oCPmwk77RMSPaYic1S+F6kQxCLdm4wSo8T/y5ksVz7zon08fEQiyUHRGawx
	YhJKGI9a8AOTDZNfVWi/6ITIhPhWwgeiN8sA4ORE/4JVXCkde/cgqeIknYP5JrOIOsJT7nVAu67
	CJjYf
X-Google-Smtp-Source: AGHT+IGHZpEX8SuWhAgp5xJlQGrfdU4KXX7SKiOJt5Pq4EhC30m34gC19ca/t5ZuHPk23A+M9qAhHA==
X-Received: by 2002:a5d:6d85:0:b0:382:4b52:ffcc with SMTP id ffacd0b85a97d-38c516664cfmr18528267f8f.0.1738585780603;
        Mon, 03 Feb 2025 04:29:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:41c1:3919:865f:692c? ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f4a8sm155666115e9.37.2025.02.03.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:29:39 -0800 (PST)
Message-ID: <3bf14d26684e308ed7fa7c1e1448be109a2efa61.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py:
 Re-enable self-test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zboszor@gmail.com, Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 03 Feb 2025 12:29:38 +0000
In-Reply-To: <e75d75e4-2b55-4199-b2ee-e9eb26abafca@gmail.com>
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
	 <20250131064352.2613105-1-zboszor@gmail.com>
	 <20250131064352.2613105-2-zboszor@gmail.com>
	 <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
	 <182057ACF258490B.1760@lists.openembedded.org>
	 <e75d75e4-2b55-4199-b2ee-e9eb26abafca@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 12:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210651

On Mon, 2025-02-03 at 11:11 +0100, Zoltan Boszormenyi via lists.openembedde=
d.org wrote:
> 2025. 02. 02. 9:44 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openemb=
edded.org =C3=ADrta:
> > 2025. 02. 01. 15:37 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADrta:
> > > On Fri Jan 31, 2025 at 7:43 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi wrote:
> > > > Enable building rpm with rpm-seqouia for the test.
> > > >=20
> > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> > > > ---
> > > Sorry, I still get some errors while building:
> > >=20
> > > 2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/618 (56.2=
0s) (0 failed)=20
> > > (signing.Signing.test_signing_packages)
> > > 2025-02-01 14:28:32,979 - oe-selftest - INFO -=20
> > > testtools.testresult.real._StringException: Traceback (most recent ca=
ll last):
> > > =C2=A0=C2=A0 File=20
> > > "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/s=
elftest/cases/signing.py",=20
> > > line 113, in test_signing_packages
> > > =C2=A0=C2=A0=C2=A0=C2=A0 runCmd('%s/rpmkeys --define "_dbpath %s" --i=
mport %s' %
> > > =C2=A0=C2=A0 File=20
> > > "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/u=
tils/commands.py",=20
> > > line 214, in runCmd
> > > =C2=A0=C2=A0=C2=A0=C2=A0 raise AssertionError("Command '%s' returned =
non-zero exit status %d:\n%s" %=20
> > > (command, result.status, exc_output))
> > > AssertionError: Command=20
> > > '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-325081=
1/tmp/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-native/usr/bin/rpmk=
eys=20
> > > --define "_dbpath /tmp/oeqa-rpmdbsj05eco3" --import=20
> > > /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811=
/meta-selftest/files/signing/key.pub'=20
> > > returned non-zero exit status 1:
> > > error: Certificate 7B31316B5D64AD52:
> > > =C2=A0=C2=A0 Policy rejects 7B31316B5D64AD52: No binding signature at=
 time 2025-02-01T14:28:26Z
> > > error:=20
> > > /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811=
/meta-selftest/files/signing/key.pub:=20
> > > key 1 import failed.
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/89=
3/steps/14/logs/stdio
> > >=20
> > > Do you mind having a look at this ?
> >=20
> > I have run the self test on a Fedora 41 host and it succeeded there.
> >=20
> > Probably you need to fix the crypto policy to allow such a cert with a
> > "no binding signature" or replace the cert.
> >=20
> > This github issue may have some useful pointers:
> > https://github.com/rpm-software-management/rpm-sequoia/issues/46
>=20
> Can you please try this below?
>=20
> Setting the envvar SEQUOIA_CRYPTO_POLICY to an empty string
> will use the built-in default policy. See
> https://github.com/rpm-software-management/rpm-sequoia/blob/main/src/lib.=
rs#L54
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/self=
test/cases/signing.py
> index 51d1c3fa64..9a820ebc72 100644
> --- a/meta/lib/oeqa/selftest/cases/signing.py
> +++ b/meta/lib/oeqa/selftest/cases/signing.py
> @@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import oe.packaged=
ata
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.skipTest('This test requ=
ires rpm-sequoia support in rpm')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.setup_gpg()
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_classes =
=3D get_bb_var('PACKAGE_CLASSES')
> @@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D 'RPM_=
GPG_PASSPHRASE =3D "test123"\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D 'RPM_=
GPG_NAME =3D "testuser"\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D 'GPG_=
PATH =3D "%s"\n' % self.gpg_dir
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D 'PACKAGECONFIG:a=
ppend:pn-rpm-native =3D " sequoia"\n'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D 'PACKAGECONFIG:a=
ppend:pn-rpm =3D " sequoia"\n'
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(=
feature)
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test rpm-sequoia's default =
built-in policy
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ['SEQUOIA_CRYPTO_PO=
LICY'] =3D ''
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('-c clean =
%s' % test_recipe)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('-f -c pac=
kage_write_rpm %s' % test_recipe)
>=20
> @@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(=
feature)
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test rpm-sequoia's default =
built-in policy
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ['SEQUOIA_CRYPTO_PO=
LICY'] =3D ''
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with self.create_n=
ew_builddir(os.environ['BUILDDIR'], builddir):
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 os.environ["PATH"] =3D nsysroot + ":" + os.environ["PATH"]
> @@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature +=3D 'SIGG=
EN_LOCKEDSIGS_TASKSIG_CHECK =3D "warn"\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(=
feature)
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Test rpm-sequoia's default =
built-in policy
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.environ['SEQUOIA_CRYPTO_PO=
LICY'] =3D ''
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Build a locked r=
ecipe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake(test_recip=
e)

Given the way bitbake clears the environment except for allowed
variables, will that setting make it to where it needs to?

I've not looked at the specific test so it is possible it can work but
it looks a bit unusual to me.

Cheers,

Richard

