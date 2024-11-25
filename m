Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15623D58D79
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:21:26 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.web10.25558.1732558880713281435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 10:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm2 header.b=J1/mh7ER;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=pXBw74GL;
 spf=pass (domain: cold-front.org, ip: 202.12.124.144, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id E2CA011400C1;
	Mon, 25 Nov 2024 13:21:19 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 25 Nov 2024 13:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1732558879; x=1732645279; bh=hub2cuxgNIudzDscdKWrQNVrb+qCfvOD
	KNBR54ogBS4=; b=J1/mh7ERrv2kHt3R/F5QQNGqmdsbZsfAAALb/fmRYirVQOBG
	YfkJv91CMYWYkUu11EmF/XIRBo2trBnEW/18O3vbT/TJKi4gJfZZcEO0gAN7EAuP
	S8yMoKXDDKlj1PWoRgnW2GxXYZepO3etMgVOjl94uvSU60w8x8M3pDsF00XsIP4f
	a/i+t9dnxttzgJzINuZ1QxNEmVzhTd7x6NYUZhBCZCNqMwuXxE4KM06MmD5mXGL2
	R50y/uK+JfswSr8PBYDyqHTWkL9zf5Swdv4wmyiBVZ2y+YMCNoG5ksZBmJN6HoqT
	y2qzwLUa97HqiF8yxZeGHTx+C3TupuxPb2Qx4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732558879; x=
	1732645279; bh=hub2cuxgNIudzDscdKWrQNVrb+qCfvODKNBR54ogBS4=; b=p
	XBw74GLWIocaaNnZktwsF2iji7uXROJZfOK+HPzEmeYGOeKjxovQj7Rsu/9EpH5u
	nPBFmXMMg7ddZKJhaEixLsHsXhjQ5zzGkl0oAsQQeAYR7GsWCXXeRGFwGZIXVp0e
	lyBhfJYIbe9bj3MV+3uZFVXYEJi9d5PJjBbOCViZX5jr3CrE3/IveB3Et/wR+v2v
	weIyBUE7ZHkxj9ZDerBSYCWlOW20GbOm7uHyEPf0ze9DR7Z0K1pguw0YgPCmt7r2
	5IblgLJy05bvHnVFPhhdE71yUzrX9vmRwN9e/OMXWCY5C5nr/KhvJCC1DRV2jtiJ
	Jv1h824xshFFaPVOIXVhw==
X-ME-Sender: <xms:H8BEZzQalmb5mPJIuqoicptVlhtfY0kvDDZDMt8PMhHCDHcIBtk7uQ>
    <xme:H8BEZ0z8WRHVGRSBBPaffdzsyrZ0-zdeLFNQGonoMK8IGehnUPHM7h299DdnOZkfE
    7LcFR3EgXTPq9JUfA>
X-ME-Received: <xmr:H8BEZ40MbbHwv2QdmWpsmMcca8yK78hB4pXc379azZT88xgjp_ce58s66THvu14b5mIi_DO9OpVw5_VUk6lYAk6X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeehgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtugfgjgesthekredttddtudenucfhrhhomheplfhushhtihhnuceurhhonhgu
    vghruceojhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekieefveduvdehfedtheetuefhfedtuedulefhueehudelgedvtdeghefg
    ueeffeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrghdpnhgspghrtghpthhtoh
    epvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghhuughnihdrmhdrghesghhm
    rghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:H8BEZzBylKFTZ40hsly2rcciwBo2Tsu2LomVMAnbUc68VpN4qyShEw>
    <xmx:H8BEZ8iCT0tyV5OUvuWh72E_e8QMwLNwa9SG1xnRY_geBvshB_AhRw>
    <xmx:H8BEZ3r7oAEzcRR76uPabE5M9bhRBLALDHlNB7T-eMFTl2HiP8bM8A>
    <xmx:H8BEZ3hAkGa70yS2jPnN-6LmtggvCzfh3lD9rrmzJ1zC0kSb2ioYtQ>
    <xmx:H8BEZ_sgLfMFn8xApUOeJpDe9HghcltqeQwgPx5HPOKbSQxWt9YFLUFD>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Nov 2024 13:21:19 -0500 (EST)
Date: Mon, 25 Nov 2024 13:21:18 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: bitbake.conf: require lz4 instead of lz4c
Message-ID: <Z0TAHptOcCYEzSXB@ravine.members.linode.com>
References: <2ff2f153f3d383ffa0fb240b6af32f7a3a3c8994.camel@pengutronix.de>
 <5971.1732375730064880818@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5971.1732375730064880818@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 18:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207793

On 23/11/24 07:28 -0800, Gu�ni M�r Gilbert via lists.openembedded.org wrote:
> Hi I'm seeing a build error on latest master when building Linux 6.10 due to missing lz4c tool.
> 
> I see it's still used even in Linux 6.12: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Makefile?h=v6.12.1#n511
> 
> On my build host, lz4c is symlinked to lz4. But I suspect the issue is lz4c was removed from HOSTTOOLS.
> 
> Anyone else seeing this problem?

Yes, I can reproduce it when setting CONFIG_KERNEL_LZ4.  I've sent a patch upstream.  If they are receptive I'll submit it for linux-yocto.  But perhaps in the meantime we should add lz4c to HOSTTOOLS_NONFATAL?

https://lore.kernel.org/linux-kbuild/20241125171800.1131761-1-jsbronder@cold-front.org/T/#u

-- 
Justin Bronder

