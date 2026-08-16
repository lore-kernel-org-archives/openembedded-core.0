Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982CAC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:05:35 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7996.1786878325851202451
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=PNsJdbmN;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=HlhnHVa2;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E5BC87A003E;
	Sun, 16 Aug 2026 07:05:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Aug 2026 07:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786878324;
	 x=1786964724; bh=I8a9JzzSsHDFaCKGW7m8xAOY9ObTq+oQgD6Hm3SqWOc=; b=
	PNsJdbmNQhnd9UcGVCHx0h1yAserunzfwhFRgNtIWzmqMpYUyzC53flQ8l1788kg
	pqgw0SSCHlkVlk4Zw2pgVDlDMYs0lKxgOZaKe/8OS8VbHauyXhWhfRH2x/dpkPG+
	ZuX5rQVH/Cn24XI7z9btbDZyjks2ony44VxZgMs2L7xc5rNIps5YvFMVgv/tVwgp
	T/MDxJQLPfkTmK1wZLhtYubHHJyHeexiyBuzKTdB+nC5oPb+j9PGy88/PfxrkNrZ
	omFePYb8lYMg8lHbKmUbgD5ZhpOMaWbXtk2T1ChOskrKzcuCAVOro7xh4KnR5yaG
	BqOVxVOlrLDiNqwTpTSdDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786878324; x=
	1786964724; bh=I8a9JzzSsHDFaCKGW7m8xAOY9ObTq+oQgD6Hm3SqWOc=; b=H
	lhnHVa2Tu0Z/gM1wh1JS1B5UpumICdKRfQR+E9gkF/CMkKxq5XDCFXDO3hyd3dUS
	NXamZfrgP3VM4ojHoCLDZs4RT1ZxwCZell8LVtj+6SZxps6TlHaXw51IFz8mCPNn
	Lb0TIaMMWTtDYGtk/BTqdsw6I+Oer6+talO4cCnMWwcQlYMrd+dUanf1ATfDqJLz
	l5Dx8k7ipCsF+Sbckwu/BRS3/rUwqOxVXiG6bBFrEsETdmYIphl5cJzfmXHIwpqO
	nz7bO2sV7uJLiAyOGG2ezzerkEKJ6xh8HnHWNnnF5Pi1eILsJUR0W+8OlKOM3z65
	S04Xa8jNOIbOSscuzEvvg==
X-ME-Sender: <xms:dJmBaugwy4imYb91e59ixVayLbrTfUrjSqWWoSWQ-cqbAHEzsqXIjg>
    <xme:dJmBal4pgS2C4tKtMDKU2fNZxRZprGk72DDmhSXlH_hkHa1o2p8obTRAfcqOfjYpW
    TjqklwR5XsBeyNmmeUAZM-kdWv547vU26BBh72QJKSY6v09zx8mJX0>
X-ME-Received: <xmr:dJmBauaj47Rua5fmv4TLJxo7kdbcA5x7RkyN-tMGhqUAXqRbi2AQ6hiScg2cSBlNBGmdacemIF7PEUsu6lLs9BdFWeCyz6iGrVN3JkQFnyx9>
X-ME-Proxy-Cause: dmFkZTFaLjvjZQaEqAV25+/F4Fofow03nCwcEkyb6bjWwaiEKrePgztg+moEm+A2hHHdpW
    8xqW4SLSBgenCzMeRhc2W/JgKvhnjKdR1SbJGTvSJqJI33YRMTeBaZ9YPTf4pAa6nCoHxt
    WsAVycTcQhP1UtDipUaJVrD3CdB9clL5Y8WMCngvTo4cBmTqRF2AWrClnrUNn9nuzOOs40
    +W3wQVsrg0eNdqlOfNUYu+Ur1VEaBdAVe0TYgq0NwUZnvkEEl/ZYFVLz39vrKw92jvcS2o
    cjkCBZeUt3y4NNnSs7kXuQOs54xbBYkuBLF6codN6qatssiJrINTABBBrsjUYoyWnV9DHy
    a6NGpnK2Bz6eJx8LF5osYhzJimJ860T1rANjIk82c2hR8K+hE9LawA+KdfXUM6hWjLwroq
    GSFt9jyEB/QCJAlESnk6mTGcY9HEb5qg48kfNpFsJKvzOZ0UO0Qp88zKAhyQFoUWvLmFTi
    l+4tmrlZeSwDtqHoIaUz9P8KngI9MtG+CmmpyHEhvWLmEiEF9qWQ4dmVPS0OycQmkb/IUE
    lbeLiUX9mB8DQqJdfNE0CHAVvdydjFCiaIvBbICo1096rSlidfJBhSKs77CiSryfZWmTZN
    5YgejmgdODdHik1YXpLZjdbBy84BYnrbzqTEjJ8ioIRZUsJWo0ueRIfdIH2g
X-ME-Proxy: <xmx:dJmBai6X1pv3KtV-LrV4tAxx-fy8LLN2MXhm1VJUtBotpM-rcZxoWg>
    <xmx:dJmBapBvr52_ja3ye7p4nTjh7tkbxC3ThjNYTqXtOmBYfml1fYtpmw>
    <xmx:dJmBagc6qn78gqRn9PsWjvga0Z4PvVphPx3_CjOB-Qj_6kKO2YPzxg>
    <xmx:dJmBagJHSsVrJGlayjluZjSeUkweoh79Qm6hAHyuIg9Q6IyWXJ1rOA>
    <xmx:dJmBamd2r4O778jBRAcNTK9MmcAvfrEYAVjU_Gj9Mr73DliSVcnqbLNt>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 07:05:23 -0400 (EDT)
