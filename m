Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web11.10707.1607063894348989656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 22:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=pcplyZSa;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=6003e8164=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1607063894; x=1638599894;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kg7ImM1D10XuYMkfu/lhftXXYy6nYz0Oute29wvZaQs=;
  b=pcplyZSaWjUcZRD6COUS5mrED+4kBYiCeY+QVbR7H50fswDX4Ndof1gn
   jLDDqB3uyzoeVEe4jqiNaZ9vcX/1E9IZMJzNkAjcHnwdGbsnkZtgu5x0P
   HEJEzerDj+bzqPGKc1M4aoZu+ibxDN07vTiUjk0uNDzrtVu1LEgqHEbPR
   U=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 04 Dec 2020 07:38:10 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 04 Dec 2020 07:38:10 +0100
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb2.muc with ESMTP/TLS; 04 Dec 2020 07:38:10 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Fri, 4 Dec 2020 07:38:09 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.008; Fri,
 4 Dec 2020 07:38:09 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <ross@burtonini.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
Thread-Topic: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
Thread-Index: AQHWyZyLsSFRy5LEAEGM/WB9rOfV96nmbBCA
Date: Fri, 4 Dec 2020 06:38:09 +0000
Message-ID: <X8nZT9OziqfL3Esk@korppu>
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
In-Reply-To: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9B9B015458D9944FB706D499A067EF3E@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 03, 2020 at 05:48:16PM +0000, Ross Burton wrote:
> Hi,
>=20
> Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cores
> available unless told otherwise.  This was a good idea six years
> ago[1] but some modern machines are moving to very large core counts.
>=20
> For example, 88 core dual Xeons are fairly common. A ThunderX2 has 256
> cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra
> is dual socket 2*80=3D160 cores.
>=20
> At this level of parallelisation the sheer amount of I/O from the
> unpack storm is quite excessive.  As a strawman argument, I propose a
> hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
> making up numbers here -- 32.  Maybe 64.  Comments?

Number of cores is far from sufficient in real world. Amount of physical R=
AM should be
taken into account too. I'd say 2 Gb of physical RAM per thread should be =
available to
compile and link modern C++ SW to avoid out-of-memory killer from kicking =
in.

Here is one algorithm which avoids oom killer in our case:

        mem =3D get_mem_total()
        cpus =3D get_number_cpus()
        mem_cpus =3D (mem * 1.0) / cpus

        if cpus =3D=3D 1:
            # In case of a single CPU, don't parallelize
            self.bb_number_threads =3D 1
            self.parallel_make =3D make_j(1)
        elif mem_cpus > 8:
            self.bb_number_threads =3D cpus
            self.parallel_make =3D make_j(cpus)
        elif mem_cpus >=3D 4:
            self.bb_number_threads =3D cpus
            self.parallel_make =3D make_j(divide_cpus(cpus, 2))
        elif mem_cpus >=3D 2:
            self.bb_number_threads =3D divide_cpus(cpus, 2)
            self.parallel_make =3D make_j(divide_cpus(cpus, 2))
        else:
            self.bb_number_threads =3D divide_cpus(cpus, 2)
            self.parallel_make =3D make_j(divide_cpus(cpus, 4))

Cheers,

-Mikko

>=20
> Cheers,
> Ross
>=20
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D1529ef05=
04542145f2b81b2dba4bcc81d5dac96e

>=20
>=20
>=20
