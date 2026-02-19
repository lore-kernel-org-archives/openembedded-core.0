Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB63E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 15:01:55 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15486.1771513306190482149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 07:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=nYf+oTMV;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Rc3BdYRu;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4938C140019E;
	Thu, 19 Feb 2026 10:01:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 19 Feb 2026 10:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771513305; x=1771599705; bh=D2zWEkPYMZ
	CKvzqxYldWChyzYLoRDLi/lhc2L5ERksQ=; b=nYf+oTMVuPdIsctyRRW+IZVUbu
	qGr3Bl4DDXffXJW9h7V4xdq9RFLrcFnG2PEwknxuiR4df2rjXpVMBatLNKMy6YiS
	QmB4BJL4Q0IGagJKxYVekjbO6CVw0USTZRQVkj3Mw3LcVpTnKRYpmsSmtHfcZoA+
	1P3CYuewUaEp66X/wKEko76kTuI+O6HWTklGb8E0HyNE8eM9Kt1IBFM9FyH2w9nS
	6ngOdwO6daFgy1OemWBywBd6Hoxuw0OQ7cEkdy6PI4uGqlodZcQSzm0S43CPJGov
	z/wPSh5G7Bc+y3etCZqkew0zwpwwy15UMvbE1ukLBdqgYjfLqV/MtAzSsOYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771513305; x=1771599705; bh=D2zWEkPYMZCKvzqxYldWChyzYLoRDLi/lhc
	2L5ERksQ=; b=Rc3BdYRuH/rf8FkflJMwZYjrm19GLqbmHSqZtgJrQOZ5Ef9kaQO
	Nl8JntI89qhjJtQtsSDb9uwAtVbKYZcvA7u0PFaEJO3NGJssH8Fo4dT6GrtXO+UR
	LhUjDvGTXAE1vHyQUsLrSFaYnoEARe80FGxutYnLZ6s3kH008ZjX5BajGCtAOYlz
	YO6OKUQja7elGzQGyR02F0Nx4kCv0x4fAVGXpesbsK9JbEqFtmaIdZJVSHk8gEg+
	ghJFzId+8y9U3RaqQyfUgBNAyLSIThk+yPXzZGb+TF4CdgakWAUXtoOIM5uMwCCL
	42Eo6WN3iOTbe9g6eGVipZsvyC02HV8W+og==
X-ME-Sender: <xms:2CWXaYXzEQtMwY4X54ISInkd8KXmoJFTMiOdkmWk9uZajYriar0AMQ>
    <xme:2CWXaTHNdxHkwUw_v4RfK7mgUDkvoZx0xkBvKMFsSn4mNhSzEzboHdKInZFTNRiLX
    dbR_szSjvZxfOVG4PgealazxalitEu8fEAgtdj6C4jTdUkVzynB4g>
X-ME-Received: <xmr:2CWXaaZuclLwjUwWrjA3vu38fzZfl76xASgTHL2ZCLZDozWqExHeCQ-5AsHbNkW9dEiinnYCMGYiq9RGu3BwEB4c1BQ1RfxIeJuqLZ75obzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdehkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoufhorhhtvggutfgvtghiphdvucdlgedtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    fhkefhuefgleefleduleelhfektedvffeitddtueeukefhieduiedvfeeuhedutdenucff
    ohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
    pdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprh
    hssehtihdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgu
    segsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigi
    druggvpdhrtghpthhtohepohhtrghvihhosehoshhshihsthgvmhhsrdgtohhmrdgsrhdp
    rhgtphhtthhopehkvgigihhnrdhhrghoseifihhnughrihhvvghrrdgtohhmpdhrtghpth
    htoheprghfugesthhirdgtohhmpdhrtghpthhtohepuggvthhhvghrihgughgvsehtihdr
    tghomh
X-ME-Proxy: <xmx:2CWXaaGM1Owens0sUSzPxf00lZMb4nVIoKGU9UkCOmAeHqZiIvHcWg>
    <xmx:2CWXaY1pMokjQF-HrXWGxeUWpdBkiUoOQd3Hv2ylqKe41ATS-mtzLA>
    <xmx:2CWXaWySDedTJHofFu27DZEdaXQ98SLZ4yGCmVhRymINZ7_VFcBGKQ>
    <xmx:2CWXaZitW_0Kms3kf26-NUMMGWxpvtfhovNXJWYW_fgLklBsb8XNyA>
    <xmx:2SWXaUNjaMD2LhlXaSpRF3xtv61CisAg2vbCmOE0YR9YdbM3Syp_k7JF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Feb 2026 10:01:42 -0500 (EST)
Message-ID: <e745402979f61ca6710e44b2116c6485ca0484ff.camel@pbarker.dev>
Subject: Re: [oe-core][PATCHv2] reproducible: fix git SOURCE_DATE_EPOCH
 randomness
From: Paul Barker <paul@pbarker.dev>
To: rs@ti.com, raj.khem@gmail.com, richard.purdie@linuxfoundation.org, 
 mathieu.dubois-briand@bootlin.com, alex@linutronix.de,
 otavio@ossystems.com.br,  kexin.hao@windriver.com
