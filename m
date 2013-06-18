Return-Path: <walters@verbum.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 743846077E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 16:05:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 7FC9F2175A;
	Tue, 18 Jun 2013 12:05:40 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Tue, 18 Jun 2013 12:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=c0ZmQVm3ONIdsSFu3nLZ32
	J9gsc=; b=Y2pIUppi2tnN171lCOpxPZW6IeXf6HOaywT8UvcCRb3WlO0Pka8liZ
	tnDilFM9YTqH4dn5J6LNss3k2/tQ9TH1BONI7WWWFJTIstHa/WbD9UNjGWOdmigc
	S4AYuyKOTB0iwKfT+lYHbA5KvQn+nS9xVbuR4J6Iiw23SbdSHo+aE=
X-Sasl-enc: kciG6JYWpl1bovcQmT/XF5CoAJ5dBNlIgB+5Or0tShBY 1371571539
Received: from [10.193.22.97] (unknown [66.187.233.207])
	by mail.messagingengine.com (Postfix) with ESMTPA id 617446802AA;
	Tue, 18 Jun 2013 12:05:39 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1371570476.20823.121.camel@ted>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
	<1371567621.3466.16.camel@localhost>
	<CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
	<1371570476.20823.121.camel@ted>
Date: Tue, 18 Jun 2013 12:05:38 -0400
Message-ID: <1371571538.3466.27.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-1.el6) 
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 16:05:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 16:47 +0100, Richard Purdie wrote:

> The thing which really worries me about this is that we'll start to
> deviate quite massively with how upstream expect us to use autotools.

I just consider upstream wrong, and so do others:
http://wiki.debian.org/ReleaseGoals/LAFileRemoval
http://fedoraproject.org/wiki/Packaging:Guidelines (search for .la)
http://blog.flameeyes.eu/2008/04/what-about-those-la-files (the one mostly sane Gentoo guy)

> As things stand, we have a number of sysroot fixes for the sysroot
> support in libtool which is basically broken out the box. I have tried
> discussing them with upstream and was ignored, mainly as we patch
> libtool and we're supposed to use it unpatched. 

Yeah, I dunno...maybe someone needs to fork libtool.

> I worry that if we go this route, the builds will stop working without
> the .la file removal and that we'll lose any chance of being able to
> resolve our patchset with libtool upstream. We might as well throw away
> libtool at that point

Or that...

>  and save the overhead. It also means we will have
> bigger problems working on something like darwin (which I've had work in
> the past).

I don't have any experience with Darwin myself.

> So I don't see the pressing need to set us off down a path on our own.
> Yes the .la files are annoying but they're not that much of a problem,
> are they?

Depends; I don't have a lot of first-hand experience with problems they
cause in the OE context.  But .la files completely break jhbuild.
Certainly, one could call jhbuild a hack, and it is.  But it's a tool
with absolutely essential properties for people contributing to GNOME.  

Basically jhbuild allows one to e.g.:
$ jhbuild buildone gtk+
$ jhbuild run gedit

Now you have your system version of /usr/bin/gedit linked against the
latest gtk+ from git in /opt/gnome/lib/libgtk.so.  This "two layer"
model is essential for allowing developers to test new code without
risking their /.

The root "feature" of .la files where it can say "if you link against
me, also link against these other libraries" that causes this is much
better implemented by pkg-config.



