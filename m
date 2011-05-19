Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNC96-0008HQ-OS for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 00:56:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMrnDX014441
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:53:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14260-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:53:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMrf8t014435
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:53:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DD42244.60806@gravedo.de>
References: <43EE53C2-2A83-4F54-B8CF-F0614AB390B0@dominion.thruhere.net>
	<1303126125.5518.118.camel@rex>
	<0E9C83CD-3E86-46B3-B749-6FAFB94E4BAF@dominion.thruhere.net>
	<4DAC2BC5.4020107@mlbassoc.com>  <4DD42244.60806@gravedo.de>
Date: Thu, 19 May 2011 23:53:37 +0100
Message-ID: <1305845617.3424.570.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Is BBCLASSEXTEND in .bbappend supposed to work?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 22:56:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 21:47 +0200, Simon Busch wrote:
> On 18.04.2011 14:17, Gary Thomas wrote:
> > On 04/18/2011 05:34 AM, Koen Kooi wrote:
> >>
> >> Op 18 apr 2011, om 13:28 heeft Richard Purdie het volgende geschreven:
> >>
> >>> On Mon, 2011-04-18 at 12:55 +0200, Koen Kooi wrote:
> >>>> Martin did some Xorg cleanup in meta-oe today and we're seeing some
> >>>> strange behaviour.  The recipe in question:
> >>>>
> >>>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ cat
> >>>> recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> >>>> BBCLASSEXTEND = "native nativesdk"
> >>>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$
> >>>>
> >>>> Bitbake-layers tells me:
> >>>>
> >>>> INFO: libxrender_0.9.6.bb:
> >>>> INFO:  
> >>>> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> >>>>
> >>>>
> >>>> So the append is getting picked up, but bitbake gives me:
> >>>>
> >>>> ERROR: Nothing PROVIDES 'libxrender-native'
> >>>> NOTE: Runtime target 'libnss-mdns' is unbuildable, removing...
> >>>> Missing or unbuildable dependency chain was: ['libnss-mdns',
> >>>> 'avahi', 'gtk+', 'gtk+-native', 'libxrender-native']
> >>>>
> >>>> This is with HEAD of bitbake master.
> >>>
> >>> I did some experimentation here and this looks like bitbake-layers is
> >>> seeing the file but bitbake is not. If I touch the libxrender .bb file
> >>> and then run bitbake -DDD, I see the file mentioned in the logs:
> >>>
> >>> $ touch recipes-graphics/xorg-lib/libxrender_0.9.6.bb
> >>> $ bitbake libxrender-native -DDD | grep append
> >>> DEBUG: Appending .bbappend file
> >>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> >>> to /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
> >>> DEBUG: BB
> >>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend: handle(data,
> >>> include)
> >>> DEBUG: LOAD
> >>> /rphome/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> >>>
> >>> Can you confirm you're seeing that? Admittedly I just hacked a local
> >>> checkout and I'm not using meta-oe.
> >>
> >> I get:
> >>
> >> koen@dominion:/OE/tentacle/build$ touch
> >> ../sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
> >>
> >> koen@dominion:/OE/tentacle/build$ bitbake libxrender-native -DDD |
> >> grep append
> >> DEBUG: Appending .bbappend file
> >> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> >> to
> >> /OE/tentacle/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.6.bb
> >>
> >> DEBUG: BB
> >> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend:
> >> handle(data, include)
> >> DEBUG: LOAD
> >> /OE/tentacle/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
> >>
> >>
> >> It then chokes on renderproto-native, which gets fixes by touching the
> >> .bb. So it looks like bitbake has some caching issues.
> > 
> > I have seen exactly this behaviour.  Rebuilding the cache makes it
> > work.  Is there an easy way
> > to force the cache to rebuild?  (I just touch a .conf file...)
> > 
> >>>
> >>> Do you need to add *.bbappend to BBFILES in layer.conf ?
> >>
> >> I have that already :)
> 
> I discoverd the same behaviour today. Is there already something fix to
> get bitbake to evaluate the bbappend file after creation?

Someone should file a bug about this so we don't forget about it. I
think bbappend files currently sometimes fall outside the cache logic
but they obviously shouldn't and we've found a corner case...

Cheers,

Richard



