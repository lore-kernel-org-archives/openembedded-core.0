Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1497CCCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:43:35 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30244.1792399413313025490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=oVTF3EgJ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Uxcu+vpH;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8D9797A00FA
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 04:43:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 19 Oct 2026 04:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792399412;
	 x=1792485812; bh=Y1vxd7pchaoYgdp1HB2A+rNGrk3KTzcV1poghNhuBb8=; b=
	oVTF3EgJA0I2MwSB4c47NbFg2zSTQbsAIGoeTiwRSuyOFya/1jyBmx+hRM2WeRQX
	nHQ5n3+R3Cm+pLYUxCwT5SzYks75Ym58WTTQHtHsl3VODPAqCUaQHnI6iBwCaY6f
	lXMG4kKXSffO0P2rAMOETaf8d8o7kP43BQF9PGoQnOLwMnTYWqOhdkMzm2Vqb+d/
	bjNHj0+LcBLYxLvSjI6zBy9kK6PMHniMJQAzhvEV7xsb22lYe4+haLVmwCvv9/R5
	cmm3w7EFAOXcE5sjun6WcSD6I/NxvFEv6KcS+EW8aWOWZPtAaXDCuRqxNYISp+OJ
	bYUgp+nvPFpn2HZkJLZNqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792399412; x=
	1792485812; bh=Y1vxd7pchaoYgdp1HB2A+rNGrk3KTzcV1poghNhuBb8=; b=U
	xcu+vpH6r687HULqUt8L3FhrjyK7VSdcz/f0iE4QQE8weS5u99btj2h6vGIrBEeE
	qr8MA9NYZZmGq+fK12+D07+59AbTL/OODbRR6SEiuRBt51qmQea6tWbR+ax4sxXH
	IeibgHYPMbL150BvWN3b/w2/dDmP+EVuqd6Yz2AWhfnwSBHoMp4n1p2ye40tdMyV
	s/vT3b+NQ/UAUeKPZ13VeoGAGtR14AY9Sv11EFPAhDfAaIkIwnTVhbJ4D1c0ZP+C
	wSyQmWuHH0ek+DVcGnleoux/XCBKysIeQVWhv1xcmJwkyF4YFhHLpiLTKAIT6IGO
	KziArN/dCKUdloRQykTlw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792399412; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:lhP2liVectD9zBAfii1e3o+eLxuYPgdBj/6iNdSHi11foxo
	IAaamHPWkRAltYnwKKTAAVIXKhNdnMwKtJxpaQ352vA5k9GpgGAmrSxlClGVEe+D
	V8aUcDtm5x/Oloih0oPWYazRoGeTRnX8CBeHVjV9SM+lTI1oe/oOvIo4RkwLY2zY
	dBL+LRzTGtVAv2uEvhb3KFQDSmEg9znTxowmtOgsE4HovYjlQWEK5YOrxhznbPev
	+5TyMAzEmt0Wi1Nx6YcDQYKLm8rPv8qCmvsiGuhVYMiHUONhy/KGSJT65all9wC3
	1Uso8tZFscBRRRktgvPCeqxYCDirMOBPJjogA8g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:0SJ8ZAiSgVpMeKzpb8azP0S9UVCHUXhBNMG2ngJFGLY=:miRP3GQDu7X9EN4LtnzBNLCK9BFuSyOvbOQ4P9hsdK4=;
X-ME-Sender: <xms:M9jVal8qS1FAW2I_SzIwqU5siBiuNVFx2Y68zcDM1Q30H0dNew1hBA>
    <xme:M9jVanhyxm-cxeL5N4nXc1uE3vC5FucvF6PutJyiRbQTQWU7tXtVls_dzc7kfZbla
    PL24W2tG5czxo7NxBnLkDztSWqJFWduQzH-MP3NNSBCn_HPKMCrWuk>
