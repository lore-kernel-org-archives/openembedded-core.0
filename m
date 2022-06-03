Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7F2C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 07:04:45 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web11.4607.1654239881701623388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 00:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=f2An/mty;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20,
 mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 4A99F32002D8;
	Fri,  3 Jun 2022 03:04:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 03 Jun 2022 03:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1654239879; x=1654326279; bh=lY
	04aRQICI5XbknnS/jErGQD74fOjc/5gLO5znILUT8=; b=f2An/mtyIcYLuJMmHl
	Z5fGY77BoJD/pMe7JddC3GPS4618wf9WkN4soXDmOd00+Ecw35Bia2yq8BbHe2X+
	oRLBFAd4CqsDjgy1GVYAdzv5hJJhhGEdONHtoF9SmkhDwyX09+eCQ6n6z34MBasY
	/h8pNNVbFr7WML5H/owPuQPVcCi8WceZhMhVbXzoosb57M7JnYtGDhGhFKj+bSRu
	iutlsg+YBfIS9fBR8px3a72iVTTpClAzRvrsMCPbSyMK/eB3x+1ODK4RmmrPAPfs
	lxno0vh83MepJQDsriS7qLN5/YaUiR0gCJS+dZgNkQzj1nyFti29iQhMC0zXN0NA
	Y6JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1654239879; x=1654326279; bh=lY04aRQICI5Xb
	knnS/jErGQD74fOjc/5gLO5znILUT8=; b=Sy8tXpvCkkOkTVSv7bKbKl9BFyE4m
	h7WHPDo7aRQFqMp6I5aNG2XcnBoljmvR6YYArnQ5ONmEhBRHzUTGvLDFB2sdhiwH
	GRpnfRHld+jlvc0L1hvRydzuT/x5v8YAIQmEGbIMqx3zR4Jg6GeRvwJ6c9ep7VVY
	G77G/gIW5c9W6PMSSwxPiYA8q1fO/oe/Y5lBH8zI+g8Ad1AxGC45WVtsUpZWvNZR
	kLWIC8m2QEWDFryoKw5qaUJd7hnGDuJndfqORVvRoccO0cA8k5i89L5TC/j02fwx
	ECgAK41rbKzTexPCCaT2izwLHkKUZu+6GFZuWRl5Z02j0OIXMwzNwW61Q==
X-ME-Sender: <xms:h7KZYs9Jyi4WptyGgTVB9SiKPGGq1jSlSBsiEGUIL332pBqepA_S5g>
    <xme:h7KZYkuDO39KdzmjoO4HqfiK13ZJ4U4AELDt9uf1Twxfuk3aY0kf0Ye5jl1_fgY6U
    wv8Gddl8TokqcGRYyw>
X-ME-Received: 
 <xmr:h7KZYiCh0K7T3RoNl_d8pJI49nYARx7nxs9GEKI84qEpd1ta51sCP9ECtHmAz2Sd4sV8tjA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrleehgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffhrjgfkgggtsehttdertddtredtnecuhfhrohhmpefrrghv
    vghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrg
    htthgvrhhnpeektdeugeehudeukeekueevheelvdffkeeuhedtgfetvdetfeelleegkeeg
    geeugeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhk
    ohhffhdrnhgvth
X-ME-Proxy: <xmx:h7KZYsfG-m34aVIEkuENAI90BNA008ZIERZ0s-EyJ_dTOMrAnqlNOw>
    <xmx:h7KZYhMxFTBOov6u6EfOoepPTS8L1cyjqbPECuZXpGhl1N8QYNvC3Q>
    <xmx:h7KZYmmTh7uIVhUtugJMOXRwyM43-tYBZ3U8JRz0I4C__EnO_666Bg>
    <xmx:h7KZYv1D4110S264ywzapIMF1yQ_RLCrKKd54sZMrid2j5J-NSDa9Q>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 03:04:38 -0400 (EDT)
References: <20220603064121.7395-1-pavel@zhukoff.net>
 <CA+chaQdbUFZ3KgZsgFJCa7ZRMku8wkj6+Ddnaj06nEFTMPyxPw@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bitbake.conf: Make TCLIBC and TCMODE lazy
 assigned
Date: Fri, 03 Jun 2022 08:52:06 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: 
 <CA+chaQdbUFZ3KgZsgFJCa7ZRMku8wkj6+Ddnaj06nEFTMPyxPw@mail.gmail.com>
Message-ID: <87wndyfcss.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 07:04:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166511


An example we have right now:

bitbake.conf: TCLIBC ?= "glibc"
linux-distro.conf: TCLIBC = "musl"

TCLIBC="glibc" bitbake -e distro-image-base => TCLIBC == "musl" which
confuses users a lot (and it was not working this way in dunfell).
Same applies to if TCLIBC="glibc" is in conf/local.conf then musl is used.

With linux-distro.conf : TCLIBC ?= "musl" image is build with "glibc"
which is not that we want.

With suggested changes:

bitbake.conf: TCLIBC ??= "glibc"
linux-distro.conf: TCLIBC ?= "musl"

TCLIBC="glibc" bitbake -e distro-image-base => TCLIBC == "glibc"
bitbake -e distro-image-base => TCLIBC == "musl"

If distro maintainers wants they can set to TCLIBC = "<implementation>"
and disable overriding explicitly. 

Do I miss something? 

"Martin Jansa" <Martin.Jansa@gmail.com> writes:

> You can always override it from local.conf with an override, right? That always worked for me and I don't see why this change is needed.
>
> On Fri, Jun 3, 2022 at 8:42 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
>
>  This allows two level of overriding (distro level and local.conf/shell
>  variable). Previous settings blocked shell variables overring
>  if it was overriden on distro level.
>
>  Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
>  ---
>   meta/conf/bitbake.conf | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>  index 0e939aca4f..2a3cf6f8aa 100644
>  --- a/meta/conf/bitbake.conf
>  +++ b/meta/conf/bitbake.conf
>  @@ -386,8 +386,8 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
>   # General work and output directories for the build system.
>   ##################################################################
>
>  -TCMODE ?= "default"
>  -TCLIBC ?= "glibc"
>  +TCMODE ??= "default"
>  +TCLIBC ??= "glibc"
>   TMPDIR ?= "${TOPDIR}/tmp"
>
>   CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar
>  ('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
>  -- 
>  2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166510): https://lists.openembedded.org/g/openembedded-core/message/166510
> Mute This Topic: https://lists.openembedded.org/mt/91516557/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-


