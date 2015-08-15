Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2E88D72A78
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 19:34:16 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so41852614pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=m3SFBE1Ece25sKhgUg7S059oqImkklSo+rJy1Qs4p+s=;
	b=wMQgHoq6bJ6y3TqlB2Uv+tjxK2EADXhMYg9Eu58R3OJT+Zmr7umPzfpRNXHcdDr/qN
	gKETOTW4tiJyy2QiAkAlj2juqKeIgmFXr/Aw3Hc/h3EO11knHr+xk7mopbGTcFpEP+tQ
	qVgQxOyVf3P/2cgLksafryly1C7APT0Wl2ygW9QRwkma7EU6U60Ujt7/NIHJF1rU/IYJ
	ttwTqOHJDvVEsAPRcknvyrwNw8BXqTjoCNoGeMTfEzOcjfV7zbyR4DHf0W27JN6IBR42
	YtOV4r0gUkIGX9Hh+ZPvP4ufc5HEf00vG0a5JgXOiHbZa6uB63ptOTKYs/eXMKGVNuiV
	p/9g==
X-Received: by 10.70.132.228 with SMTP id ox4mr102127390pdb.0.1439667257082;
	Sat, 15 Aug 2015 12:34:17 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:3486:a8d6:107a:4b76?
	([2601:646:8601:4580:3486:a8d6:107a:4b76])
	by smtp.gmail.com with ESMTPSA id
	w17sm9547125pbt.17.2015.08.15.12.34.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Aug 2015 12:34:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1435759342-5312-5-git-send-email-dbaryshkov@gmail.com>
Date: Sat, 15 Aug 2015 12:34:11 -0700
Message-Id: <B8E44407-53A5-4332-8124-3DC507180D8E@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<1435759342-5312-5-git-send-email-dbaryshkov@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] glibc: don't override TUNE_CCARGS for MIPS
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
X-List-Received-Date: Sat, 15 Aug 2015 19:34:19 -0000
X-Groupsio-MsgNum: 69472
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A4AC11C7-DB3C-48F4-A251-0D22A952235D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A4AC11C7-DB3C-48F4-A251-0D22A952235D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 1, 2015, at 7:02 AM, Dmitry Eremin-Solenikov =
<dbaryshkov@gmail.com> wrote:
>=20
> Overriding TUNE_CCARGS this way breaks MULTILIB setup for MIPS. This
> override disables multilib handling of tunes for TUNE_CCARGS, thus
> enforcing glibc's TUNE_CCARGS to the TUNE_CCARGS of main DEFAULTTUNE.
>=20
> Glibc perfectly build without this override for both simple and =
multilib
> cases.
>=20

this patch has been applied however we should reopen it.
This has to be fixed differently. its not a build time issue but a =
runtime one. So find
alternative way of passing these options to glibc build to accommodate =
your changes.

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> meta/recipes-core/glibc/glibc_2.21.bb | 10 ----------
> 1 file changed, 10 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb =
b/meta/recipes-core/glibc/glibc_2.21.bb
> index 8197c29..52252b3 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -95,16 +95,6 @@ do_patch_append() {
>     bb.build.exec_func('do_fix_readlib_c', d)
> }
>=20
> -# for mips glibc now builds syscall tables for all abi's
> -# so we make sure that we choose right march option which is
> -# compatible with o32,n32 and n64 abi's
> -# e.g. -march=3Dmips32 is not compatible with n32 and n64 therefore
> -# we filter it out in such case -march=3Dfrom-abi which will be
> -# mips1 when using o32 and mips3 when using n32/n64
> -
> -TUNE_CCARGS_mips :=3D "${@oe_filter_out('-march=3Dmips32', =
'${TUNE_CCARGS}', d)}"
> -TUNE_CCARGS_mipsel :=3D "${@oe_filter_out('-march=3Dmips32', =
'${TUNE_CCARGS}', d)}"
> -
> do_fix_readlib_c () {
> 	sed -i -e =
's#OECORE_KNOWN_INTERPRETER_NAMES#${EGLIBC_KNOWN_INTERPRETER_NAMES}#' =
${S}/elf/readlib.c
> }
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A4AC11C7-DB3C-48F4-A251-0D22A952235D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXPlDcACgkQuwUzVZGdMxR1LQCeK1nMor9Sbg688Q6xSL/ig2Xn
7qoAnR2W33x+/NuLFDmLwcdAWyh3qg0G
=s0Y5
-----END PGP SIGNATURE-----

--Apple-Mail=_A4AC11C7-DB3C-48F4-A251-0D22A952235D--
