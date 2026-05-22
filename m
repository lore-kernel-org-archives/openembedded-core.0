Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63829CD5BAC
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 10:41:40 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14331.1779446490154759485
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 03:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=SVzZvh+n;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=QBObMHax;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 160A41400024;
	Fri, 22 May 2026 06:41:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 22 May 2026 06:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779446489; x=1779532889; bh=pYsaJIbfBZ
	0QWoSjyQgjX47ez+fJNmSHPACGF++ZnFc=; b=SVzZvh+nnW3ptJ0Ke+CzS0tlti
	383mKyBq4K4FjzQOEEfMu/d1HMsD4q146qVsEo5AfR6HHCQkwxGCB6j8C9E30KMM
	BeS9MEwqn/e19JVzc6ZUGRnaihCrrjC4fsB/EqiKuZvVY73R6FUTc3jSAdwuPxc5
	6FZgyb+e4xldjaXYPGiCQ1ehjPdPJt1QS+se63JuSWVy8yE2Moisq7m8of8Me80I
	4HhjdQAu2iHdebnuACmBFMenYZj4/tqutgi96HV0lmZwtw2qz7qcgpiwe2lAtk8h
	VTiyhjlljLLNFsrn52aZBtup3EscrpDmiLKejJ8eDg6JK2HwGRdeGNaoHWng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779446489; x=1779532889; bh=pYsaJIbfBZ0QWoSjyQgjX47ez+fJNmSHPAC
	GF++ZnFc=; b=QBObMHaxleszS8DyZUt7aeoaVh/xgaPeDbxP/P3VGu1XxYmFLn1
	txSn2F3l/VpW8d88OMqnJg33eS3bNp+MYh4mkCPuafwlXYIXP8zDuf5qaFNtWEfe
	/sSg2QG3xQqLSTeoPEIZ+P5rf6HITO1UuPqmGDWB6EJ5HkPDgKEXgj5hnFHHQwk0
	gcMmLdbu1LNNO/qEFqn06jvIT2YtiXeY1jtjGm0u9lRP9j1yjnww3pEgxU8oXoZO
	RK0RzLtcth965d7dvno+LuuSql4HyMcObUsomcvDo0+BNClzSnmtQp3zlXptS1xu
	ny2Fv4xC8UMb8VEKDO4QE14rXX3MP91KZBg==
X-ME-Sender: <xms:1zIQasBxmKj-KmgjNKLpU78e9sD5VjWDJOF6ny0pS0eCZPTyRP6knA>
    <xme:1zIQalbVRzcsCNziLZebAaIuwCTTxXh41fTVo31v_p_jELvqEzaUdBf4vcotLiw4u
    _7Vd3criaSkPIyMhBoeMwcPMFOZ8oH_9Kd6SVcVFy9VciruE6kInvo>
X-ME-Received: <xmr:1zIQan6sm_WyjljgDdCio0G9w9bI5mQxWC779grQE0OVedGX5Be1OebEX5w6JkWL6f-t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeelleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjedtgfetvdffgfeutdeguedutdehheekudekhffffeeivdetheduuedutddvgfelnecu
    ffhomhgrihhnpehprhhotggvshhsrdhruhhnnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggp
    rhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrghmihhnpg
    hlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopeht
    rhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepvhhinhgtvg
    gptghhrghnghesrghsphgvvgguthgvtghhrdgtohhm
X-ME-Proxy: <xmx:1zIQaubPCj7jP5xu-J_jF0MKsf_wa-2nPJT4-_xD29wR4Usdi5584Q>
    <xmx:1zIQaujlgHJYIXVfyeVvsoUjOmaaZTfN-gMhI41gwI74p5ymY6_H3A>
    <xmx:1zIQan-tTLXevyOqJseWVcZsDH5s2vJ_Mbe0TdX1NZ28UCEdWPPXTg>
    <xmx:1zIQahpB037T2MTG-YBbTaCvb-UOVg1mhrUpSRPJD8aRcZ9HdY-jjg>
    <xmx:2TIQarpc3pWqCyTGrunEDDTnvcnNMG6O55c6tVRUX28hFBVkTUgMwyPG>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 May 2026 06:41:26 -0400 (EDT)
Message-ID: <995a76a916b1735787b948728fa1d7b17796037d.camel@pbarker.dev>
Subject: Re: [PATCH v2 1/3] scripts/scriptutils: Convert nested git repos to
 standalone clones in devtool workspace
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
 <vince_chang@aspeedtech.com>
Date: Fri, 22 May 2026 11:41:05 +0100
In-Reply-To: <20260522075925.2381158-2-jamin_lin@aspeedtech.com>
References: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
	 <20260522075925.2381158-2-jamin_lin@aspeedtech.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YYhmMjZUpJd1yGx9vvY5"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 10:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237537