X-ME-Received: <xmr:M9jVatfCNyZphhtZ5Si4PqoWOiNQUYNpNneuXWyB_yfELCbGh40CDpxFYyB-G04pKOouManXBAUbqO2NHoCQvO0azZWQ1RbbbkVr>
X-ME-Proxy-Cause: dmFkZTENJTQzZEaRF2YaEv2uZX7PkLu0AGTqqYgV7rmGlFWOZtENOOdB3zP4HAmxfT2eY2
    USv+0OQhqfYb7M7HGQuVplXhDPjaxDDstcQfv7ZkxssTkAbSI32jrKciB90bM9UQmNCyzd
    Ggj98vr5r13ImIL8q+eIAUiDtQscjVDT8ji+kvjCWbw6GuUeDgZqljmPTOD7bAqphh3SMf
    wlBHj/P6pQYBViBnLaDED2GQ4KgOh6Lpw4C2f3BMYW8obS+s7cxDFqEAC9i40YzesuBy/5
    SifgUfMJeYE987wEWYVmrlvDNBZaypOuTXtQvyRL2EF2K18GikP6kOo47EoBm3UoCy8ZEI
    8fcI+KAVwCQ6QEiGnQOsDY21Wi0NZDIGFYsIMht0Y0vX8e2oRPp5bdqjiXgPHbUm7gyyLS
    fWyn8xxydqJ/whjE2kyNB8e1po7fdasqtsfHklHV/xuE1GUwRJZyYS7kSfUhfLKC6l4Gvf
    JLxGuvD6Nm1zaMwID/8h3WTNtJY6tK62CGky27qKEnowyOTpTL9DZrKjL3Zx0BFywkfd7w
    O+K/Oo0EWXyx0zNfyQwDDpwMZng5XlOIjVY/wSJBzZt9VEV/x3/DUAMof6OOaUu2BCNxzg
    WJ3wGcTG4lDDdjQfBMKHPRSte1pDrL8U7QRA7ryxOGX2efMfaKCIhVMLGJ7w
X-ME-Proxy: <xmx:M9jVamptlb2-s-TphLlRdXQIgo9kFOL0DN04L-niY-ol1fAm_0LSDw>
    <xmx:NNjVaqDlj0pseaH7O4KDhC_RClwKSmSMSuV9FoxDVbLCJ0rQElOvbQ>
    <xmx:NNjVarZrP5KQJPdpU8ClT9hcqC7X7lGheZuDPJjHET23WdM3yCY5Uw>
    <xmx:NNjVal7zoAIV620VA2NnvpuAcIuUCIUB9DT-84WT_SUPaGf8JHEQdw>
    <xmx:NNjVatQ4x2Tdx2CeIdd6hDa7MsuD4hxkd0LixwtzC1VL_JMov4qaFTZ7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 04:43:31 -0400 (EDT)
Message-ID: <e7227a973cd82c2fb4dfabb9a305d6ad42ba315f.camel@pbarker.dev>
Subject: Re: [PATCH wrynose 1/7] initramfs-framework: add opt-in root-only
 udev trigger
From: Paul Barker <paul@pbarker.dev>
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, 
	openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard
 Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 19 Oct 2026 09:43:24 +0100
In-Reply-To: <20261016031721.693971-1-wenwfu@qti.qualcomm.com>
References: <20261016031721.693971-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248150

On Fri, 2026-10-16 at 11:17 +0800, Wenwen Fu wrote:
> The initramfs udev module replays add events for the complete device
> tree and waits for every resulting event. This can significantly delay
> mounting the root filesystem when unrelated devices take time to
> initialize.
>=20
> On a Qualcomm RB3 Gen 2 Core Kit (MACHINE=3Drb3gen2-core-kit) running
> Linux 6.18, using initramfs-rootfs-image with root=3DPARTLABEL=3Drootfs,
> the following average times were measured:
>=20
>                               Full coldplug    Root-only
> udev trigger + settle           981.6 ms        109.8 ms
> /init to rootfs EXT4 mount     1340.2 ms        441.1 ms
>=20
> The root-only trigger reduced these times by 88.8% and 67.1%,
> respectively. The values are averages of three full-coldplug boots and
> two root-only boots.
>=20
> Add the opt-in initramfs.udev-root-only=3D1 kernel parameter. When root
> uses PARTLABEL or PARTUUID, trigger only the matching block device. For
> PARTLABEL roots, match the PARTNAME property exposed by udev.
>=20
> Keep the existing full trigger as the default so current users and
> other initramfs modules retain their existing behaviour. If the root
> device cannot be matched safely or the targeted trigger fails, fall
> back to the original full coldplug.
>=20
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit d3a196f5742425fb24cfc21bb380f3e96c49253c)

Hi,

We generally don't backport additions of new features to stable
branches. Exceptions can be made, but justification is needed. See our
docs on Submitting Changes to Stable Release Branches [1] for more
details.

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#su=
bmitting-changes-to-stable-release-branches

Please make sure that backport requests like this explain why you want
this backporting and why you think it is suitable for our stable
branches. We're currently under a heavy load of CVE fixes being sent for
stable branches due to the AI-vuln-apocalypse, so anything you can do to
make review easier would be appreciated.

Best regards,

--=20
Paul Barker


