Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B21BFC9EF8
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 10:52:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6935.1772880748628118126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 02:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K4qAWmia;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so4052397f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 02:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772880747; x=1773485547; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YFEtbHfH8G2cjFZFKXYtI7NfyiGrincaKR/n+h8+vrg=;
        b=K4qAWmiaFlyyaAH5k+IzEUjDi/PVF06JCSzvPW0L3vGOrKqpRIwcR5u3byYH2KSsub
         owiJhsSQK2GpOdhuPmpSL2onzPr0p+s3fAA/piNvexxu03OyA7oD/POoK1dW6Fa5vL2a
         sLV1bPxMLruzOE8jZIdzsu0kU0W09F/orE1LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772880747; x=1773485547;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFEtbHfH8G2cjFZFKXYtI7NfyiGrincaKR/n+h8+vrg=;
        b=Usqp3sX7TNZ8Iyfl1oNWz+EPNPvtDDSsFAuISiP6WEKOwkpwpN2LaPsWqPGCYqkMfs
         OJguJb/0CwomjRJTIe5DPeBzJC+IKZWxbYWhfVmPFsUNkYuCc+G/HLy8j/TarmLyqyGO
         CVBvM3gpX0zBUeh9UTPkqCoYg7zZQc2Nhch34+ep+QhCBzjeNabJz7snjb9v9Je/Aolw
         Vdvo7W7YQl6dCAuyg8LNsCQxKvECcZYV2wZFziEJ1rFgT65Yw3fYIK4fuT5fK9BwARuL
         wOgw3PZWMWZrMz0KRQaT8NYiECELNaiP7Jh7i8kCJOt4+h+jE9Cg/gamNx6Lj0k/hDOF
         MVWA==
X-Forwarded-Encrypted: i=1; AJvYcCWUALIg9/MXRCwf1sAcojiwbyGH0i5xuMw/En9CBqfDWQLDRi7AbEBj3vOK5qIQ8h31Lh+aPTyex/6FJ6TboJdrGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPJpA4jHv4MsVv8qkPYn7cHRf9rNxc/A8rP0xL+ek/EkI1gvKG
	Ss/u0TsBeiTfiVXwzL3+EJePP2GBZZgvJTPHChoGGfzMwV6GjE7n3gDjZol8JuO2j5M=
X-Gm-Gg: ATEYQzxFx4Dg2nTz8/f5NiueNPYAiqbvFLcRZGr6SMcsPbEmSBD794ZtKPK4MwiDIcL
	ytTqY92eLC+7w/2GGTEmRDt0mzJkAXINd9ivBFAFken0jCLKsLdXYnrAdkCcfNyV1LizVU31kCy
	N5VYqg+npbBLV+yeIDy0vEUx8GuR2rGaWAP8k3B0MZ7aB5lPxXBBvTBSWIq0k+yN3siZqOlbgLD
	pvyeLOBdFEKLD3WRFj8IprYFkeONfNs1PENwk94OytFvTVorHiLMhx6F6LqlEyOr04VehH5UxAp
	guo9MkrEruo51R8GMfPSntn7dg36Nv2WgYdioKZ/0n9chiUwaQsbD/HWSDJAGj3udH6W2HleDhW
	ARFiojzbiDahXOslGi4PjyWOR4zJsl8mA6Tiz/mpzLGBqNG1QjuQADSzhDo80OzFrOXdsxx9oXz
	3CI146/72oHwkLUH+G5AWFhzKWm3SC4+l+vUNvIFIQXJmgh7l5+tcfwMyCKVOKGP2Xq+EisAMQI
	lymlWbv2sBrApXoHDzffCp5qg==
