Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0ZPN-0001Ob-J4
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:12:33 +0100
Received: by eaal10 with SMTP id l10so567720eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:04:12 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.194.134 as permitted sender) client-ip=10.14.194.134; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.194.134 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.194.134])
	by 10.14.194.134 with SMTP id m6mr1021239een.4.1330005852283 (num_hops
	= 1); Thu, 23 Feb 2012 06:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=la6YID3GVsrvFuhCo4uiTCYUf/9nRAYKgPpMUfxnUwE=;
	b=tDgswytyicnkvJ9YhuLN9ECv9eQhMJ5g7+//2KVzRL/NU+T8F2aGer8BGqKQfLztZF
	xZYZ8vFboDUDiXc/v7gm8+2ZYCZkSL5n9QGGP2rRVmeQ28m1XbxkX/6Sm0Ldxm7FQ9MR
	mYAMhNpW2zuLq3rWFTJmwZStHpF0rmO/qOPVw=
Received: by 10.14.194.134 with SMTP id m6mr803167een.4.1330005852180;
	Thu, 23 Feb 2012 06:04:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm5735056eeb.4.2012.02.23.06.04.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 06:04:11 -0800 (PST)
Date: Thu, 23 Feb 2012 15:04:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120223140409.GT3769@jama.jama.net>
References: <4F4645CC.4050403@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F4645CC.4050403@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bug in recipe version priorities across layers?
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
X-List-Received-Date: Thu, 23 Feb 2012 14:12:33 -0000
X-Groupsio-MsgNum: 17774
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="80Ds8Z/hZmemMosa"
Content-Disposition: inline

--80Ds8Z/hZmemMosa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 02:57:32PM +0100, Andreas Oberritter wrote:
> Hi,
>=20
> I have a problem with bitbake choosing the wrong version of a=20
> recipe. The facts are:
>=20
> - I have multiple layers, including a machine layer, meta-opendreambox,
> meta-openembedded and openembedded-core.
> - meta-opendreambox contains wpa-supplicant_0.5.10.bb and=20
> wpa-supplicant_0.7.3.bbappend.
> - openembedded-core contains wpa-supplicant_0.7.3.bb.
> - There's no PREFERRED_VERSION statement for wpa-supplicant in any of=20
> the active layers. There is such a statement in another machine's=20
> layer, which shares the same TMPDIR, but even has a different PACKAGE_ARC=
H.
> - There's no DEFAULT_PREFERENCE statement in any of the recipes.
> - The machine I'm building for shall use the latest available version.

Afaik latest version from layer with highest priority wins. Which
doesn't always mean latest version globally.

DEFAULT_PREFERENCE doesn't help e.g. to demote development version in some
layer with higher priority.

But PREFERRED_VERSION does work.

Cheers,

