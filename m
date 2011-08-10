Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr7d5-0007Bj-FC for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:11:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AC6qu5021364
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:06:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20864-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:06:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AC6iNv021358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:06:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF183852@MBX20.4emm.local>
References: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
	<4E41D1B3.4090703@intel.com> <4E41E4F9.60404@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF183852@MBX20.4emm.local>
Date: Wed, 10 Aug 2011 13:06:10 +0100
Message-ID: <1312977970.14274.357.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR assignment to unconditional.
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
X-List-Received-Date: Wed, 10 Aug 2011 12:11:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 02:06 +0000, James Limbouris wrote:
> On Wednesday, 10 August 2011 9:55 AM, Mark Hatle wrote:
> > On 8/9/11 7:32 PM, Scott Garman wrote:
> > > On 08/08/2011 07:04 PM, James Limbouris wrote:
> > >> The pseudo executable sets the PSEUDO_LOCALSTATEDIR environment
> > >> variable to point to a sysroot location. During an initial cache
> > >> build, in which pseudo is not used as it is being built, the
> > >> PSEUDO_LOCALSTATEDIR is set to a per-package location by bitbake.conf,
> > and baked into the cache.
> > >> If the cache is subsequently invalidated, bitbake may run under
> > >> pseudo, and rebuild it with the sysroot location baked into the
> > >> cache. This results in all packages using the same, persistent db,
> > >> even on package rebuild, which leads to permissions errors. Making
> > >> the assignment unconditional corrects this problem.
> > >
> > > I can't tell if this change would impact the use of useradd.bbclass,
> > > which also sets PSEUDO_LOCALSTATEDIR in certain circumstances. Mark,
> > > can you comment on whether this is a valid concern?
> > 
> > I've been trying to figure that out as well.  From what I can tell, as long as the
> > value is "${WORKDIR}/pseudo", and it's evaluated at use time -- vs
> > immediately.. we should be good, even with the useradd.bbclass.
> > 
> > (If I remember correctly, the workdir for the useradd still should either be
> > the package itself, or the sysroot directory.  That should be changing during
> > the various steps, as necessary.)
> > 
> > Frankly I'm still a little confused as to what is happening differently from the
> > "=" to the "?=" case.  My understanding is that one should indicate "it's
> > always this value", and the other is "use this value if one has not already
> > been set."
> >  Either way we should get the same result, and the same result should end
> > up in any caches.  If it's not the same, this might be pointing to a different
> > bug -- or my understanding of the processing of the variables is wrong.
> > 
> > So for the purposes of useradd, I don't see a problem here.. I also don't see
> > any issues with the general case.. but I do wonder why it's needed for the
> > cache to work properly.
> > 
> 
> Hi,
> 
> The problem is that the pseudo executable sets the environment variable
> before starting its argument (bitbake) up, but we do not always use pseudo
> to start bitbake. So sometimes the variable is set to the sysroot, and sometimes
> it is set (by the conditional assignment in bitbake.conf) to the workdir.

Something here isn't adding up correctly to me.

bitbake should not be seeing any PSEUDO_LOCALSTATEDIR from the pseudo
binary since its not a whitelisted environment variable. The ?= should
therefore always being assigned as there wouldn't be a previous version
of the variable.

I'd like to understand what value the variable is taking (which would
stop the ?= applying).

Are you using BB_PRESERVE_ENV ?

Cheers,

Richard

> Usually it is set to the workdir while building the cache, but when the cache is
> invalidated, the wrapper script most often uses pseudo, setting it to the sysroot.
> 
> James




