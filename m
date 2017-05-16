Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D04D6006E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 07:29:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4G7TODI004589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 16 May 2017 08:29:26 +0100
Message-ID: <1494919764.27342.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 08:29:24 +0100
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 16 May 2017 08:29:26 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 07:29:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-05-15 at 15:26 +0200, Patrick Ohly wrote:
> At OEDAM [1] I took the AR to flesh out some of my ideas for
> introducing global and per-image settings for switching between
> development and production builds. The goal is partly to establish
> common configure options that then can be used by different layers,
> partly to have some actual useful functionality attached to them
> already in OE-core.
> 
> "development" builds are what a developer does when trying out a
> distro or working on his own personal device. "production" is what
> device manufacturer put onto the actual end-user hardware.
> 
> At OEDAM we already concluded that per-image settings are more
> useful. However, sometimes a component also has compile-time choices
> that cannot be changed later on in an image, and indeed I found one
> example for that (kmod) in OE-core.
> 
> Therefore I have included "debug-build" DISTRO_FEATURES support. It's
> a
> bit similar to manpages.bbclass, but in contrast to that (currently)
> is meant to be inherited globally - that's partly due to
> misunderstanding how manpages.bbclass was meant to be used. This can
> be changed, for now I just want to demonstrate that such a distro
> feature is not entirely useless, and what effect it could have
> already
> in OE-core.
> 
> In refkit, we also switch globally between development and production
> builds via .inc files. However, I am in the process of replacing that
> with the more flexible per-image IMAGE_MODE check. So from my
> perspective, the IMAGE_MODE is more important and useful than the
> "debug-build" DISTRO_FEATURE.
> 
> From a design perspective, the approach taken here is to let a
> developer or image define what mode it wants, and default features
> can
> be configured accordingly. That alternative would be to continue
> defining
> features as before and use the mode to configure QA warnings or
> errors.
> 
> But I find that less flexible, and I suspect it would be harder to
> keep track of what is meant to be usable in which mode. Developers
> also would have a harder time overriding the defaults.
> 
> [1] https://www.openembedded.org/wiki/OEDAM_2017

I'm not really sure I like this change, it seems fairly invasive and
complex for gains which don't seem to add up to me.

For example after your patchset, we end up with two different places
motd may be generated based on various flags. I think it would be
confusing for the user to find out where a message as coming from.

One of the reasons I have grown to hate "debug-tweaks" is that when you
enable it, you have no idea what you're really changing as the name
doesn't tell you what it does. I worry "debug-build" will become the
same problem, it doesn't do one thing well but many things badly. If it
really just changes debug and logging PACKAGECONFIG (if present), why
doesn't the distro just do that?

I also worry about the number of classes this introduces. Whilst
classes are cheap and easy, I have heard concerns we have too many of
them. In this case image-mode gets hardcoded into image.bbclass.

Also, have you seen bb.utils.filter()? It might be useful instead of
some of your .intersection() code?

I do think you're right that we need to make some changes in this area
but overall this patchset seems too complex to me somehow and I think
we probably can achieve something similar in a simpler way...

Cheers,

Richard







