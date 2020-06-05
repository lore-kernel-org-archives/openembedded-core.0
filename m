Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.14355.1591372407236092594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 08:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=J8sKQClN;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1562; q=dns/txt; s=axis-central1;
  t=1591372407; x=1622908407;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6l7kjNceJju515dzYZSaDWm8SLo+y5wjGdlq5lRGUWE=;
  b=J8sKQClNEry2HCMm1hzc7ya+bPGBHYliZP63UQn3LDihz/huKbD2YYbK
   fzTXR6WYyHK/KK7qwJZgoWvvWm69xlRI/D9lVh7QBmfTGSWdhCmUHtlDd
   sBmpuZQ/OAO9KPudmlDfjuwua3w6ijAIQWgtTz40AsjpyFnPpruRep69y
   vpX1nwL3HjxqpA1HOUNWTjeX+uWQPEdq7gTr+vdfo+Gtybm4sBG61g5A2
   +XDSYTdHWsziOU1pVwR7Vvp7pq2IU8u7hLcapkdSEl3hiorTr5Wue7wuN
   qN7KlZc99JLd+UUQQNBjrTytbNJJnpFxt+iTb+IB3c4opqQlKbkVQPDZ1
   w==;
IronPort-SDR: PRN95lcd5BjIbk4X82oY9NPOoRhdBrzaZUkQ2l7FI4lki/YVmWHi0arEIBBPTB+ybhYnaeT4Km
 01hXrVZA2aiLqHIhdLX/x1PNyWFGjpDa6/3MsOjvRBk8D79jA6p/Riiv72C7GFTDvUAbx7Ar3W
 E43TNcsMbjtXPsj7Rn7A8YU+dycXQ6BwrvTmN8OTklrt4HDhKWweelLJxeF/ze85kW46v+ENVm
 2QmxC0mbQDEd3B0XP9gRc5yCfAdx7UwxOyHmHxkMq6VPVuiHhfGDZSZgSBe0W6hxhdDQ4IiNnP
 Ez0=
X-IronPort-AV: E=Sophos;i="5.73,476,1583190000"; 
   d="scan'208";a="9534004"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][dunfell] Revert "prservice.py: fix do_package with newer Python in Ubuntu 20.04"
Thread-Topic: [OE-core] [master][dunfell] Revert "prservice.py: fix do_package
 with newer Python in Ubuntu 20.04"
Thread-Index: AQHWO1EJ512pbCUYp0CWtn07RDhN6KjKK5sg
Date: Fri, 5 Jun 2020 15:53:25 +0000
Message-ID: <09a573201ca04ab69fab09155aba02f8@XBOX03.axis.com>
References: <1615B09A37DD131A.25101@lists.openembedded.org>
In-Reply-To: <1615B09A37DD131A.25101@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 5 juni 2020 17:50
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [master][dunfell] Revert "prservice.py: fix do_package=
 with newer Python in Ubuntu 20.04"
>=20
> This reverts commit 4b26eaf7152fb712aba47a0c746333578f58ee8d.
>=20
> Since the problem occurred while importing prserv, the solution has
> been moved into it instead so it is solved for all cases where prserv
> is imported, most notably when using devtool.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/lib/oe/prservice.py | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
> index 2d3c9c7e50..fcdbe66c19 100644
> --- a/meta/lib/oe/prservice.py
> +++ b/meta/lib/oe/prservice.py
> @@ -3,10 +3,6 @@
>  #
>=20
>  def prserv_make_conn(d, check =3D False):
> -    # Otherwise this fails when called from recipes which e.g. inherit p=
ython3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
> -    # No module named '_sysconfigdata'
> -    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
> -        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
>      import prserv.serv
>      host_params =3D list([_f for _f in (d.getVar("PRSERV_HOST") or '').s=
plit(':') if _f])
>      try:

There is a corresponding patch sent to the bitbake-devel list that should=20
be integrated before/together with this.

//Peter

