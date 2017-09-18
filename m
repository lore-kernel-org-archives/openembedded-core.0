Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id B4AAC60602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 1D6CB2E588;
	Mon, 18 Sep 2017 10:49:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id I5C-v1v2qSnt; Mon, 18 Sep 2017 10:49:38 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 10BC92E093;
	Mon, 18 Sep 2017 10:49:38 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F09B51A060;
	Mon, 18 Sep 2017 10:49:37 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E53851A05F;
	Mon, 18 Sep 2017 10:49:37 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 18 Sep 2017 10:49:37 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id D94A09C;
	Mon, 18 Sep 2017 10:49:37 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 18 Sep 2017 10:49:37 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 18 Sep 2017 10:49:38 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] base-files: profile: Do not assume that
	the	'command' command exists
Thread-Index: AQHTMFmqfleJPWJjoUWE9IOxyO8yGKK6VEgg
Date: Mon, 18 Sep 2017 08:49:37 +0000
Message-ID: <da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/2] base-files: profile: Do not assume that the	'command' command exists
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
X-List-Received-Date: Mon, 18 Sep 2017 08:49:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mike Looijmans
> Sent: den 18 september 2017 10:39
> To: openembedded-core@lists.openembedded.org
> Cc: Mike Looijmans <mike.looijmans@topic.nl>
> Subject: [OE-core] [PATCH 1/2] base-files: profile: Do not assume that
> the 'command' command exists
>=20
> The "command" shell command appears to be a bashism, the standard
> busybox shell doesn't implement it.
>=20
> This avoids the following error when logging in to a host that does
> not have the 'command' command:
>=20
>     -sh: command: not found
>=20
> It also simplifies the code and reduces the number of forks.
>=20
> Fixes: e77cdb761169e404556487ac650dc562000da406
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recip=
es-core/base-files/base-files/profile
> index ceaf15f..b5b533c 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -22,14 +22,12 @@ if [ -d /etc/profile.d ]; then
>  	unset i
>  fi
>=20
> -if command -v resize >/dev/null && command -v tty >/dev/null; then
> -	# Make sure we are on a serial console (i.e. the device used starts wit=
h
> -	# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
> -	# tries do use ssh
> -	case $(tty) in
> -		/dev/tty[A-z]*) resize >/dev/null;;
> -	esac
> -fi
> +# Make sure we are on a serial console (i.e. the device used starts with
> +# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
> +# tries do use ssh
> +case $(tty 2>/dev/null) in
> +	/dev/tty[A-z]*) resize >/dev/null;;
> +esac
>=20
>  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>=20
> --
> 1.9.1

This is basically the same change as I first sent a patch for in April, and=
=20
last pinged this Friday... The only real difference is that this one misses=
=20
passing error output from resize to /dev/null (which it should do to handle=
=20
the case where tty exists, but resize does not).

//Peter


