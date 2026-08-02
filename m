Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE93C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 17:48:12 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27313.1785692888103878028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 10:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=O9SOVVwD;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Fw2jUJCi;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 263A414000FE;
	Sun,  2 Aug 2026 13:48:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 02 Aug 2026 13:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785692887; x=1785779287; bh=MWpVyJEfTj
	bMyc5vNAAjDhJaL18wD6gEpCaZ5LGwTAg=; b=O9SOVVwDthktZ9Xo64xh4qN8BR
	dg3jPvxGdn5jDCBZjsgCCXYjsmbBDNWmdfGO9PzL5wZg+KGw9HFFIqJyhhjaBy+X
	0SqLzME9rGteekv41EYMt68zeO3JvpN8Kizhj6DEG+a/JBjq0XdbRfTAQXdi6f7H
	jXkR+r2gAyww5PmsVDdGZeUYlvEiZdaoewLRU6Zacb7ZDWA4QyOjnArlwab/KFfr
	7PPuZKD+le9xxkrZYKMuP1HdRF++CsZmxLQH8M9Iif3Kx/OF2m/hfdbZJaCYeyI6
	BJgbpd9ePwIa08kMrm0BJtCl6Q8nVUU9V04y/DvSlpN9XzQgh/KB2d5jNZSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785692887; x=1785779287; bh=MWpVyJEfTjbMyc5vNAAjDhJaL18wD6gEpCa
	Z5LGwTAg=; b=Fw2jUJCij7nuq28/ZImPxIN7m5qyuglJkbsui5feMwfor+HfRlv
	5mcc4V6/5/iGzCfN1tenVAoq6YuVmBjsOCh40EIFtQOj4V25BmFu8NNT+nrFEp89
	uVPPc3EEc3HNu28trj7IRXGMETMCYD6lmQ9pohu25p5fJiV0TqXuHF/2SCXuDsyr
	J8bo9D1tRHH9jxWhzOF9KCh7ikooCSgpGeiM1KorrKWUZcY5G+KG6/5QtChanRFC
	303aCk6TRAtIQ/qVdGOisD1JtMsALfo+5gCzbv9Y1xrB5TVscwcPVFRA4oS2Y8Fh
	5vG6n//F4shb/5pJ7RZC8R+lsPqaErwhDEA==
X-ME-Sender: <xms:1oJvaitxHoIJaeA38OJeht66QlLfIdtBlJSHNPIS2dYQgtnz3-hSSA>
    <xme:1oJvaueRdcECOKPrKB3t5bjRmb6DJAKrAQWA4eAM26l7ZmLMGy9mGzS_zRYdQAXr8
    24CcF35twrUSvkhou-HNj0IdLRFngeESKFhayxo5wRaVUQxF62Ny_S1>
X-ME-Received: <xmr:1oJvaiy3AkElGXur_XgK5dWv3VyQZmXdq6nYwOXAdQCoUMen1g-1hlHQeCbC76RTqEMSdJBSFTp_4PGBB3C6iL-mlawY3Sc3yE519LNH9dkC>
X-ME-Proxy-Cause: dmFkZTEWvKdcnjTgQlPWx2sm+IjYljWOaK+mwlQ7h9a13ZNFgs0UuNJsvGBwTQhw6meVXB
    59xpidLUuqyqFz+zRQC9fozmNFs1Zf3kljqs6/uRNyyuuUysRHBUZ+45NEi7SpEojmchAf
    aj8hNf0SVY8+NyPo4COHSGTuQ9XtIoHCumuFEdRTIHL3dQEpZb7jQTKgzSYJcLtaZBjIhn
    pbJyxPTyui+S/h7OaQOF8HrBo71fnAY/VtUTljocAdfcuY5Bj1GCXvPfwWkCH5KEXJlVPk
    1hXOE4TSjuzLKL3VVHp/61nHQIiO9W90O4HGx4XMKD8/k74q7gFCJ3AXRHwzFPm44objrL
    Fm26EHFFuuVxL8rokUCvgI5Bkhp7UngbMPyoC1pI83siwS9bUNeeXBMMgmWYaEK6OcbSlw
    bhrzFjnlR+13QM4EWAyDUDpMLdrrpVPqsXhDMoFFJsX88//vcSFuYs5EXeluYvCDVUrz19
    NjvQnK0DTjYDAJPV8Ioq2VZH/pn1j1PI3WCHpNAO9VgzmTEGrwt8C0hyb/Tdqf5P847GSc
    7LMCat7Pgu16qzGnDkCM96jubmeDSVU8BlR1P1q84xJTOoFqt32gaxUxqfMaBqcFhRUpru
    O6+CIfXLoYaJibvjvdyiVerb7SnIcsBTA5SbG6OwiKQzJjZFu+Xdy5rlh59g
X-ME-Proxy: <xmx:1oJvasGTafxCCJ6VaJSF1qpP2cRShuEz5fvQ8QHtL-t1aslRi67TEw>
    <xmx:1oJvauyE4JT8YthD31n5-OkkioxqJa_ibFZq57NA4n9TcEErPc_e3A>
    <xmx:1oJvalvuKptrb-RjqCXI_bcg0yCCbN4kWhQ8kTij70SG8bu-vIgX8A>
    <xmx:1oJvaj1SPNEJZrN5jOUR_qNPf7TtWYjLlcBgEbC-D1-62uBMB2Me5w>
    <xmx:14JvamEO0JW4loabmytUhfna2U3woBWvKlArqOJXwVeZjlsXToCsNiHx>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 13:48:06 -0400 (EDT)
