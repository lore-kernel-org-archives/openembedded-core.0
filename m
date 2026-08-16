Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC86C5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 15:50:46 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12175.1786895442819244797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 08:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Vmu35vAV;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=aIm+KSB5;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B80651400107;
	Sun, 16 Aug 2026 11:50:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Aug 2026 11:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786895441;
	 x=1786981841; bh=QT0cEKTLo/0mmyMFKEsq5EeLRNVoPPwkeydGYctJjQU=; b=
	Vmu35vAVx5FRYwllSbsScrEy0PjTAP8AGXnclh65QSdDD0nhcN0DOeR+HutuZ2Mr
	KG4/HCdO0NIcqq35Wac/zy2URsSXCa+G2HUoYurazUut2T059iF6Imdx16XQgaVV
	ot6Y9vL2K36/dGFfukCWv5Pk5ccQkdXwcY+AFpKGqjQmmHRnNxZ50D/3yUb45kRy
	sWq2GrEJKvqR+JQUuNmMb0iMvXpCXMQQhVK0VjqrmlcbLuD5g/y/mu1T6IjTYsvO
	yls6g8i64lpqpVkqlpABhu8LZWHhq6TfIqxrypdZHsLCTKw+/bMpxoih69PEyRI0
	VGFJfndHdl1AHBFtaD9NEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786895441; x=1786981841; bh=Q
	T0cEKTLo/0mmyMFKEsq5EeLRNVoPPwkeydGYctJjQU=; b=aIm+KSB5lA0rh0xTh
	A+x6PzMrmIHmr1ILwSl0xKQGkVDLtD8lHzNMBH21JHL6wd8r2q9N3did+4urntQx
	XuIGZgNXTF4qJevaTYWRtFILWgc9CMjuLtz9VoV8IReyliCf/s4nHAr8egR4/NMz
	3afSftvYdYg1rcycjTNIYiLk+uQjP+8uDUrs4tLKMx/rCVod94BahNawqDVtE2wl
	wtRUTagoSbJlVbEDQpkYvciZWO+533TeTtpYmwg/dnwcdCiulvaJAGk5/f02gqhM
	oPSQUh8rdQ1UfwExcUZFUGj4rgnThM1Cc47vjPJVMAdrZAvFNzvGy8nto1V0KkOB
	gB6ew==
X-ME-Sender: <xms:UdyBalMf9cCwZf-fQDebvlbObXY6hB3sg9LpopnR6bgJGJ2xcnnT4A>
    <xme:UdyBat-HmhVJlkkaUAH3waUE-ID56iOlCJBX2qvhseIhCwKQQYo0XtRAyEZoKm_LW
    -atrOCweELP8QW-TPU20jlz933n9hMamFNwR3tRklB_yOHHuR3H65rh>
X-ME-Received: <xmr:UdyBah4qu-DrUJN355dfHIC3u3RjJjhWSAJDAny1mdzv8BDKm8KjKJxA3F3AP2R39HK1MQIByhVkx1OND45-1bV_PKXw5lTgls8Ks2yeXdre>
X-ME-Proxy-Cause: dmFkZTFieyK46MMAGtIDJNtPgtaYVAcyPFLFOiPhZPPzdNxxJDiAMfDwk0ySsB9HAbIKVv
    KSePlUbEA2+Z3RQorcz775bwBl5O6sQcB/oA9l9UlwYMWpOdYJwGjplmGjMcKd58ktDbiF
    2hcWbWGw8xldPy2bwe8JdSjcGYeI799muGW2RK/HCjGnZ7k7h1I2NK3BqItvk6Z2YqNnAk
    LgvtBpMjK4MVjUQX6rWKYYQG6YvpnWf7ZYV0ppvDjRcnN+G3uZZW6tlTdtVaDozlLT8pHO
    WLwPG4WvkgBpCQBuNtMvr33H5WZmLtfRKVxE9FRJXJ4q4vynVZ3ITZo1pz2sVEyDZI3rQZ
    tq7Yk1N/8pDDGOsq9m9Ua0I9PYCAfmCoN2FtdpWQQJSj3Ab62yeSxLXF13eqQnKEZI3y5M
    wtT2SoBdldVYRuJtIEPn/y9koYVls6lLKXazxVz6+9kdxzB0WZ2hyqv/9zx/r0qB4SU7uY
    8YpGSvMyk6RaIY/CbkGk7etn0NjfqTRlQ5bEA3F9VAI/kREZmv/9ZbhZ2wbJkds32Z84kI
    ThrR1T/VcmqaZNAAMDNpkiJ2sFm81SwqoGbc6Gt0MTOtwdHUl/7HXWFGO1ERZVufyjR+4A
    uyqJE34INIIvaGodU6cBfNBQT0QbSHPcPPSb8HmKSR+zUHPCBDEFpYWg81Sw
