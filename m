Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630E2C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 19:18:22 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.1499.1638386301071619896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 11:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=vOI+hdMO;
 spf=pass (domain: cold-front.org, ip: 66.111.4.29,
 mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 5B89B5C00D3;
	Wed,  1 Dec 2021 14:18:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 01 Dec 2021 14:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=Zo5IDXbNKM9mF+0AjHyXJ/bB
	9gbz8Yisx/UCvBowrsU=; b=vOI+hdMOeWkhEhmcGxqiFI61zXwhTpb6dqu6pc9y
	/B1MnLdNaLDeeMKx1YOoaC1eGCO5ZdeIEQlkFhfowdu8JBSZnBR00co4MtkLNXnh
	82QYOAy5/BwiIyEs77K2TFkAY+O649lUdDUqgicunUJDRvbmzdNrHMILJCYyEENf
	670=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Zo5IDX
	bNKM9mF+0AjHyXJ/bB9gbz8Yisx/UCvBowrsU=; b=GOcwKo4II5vur7Q79AGmsO
	DjjYQfDvusffA7L9sHeX1cMnR599A8Mo3TLX7FXUi9nfQT0mKJ/2I1dzgl6rNQfV
	AvQPIGDe9uoAoSWKQ9vCgm9QAsR59yN5SqUXTt+/9Dfcm5n+lZi1tnUh6Xg5Gu5F
	bfA+XJqLxFP7BoTvMENjTuy05Y6LYAfIP7PF3dkin/E/jWUAlgWcM9fS4+KN2tKy
	NroQB5cMZf72BPvacuG7IOrUb6GoY+OoyRPOhid9SzbEMiejML9pmv7Bx4+MDTyq
	9Ke6XX1ujbAm2rYotyAueOsZjIf8eKEviSB9+cUq4QMlkqAsjarkcf8DWjV/IWPA
	==
X-ME-Sender: <xms:e8qnYUt8_s7FVGgUSfe5CLOG9Ma1lwwluO5CyE-w7-Comz4rcjnTCg>
    <xme:e8qnYRdqIK06ammuY-rwlFde98hIfOru-DEwCvzHOA8w6mYBBO8MctRMX4lvtPBiT
    Focmk-Mq4qpe72ZIg>
X-ME-Received: 
 <xmr:e8qnYfwtsowKChxI-A1riHuc_cfwVPVcoVnlu4XfQs2ODcpJVHDizzmHsnoK04_YIfBSG3DUWa-vfl7728rjbJDD>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrieefgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeetfeehudefte
    egtdejhfdtgeeuteegvedutdeufeefteegiefgffevfeeihfeutdenucffohhmrghinhep
    ohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhho
    nhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:e8qnYXNoYS6AKuLxyFZC40Q_LNWzE00einbaPjczd2tWtMkDeSZJHQ>
    <xmx:e8qnYU-PmIOPWATGrtLdV-gnvISsM2w1AQO8occGfffMzIUKPvAO-w>
    <xmx:e8qnYfWacDimLtzmWsDlwgPzMUHdavBn1IvAbdN8HxyfD3PP_DKX6w>
    <xmx:fMqnYZGOQB9239yrfvhHjxKqgfCFqR1Acq-huDKO2C595h-_wm75Xg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Dec 2021 14:18:19 -0500 (EST)
Date: Wed, 1 Dec 2021 14:18:19 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Correct way to set DRIDRIVERS and GALLIUMDRIVERS from mesa
 bbappend
Message-ID: <YafKe4SgTjgGY3IR@ravine.members.linode.com>
References: <YaemRcD22hUhkQrq@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaemRcD22hUhkQrq@mcrowe.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 19:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159057

On 01/12/21 16:43 +0000, Mike Crowe via lists.openembedded.org wrote:
> I'm building for a specific chip and therefore don't wish to waste time and
> electricity building and disk space on the target installing unwanted mesa
> drivers. However, mesa.inc contains:
> 
>  GALLIUMDRIVERS = "swrast"
>  GALLIUMDRIVERS:x86-x32 = ""
>  GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
>  GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
> 
> and mesa_21.3.0.bb contains:
> 
>  DRIDRIVERS ??= ""
>  DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
>  DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
> 
> I'm unable to find a way to override these values. Using (for example):

You can use an anonymous python function which runs after parsing.
https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#anonymous-python-functions

    python __anonymous () {
        d.setVar("DRIDRIVERS", "i965")
    }

-- 
Justin Bronder