> - The older wpa-supplicant is provided for a different machine.
> - Both bitbake and openembedded-core are from today's master branches.
>=20
> The problem: The machine I'm building for also picks up version 0.5.10,=
=20
> unless I eiher copy 0.7.3 from openembedded-core to my layer or delete=20
> version 0.5.10 from my layer. Deleting wpa-supplicant_0.7.3.bbappend=20
> doesn't change the behaviour.
>=20
> How can copying the recipe make a difference? The BBFILE_PRIORITY=20
> for meta-opendreambox is higher than for openembedded-core, but I=20
> wouldn't expect this to have an effect on recipes with different=20
> versions. Is this expected behaviour?
>=20
> Here's a log of all lines matching wpa-supplicant of "bitbake=20
> -ccleansstate wpa-supplicant" with debug enabled:
>=20
> DEBUG: Cache: /a/openembedded-core/meta/recipes-connectivity/wpa-supplica=
nt/wpa-supplicant_0.7.3.bb is not cached
> DEBUG: Cache: /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wp=
a-supplicant_0.5.10.bb is not cached
> DEBUG: BB /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-su=
pplicant_0.5.10.bb: handle(data)
> DEBUG: LOAD /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wpa-=
supplicant_0.5.10.bb
> DEBUG: BB /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/w=
pa-supplicant_0.7.3.bb: handle(data)
> DEBUG: LOAD /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant=
/wpa-supplicant_0.7.3.bb
> DEBUG: CONF /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant=
/wpa-supplicant_0.7.3.bb:1: including wpa-supplicant-0.7.inc
> DEBUG: BB /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant/w=
pa-supplicant-0.7.inc: handle(data, include)
> DEBUG: LOAD /a/openembedded-core/meta/recipes-connectivity/wpa-supplicant=
/wpa-supplicant-0.7.inc
> DEBUG: Appending .bbappend file /a/meta-openembedded/meta-oe/recipes-conn=
ectivity/wpa-supplicant/wpa-supplicant_0.7.3.bbappend to /a/openembedded-co=
re/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> DEBUG: BB /a/meta-openembedded/meta-oe/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.7.3.bbappend: handle(data, include)
> DEBUG: LOAD /a/meta-openembedded/meta-oe/recipes-connectivity/wpa-supplic=
ant/wpa-supplicant_0.7.3.bbappend
> DEBUG: providers for wpa-supplicant are: ['wpa-supplicant']
> DEBUG: sorted providers for wpa-supplicant are: ['/a/meta-opendreambox/re=
cipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
> DEBUG: adding /a/meta-opendreambox/recipes-connectivity/wpa-supplicant/wp=
a-supplicant_0.5.10.bb to satisfy wpa-supplicant
> DEBUG: Added dependency virtual/mipsel-oe-linux-gcc for /a/meta-opendream=
box/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: Added dependency virtual/mipsel-oe-linux-compilerlibs for /a/meta-=
opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: Added dependency virtual/libc for /a/meta-opendreambox/recipes-con=
nectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: Added dependency openssl for /a/meta-opendreambox/recipes-connecti=
vity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: Added runtime dependency wpa-supplicant for /a/meta-opendreambox/r=
ecipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: Added runtime dependency wpa-supplicant-dev for /a/meta-opendreamb=
ox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: Added runtime recommendation wpa-supplicant for /a/meta-opendreamb=
ox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: Added runtime recommendation wpa-supplicant-passphrase for /a/meta=
-opendreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb
> DEBUG: providers for wpa-supplicant are: ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant (value None) against ['=
wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10 (value None) aga=
inst ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10-r0 (value None) =
against ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3 (value None) agai=
nst ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3-r7 (value None) a=
gainst ['wpa-supplicant']
> DEBUG: sorted providers for wpa-supplicant are: ['/a/meta-opendreambox/re=
cipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
> DEBUG: adding '/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/w=
pa-supplicant_0.5.10.bb' to satisfy runtime 'wpa-supplicant'
> DEBUG: providers for wpa-supplicant-dev are: ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant (value None) against ['=
wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10 (value None) aga=
inst ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10-r0 (value None) =
against ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3 (value None) agai=
nst ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3-r7 (value None) a=
gainst ['wpa-supplicant']
> DEBUG: sorted providers for wpa-supplicant-dev are: ['/a/meta-opendreambo=
x/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
> DEBUG: adding '/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/w=
pa-supplicant_0.5.10.bb' to satisfy runtime 'wpa-supplicant-dev'
> DEBUG: providers for wpa-supplicant-passphrase are: ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant (value None) against ['=
wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10 (value None) aga=
inst ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.5.10-r0 (value None) =
against ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3 (value None) agai=
nst ['wpa-supplicant']
> DEBUG: checking PREFERRED_PROVIDER_wpa-supplicant-0.7.3-r7 (value None) a=
gainst ['wpa-supplicant']
> DEBUG: sorted providers for wpa-supplicant-passphrase are: ['/a/meta-open=
dreambox/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.5.10.bb']
> DEBUG: adding '/a/meta-opendreambox/recipes-connectivity/wpa-supplicant/w=
pa-supplicant_0.5.10.bb' to satisfy runtime 'wpa-supplicant-passphrase'
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_unpack
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_patch
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_install
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_populate_sysroot
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_populate_sysroot_setscene
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_listtasks
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_clean
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_checkuri
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_checkuriall
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_fetch
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_fetchall
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_build
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_buildall
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_configure
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_compile
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_package_write
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_package
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_cleansstate
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_cleanall
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_rm_work
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_rm_work_all
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_recipe_sanity
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_recipe_sanity_all
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_populate_lic
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_package_setscene
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_package_write_ipk
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_package_write_ipk_setscene
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_devshell
> DEBUG: Processing /a/meta-opendreambox/recipes-connectivity/wpa-supplican=
t/wpa-supplicant_0.5.10.bb:do_populate_lic_setscene
> DEBUG: Considering 0 (/a/meta-opendreambox/recipes-connectivity/wpa-suppl=
icant/wpa-supplicant_0.5.10.bb, do_clean): set([1])
> DEBUG: Considering 1 (/a/meta-opendreambox/recipes-connectivity/wpa-suppl=
icant/wpa-supplicant_0.5.10.bb, do_cleansstate): set([])
> DEBUG: Stampfile /a/tmp/stamps/mipsel-oe-linux/wpa-supplicant-0.5.10-r0.d=
o_clean not available
> NOTE: Running task 1 of 2 (ID: 0, /a/meta-opendreambox/recipes-connectivi=
ty/wpa-supplicant/wpa-supplicant_0.5.10.bb, do_clean)
> NOTE: package wpa-supplicant-0.5.10-r0: task do_clean: Started
> NOTE: package wpa-supplicant-0.5.10-r0: task do_clean: Succeeded
> DEBUG: Marking task 1 (/a/meta-opendreambox/recipes-connectivity/wpa-supp=
licant/wpa-supplicant_0.5.10.bb, do_cleansstate) as buildable
> DEBUG: Stampfile /a/tmp/stamps/mipsel-oe-linux/wpa-supplicant-0.5.10-r0.d=
o_cleansstate not available
> NOTE: Running task 2 of 2 (ID: 1, /a/meta-opendreambox/recipes-connectivi=
ty/wpa-supplicant/wpa-supplicant_0.5.10.bb, do_cleansstate)
> NOTE: package wpa-supplicant-0.5.10-r0: task do_cleansstate: Started
> NOTE: package wpa-supplicant-0.5.10-r0: task do_cleansstate: Succeeded
>=20
> Regards,
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--80Ds8Z/hZmemMosa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GR1gACgkQN1Ujt2V2gBxRqgCcDp+fRf/Y/+7iVK+vm0kgau4a
6w4An30LzGUiiFByYuOaMSP260mYr3nq
=InSH
-----END PGP SIGNATURE-----

--80Ds8Z/hZmemMosa--
