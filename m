Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QEgto-0006nK-NV
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 13:57:48 +0200
Received: by wwb17 with SMTP id 17so468172wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2011 04:55:19 -0700 (PDT)
Received: by 10.217.4.4 with SMTP id t4mr4946461wes.39.1303818919424;
	Tue, 26 Apr 2011 04:55:19 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id l24sm3794962wbc.64.2011.04.26.04.55.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2011 04:55:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303130678-975-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 26 Apr 2011 13:55:15 +0200
Message-Id: <50DFEF7C-1FC8-4987-9EA7-5C8BE6D2CB98@dominion.thruhere.net>
References: <1303130678-975-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC][PATCH] git: use DESTDIR=$D instead prefixing all variables by $D
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
X-List-Received-Date: Tue, 26 Apr 2011 11:57:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr 2011, om 14:44 heeft Martin Jansa het volgende geschreven:

> * with git-native and rm_work enabled I've noticed git fetcher errors =
like:
>  warning: templates not found =
/OE/shr-core/tmp/work/x86_64-linux/git-native-1.7.3.4-r0/image/OE/shr-core=
/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>  fatal: Unable to find remote helper for 'http'
>  for every recipe using http:// for git repo
> * after this change template_dir points to
>  /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>  without that workdir prefix
> * haven't tested target recipe, but I guess it needs different fix or
>  maybe it worked before and gets broken by this change (that's why =
this
>  is just RFC)


Can you send this as a proper patch that bumps PR? I'm getting really =
annoyed by this bug and I hope Saul will pick it up soon.

regards,

Koen

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/recipes-devtools/git/git.inc |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/git/git.inc =
b/meta/recipes-devtools/git/git.inc
> index e1d1c71..843a1d3 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -14,8 +14,8 @@ EXTRA_OECONF =3D =
"--with-perl=3D${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
> inherit autotools
>=20
> do_install () {
> -	oe_runmake install prefix=3D${D} bindir=3D${D}${bindir} =
gitexecdir=3D${D}${gitexecdir} \
> -		template_dir=3D${D}${datadir}/git-core/templates \
> +	oe_runmake install DESTDIR=3D"${D}" bindir=3D${bindir} =
gitexecdir=3D${gitexecdir} \
> +		template_dir=3D${datadir}/git-core/templates \
> 		GIT_PYTHON_DIR=3D${D}${datadir}/git-core/python
> }
>=20
> --=20
> 1.7.5.rc1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



