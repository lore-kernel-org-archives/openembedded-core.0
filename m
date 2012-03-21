Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SASgI-0001fz-Ru
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:02:55 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900ATG390QLW0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 14:53:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D37AA2018B; Wed,
	21 Mar 2012 15:53:24 -0400 (EDT)
Date: Wed, 21 Mar 2012 15:53:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120321195324.GB6857@denix.org>
References: <CAP9ODKq3vD6u4TQnWw4Ux9c5L5fB3FVcstY_pCkmzp_HWddhRg@mail.gmail.com>
	<1332323639.9740.125.camel@ted>
MIME-version: 1.0
In-reply-to: <1332323639.9740.125.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Build failures due zlib problem
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
X-List-Received-Date: Wed, 21 Mar 2012 21:02:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 21, 2012 at 09:53:59AM +0000, Richard Purdie wrote:
> On Tue, 2012-03-20 at 22:40 -0300, Otavio Salvador wrote:
> > | NOTE: Unpacking
> > /home/ostt-devel/src/embedded-systems/downloads/gcc-4_6-branch_gcc.gnu.org_.svn.gcc.branches_184847_.tar.gz
> > to /home/ostt-devel/src/embedded-systems/tmp-eglibc-eglibc/work-shared/gcc-4.6.3+svnr184847-r28/
> > | gzip: /usr/lib/libz.so.1: version `ZLIB_1.2.5.1' not found (required by gzip)
> > | tar: Child returned status 1
> > 
> > Does anyone sees it? Our autobuilder is failing this way.
> 
> Yes, its being seen. I think its appeared after the pigz-native change
> but it exposes an underlying problem.
> 
> The issue is that we have a gzip binary in the sysroot linking against
> libz. We can get into a situation where we remove libz to rebuild but we
> don't remove the gzip binary yet.
> 
> gzip-native is a tricky one since its one of those recipes we don't
> correctly have a dependency chain for and is also implied in
> ASSUME_PROVIDED (else how to we extract tarballs?).
> 
> Whilst I've implicated pigz-native, we could potentially see this with
> gzip-native too, I'd guess its just more flexible about the libz symbols
> it uses.
> 
> I'm trying to come up with a good way of handling this but at the moment
> I'm drawing a blank for a neat solution :(. 
> 
> Something along the lines of perl-native might be necessary. We could
> also decide its a special case and remove gzip whenever libz is
> removed...

Actually, the original gzip, unlike pigz, does not link against zlib/libz. 
Same with tar, as Matthew was asking.

What about statically linking pigz against zlib?

-- 
Denys


