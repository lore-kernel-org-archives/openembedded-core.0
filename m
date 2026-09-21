Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79A8C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 19:53:04 +0000 (UTC)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5303.1790020382695952121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 12:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=GgSzutb+;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=MAUkM+i9;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id A8CAD1D0008D;
	Mon, 21 Sep 2026 15:53:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 21 Sep 2026 15:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790020381;
	 x=1790106781; bh=dcwNZSDoXxybDrBfbocOA2CQn7e9+SjP8KMUjtk4++o=; b=
	GgSzutb+9Jm/c3bAtrmZHdEDAQI6XZS5rOoI3HeG9hA1uXUf0e5HGzOp88MzK0Sd
	l+NhvScqMkJ6/OAFQ/iL+9hYGf6mKhtkyFO0GCYxto3BLXiaMBxkd1m7R1otkpx1
	CCsIxycb1r1HgjsP0ZFXh8r4LVrAVWmbV5oBQpdKqTt6ZW+9afGsAEQHUlJvXd5r
	lQGQvGwjE+hhSYHrTN8XaHYruAJF8iRNv1nBRTBrtBieZ/0aUov92wWFRZyurSkp
	IOFc4tai0x+T/Jj2o2P6OOEfmcAUxPANOCzdcz3Wz+QmP3FTjwJvHeJAM270rF9S
	XRvRktapzYAY7r6YHkySJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790020381; x=
	1790106781; bh=dcwNZSDoXxybDrBfbocOA2CQn7e9+SjP8KMUjtk4++o=; b=M
	AUkM+i9R4iLPFICFqxaQfZvVgvcAavdEUifetLtwoueWToKQ8/1Hr2CJSi9AJut8
	4pnPbHAWLOIWXp4Zj6TnhovQai5hN9MiR+sVh97GNJAsnQpJyksjxTO1zUVjWiCF
	SeuKxZTKj5X6Du9qG1swbF7F06nRRGXrgKrxy++Zi6VEo1zKMX6G65UBeCkWHHxL
	ifiLHZRAZ4bVFo1ia4G4MEOW82BY5QFTEHZCj8tis8zUdDjzhheuLwx6GMmrN3Wc
	bWcNAIKK18rGVt322cPW/+h81LWNiEwtNYC9FWRzCkspvptUyDb9C5tApq7k8aQJ
	4zp6MgjsSJYckIIFM+HNw==
X-ME-Sender: <xms:HYuxaghaeFz0Pff6QopmYRaUx8VlBurai0t1wLU1G45tpZ_2RX42QA>
    <xme:HYuxagBGsNI1zB-0hS0sSwl_kyqhVAcFX4vjvpm0Fhroz1yxsLCg2IJt2DzgVG7MV
    H2pJXUNDcxp_sVTR_ntAdPW2QKHMkNrF6gpFEqZF4QLmBVVTslqipMY>
X-ME-Received: <xmr:HYuxatHb2wnKTLYyXcYhFEoDptY7nnntXhxrKoCauHzBPD521FmjNZZMWyX91uoqX4wD>
X-ME-Proxy-Cause: dmFkZTG3g2qmQ9/SKwNyiUIZ/lL1uX32hSLOMxvM6w5/88phBBLIFV7DrOZp2F0SzZbv45
    oPoIwWw+o/IZPMa+mhpfjbxUkEB1f9vnIgeyOV2y0Uzd8qbyOguDw7O8jd+6aoSqeXV853
    0WzfCRnX8YXsRAqYziJVOMFyzR4762lxUINlqHhluHD7WvaWUVy2LuUSPeaG1uR5ZKH1BK
    9TxGucmI3amsB37T77JFUe6f13p3gHiYiwbUiEVczUB4p62XcolevIY9rTvprEFSIF/bAx
    FvOCmGs2gW42CTIV5lJgI2kndv+7rLOS1zZ+Gmh5dTE23c5WJKWI2a8YL62uG5RUaXvsP6
    fXIs8pDktUVCj/NrB9k/HK8kgc5dovZimkliHdWclCmT31LSGoNlstAFckzzPLAcgvpKjk
    ZHmru4fEfOPj06hSgPh2T3+Sz6WcA6R3sgPcb9Y8OEIjfgJL/nyQg4hUkegZwL1IzWVo+r
    kKnhmZ6+Jat8X/hcUhIYAtGRyUvtgY++hSBVBRWNXFC9ou7MfuqPl0stJq2mR2NGCJVZmI
    E9kr63I5oQ0wC7XnC7pZsN2Nwn+ELGfstzVwV1rb86CXkSrPvpipYRHAyOJHGFrb3SSeOF
    5c5dc52cqGUy201Kx11KbtGW8E5T/rmLTYFrKzfHX4RjBIdW/gGckB7kq2yg
