Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <8993e498bf8d266832f911b7b2c7263ccaf418e7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/14] connman: do nothing in qemu, do not touch eth0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Jan 2022 11:08:15 +0000
In-Reply-To: <CANNYZj9jRkc32Xm7PevLuFEgLOxTdaq7bYGu9=_gU3PitT7_-A@mail.gmail.com>
References: <20220109222732.2252416-1-alex@linutronix.de>
	 <20220109222732.2252416-13-alex@linutronix.de>
	 <b13cebc769646dffce33ee9b675375d4c22ef7bc.camel@linuxfoundation.org>
	 <CANNYZj9jRkc32Xm7PevLuFEgLOxTdaq7bYGu9=_gU3PitT7_-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin <alex@linutronix.de>

On Tue, 2022-01-11 at 12:02 +0100, Alexander Kanavin wrote:
> On Tue, 11 Jan 2022 at 11:55, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > +# Kernel IP-Config is perfectly capable of setting up networking passed
> > > in
> > via ip=
> > > +do_install:append:qemuall() {
> > > +    mkdir -p ${D}${sysconfdir}/default
> > > +    echo "export EXTRA_PARAM=\"-I eth0\"" >
> > ${D}${sysconfdir}/default/connman
> > > +}
> > 
> > This means connman becomes machine specific, you can't do that. This would
> > need
> > to be done in the connman-conf recipe.
> 
> I'm not sure I follow - the above instructs connman to ignore eth0 inside qemu
> (and only inside qemu), why is that problematic?

The data above is inserted into /etc/default/connman in the connman package
itself. That package is installed into deploy/XXX/<tunearch>/connman.YYY. That
is not the machine specific package directory.

Or in different words, if I build connmand for a qemu machine, then build
connman for a machine with the same tune that isn't qemu, command rebuilds but
installs the package to the same location. This is not allowed.

Machine specific data (in this case qemu specific) shouldn't be in general
packages. This goes against yocto-check-layer and YP-Compatibility.

Cheers,

Richard

