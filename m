Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web10.3701.1605079480570242342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 23:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=MrU5y0jm;
 spf=pass (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=577f07fd8=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1605079480; x=1636615480;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yEpoYnUuEmPmpmliIff9VK4zKrePzEbQhIOdoD4z42c=;
  b=MrU5y0jmbAxl9N6QIMhLQAPs/CSBYC49laJ5X7zQt8x9+sy/I5j/qaZ6
   s6LaFgRZySb72yApSNaxhDFv2v1R/HZDqj5GQBmwk1Rp9C0YjSiyH4weT
   uQV0DV4dNiGX3XBtNbCCW8PCW50q5JDV+e8QSerinZDYYhGvi9YAmZVse
   I=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Nov 2020 08:24:38 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw6.muc with ESMTP/TLS;
 11 Nov 2020 08:24:38 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp) ([160.48.96.46])
 by esabb3.muc with ESMTP/TLS; 11 Nov 2020 08:24:38 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10j.europe.bmw.corp
 (160.48.96.46) with Microsoft SMTP Server (TLS;
 Wed, 11 Nov 2020 08:24:37 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.007; Wed,
 11 Nov 2020 08:24:37 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <sakib.sajal@windriver.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] buildstats.bbclass: add functionality to collect build system stats
Thread-Topic: [OE-core] [PATCH v2] buildstats.bbclass: add functionality to
 collect build system stats
Thread-Index: AQHWt7ZmICDkRpCicEOYvYmE+NobXanCdzoA
Date: Wed, 11 Nov 2020 07:24:37 +0000
Message-ID: <20201111072436.GN1246345@korppu>
References: <20201110230744.30544-1-sakib.sajal@windriver.com>
In-Reply-To: <20201110230744.30544-1-sakib.sajal@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8385A655C1BD2F44BBC2AB0DD22A435F@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 10, 2020 at 06:07:44PM -0500, Sakib Sajal wrote:
> There are a number of timeout and hang defects where
> it would be useful to collect statistics about what
> is running on a build host when that condition occurs.
>=20
> This adds functionality to collect build system stats
> on a regular interval and/or on task failure. Both
> features are disabled by default.
>=20
> To enable logging on a regular interval, set:
> BB_HEARTBEAT_EVENT =3D "<interval>"
> BB_LOG_HOST_STAT_ON_INTERVAL =3D <boolean>
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats
>=20
> To enable logging on a task failure, set:
> BB_LOG_HOST_STAT_ON_FAILURE =3D "<boolean>"
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats
>=20
> The list of commands, along with the desired options, need
> to be specified in the BB_LOG_HOST_STAT_CMDS variable
> delimited by ; as such:
> BB_LOG_HOST_STAT_CMDS =3D "command1 ; command2 ;... ;"

I can understand why and have been debugging crashing and hanging build mac=
hines,
but I would not have found this change useful. Do you have more concrete ex=
amples
how this could be used?

Instead, I found that normal Linux server admin practices were best:

 * collect build machine kernel, journald and syslogs to remote host, e.g. =
rsyslog
 * monitor CPU, memory, IO, network etc performance, also to a remote host,=
 e.g.
   pcp.io tooling or collectd
 * collect bitbake build logs with system timestamps to remote host, e.g. d=
on't trust
   jenkins and its timestamps

With those, I have been able to find problems in Linux kernels, bugs
in VMWare cloud storage stack triggering IO hangs, stalls and eventually ke=
rnel
crashes, broken HW like memory. And of course basic things like full disks,=
 full /tmp,
kernel oom killer kicking in when build slaves ran out of RAM during bitbak=
e build
which results in either build machine changes or tuning of parallel build f=
lags to
account also physical RAM.

Wihtout full remote logging infrastructure, I could not have solved anythin=
g. Running
individual commands is not enough when only full kernel dmesg of affected m=
achine
can tell that IO stack has a hang or an Oops or that disk had been mounted =
read-only
due to errors.

Cheers,

-Mikko=
