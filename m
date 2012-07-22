Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ssugw-0008Jg-35 for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 13:51:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MBdqcr027734
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 12:39:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19932-10 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 12:39:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MBdhwP027728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 12:39:45 +0100
Message-ID: <1342957188.21788.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 12:39:48 +0100
In-Reply-To: <ly7gtw83cp.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1342871746-14583-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1342946469.21788.54.camel@ted>
	<lyipdg878m.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1342953152.21788.59.camel@ted>
	<ly7gtw83cp.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake: do not set CCACHE_DISABLE=0
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
X-List-Received-Date: Sun, 22 Jul 2012 11:51:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-22 at 13:03 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> >> and requesting explicitly that user specifies
> >> 
> >>  | CCACHE_DISABLE[unexport] = "1"
> >> 
> >> in his .conf?  Sounds hacky and inconsistent and makes it impossible to
> >> set CCACHE_DISABLE by external environment.
> >
> > The idea is that anyone enabling ccache would inherit the bbclass.
> 
> afais, the ccache.bbclass class is for assigning and cleaning some
> (imho) strange CCACHE_DIR only which lowers efficiency significantly.
> 
> Normal ccache usage with a single CCACHE_DIR works fine (and much better)
> without this class.

There are the following concerns that others have raised over time:

a) That the central ccache directory in the user's homedir can get
filled very easily and this isn't something that most users expect.
b) There is reuse of that directory between different architectures
which isn't desired
c) That a clean of a recipe does not remove the ccache objects
d) That CCACHE_DIR might not exist when ccache is called raising errors
e) that ccache has bugs/risk but making it recipe specific alleviates
some of the risk/contamination issues

I neither claim these are good or bad reasons but they are all dealt
with by the class. Its a question of which issues you want to run into
and what behaviour you want. If you strongly dislike the way CCACHE_DIR
is set, that can be overridden.

Personally speaking, I dislike ccache and would love to just remove all
the code related to it and disable it for everyone. Yes, it has some
performance wins in some corner case situations but it is of marginal
utility IMO.

> > The above could therefore be simplified to a hard ??= 1
> 
> for what is the '??=' ?  The value does not matter so it makes no sense
> that the user can assign a value.

Ok, we can just use = there...

Cheers,

Richard



