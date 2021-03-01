Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web08.9583.1614585575402374135
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 23:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=qHG0Njgd;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=687ff6bdf=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1614585575; x=1646121575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GNzBC2KDpWmTwn+Waq6//ON5N93mQQboBY29xKm6cCg=;
  b=qHG0NjgdDwImjvpLPlTnMFn4js1Lyno6fdZ9qJgSNTNx60mxUoJw1rEi
   uVc3CcG6IrqTy+tP5I2AhYcUMBCHuLzeStdKySfzxASz+xDPytA78lpHg
   AKatXExZSmQFtCg4qLleuhoGmJNvPjcRG+IBFkOATwhYRDVDpZINOuTeZ
   M=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 01 Mar 2021 08:59:32 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 01 Mar 2021 08:59:10 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb1.muc with ESMTP/TLS; 01 Mar 2021 08:59:10 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Mon, 1 Mar 2021 08:59:10 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Mon,
 1 Mar 2021 08:59:10 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Don't call sync between each file compare
Thread-Topic: [OE-core] [PATCH] selftest/reproducible: Don't call sync between
 each file compare
Thread-Index: AQHXDGeM+EPnNj+qMUCK9OeEuEGHMaput/KA
Date: Mon, 1 Mar 2021 07:59:10 +0000
Message-ID: <YDyezaTI3Vz0mif6@korppu>
References: <20210226174752.3942750-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210226174752.3942750-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA691446136513418C1469F3D50C4D2A@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 26, 2021 at 05:47:52PM +0000, Richard Purdie wrote:
> Calling sync between each file compare is horrible performance wise
> as we compare thousands of files. We don't care about IO latency here
> so disable.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeq=
a/selftest/cases/reproducible.py
> index ce4e8ebe06b..05fc4b7fa0a 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -123,7 +123,7 @@ def compare_file(reference, test, diffutils_sysroot)=
:
>          result.status =3D MISSING
>          return result
>  
> -    r =3D runCmd(['cmp', '--quiet', reference, test], native_sysroot=3D=
diffutils_sysroot, ignore_status=3DTrue)
> +    r =3D runCmd(['cmp', '--quiet', reference, test], native_sysroot=3D=
diffutils_sysroot, ignore_status=3DTrue, sync=3DFalse)

Uh, sync is horrible for performance. Why don't we change it to false
by default:

--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -167,7 +167,7 @@ class Result(object):
     pass
=20
=20
-def runCmd(command, ignore_status=3DFalse, timeout=3DNone, assert_error=
=3DTrue, sync=3DTrue,
+def runCmd(command, ignore_status=3DFalse, timeout=3DNone, assert_error=
=3DTrue, sync=3DFalse,
           native_sysroot=3DNone, limit_exc_output=3D0, output_log=3DNone,=
 **options):
     result =3D Result()
=20

Based on comment:

    # tests can be heavy on IO and if bitbake can't write out its caches, =
we see timeouts.
    # call sync around the tests to ensure the IO queue doesn't get too la=
rge, taking any IO
    # hit here rather than in bitbake shutdown.
    if sync:
        p =3D os.environ['PATH']
        os.environ['PATH'] =3D "/usr/bin:/bin:/usr/sbin:/sbin:" + p
        os.system("sync")
        os.environ['PATH'] =3D p

this looks like a workaround for some other bug.

Cheers,

-Mikko

>      if r.status:
>          result.status =3D DIFFERENT
> --=20
> 2.27.0
>=20

>=20
>=20
>=20
