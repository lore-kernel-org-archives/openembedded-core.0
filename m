Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9D27361165
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:36:19 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id hz10so2408340vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 11:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nIfb8xPUoNJBFQDmDZ31GdtMuDo92w2Q7SMKkwrZkHM=;
	b=Ke3jZ53GZhBrsQMN2jeb/NJn2Elkz81GxTfylRbinqqdD6gfPTvzJv8HUExGN1rUot
	uy/7pEVWC6W7ZP1zRhvKIwuItfzYdwiu8YTFm/eurup40Cu4bCwLByaU/ZZaNVI882ue
	OaJGteAptXm9yC5HU20XMnYCgL0lNSt0FQcXXpccKG4ZX0x0BbmTUC3k4EbX1paGkS+U
	FS/6s3XphhEgJmudRFn/jZbiljqtH5c6fwWpspnXlIMqSGMuW5uGYn5VvoTMiP3sFDnQ
	K2l40/zVKrceBArN4xagOHWkCKczLJWMIq6aBbMy8er1YT2ZaYkhKbtxf1meyfKIt3vC
	ZyIA==
X-Gm-Message-State: ALoCoQmkvGfevov4fkS1kmwAUeFlOR8vtWlvn/mJT72p+NNZQPSsQhUpIERR/20IEZGw7Rb4gyR5
X-Received: by 10.58.97.238 with SMTP id ed14mr328770veb.34.1378492581441;
	Fri, 06 Sep 2013 11:36:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 6 Sep 2013 11:36:01 -0700 (PDT)
In-Reply-To: <1378369981.32427.23.camel@ted>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
	<1378369981.32427.23.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Sep 2013 19:36:01 +0100
Message-ID: <CAJTo0LbLaH4-YTJVo_yr-gsaaSbXXe9Ucfbq_i+4gO+qKa354Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	Darren Hart <darren.hart@intel.com>, Saul Wold <saul.wold@intel.com>
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
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
X-List-Received-Date: Fri, 06 Sep 2013 18:36:20 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 09:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'd also appreciate someone (Ross maybe?) confirming that if we build
> application A against mesa, then change over to a machine that uses emgd
> and swizzle the libs around in the sysroot, do we need to recompile the
> app? This approach is assuming we do not need to do that. If we do,
> there is a different approach we need to take.

So what's happening is that we're revising the original OpenGL policy
that I posted in October last year:

http://lists.openembedded.org/pipermail/openembedded-core/2012-October/070122.html

tl;dr: I proposed that 1) we rename all GL packages so they identify
their provider (ie libgl-mesa, we do that), 2) no dependencies on
specific GL implementations, 3) only Mesa stages.  The theory was that
Mesa can be considered a canonical implementation of the various GL
platforms and that we can *build* against Mesa but *install* the right
hardware-specific GL implementation into the images.

Nice in theory and it should work, but sadly that isn't the case - the
thread has more details.  Short version is that some applications *do*
rely on specific GL headers, so you can't just swap them around in
reality.

Maybe it is time to have a mesa-gl recipe alongside mesa that *just*
builds the GL libraries.  EMGD can depend on it for the driver modules
it installs, and presumably other vendors with binary drivers can
install it for the software rendering/GLX support (Otavio etc, please
step in here!).

Ross

