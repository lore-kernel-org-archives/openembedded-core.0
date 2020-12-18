Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1094.1608317342788302089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 10:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PM+TvF3n;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608317343;
  x=1639853343;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=caFXnRMz5DR92IUFGFrbOMxdS0n7cliikBbP9OHkY44=;
  b=PM+TvF3n44yzSRhKDJG7om6fl34wVltdqvik7bxRm8/0/v3AiJPkxBsw
   TMhFr748Jj5iSbWh+BsdOwBciniIt4hLftBILyAN+qVz5fG140+FTgnXd
   mLgv+EBW9xjVsmgLg8R4h911jlRZP6Fys7B4wWOLpLVwZVVrkXG0pnFVl
   i9dtD0R50QtRBpOW2a6Mu8NfK7uE5BUa2Jsx4TY8YSHNY1lafeBih4FDp
   2cqMvT8m8rv20x+tAUGJcncx9azK0glMngbdkI02XGHh9AAPqhhIUCA/T
   Eg0yXKcUJM+LNjmU1wwFw86pagmpcxYbM9Fgw2f+oioPC9iiYu26Wb4kK
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] initscripts: Use initctl on sysvinit only
Thread-Topic: [OE-core] [PATCH 4/4] initscripts: Use initctl on sysvinit only
Thread-Index: AQHW1Me1K7AX49WG1kyHhXBSy9QVTKn9MrFQ
Date: Fri, 18 Dec 2020 18:49:00 +0000
Message-ID: <675d9b3a054b4b018d98b52f7a3524f8@XBOX03.axis.com>
References: <20201217225440.2633474-1-raj.khem@gmail.com>
 <20201217225440.2633474-4-raj.khem@gmail.com>
In-Reply-To: <20201217225440.2633474-4-raj.khem@gmail.com>
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
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 17 december 2020 23:55
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH 4/4] initscripts: Use initctl on sysvinit only
>=20
> Check if init system is sysvinit to recreate initctl, this ensures that
> it can be used with busybox init system as well
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../initscripts/initscripts-1.0/mountall.sh   | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/=
meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
> index c719be5d9a..ead4dba46d 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
> @@ -19,15 +19,21 @@
>  test "$VERBOSE" !=3D no && echo "Mounting local filesystems..."
>  mount -at nonfs,nosmbfs,noncpfs 2>/dev/null
>=20
> -#
> -# We might have mounted something over /dev, see if /dev/initctl is ther=
e.
> -#
> -if test ! -p /dev/initctl
> -then
> -	rm -f /dev/initctl
> -	mknod -m 600 /dev/initctl p
> +
> +# We might have mounted something over /run; see if
> +# /dev/initctl is present.  Look for
> +# /sbin/init.sysvinit to verify that sysvinit (and
> +# not busybox or systemd) is installed as default init).
> +INITCTL=3D"/dev/initctl"
> +if [ ! -p "$INITCTL" ] && [ "$(readlink -- "/sbin/init")" =3D "/sbin/ini=
t.sysvinit" ]; then
> +    # Create new control channel
> +		rm -f "$INITCTL"
> +		mknod -m 600 "$INITCTL" p
> +
> +		# Reopen control channel.
> +		PID=3D"$(pidof -s /sbin/init || echo 1)"
> +		[ -n "$PID" ] && kill -s USR1 "$PID"

Change all references for "/sbin" to "${base_sbindir}" to make it correct=20
if usrmerge is used.

>  fi
> -kill -USR1 1
>=20
>  #
>  # Execute swapon command again, in case we want to swap to
> --
> 2.29.2

//Peter

