Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D87846DF96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 21:21:11 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3738040eei.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2013 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4lWzc2SVtxJDHpkmqDFyibA28SMb6EipXQqZfq4MTpE=;
	b=ld5BwgKhOhLAeWYpWDDlzp3U90xwoLJCp6F1CcFyakWPmcp9TPFu0JuoC8ddO4JLyV
	6jzGZPdkgIiuI4SvNJItl/SYjL8cXwCbUTZJrYnMoYbuHS0ArpO/Xp19FiFQMyPm5t58
	coTVBNBjl/Lx/i2FQ/Xzik5UIF0/LbGP2oFZIDZVMOfkS7PgHZwaH49mdNc2MTMQARiD
	JsOz31KRgFnKY3CIYqOX98uDl2yUW1m3jHYVRrtcsE+fZmrc8D2nOCWoU512tdSV/FrP
	VjgaurObhmEjbL6FmwzOj22Mskq+PkcJQ+FR4fHJ5fQlSm7oZXbnrU/phPcnRXiGbJe1
	gBbA==
X-Received: by 10.15.23.206 with SMTP id h54mr22895eeu.17.1386278470698;
	Thu, 05 Dec 2013 13:21:10 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	a51sm110170635eeh.8.2013.12.05.13.21.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Dec 2013 13:21:09 -0800 (PST)
Date: Thu, 5 Dec 2013 22:21:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131205212123.GH3724@jama>
References: <1386195032-18264-1-git-send-email-Martin.Jansa@gmail.com>
	<1386195032-18264-3-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1386195032-18264-3-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH 3/3] WIP: icecc.bbclass: Exclude few variables causing different signatures for native and allarch recipes
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
X-List-Received-Date: Thu, 05 Dec 2013 21:21:12 -0000
X-Groupsio-MsgNum: 47958
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPDwMsyfds7q4mrK"
Content-Disposition: inline

--ZPDwMsyfds7q4mrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 11:10:32PM +0100, Martin Jansa wrote:
> * I'm not entirely sure it's best way to do it, but it's the easiest one
> * we can clean TARGET_FPU in allarch.bbclass to resolve icc_version
> * we can provide separate icc_get_tool function for native recipes

I've tried to implement cleaner solution, it's easy for TARGET_FPU, but
splitting native portion of icc_get_tool is causing me some issues

shouldn't global "d" be always defined?

this fails when called from shell task: expansion of get_tools=20
threw ExpansionError: Failure expanding variable get_tools, expression was
ICECC_CC=3D"${@icc_get_and_check_tool_native(bb, d, 'gcc')}"

which triggered exception NameError: global name 'd' is not defined
but the same line works fine in different shell function

It's probably something trivial, but I don't see it now, any hint would
be appreciated

whole change (currently not working)
http://bpaste.net/show/155875/

Interesting thing is that bitbake -e zlib-native doesn't fail with parse
error (like other parsing errors) but the error message shown above can
be found hidden in bitbake -e output.

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/icecc.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 3c719ef..d1c056c 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -142,6 +142,8 @@ def icc_is_native(bb, d):
>          bb.data.inherits_class("cross", d) or \
>          bb.data.inherits_class("native", d);
> =20
> +# Don't pollute allarch signatures with TARGET_FPU
> +icc_version[vardepsexclude] +=3D "TARGET_FPU"
>  def icc_version(bb, d):
>      if use_icc(bb, d) =3D=3D "no":
>          return ""
> @@ -182,6 +184,8 @@ def icc_get_external_tool(bb, d, tool):
>      target_prefix =3D d.expand('${TARGET_PREFIX}')
>      return os.path.join(external_toolchain_bindir, '%s%s' % (target_pref=
ix, tool))
> =20
> +# Don't pollute native signatures with target TUNE_PKGARCH through STAGI=
NG_BINDIR_TOOLCHAIN
> +icc_get_tool[vardepsexclude] +=3D "STAGING_BINDIR_TOOLCHAIN"
>  def icc_get_tool(bb, d, tool):
>      if icc_is_native(bb, d):
>          return bb.utils.which(os.getenv("PATH"), tool)
> --=20
> 1.8.4.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPDwMsyfds7q4mrK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKg7lMACgkQN1Ujt2V2gBwt8ACdFQ/zsyojNxGapTrPCHJq7GBN
+wQAn1qeUE1ALOaCFk7osRhhKvBzwhPQ
=HMxI
-----END PGP SIGNATURE-----

--ZPDwMsyfds7q4mrK--
