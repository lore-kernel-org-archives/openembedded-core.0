Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E52CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:42:18 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154759.1781617333859028613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 06:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=U9Tm6M48;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=lcwu3aPb;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C39421400062;
	Tue, 16 Jun 2026 09:42:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 16 Jun 2026 09:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781617332; x=1781703732; bh=QCYpSKrueg
	PPIyHmGja8GrcSQ6oqi1OgpOQD/BKHz+8=; b=U9Tm6M48ojwTwKBLP1O53nYNgs
	bI8z0XUMy6PXmY06xqi90DEmu9dMzwj9nw16mbeE34BdxIIRcDyzE/sXNIEep0Gi
	7DGX3EJI9+GRCcAwzRrkLyY8Pmz8nR/YQ5QBjEzuHL0/kxcwklYSLQjWXlTB+Rfe
	rGf5bssCFzRiBC4MFqMlY0fMJshMJcjjtR9RvSV/Ll7Uw8NvvE/VrBrV8E77sHYC
	Gl43kzsYcRFoLwTAOxozHdrdL4T2YPwRAepaSsgVW7IyOgSUHJxujdXmCMHxeyHS
	q1Z8lDku/7nK5UoWK3hk4PNvsefotcdmcCbbaM6uqn8WVhEFr51OjsIEnGjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781617332; x=1781703732; bh=QCYpSKruegPPIyHmGja8GrcSQ6oqi1OgpOQ
	D/BKHz+8=; b=lcwu3aPb7KRt3Cc7/rIJpL9l5Jt1oSB+tF2wm8NeMpKqN4905XE
	B+rrsMKE3eCDJ3Lv6U7ju7LFzhNvsTyCtypZymQeqZ35g+WKrUA3mMdubn6hTQtL
	BEKGbMlhaU2mZvRTr+24UsM6SLGHkTboKKkL8TGurB9JxJNKx3JZm89E2wIjjOXp
	QjYb4jNF5J0JW53VHNaHRb2conl2Yxg1AVmjKsadLXSsSQlaMgGYZDmC9jZ5BgiF
	yS2mBI7De0Fb16DdHDQ2pxJOvKiclLLT9tQP0mEisVCuHsyWfVvX+mfbwr05VfcJ
	RMrT8CgiWhkfTP6F+DyPwlbtaou7e6ksbHw==
X-ME-Sender: <xms:tFIxag2V6lyVcjC_26MFYxo-lMiczzqXs6gZW9fISlFGPjD5Fato0w>
    <xme:tFIxaiHl9WLSO7cSTrepXSIBD1605HFWCar2HyCTyrldVNlrZFHxEP9R4CkNkXCe-
    u-uqN8VS9lzYvhNzEVcs9uwl1lzbv5GusEexY3zP-HWPsXn26BoNuE>
X-ME-Received: <xmr:tFIxat5C5FS3KyssJN9ZCQ2K6bkE9eXjVoO-bqp2HPZ_t7gEQToEL4m4880gNtQ3dra3zdi0SvhOsp2NDYqOrexCUT5QMpdAs6TUO5Mgm5QR>
X-ME-Proxy-Cause: dmFkZTG0/RYHz9/7kKcu3IrdrB8OxENbB4H8gy9U2JekBx5ae2bg3gVlDJkIRQdFBF1SeU
    nBbCboE0m2IYtJKCRKl19eFkjmQpK6Gqh3GdVSduFoKb9+wOwgsX7simMYldT2xcAdP7wE
    VJCZ7qz72MjMpi3GulsyjPM5x0PI7bIa7X9MFo6fiDobsV3RvmXVcyskZmZpY31lFXOEZL
    ECSjtMplzfKLzmHrBQxyutICww6cVeMsbJssWS5J7nH7vvhl3SaRYhezzxaUe/SMY3q38w
    cFokPa6e0VyZRBAiVjv1lFXoloj1QnEF7zlvD7HeTtRnO8GKFvSFZmoCjDFihcGMVh3isZ
    13dHB+EiAeoS1frmotr3eD3gtoRldsVOqzZhD26h5c94PdjaS9MtP49WHrzMDT9ZgaUnfk
    ABCvqCZEtENyvcRP2t6cQTevNJgD4p5+jVOJn79ufnjjjxNxfBgzvz0hxxEEZ6r5n4Ugw5
    4szVTqu2lr5Lt9xp06D6RqSxdnzTtb9NyJxIPlM89PRNXVTUjXWCSno+1kfCp8F5CZug9F
    LBwNG3PB1EZSgJwZNmd1okjUxfvFHV03xGICM1MUO5DU3b7PYpL5Qw+qvddrsf6Nrq3au0
    TgeV4rWXgy9HRR3IDGyhHhJQ44iTQV5x2cyeMyrApxwtmrg2lEvKXcMMasPg
