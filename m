Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1T3kLH-0000bW-TD; Tue, 21 Aug 2012 11:01:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2012 01:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,801,1336374000"; d="scan'208";a="189159378"
Received: from unknown (HELO helios.localnet) ([10.252.121.105])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2012 01:49:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: yocto@yoctoproject.org
Date: Tue, 21 Aug 2012 09:49:37 +0100
Message-ID: <1570865.4gpYqKP9pu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <5032A1D3.8090600@windriver.com>
References: <2404459.dJBf5OQotX@helios> <5032A1D3.8090600@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] RFC: OE-Core task rework
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 09:01:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 August 2012 15:45:07 Mark Hatle wrote:
> > 1) Do we rename "task" to something a little more understandable to the
> > uninitiated, such as "package group"? The word "task" is already used in a
> > much more natural sense within bitbake as a unit of work. Historically I
> > believe we picked up this term from Debian but I'm not aware of
> > significant use by other mainstream distributions.
> 
> "group" or "packagegroup" or "package-group" is my suggestion for the
> existing 'task' recipes.  From what I've seen, it should be a rename
> opportunity -- we can even provide/rprovide the old names....

Indeed, and I think we would for compatibility purposes.
 
> > 2) Look at the existing tasks and:
> >   * evaluate their usefulness
> >   * remove any that are obsolete
> >   * adjust existing contents if needed
> >   * look for useful groups of packages that might be added
> >   
> >   We need to pay particular attention to task-core-boot and task-base as
> >   these> 
> > are pulled in by default in any image that inherits from
> > core-image.bbclass - if these are not generally working for people that
> > are creating their own images, we need to change them such that they are.
> 
> During the pre-oe-core Yocto Project development, a design was generated to
> roughly group the packages into functional areas.  For the most part, this
> design (as well as legacy elements) still exist.
> 
> I think the boot, base and others need to be evaluated for usefulness... but
> my feeling is most of them are close to being correct.

I think so as well. We may be pulling in one or two packages unconditionally 
where they should be optional (e.g. modutils-initscripts?) but most of it is 
pretty sensible.
 
> >   *  Try to make each task have a reasonable name - there are some current
> >   uses of "core" and "base" that don't actually convey any meaning; LSB
> >   specific tasks should be named as such, etc.
> 
> Yup, there is a logical grouping for the lsb specific tasks, as for others. 
> The naming needs to be made clear as to why it's there, and what it
> represents. Same with the summary and descriptions -- they should list the
> functionality provided by this group of components.

The main concern with LSB is that we have something called task-basic, which 
seems to be intended for LSB but does not state as much, and I know at least 
one person has tried to use it and then been a little puzzled as to why rpm 
has been pulled in when ipk packaging has been selected. Just naming some of 
these tasks more appropriately would help avoid such situations. In the 
specific case of task-basic there may be a case for creating a similar but not 
LSB-focused task that pulls in real shell utilities in preference to the light 
versions provided by busybox.

> > 4) Consider the usefulness of the existing PACKAGE_GROUP_ structure which
> > converts some IMAGE_FEATURES into the addition of tasks to be installed
> > (see classes/core-image.bbclass). At the very least we should probably
> > rename this if we rename tasks to package groups, and there's a question
> > as to how IMAGE_FEATURES scales - should every task be represented in
> > there or only a select list? Would we be better off not trying to bring
> > any tasks in via IMAGE_FEATURES at all and mostly leave that to control
> > post-processing (e.g. package-management, debug-tweaks, etc.)?
> 
> I'd certainly prefer that images were limited to selecting software from
> task (group) recipes only, and not providing their own.  An image should be
> able to change the selection based on an "image feature" or similar
> configuration, but the underlying tasks/groups, recipes, etc should all be
> 'generic' to a given distribution configuration.

The first part seems reasonable to me; but I'm still short of an answer as to 
what to do with the existing IMAGE_FEATURES code as mentioned above. At the 
moment aside from the special features such as debug-tweaks, these are just a 
thin layer on top of task recipes which doesn't add very much at all other 
than extra maintenance.

> I think if you go through the images today, a lot of that stuff is either
> old, or could be simplified by creating appropriate tasks/groups.

OK, that's a good point. I have another task on my list to clean up our image 
recipes and that would be a good segue into that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