X-ME-Proxy: <xmx:UdyBas0rCtcaRNF2AVvaBZ_6eBqRZ-cZrSoroy6eSxnx_RWxLN2ROQ>
    <xmx:UdyBagBSccPwTWRjmq7aR7Ix-ZMtwxWm1OIoiBnNqH52oIPAwmoKqQ>
    <xmx:UdyBam3VgzwQWhi2US7O66vFgFgdSV56FxZbERlRFyQtfqSf25u3vQ>
    <xmx:UdyBaiuA8leeYU36QxHo0x4RmjTQYP9S_CPlTVHMivjECx46yWvUkQ>
    <xmx:UdyBakyamGFVjPakjAaiX5MtP0HRlLeUqNCZ2tNlCWNErb_GGt74swxV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 11:50:40 -0400 (EDT)
Message-ID: <5349c5a65816faec9fdc46092e46a13816a32a70.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v3 1/9] cve-exclusions: set status for
 CVE-2019-14899
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 16:50:39 +0100
In-Reply-To: <20260812072842.1176341-2-junjie.cao@linux.dev>
References: <20260812072842.1176341-1-junjie.cao@linux.dev>
	 <20260812072842.1176341-2-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 15:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243528

On Wed, 2026-08-12 at 02:28 -0500, Junjie Cao wrote:
> A network-adjacent attacker can send packets addressed to a host's VPN
> tunnel address over the physical interface. Because Linux uses the weak
> host model by default, the host replies, which lets the attacker infer
> the tunnel address, confirm active connections and eventually inject
> into the tunneled TCP stream.
>=20
> No upstream kernel fix exists. The disclosure notes that reverse path
> filtering is not a complete solution because the attack also works over
> IPv6, which has no rp_filter; the mitigation that shipped was a firewall
> rule added to wg-quick(8) in userspace:

We should drop the discussion of mitigations here - none of them are
complete mitigations and there are more nuances.

>=20
>   https://www.openwall.com/lists/oss-security/2019/12/05/1
>   https://lore.kernel.org/all/20191205191318.GA44156@zx2c4.com/
>=20
> Distribution trackers record the same state: Ubuntu has it deferred
> since 2019-12-13, Debian does not track it against the kernel, and Red
> Hat scopes it to openvpn:
>=20
>   https://ubuntu.com/security/CVE-2019-14899
>   https://security-tracker.debian.org/tracker/CVE-2019-14899
>=20
> Record it unpatched so it stays visible rather than excluded.
>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
> v3:
> - use "unpatched" instead of "upstream-wontfix": there is no upstream
>   statement, only distribution and disclosure sources
>=20
> v2: https://lore.kernel.org/openembedded-core/20260803084827.1348810-1-ju=
njie.cao@linux.dev/
>=20
>  meta/recipes-kernel/linux/cve-exclusion.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-k=
ernel/linux/cve-exclusion.inc
> index d27d764..5ed4a00 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -192,3 +192,10 @@ CVE_STATUS[CVE-2025-68195] =3D "fixed-version: Fixed=
 from 6.18"
>  # Fix https://git.kernel.org/stable/c/b4b64fda4d30a83a7f00e92a0c8a1d4769=
9609f3
>  # Backport https://git.kernel.org/stable/c/75c5d9bce072abbbc09b701a49869=
ac23c34a906
>  CVE_STATUS[CVE-2025-71145] =3D "cpe-stable-backport: Fixed from v6.18.3"
> +
> +# Consequence of the default weak host model, not a specific defect;
> +# mitigation is firewall configuration only (rp_filter for IPv4, a
> +# strong host model rule such as wg-quick(8)'s, which also covers IPv6).
> +# https://ubuntu.com/security/CVE-2019-14899
> +CVE_STATUS[CVE-2019-14899] =3D "unpatched: consequence of the default we=
ak \
> +host model, no upstream kernel fix, mitigated by firewall configuration"

I recommend slightly different wording. Include the triage date, drop
discussion of mitigation.

    # Triaged August 2026 - no upstream fix, Ubuntu fix deferred
    # https://ubuntu.com/security/CVE-2019-14899
    CVE_STATUS[CVE-2019-14899] =3D "unpatched: Consequence of the default w=
eak host \
    model, no upstream fix"

Best regards,

--=20
Paul Barker


