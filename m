Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SCiyf-0005yE-MK
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 04:51:13 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1K00EN7Q64DG30@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 21:42:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CCF67201F9; Tue,
	27 Mar 2012 22:42:04 -0400 (EDT)
Date: Tue, 27 Mar 2012 22:42:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120328024204.GE17470@denix.org>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<1704770.YM0OKmOcSp@helios>
MIME-version: 1.0
In-reply-to: <1704770.YM0OKmOcSp@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 02:51:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 27, 2012 at 08:27:02PM +0100, Paul Eggleton wrote:
> On Tuesday 27 March 2012 08:20:11 Robert P. J. Day wrote:
> >   i'm currently poring over the OE docs (including the ones at the
> > yocto site), and i'm trying to figure out how to simply add a package
> > to an image through one's local.conf file.
> > 
> >   the current yocto ref manual has an entire section about customizing
> > images:
> > 
> > http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.htm
> > l#usingpoky-extend-customimage
> > 
> > but it discusses creating custom recipe files and custom tasks, and
> > using IMAGE_INSTALL and IMAGE_FEATURES and EXTRA_IMAGE_FEATURES, and
> > finally gets into using local.conf, suggesting:
> > 
> >   DISTRO_EXTRA_RDEPENDS += "strace"
> > 
> > is that, in fact, the accepted way if one simply wants to add a
> > package to an existing image build?  because as soon as the manual
> > mentions it, in the very next paragraph, it discourages its use.
> 
> Well, this clearly does not make sense if that's the way it is presented. 
> 
> The real answer to this question is it depends on why you're adding the 
> package.
> 
> 1) If you just want to add a single package temporarily for testing, use 
> CORE_IMAGE_EXTRA_INSTALL += in local.conf (although I really wish we could 
> make this mechanism more generic so that it applies to any image, not just the 
> ones in OE-Core).
> 
> 2) If you want to add something permanently for every (non-minimal) image 
> produced using your DISTRO, set DISTRO_EXTRA_RDEPENDS in your distro 
> configuration. This will come into your image via task-distro-base which is 
> pulled in by task-base. I don't think we should be advocating doing anything 
> with DISTRO_EXTRA_RDEPENDS via local.conf.
> 
> 3) If you're adding it permanently for a single image, consider whether adding 
> your own custom image recipe would be more appropriate. FWIW, I don't think 
> bbappends for recipes are a good idea.

All these options don't cover one more need - temporarily adding one or more 
packages to a single specific image via local.conf. Both option 1) and 2) do 
it too broadly to several/all images... And the only option is to go with more 
permanent way in 3) by adding own image recipe.

-- 
Denys


