Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoGRR-00045E-Bx
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 16:59:33 +0200
Received: by wyg30 with SMTP id 30so2605950wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 07:55:12 -0700 (PDT)
Received: by 10.216.63.146 with SMTP id a18mr1794515wed.86.1312296911169;
	Tue, 02 Aug 2011 07:55:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n6sm4067011wed.40.2011.08.02.07.55.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 07:55:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 2 Aug 2011 16:55:08 +0200
Message-Id: <C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Tue, 02 Aug 2011 14:59:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The bug I was seeing was caused by something else, but I'd still like =
feedback on this patch to find out why the dot vs dash difference exists

Op 2 aug. 2011, om 16:47 heeft Koen Kooi het volgende geschreven:

> When using binary locales rootfs generation fails with:
>=20
> | Unknown package 'locale-base-en-us'.
> | Collected errors:
> |  * opkg_install_cmd: Cannot install package locale-base-en-us.
>=20
> This is due to:
>=20
> $ dpkg-deb -I ipk/armv7a/locale-base-en-us_2.12-r16_armv7a.ipk | grep =
Depends
> Depends: eglibc-binary-localedata-en.us
>=20
> Note the '.' seperator
>=20
> $ ls ipk/armv7a/ | grep binary-localedata-en | grep us
> eglibc-binary-localedata-en-us_2.12-r16_armv7a.ipk
>=20
> Note the '-' seperator vs the '.' in the locale-base packages.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/classes/libc-package.bbclass |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/libc-package.bbclass =
b/meta/classes/libc-package.bbclass
> index de57230..67d08c0 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -243,7 +243,7 @@ python package_do_split_gconvs () {
> 	def output_locale_binary_rdepends(name, pkgname, locale, =
encoding):
> 		m =3D re.match("(.*)_(.*)", name)
> 		if m:
> -			libc_name =3D "%s.%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
> +			libc_name =3D "%s-%s" % (m.group(1), =
m.group(2).lower().replace("-",""))
> 		else:
> 			libc_name =3D name
> 		bb.data.setVar('RDEPENDS_%s' % pkgname, =
legitimize_package_name('%s-binary-localedata-%s' \
> --=20
> 1.6.6.1
>=20