--=-YYhmMjZUpJd1yGx9vvY5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-22 at 07:59 +0000, Jamin Lin wrote:
> When a recipe uses multiple git SRC_URI entries with different destsuffix
> values (e.g. Zephyr-based recipes with separate repositories for the
> kernel, modules and application), do_unpack clones each source tree with
> 'git clone -n -s'.
>=20
> The -s flag uses git's shared-object mechanism:
> instead of copying objects locally it writes a .git/objects/info/alternat=
es file
> pointing back to the bare repository under the downloads directory (DL_DI=
R/git2/).
>=20
> git_convert_standalone_clone() is called by devtool_post_unpack to make
> the workspace standalone: it runs 'git repack -a' to copy all objects
> into the local object store and then removes the alternates file.
>=20
> However it only processes the top-level source directory.  Each nested
> git repo created by a separate SRC_URI entry retains its own alternates
> file still pointing into downloads/.
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
>          .../downloads/git2/github.com.zephyrproject-rtos.acpica//objects
>   fatal: bad object HEAD
>   fatal: 'git status --porcelain=3D2' failed in submodule modules/lib/acp=
ica
>=20
> This halts the BitBake parse phase with a CalledProcessError and leaves
> the workspace in an unrecoverable state without manual intervention.
>=20
> Fix by extending git_convert_standalone_clone() to walk the source tree
> and apply the same 'git repack -a' + remove-alternates treatment to
> every nested git repository found, making the entire workspace fully
> standalone at devtool modify time.  The walk uses dirs[:] =3D [] to stop
> at each git boundary so it never descends into already-converted repos.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  scripts/lib/scriptutils.py | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> index 32e749dbb1..0a83470373 100644
> --- a/scripts/lib/scriptutils.py
> +++ b/scripts/lib/scriptutils.py
> @@ -100,16 +100,36 @@ def load_plugins(logger, plugins, pluginpath):
> =20
> =20
>  def git_convert_standalone_clone(repodir):
> -    """If specified directory is a git repository, ensure it's a standal=
one clone"""
> +    """
> +    If specified directory is a git repository, ensure it's a standalone=
 clone.
> +    Also converts any nested git repositories (created by multiple SRC_U=
RI git
> +    entries with different destsuffix values) so that none of their cont=
ents
> +    depend on the shared downloads directory via alternates.
> +    """
> +
>      import bb.process
> -    if os.path.exists(os.path.join(repodir, '.git')):
> -        alternatesfile =3D os.path.join(repodir, '.git', 'objects', 'inf=
o', 'alternates')
> +
> +    def _convert(gitdir, workdir):
> +        alternatesfile =3D os.path.join(gitdir, 'objects', 'info', 'alte=
rnates')
>          if os.path.exists(alternatesfile):
>              # This will have been cloned with -s, so we need to convert =
it so none
>              # of the contents is shared
> -            bb.process.run('git repack -a', cwd=3Drepodir)
> +            bb.process.run('git repack -a', cwd=3Dworkdir)
>              os.remove(alternatesfile)
> =20
> +    if os.path.exists(os.path.join(repodir, '.git')):
> +        _convert(os.path.join(repodir, '.git'), repodir)
> +
> +    # Also handle nested git repos created by multiple SRC_URI git entri=
es
> +    # with different destsuffix values. Each nested repo is cloned with =
-s
> +    # and has its own alternates pointing to the downloads directory.
> +    for root, dirs, files in os.walk(repodir):
> +        if root =3D=3D repodir:
> +            continue
> +        if '.git' in dirs:
> +            _convert(os.path.join(root, '.git'), root)
> +            dirs[:] =3D []  # don't recurse into nested repos

Unfortunately, I don't think you can skip nested repos here. What about
a recipe which unpacks a git repository as a subdirectory of another?

This makes me think, instead of walking the directory tree under ${S}
looking for git repositories, could we walk the list of SRC_URI entries
looking for 'git://' URIs? That should be a much shorter list. If that
works, you'd probably want to do it in devtool-source.bbclass instead of
here.

Best regards,

--=20
Paul Barker


--=-YYhmMjZUpJd1yGx9vvY5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCahAywREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btXfAP9jzt9SnF0kaSVr8sIsY73j96FJ4BkbqqAo
oD2inSS9IwEAhHgQQhBjpR845yRJP/xmiHrzemyNuh/fflatuaMNgQo=
=xvbq
-----END PGP SIGNATURE-----

--=-YYhmMjZUpJd1yGx9vvY5--

