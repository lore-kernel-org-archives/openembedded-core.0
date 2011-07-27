Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qlzff-0003hQ-3R for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 10:40:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6R8abUE028521
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 09:36:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27332-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 09:36:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6R8aSto028515
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 09:36:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
	<1311720776.2344.319.camel@rex>
	<9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
Date: Wed, 27 Jul 2011 09:36:18 +0100
Message-ID: <1311755778.2344.325.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Wed, 27 Jul 2011 08:40:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 22:23 -0500, Kumar Gala wrote:
> On Jul 26, 2011, at 5:52 PM, Richard Purdie wrote:
> 
> > On Tue, 2011-07-26 at 17:02 -0500, Kumar Gala wrote:
> >> On Jul 26, 2011, at 11:18 AM, Richard Purdie wrote:
> >> 
> >>>>> You're already found the way to pass configuration to *libc using values
> >>>>> in TARGET_FPU to pickup the right configuration.
> >>>>> 
> >>>>> Is there a use case we're missing?
> >>>> 
> >>>> Yes, for [e]glibc we have optimized libc functions for a given /
> >>>> specific PPC processor.  So we need someway to tell configure this.
> >>> 
> >>> I'd do this by looking for flags in TUNE_FEATURES as Mark has also
> >>> mentioned.
> >>> 
> >>> Cheers,
> >>> 
> >>> Richard
> >> 
> >> Are we thinking something like the following in e[glibc] recipes:
> >> 
> >> EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-with-cpu=e500mc", "", d)}"
> > 
> > Could we glean this information from the TUNE_CCARGS variable and do
> > this automatically?
> 
> For PPC we'd have:
> 
> 405
> 440
> 464
> 476
> 603e
> e500
> e500mc
> e5500
> 970
> a2
> cell
> power4
> power5
> power5+
> power6
> power6x
> power7
> 
> There isn't always a clean mapping.  For example ppce500 & ppce500v2 would want --with-cpu=e500.  I believe ppc603e, ppce300c2 would want --with-cpu=603e.
> 
> If we want to just do it as a python function w/a mapping table we could easily handle it that way.

We could also put:

GLIBC_EXTRA_OECONF = "--with-cpu=e500"

in the machine config files. When multilib gets involved we'd have to
become a little cleverer with this but there are options there...

Cheers,

Richard



