Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.7665.1621937653710417431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 03:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=GbkZzIGn;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1045)
	id E086820B7188; Tue, 25 May 2021 03:14:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E086820B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1621937652;
	bh=8WbRUK3RYj2e/NyNREH4x4vCb8ILA1TQyZ1aq4GHZzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbkZzIGn+hhKTPt5tpPMbU0+IU6OjdJVVIPpipS59+UeQYqRm7OYNiSzFxQ+wij9e
	 7Ynvb9EVB0fvKoSHhyY2cHqmY/6xF8lZm4lwB+Zbh1h6Qpk5+G8hXAE42eswEiYg+D
	 M0D/H6lhzYGWnjEYv0yiAvP/TLzkzbQdZ92QV4fQ=
Date: Tue, 25 May 2021 03:14:12 -0700
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, peter.morrow@microsoft.com,
	Jon Mason <Jon.Mason@arm.com>
Subject: Re: [OE-core] [PATCH] oeqa: sdk: basic go toolchain test support
Message-ID: <20210525101412.GA4632@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1621343133-5221-1-git-send-email-pemorrow@linux.microsoft.com>
 <1680C2C73B5C2D54.9669@lists.openembedded.org>
 <ba3c74eaecd5b27959744d0f6e48c630b10dd346.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ba3c74eaecd5b27959744d0f6e48c630b10dd346.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 02:57:26PM +0100, Richard Purdie wrote:
> On Thu, 2021-05-20 at 12:27 +0100, Richard Purdie via lists.openembedde=
d.org wrote:
> > On Tue, 2021-05-18 at 06:05 -0700, Peter Morrow wrote:
> > > Add a simple build test for the golang toolchain which is produced =
into a SDK.
> > >=20
> > > Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> > > ---
> > > =A0meta/lib/oeqa/sdk/cases/go.py   | 34 +++++++++++++++++++++++++++=
+++++++
> > > =A0meta/lib/oeqa/sdk/files/test.go |  7 +++++++
> > > =A02 files changed, 41 insertions(+)
> > > =A0create mode 100644 meta/lib/oeqa/sdk/cases/go.py
> > > =A0create mode 100644 meta/lib/oeqa/sdk/files/test.go
> > >=20
> > > diff --git a/meta/lib/oeqa/sdk/cases/go.py b/meta/lib/oeqa/sdk/case=
s/go.py
> > > new file mode 100644
> > > index 0000000..1af5516
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/sdk/cases/go.py
> > > @@ -0,0 +1,34 @@
> > > +#
> > > +# SPDX-License-Identifier: MIT
> > > +#
> > > +
> > > +import os
> > > +import shutil
> > > +import unittest
> > > +
> > > +from oeqa.core.utils.path import remove_safe
> > > +from oeqa.sdk.case import OESDKTestCase
> > > +
> > > +from oeqa.utils.subprocesstweak import errors_have_output
> > > +errors_have_output()
> > > +
> > > +class GoCompileTest(OESDKTestCase):
> > > +    @classmethod
> > > +    def setUpClass(self):
> > > +        files =3D {'test.go' : self.tc.files_dir}
> > > +        for f in files:
> > > +            shutil.copyfile(os.path.join(files[f], f),
> > > +                    os.path.join(self.tc.sdk_dir, f))
> > > +
> > > +    def setUp(self):
> > > +        if not self.tc.hasHostPackage("^nativesdk-go", regex=3DTru=
e):
> > > +            raise unittest.SkipTest("GoCompileTest class: SDK does=
n't contain a golang toolchain")
> > > +
> > > +    def test_go_compile(self):
> > > +        self._run('go build -o %s/test %s/test.go' % (self.tc.sdk_=
dir, self.tc.sdk_dir))
> > > +
> > > +    @classmethod
> > > +    def tearDownClass(self):
> > > +        files =3D [os.path.join(self.tc.sdk_dir, f) for f in ['tes=
t.go', 'test']]
> > > +        for f in files:
> > > +            remove_safe(f)
> > > diff --git a/meta/lib/oeqa/sdk/files/test.go b/meta/lib/oeqa/sdk/fi=
les/test.go
> > > new file mode 100644
> > > index 0000000..089f721
> > > --- /dev/null
> > > +++ b/meta/lib/oeqa/sdk/files/test.go
> > > @@ -0,0 +1,7 @@
> > > +package main
> > > +
> > > +import "fmt"
> > > +
> > > +func main() {
> > > +    fmt.Println("hello world!")
> > > +}
> >=20
> > I'd love to add something like this but adding it triggered a lot of =
errors
> > in our automated QA:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/216=
9
> >=20
>=20
> The autobuilder output isn't helpful to debug. I looked in and grabbed =
some of a logfile:
>=20
> NOTE: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> NOTE: ERROR: setUpClass (go.GoCompileTest)
> NOTE: -----------------------------------------------------------------=
-----
> NOTE: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/=
core/case.py", line 39, in _oeSetUpClass
>     clss.setUpClassMethod()
>   File "/home/pokybuild/yocto-worker/genericx86-64/build/meta/lib/oeqa/=
sdk/cases/go.py", line 20, in setUpClass
>     shutil.copyfile(os.path.join(files[f], f),
>   File "/usr/lib64/python3.8/shutil.py", line 264, in copyfile
>     with open(src, 'rb') as fsrc, open(dst, 'wb') as fdst:
> FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuil=
d/yocto-worker/genericx86-64/build/meta/lib/oeqa/files/test.go'
>=20
> NOTE: -----------------------------------------------------------------=
-----

Thanks Richard,

I'll take a look into these failures (which I didn't see when testing
locally) and will hopefully come back with a V2 shortly.

Peter.


>=20
>=20
> Cheers,
>=20
> Richard
