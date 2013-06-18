Return-Path: <walters@verbum.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 923EC605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 16:39:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id A566E209F6;
	Tue, 18 Jun 2013 12:39:44 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 18 Jun 2013 12:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=Xe8RbSa08F8ymKP7hvAUPC
	Dw/BA=; b=IsTejbdmR6ygsK0ykyrsKljerWDTfssR2aso/JEcLRaMLQ6z0fnIMZ
	GkHkQVzEXP1lMl1MC2GGEI97bPPlvGjxQLd6Y06XL7fEW2lJJ4eN3R3ap6Fb+D7D
	pMRnSldXH7EZwd7VMOBaybDN2zXIqtIlNwL/C+7uxDaF26H3fWFEs=
X-Sasl-enc: V2/fOn5TaZIgUznoBcaPsuNJUZSL9jNYLp0XL5mv2nca 1371573584
Received: from [10.193.22.97] (unknown [66.187.233.207])
	by mail.messagingengine.com (Postfix) with ESMTPA id 53E64C00E86;
	Tue, 18 Jun 2013 12:39:44 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1371571538.3466.27.camel@localhost>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
	<1371567621.3466.16.camel@localhost>
	<CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
	<1371570476.20823.121.camel@ted> <1371571538.3466.27.camel@localhost>
Date: Tue, 18 Jun 2013 12:39:43 -0400
Message-ID: <1371573583.3466.35.camel@localhost>
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
X-List-Received-Date: Tue, 18 Jun 2013 16:39:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 12:05 -0400, Colin Walters wrote:

> Yeah, I dunno...maybe someone needs to fork libtool.

I should follow up to this; the thing is, libtool is at the intersection
of so many cross-cutting issues:

* RPM-style multilib vs Debian-style multiarch
* Supporting libraries that use pkg-config vs those that still
  sadly don't
* Windows vs Darwin vs GNU/Linux (in all its variations)
* Cross vs native builds
* "sysroot" support
* Plugins: libltdl  (and how that interacts with other cross-platform
  module loaders like e.g. GModule)
* Component-internal build system vs external interaction; specifically
  libtool makes it easy to run *uninstalled* binaries, which is
  quite useful, and to do that inside the tree does require
  extra metadata in .la files

So when I say .la files are worthless and broken, I really mean just for
GNU/Linux systems (generally native builds, but likely also cross), and
where things I care about know how to find .so files instead of .la,
and only for *external* build system interaction; having .la files
*inside* the build tree for a single component is fine, etc.

I can't say for sure myself that having libtool unilaterally stop
installing .la files wouldn't break anything; maybe there's some library
out there that doesn't use pkg-config and relies on consumers using
dependency_libs.  But I do think it's at best unnecessary for the use
case above; so maybe it should come down to an option, or something.






