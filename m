Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F803E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 15:15:20 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.web10.12653.1733843716905454261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 07:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm3 header.b=blUsruWc;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=WnCputwO;
 spf=pass (domain: cold-front.org, ip: 103.168.172.151, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 34CCE13841A1;
	Tue, 10 Dec 2024 10:15:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 10 Dec 2024 10:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1733843716; x=1733930116; bh=CTzTZwEZ5RFohTv0bQCUKD2IIzhbIRb1
	8voHWx7XDRg=; b=blUsruWc+pXNEboHjbWzev0vD9hhy3NRTK+ZtxxbDMBIeOJe
	doVLwecTtWuQnzkgaPU4lbdVLmXKXy+5FE8AnIaEAKfUDCAu4/5SZvMTeJj8xKi5
	jDFzHMNKZGyIq8KYxm5R4y/aetnx4JPfraT6b5NsQoiyK37h3phTJDeSI3MMZ7oq
	Ryg+1c7qrrG4vc5o8GHzLy/5+Vr9IFFAX9qi6G8ALzQDz4C4/Az9CjQAKCSUMXmS
	4XXF/GtN2L5VqomGfTjDeM9d1i1Snn93az7Ko1UW43rnizCes2UShnht4V4KDqTb
	Mvovgv6jVts1E7GRNHG29O5wempuDj6byQ9Kzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733843716; x=
	1733930116; bh=CTzTZwEZ5RFohTv0bQCUKD2IIzhbIRb18voHWx7XDRg=; b=W
	nCputwO9ZsHrsFf+NWRPjes1YACKTS2T1IH1AywyQbVi0c0+JVSjfN4CvEsdbTV2
	rnAhvP8IiDOB+O4Og67aNwbzoqTSvxR6KWyvt/K4co1quT+zjJKEv4/VbOMAsoa9
	7vjGBr3yyP2rgPjcunJ5zzmfPu6DkR7CoLuVScHRja/KFVyL+7RAd1JheMUboZ4z
	7IqMoZgv+rumu1F1kwyz0p08hyu59dIaIwU9Tb7GM0jFNE6fezf/x9iLMzwKSodQ
	ILiNaLDlGHzkzD3TFPYZt4B+3IYd1VXRShJz0pjm6vdrs6btu9eguZzPUVM1Z4Rf
	OiVl2O3lt2Ecs0VOOsqfA==
X-ME-Sender: <xms:A1tYZx1uxKBio2EWR9ataXfamLqgN81suNhI4a0MrV-iv2cWneyp-A>
    <xme:A1tYZ4EMQ9-U4s3rhXMaaeaRFyB8g2524m4K63rROFJQCR8bfDUwDBjgwry5ZigYK
    8lseEYAREbl7lnNsg>
X-ME-Received: <xmr:A1tYZx6RFKnjjmFVPiFaWHa586DzJX4Y7aYgfgrzSGo-qD7hf1iDOv_8orzBAIHnsWkqtHLznoiwjKsM_hpj6rXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeekgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuf
    fkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefluhhsthhinhcuuehrohhnuggv
    rhcuoehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrth
    htvghrnhepkeeifeevuddvheeftdehteeuhfeftdeuudelhfeuheduleegvddtgeehgfeu
    feefnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    jhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgpdhnsggprhgtphhtthhope
    efpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghnihhsseguvghnihigrdho
    rhhgpdhrtghpthhtohepghhuughnihdrmhdrghesghhmrghilhdrtghomhdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvggu
    uggvugdrohhrgh
X-ME-Proxy: <xmx:A1tYZ-0proi5RBbCY-KvDncqlENxbr75g-r8oaY2F0QS_u2SI7W22g>
    <xmx:A1tYZ0GMkhSsGMW6S5Tv2eBJr5A51CBtXA7dXj62puPyV_Jhsu23IA>
    <xmx:A1tYZ_-5OpexCAvjw6QsOeTr0GA_2PO2ROTITgmh5KMqhc59EacBnA>
    <xmx:A1tYZxndzTIAewAM-FmLQziLVXGsrR8Gt75qPIiRZORk94sXXWJNsg>
    <xmx:BFtYZ4DAmiCthstYis3ed0PGK74I0BmyYmrWvXRgWQWx6EP7E_rHcAY3>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Dec 2024 10:15:15 -0500 (EST)
Date: Tue, 10 Dec 2024 10:15:15 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: bitbake.conf: require lz4 instead of lz4c
Message-ID: <Z1hbAyxCZe2q0Stv@ravine.members.linode.com>
References: <2ff2f153f3d383ffa0fb240b6af32f7a3a3c8994.camel@pengutronix.de>
 <5971.1732375730064880818@lists.openembedded.org>
 <Z0TAHptOcCYEzSXB@ravine.members.linode.com>
 <20241210035121.GF23825@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210035121.GF23825@denix.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 15:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208538

On 09/12/24 22:51 -0500, Denys Dmytriyenko wrote:
> On Mon, Nov 25, 2024 at 01:21:18PM -0500, Justin Bronder wrote:
> > On 23/11/24 07:28 -0800, Gu�ni M�r Gilbert via lists.openembedded.org wrote:
> > > Hi I'm seeing a build error on latest master when building Linux 6.10 due to missing lz4c tool.
> > > 
> > > I see it's still used even in Linux 6.12: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Makefile?h=v6.12.1#n511
> > > 
> > > On my build host, lz4c is symlinked to lz4. But I suspect the issue is lz4c was removed from HOSTTOOLS.
> > > 
> > > Anyone else seeing this problem?
> > 
> > Yes, I can reproduce it when setting CONFIG_KERNEL_LZ4.  I've sent a patch 
> > upstream.  If they are receptive I'll submit it for linux-yocto.
> 
> Ok, this got merged to 6.13-rc kernel series, but it's now broken for all the 
> downstream BSPs and older kernel versions that use LZ4, besides linux-yocto. 
> Sigh...
> 
> 
> > But perhaps in the meantime we should add lz4c to HOSTTOOLS_NONFATAL?
> 
> Was there a patch submitted to have both lz4 and lz4c listed in HOSTTOOLS* 
> (at least temporatily until this gets propagated everywhere)?

I sent one just now.  Apologies for the annoyances this has caused.  No good
deed goes unpunished ;)

https://lore.kernel.org/openembedded-core/20241210151015.2450083-2-jsbronder@cold-front.org/T/#u

-- 
Justin Bronder

