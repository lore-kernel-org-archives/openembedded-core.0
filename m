Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SD2Y4-0006s2-Ss
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 01:45:05 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1M000EIC7PYVC0@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 18:35:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9CCA6201C7; Wed,
	28 Mar 2012 19:35:49 -0400 (EDT)
Date: Wed, 28 Mar 2012 19:35:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120328233549.GD32193@denix.org>
References: <1332915061-19304-1-git-send-email-denis@denix.org>
	<1332923884.28414.189.camel@ted>
MIME-version: 1.0
In-reply-to: <1332923884.28414.189.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] bc: use update-alternatives to make dc play nice with busybox
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
X-List-Received-Date: Wed, 28 Mar 2012 23:45:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 28, 2012 at 09:38:04AM +0100, Richard Purdie wrote:
> On Wed, 2012-03-28 at 02:11 -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > busybox' default configuration enables dc app, which bc also provides,
> > setup update-alternatives to resolve the conflict.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-extended/bc/bc_1.06.bb |   13 +++++++++++--
> >  1 files changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
> > index 02915e1..d8d8f4d 100644
> > --- a/meta/recipes-extended/bc/bc_1.06.bb
> > +++ b/meta/recipes-extended/bc/bc_1.06.bb
> > @@ -11,11 +11,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> >  
> >  SECTION = "base"
> >  DEPENDS = "flex"
> > -PR = "r0"
> > +PR = "r1"
> >  
> >  SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
> >  
> >  SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
> >  SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
> >  
> > -inherit autotools
> > +do_install_append () {
> > +	mv ${D}${bindir}/dc ${D}${bindir}/dc.${PN}
> > +}
> > +
> > +inherit autotools update-alternatives
> > +
> > +ALTERNATIVE_NAME = "dc"
> > +ALTERNATIVE_LINK = "${bindir}/dc"
> > +ALTERNATIVE_PATH = "${bindir}/dc.${PN}"
> > +ALTERNATIVE_PRIORITY = "100"
> 
> 
> I think you should just be able to do:
> 
> """
> ALTERNATIVE_LINKS = "${bindir}/dc"
> ALTERNATIVE_PRIORITY = "100"
> 
> inherit autotools update-alternatives
> """
> 
> ?

Yes, quite right. I see plenty of other recipes do it the hard way though...

-- 
Denys


