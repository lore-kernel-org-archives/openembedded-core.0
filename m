Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C6950601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 08:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3B8SKRP027748; Mon, 11 Apr 2016 09:29:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VMFqcvQpbkCN; Mon, 11 Apr 2016 09:29:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3B8TD83027772
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 Apr 2016 09:29:14 +0100
Message-ID: <1460363353.9308.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Christopher Larson
	<kergoth@gmail.com>, Denys Dmytriyenko <denis@denix.org>
Date: Mon, 11 Apr 2016 09:29:13 +0100
In-Reply-To: <570B07DD.3080309@windriver.com>
References: <cover.1460297667.git.liezhi.yang@windriver.com>
	<86645b1cea4e8cd70156e0fd5f4fb2480933b81d.1460297667.git.liezhi.yang@windriver.com>
	<20160410190630.GI16135@denix.org> <570AFB23.9070507@windriver.com>
	<CABcZANk80jGAHW4uUFqoF2DkMqh7wL2TpOVvQbo4-w+XXmMQwQ@mail.gmail.com>
	<570B07DD.3080309@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base.bbclass: fix COMPATIBLE_MACHINE
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
X-List-Received-Date: Mon, 11 Apr 2016 08:29:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-11 at 10:11 +0800, Robert Yang wrote:
> 
> On 04/11/2016 09:56 AM, Christopher Larson wrote:
> > On Sun, Apr 10, 2016 at 6:17 PM Robert Yang <
> > liezhi.yang@windriver.com
> > <mailto:liezhi.yang@windriver.com>> wrote:
> > 
> > 
> > 
> >     On 04/11/2016 03:06 AM, Denys Dmytriyenko wrote:
> >      > On Sun, Apr 10, 2016 at 07:14:56AM -0700, Robert Yang wrote:
> >      >> It mismatched such as qemux86 and qemux86-64 which was
> > incorrect, for
> >      >> example:
> >      >> COMPATIBLE_MACHINE = "(qemux86)"
> >      >
> >      > That will match qemux86 and qemux86-64 and is by design!
> > It's a regular
> > 
> >     I'm afraid no, please see my last reply, for others such as
> >     MACHINE_OVERRIDES, they never design to work in such a way, so
> > I don't
> >     think that COMPATIBLE_MACHINE should work in this way. If you
> > really
> >     want to match more, I think that you can set it as
> > "(qemux86.*)" or
> >     something familiar.
> > 
> > 
> > That's an apples and oranges comparison. MACHINEOVERRIDES is part
> > of OVERRIDES,
> > which has *completely* different semantics than COMPATIBLE_*.
> > COMPATIBLE_MACHINE
> > is a regex variable more like BBMASK than anything else, and it's
> > been that way
> > since we introduced it. OVERRIDES has nothing to do with regular
> > expressions.
> 
> Since introduced ? I did a grep in oe-core and meta-openembedded, it
> seems
> that no ?
> 
> In oe-core:
> 
> $ grep 'COMPATIBLE_MACHINE.*qemux86' meta/recipes* -r
> linux-yocto_4.4.bb:COMPATIBLE_MACHINE = 
> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86)"
> linux-yocto-dev.bb:COMPATIBLE_MACHINE = 
> "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
> linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86)"
> linux-yocto-rt_4.1.bb:COMPATIBLE_MACHINE = 
> "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> linux-yocto-rt_4.4.bb:COMPATIBLE_MACHINE = 
> "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> linux-yocto_4.1.bb:COMPATIBLE_MACHINE = 
> "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> 
> In meta-openembedded:
> vboxguestdrivers_4.3.30.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86
> -64)"
> 
> We can see that the only one sets qemux86 but no set qemux86-64 is
> linux-yocto-tiny:
> COMPATIBLE_MACHINE = "(qemux86)"
> 
> And it really doesn't work with qemux86-64.

The trouble is as others have mentioned, COMPATIBLE_MACHINE has always
worked this way. We can't really change that without a wider discussion
and at this point in the release in particular, I can't take such a
patch.

We do really need to think about the behaviour as it does do unexpected
things and catch people out.

I'd suggest you add a '$' to the end of the regex in linux-yocto-tiny
to resolve this. We could also add '$' to the end of the other usages
and make it clear it is a regex?

Cheers,

Richard