Cc: afd@ti.com, detheridge@ti.com, denis@denix.org, reatmon@ti.com, 
	openembedded-core@lists.openembedded.org, vijayp@ti.com
Date: Thu, 19 Feb 2026 15:01:38 +0000
In-Reply-To: <20260217200105.2234389-2-rs@ti.com>
References: <20260217200105.2234389-2-rs@ti.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lj5Md1T279lbarK4bycj"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 15:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231428


--=-lj5Md1T279lbarK4bycj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-17 at 14:01 -0600, Randolph Sapp via
lists.openembedded.org wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Anything that defines multiple git sources should have the largest value
> taken when calculating the SOURCE_DATE_EPOCH for a package.
>=20
> The previous iteration actually introduced some degree of randomness, as
> it would stop on the first git repository reported by os.walk, which
> does not assure any specific ordering by default.
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>=20
> v2: Use os.walk method as opposed to glob to avoid infinite recursion whe=
n
> navigating symbolic links
>=20
>  meta/lib/oe/reproducible.py | 63 ++++++++++++++++---------------------
>  1 file changed, 27 insertions(+), 36 deletions(-)
>=20
> diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
> index 0270024a83..c58db48fb1 100644
> --- a/meta/lib/oe/reproducible.py
> +++ b/meta/lib/oe/reproducible.py
> @@ -74,52 +74,43 @@ def get_source_date_epoch_from_known_files(d, sourced=
ir):
>          bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
>      return source_date_epoch
>=20
> -def find_git_folder(d, sourcedir):
> -    # First guess: UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX
> -    # This is the default git fetcher unpack path
> +def find_git_folders(d, sourcedir):
>      unpackdir =3D d.getVar('UNPACKDIR')
> -    default_destsuffix =3D d.getVar('BB_GIT_DEFAULT_DESTSUFFIX')
> -    gitpath =3D os.path.join(unpackdir, default_destsuffix, ".git")
> -    if os.path.isdir(gitpath):
> -        return gitpath
> -
> -    # Second guess: ${S}
> -    gitpath =3D os.path.join(sourcedir, ".git")
> -    if os.path.isdir(gitpath):
> -        return gitpath
> -
> -    # Perhaps there was a subpath or destsuffix specified.
> -    # Go looking in the UNPACKDIR
> -    for root, dirs, files in os.walk(unpackdir, topdown=3DTrue):
> -        if '.git' in dirs:
> -            return os.path.join(root, ".git")
> +    git_folders =3D []
>=20
> -    for root, dirs, files in os.walk(sourcedir, topdown=3DTrue):
> -        if '.git' in dirs:
> -            return os.path.join(root, ".git")
> +    for mainpath in (sourcedir, unpackdir):
> +        for root, dirs, _ in os.walk(mainpath, topdown=3DTrue):
> +            if ".git" in dirs:

Do we need to add handling for git submodules? In submodules, '.git' is
a file instead of a directory.

> +                git_folders.append(os.path.join(root, ".git"))

We should change this to `git_folders.append(root)` (see below).

>=20
> -    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackd=
ir)
> -    return None
> +    if not git_folders:
> +        bb.warn("Failed to find any git repository in UNPACKDIR or S")
> +
> +    return git_folders
>=20
>  def get_source_date_epoch_from_git(d, sourcedir):
>      if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVa=
r('SRC_URI'):
>          return None
>=20
> -    gitpath =3D find_git_folder(d, sourcedir)
> -    if not gitpath:
> -        return None
> +    # Get an epoch from all valid git repositoies
> +    sources_dates =3D []
> +    for gitpath in find_git_folders(d, sourcedir):
> +        # Check that the repository has a valid HEAD; it may not if subd=
ir is used
> +        # in SRC_URI
> +        p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', =
'HEAD'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)

Using '--git-dir' does not set the path to the worktree correctly. This
may work, but it's fragile. While we're modifying things here, can we
change find_git_folders() to return the paths of the repository roots
instead of the .git directories? Then we can use 'git -C path ...' here,
which is much less likely to have issues in the future?

> +        if p.returncode !=3D 0:
> +            bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, =
p.stdout.decode('utf-8')))
> +            continue
>=20
> -    # Check that the repository has a valid HEAD; it may not if subdir i=
s used
> -    # in SRC_URI
> -    p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'HEA=
D'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
> -    if p.returncode !=3D 0:
> -        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.st=
dout.decode('utf-8')))
> -        return None
> +        bb.debug(1, "git repository: %s" % gitpath)
> +        p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', =
'--git-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
> +                           check=3DTrue, stdout=3Dsubprocess.PIPE)
> +        sources_dates.append(int(p.stdout.decode('utf-8')))
> +
> +    if sources_dates:
> +        return sorted(sources_dates, reverse=3DTrue)[0]

Can we use `max(sources_dates)` here?

Best regards,

--=20
Paul Barker


--=-lj5Md1T279lbarK4bycj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZcl0hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnPiAQCq0EMznnRJK7LROJYM8AJh1DGFqaV3cApT
ao1zjs0BOwD+PPCkI+SdbnhUdjI8/HCkPzCIvPBs1v/AgK1mm01XHgU=
=iYoH
-----END PGP SIGNATURE-----

--=-lj5Md1T279lbarK4bycj--

