Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF02CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 11:05:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.36334.1725275109346276524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 04:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=es2UTD7O;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vnbbzItAHtA23hMK9O5Y/NY4mWoA5eTQkJKtnGXaxAo=; b=es2UTD7OE9E2FhaqynAWpLi3mj
	YpE1LK/5tzQpJP1HCwHWmwZauVDjuFQg3J8Lu44OxIO/033AsIyZJgtFrepn+Zbcilk6uWLQInbCB
	KawBD3rLUCcw7IW5dSnmNOnSVYWFlPRpndXwTP+teO+VneAfp/apyAWBuenA/GxBytyr7y04Wa+ej
	7mOqenspdAeSTvpQGTUvJHrPxzvGL8luM4sDjc486K2kmo7Ee853Jcy5iPxzvaE1i0yIY7OD0BXqs
	8X2a7xh5ELFipP58XywjKX/pJf9Vz9a1p/XHN9rIsEaX2habw3PhpkIkGcxyH0lcgWS1bmC+7Md9+
	j8uLV8bg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:43408 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1sl4rl-00000009jsO-0CgE;
	Mon, 02 Sep 2024 07:05:05 -0400
Date: Mon, 2 Sep 2024 07:04:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does EXTRA_IMAGE_FEATURES += "ptest-pkgs" not
 install *all* ptest pkgs?
In-Reply-To: <dbba02a3a7967229e2133e69cd636349ac5374a4.camel@linuxfoundation.org>
Message-ID: <6e65acdb-454-65ec-8dda-ad9f746468d@crashcourse.ca>
References: <5557141e-86f6-1a86-2069-9f566e766385@crashcourse.ca> <dbba02a3a7967229e2133e69cd636349ac5374a4.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1805633146-1725275102=:1092497"
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 11:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204093

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1805633146-1725275102=:1092497
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Sep 2024, Richard Purdie wrote:

> On Mon, 2024-09-02 at 06:39 -0400, Robert P. J. Day via lists.openembedded.org wrote:
> >
> >   i'm sure i've overlooked something silly, but in building a
> > qemuarm64 image to demo ptest to some colleagues, poky by default sets
> > the "ptest" DISTRO_FEATURES setting so all of the corresponding ptest
> > packages are *built*, but when adding:
> >
> >   EXTRA_IMAGE_FEATURES += "ptest-pkgs"
> >
> > only *some* of the ptest packages are added to the image. eg: while
> > bzip2-ptest is built, it is not added to the image, as are a number of
> > other ptest packages. if i *explicitly* add that package, then it gets
> > included.
> >
> >   is there some obvious reason that a number of ptest packages are not
> > included in the resulting image, despite them being built?
>
> In your example, was bzip2 actually in your image or was it only built?
>
> I suspect it only installs ptests for things actually in the image.

  yup, i read in the ptest wiki page that the ptests are installed
only when the associated regular package is also installed, and i did
verify that bzip2 was installed.

  oh, wait ... damn it ... just noticed that my build incorporates
busybox, which probably gets in the way of installing *numerous*
ptest packages that would normally be installed. does that sound like
the culprit?

rday
--8323328-1805633146-1725275102=:1092497--

