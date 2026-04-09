Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3554F364A5
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 17:04:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.137726.1775754264076752003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 10:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=PzrELghX;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LnBPq1LGjkmg5PuQGy03IJdmn24Ool/hZnyz0HBfCJ0=; b=PzrELghXdn2JiNIW/XYC7oQahb
	xe2+gJVDZibpKnQpGWZOxW9GaX+ZvO1rdJSWyrHIWo+wfC/Vr5qj4MzgO1lS2VEZmqnPsrfwCm3Va
	ZZGcyke0nKqv3gxMhS/WuW7lAW3h5DOJUdEZshql4KbFfdZnWkDUDJfzFHHnaCx7SQjfvnQDyXOBc
	0vfJgdg9Z9PR5dLunmH3D69oAXTZbqVKmgIOmwial/zeVufBvSh+53Cn+6BOXtdkbHdR9GnL5ogRO
	S8n0u9U1orwpq4VBWysVMoLfZdlh4jcsnYkUCh1cPUkZonqjCT6QQbdROLurR2CesSbNdeWv1wQzK
	nlsr5kFw==;
Received: from [147.129.179.166] (port=54416 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wAsnk-00000007HXH-1nKq;
	Thu, 09 Apr 2026 13:04:22 -0400
Date: Thu, 9 Apr 2026 13:05:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why would ASSUME_PROVIDED recipes be built anyway?
In-Reply-To: <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
Message-ID: <fe2e28c3-9ee8-ef26-ce6f-04d45419d6a1@crashcourse.ca>
References: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca> <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2128989187-1775754347=:3820960"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 17:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234937

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2128989187-1775754347=:3820960
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 8 Apr 2026, Richard Purdie wrote:

> On Wed, 2026-04-08 at 06:33 -0700, Robert P. J. Day via lists.openembedded.org wrote:
> >
> >   puzzled by something i just noticed ... the documentation for
> > "ASSUME_PROVIDED":"
> >
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-ASSUME_PROVIDED
> >
> > clearly suggests that these represent recipes that would not be built
> > as they are already on the host, the example given there is
> > "git-native".
> >
> >   however, in a walnascar-based build i just built, native recipes
> > that were listed in ASSUME_PROVIDED were built anyway, even though
> > they are clearly on my Debian 13 host, "git-native" among them. in
> > fact, a number of recipes i checked appear to all have been built from
> > scratch, despite being listed in ASSUME_PROVIDED.
> >
> >   as a test, if i then tried to "cleanall" such a recipe, i got the
> > perfectly reasonable:
> >
> >
> > $ bitbake -c cleanall git-native
> > ... snip ...
> > WARNING: Explicit target "git-native" is in ASSUME_PROVIDED, ignoring
> >
> >
> > is there some reason that something listed in ASSUME_PROVIDED will be
> > fetched and built anyway? is it a version thing?
>
> Some of the recipes have a PROVIDES for XXX-replacement-native and you
> can build/depend on that.

  if i may, let's see how badly i'm going to misunderstand this.
currently, in my build, if i dump the value of ASSUME_PROVIDED, i see
a pile of native recipes, including (as defined in bitbake.conf)
bzip2-native, diffstat-native, and patch-native, suggesting that if my
build needs any of these recipes built natively, then *by default* it
will try to use the ones already installed on the host.

  as an example, there's "quilt", which conveniently RDEPENDS on
exactly those three native builds:

  .../quilt.inc:RDEPENDS:${PN}:class-native =
    "diffstat-native patch-native bzip2-native"

so, simplistically, if i'm building quilt natively, none of those
native recipes should need building -- building quilt will use the
host versions.

  however, in the case of (for example) bzip2, we have that that
recipe defines:


  .../bzip2_1.0.8.bb:PROVIDES:append:class-native = " bzip2-replacement-native"

which means that some *other* recipe has the right (and here's where i
might be misunderstanding) to state that, even if bzip2 is listed in
ASSUME_PROVIDED and is available on the host, that other recipe can
insist that it not use the host version, but must (for whatever
reason) build the "replacement" version:

   .../cmake-native_4.3.1.bb:DEPENDS += "bzip2-replacement-native ..."

am i even *close* to understanding this correctly?

rday

p.s. so as i read it, all it takes is a single recipe being built that
chooses to depend on a "replacement" recipe for that replacement
recipe to be built and used.
--8323329-2128989187-1775754347=:3820960--

