Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05322CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 14:03:00 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20100.1781791376052288667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 07:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=KrUcqQJb;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=cs5VUtlK;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 3932E1D00137;
	Thu, 18 Jun 2026 10:02:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 18 Jun 2026 10:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781791374; x=1781877774; bh=gkoGyfq7oM
	GYVnvbDkT0w+2iFFwTTFJYK2hlz9wB3LI=; b=KrUcqQJbCsKYQA0tsGxK9y2YRA
	pmV9Uq0Z2pknmsgkdoyUaghCSrwYXa/aDpTP7OZCKeZ9EdEVr0/3OPwuwQPmFJP9
	pTG9J5imH7RlCbArPVAONyWTGs4VHQqJsY4LQ3FdJo9zDD02QkiyqtbqiBg+MFcT
	CMq3Isaiq23D2IKqIn3UuY+/0EfCi63IEpC6BNJt3OSOHqjX8mch2oNdBBMLzj9L
	KXf+pPcpmf9Hwejk05JlVy0oQgmThnirqfctQ0uOGGYj2xuYedCTHer1mJIAICXe
	3NAiaQYm159uW+F+5bKb78c2GNEiQzAIG0d0jgHN4Ct0LdBnFfC9naRVbfSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781791374; x=1781877774; bh=gkoGyfq7oMGYVnvbDkT0w+2iFFwTTFJYK2h
	lz9wB3LI=; b=cs5VUtlKfP2JwL6EoSSrlOyyH1QrSSSfhAC4L9us9sBHN0JMmCG
	Kyt8UEBJOwkSSjhwNIdQ8M3ab+qplRhfNWvVogr/qc9AGL9vKMiBke/LP/Wcly7J
	abxhFuAvlsyitsyeeXxI8GmsSF/Z6mgz96vREQGGEPaF+q5V6bQkEQTFYifdRREJ
	HEfIEqw/cJbTZGGxSjgy/OjHmuTArXceMe5epoGz/XatppCIM+AT8chuP081vzFn
	piEE1hbghQG9PwkOCfZ/me66+92pO8sQrc/UcdKrv1yZ8XSEgiBe5UZy0MmkJaFG
	oEgCPSdHVbhvlA9qEbOvJahlt7FmoCxttSA==
X-ME-Sender: <xms:jvozarRxW8jMg6g-t5oLgpLc82Ah9OEkzNEU0oXvrYl5XgVrlXYJiw>
    <xme:jvozaizBmjmhgh75egMPqhTMxWzwEIzysdbTeKtS0TRwsskwzEF73WBlO5JUkG8uv
    r-NaMLLDYCrG_5noLYEP2fq6idVq5v6_USrGLh7Sgp-VC7zrGIhu4I>
X-ME-Received: <xmr:jvozaue9SgHMEYJvMZOIxMg0qsjlYXbeVviOOwfYmXfM7YeAX1oAjex8vAcKP93Aw7nPEaaDg55oi6j6s9_-gQH7NPwvi8xod1Yvr6hjxla->
X-ME-Proxy-Cause: dmFkZTEHTzJUdJFrRevvjuwpCfXBIwz4k2XM8W41TJ8/Zvyx42XEm3xj3LCzKdOUkrJjd8
    YWAWCZX+MRfF+P+rYdwBITUv0IJvRFYbIP8fyzI9Ov0CDpIewxDKDXq6zHF/izbZV2cWUd
    Ealxx5heY3wy/23H0kdYd4QHYVGNl/sE1hinkeyoUqLqVcb2rGjCc0l/vdM4rmELUJ9GYb
    +/DAFP+ALKkVCrN9vwhWhNIuNeMEozDWjKZIM56DJDygyQLQQfHLQ+4OOVSVtroU+r1PfA
    kV9PE/fCvdP1LtOQuPtC/xk3wR/krmykzXTp6Y2W0lxYW2b7vN8Os8iS5XpdQtdyzfOHDG
    diWrM0sTdfVA85BOqUllYvtO3JuRYZ3mWWItJ0FHhDxeY7oek8OjKC9VG5HMZ9HFzhPNQc
    LZGGkNhYeleoG3xiateCJIgBTVvp8/FBm9UGYQKq9uViIKUNzM43q1lL6XVVX607gcO3RV
    B9xELHkIzXtaME7hMdHTvB3prK97pJWXXcpudtBnN8v/uVxxiGYBPTpxTZSo0Y/wOnrw1X
    gGLQezbyc5QeE/v7QnwB3eu718z3L/isYWhqNtEI0749JVYYuUXeGBm8JZSf/dJO45uiOH
    +JIs2cT/W/O7Y7hZHyWIlRk8rD/Zot4EVEVrXBj3cJSO9iUu+haiWxEJR5NA
X-ME-Proxy: <xmx:jvozamKuPj499bURxZsD6PvlM5274GYBYjUM_IhRuJ-NogzuyXwCUw>
    <xmx:jvozanHJenlnAd7Y3bBg7FYdHM1t7alVG1fw6ovdb0Z97QSRJwdVnA>
    <xmx:jvozaoo2B1r3-ZksSHiEkoY_m610QBTdzIvc3i8nsaBZ5frg3ISvSA>
    <xmx:jvozaoTn3p5jhrSSeuGycpgvJVSUe3--aI84KigHQ-OAQXl3UV0ElQ>
    <xmx:jvozahYngl7HolHhzvRNj-zq5-_MSel9QLG3wsYA4EhQkQFv5Wimr8oI>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jun 2026 10:02:54 -0400 (EDT)
