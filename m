Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T7N0E-0003xb-CH
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 10:54:58 +0200
Received: by eekb57 with SMTP id b57so903524eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 01:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=iUVpcN+inMtUOGxV/1JrbzLmIlUK9IjZhzPoZ2EEPuM=;
	b=PjooUmmV+SEmF04nCGQ2vzjpB5h/Uzwp29NxLoKCGmUHfA1xUMPHwA/RvJjxyzwzrm
	fCzwVaqvTge6UhEoHcKbg4hsWqFVw+30ezgvRZ1c8UQn6x465RhmewStSizFgiGXPuxz
	581xL34JmSotJmCEnTOfpZQv+83R77TyIwjIxrxFh/XdaiwE3SpTdgoJQQG9KUmWo4Ft
	M7A9dXFEzb4Yg7vdw5r/ffxMfPv6+6qyWBG6Po+7SEA1HgKFk/YhCrn1H1X/c8ySa/Hy
	tkRGVJ0StYarrqLy3BX58J5bSyYvqebDajrlCA0HhSlSYd1DymWTjUmipGB8IGGCKoVS
	A4XQ==
Received: by 10.14.182.69 with SMTP id n45mr9981731eem.28.1346402561973;
	Fri, 31 Aug 2012 01:42:41 -0700 (PDT)
Received: from ?IPv6:2001:610:612::7933:3afd:9a4c:d894?
	([2001:610:612:0:7933:3afd:9a4c:d894])
	by mx.google.com with ESMTPS id k49sm11504565een.4.2012.08.31.01.42.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 01:42:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346369784.16485.14.camel@ted>
Date: Fri, 31 Aug 2012 10:42:39 +0200
Message-Id: <CAA212CE-4A85-4A98-86D9-76F8BF803FAA@dominion.thruhere.net>
References: <1346369784.16485.14.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQn+tRfbGBsKHPwV1E0wVC+I0222CAgjQiZfAHkkoMBszXC9IwD9bxH6EPhUuqc7ub2QYavR
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: perl: Fix various nativesdk build issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 08:54:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 aug. 2012, om 01:36 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> The config.sh lists -fstack-protector but this isn't in LDFLAGS. This
> can result in perl compilation failures due to the mismatch. Adding =
the
> flag to LDFLAGS solves makes all the flags consistent and avoids build
> failures from missing symbols.
>=20
> It was also found that the path substitutions made by the sed =
statement
> can conflict with each other and you can end up with $prefix$prefix =
type
> expressions in config.sh-X which can break the build in unusual ways.
> This patch anchors the expressions to ensure only true matches are
> replaced.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I'm not entirely sure, but since this has a potential impact on the =
build output, shouldn't there be a PR bump?

> ---
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb =
b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 9db3805..8e7ab9e 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -90,6 +90,8 @@ export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
> # LDFLAGS for shared libraries
> export LDDLFLAGS =3D "${LDFLAGS} -shared"
>=20
> +LDFLAGS_append =3D " -fstack-protector"
> +
> # We're almost Debian, aren't we?
> CFLAGS +=3D "-DDEBIAN"
>=20
> @@ -148,10 +150,10 @@ do_configure() {
>                -e 's,@ARCH@-thread-multi,,g' \
>                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>                -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> -               -e "s%/usr/include%${STAGING_INCDIR}%g" \
> -	       -e 's,/usr/lib/,${libdir}/,g' \
> -	       -e 's,/usr/,${exec_prefix}/,g' \
> -	       -e 's,/perl5,/perl,g' \
> +               -e "s%\([ =
\"^\',=3D]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
> +	       -e "s%\([ \"^\',=3D]\+\)/usr/lib/%\1${libdir}/%g" \
> +	       -e "s%\([ \"^\',=3D]\+\)/usr/%\1${exec_prefix}/%g" \
> +	       -e "s%/perl5%/perl%g" \
>             config.sh-${TARGET_ARCH}-${TARGET_OS}

Whitespace issue in the first line=


