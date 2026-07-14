Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CC2C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:29:23 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9483.1784035753399087769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=nse8Xb0h;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=iiJ2+87I;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 80C741400134;
	Tue, 14 Jul 2026 09:29:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 14 Jul 2026 09:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1784035752; x=1784122152; bh=vjrXctE95s
	AGd1zXURH+BX+bej9d8ligwi721/LoOPw=; b=nse8Xb0h/9VPjt9DxKlIJzkyqy
	bewMUREjK2rKEzIz0joA6ARJzvB4bbDMqkq5/nzw+tA+q8VsdKKZHZanekYKO6Ce
	G/KizsZwrQEfZAPGlikwbDHChcX7VvwHWitBzaaDWvLKARD/pMMHl2TEn1xf/2PN
	lUHT4LiOQIfnWLPaEetEYYLEKAEjoOp2zApePnJ9nKrfnNq8/Otganf1mSVQoqGr
	SrEK8fk9aMMlYyaB9BWS4gt+8Xdn1moafmd2/RlvqweZ1AyBZXInmxUdD5n/DmKE
	v6n/x4+QU0wssu5d9OABhwl5U5BLKidHAOOmiokKTWVbwylzOcTyuQGuePiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784035752; x=1784122152; bh=vjrXctE95sAGd1zXURH+BX+bej9d8ligwi7
	21/LoOPw=; b=iiJ2+87IDBrJUPTMe7zhNxZ2guHe+kaD/CIcxsfRsAYbnEft4d7
	j1IT0vFYrSwSCcfmaMh+7CZ0h4tE+SRJ0DHqp5I9JIICQaeGuCLGh6OJXyUEqauB
	C5ihw6FNd3rC2ktyyvVtrEfUcM9AW5ei7dcWme7hzHH/IYJMvWsKH+VfycGt5oQx
	QWXmC5p2ZzjnouNOgHSlehEzWEiLAp9JbkJ2wKa9m0Kq3Kj05ETgJt1BokS6SJe9
	Wv01ltl+Q2Ej4y9kWA2Po8vT9kW8yroTvWXXd+Z0Lla49YQ8ysrchknJ9GwFhekl
	ld1UX4LCkf2bVclqHNGg3WQzBkiJ2rFryZQ==
X-ME-Sender: <xms:qDlWaqWzZXW-Icd2JF6Uo9RUIdI3-_3_HhpBlqR_3AcDY5fnQfKRBA>
    <xme:qDlWatl7_nBKZZApQUpeSl7ytiydJK8MvKAmSKq3yIMQyh1BaF4G41LNZzz3IzqXI
    _s7hfp3R8qz8DSsWhZaDCd7N9YPaoH4MtAqNV2m-p62G6UqN2aCjUv7>
X-ME-Received: <xmr:qDlWaja_lYf3aIeu-OdasA9gJuRtcrfW7uLVlrSMaY1Oo1OYMlIV6vxHTDyDX6dPzVov6v7njhwJQhmlHj8RNDuFrlmV1iBfJLveE-M>
X-ME-Proxy-Cause: dmFkZTEV9FNoo0yKrVf5ijO5XLsnhwHcc3MyIvDGnBWGUAhxU/5vpB9gc7zfEB2aPYMgBs
    QR8/SL1x5guUwpoSNJNo3UcEhmA58SI8I3EQFTVddY5lpap6y5QmS1S8gN/idjsLNW8PBI
    2/WcYXkA9xJrzBG7ibiynMdxg7ko589Aljiya1OK21hHiHkJADorWuXzc/kBy+jXRWSppy
    HBZMAc3eYxUs6EispIfk8RVHhPVSQu1NiVlPa+1hXYnOaxzVU1kyTIAQU4y/UrAMZDwU5F
    vwZGi6cyHBNpCXjUIztx82q1+eCZ9E+zrKWW5Lk48Gj+cjgF+XzV6gefn/y4xD63EIZkFw
    MKa6QHvwHa6SCTEQbNr/7hlVXYgcEcelj4ajHWbmuDrnZI+64t4oFlGIt38Hy8+Xdel3Op
    kMVPm0OhNjhfGNisqJMfmeejXumaDqxDFDxEK6WVhqDaf976nn9u/8Y2iDfJ6MfwhqmOKw
    e8Kkdn6qpp4SWq7xGUaBzVZGvUpGRN2o32HniWSM1ea7I6+r0a1jbaXEF4v/oKEOTqcZFr
    um8t/0/emE29BWbTuORZlmdTwTcpdphBVCidAI11ZFH5nUR3AXH7pL/Uu4mtTChoEFVnES
    ZkHQvqc3+0i/OL9I1LsiRYEcRM2wS9Vq41rPSUs22FQmR/DSiOrOFuFM4lqA
