Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAtE5-0003nz-U6 for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 02:23:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2N1ESJj022153
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 01:14:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21166-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 01:14:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2N1ELpq022147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 01:14:22 GMT
Message-ID: <1332465264.9740.380.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 01:14:24 +0000
In-Reply-To: <20120322235342.GC13495@denix.org>
References: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
	<1332458784.9740.371.camel@ted> <20120322235342.GC13495@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 01:23:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 19:53 -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 22, 2012 at 11:26:24PM +0000, Richard Purdie wrote:
> > On Fri, 2012-03-09 at 14:39 -0700, Tom Rini wrote:
> > > Hey all,
> > > 
> > > Over in meta-ti I kicked off a discussion
> > > (https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
> > > about if we should be using '?=' or '+=' with IMAGE_FSTYPES in the
> > > machine conf files.  This has been discussed a little bit before
> > > (http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061).
> > >  The problem is we have the following and I believe ultimately
> > > conflicting use cases:
> > 
> > I've been under the impression that we decided upon:
> > 
> > > - The machine needs to say 'I need or support the following formats'
> > 
> > so the machine starts and sets:
> > 
> > IMAGE_FSTYPES = "xxxx"
> > 
> > > - The distro needs to say 'I always want format X'
> > 
> > so the distro can do:
> > 
> > IMAGE_FSTYPES += " yyy"
> > 
> > > - The user needs to say 'I know best, give me only format X'
> > 
> > So the user can do:
> > 
> > IMAGE_FSTYPES = "X"
>
> Since local.conf gets parsed before machine.conf and distro.conf, the user 
> needs to do this override:
> 
> IMAGE_FSTYPES_local = "X"
> 
> Otherwise machine.conf will always overwrite it with "xxxx" with its 
> unconditional assignment.

Right, I'd forgotten that little detail :/.

It actually makes me wonder if our include order is the right one but
now isn't the time to try changing that.

I agree the neatest way to change it is probably something like
MACHINE_FSTYPES. I do worry a lot about backwards compatibility though
and I'd also point out where we're at in the release cycle (bug fix
only).

Cheers,

Richard





