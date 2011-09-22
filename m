Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6hkp-0002s8-4p for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 13:47:47 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MBmgts004837 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 12:48:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4fFoMpeAgCMr
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 12:48:42 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MBmYVV004833
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 12:48:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 12:42:18 +0100
In-Reply-To: <DCFAD0F1-1A5B-4038-8A0A-680B0B292F5D@dominion.thruhere.net>
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
	<30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
	<1316651210.13622.0.camel@ted>
	<A769990C-E69F-4882-B3B5-66048C9B5268@dominion.thruhere.net>
	<1316675047.2029.10.camel@ted>
	<CC6D993E-0C5B-4D42-BCB8-2C4C6E62EC77@dominion.thruhere.net>
	<1316686826.2029.30.camel@ted>
	<DCFAD0F1-1A5B-4038-8A0A-680B0B292F5D@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316691744.2029.39.camel@ted>
Mime-Version: 1.0
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Thu, 22 Sep 2011 11:47:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 13:27 +0200, Koen Kooi wrote:
> Op 22 sep 2011, om 12:20 heeft Richard Purdie het volgende geschreven:
> 
> > On Thu, 2011-09-22 at 10:28 +0200, Koen Kooi wrote:
> >> Op 22 sep. 2011, om 09:03 heeft Richard Purdie het volgende  
> > This just means there aren't appropriate git:// -> git:// mappings in
> > people's mirrors files (including Yocto). If git:// -> git:// mappings
> > don't work, we should fix that but they should.
> 
> You mean something like git.kernel.org/scm/torvalds/linux-2.6.git ->  
> github.com/torvalds/linux.git ?

Yes. Thinking about this, the current fetcher might not be optimised in
making this as efficient as possible but it should work and if it
doesn't, we should make it.

> > Now someone has explained the issue, yes, I can see why it is causing
> > problems. I do think some of them are of people's own choosing but I'm
> > trying to be flexible and not make judgement on that.
> >
> > So we can do something along the lines of what you after but there are
> > the following considerations:
> >
> > a) The versioned tarballs do need to be different to what we had  
> > before
> > in that the tarball will be of a .git directory containing the git
> > metadata, not just a checkout. Why? This is so we can incrementally
> > update a git repo if the user changes the source revision as one
> > example. We're dealing with the git fetcher and limiting ourselves  
> > to a
> > flat one dimension doesn't make sense.
> 
> Agreed on that. The bitbake patch I sent does at least do that :)

Right :)

I just want to be clear we're doing something different to what was
there before (and why).

> > b) We need to agree what order the tarballs on the server should be
> > searched for. The "obvious" order would be:
> >
> > 1. Specific Revision X tarball
> > 2. generic mirror tarball
> > 3. git clone
> >
> > The problems come about when we have an existing git checkout which
> > doesn't contain the revision we want.
> 
> There currently is a bug in the fetcher that makes it hard to use now  
> that kernel.org is down. The situation:
> 
> I have a recipe that pulls from git (e.g. cpufrequtils.git from  
> kernel.org) with SRCREV fixed to e.g. deadbeef. DL_DIR/git/ 
> git.kernel.org.utils.cpufrequtils has revision deadbeef. When I do a - 
> c fetch -f it will try to do an update and fail since kernel.org is  
> down. I would have expected it to check the existing bare clone for  
> deadbeef first and not try updating if it is present.

Agreed, it shouldn't be hitting the network unless the revision is
floating. That is bad :/.

> Anyway, I agree on the search order above.
> 
> >  Currently we can just update and
> > assume that will bring in the revision. If we now support people doing
> > rebases and other things, we now at least in theory have to:
> >
> > 1. See if the revision exists locally
> > 2. Try pulling
> > 3. If that doesn't work look for a versioned tarball
> > 4. Blow away all fetcher git status from DL_DIR
> > 5. Extract the tarball
> 
> Since git supports local fetches the above can be:
> 
> 1) see if rev exists
> 2) try pulling
> 3) try versioned tarball
> 4) extract tarball into tmpdir, fetch objects into DL_DIR/git2 repo
> 
> That would stop things from being blown away. It does allow the  
> versioned snapshots to differ, but they will always have the rev they  
> were versioned with.

This is a much better approach. Its quite a big difference from anything
we've done before but the approach should fit in better. I need to think
on it more...

> > My big concern with this is rather than having some general
> > archictecture and standard way of doing this, the fetcher once again
> > becomes a set of special case if A do B but if C do D first then do E
> > but don't forget to do A if Z happens type code.
> 
> I know virtually nothing of the fetcher code, but I think treating  
> every tarball as a local mirror that gets fetched into DL_DIR/git2/ 
> repodir would avoid a lot of special casing.

Yes, its nicer. We keep falling into the trap of thinking about the
non-distributed SCM cases but we have more capability with git and it
makes sense to use it.

> > So what I'm saying is I don't want the fetcher to become the
> > unmaintainable mess the that the code paths in fetch1 were. I don't
> > honestly know how to add a code path like the above and avoid this :(
> >
> > The patch on the bitbake list doesn't consider any of this  
> > complexity or
> > the corner cases
> 
> Sadly it's the best thing I can accomplish with my python skills :( It  
> does solve my #1 need, which is an easy way (ls | grep) to check for  
> GPL compliance.

Ok. Can you at least file a bug in the yocto bugzilla with a summary of
this discussion please? :) That should ensure the issue gets more
attention since with the best intentions, I can't remember everything.

Cheers,

Richard



