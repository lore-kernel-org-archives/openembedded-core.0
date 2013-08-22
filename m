Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA2C6B927
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 06:42:47 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so374120pad.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ud8435eleK35fuDuRWVgw4QsHsEsLrpljUh+w6KFfRw=;
	b=m7f4vk39D/pB5gUG+6BEES8DlAxa4yS2kAbwDhpoQlTjmqwk+/qRjNN59J8ciF2Yh1
	uUoD4CqOErxbL79qhhJW9mOPYTf4hO6F/26wF3AKBPeqku4c5hUO0Zbzi6ikrlStPq59
	yIXiz0GaXuEdz7HPzqkA5swzqjgizo+OTFdSSpKbaHdHJz51licrTJszdpyD/LpJc3tc
	egWQXqfAvYihxSRINlRsKC+fmcyLvgbvf1jkQi5yi295fVtJwrlpIVph+37NrDgjk8yZ
	NYeM1SsIDKuFEYX7L8Rf1NKYfmAQJHLvWCTuRCt1ib0PUeJwMgy5OZqYMObxIiJ7sP62
	QnjQ==
X-Received: by 10.68.216.33 with SMTP id on1mr3749393pbc.107.1377153768547;
	Wed, 21 Aug 2013 23:42:48 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	ta10sm14652675pab.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 23:42:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6f2bc301767250c371bb8d927e54425bdeda6f37.1376968627.git.jackie.huang@windriver.com>
Date: Wed, 21 Aug 2013 23:42:47 -0700
Message-Id: <54332AB2-FDDB-44C5-BCD8-00989CF8B700@gmail.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
	<6f2bc301767250c371bb8d927e54425bdeda6f37.1376968627.git.jackie.huang@windriver.com>
To: jackie.huang@windriver.com
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] openssh: add init.d/sshd status command for LSB compliance
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
X-List-Received-Date: Thu, 22 Aug 2013 06:42:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Jackie

One thing comes to mind is that these scripts are hardcoding the =
binaries and may be it would be
nicer to replace the bindir, libdir and so on at install time, that =
would make them flexible where /usr
is not used e.g. but I guess thats a general problem with capture init =
scripts all around probably.

On Aug 19, 2013, at 8:25 PM, jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> .../openssh/openssh-6.2p2/init                     |   15 =
++++++++++++++-
> 1 files changed, 14 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init =
b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
> index 6beec84..6bbc573 100644
> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
> @@ -1,6 +1,9 @@
> #! /bin/sh
> set -e
>=20
> +# source function library
> +. /etc/init.d/functions
> +
> # /etc/init.d/ssh: start and stop the OpenBSD "secure shell" daemon
>=20
> test -x /usr/sbin/sshd || exit 0
> @@ -46,6 +49,11 @@ check_keys() {
> 	fi
> }
>=20
> +rh_status() {
> +	status /usr/sbin/sshd;
> +	return $?
> +}
> +
> export PATH=3D"${PATH:+$PATH:}/usr/sbin:/sbin"
>=20
> case "$1" in
> @@ -84,8 +92,13 @@ case "$1" in
> 	echo "."
> 	;;
>=20
> +  status)
> +	rh_status;
> +	exit $?
> +  ;;
> +
>   *)
> -	echo "Usage: /etc/init.d/ssh =
{start|stop|reload|force-reload|restart}"
> +	echo "Usage: /etc/init.d/ssh =
{start|stop|status|reload|force-reload|restart}"
> 	exit 1
> esac
>=20
> --=20
> 1.7.4.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


