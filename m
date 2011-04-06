Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7STc-0001UK-B9 for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 15:08:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36D6ik0018131;
	Wed, 6 Apr 2011 14:06:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17931-03; Wed,  6 Apr 2011 14:06:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36D6UFE018125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 6 Apr 2011 14:06:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Esben Haabendal <eha@dev.doredevelopment.dk>
In-Reply-To: <87pqoz4lsp.fsf@eha.doredevelopment.dk>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk> <1302091554.22904.18.camel@rex>
	<87pqoz4lsp.fsf@eha.doredevelopment.dk>
Date: Wed, 06 Apr 2011 06:06:25 -0700
Message-ID: <1302095185.22904.31.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky <poky@yoctoproject.org>, Patches,
	layer <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 13:08:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 14:16 +0200, Esben Haabendal wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> > On Wed, 2011-04-06 at 09:08 +0200, Esben Haabendal wrote:
> >> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> >> 
> >> > One of the items on our post 1.0 schedule is multilib and we need a plan
> >> > of implementation. I've been thinking about this for a while and at
> >> > least have some ideas how some of the issues can be handled.
> >> > ....
> >> > Does this make sense to everyone, are there any questions/ objections/
> >> > concerns/ things I've missed?
> >> 
> >> Which actual OE use-cases justify this kind of addition to OE?
> >
> > Several people wanting to use OECore have a requirement of multilib
> > support.
> 
> Just out of curiosity, could you come with some examples of such
> people or projects?

Well, you've seen Koen's reaction to the prospect of multilib support,
there is one example. I've given x32 as another at the start of this
thread. Its an issue I keep hearing about from companies too.

Fundamentally, multilib is one of the biggest remaining weaknesses of
the OE architecture. One of Yoctos objectives is to reduce the number of
build systems out there and to do this, we need to make one good fully
featured one. Until OE has multilib support there is a functionality
gap. I don't see any technical reason OE can't support mulitlibs and I
don't believe the complexity is high either, we just need to tweak some
things. 

I actually believe the core in OE is well suited to multilib support and
using it will show off some of the power in the OE architecture as I
think we can do it better than anyone else before!

> >> I know it is on the Yocto post 1.0 schedule, but is it actually a good
> >> thing for OE?  Maintaining OE recipes is clearly not going to get any
> >> easier with multilibs support.
> >
> > As detailed in the proposal you will see that the complexity added is
> > minimal. It requires a simple enhancement to BBCLASSEXTEND which is
> > likely desirable for other reasons too and that is the only real bitbake
> > change required. For the metadata, individual recipes remain unaffected
> > and also the core conf files are unchanged too.
> 
> I thought that all recipes (fx. library recipes) involved in a multilib
> build must have the appropriate multilib parts put in BBCLASSEXTEND, and
> after that, anybody touch that recipe is suddenly faced with having to
> take care not to break multilib builds (which most developers probably
> will not really care for).

The multilib conf files are responsible for changing BBCLASSEXTEND, I
don't want to see the need for many, if any recipe specific changes.

The recipe specific problems are likely to be limited to the likes of
hardcoded library paths and those already break things like
DISTRO="minimal" in OE.dev today.

Cheers,

Richard



