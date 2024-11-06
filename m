Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFB1D59F43
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:52:37 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.web10.49116.1730908356453382882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 07:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=VJmzry0Y;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ivK6xT2N;
 spf=pass (domain: cold-front.org, ip: 103.168.172.156, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9C6F71140118;
	Wed,  6 Nov 2024 10:52:35 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 06 Nov 2024 10:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1730908355; x=1730994755; bh=A5kpcW8mNQMpzGBHYO+LGgB5fcnRcrj1
	BMIrTtwRTLo=; b=VJmzry0YD6UxXKx10OnWs3HXlJ4MfGIlbVIPB8I5z3vgqdms
	4ewF/EnaD2NlPGI7JoxS+VTicfnBYQ7CdGNRM7PBce/G145NBkuUIaYVu6KXzFOL
	/ndhaLjcXH9IHwYdjuQSYZva0gxE6APsFtwgDxhe4p35t7fW1V04mtie7h5vZe+U
	J71mqeTocUcAl+CVt97pQv/6rPtD+3njo8eeIbMKXhsw0Ccc+ZbJhKFg7NK275WT
	Gug6bVs0TktT5MmV6LbDWe8Z4RFF5MCGwiZ9nx9Pw/+HXa+d876AypJWQt57mYXM
	RGjYXDkVHlkbtUBVbd7qy3e5X1dlAAZZugAX4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730908355; x=
	1730994755; bh=A5kpcW8mNQMpzGBHYO+LGgB5fcnRcrj1BMIrTtwRTLo=; b=i
	vK6xT2Ne6N0O23g2DAvyM2f7HP17JlE096QDosYY1spAeaZcIFlo4hpivAulnmtZ
	RbQHbtR/MJBmOpZ7gXgezt/xITqmYkD2IrxjfFEsn1j9/uJujV28TuxDy1EDMlGI
	3UWZEqXYHr/gZ2hYjdwLTWXz+6ttZQK/Ij7lXdrt7DzXOKp48Yvhd13WGTh8CqpE
	hkL07sB9h5p7WBlK0anSnf5iHufnpPkBfbhV5pXykv7/sExpRBlCft7cCAzRVVIv
	2BdZyStxsI7gA68O+bZoqVz0zA1ISkajB9xMxtH2pfYIFz3Xekj75r2WZsXtobIZ
	O+Cme0J4p0F2Rf1WpWLQw==
X-ME-Sender: <xms:wpArZ43-jAuK9XG0mShTzyYNI3ppRX4k5wK4az7VXhYIFWAnx_vHPQ>
    <xme:wpArZzEsrc8N6swNjhSERRckBY0JzyFefiIvk4phjo1FX1RK1HtuGg4BbcrPzhrvQ
    vsyHC7_NMd2oRlKGQ>
X-ME-Received: <xmr:wpArZw4v_DSJRi7w3yWPPKNNHaLCDmwtST5BEy3RhQnnDWTmBknmNQXKy1KRvN8Hed3FN2FE22WLYvrOfH4ruc9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddvgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekrodttddtuden
    ucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeekleetffdtteelvdefveef
    udfhudfgfeevgfegkedvffdtteevgfegiedtuefgudenucffohhmrghinhepohhpvghnvg
    hmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtght
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgpdhnsggprhgtphhtthho
    peefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrug
    hivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehophgvnhgv
    mhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
    dprhgtphhtthhopegvjhhosehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:wpArZx0JcuvXwgh-igPMiXrI_MwlNXcWTmiCMw7vO13F_1KDtq6Zig>
    <xmx:wpArZ7GzvXy-qo40nVyP9DsqeAmLubGPaYgDI5fFLzmO5RcVTc1voQ>
    <xmx:wpArZ68kSTJMbaNcXTKEgUb6D_w2AUp3051CmCcDVQrdAI7SkBS0xA>
    <xmx:wpArZwlqCyY4bNh-GgaBsJKri_rpH5MZ_uV817z_q5yyzBoo_mXmCQ>
    <xmx:w5ArZzDRKc2HQNBazM8xIn6dv-Sl2c3weX5vsmrsF37Cc06BJ18BjvmZ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 10:52:34 -0500 (EST)
Date: Wed, 6 Nov 2024 10:52:34 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>
Subject: Re: bitbake.conf: require lz4 instead of lz4c
Message-ID: <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
 <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 15:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206790

On 06/11/24 07:50 +0000, Richard Purdie wrote:
> On Tue, 2024-11-05 at 10:37 -0500, Justin Bronder via lists.openembedded.org wrote:
> > With bitbake commit 'bb: compress: use lz4 instead of lz4c' we require
> > lz4, not lz4c [1].� Going as far back as Ubuntu 16.04/Fedora 25, they
> > are packaged together so it should be safe to simply adjust the
> > requirement from lz4c to lz4.
> > 
> > Note that the two are largely the same, but upstream has considered lz4c
> > deprecated since at least 2018 [2].
> > 
> > 1. https://git.openembedded.org/bitbake/commit/?id=907472034b344e4eb73cfd43059a413469f52e1c
> > 2. https://github.com/lz4/lz4/pull/553
> > 
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> > �meta/conf/bitbake.conf | 2 +-
> > �1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index eda505c861..14e761e2e7 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -517,7 +517,7 @@ HOSTTOOLS += " \
> > ���� [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> > ���� cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> > ���� fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> > -��� head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
> > +��� head hostname iconv id install ld ldd ln ls lz4 make md5sum mkdir mkfifo mknod \
> > ���� mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> > ���� python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> > ���� sha1sum sha224sum sha256sum sha384sum sha512sum \
> > 
> 
> This caused a failure in barebox:
> 
> https://valkyrie.yoctoproject.org/#/builders/23/builds/409/steps/14/logs/stdio
> 

I see, sorry about that.

What would be the recommended path forward?

- Add lz4c to HOSTTOOLS_NONFATAL so it's still symlinked.  This would fix barebox and any other recipes that still depend on lz4c on distributions where lz4c is still packaged but leave others without an early warning system.
- Submit patches to barebox and others to use lz4 instead of lz4c.  This is probably more correct but will leave Tumbleweed unsupported by default with other distros to presumably follow.
- Convince Tumbleweed (and others) to continue packaging lz4c.


-- 
Justin Bronder

