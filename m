Return-Path: <prvs=024cf7ccd=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 745007DE51
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1557323228; x=1588859228;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=5FbN0uYKOIhWZPIJbdF0ZoTLwfArLjYu3bfluCsUc28=;
	b=Shrorasx0icFAYVB/BHEJ3c1LnxZozZI5FyfkfZRzrXjqiDGh0R+WsZ6
	1RbIDkWpz4FNL66pwz7t6rTXr9zejcx0UL8Lxo+KMuFnH+SP385Ba2TDh
	WEwhKSU9hurAwB0hcCEsGIQRq4++mpPFjv/MEWbynMvKWH3ga0f9PTLEJ 4=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 08 May 2019 15:46:54 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
	08 May 2019 15:46:53 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb4.muc with ESMTP/TLS; 08 May 2019 15:46:52 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Wed, 8 May 2019 15:46:52 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Wed, 8 May 2019 15:46:52 +0200
From: <Mikko.Rapeli@bmw.de>
To: <jpewhacker@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/2] eoqa: use bash to execute SDK test commands
Thread-Index: AQHVBaGl++iC58m2p0CJyR35PMY6BKZhGqaAgAABiwA=
Date: Wed, 8 May 2019 13:46:52 +0000
Message-ID: <20190508134652.GA3459@hiutale>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<4791dc39bf06a746beab62f044a063698f5883ca.camel@gmail.com>
In-Reply-To: <4791dc39bf06a746beab62f044a063698f5883ca.camel@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.41]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] eoqa: use bash to execute SDK test commands
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 13:47:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4ACE27C436FFD84C8687AC56FC1A924B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 08:41:21AM -0500, Joshua Watt wrote:
> On Wed, 2019-05-08 at 16:26 +0300, Mikko Rapeli wrote:
> > The commands only work with with bash. If /bin/sh is
> > dash like in Debian, the command execution fails with
> > errors like:
>=20
> This might possibly be related to=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11775 where it was
> discovered that in order to use dash, the CWD must be the same
> directory where the init script lives?

Yes, this is related.

In my case bitbake build is already called from bash and all scripts
seem to be calling bash correctly as /bin/bash, except for these
SDK tests.

Also on sumo, there is no meaningful debug output when these tests fail.

from oeqa.utils.subprocesstweak import errors_have_output
errors_have_output()

should maybe be used wherewhere with python subprocess...

-Mikko

> >=20
> > Standard Output: /bin/sh: 5: export: --sysroot: bad variable name
> >=20
> > and all SDK tests fail.
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  meta/lib/oeqa/sdk/case.py                  | 2 +-
> >  meta/lib/oeqa/sdk/utils/sdkbuildproject.py | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> > index d8611c8..5334237 100644
> > --- a/meta/lib/oeqa/sdk/case.py
> > +++ b/meta/lib/oeqa/sdk/case.py
> > @@ -9,7 +9,7 @@ from oeqa.core.case import OETestCase
> >  class OESDKTestCase(OETestCase):
> >      def _run(self, cmd):
> >          return subprocess.check_output(". %s > /dev/null; %s;" % \
> > -                (self.tc.sdk_env, cmd), shell=3DTrue,
> > +                (self.tc.sdk_env, cmd), shell=3DTrue,
> > executable=3D"/bin/bash",
> >                  stderr=3Dsubprocess.STDOUT, universal_newlines=3DTrue)
> > =20
> >      def fetch(self, workdir, dl_dir, url, archive=3DNone):
> > diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> > b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> > index 6fed73e..eafbd7a 100644
> > --- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> > +++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
> > @@ -42,7 +42,8 @@ class SDKBuildProject(BuildProject):
> >      def _run(self, cmd):
> >          self.log("Running . %s; " % self.sdkenv + cmd)
> >          try:
> > -            output =3D subprocess.check_output(". %s; " % self.sdkenv
> > + cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
> > +            output =3D subprocess.check_output(". %s; " % self.sdkenv
> > + cmd, shell=3DTrue,
> > +                                             executable=3D'/bin/bash',
> > stderr=3Dsubprocess.STDOUT)
> >          except subprocess.CalledProcessError as exc:
> >              print(exc.output.decode('utf-8'))
> >              return exc.returncode
> > --=20
> > 1.9.1
> >=20
> --=20
> Joshua Watt <JPEWhacker@gmail.com>=

