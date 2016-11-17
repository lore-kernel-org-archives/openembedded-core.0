Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73CAD71A8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 23:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAHN6a8L032758; Thu, 17 Nov 2016 23:06:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bf1eZMWal1SZ; Thu, 17 Nov 2016 23:06:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAHN6We1032755
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Nov 2016 23:06:33 GMT
Message-ID: <1479423992.28508.99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2016 23:06:32 +0000
In-Reply-To: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
References: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: Modifying SRC_URI from anonymous python
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Nov 2016 23:06:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-11-17 at 13:28 -0800, Andre McCurdy wrote:
> I have a supplier who provides recipes which set SRC_URI to their
> private git servers. To make those same recipes usable by others (ie
> me), some anonymous python is used to transform the default SRC_URI
> (elements which contain private git URLs are replaced, patches and
> other files are left as-is).
> 
> This apparently worked in OE 2.0 but from 2.1 onwards the anonymous
> python which modifies SRC_URI races with the anonymous python in
> base.bbclass which parses SRC_URI to determine additional
> do_fetch/do_unpack dependencies and whether or not to call
> fetch2.get_srcrev().

I suspect we made some changes around that time to ensure determinism
in the order certain things happened.

>  Specifically I get failures because
> fetch2.get_srcrev() sees the original SRC_URI and tries to resolve
> AUTOREV from a repo to which I don't have access.
> 
> The proposed solution from the supplier is this patch to
> base.bbclass:
> 
> @@ -598,7 +598,7 @@ python () {
>              d.appendVarFlag('do_unpack', 'depends', '
> file-native:do_populate_sysroot')
> 
>      if needsrcrev:
> -        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
> +        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}",
> parsing=True)
> 
>      set_packagetriplet(d)


parsing=True is a bitbake internal thing, its not documented and
shouldn't be used outside the bitbake codebase. In hindsight, naming
could have been better.

> After reading the setVar source I'm not very clear how or why this
> works, but it looks dubious. What is parsing=True intended to do?

Its internal bitbake data store stuff, don't use or rely on it. It
might happen to work here but its just luck.

> Is it documented somewhere that modifying SRC_URI from anonymous
> python isn't allowed? I've now seen two suppliers both independently
> run into the same problem when updating to OE 2.1.

We have an open bug related to anonymous python ordering. Its hard to
fix easily as something can indicate it wants to run last, but then
everything wants to run last. As Chris mentions, you can use an earlier
event handler as one way to work around it.

I'd also note that anonymous python runs in parsed order. Since
base.bbclass is "up front", its hard to run things before it though :/.

Cheers,

Richard



