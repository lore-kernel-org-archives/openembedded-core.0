Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SDhz9-0003cm-FM
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 21:59:47 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1P00D9SR466TB0@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 14:50:31 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A7B6020120; Fri,
	30 Mar 2012 15:50:30 -0400 (EDT)
Date: Fri, 30 Mar 2012 15:50:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120330195030.GA24301@denix.org>
References: <alpine.DEB.2.02.1203300551220.28382@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1203300551220.28382@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: require/include a .bb file in the same directory?
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
X-List-Received-Date: Fri, 30 Mar 2012 19:59:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 30, 2012 at 05:59:22AM -0400, Robert P. J. Day wrote:
> 
>   couple questions about the require/include directives.  first, can
> you include *any* valid text file?  not just your standard .inc file
> (even though that is of course the most common thing to do).
> 
>   and second, i'm looking at this example in meta/recipes-core/images,
> where the recipe file core-image-minimal-mtdutils.bb is defined as:
> 
> require core-image-minimal.bb
> IMAGE_INSTALL += "mtd-utils"
> 
> that looks perfectly reasonable since that required .bb file is in the
> same directory, and this is clearly just defining a new image recipe
> by adding one more package.
> 
>   but the explanation of include/require in the bitbake manual is:
> 
> "if the path specified on the include line is a relative path,
> BitBake will locate the first one it can find within BBPATH."
> 
>   that suggests that, by some massively unlikely fluke, i might
> unknowingly have an identically-named recipe file earlier in my BBPATH
> variable and that earlier one is the one that would be included.  is
> that correct?

For that to happen, the file has to be in the top-level directory of one of 
your layers listed by BBPATH, which rarely happens, as proper layers have at 
least a minimal directory structure, such as conf/, recipes/ etc.

On the other hand, if you really want that file to be included from another 
layer, which is higher priority or listed earlier, then you would need to do:

require recipes-core/images/core-image-minimal.bb


>   and if that's true, could i avoid that kind of mistake by doing:
> 
> require ./core-image-minimal.bb

I haven't tried that, but I believe it will be the same as w/o ./


> i realize getting hung up like this is unlikely, but it's always
> possible.

-- 
Denys


