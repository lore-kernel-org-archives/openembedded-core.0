Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5C571633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 10:26:20 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so192688761wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=pv3PDjrN14Gq8igtElZUZIXNw+fKnnmSIpjqyHxbqRg=;
	b=rzV+qS0RKs9AFhjrWZaM0gNdf+vA2VonzBf4ILcbCClwv/KgVO5e5GsjbzM2RQvBCh
	Yf909AmlfngDeLQJ7cGP6lPksyNqs4dWT2+zj/hM8qKsOACnoZP1t4gFyj1KfRmkrg5m
	5xzzrNvFtrqRdn+ST1CSlSkRiglZQllH8lfNmtar690SgeTXv00HuL96skOjTCmHIF7e
	7Z6T7CgDzHfMFlr7HEMntY9xXfgwQfhMTNXfE+BiIGeZOYqK2mX5TUPSUJqqn0ifDJPf
	aaSqbPAgGQCACf70D/Omo59hyt4AJts+AZ9XT7NPPkCyyW3lRD8uwuohOizkvMBSxNue
	Dx1A==
X-Received: by 10.180.92.230 with SMTP id cp6mr2030293wib.27.1446027980062;
	Wed, 28 Oct 2015 03:26:20 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id m1sm850105wif.4.2015.10.28.03.26.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Oct 2015 03:26:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <C5B806CA-2384-4924-8FA7-8BC6F146416A@gmail.com>
Date: Wed, 28 Oct 2015 11:26:18 +0100
Message-Id: <611CD789-ACC1-47CE-9503-2C40F26E4BB1@gmail.com>
References: <C5B806CA-2384-4924-8FA7-8BC6F146416A@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH 1/3] perl: fix Perl5 module builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 10:26:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 08.10.2015 um 16:21 schrieb Jens Rehsack <rehsack@gmail.com>:
>=20
> This patch fixes some issues in classes providing cpan module build =
support:
>=20
> * add support even for xs modules with more than 3 levels as
>  B::Hooks::End::Of::Scope or Math::Random::ISAAC::XS
> * correct handling of Module::Build (as far as stolen from pkgsrc
>  and my humble knowledge)
> * configure to install to vendor_libs as default, even when
>  inherited do_install remains unused (overwritten do_install)
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> meta/classes/cpan-base.bbclass  |  4 ++++
> meta/classes/cpan.bbclass       |  2 +-
> meta/classes/cpan_build.bbclass | 13 +++++++++++--
> 3 files changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/cpan-base.bbclass =
b/meta/classes/cpan-base.bbclass
> index d9817ba..7810a4d 100644
> --- a/meta/classes/cpan-base.bbclass
> +++ b/meta/classes/cpan-base.bbclass
> @@ -49,7 +49,11 @@ PERLVERSION[vardepvalue] =3D ""
> FILES_${PN}-dbg +=3D "${PERLLIBDIRS}/auto/*/.debug \
>                     ${PERLLIBDIRS}/auto/*/*/.debug \
>                     ${PERLLIBDIRS}/auto/*/*/*/.debug \
> +                    ${PERLLIBDIRS}/auto/*/*/*/*/.debug \
> +                    ${PERLLIBDIRS}/auto/*/*/*/*/*/.debug \
>                     =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/.debug \
>                     =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/.debug \
>                     =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/.debug \
> +                    =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/*/.debug \
> +                    =
${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/*/*/.debug \
>                     "
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index e2bbd2f..8e079e0 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -17,7 +17,7 @@ export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_vers
>=20
> cpan_do_configure () {
> 	export PERL5LIB=3D"${PERL_ARCHLIB}"
> -	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL ${EXTRA_CPANFLAGS}
> +	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
${EXTRA_CPANFLAGS}
>=20
> 	# Makefile.PLs can exit with success without generating a
> 	# Makefile, e.g. in cases of missing configure time
> diff --git a/meta/classes/cpan_build.bbclass =
b/meta/classes/cpan_build.bbclass
> index 4f648a6..3653748 100644
> --- a/meta/classes/cpan_build.bbclass
> +++ b/meta/classes/cpan_build.bbclass
> @@ -8,6 +8,7 @@ EXTRA_CPAN_BUILD_FLAGS ?=3D ""
> # Env var which tells perl if it should use host (no) or target (yes) =
settings
> export PERLCONFIGTARGET =3D "${@is_target(d)}"
> export PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
> +export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
> export LD =3D "${CCLD}"
>=20
> cpan_build_do_configure () {
> @@ -24,14 +25,22 @@ cpan_build_do_configure () {
> 				--install_path bindoc=3D${mandir}/man1 \
> 				--install_path libdoc=3D${mandir}/man3 \
>                                 ${EXTRA_CPAN_BUILD_FLAGS}
> +
> +	# Build.PLs can exit with success without generating a
> +	# Build, e.g. in cases of missing configure time
> +	# dependencies. This is considered a best practice by
> +	# cpantesters.org. See:
> +	#  * http://wiki.cpantesters.org/wiki/CPANAuthorNotes
> +	#  * =
http://www.nntp.perl.org/group/perl.qa/2008/08/msg11236.html
> +	[ -e Build ] || bbfatal "No Build was generated by Build.PL"
> }
>=20
> cpan_build_do_compile () {
> -        perl Build
> +        perl Build verbose=3D1
> }
>=20
> cpan_build_do_install () {
> -	perl Build install
> +	perl Build install --destdir ${D}
> }
>=20
> EXPORT_FUNCTIONS do_configure do_compile do_install
> --=20
> 2.3.8 (Apple Git-58)
>=20
> --=20
> Jens Rehsack - rehsack@gmail.com

Since it's two weeks ago since submitted and this patch series fixes =
several problems how yocto deals with perl module distributions, I'd =
like to get a more concrete explanation why an infrastructure fix isn't =
validated during feature freeze for branching.

None of the three patches adds a feature, they all fix broken =
infrastructure of perl module handling in Yocto which should better now =
validated than after branching.
Since after freeze the master branch might become unstable for a while, =
I might not be able to re-submit.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