X-ME-Proxy: <xmx:qDlWagP8dDdkH4KqYhdFQjaU3cL9qYj2Gvi8YPjmZMIgWkuoXdpXmg>
    <xmx:qDlWagY1P1HbLuLZK_wMUjJdHJBOaQB2XcpCOmxgd6ZmHkvR54wHkg>
    <xmx:qDlWam1Fq8VxUJc9nvQgSsXj5Fm0ssh3PpTWTsNZEV6TLb60uJ4RUA>
    <xmx:qDlWaueQsxjkWo2xTa95zIr_BrW-VNUJKTJxW6yplSQBfY114RQUPA>
    <xmx:qDlWaqZvc-9qiv3tkAuXQS9q6vhCGqRoHtjLvm3qF14LAaWYkXFDysM1>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 09:29:11 -0400 (EDT)
Message-ID: <cca6b5d5382e36e325a075861daf8bede882bcac.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose][PATCH] util-linux: upgrade 2.41.3 -> 2.41.5
From: Paul Barker <paul@pbarker.dev>
To: Siva Balasubramanian <sivakumar.bs@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>, Chen Qi <Qi.Chen@windriver.com>
Date: Tue, 14 Jul 2026 14:29:07 +0100
In-Reply-To: <20260706115516.19878-1-sivakumar.bs@gmail.com>
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
	 <20260706115516.19878-1-sivakumar.bs@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YphlbEPBoPj38XqeLY0V"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240891


--=-YphlbEPBoPj38XqeLY0V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-06 at 17:25 +0530, Siva Balasubramanian wrote:
> 2.41.4 and 2.41.5 are point releases in the same 2.41 stable series and
> contain only bug fixes and security fixes (no new features, no API/ABI
> breaks), so the upgrade complies with the stable branch policy.
>=20
> Among the fixes pulled in:
>  - Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2026-2745=
6)
>  - libblkid integer overflow in parse_dos_extended() and a use-after-free
>    in partition probing
>  - pam_lastlog2: fix libpam linking in the autotools build so
>    pam_lastlog2.so links against libpam (fixes the runtime "undefined
>    symbol: pam_syslog" / dlopen failure) [YOCTO #16320]
>=20
> Drop two backports that are now part of the release:
>  - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
>    (upstream f55f9906, released in 2.41.4)
>  - the pam_lastlog2 libpam linking backport (upstream 5683ed6320e0,
>    cherry-picked to the 2.41 stable branch as c8d0af0421f6, released in
>    2.41.5)

Hi Siva,

I just see one backport dropped in this patch. I don't see any
pam_lastlog2 backport in the current wrynose branch, is this related to
a patch that wasn't applied or something you're carrying locally?

Best regards,

--=20
Paul Barker


--=-YphlbEPBoPj38XqeLY0V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalY5oxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsZ2AQDW3LCj6zlo8gUKsQ8osmWU+vccRoS2VQe0
YcgHIopkGwEA9eb3fVmH5oYCb1A8iJR7vs1FKWeX7Q9ezU/ZOXtFIgI=
=otDC
-----END PGP SIGNATURE-----

--=-YphlbEPBoPj38XqeLY0V--

