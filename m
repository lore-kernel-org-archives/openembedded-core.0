Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvAFk-0002tT-Kz
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 16:15:44 +0100
Received: by wwb29 with SMTP id 29so23014wwb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 07:14:14 -0800 (PST)
Received: by 10.216.20.141 with SMTP id p13mr751691wep.102.1299165254684;
	Thu, 03 Mar 2011 07:14:14 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c54sm626825wer.30.2011.03.03.07.14.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 07:14:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299163569-22016-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2011 16:14:10 +0100
Message-Id: <BBA16B16-F338-4F4F-98B6-A541BB6E4887@dominion.thruhere.net>
References: <1299163569-22016-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] debian.bbclass: call auto_libname in reverse sorted AUTO_LIBNAME_PKGS
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
X-List-Received-Date: Thu, 03 Mar 2011 15:15:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mrt 2011, om 15:46 heeft Martin Jansa het volgende geschreven:

> * see comment for reason why we need this
> * more info:
>  =
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-February/0298=
77.html
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> meta/classes/debian.bbclass |    8 +++++++-
> 1 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
> index d35882f..46a9d08 100644
> --- a/meta/classes/debian.bbclass
> +++ b/meta/classes/debian.bbclass
> @@ -107,7 +107,13 @@ python debian_package_name_hook () {
> 					if newpkg !=3D pkg:
> 						bb.data.setVar('PKG_' + =
pkg, newpkg, d)
>=20
> -	for pkg in (bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or =
"").split():
> +	# reversed sort is needed when some package is substring of =
another
> +	# ie in ncurses we get without reverse sort:=20
> +	# DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg =
ncurses-libtic orig_pkg ncurses-libtic debian_pn None newpkg libtic5
> +	# and later
> +	# DEBUG: LIBNAMES: pkgname libtic5 devname libtic pkg =
ncurses-libticw orig_pkg ncurses-libtic debian_pn None newpkg libticw
> +	# so we need to handle ncurses-libticw->libticw5 before =
ncurses-libtic->libtic5
> +	for pkg in sorted((bb.data.getVar('AUTO_LIBNAME_PKGS', d, 1) or =
"").split(), reverse=3DTrue):
> 		auto_libname(packages, pkg)
> }
>=20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



