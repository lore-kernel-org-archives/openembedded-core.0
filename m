Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id E82FE7040F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 21:33:31 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id w8so5322634qac.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 14:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZlVmIyi7J4bnMk0XLHIOUlvaChlNy+4MJzFN4iFbmYQ=;
	b=AihABqFLHbG9vFGPnTQVvvEl7iMe57dZcsFfV8TsF8hUrLm75mvL86HwDZVPiaBjo8
	i70Y1uA4cdPxno8j7pPLi2gt+D/ZmP1MnoeAAR59aArNE5EwdC/pOepUJOf++zcNSLFf
	x+E9iPjxDpcNEMF/j22KzvoCQn0rSKw5y7egKG3LSK4yk3A1qZ/HXY3PI2BZDRk2KlLS
	Z1Rrwf17tBmVJO/cdzcnQ/PfOZjnNKspp8G97LspEVvRyPCntrhVop327+rS4Uwe6LFM
	ippr6/1g1eD4Ms8cROosYteHpPOvzA1XhY1upU4L7c3pG1MQ64NqT1Xi6wo912ORkZvO
	uvGA==
X-Gm-Message-State: ALoCoQmYq4PFwQbXxfAO+Fq7XXg9OVBb3ZXNNqZF21ma6bjDXDEZmvQLlJ7QhHQkqIYrcFuIeavz
X-Received: by 10.224.124.74 with SMTP id t10mr64812213qar.78.1404855212982;
	Tue, 08 Jul 2014 14:33:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Tue, 8 Jul 2014 14:33:12 -0700 (PDT)
In-Reply-To: <cover.1404812342.git.hongxu.jia@windriver.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jul 2014 22:33:12 +0100
Message-ID: <CAJTo0Lbsf6fw=rg3mQv7CqJ+Apmxd2X6W=srNf6dNer_5VZqNQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] support xmlto
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
X-List-Received-Date: Tue, 08 Jul 2014 21:33:36 -0000
Content-Type: text/plain; charset=UTF-8

On 8 July 2014 10:47, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The xmlto was shipped from meta-oe, and fixed the defects that
> 'xmlto/xsltproc stylesheets cannot be found even when they are
> installed in sysroot'
>
> The xmlto required docbook-xml-dtd and docbook-xsl-stylesheets,
> we refered debian's docbook-xml-dtd and ubuntu config.
>
> We also enable xmlto for alsa-utils, xorg-proto-common.inc,
> xorg-lib-common.inc, xserver-xorg.inc.

Presumably the goal here is to enable documentation generation?  I'd
say what we want is more complicated than a blanket "--with-xmlto" and
comes back to the same points I raised when the doxygen patch was
submitted.

Native packages never need to build documentation, as nobody is going
to read it.  We've made steps in this direction with the texinfo class
that stubs makeinfo for native recipes.

Target packages may want documentation, but may not.  A powerul board
such as a Minnow or Beagle can support development on the target and
having e.g. the X11 protocol documentation available might be
convenient.  A board with no UI and 64MB of RAM isn't going to support
development on the target and every built piece of documentation is
wasted time.

SDK packages do want documentation.  The ability to ship a SDK with a
toolchain, libraries, and exactly the correct documentation for the
libraries is valuable and currently something we can't do.

I'd suggest that we need a global BUILD_DOCUMENTATION variable that
can be overridden per-class so that e.g. native and target recipes
don't build documentation but SDK packages do.  Then along with xmlto
we can add gtk-doc and doxygen, adding the ability to build full API
documentation for the SDKs.

As such this is definitely a two-part series.  Adding xmlto is useful
and I'm genuinely happy that someone who wasn't me managed to get
docbook-xsl working ;) as that's the blocker for gtk-doc support too.
However rnabling xmlto in some recipes globally isn't the right thing
to do and will introduce noticeable regressions in build time for many
classes of users for no reason.

Ross

