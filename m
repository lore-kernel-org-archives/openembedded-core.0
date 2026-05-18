Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6CACD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 19:17:00 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5177.1779131811253684931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 12:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=M17oTDfG;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=mueIJ6fF;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 72A2A7A00AF;
	Mon, 18 May 2026 15:16:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 18 May 2026 15:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779131810; x=1779218210; bh=8rxgn0dWoX
	jmGFXERr1qNROVGI5oeyoTYAg1wfJBMuo=; b=M17oTDfGpaOee26g+TGICe3qBU
	Dtx3MAVFwKEvUPl4zWlShUbL1D3qR7fO/p/A2CcHieQ1clpjIg49qUOP8Ycwqq3P
	Kuav4xvK+oEiBgoUcE7O1pPU/xlrZDrI9ze71nq1DZ5nWQxHnsvUvc/luvVH9Da5
	dIoV/PwwujvFQ9KINPx1bZ9EkdOTKrynb1sb1UG0cZr7sSRxDbMLITSPWGJF2gs0
	57lDB1xExKvs2H1Rmw2IsAIhrsd1dWBi3zZ+tp0ZGiN87XrJtSAZSrv0zB3AYQ/j
	v8Eqxw/+o+8JMC+dnmcJq5BknSWHrLoxgksnmX5md+S0FaEmrL6iKhBGWBwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779131810; x=1779218210; bh=8rxgn0dWoXjmGFXERr1qNROVGI5oeyoTYAg
	1wfJBMuo=; b=mueIJ6fFyP/J+bcvMh8XwTTyJMJgLXxnIf1/jJ08avxjve3Xj8U
	SpWIXKaAtI544lY047yvlIRQt8vgfGxl34qsR3CJXvLGTg0Oyq+U2o96/+fMzWO0
	C4fyaaoZ2byRCnk3u06Iu4NdmhSCWHogjYU9RagfO4UanKbQpRH9aAu/HjNoaivU
	I30pglJayz3c8JmbBnJPcDKt6P1ih9LSc/zGmqImLUpNhDBenJCJ+HuAJZ4DHpJl
	YgRl+UD9G0JbO5EmtUNNXNzJ+vtCy5mLzq2tjr3qhLne3dQrPkNb378ZRQ+FaeSd
	boPK7I4EfnmmIB4TvRziHtqij+SB3aIBU/Q==
X-ME-Sender: <xms:oWULahoVERQ7ZPU__aaj6_liZCypUFo22936TVN8bifB3yULo8FA4A>
    <xme:oWULaqoYYkdonS5IUra-0N6i4SrjPFMBodV2vnahqLEeokdohFz96yjgs1_LfddQT
    kL7erOd6Ab4KWam3HL13v6Ra9P3OA1Qm-dSZ4chMAsBV8CqLkvzxA>
X-ME-Received: <xmr:oWULajNKjx2NBku-u6FNz6O3ppCP-XEG1no_6Ub2pZ4auBjRFxLoicwRcFT3Yf1I7hqjNaEIQi1vYxBXkAHmG2v39gMu4mddq-clqLBncQbX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeelieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprh
    gtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgv
    mhgsvgguuggvugdrohhrghdprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguth
    gvtghhrdgtohhmpdhrtghpthhtohepvhhinhgtvggptghhrghnghesrghsphgvvgguthgv
    tghhrdgtohhm
X-ME-Proxy: <xmx:oWULarx30MybfmFzSuPLQnHqZGTnAx2kbCPbdzlFoyWjxLk--hhc_A>
    <xmx:oWULassY55agkNq3nnk9hY8kb5pY0JMlJl2e00p1YifExroPNSRNiQ>
    <xmx:oWULak4-ZhR4NKrUY4hxSAY3ovwyaVeQGXGK6VV4lkRU1KOPlV12Ew>
    <xmx:oWULarSuVSftAMBgtVL4qQsJCQA5LRbnjq18apOq4FIRvI7_yGiGAA>
    <xmx:omULainql1UgiKScS783JIdaj38EE6NiiaDp8MtZfzQhCfTrQkQGKbW0>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 May 2026 15:16:48 -0400 (EDT)
Message-ID: <ea944ab1b8149e83b522e0c315b6436f6142da5c.camel@pbarker.dev>
Subject: Re: [PATCH v1 1/2] externalsrc: Handle nested git repos from
 multiple SRC_URI entries
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
 <vince_chang@aspeedtech.com>
Date: Mon, 18 May 2026 20:16:45 +0100
In-Reply-To: <20260515093615.126849-2-jamin_lin@aspeedtech.com>
References: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
	 <20260515093615.126849-2-jamin_lin@aspeedtech.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+H62ePBw5axPZWD3Y8JY"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 19:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237258