X-Received: by 2002:a05:6000:2881:b0:439:bb42:dbde with SMTP id ffacd0b85a97d-439da65531cmr9618684f8f.23.1772880746855;
        Sat, 07 Mar 2026 02:52:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d746:2cdc:e7ea:aa72? ([2001:8b0:aba:5f3c:d746:2cdc:e7ea:aa72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada3b43sm10306873f8f.13.2026.03.07.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:52:26 -0800 (PST)
Message-ID: <3ffcb3c8167d44ef76d9c4f633fe17b93ae2e15c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/runtime/ptest: Use a timeout with
 command, remove disabling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Anibal Limon
	 <anibal@limonsoftware.com>
Date: Sat, 07 Mar 2026 10:52:25 +0000
In-Reply-To: <DGVOBJODEHCK.15P1KY3F0CAFC@bootlin.com>
References: <20260304184156.2025539-1-richard.purdie@linuxfoundation.org>
	 <DGVOBJODEHCK.15P1KY3F0CAFC@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 10:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232611

On Fri, 2026-03-06 at 12:47 +0100, Mathieu Dubois-Briand wrote:
> On Wed Mar 4, 2026 at 7:41 PM CET, Richard Purdie via lists.openembedded.=
org wrote:
> > A simple 'which' call doesn't need the timeout disabling. This was like=
ly
> > a copy and paste error and can be removed.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runti=
me/cases/ptest.py
> > index 1a0782374d0..2887e136719 100644
> > --- a/meta/lib/oeqa/runtime/cases/ptest.py
> > +++ b/meta/lib/oeqa/runtime/cases/ptest.py
> > @@ -35,7 +35,7 @@ class PtestRunnerTest(OERuntimeTestCase):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.do_ptestrunner()
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 def do_ptestrunner(self):
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status, output =3D self.tar=
get.run('which ptest-runner', 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status, output =3D self.tar=
get.run('which ptest-runner')
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if status !=3D 0:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.skipTest("No -ptest packages are installed in the image")
> > =C2=A0
>=20
> Hi Richard,
>=20
> I believe this is causing some ptest failures on riscv64:
>=20
> Traceback (most recent call last):
> =C2=A0 File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/o=
penembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wra=
pped_f
> =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^=
^^^^^^^^^
> =C2=A0 File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/o=
penembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wra=
pped_f
> =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^=
^^^^^^^^^
> =C2=A0 File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/o=
penembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wra=
pped_f
> =C2=A0=C2=A0=C2=A0 return func(*args, **kwargs)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^=
^^^^^^^^^
> =C2=A0 File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/o=
penembedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_pt=
estrunner_expectfail
> =C2=A0=C2=A0=C2=A0 self.do_ptestrunner()
> =C2=A0 File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/o=
penembedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 63, in do_ptes=
trunner
> =C2=A0=C2=A0=C2=A0 status, output =3D self.target.run('ptest-runner -t {}=
 -d \"{}\"'.format(ptest_timeout, ' '.join(ptest_dirs)), timeout=3Dint(ptes=
t_timeout)+30)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
> =C2=A0 File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/o=
penembedded-core/meta/lib/oeqa/core/target/ssh.py", line 98, in run
> =C2=A0=C2=A0=C2=A0 status, output =3D self._run(sshCmd, processTimeout, i=
gnore_status, raw, ignore_ssh_fails)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> =C2=A0 File "/srv/pokybuild/yocto-worker/qemuriscv64-ptest/build/layers/o=
penembedded-core/meta/lib/oeqa/core/target/ssh.py", line 70, in _run
> =C2=A0=C2=A0=C2=A0 raise AssertionError("ssh exited with status '255' for=
 command "
> AssertionError: ssh exited with status '255' for command '['ssh', '-l', '=
root', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', '=
-o', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', =
'-o', 'LogLevel=3DERROR', '192.168.7.14', 'export PATH=3D/usr/sbin:/sbin:/u=
sr/bin:/bin; ptest-runner -t 450 -d "/usr/lib"']': this is likely an SSH fa=
ilure
>=20
> Process killed - no output for 480 seconds. Total running time: 485 secon=
ds.
>=20
> Cannot run ptests without @expectedFailure as ptests are expected to fail
> WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: Can not retrieve arti=
facts from test target: Error while fetching compressed artifacts
>=20
> And similar errors:
>=20
> WARNING: core-image-ptest-coreutils-1.0-r0 do_testimage: Can not retrieve=
 artifacts from test target: Error while fetching compressed artifacts
> Cannot run ptests without @expectedFailure as ptests are expected to fail
>=20
> WARNING: core-image-ptest-gettext-1.0-r0 do_testimage: Can not retrieve a=
rtifacts from test target: Error while fetching compressed artifacts
> Cannot run ptests without @expectedFailure as ptests are expected to fail
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1182

Thanks. I think this has lead to an interesting discovery of an
additional issue in ptest-runner with buffering of logs when used non-
interactively.

I've sent a patch to ptest-runner which I believe will address this
issue.

Cheers,

Richard


