Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAUL2-0004fI-Pl for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 23:49:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LMeASO007119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 22:40:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06580-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 22:40:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LMe4lo007105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 22:40:05 GMT
Message-ID: <1332369606.9740.212.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 22:40:06 +0000
In-Reply-To: <20120321195324.GB6857@denix.org>
References: <CAP9ODKq3vD6u4TQnWw4Ux9c5L5fB3FVcstY_pCkmzp_HWddhRg@mail.gmail.com>
	<1332323639.9740.125.camel@ted> <20120321195324.GB6857@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 21 Mar 2012 22:49:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 15:53 -0400, Denys Dmytriyenko wrote:
> On Wed, Mar 21, 2012 at 09:53:59AM +0000, Richard Purdie wrote:
> > On Tue, 2012-03-20 at 22:40 -0300, Otavio Salvador wrote:
> > > | NOTE: Unpacking
> > > /home/ostt-devel/src/embedded-systems/downloads/gcc-4_6-branch_gcc.gnu.org_.svn.gcc.branches_184847_.tar.gz
> > > to /home/ostt-devel/src/embedded-systems/tmp-eglibc-eglibc/work-shared/gcc-4.6.3+svnr184847-r28/
> > > | gzip: /usr/lib/libz.so.1: version `ZLIB_1.2.5.1' not found (required by gzip)
> > > | tar: Child returned status 1
> > > 
> > > Does anyone sees it? Our autobuilder is failing this way.
> > 
> > Yes, its being seen. I think its appeared after the pigz-native change
> > but it exposes an underlying problem.
> > 
> > The issue is that we have a gzip binary in the sysroot linking against
> > libz. We can get into a situation where we remove libz to rebuild but we
> > don't remove the gzip binary yet.
> > 
> > gzip-native is a tricky one since its one of those recipes we don't
> > correctly have a dependency chain for and is also implied in
> > ASSUME_PROVIDED (else how to we extract tarballs?).
> > 
> > Whilst I've implicated pigz-native, we could potentially see this with
> > gzip-native too, I'd guess its just more flexible about the libz symbols
> > it uses.
> > 
> > I'm trying to come up with a good way of handling this but at the moment
> > I'm drawing a blank for a neat solution :(. 
> > 
> > Something along the lines of perl-native might be necessary. We could
> > also decide its a special case and remove gzip whenever libz is
> > removed...
> 
> Actually, the original gzip, unlike pigz, does not link against zlib/libz. 
> Same with tar, as Matthew was asking.
> 
> What about statically linking pigz against zlib?

The trouble here isn't just about linking. Its about execution of a
binary that might be half copied for example. We don't currently
atomically deal with files under sstate control, we assume users would
only use them when dependencies are met. I'm not sure we should ever
want to use something that is potentially being copied or could go away.
tar is special in that regard because of how and when we build it.

Cheers,

Richard







