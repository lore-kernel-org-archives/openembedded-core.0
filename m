Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TEDTk-0006ev-NT
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 08:09:44 +0200
Received: by wgbdq11 with SMTP id dq11so415780wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=v8TpApR93A/OJmV6tnWRqOgrVt4SoaD3rF+kKRbiXCg=;
	b=Wkh1+cWSDWZgESPyloLQjxb9eX9LaLmV4/jn1qSPo7aHluK+gbz6e4O6nTKF9F3ssW
	9bsGpxlsWVhNAIUMyGDpSMuAKIxIUt1fvrvqpMwygVM3LCLFVz6SIRlOQviSCQKormNt
	PFTxbLdCew5q0VBASVZ8C4I5Vi4u7xCXjrKYMSe1P59cgt8qqN+t/t/XqG6tXJ51xoTi
	/iPF+D5QqmyvTaI4VDDD1AAaHHcta4/kAuF7GKpR/VXwNItsqk2ZNi5JRVWRyQ0Nrdts
	dg7Zlk02f3xvAyev2ATAj3YYIzqFhvlQBygMX5Gqfo51R8ZWdscu8LWzFybted/x8H1s
	XZ9A==
Received: by 10.180.81.193 with SMTP id c1mr4437970wiy.12.1348034223989;
	Tue, 18 Sep 2012 22:57:03 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k2sm3262715wiz.7.2012.09.18.22.57.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 22:57:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 19 Sep 2012 07:57:00 +0200
Message-Id: <60C9B225-F04B-4B56-9137-C0F24872475D@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlPAQkmKJLbj6U/Sc5gIE+IbcmAG83+jKpbb5hW/IwvlurOWrOOT2ZEpzg++AWBNs6Y0iWt
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [for-denzil][pulseaudio-updates 01/10] pulseaudio: disable tcpwrap by default
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
X-List-Received-Date: Wed, 19 Sep 2012 06:09:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

So Scott asked me to explain why these pulseaudio updates are needed in =
denzil, and it's mainly because of udev. The old bluez is using =
deprecated udev API that went away in newer releases and I'm trying to =
get a more recent udev into meta-oe to fix bugs people have reported.
I must admit that pulseaudio 1.x to 2.x is a big step, so patch 7 =
through 10 are questionable and could be replaced with backporting the =
udev api fix from git. But I opted for cherry-picking from master to =
leverage the oe-core QA.

regards,

Koen

Op 17 sep. 2012, om 14:07 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> From: Saul Wold <sgw@linux.intel.com>
>=20
> This ensures that tcpwrapper usage is always disabled, this was
> inconsistent because it would test for libwrap and sometimes enable
> and sometimes not.
>=20
> This ensures consistent build reproducibility.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
> .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
> 2 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc =
b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index a653af5..a2f0d9f 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -31,6 +31,7 @@ EXTRA_OECONF =3D "\
> 		--without-hal \
> 		--disable-hal \
> 		--disable-orc \
> +		--enable-tcpwrap=3Dno \
> 		--with-access-group=3Daudio \
> "
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> index fd61149..d2ed3c8 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> @@ -1,6 +1,6 @@
> require pulseaudio.inc
>=20
> -PR =3D "r8"
> +PR =3D "r9"
>=20
> DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
>=20
> --=20
> 1.7.7.6
>=20



