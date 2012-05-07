Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRKw2-0004ST-D5
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 12:12:54 +0200
Received: by mail-we0-f175.google.com with SMTP id b13so634854wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 03:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Pi9V2H/qOq2MeyD6q0ATcrvtMFnJW2UklP5f3UBh538=;
	b=OwatFj3paPnkd4kKeMhg9npW54QNFymjJH/3yb3OP3oBoWryGpx4UMuCFjANo8SviR
	7qsTcaVEIXYL2CyuuCg7CkzDhhkyBM8NzOAs0DNNTx9meSmLNmM2iXOGhKEyBVgX7tjC
	9yAMmNUBS5p5ogq+v3YUVPAAUY5zJlO8qnH9eYPLgklpP+kdV3J43fwuly1zZsQB6YOs
	H7cFTS7F71ONAfaorgzPS1HV+HP85FWl7B58R4pQh1tFvKbYeFZG5vY6yX1hze1zH2aP
	WDLzDm2zPNOlCY6lj3c0NQd4sL9JvCJ0PkcLpEhBEuIu/ajGC5DPKP7wxDV0KBg6i/h9
	RtlQ==
Received: by 10.180.95.37 with SMTP id dh5mr33676264wib.8.1336384986426;
	Mon, 07 May 2012 03:03:06 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm32537657wib.2.2012.05.07.03.03.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 03:03:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336384362.23777.71.camel@ted>
Date: Mon, 7 May 2012 12:03:03 +0200
Message-Id: <6DA1742A-1DCE-4F5A-8D51-EB536F7F88C3@dominion.thruhere.net>
References: <1336384362.23777.71.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkAzOARTP5QSsu/ZO6oxKbmRoSeywZvoNTIFs9w1Q9bmFMwYX2dfGyoWimnkjgOTf7J7RJj
Subject: Re: [PATCH] connman: Disable tist plugin on powerpc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 10:12:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mei 2012, om 11:52 heeft Richard Purdie het volgende geschreven:

> This plugin doesn't build on powerpc due to powerpc's terminal ioctl =
defintions
> being incompatible with assumptions being made by this module. Until =
someone has
> need and can test this on powerpc, disabling is the safest option.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Koen Kooi <koen@circuitco.com>

> ---
> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
> index 8b27cfb..f2da8d9 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,6 +20,9 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>             ofono \
>             "
>=20
> +TIST =3D "--enable-tist"
> +TIST_powerpc =3D ""
> +
> EXTRA_OECONF +=3D "\
>     ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant \
>     ac_cv_path_PPPD=3D${sbindir}/pppd \
> @@ -28,8 +31,8 @@ EXTRA_OECONF +=3D "\
>     --enable-threads \
>     --enable-loopback \
>     --enable-ethernet \
> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi =
--enable-tist', '--disable-wifi', d)} \
> -    ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth --enable-tist', '--disable-bluetooth', =
d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi =
${TIST}', '--disable-wifi', d)} \
> +    ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
>     --enable-dnsproxy \
>     --enable-ofono \
>     --enable-tools \
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