Message-ID: <635943cc71265dc13179dd575ec89467eeb2fbf0.camel@pbarker.dev>
Subject: Re: [PATCH v4 3/5] devtool-source: Make nested destsuffix git repos
 standalone
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>
Date: Sun, 16 Aug 2026 12:05:22 +0100
In-Reply-To: <20260731092634.1127862-4-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
	 <20260731092634.1127862-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243514

On Fri, 2026-07-31 at 09:26 +0000, Jamin Lin wrote:
> When a recipe uses multiple git SRC_URI entries with different destsuffix
> values (e.g. recipes with separate repositories for the kernel, modules
> and application), do_unpack clones each source tree with
> 'git clone -n -s'.
>=20
> The -s flag uses git's shared-object mechanism:
> instead of copying objects locally it writes a .git/objects/info/alternat=
es file
> pointing back to the bare repository under the downloads directory (DL_DI=
R/git2/).
>=20
> scriptutils.git_convert_standalone_clone() is called by devtool_post_unpa=
ck to
> make the top-level source directory standalone: it runs 'git repack -a' t=
o copy
> all objects into the local object store and then removes the alternates f=
ile.
>=20
> However it only processes the top-level source directory. Each nested git=
 repo
> created by a separate SRC_URI entry retains its own alternates file still
> pointing into downloads/.
>=20
> Steps to reproduce:
>   1. devtool modify <recipe-with-multiple-git-SRC_URI>
>   2. bitbake -c cleanall <recipe>
>   3. bitbake <recipe>
>=20
> At step 2, 'bitbake -c cleanall' calls fetcher.clean() which deletes
> the bare repositories from downloads/git2/. The top-level workspace
> repo is standalone (alternates already removed by the original code),
> but the nested repos still hold alternates pointing to the now-deleted
> paths.
>=20
> At step 3, srctree_hash_files() runs 'git add -A .' with a custom
> GIT_INDEX_FILE. Git internally calls 'git status --porcelain=3D2' on
> each nested repo to check for changes; this fails with exit 128 because
> the nested alternates are broken:
>   error: unable to normalize alternate object path:
>          .../downloads/git2/github.com.example.module//objects
>   fatal: bad object HEAD
>   fatal: 'git status --porcelain=3D2' failed in submodule modules/lib/mod=
ule
>=20
> This halts the BitBake parse phase with a CalledProcessError and leaves
> the workspace in an unrecoverable state without manual intervention.
>=20
> Fix by having devtool_post_unpack() look at the recipe's SRC_URI directly=
:
> any git entry with an explicit destsuffix param names an additional
> checkout nested under the source tree, so convert each of those to a
> standalone clone the same way as the top-level tree.
>=20
> This is deliberately metadata-driven rather than walking the unpacked
> source tree looking for '.git' directories: a directory walk has no way
> to tell a nested checkout from an ordinary subdirectory of one, so it
> either has to stop at the first git repo it finds - which then misses a
> destsuffix repo nested inside another repo's own working tree - or keep
> walking into every repo's contents, which is wasted work for large trees.
> Reading SRC_URI instead gives the exact, authoritative set of paths that
> need converting, regardless of how they happen to be nested on disk.
>=20
> Only entries with an explicit destsuffix are handled, since that is the
> only way a recipe ends up with more than one git checkout under S; this
> also avoids having to duplicate the git fetcher's internal logic for
> computing an implicit default destsuffix (which depends on the subdir/
> subpath params and BB_GIT_DEFAULT_DESTSUFFIX).
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta/classes/devtool-source.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-s=
ource.bbclass
> index f29f40588f..940cdedbac 100644
> --- a/meta/classes/devtool-source.bbclass
> +++ b/meta/classes/devtool-source.bbclass
> @@ -97,6 +97,22 @@ python devtool_post_unpack() {
> =20
>      scriptutils.git_convert_standalone_clone(srcsubdir)
> =20
> +    # Recipes can use multiple git SRC_URI entries with an explicit dest=
suffix to
> +    # unpack several repositories as nested subdirectories of the source=
 tree
> +    # (e.g. recipes with separate repos for the kernel, modules and
> +    # application). Each such entry is unpacked as its own 'git clone -s=
' and
> +    # needs the same standalone conversion as srcsubdir above, otherwise=
 it keeps
> +    # referencing objects in the downloads dir that 'bitbake -c cleanall=
' removes.
> +    # We only look at entries with an explicit destsuffix param, since t=
hat's the
> +    # only way a recipe ends up with more than one git checkout under S =
- this
> +    # avoids having to duplicate the fetcher's internal default-destsuff=
ix logic.
> +    import bb.fetch2
> +    fetch =3D bb.fetch2.Fetch(d.getVar('SRC_URI').split(), d)
> +    for url in fetch.urls:
> +        ud =3D fetch.ud[url]
> +        if ud.type =3D=3D 'git' and ud.parm.get('destsuffix'):
> +            scriptutils.git_convert_standalone_clone(os.path.join(unpack=
dir, ud.parm['destsuffix']))
> +
>      # Make sure that srcsubdir exists
>      bb.utils.mkdirhier(srcsubdir)
>      if not os.listdir(srcsubdir):

Why still handle srcsubdir separately above this loop?

What about SRC_URI containing multiple git repositories that unpack
side-by-side instead of nested?

It may be better to just iterate through all git repositories in SRC_URI
rather than just the nested ones.

Best regards,

--=20
Paul Barker