Message-ID: <2fc52b542478cf887877cb3407675c2f59ae90f7.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 1/2] package: replace copydebugsources
 shell pipelines
From: Paul Barker <paul@pbarker.dev>
To: Anders Heimer <anders.heimer@est.tech>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2026 15:02:49 +0100
In-Reply-To: <a3e600b6d0d61b567c5ba296f66947a9728f296a.1781766061.git.anders.heimer@est.tech>
References: <cover.1781766061.git.anders.heimer@est.tech>
	 <a3e600b6d0d61b567c5ba296f66947a9728f296a.1781766061.git.anders.heimer@est.tech>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-j57QctLqmeXHUihh9adv"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 14:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239084


--=-j57QctLqmeXHUihh9adv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-18 at 09:19 +0200, Anders Heimer wrote:
> Replace the sort/grep/sed parts of copydebugsources with Python
> filtering on the NUL-separated source list. Keep cpio since it is
> faster than doing it in python.
>=20
> Use an explicit prefix + "/" match before stripping the prefix so source
> selection is limited to files in the mapped debug source directory.
>=20
> Replace the find/sed symlink fixup pipeline with os.walk() plus cpio,
> use an argv-list mv for the externalsrc relocation, and pass the
> empty-directory find command as an argv list.
>=20
> The first cpio copy pass continues to ignore failures as before since
> some inputs are expected to fail. The symlink fixup copy still reports
> cpio failures.
>=20
> Signed-off-by: Anders Heimer <anders.heimer@est.tech>
> ---
>  meta/lib/oe/package.py | 70 +++++++++++++++++++++++++++++-------------
>  1 file changed, 48 insertions(+), 22 deletions(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index c375acc124..c4ad364b64 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1017,26 +1017,48 @@ def copydebugsources(debugsrcdir, sources, d):
>          bb.utils.mkdirhier(basepath)
>          cpath.updatecache(basepath)
> =20
> -        for pmap in prefixmap:
> -            # Ignore files from the recipe sysroots (target and native)
> -            cmd =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<int=
ernal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
> -            # We need to ignore files that are not actually ours
> -            # we do this by only paying attention to items from this pac=
kage
> -            cmd +=3D "fgrep -zw '%s' | " % prefixmap[pmap]
> -            # Remove prefix in the source paths
> -            cmd +=3D "sed 's#%s/##g' | " % (prefixmap[pmap])
> -            cmd +=3D "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s=
' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
> +        # Ignore files from the recipe sysroots (target and native), and
> +        # compiler internal entries.
> +        with open(sourcefile, "rb") as f:
> +            sourcepaths =3D sorted({path for path in f.read().split(b"\0=
")
> +                                  if path
> +                                  and not path.endswith((b"<internal>", =
b"<built-in>"))
> +                                  and b"recipe-sysroot" not in os.path.d=
irname(path)})
> +
> +        for pmap, prefix in prefixmap.items():
> +            dstroot =3D dvar + prefix
> +            prefix_slash =3D os.fsencode(prefix) + b"/"
> +            relpaths =3D [path[len(prefix_slash):]
> +                        for path in sourcepaths
> +                        if path.startswith(prefix_slash)]
> +
> +            if relpaths:
> +                subprocess.run(["cpio", "-pd0mlLu", "--no-preserve-owner=
", dstroot],
> +                               input=3Db"\0".join(relpaths) + b"\0",
> +                               cwd=3Dpmap, stdout=3Dsubprocess.DEVNULL,
> +                               stderr=3Dsubprocess.DEVNULL, check=3DFals=
e)

I feel like there are a couple of cases of doing a bit too much at once
here. It took me a few looks at it to realise that a set comprehension
is used to populate sourcepaths, so it's removing duplicate entries.

I would find the following more readable:

    with open(sourcefile, "rb") as f:
        rawpaths =3D f.read().split(b"\0")

    # Ignore files from the recipe sysroots (target and native), and
    # compiler internal entries. Use a set comprehension to prevent
    # duplicate entries.
    sourcepaths =3D {path for path in rawpaths
                   if path
                   and not path.endswith((b"<internal>", b"<built-in>"))
                   and b"recipe-sysroot" not in os.path.dirname(path)}

    for pmap, prefix in prefixmap.items():
        dstroot =3D dvar + prefix
        prefix_slash =3D os.fsencode(prefix) + b"/"
        relpaths =3D [path.removeprefix(prefix_slash) for path in sourcepat=
hs
                    if path.startswith(prefix_slash)]

        if relpaths:
            subprocess.run(["cpio", "-pd0mlLu", "--no-preserve-owner", dstr=
oot],
                           input=3Db"\0".join(sorted(relpaths)) + b"\0",
                           cwd=3Dpmap, stdout=3Dsubprocess.DEVNULL,
                           stderr=3Dsubprocess.DEVNULL, check=3DFalse)

Our minimum Python version is 3.9 so we can use removeprefix(). And
placing the sorted() call in the cpio invocation matches what we do
again later in the function.

I assume that path.removeprefix(prefix_slash) can never result in a
zero-length string because we'll never see an entry in sourcefile
exactly matching the prefix with the trailing '/'.

The rest of the patch LGTM!

Best regards,

--=20
Paul Barker


--=-j57QctLqmeXHUihh9adv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajP6iREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bijAAPsFlI59if4QPSOMufo2mQE8UxzoaZx7phU8
eXrQJldC0AD+PeZxub64BqH5Ru9G3PkuTvYXCMkjVBX87kHOP+PMvgI=
=QNyQ
-----END PGP SIGNATURE-----

--=-j57QctLqmeXHUihh9adv--

