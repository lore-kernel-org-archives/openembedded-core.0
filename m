Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12428CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 12:12:58 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152634.1781611977139488138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 05:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=DPidXfAd;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=AHfbMu8T;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 09A4D1400109;
	Tue, 16 Jun 2026 08:12:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 16 Jun 2026 08:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781611976; x=1781698376; bh=M9jd4sRItb
	dt/WhIPHw/4tNnT1r7RiL8RQoIm2fBJdE=; b=DPidXfAdG2X2TEWLAie9XnFPv7
	+F6AXVy2qteQbNZC21dQYro5/uhhmv9Ys5rOU90fpktXJG/6JOTR2pUmdFQwF48I
	XLtiGE3ro23hwOAjFvyg0qDWI7ksjgbQY3bAJZejQx9RId0QSlThchRrBEvNmjIF
	8tpFnC5QNWJcK369Icp8CWeYyQOVUFjt7SnP4Qoe+dgwFgUkHdPvk7BGzeQnkiRK
	E3JhEE6kiQCZsomQNXkNDAskwcfm0peg9CKI2UHAoQu3r0Hv22vuJQdU/uHwEcqJ
	GL40XGpxLqO4EloBnOBSPw1BeUH5isXwxEQsmY86Cj9Qg0dfvDjMzBDQroug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781611976; x=1781698376; bh=M9jd4sRItbdt/WhIPHw/4tNnT1r7RiL8RQo
	Im2fBJdE=; b=AHfbMu8TFHErFYn0Q2SUfBxZo6aAXLlQSn42rre/NVmFPjJNA83
	c9x872A62C3MSJP3JmKTJnrmAlKKERgLZwtWuhq7Mm8lHEV3dVhVw4cw0OIBcg3G
	/dHUrvWlhrwj+PgQPmLuC7pWvXePhEp0GNwgIJ3+kZbxxRgu01q36rsHawMPJspc
	7/TgW8nycWc5SCZejSmvt2MpLzb/p4vfP82ryHcEYDVljtuqcLlFTnlLFiPrfu1q
	jMf9V1mqKEAT6yL+MiDUmc1cQwij0sMKDe61bNFEexFcugvhAfIBSuRrG5LLQp0W
	9rhrh9Usa6d/h6mfh/v2dTZcegPlAMXBNHQ==
X-ME-Sender: <xms:xz0xasz3gwSAItbMajMe4xiNpPd_MqGzMewd-yGGAxA9yskJ7jlSkw>
    <xme:xz0xamRpda0mVeHV06c1xXw-3mSwoQ5ZjIMG7E3giYBv-vtmTJ5tJDA804UPBAC6Q
    nBE3xrtj9FMRO9uNq8UKxJEBUuLCewAvA3UFaAKH8QXTc6-OVKUz6g>
X-ME-Received: <xmr:xz0xar-tJmyUvjYZjp-caaOrBAeZNof76i3ru3kWqopwiUbP0Ic2t40NdJ3Pn-SJhV71BVQkZaXSweSpoUDYdk0-yOR1bmqrjfOA6SnEjUZu>
X-ME-Proxy-Cause: dmFkZTGdxJ1b605HPo9xISqu2nX57KRXrlou13L/13AlnRyRARzmwV+05KsnHU57MYQAXf
    vmGM6K6wHMVpA1VArg4sWKFirWmcisQBOGQSjtUMSFDZOGrHY6kinRfWfbHmGb9xIQtZTo
    ZjZu6xlQDq4+OAcM3fSXy1BoIpM4kM6lPQGLzqi/UdY68t5jQxkMt55ofuulbh0zmGo8qa
    V1dNAQOkIEuhtQpQa8OsKkzzm2aQuhaeHQN5YHpsLBIpFX07G57Tq3jDzrgewjNrFBKA0e
    3pmX6mpph4AIBxgkOih0PHZT+SLff+zblfv7euP5rB9oRAuY6zG6vl+0OXxcg9RHS8Fwix
    Rlh43VENfVKTaSvzqksvaaAtdQ5Mno8vDWUVQo8DhSN9i9PRVmUrXdMnL24QMbJyNL06mS
    +1AyNh5ReEx9loFUSZaqtSgAMfLnRWPNbxRo+gcAAAOF3StfrxIbPf7w2LM3y/KygbRbDw
    QsriexYmaUd/GXiqcLCCHPpJnvG5tYKgQDulEhngJ0heO6He6xRLPKzUkoHwZg9taUQpDL
    Qmu0Rp2gKvS2vsec0layXegV6UIwRrkapjp6xnZM/8tIbFyB+j3WXIqrZwR/5yDk0NG40z
    Vgk3oxZYp1UzNyviLboOytRTPo3xvnvBpDkEtXW939SBuwBgA4FJElNFmIGQ
