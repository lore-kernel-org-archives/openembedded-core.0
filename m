Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UF3ZB-0005gm-SH
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:19:15 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so2248751eei.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7WS39k7QfV02lW4YtT/u9rqUAQKBDL0ieuekc/uMblc=;
	b=e6ZtQKvKE0Vj9ZocWPmLLewWripzgJg2oADAbLABgbSR5TMvaasCEfplzM2Aztls+a
	of89TQK18KvrpkEoFeoSsV52sIH8n1qASidtQ3hGxd+uECXAkyKm98unickV8QQDXKcu
	hCsp/jPRkw6YxrWv3xt1dtK3VL4tJIRKh3yfkd3NpT9wu6giT/vYL8DXSHkyGoiv88SA
	YWxKA9A9DQftIy0R8qZ8zgPBbcQYd1YBLZvW7F9je//aSb2eIp6JhvHiR9VY5uNF447i
	owwPPKsAIcHTalWUUts0NxQuT2W/tS0CHKdf3bwlzZOFUuGXRiiYs8QWLGINqjm+hlBZ
	JPLg==
X-Received: by 10.15.21.4 with SMTP id c4mr36470877eeu.34.1363010548040;
	Mon, 11 Mar 2013 07:02:28 -0700 (PDT)
Received: from ?IPv6:2001:610:612::c126:330a:62c2:b7af?
	([2001:610:612:0:c126:330a:62c2:b7af])
	by mx.google.com with ESMTPS id 46sm23754625eea.3.2013.03.11.07.02.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 07:02:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4a7f6b52607ac6dfd7651f1d740e1c8f436884c0.1362873102.git.raj.khem@gmail.com>
Date: Mon, 11 Mar 2013 15:02:26 +0100
Message-Id: <24D6D4AF-8B91-49F9-A3AF-DE07D2BE4117@dominion.thruhere.net>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
	<4a7f6b52607ac6dfd7651f1d740e1c8f436884c0.1362873102.git.raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlJ0VnwhNW4RU3aOVlRZ7DrTwAjiaO0PFgPtoLl5wkvW42pn2eE07eOmp8y88KP4yPTRx6S
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] systemd: spin libnss_myhostname to package of its own
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
X-List-Received-Date: Mon, 11 Mar 2013 14:19:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mrt. 2013, om 00:54 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> Fix packaging warning
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-core/systemd/systemd_198.bb |    5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_198.bb =
b/meta/recipes-core/systemd/systemd_198.bb
> index c57ee52..381a67b 100644
> --- a/meta/recipes-core/systemd/systemd_198.bb
> +++ b/meta/recipes-core/systemd/systemd_198.bb
> @@ -98,7 +98,9 @@ do_install() {
> }
>=20
> python populate_packages_prepend (){
> -    systemdlibdir =3D d.getVar("base_libdir", True)
> +    systemdbaselibdir =3D d.getVar("base_libdir", True)
> +    do_split_packages(d, systemdbaselibdir, '^lib(.*)\.so\.*', =
'lib%s', 'Systemd %s library', extra_depends=3D'', allow_links=3DTrue)
> +    systemdlibdir =3D d.getVar("libdir", True)

libnss-myhostname is not a systemd library, but a plugin for the =
nameservice switcher, it is the proper way to get localhost to resolve =
so you don't need to hack netbase like this: =
http://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dcommitdi=
ff;h=3Dd1fe025991f73b1cdc53d18af8afdf6d650b3b14


>     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', =
'Systemd %s library', extra_depends=3D'', allow_links=3DTrue)
> }
> PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
> @@ -146,7 +148,6 @@ FILES_${PN} =3D " ${base_bindir}/* \
>                 ${systemd_unitdir}/system/* \
>                 /lib/udev/rules.d/99-systemd.rules \
>                 ${base_libdir}/security/*.so \
> -                ${libdir}/libnss_myhostname.so.2 \
>                 /cgroup \
>                 ${bindir}/systemd* \
>                 ${bindir}/localectl \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



