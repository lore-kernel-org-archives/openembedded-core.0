Return-Path: <rich.tollerton@ni.com>
X-Greylist: delayed 1025 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Jan 2015 09:38:43 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 23A2E60043;
	Thu, 29 Jan 2015 09:38:43 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	t0T9LVmk028445; Thu, 29 Jan 2015 03:21:31 -0600
Received: from weregild ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015012903213096-479547 ;
	Thu, 29 Jan 2015 03:21:30 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <20150128134042.GI2477@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150107141256.GM29986@jama> <20150108120155.GH3972@jama>
	<20150128134042.GI2477@jama>
User-Agent: Notmuch/0.19 (http://notmuchmail.org) Emacs/24.4.2
	(x86_64-unknown-linux-gnu)
Date: Thu, 29 Jan 2015 03:21:31 -0600
Message-ID: <87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/29/2015 03:21:31 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/29/2015 03:21:31 AM,
	Serialize complete at 01/29/2015 03:21:31 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2015-01-29_04:2015-01-28, 2015-01-29,
	1970-01-01 signatures=0
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2015 09:38:46 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa@gmail.com> writes:

> On Thu, Jan 08, 2015 at 01:01:55PM +0100, Martin Jansa wrote:
> > On Wed, Jan 07, 2015 at 03:12:56PM +0100, Martin Jansa wrote:
> > > On Fri, Dec 19, 2014 at 06:08:41PM +0000, git@git.openembedded.org wrote:
> > > > Module: openembedded-core.git
> > > > Branch: master
> > > > Commit: 89a29a3ad0742cd713e739d3d460be7711966679
> > > > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=89a29a3ad0742cd713e739d3d460be7711966679
> > > > 
> > > > Author: Richard Tollerton <rich.tollerton@ni.com>
> > > > Date:   Fri Dec 12 13:34:00 2014 -0600
> > > > 
> > > > font-util: Fix incorrect PKG_CONFIG_PATH
> > > > 
> > > > PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
> > > > /usr/lib/pkgconfig is always checked as a fallback; however,
> > > > PKG_CONFIG_PATH is currently (incorrectly) set to /usr/lib/pkg-config in
> > > > the sysroot, which doesn't exist. On host distros where the font
> > > > encoding maps are stored under a different path than OE, this will break
> > > > font builds, because ucs2any will attempt to read the sysroot's encoding
> > > > maps with the host paths.
> > > 
> > > ^ Is this description of what the patch is supposed to fix or expected
> > > side-effect of this change?
> > > 
> > > Because all font recipes and meta-oe are failing since this change with
> > > errors like this:
> > > 
> > > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/ucs2any:
> > > Can't read mapping file
> > > '/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/share/fonts/X11/util/map-ISO8859-1':
> > > No such file or directory!
> > > 
> > > See http://www.openembedded.org/wiki/Bitbake_World_Status
> > 
> > I can confirm that reverting this patch fixes font-* recipes
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100523.html
>
> Ping

ACK. Sorry, I could've sworn I saw the commit get reverted on
master-next, so I figured this was a lower priority than I indicated in
my previous reply.

This build is broken because my patchset was only partially committed.
"font-util: Fix incorrect PKG_CONFIG_PATH" (the patch you reference
above) was patch 2/3, but patches 1/3 "font-util: remove MAPFILES_PATH
override" and 3/3 "xorg-font-common: fix sysroot injection for encoding
maps" appear to have never been committed. See original thread at e.g.
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/58846.

Could you try rebuilding with those other two patches?

> > > > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > 
> > > > ---
> > > > 
> > > >  meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > > > index 8b42991..cc4258a 100644
> > > > --- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > > > +++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > > > @@ -17,7 +17,7 @@ RDEPENDS_${PN}_class-native = "mkfontdir-native mkfontscale-native"
> > > >  PR = "${INC_PR}.0"
> > > >  
> > > >  do_configure_prepend() {
> > > > -        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" ${S}/fontutil.m4.in
> > > > +        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkgconfig\" pkg-config#g" ${S}/fontutil.m4.in
> > > >  }
> > > >  
> > > >  BBCLASSEXTEND = "native"
> > > > 
> > > > -- 
> > > > _______________________________________________
> > > > Openembedded-commits mailing list
> > > > Openembedded-commits@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> > > 
> > > -- 
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > 
> > 
> > 
> > -- 
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

-- 
Richard Tollerton <rich.tollerton@ni.com>