X-ME-Proxy: <xmx:HYuxagJs5nVBLtvj0ApsUaNBosKCbM93Gbo-1XkmPCJFg-LtCF55mw>
    <xmx:HYuxapn-PjOOTSx7fQxVfuxiHevSNbvLTKX_8bUkeYW734g_lUX2Zw>
    <xmx:HYuxagQrMhwcQ-uFGqLahjsX3K8mD0OSVywjqdxOOhIXOmfuAWrpkQ>
    <xmx:HYuxajL8nLtrOnkW37TJAiCAkzbSWmeOp_yU4rHU3tvEcRjMkKe-ng>
    <xmx:HYuxauN5LKl1FEv_6k-fzXv-zMFODYMUJyVsyd-w_4VQZVzBjkoHiIQz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Sep 2026 15:52:59 -0400 (EDT)
Message-ID: <4ccc62a34b7c0ff418951a62c873daa589e45683.camel@pbarker.dev>
Subject: Re: [OE-core] [wrynose][patch] rsync: Security fixes from
 v3.4.1-sec-patches3
From: Paul Barker <paul@pbarker.dev>
To: Vijay Anusuri <vanusuri@mvista.com>, sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org, Yoann Congal
	 <yoann.congal@smile.fr>
Date: Mon, 21 Sep 2026 20:52:56 +0100
In-Reply-To: <CANQUz19S86jm7H3aoNKvm3NwEZ_L=QEmt53g4i2j=fgOz=e8jw@mail.gmail.com>
References: <20260917105551.76512-1-vanusuri@mvista.com>
	 <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr> <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr>
	 <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev>
	 <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com>
	 <546192.1789655591562202413@lists.openembedded.org>
	 <CANQUz19S86jm7H3aoNKvm3NwEZ_L=QEmt53g4i2j=fgOz=e8jw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 19:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246346

On Mon, 2026-09-21 at 15:56 +0530, Vijay Anusuri wrote:
> Hi Yoann, Paul,
>=20
> I checked with the rsync upstream maintainers regarding the security patc=
h
> branches and the possibility of an archive/tarball.
>=20
> They confirmed that v3.4.1-sec-patches3 and v3.2.7-sec-patches3 are
> official rsync security-maintenance branches. They have now also publishe=
d:
>=20
>    - v3.4.1-sec-patches4
>    - v3.2.7-sec-patches4
>=20
> These branches contain the security and compatibility fixes applicable to
> the respective older release lines after *-sec-patches3. Both branches ha=
ve
> been tested against the refreshed stable testsuite.
>=20
> Regarding the archive/tarball, the maintainer clarified that they do not
> plan to provide release tarballs for these security branches. The branche=
s
> are intended to be used as reviewable Git sources from which downstream
> maintainers can cherry-pick commits or construct their own patch series.
>=20
> Based on this, can we switch the rsync recipe to Git and use the
> v3.4.1-sec-patches4 & v3.2.7-sec-patches4 branches for Wrynose/Scarthgap?
>=20
> This would allow us to consume the upstream security and compatibility
> fixes directly from the maintained security branch instead of carrying th=
e
> large 34KLOC patch series.
>=20
>=20
> The discussion with the rsync maintainers is here:
> https://github.com/RsyncProject/rsync/discussions/1095

Hi Vijay,

Thanks for checking with upstream. It seems a bit of a strange way of
doing things to me - I am surprised these aren't further releases in the
3.4.x and 3.2.x series. Or at least they could be 3.4.1.x and 3.2.7.x
releases. But if this is the way upstream want to handle things then
that's their call.

We do need to discuss how this fits in with our policies on LTS
maintenance. We will get back to you soon.

Best regards,

--=20
Paul Barker


