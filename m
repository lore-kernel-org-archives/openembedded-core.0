Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T4UII-0006K5-Fy
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 12:05:42 +0200
Received: by wibhq4 with SMTP id hq4so642530wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 02:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=PSFXly5W1HFoEzJyeP6fqOw/Fh6U9xHVyOSiQ2ZPGtM=;
	b=gZ0o2do6VH+oMLzju9NIBulQgK7B0/UuQFlTKH880QgXLbVldWIM+qgNPLRI96oY3y
	0hiEndAZsXTo6PcoB/iIl+zQTByLEjchMvOU6vHXDF/n2rKyH6NQU5/HfYBQGHNcM2P8
	IXa/vQRuZ9J03Skf4Vludx2dPrDjtvyYzfaFTnrUUtZSVn1VXvz4so7TWKniEG8k5JAc
	EYy+E3jIB7rC2oZOw53XEm85jrHZPgPOYrt8pqEaYmkG+BXqFyu9T3JbCSoehse5Tqjm
	w1hYyI40PvCOFHTS5nlMURDGcCRV4b/Ih4/Rb6QuuCrQsWLhNeuD+AJstGf5FriNl2DU
	kPpQ==
Received: by 10.216.203.154 with SMTP id f26mr574076weo.104.1345715616583;
	Thu, 23 Aug 2012 02:53:36 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h9sm43989304wiz.1.2012.08.23.02.53.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 02:53:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1345685506-27178-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 23 Aug 2012 11:53:34 +0200
Message-Id: <A8829627-6DCD-4087-941A-5C3CC53309F3@dominion.thruhere.net>
References: <1345685506-27178-1-git-send-email-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQmEaSI9E/61fR+ilAMTONcBN92Vr3OVVlIFWytMGwkEfKMh9LzNaba9po283C/tSCofidps
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iputils: Fix postinst to run on cross rootfs generation
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
X-List-Received-Date: Thu, 23 Aug 2012 10:05:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 aug. 2012, om 03:31 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> rpm shows error messages like /bin/traceroute6 not found
> when building cross rootfs
>=20
> Yocto # 2894
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-extended/iputils/iputils_s20101006.bb |    6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-extended/iputils/iputils_s20101006.bb =
b/meta/recipes-extended/iputils/iputils_s20101006.bb
> index 62e2b5e..856bde4 100644
> --- a/meta/recipes-extended/iputils/iputils_s20101006.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20101006.bb
> @@ -59,15 +59,15 @@ ALTERNATIVE_${PN}-ping6 =3D "ping6"
> ALTERNATIVE_LINK_NAME[ping6] =3D "${base_bindir}/ping6"
>=20
> pkg_postinst_${PN}-ping () {
> -       chmod 4555 ${base_bindir}/ping
> +       chmod 4555 $D${base_bindir}/ping
> }
>=20
> pkg_postinst_${PN}-ping6 () {
> -       chmod 4555 ${base_bindir}/ping6
> +       chmod 4555 $D${base_bindir}/ping6
> }
>=20
> pkg_postinst_${PN}-traceroute6 () {
> -	chmod 4555 ${base_bindir}/traceroute6
> +	chmod 4555 $D${base_bindir}/traceroute6
> }
>=20
> PACKAGES +=3D "${PN}-ping ${PN}-ping6 ${PN}-arping ${PN}-tracepath =
${PN}-tracepath6 ${PN}-traceroute6"

MIssing PR bump=