X-ME-Proxy: <xmx:xz0xalrdf8ILoU4ZbNrv0b47JysKQbfQTLlYsDQw509rzH46hU4OMA>
    <xmx:xz0xagmZDrZVvSqhA9X2vZV_zNAWdXLnZzXaQL_4vMIKRFWzg_tmgQ>
    <xmx:xz0xakIqmSGVRn2EJC2uwtzNYXgv0nTTVxm069qliFa_QC21aHxqZA>
    <xmx:xz0xatz8mvaE-CF2uyr4VLsu5WOBKYZ8_dLJlQVoxKoZaiNMivjoJg>
    <xmx:yD0xah_TOYOhTOKE-eRimD2ibReE5Z6cHyvXPA6h59gNX_KnUnezaKMN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 08:12:55 -0400 (EDT)
Message-ID: <d85afa2fdb8aa0d09a8d9e0ec106c201b1630e9e.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 1/2] package: replace copydebugsources shell
 pipelines with Popen
From: Paul Barker <paul@pbarker.dev>
To: Anders Heimer <anders.heimer@est.tech>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2026 13:12:48 +0100
In-Reply-To: <20260616082516.1553768-2-anders.heimer@est.tech>
References: <20260616082516.1553768-1-anders.heimer@est.tech>
	 <20260616082516.1553768-2-anders.heimer@est.tech>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-pNeBskg0yzdp/90bxQxE"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238894


