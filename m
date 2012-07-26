Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuJHl-0002ps-Pc
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 10:19:05 +0200
Received: by wibhq4 with SMTP id hq4so5340800wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 01:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=8f5TVJCG7fcJuRKpU0iCfbgNade9KTWmMW90Nzq03p0=;
	b=OJ4guqSWgYn13hBSF+z2wfqGv6gHNNjAM3Mkd3OqpZNw8xEZHiooWEGMNMrAHswhn1
	Hut6u4yIVUafPutTjQZCUjNtJuGa7iK+G6aYgmgHjXFhBLr9iShspF6TlB6Rge9rNtse
	dCeMtebHjk+c2LNgVrTNG8JAT6CsSKXP5dU8SshOoJ61boabYy7QU7MwckFrOm+3BH3t
	S8RW8+QcEqYAJgy3QEwvHH0JGHmdrJkQQF4ww+IiF+6MteWCc6f+/HQccBeBfJEAQIha
	EAHZBt3ETIG+avNZL51DmNwTrJwn916J0Uf0gtlUrsEPGa+nwNeYdEMPXQUZ3zfRNXDu
	dHdg==
Received: by 10.216.255.146 with SMTP id j18mr8206676wes.163.1343290055417;
	Thu, 26 Jul 2012 01:07:35 -0700 (PDT)
Received: from [172.20.3.202] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fu3sm10745802wib.10.2012.07.26.01.07.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 01:07:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343288380-11588-1-git-send-email-sgw@linux.intel.com>
Date: Thu, 26 Jul 2012 10:07:29 +0200
Message-Id: <136870DB-6E6F-4A3D-B92C-4FF290AEF03F@dominion.thruhere.net>
References: <1343288380-11588-1-git-send-email-sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkY2MFyfj/NRnCSW8yWQ0Js+jwO8wxD6GH6Pz63jLjNTEM4vKYeDdhmYShobXAdlBuSgWl3
Subject: Re: [PATCH] pkgconfig: Fix packaging issue
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
X-List-Received-Date: Thu, 26 Jul 2012 08:19:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 09:39 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> [YOCTO #1908]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-devtools/pkgconfig/pkgconfig.inc |    4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc =
b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> index 00c23d7..8a8320e 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> @@ -32,4 +32,8 @@ do_configure_prepend () {
>=20
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> +# Set an empty dev package to ensure the base PN package gets
> +# the pkg.m4 macros, pkgconfig does not deliver any other -dev
> +# files.
> +FILES_${PN}-dev =3D ""
> FILES_${PN} +=3D "${datadir}/aclocal/pkg.m4"

Missing PR bump and broken upgrade path due to files moving around and =
no RREPLACES_foo. And I suspect you'll want ALLOW_EMPTY_${PN}-dev in =
there as well :)=


