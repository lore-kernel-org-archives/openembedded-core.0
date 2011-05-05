Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHyCQ-0006Su-SR for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 15:02:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45Cxsdp011254;
	Thu, 5 May 2011 13:59:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10954-05; Thu,  5 May 2011 13:59:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45CxllV011213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 May 2011 13:59:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <148CCAB7-27BE-4DA5-B1FB-409976E2A918@dominion.thruhere.net>
References: <cover.1304520272.git.paul.eggleton@linux.intel.com>
	<21e4929e2ef79647b16852bb6f15537939012b02.1304520272.git.paul.eggleton@linux.intel.com>
	<1304595529.20791.25.camel@rex>
	<40F9395F-41E1-4780-9E0C-6F0A91362CEB@dominion.thruhere.net>
	<1304598075.29269.2.camel@rex>
	<148CCAB7-27BE-4DA5-B1FB-409976E2A918@dominion.thruhere.net>
Date: Thu, 05 May 2011 13:59:44 +0100
Message-ID: <1304600384.29269.22.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 3/3] meta-yocto: add pieces removed from oe-core for beagleboard & atom-pc
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
X-List-Received-Date: Thu, 05 May 2011 13:02:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-05 at 14:31 +0200, Koen Kooi wrote:
> Op 5 mei 2011, om 14:21 heeft Richard Purdie het volgende geschreven:
> 
> > On Thu, 2011-05-05 at 13:46 +0200, Koen Kooi wrote:
> >> Op 5 mei 2011, om 13:38 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> Hi Paul,
> >>> 
> >>> Great work in doing this, thanks. I was just looking at it with a view
> >>> to making machine support cleaner and I think there are still things we
> >>> can likely to do help with this. As one example:
> >>> 
> >>> On Wed, 2011-05-04 at 15:51 +0100, Paul Eggleton wrote:
> >>>> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
> >>>> @@ -0,0 +1,2 @@
> >>>> +QT_GLFLAGS_atom-pc = "-opengl"
> >>>> +
> >>>> diff --git a/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
> >>>> new file mode 100644
> >>>> index 0000000..076ade2
> >>>> --- /dev/null
> >>>> +++ b/meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
> >>>> @@ -0,0 +1,2 @@
> >>>> +QT_GLFLAGS_atom-pc = "-opengl"
> >>> 
> >>> could we set QT_GLFLAGS in the machine.conf file instead of using a
> >>> bbappend?
> >> 
> >> Putting such USEFLAGS in machines sounds like a bad idea. In this case
> >> enabling it globally and falling back to mesa sw rendering at runtime
> >> is a better idea. The GL flag only enables extra API and libs, so it's
> >> good to have.
> > 
> > Agreed, longer term I think this is going to be the better way to handle
> > this. In this day and age, defaulting to sw rendering is probably the
> > sane thing to do.
> 
> Something like SOC_FAMILY would help here.

In some cases.

> > Equally, moving this from a .bbappend to the machine file is a bit
> > cleaner too though :)
> 
> Is it? Do you really want the machine to know about all the knobs in
> all the different layers? The .bbappends clearly signals a change to
> the recipe, hiding it in the machine.conf will just confuse people.
> And when changing options you need to edit the machine and then use
> PR_INC in a different file. Using a bbappend limits that to a single
> file

I'm not saying this makes sense for every bbappend option. For something
like QT and which is a part of OECore, I'm leaning towards being less
concerned about it though and making *every* QT machine write a bbappend
seems a little extreme the other way.

Cheers,

Richard



