Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4A35E77140
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 16:29:44 +0000 (UTC)
Received: by wmec201 with SMTP id c201so54143738wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=1Na/8F9xYA2y3DDE8AMX9VyNaa1Xxp+/ypUpbxKHT+4=;
	b=GSEXnk4T6aPVVhayBNM5aPvXSRnH/HgJV29xj1aUBeLTA5dr56PaLQX+dNqgRC1D0U
	1CC8JNxWZ8HFVuSugPkCYQjuRIlt8UhqnYp7m9Pttoq7lQkrcNgkjRP7LTGclacgaSPw
	LDanmZFLzxm2hUoCRKD19GCWkLE40ignkOLcN3zJrQK360zkyCaUD+hzrb1NQsVGn4mZ
	r80djDczbNoKtWTYFlQEbCkesaEZ6/uVxk68mUT9nYeaANnj3h1ufBnUqTjC88HWDzrG
	1O4hNh4q43jVsISkO4NOWGt6nH9F085e6gk88KUHKzV0qvBok8OjUFmu8w1lEyQuP1el
	bGvQ==
X-Received: by 10.28.63.22 with SMTP id m22mr26263530wma.58.1447259384802;
	Wed, 11 Nov 2015 08:29:44 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id q1sm9751921wje.39.2015.11.11.08.29.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 08:29:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1447253674-26930-1-git-send-email-ross.burton@intel.com>
Date: Wed, 11 Nov 2015 17:29:43 +0100
Message-Id: <4D2DB967-E3D9-4602-B374-3D49B44AC751@gmail.com>
References: <1447253674-26930-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: sanity check that the bignum module is present
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
X-List-Received-Date: Wed, 11 Nov 2015 16:29:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 15:54 schrieb Ross Burton <ross.burton@intel.com>:
>=20
> The crypto_use_bigint_in_x86-64_perl patch uses the "bigint" module to
> transparently support 64-bit integers on 32-bit hosts.  Whilst bigint =
(part of
> bignum) is a core Perl module not all distributions install it =
(notable Fedora
> 23).
>=20
> As the error message when bignum isn't installed is obscure, add a =
task to check
> that it is available and alert the user if it isn't.
>=20
> [ YOCTO #8562 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb =
b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> index fd56841..69b0d44 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> @@ -56,3 +56,15 @@ PARALLEL_MAKEINST =3D ""
> do_configure_prepend() {
>   cp ${WORKDIR}/find.pl ${S}/util/find.pl
> }
> +
> +# The crypto_use_bigint patch means that perl's bignum module needs =
to be
> +# installed, but some distributions (for example Fedora 23) don't =
ship it by
> +# default.  As the resulting error is very misleading check for =
bignum before
> +# building.
> +do_checkperl() {
> +	if ! perl -Mbigint -e true; then
> +		bbfatal "The perl module 'bignum' was not found but this =
is required to build openssl.  Please install this module (often =
packaged as perl-bignum) and re-run bitbake."
> +	fi
> +}
> +addtask checkperl before do_compileq
> +do_checkperl[nostamp] =3D "1"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

That looks very good - I check it when I'm home on my CI machine where =
the ancient perls live :)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