Message-ID: <95aae562c0b8862ac687a63e8003143044519d6e.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] cve-exclusion: set status for 7 kernel CVEs
 lacking upstream fix data
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Venkata.Navuduri@windriver.com
Date: Sun, 02 Aug 2026 18:47:58 +0100
In-Reply-To: <20260802143444.1178575-1-junjie.cao@linux.dev>
References: <20260802143444.1178575-1-junjie.cao@linux.dev>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-P1GCQ5dVvosjOUuI2aBp"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 17:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242563


--=-P1GCQ5dVvosjOUuI2aBp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2026-08-02 at 07:34 -0700, Junjie Cao wrote:
> Triage results for seven of the CVEs listed in the "linux-yocto CVEs
> in need of triage" request [1]. All of these predate the kernel.org
> CNA, so no upstream fix version will ever be backfilled automatically;
> each verdict was established from distro security trackers, mailing
> list history and inspection of current mainline source (linux-next
> 20260727).
>=20
> * CVE-2019-14899: VPN tunnel TCP inference. No kernel fix exists or is
>   planned; mitigations are firewall configuration only. Ubuntu has
>   deferred it since 2019-12-13; Debian does not track it against the
>   kernel; Red Hat tracks it against openvpn.
>=20
> * CVE-2021-3714: KSM dedup side channel. Red Hat closed it WONTFIX
>   (bz#1931327); Debian marks it "Inherent design limitation". Only
>   reachable when ksmd is started and the workload opts in via
>   MADV_MERGEABLE / PR_SET_MEMORY_MERGE.
>=20
> * CVE-2021-3864: setuid coredump privilege escalation. Both proposed
>   fixes were rejected or abandoned (links in the file); the flagged
>   fs/exec.c logic is unchanged in current mainline. Exploitation
>   requires a relative kernel.core_pattern, which piped/absolute
>   patterns (e.g. systemd-coredump) prevent.
>=20
> * CVE-2022-0400: net/smc out-of-bounds read. Closed NOTABUG by Red Hat
>   (bz#2044575), INVALID by SUSE (bsc#1195329), "non issue" by Debian;
>   no affected version or upstream commit was ever identified.
>=20
> * CVE-2022-1247: rose_connect() refcount race. Fixed in v6.17 by
>   d860d1faa6b2 + da9c9c877597 ("net: rose: convert 'use' field to
>   refcount_t"), whose commit message matches the CVE description and
>   which removes the exact rose->neighbour->use++ increment the CVE
>   describes; backported to 6.1.y/6.6.y/6.12.y/6.16.y. The rose/
>   hamradio subsystem was subsequently removed in v7.1 (dd8d4bc28ad7).
>   Distro trackers have not yet connected the fix to this CVE.
>=20
> * CVE-2022-4543: "EntryBleed" KASLR bypass. No fix; upstream position
>   is that KASLR does not defend against local attackers. Explicitly
>   not fixed by 97e3d26b5e5f, which randomizes the separate
>   cpu_entry_area (that is CVE-2023-3640).
>=20
> * CVE-2023-4010: the function named by the CVE, usb_giveback_urb(),
>   does not exist in the kernel; the reporter's PoC exercises the
>   unthrottled URB resubmit loop in drivers/media/rc/imon.c, stopped by
>   eecd203ada43 ("media: imon: make send_packet() more robust") in
>   v6.18. The commit carries no CVE reference, so this tie is inferred
>   from the commit content and the reporter's PoC output - flagging for
>   review.
>=20
> Of the remaining CVEs in [1], CVE-2023-3397 (JFS txEnd UAF, still
> reproduced by syzbot in 2026-06), CVE-2023-6238 (NVMe passthrough
> metadata DMA overflow, fix was merged to nvme-6.6 then backed out and
> never re-landed; kernels < v6.2 unaffected) and CVE-2023-6240 (Marvin
> RSA timing oracle, fixed only in RHEL downstream) are genuinely
> unfixed upstream and are deliberately not excluded here; detailed
> analysis posted in the thread.
>=20
> [1] https://lore.kernel.org/all/4ac849a706feb16688020d5bcc3e74aececd63cf.=
camel@pbarker.dev/
>=20
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>

Hi,

Thanks for looking into these! This is a good start but we need a little
more before we can accept the additions to cve-exclusion.inc.

Please send these as separate patches for each CVE, and including links
to relevant sources in the commit messages. We need enough information
on each for users to be confident that the conclusion in CVE_STATUS is
correct.

Please also include the three unpatched CVEs, you can use CVE_STATUS
"unpatched: ..." - that will help anyone else looking at these in the
future to avoid duplication of effort.

Please also make sure any use of AI is disclosed in line with our
contribution guide [1].

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#ac=
ceptance-of-ai-generated-code

Thanks,

--=20
Paul Barker


--=-P1GCQ5dVvosjOUuI2aBp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCam+CzhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biZHAP9XDiE/0j2SkrY/ZBYwb7y6riMcTMbhifl9
43ikR76PGAD9E/kEhSgkpoMcNOnWJNO03wfkD9hytjOnER2sA7GcQgA=
=VoqC
-----END PGP SIGNATURE-----

--=-P1GCQ5dVvosjOUuI2aBp--

