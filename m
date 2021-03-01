Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web09.10064.1614588213308596745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 00:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=e7mX7t0L;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=687ff6bdf=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1614588213; x=1646124213;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=c1F4tLnF493n2+ZEymKECT6H090fWQINkkRZjldj32o=;
  b=e7mX7t0LgJXUL7auhpZMxvA566dFU+Ht9qVT6FXYOjw9bZaDM3yy7mZw
   oYB3ElcOUoQXGrSWYeZfh9bo1SsVpbBXQDGJLZJn/vNoQtf7BluX8fkQf
   C+vRceljKM8iz61lRVvhTcxwuUPCIJdvQ5k7XYCVNFLLmA8YvsmFvhF5B
   M=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 01 Mar 2021 09:43:30 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw6.muc with ESMTP/TLS;
 01 Mar 2021 09:43:30 +0100
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb3.muc with ESMTP/TLS; 01 Mar 2021 09:43:30 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Mon, 1 Mar 2021 09:43:29 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Mon,
 1 Mar 2021 09:43:29 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Don't call sync between each file compare
Thread-Topic: [OE-core] [PATCH] selftest/reproducible: Don't call sync between
 each file compare
Thread-Index: AQHXDGeM+EPnNj+qMUCK9OeEuEGHMaput/KAgAAKygCAAAGXAA==
Date: Mon, 1 Mar 2021 08:43:29 +0000
Message-ID: <YDypMKCRf9xoJbFt@korppu>
References: <20210226174752.3942750-1-richard.purdie@linuxfoundation.org>
 <YDyezaTI3Vz0mif6@korppu>
 <8dac13bfdbb13a7d6e6d0277c2d1ec89fe613909.camel@linuxfoundation.org>
In-Reply-To: <8dac13bfdbb13a7d6e6d0277c2d1ec89fe613909.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BC16740BCB12614395108CC3962B2603@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 08:37:46AM +0000, Richard Purdie wrote:
> On Mon, 2021-03-01 at 07:59 +0000, Mikko.Rapeli@bmw.de wrote:
> > Hi,
> >=20
> > On Fri, Feb 26, 2021 at 05:47:52PM +0000, Richard Purdie wrote:
> > > Calling sync between each file compare is horrible performance wise
> > > as we compare thousands of files. We don't care about IO latency here
> > > so disable.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > > =A0meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
> > > =A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/=
oeqa/selftest/cases/reproducible.py
> > > index ce4e8ebe06b..05fc4b7fa0a 100644
> > > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > > @@ -123,7 +123,7 @@ def compare_file(reference, test, diffutils_sysro=
ot):
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0result.status =3D MISSING
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0return result
> > > =A0
> > >=20
> > > -    r =3D runCmd(['cmp', '--quiet', reference, test], native_sysroot=
=3Ddiffutils_sysroot, ignore_status=3DTrue)
> > > +    r =3D runCmd(['cmp', '--quiet', reference, test], native_sysroot=
=3Ddiffutils_sysroot, ignore_status=3DTrue, sync=3DFalse)
> >=20
> > Uh, sync is horrible for performance. Why don't we change it to false
> > by default:
> >=20
> > --- a/meta/lib/oeqa/utils/commands.py
> > +++ b/meta/lib/oeqa/utils/commands.py
> > @@ -167,7 +167,7 @@ class Result(object):
> > =A0=A0=A0=A0=A0pass
> > =A0
> >=20
> > =A0
> >=20
> > -def runCmd(command, ignore_status=3DFalse, timeout=3DNone, assert_erro=
r=3DTrue, sync=3DTrue,
> > +def runCmd(command, ignore_status=3DFalse, timeout=3DNone, assert_erro=
r=3DTrue, sync=3DFalse,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0native_sysroot=3DNone, limit_exc_outpu=
t=3D0, output_log=3DNone, **options):
> > =A0=A0=A0=A0=A0result =3D Result()
> > =A0
> >=20
> >=20
> > Based on comment:
> >=20
> > =A0=A0=A0=A0# tests can be heavy on IO and if bitbake can't write out i=
ts caches, we see timeouts.
> > =A0=A0=A0=A0# call sync around the tests to ensure the IO queue doesn't=
 get too large, taking any IO
> > =A0=A0=A0=A0# hit here rather than in bitbake shutdown.
> > =A0=A0=A0=A0if sync:
> > =A0=A0=A0=A0=A0=A0=A0=A0p =3D os.environ['PATH']
> > =A0=A0=A0=A0=A0=A0=A0=A0os.environ['PATH'] =3D "/usr/bin:/bin:/usr/sbin=
:/sbin:" + p
> > =A0=A0=A0=A0=A0=A0=A0=A0os.system("sync")
> > =A0=A0=A0=A0=A0=A0=A0=A0os.environ['PATH'] =3D p
> >=20
> > this looks like a workaround for some other bug.
>=20
> The wider issue is the randomly failing ptests and other issues with the =
automated
> testing, particularly things running under qemu system mode. Those seemed=
 partly to=A0
> be caused by huge IO queues building up. The idea of the sync calls was t=
o keep the=A0
> UI backlog manageable.
>=20
> In most cases we execute occasional commands so this should work/help. In=
 the case of
> the reproducible ptest, we execute a cmp on every generated package which=
 really didn't
> work well hence it makes sense to disable it there.
>=20
> We don't see this issue with any other tests as far as I've observed. I r=
eally don't
> want to make the runtime testing results worse, anyone who's looked at sw=
at or attended
> bug triage will know how much trouble we're having with the issues this c=
ode helps
> mitigate :/.

Ok, understood. You need to keep the system and tests running.

But IO flushes can take any amount of time. So sounds like timeouts are
too short, or should not exists at all. Also, systems are doing too much
parallel work or are actually short on RAM if slow IO to disk starts
failing things.

-Mikko=