X-ME-Proxy: <xmx:tFIxaov6CzunSrl7LVtYN8GWVhoreHlg5q1c9YsPBnztDDCBNMz2uA>
    <xmx:tFIxau7ElxZdPHVIdtj6NWCvrX47CraiMko-XLkZLCdsAQ3Qn7NDtw>
    <xmx:tFIxajX7ijcL_vfJ7Q8x-62ZWBXhhu5IfUXc-UieblMqlciJJKgglQ>
    <xmx:tFIxag-npZaZgtxebJ4RyGD6xAfhXneg52BlbIPi4Gy7jyc4SfLVqw>
    <xmx:tFIxah6Wke34vrykXkMilMtVFmhTj7naj32ivD5ePR9xz7KniOePtacy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 09:42:11 -0400 (EDT)
Message-ID: <f34ea46f825b19b6775a091be8235ee2ca4af987.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH 1/2] package: replace copydebugsources shell
 pipelines with Popen
From: Paul Barker <paul@pbarker.dev>
To: anders.heimer@runbox.com, Anders Heimer <anders.heimer@est.tech>, 
	openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Jun 2026 14:42:08 +0100
In-Reply-To: <77f24693-adcf-44b8-bf5e-af4a8f1bdee7@runbox.com>
References: <20260616082516.1553768-1-anders.heimer@est.tech>
	 <20260616082516.1553768-2-anders.heimer@est.tech>
	 <d85afa2fdb8aa0d09a8d9e0ec106c201b1630e9e.camel@pbarker.dev>
	 <77f24693-adcf-44b8-bf5e-af4a8f1bdee7@runbox.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1uUzC9ADdjv083v73tM0"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 13:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238901


--=-1uUzC9ADdjv083v73tM0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-16 at 15:35 +0200, Anders Heimer via
lists.openembedded.org wrote:
> Hi Paul,
>=20
> On 6/16/26 14:12, Paul Barker wrote:
> > On Tue, 2026-06-16 at 10:25 +0200, Anders Heimer wrote:
> > > -        for pmap in prefixmap:
> > > +        env =3D os.environ.copy()
> > > +        env["LC_ALL"] =3D "C"
> > > +
> > > +        for pmap, prefix in prefixmap.items():
> > > +            dstroot =3D dvar + prefix
> > >               # Ignore files from the recipe sysroots (target and nat=
ive)
> > > -            cmd =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z '((=
<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
> > > +            sort_p =3D subprocess.Popen(["sort", "-z", "-u", "--", s=
ourcefile], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Den=
v)
> > > +            egrep_p =3D subprocess.Popen(["egrep", "-v", "-z", "-e",=
 r"((<internal>|<built-in>)$|/.*recipe-sysroot.*/)"], stdin=3Dsort_p.stdout=
, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNULL, env=3Denv)
> > > +            sort_p.stdout.close()
> > > +
> > >               # We need to ignore files that are not actually ours
> > >               # we do this by only paying attention to items from thi=
s package
> > > -            cmd +=3D "fgrep -zw '%s' | " % prefixmap[pmap]
> > > +            fgrep_p =3D subprocess.Popen(["fgrep", "-zw", "-e", pref=
ix], stdin=3Degrep_p.stdout, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.=
DEVNULL, env=3Denv)
> > > +            egrep_p.stdout.close()
> > > +
> > >               # Remove prefix in the source paths
> > > -            cmd +=3D "sed 's#%s/##g' | " % (prefixmap[pmap])
> > > -            cmd +=3D "(cd '%s' ; cpio -pd0mlLu --no-preserve-owner '=
%s%s' 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
> > > +            sed_p =3D subprocess.Popen(["sed", "s#%s/##g" % prefix],=
 stdin=3Dfgrep_p.stdout, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVN=
ULL, env=3Denv)
> > > +            fgrep_p.stdout.close()
> > > +
> > > +            cpio_p =3D subprocess.Popen(["cpio", "-pd0mlLu", "--no-p=
reserve-owner", dstroot], stdin=3Dsed_p.stdout, cwd=3Dpmap, stderr=3Dsubpro=
cess.DEVNULL, env=3Denv)
> > > +            sed_p.stdout.close()
> > > +
> > > +            for proc in (cpio_p, sed_p, fgrep_p, egrep_p, sort_p):
> > > +                proc.wait()
> > Hi Anders, thanks for the patches!
> >=20
> > If we're reworking this code, I think we should replace the complex
> > sed/grep/sort pipeline with Python code. We can read into a Python list
> > and sort/filter using the Python standard library, then pass the result=
s
> > to cpio.
>=20
> Thank you,=C2=A0 I am very happy to implement this approach instead. I=
=20
> strongly agree with all your comments.

Hi Anders,

I was discussing this with Richard just now, I may be a bit over eager!

This code is performance sensitive as there's sometimes a lot of debug
sources to copy. We've seen previously that shutil.copy() is much slower
than shelling out to `mv`, so we probably want to keep that one as a
subprocess. The rest of the cleanup I suggested is worth doing.

Thanks,

--=20
Paul Barker


--=-1uUzC9ADdjv083v73tM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajFSsBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0br2ZAP4qD+I7r8sSOoP/DP85KauZ3Ubk2PZIQf+m
iSu8A/Uj2wEA8joyaToRKCU3KOaiWxmJQ5XnW0U+wGOIUjx/WvZsIA4=
=prym
-----END PGP SIGNATURE-----

--=-1uUzC9ADdjv083v73tM0--

