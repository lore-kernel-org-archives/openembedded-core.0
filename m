Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07005E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:06:41 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.web11.61616.1734368799491810670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm3 header.b=HVRixCsC;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=slYCoI7b;
 spf=pass (domain: cold-front.org, ip: 202.12.124.158, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C9AFD254017C;
	Mon, 16 Dec 2024 12:06:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 16 Dec 2024 12:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1734368798; x=1734455198; bh=o1fCK/1di1j/2oSeT1ZJSUeu3jkj5zil
	aMS1Xr4fVnw=; b=HVRixCsCYCDk7/GSNBgnhe/Rg/oAUW6oWxQU3b/iq3c0Mfas
	uuwfUvkL3tfOVYxSp3z/4MWEYc3YZiJJNDXHmMBRMYH9wFEO+t44xs5BFR+9fGOW
	d+GF06icYZRCAHOUjqSI462wtR82cPrbXBmju7Wlj6uQlgrQSPKCKtxC2GniKkJ3
	bGDG519tvUnRilxE40O0N39hYPv1ZVOM8ZuBAWDmrWoOvsQ/8/BzSoNYvllICRjI
	IxdztmKJPVZnjLsudhlAznjh1AnI5xmJhviYOQY2mLWayxleTaGHgbIgS83nWBF/
	0jRndLok6MeBZvA1hHERBQ5O+xpCi8YTCKuKHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734368798; x=
	1734455198; bh=o1fCK/1di1j/2oSeT1ZJSUeu3jkj5zilaMS1Xr4fVnw=; b=s
	lYCoI7b1k+YgDtM5e3Zl+X3mOfnv4J+swM0ecVUTPNhYsqfPZwu3iLHAy3sZhiwO
	cBrEgZihCm6I1jcpuKiMWx8GegqAU0V5On7Yif6Zhm6ssZ0vnbcHhvlygmOhsqV8
	Zlv4LXafxygW4cbn5wtxqR20COh8jJFmHHcZT7m6HnHxS4TzSL7lgwDU2FrJmCcS
	x03HhXqJ0ck5TLJYHYoqi7+3yI4l4yZL9a75Th9ebbMdXd58IUaCfFoFanhyqUvA
	FwRt/rWXQ5+3Yf/NphdwSdVgX7cwu/Rxk/P1QcqPmfwkrIYMkcsAVMnFBbgSTAKg
	y24FPScKHlebUVT6GVwSg==
X-ME-Sender: <xms:Hl5gZyGGaYPTssEoOsT6RiLD8ChJe52HvPIq3qDzqJYfSeYYYXu4jQ>
    <xme:Hl5gZzXe0U7qz0rdjrq9cOYSd_4x9bcpPuvY5ttfSv9uJD88mjGpZlgvybGF_-a9y
    7yoX2SR-IgkxdlDtw>
X-ME-Received: <xmr:Hl5gZ8KSO-Mg_Z2UzLgwxZtNOrMv26_NwZKZWrGQYaGLqu6hsG8K77eheROr44xxi8nVj8103DQjnjO_NLerbyHF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtuden
    ucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhestgholh
    guqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeetvdeljefhffffkeeihfeh
    ffetgeduheeluddvteelleeihffhtdfgueeuhfeijeenucffohhmrghinhepohhpvghnvg
    hmsggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgpdhnsg
    gprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrihgthhgr
    rhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtth
    hopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvggu
    uggvugdrohhrghdprhgtphhtthhopeguvghnhihssehkohhnshhulhhkohdrtghomh
X-ME-Proxy: <xmx:Hl5gZ8E08xFOooskpeTG4d_uTJOhNLVFAphshl5qZ8PpWdTYZ7PYrg>
    <xmx:Hl5gZ4WgImK3C9yGCaHSLaGYPBYJA9Rb7g8Dbzs_k6Mvtfr3RwuqJw>
    <xmx:Hl5gZ_NyeLa5AdiD6_ZvaherQ4WEZxRVh0B2O7kik9ZGS-Io7x1UGQ>
    <xmx:Hl5gZ_3UMA3sNkScQRGX0zA34lR2NzN6B5r2n11nSfFUaROr01s4KA>
    <xmx:Hl5gZ_Qjs8Rsv6kSyIH3KecgBjyPOxgcH3pktJizTpxftWSUrXnlHnrJ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Dec 2024 12:06:38 -0500 (EST)
Date: Mon, 16 Dec 2024 12:06:37 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: bitbake.conf: add lz4c to HOSTTOOLS_NONFATAL
Message-ID: <Z2BeHc33PUsrN7NA@ravine.members.linode.com>
References: <20241210151015.2450083-2-jsbronder@cold-front.org>
 <9c3143ebb7f9e17cfbd318ef0e17994aae7264be.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c3143ebb7f9e17cfbd318ef0e17994aae7264be.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208782

On 10/12/24 21:53 +0000, Richard Purdie wrote:
> On Tue, 2024-12-10 at 10:10 -0500, Justin Bronder via lists.openembedded.org wrote:
> > Commit fe167e082cbde1c6d186ecdda531abef610ac2ac switched to requiring
> > lz4 instead of lz4c which allows us to support distros dropping lz4c.
> > However, it's only in the 6.13 kernel that CONFIG_KERNEL_LZ4 makes the
> > switch from lz4c to lz4.� So we should continue to link lz4c if it's
> > available to support older kernels.
> > 
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> > �meta/conf/bitbake.conf | 3 +++
> > �1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 1d2c2e0022..c7927d19a0 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -553,6 +553,9 @@ HOSTTOOLS_NONFATAL += "gsutil"
> > �# Link to git-lfs if present
> > �HOSTTOOLS_NONFATAL += "git-lfs"
> > �
> > +# Link to lz4c if present, used by linux <6.13 with CONFIG_KERNEL_LZ4
> > +HOSTTOOLS_NONFATAL += "lz4c"
> > +
> > �CCACHE ??= ""
> > �
> > �TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
> > 
> 
> The YP TSC chatted a bit about this. Personally, I'm a bit nervous as
> this could make the builds a bit non-deterministic and allow the builds
> to fail well into the build. We try to do that "up front" if and where
> we can to make developers lives easier. This becomes more likely as
> distros drop lz4c and releases age, i.e. we'll hit problems years down
> the line.
> 
> I did have an idea for another potential solution which would be to put
> a lz4c wrapper in the scripts/native-intercept directory which tweaks
> the parameters and calls lz4.�Could I convince someone to see if that
> would work?

That works for the kernel build if I put the wrapper in scripts/.  But it
doesn't if the wrapper is in scripts/native-intercept as that's only added to
the PATH if native.bbclass is inherited.

Is adding a wrapper in script/ acceptable?  I see we already have one for git.

-- 
Justin Bronder

