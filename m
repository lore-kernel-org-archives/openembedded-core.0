Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXC57-0004Ce-CO for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:58:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4NDmKHl013047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 14:48:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12644-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 14:48:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4NDmDtD013041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 14:48:15 +0100
Message-ID: <1337780891.8248.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2012 14:48:11 +0100
In-Reply-To: <4FBCBFA6.8020307@mlbassoc.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
	<9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
	<4FBCBFA6.8020307@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/9] tar: fix build
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
X-List-Received-Date: Wed, 23 May 2012 13:58:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-23 at 04:44 -0600, Gary Thomas wrote:
> On 2012-05-22 18:05, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > Avoid this error:
> > | rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/tar-1.26-r1/image/usr/sbin/': No such file or directory
> > NOTE: package tar-1.26-r1: task do_install: Failed
> >
> > no PR bump as no change in the output.
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   meta/recipes-extended/tar/tar.inc |    8 ++++++--
> >   1 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
> > index 0533b82..5c2325a 100644
> > --- a/meta/recipes-extended/tar/tar.inc
> > +++ b/meta/recipes-extended/tar/tar.inc
> > @@ -18,8 +18,12 @@ do_install () {
> >   do_install_extra () {
> >       install -d ${D}${base_bindir}
> >       mv ${D}${bindir}/tar ${D}${base_bindir}/tar.${PN}
> > -    rmdir ${D}${bindir}/
> > -    rmdir ${D}${sbindir}/
> > +    if [ -d ${D}${bindir}/ ] ; then
> > +        rmdir ${D}${bindir}/
> > +    fi
> > +    if [ -d ${D}${sbindir}/ ] ; then
> > +        rmdir ${D}${sbindir}/
> > +    fi
> >       mv ${D}${libexecdir}/rmt ${D}${libexecdir}/rmt.${PN}
> >   }
> >
> 
> Why not just use
>    rm -fr ${D}${bindir}
> etc?  No need for all the extra testing...

I've mentioned this once before however I'll do so again. I think these
empty directories were a bug in automake. It looks like automake has
fixed that problem and no longer generates them. I think the correct
thing to do is simply remove the rmdir.

The reason we used rmdir instead of rm is we wanted to know if these
suddenly started containing files, not silently delete them.

Cheers,

Richard