--=-+H62ePBw5axPZWD3Y8JY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-15 at 09:36 +0000, Jamin Lin wrote:
> When a recipe uses multiple git SRC_URI entries with different
> destsuffix values (e.g. Zephyr-based recipes with separate repos for
> the kernel, modules, and application), each source is unpacked into a
> subdirectory of EXTERNALSRC that retains its own .git directory.
>=20
> srctree_hash_files() calls 'git add -A .' at the EXTERNALSRC root,
> which fails with exit code 128 when git encounters these unregistered
> nested git repositories, halting the bitbake parse phase.

Is this true? The documentation for `git add` [1] talks about issuing a
warning when this occurs, not an error, and in some quick local testing
I get a successful exit (exit code 0) when I try this.

> Fix by scanning for nested git repos before the add. If any are found,
> exclude them from the top-level 'git add' using pathspec magic
> ':(exclude)<path>' and hash each nested repo independently using a
> temporary index. This ensures changes in any nested repo still trigger
> do_compile/do_configure to re-run.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta/classes/externalsrc.bbclass | 37 +++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index 902ff2604f..0dd57af668 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -234,8 +234,43 @@ def srctree_hash_files(d, srcdir=3DNone):
>              # Update our custom index
>              env =3D os.environ.copy()
>              env['GIT_INDEX_FILE'] =3D tmp_index.name
> -            subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_d=
ir, env=3Denv)
> +            # Find nested git repos created by multiple SRC_URI git entr=
ies with
> +            # different destsuffix values. git add -A . exits 128 when i=
t encounters
> +            # these unregistered nested repos.
> +            nested_git_dirs =3D []
> +            for root, dirs, files in os.walk(s_dir):
> +                if root =3D=3D s_dir:
> +                    continue
> +                if '.git' in dirs or '.git' in files:
> +                    nested_git_dirs.append(root)
> +                    dirs[:] =3D []  # don't recurse into nested repos

This os.walk() loop is expensive, is there an alternative way to handle
this?

The code has also become difficult to parse. My rule of thumb is that if
a group of lines needs a leading comment, it also needs an empty line
before the comment to visually separate things.

> +            if nested_git_dirs:
> +                excludes =3D [':(exclude)' + os.path.relpath(n, s_dir) f=
or n in nested_git_dirs]
> +                subprocess.check_output(['git', 'add', '-A', '.'] + excl=
udes, cwd=3Ds_dir, env=3Denv)
> +            else:
> +                subprocess.check_output(['git', 'add', '-A', '.'], cwd=
=3Ds_dir, env=3Denv)

To simplify the code, construct a cmd variable and call
subprocess.check_output(cmd, ...) once.

>              git_sha1 =3D subprocess.check_output(['git', 'write-tree'], =
cwd=3Ds_dir, env=3Denv).decode("utf-8")
> +            # Hash each nested git repo separately so source changes the=
re still
> +            # trigger do_compile/do_configure to re-run.
> +            for nested in nested_git_dirs:
> +                nested_git =3D os.path.join(nested, '.git')
> +                if not os.path.isdir(nested_git):
> +                    continue
> +                with tempfile.NamedTemporaryFile(prefix=3D'oe-devtool-ne=
sted-index') as nested_tmp:
> +                    nested_index =3D os.path.join(nested_git, 'index')
> +                    if os.path.exists(nested_index):
> +                        shutil.copyfile(nested_index, nested_tmp.name)
> +                    nested_env =3D os.environ.copy()
> +                    nested_env['GIT_INDEX_FILE'] =3D nested_tmp.name
> +                    proc =3D subprocess.Popen(['git', 'add', '-A', '.'],=
 cwd=3Dnested,
> +                                           env=3Dnested_env, stdout=3Dsu=
bprocess.DEVNULL,
> +                                           stderr=3Dsubprocess.DEVNULL)
> +                    proc.communicate()
> +                    proc =3D subprocess.Popen(['git', 'write-tree'], cwd=
=3Dnested,
> +                                           env=3Dnested_env, stdout=3Dsu=
bprocess.PIPE,
> +                                           stderr=3Dsubprocess.DEVNULL)
> +                    stdout, _ =3D proc.communicate()
> +                    git_sha1 +=3D stdout.decode("utf-8")

We should re-use the code from the following block which handles
submodules instead of re-implementing the behaviour. Perhaps the common
code needs to be refactored out.

Best regards,

--=20
Paul Barker


--=-+H62ePBw5axPZWD3Y8JY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagtlnREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnI5AP0ezqX4n35ZbzFn8Yr1yaFYjXx9DfX3nT8m
ek2Lj2MkVQEA5BMrnGqH7RaOH1E/KO9Y3+QDcJTtIG60PkCW13BopA0=
=jpLh
-----END PGP SIGNATURE-----

--=-+H62ePBw5axPZWD3Y8JY--

