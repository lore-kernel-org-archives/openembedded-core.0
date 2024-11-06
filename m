Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D10D59F5B
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 18:10:48 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.web10.53049.1730916645541815034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 10:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=rG+wXJ/F;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=NOqrL4J0;
 spf=pass (domain: cold-front.org, ip: 103.168.172.157, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AF53F1140114;
	Wed,  6 Nov 2024 13:10:44 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 06 Nov 2024 13:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1730916644; x=1731003044; bh=0jRzW91U1/c6aVEi8uzECXL8VNR46/MV
	icVUT2fG6n8=; b=rG+wXJ/FFfcuZuIlrdgS36P9pRLf855k0X3yULXgcPYLIrp2
	1NabqAq4GBHjegklSMMGN6dIEfFWjaScFwn2ZvllXNJSQzz7Y/4wL0yA18U7GcZA
	2c7/iqyvRwvwjyUpixxrsGcYz6InHpbfsn4wcooi+h1ZPs/c8PDyhNI0DaIqcngi
	A+zZfy1HpUptmV/vjK1SuOs/Q1zBhcIOpPqvKHmZC2hBZhw7GmB/YH53/32ILVZh
	tDQbjXyawFio0bu63DmsumXeEj9MpxplJIrXOo3YoeVCY5m4LrhXg6T9QkihmnES
	G+AtVn4THjRXn2khmU3HCkukywboSs1aPwJVRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730916644; x=
	1731003044; bh=0jRzW91U1/c6aVEi8uzECXL8VNR46/MVicVUT2fG6n8=; b=N
	OqrL4J0NEdAP9x13IECkNKZtpdnGOi9XPJ1dCZP6xtrV6IPE2MSxrtDlvrYC20Gq
	r3TNOtnSAsXTQ2WTIrMFpyMfe/UMsoOEhc0VJB9Y2IVwkX4QPmYn8nG0Zcu+9mQ6
	WCDW/IdNLOb5pgvyRnG7au3pfGpog9Q0QzAu3F8VqZFSYBRxHgtGG9k+76XJH3+e
	3E+wXpxy1BDpshxJgbvrq/fRtP1qOnznd2sCsntQ5d4V19uX6++ozhFT+OWOGcjs
	zGs6bAKNqR+kvpBY0XbSCLm2QPk9PaEzf41aYC5o+9R4mySzMc52rmVKJh1t9SjT
	lVWGVAONAiCgNSRAfFaoA==
X-ME-Sender: <xms:JLErZ-xfZxRL8TsjuVJ_gdQJ2wkhp4vbhFmR18JyFyUMu-d5wW4-0g>
    <xme:JLErZ6T7t-2YQVYavAUppWHSeLf5YhwAvMfq-4I4Q9PEhJaXPokpHM4Uh4cHoy9iD
    kkaU3MvZlygG999ZA>
X-ME-Received: <xmr:JLErZwXV-60p77g_DJK0mrCljna_eT36I9ay6_3_qSo_T2l1Ug3Th97lKiGwFBSRL4xYEkcnyM8l2hNI9npSQfzq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtddvgddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddu
    necuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegtoh
    hlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnhepudeuffejfedtudetkeei
    kedvffehuddviedugeehgeeiteevfeegvefgueduheehnecuffhomhgrihhnpehophgvnh
    gvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggt
    thdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrghdpnhgspghrtghpthht
    ohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhitghhrghrugdrphhurh
    guihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghn
    vghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorh
    hgpdhrtghpthhtohepvghjohesphgvnhhguhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:JLErZ0idG1FHUiR27lYAK6rnXkwmFpWTf6gvHrUSl8PbmyFKtINo1Q>
    <xmx:JLErZwBstAIVtStP-xlCch2v6TG1OymPltn5avgMUlE8ws3agzh9Og>
    <xmx:JLErZ1KYwFDLWhNBokdz0FoWfHigpRZrZHj46tMZJB_WM8G2ZByRbg>
    <xmx:JLErZ3AYEGXNfd4hxaOJ6KE_odIY9pDi02Uz4kAABiPqsUQ5vDkDYA>
    <xmx:JLErZzP28N5sg6wb9fLf8qzxt9IyV6ujiKLaw_PIYejSHC6cxpvUS-P1>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Nov 2024 13:10:44 -0500 (EST)
Date: Wed, 6 Nov 2024 13:10:43 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>
Subject: Re: bitbake.conf: require lz4 instead of lz4c
Message-ID: <ZyuxI86R-2DYmZrM@ravine.members.linode.com>
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
 <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
 <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
 <23f158f4bf232dda3d501a8bb724e2235092a4f0.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23f158f4bf232dda3d501a8bb724e2235092a4f0.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206795

On 06/11/24 16:01 +0000, Richard Purdie wrote:
> On Wed, 2024-11-06 at 10:52 -0500, Justin Bronder wrote:
> > On 06/11/24 07:50 +0000, Richard Purdie wrote:
> > > On Tue, 2024-11-05 at 10:37 -0500, Justin Bronder via
> > > lists.openembedded.org wrote:
> > > > With bitbake commit 'bb: compress: use lz4 instead of lz4c' we
> > > > require
> > > > lz4, not lz4c [1].� Going as far back as Ubuntu 16.04/Fedora 25,
> > > > they
> > > > are packaged together so it should be safe to simply adjust the
> > > > requirement from lz4c to lz4.
> > > > 
> > > > Note that the two are largely the same, but upstream has
> > > > considered lz4c
> > > > deprecated since at least 2018 [2].
> > > > 
> > > > 1.
> > > > https://git.openembedded.org/bitbake/commit/?id=907472034b344e4eb73cfd43059a413469f52e1c
> > > > 2. https://github.com/lz4/lz4/pull/553
> > > > 
> > > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > > ---
> > > > �meta/conf/bitbake.conf | 2 +-
> > > > �1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > index eda505c861..14e761e2e7 100644
> > > > --- a/meta/conf/bitbake.conf
> > > > +++ b/meta/conf/bitbake.conf
> > > > @@ -517,7 +517,7 @@ HOSTTOOLS += " \
> > > > ���� [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod
> > > > chown chrpath cmp comm cp cpio \
> > > > ���� cpp cut date dd diff diffstat dirname du echo egrep env
> > > > expand expr false \
> > > > ���� fgrep file find flock g++ gawk gcc getconf getopt git grep
> > > > gunzip gzip \
> > > > -��� head hostname iconv id install ld ldd ln ls lz4c make md5sum
> > > > mkdir mkfifo mknod \
> > > > +��� head hostname iconv id install ld ldd ln ls lz4 make md5sum
> > > > mkdir mkfifo mknod \
> > > > ���� mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> > > > ���� python3 pzstd ranlib readelf readlink realpath rm rmdir
> > > > rpcgen sed seq sh \
> > > > ���� sha1sum sha224sum sha256sum sha384sum sha512sum \
> > > > 
> > > 
> > > This caused a failure in barebox:
> > > 
> > > https://valkyrie.yoctoproject.org/#/builders/23/builds/409/steps/14/logs/stdio
> > > 
> > 
> > I see, sorry about that.
> > 
> > What would be the recommended path forward?
> > 
> > - Add lz4c to HOSTTOOLS_NONFATAL so it's still symlinked.� This would
> > fix barebox and any other recipes that still depend on lz4c on
> > distributions where lz4c is still packaged but leave others without
> > an early warning system.
> > - Submit patches to barebox and others to use lz4 instead of lz4c.�
> > This is probably more correct but will leave Tumbleweed unsupported
> > by default with other distros to presumably follow.
> 
> barebox only recently merged so I think it should be fine to see if we
> can switch barebox to use lz4. How would that leave Tumbleweed
> supported?

Ok, I've submitted a quite simple patch to barebox upstream and I'll resubmit
this along with that patch.  Pending other recipes requiring lz4c, that will
fix things for Tumbleweed.


-- 
Justin Bronder

