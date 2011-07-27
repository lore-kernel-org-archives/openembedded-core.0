Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmBXU-0002Qz-IK
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 23:21:12 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmBTQ-0002Rs-2W
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 23:17:00 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E3079BA.30705@windriver.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop> <4E30489A.100@windriver.com>
	<1311795061.3398.9.camel@lenovo.internal.reciva.com>
	<4E3079BA.30705@windriver.com>
Date: Wed, 27 Jul 2011 22:16:44 +0100
Message-ID: <1311801404.3398.16.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 21:21:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 15:48 -0500, Mark Hatle wrote:
> On 7/27/11 2:31 PM, Phil Blundell wrote:
> > On Wed, 2011-07-27 at 12:19 -0500, Mark Hatle wrote:
> >> On 7/27/11 10:25 AM, Phil Blundell wrote:
> >>> On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
> >>>> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
> >>>> means I was thumb instructions.
> >>>>
> >>>> So armv5 and armv5t are distinct in the contents of the tunings.
> >>>
> >>> Ah, I see.  Does that go for v4t too?  I can imagine cases where you
> >>> would want to say "select the v4T ISA but generate ARM code not Thumb".
> >>
> >> Yes, for all of them, the TUNENAME selects the features that you want to use to
> >> compile, and suggests the other information like compatible architectures.
> >>
> >> In the case where you want to build primarily one, and optionally the other the
> >> tunename makes it easy..
> >>
> >> Say you want all of your system thumb, except for a few specific programs..
> >>
> >> TUNENAME = "armv4t"
> >>
> >> TUNENAME_pn-mysql = "armv4"
> >>
> >> In the opposite case, where you want everything ARM, except for a few thumb:
> >>
> >> TUNENAME = "armv7"
> >> TUNENAME_pn-bash = "armv7t"
> > 
> > I'm not quite sure that this answers the question I was trying to ask.
> > 
> > The thing about v4/v4T is that, unlike later versions of the
> > architecture, plain v4 doesn't include the BX instruction.  So, if you
> > want your code to be interworking-capable without requiring linker
> > shims, you need to specify -march=armv4t (and -mthumb-interwork) even
> > for CUs that you want to compile as ARM code.
> > 
> > If the architecture name implies the execution state then it doesn't
> > appear as though there is going to be any way to select -march=armv4t
> > without also selecting -mthumb, which would make it impossible to build
> > interworking-capable ARM-state code for v4T.
> 
> It was my understanding that interwork was always enabled these days.  Does
> interworking require a thumb compatible arm core?

Not for v5 and up, since the ARM-state BX instruction always exists
(even if it isn't capable of switching to Thumb-state), and pop {pc}
always changes state if necessary.  The combination of these two things
means that interworking basically comes for free and there is no benefit
to turning it off.

But for v4T, the only instruction which is capable of a state change is
BX, and that instruction simply doesn't exist at all in the non-T v4
architecture.  So, if you plan to run on a v4 core you must either build
with interworking off, or (more commonly nowadays) use the --fix-v4bx
linker option to convert BX back to MOV during final link.

p.