--=-pNeBskg0yzdp/90bxQxE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-16 at 10:25 +0200, Anders Heimer wrote:
> Convert the copydebugsources command pipelines to explicit Popen calls
> using argument lists. Use env=3D for LC_ALL, cwd=3D for the cpio working
> directory and glob.glob() for the externalsrc move.
>=20
> The first pipeline keeps ignoring command failures as before since some
> inputs are expected to fail. The symlink fixup pipeline checks each stage
> so failures are reported directly.
>=20
> Skip the externalsrc mv when the glob has no matches and let the
> following empty-directory cleanup handle the empty tree.
>=20
> Signed-off-by: Anders Heimer <anders.heimer@est.tech>
> ---
>  meta/lib/oe/package.py | 63 ++++++++++++++++++++++++++++++------------
>  1 file changed, 45 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index c375acc124..ad4b7a2769 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1017,26 +1017,50 @@ def copydebugsources(debugsrcdir, sources, d):
>          bb.utils.mkdirhier(basepath)
>          cpath.updatecache(basepath)
> =20
> -        for pmap in prefixmap:
> +        env =3D os.environ.copy()
> +        env["LC_ALL"] =3D "C"
> +
> +        for pmap, prefix in prefixmap.items():
> +            dstroot =3D dvar + prefix
>              # Ignore files from the recipe sysroots (target and native)
> -            cmd =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((<int=
ernal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
> +            sort_p =3D subprocess.Popen(["sort", "-z", "-u", "--", sourc=
efile], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
> +            egrep_p =3D subprocess.Popen(["egrep", "-v", "-z", "-e", r"(=
(<internal>|<built-in>)$|/.*recipe-sysroot.*/)"], stdin=3Dsort_p.stdout, st=
dout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
> +            sort_p.stdout.close()
> +
>              # We need to ignore files that are not actually ours
>              # we do this by only paying attention to items from this pac=
kage
> -            cmd +=3D "fgrep -zw '%s' | " % prefixmap[pmap]
> +            fgrep_p =3D subprocess.Popen(["fgrep", "-zw", "-e", prefix],=
 stdin=3Degrep_p.stdout, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVN=
ULL, env=3Denv)
> +            egrep_p.stdout.close()
> +
>              # Remove prefix in the source paths
> -            cmd +=3D "sed 's#%s/##g' | " % (prefixmap[pmap])
> -            cmd +=3D "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '%s%s=
' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
> +            sed_p =3D subprocess.Popen(["sed", "s#%s/##g" % prefix], std=
in=3Dfgrep_p.stdout, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL,=
 env=3Denv)
> +            fgrep_p.stdout.close()
> +
> +            cpio_p =3D subprocess.Popen(["cpio", "-pd0mlLu", "--no-prese=
rve-owner", dstroot], stdin=3Dsed_p.stdout, cwd=3Dpmap, stderr=3Dsubprocess=
.DEVNULL, env=3Denv)
> +            sed_p.stdout.close()
> +
> +            for proc in (cpio_p, sed_p, fgrep_p, egrep_p, sort_p):
> +                proc.wait()

Hi Anders, thanks for the patches!

If we're reworking this code, I think we should replace the complex
sed/grep/sort pipeline with Python code. We can read into a Python list
and sort/filter using the Python standard library, then pass the results
to cpio.

> =20
> -            try:
> -                subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubp=
rocess.STDOUT)
> -            except subprocess.CalledProcessError:
> -                # Can "fail" if internal headers/transient sources are a=
ttempted
> -                pass
>              # cpio seems to have a bug with -lL together and symbolic li=
nks are just copied, not dereferenced.
>              # Work around this by manually finding and copying any symbo=
lic links that made it through.
> -            cmd =3D "find %s%s -type l -print0 -delete | sed s#%s%s/##g =
| (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
> -                    (dvar, prefixmap[pmap], dvar, prefixmap[pmap], pmap,=
 dvar, prefixmap[pmap])
> -            subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubproce=
ss.STDOUT)
> +            # The source copy pipeline above can fail without aborting, =
so there may be no copied tree to scan for symlinks.
> +            if not os.path.exists(dstroot):
> +                continue
> +
> +            find_p =3D subprocess.Popen(["find", dstroot, "-type", "l", =
"-print0", "-delete"], stdout=3Dsubprocess.PIPE)
> +            sed_p =3D subprocess.Popen(["sed", "s#%s/##g" % dstroot], st=
din=3Dfind_p.stdout, stdout=3Dsubprocess.PIPE)
> +            find_p.stdout.close()
> +
> +            cpio_p =3D subprocess.Popen(["cpio", "-pd0mL", "--no-preserv=
e-owner", dstroot], stdin=3Dsed_p.stdout, stderr=3Dsubprocess.DEVNULL, cwd=
=3Dpmap)
> +            sed_p.stdout.close()
> +
> +            procs =3D (cpio_p, sed_p, find_p)
> +            for proc in procs:
> +                proc.wait()
> +            for proc in procs:
> +                if proc.returncode:
> +                    raise subprocess.CalledProcessError(proc.returncode,=
 proc.args)

This is a simpler pipeline but it may still be nicer to bring it into
Python code.

> =20
>          # debugsources.list may be polluted from the host if we used ext=
ernalsrc,
>          # cpio uses copy-pass and may have just created a directory stru=
cture
> @@ -1046,13 +1070,16 @@ def copydebugsources(debugsrcdir, sources, d):
> =20
>          # Same check as above for externalsrc
>          if workdir not in sdir:
> -            if os.path.exists(dvar + debugsrcdir + sdir):
> -                cmd =3D "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, d=
var,debugsrcdir)
> -                subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubp=
rocess.STDOUT)
> +            srcdir =3D dvar + debugsrcdir + sdir
> +            dstdir =3D dvar + debugsrcdir
> +            if os.path.exists(srcdir):
> +                entries =3D glob.glob(os.path.join(glob.escape(srcdir), =
"*"))
> +                if entries:
> +                    subprocess.check_output(["mv", "--"] + entries + [ds=
tdir], stderr=3Dsubprocess.STDOUT)

We could simply use shutil.move().

> =20
>          # The copy by cpio may have resulted in some empty directories! =
 Remove these
> -        cmd =3D "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
> -        subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)
> +        cmd =3D ["find", dvar + debugsrcdir, "-empty", "-type", "d", "-d=
elete"]
> +        subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)

I think this is would be more complex in Python code so it is probably
best left as a find command.

Best regards,

--=20
Paul Barker


--=-pNeBskg0yzdp/90bxQxE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajE9wBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bk6iAQCI/XwzFumeSTtOytwA+GsjAAOOVlG66ThG
4q91lSlYeAD/U6HsvghMY02fZ8oT9RoQiDmD3yaIX/hZ2D1ojIu8IAo=
=O4BS
-----END PGP SIGNATURE-----

--=-pNeBskg0yzdp/90bxQxE--

