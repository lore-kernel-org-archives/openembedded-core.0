Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5F6C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 19:13:13 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.web10.2459.1739473993361765250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 11:13:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm2 header.b=FkVH52tQ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=XY9HmAHS;
 spf=pass (domain: cold-front.org, ip: 202.12.124.159, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 80D95254011C;
	Thu, 13 Feb 2025 14:13:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 13 Feb 2025 14:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1739473992; x=
	1739560392; bh=3NWk+f9Uxd1pjZVJFq5WWILeRutvAoCb6V7zRyrBUBM=; b=F
	kVH52tQ4qdeXGNVSHJfEMwcf+yDIRRd5NyZrn0RVvBQHA6Uj0xDLwDuhypyhK6qL
	feEOz4TTMcESthsi2WqgVf0dWTU1aVML2P1mtIyMDD8C3m/rnHY9oawYB/zhozIw
	vteELz1LEL9CmslJQyQfJNh8YPQdW9rltDEpLto3yn+j/lPKVM+gaWCNcOou4afD
	ym93YNqBsuJlbWp3q98rFI7N5gzB1gBOinFK8+gfmfSKF3zZMg4WsESGCcUjCMB/
	44gNCLtXx7Zz5vBMWFp3+HZt6fM8wRRD+nJDEzuhCyoyzv+XuJS9Zk9+PoB3aEV3
	9OZNL70onZX02auZWqUUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739473992; x=1739560392; bh=3NWk+f9Uxd1pjZVJFq5WWILeRutvAoCb6V7
	zRyrBUBM=; b=XY9HmAHSZzh0R6zVO0UNXcznKu2yoZkBbRBkzrVOdiqllrmhfWf
	IwP3yrxUf1J/iftD0CLnjTfgLoB6uKNuJaXxOWMzdL9r+B8LrtTg4jj4WjY7vw+J
	C1QOwMbSxPnxkdzHGmiBGoiCtcAs6ay7qoNF2+RodEeC8Q7l/aB4moB1+WlY7qD8
	dJXwTfRbSefztXp0rWHKvzbHcgRaZRr1B/eUt4FA8xYIGc9Ksp6p3QctI6JrHk3n
	QX/jOgWSBmXBD8ok6dtuyrLi5Oyk48smUK6GlAsuzcP20g5CKj34ECukmDr951Kg
	njORNA0aCAeew8kcRx+FgiPo17Gz46i5Aug==
X-ME-Sender: <xms:R0SuZ6xOF68AdCr9OFvpP2saSX_uzjhPfF55wkRsV-1gDmk3JuKzew>
    <xme:R0SuZ2QjIXRmcNeECDqmKYe9W3rubJcZGOlFJJ1gq4nVFZpTZo_RPx8etr4JwUxnr
    rQPn6tRM0uY6ik_xA>
X-ME-Received: <xmr:R0SuZ8VBeIcw32RnR2jwSL--v49Xf397RfPFqLtEa6kaD-oLjf0t1CoWB7JmgFubSMdx3MC06KA2_VBlyunxT1tz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegtoh
    hlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepgeduieevgfevvdegieeg
    keegueevheejfffhudeugedtudffffejjeevjedtteelnecuffhomhgrihhnpehophgvnh
    gvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqd
    hfrhhonhhtrdhorhhgpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtih
    honhdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtgho
    mhdprhgtphhtthhopeihohgtthhosehlihhsthhsrdihohgtthhophhrohhjvggtthdroh
    hrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdho
    phgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeihohgtthhoqdhsthgrthhush
    eslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:SESuZwhrynVSCWuGuiXhIEGP0DaCYScj30UBvFwm7EbPtOSIaww0dA>
    <xmx:SESuZ8CG_NrH8-cm5LIn63oO7Erz5oWtOodqjVixGGFhQumrrqKVlQ>
    <xmx:SESuZxJ8fFhTB_xB2YSbdGD9svuHg-O0nzHMrCAqomjX1DzkG2eoIw>
    <xmx:SESuZzCRrvMVtZ-VRCID7xhNfr4f2CLxfp2rtRhz9XyqzzvADLAHCg>
    <xmx:SESuZ75tDCbH3A7i8jVwT8OhJDyvOCrFhvSJA9DEdmgb3yWrkrNcRrKb>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 14:13:11 -0500 (EST)
Date: Thu, 13 Feb 2025 14:13:11 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: richard.purdie@linuxfoundation.org
Cc: alex.kanavin@gmail.com,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	yocto-status@lists.yoctoproject.org
Subject: Re: Yocto Project Status 11 Feb. 2025 (WW07)
Message-ID: <Z65ER5YO6Ci2MAK0@ravine.members.linode.com>
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 19:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211364

On 11/02/25 23:36 +0000, Richard Purdie via lists.openembedded.org wrote:
> You used to be able to disable pull requests for six month periods, it
> looks like you can no longer do that and it was a pain having to try
> and remember anyway.

Isn't this just 'Settings -> Moderation Options -> Interaction Limits'?  It looks like you can restrict it to repository collaborators (which is a list under the repo owner's control) to 6 months.

It's also exposed on the REST API, https://docs.github.com/en/rest/interactions/repos?apiVersion=2022-11-28#set-interaction-restrictions-for-a-repository, which if you're willing to pull down the official github cli tool, gh, could go into a cron job fairly easily:

gh api -X PUT \
    /repos/openembedded/openembedded-core/interaction-limits \
    -f 'limit=collaborators_only' \
    -f 'expiry=six_months'

I obviously couldn't test in the OpenEmbedded Org, but this worked both on my personal repos and in a private (paid) organization.

-- 
Justin Bronder

