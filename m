Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B48E609B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 21:38:39 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s74LcfCX028729; Mon, 4 Aug 2014 16:38:41 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080416384113-628783 ;
	Mon, 4 Aug 2014 16:38:41 -0500 
Date: Mon, 4 Aug 2014 16:38:21 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140804213821.GA10174@bshelton-desktop>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<17ffe840a21d09f0dcb1cdfeb13d9d21331055f9.1407177403.git.ben.shelton@ni.com>
	<CAP9ODKqkaSZde6TuXw=VdverfKWP-o03=5VmLgfRNUias50gxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqkaSZde6TuXw=VdverfKWP-o03=5VmLgfRNUias50gxg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 04:38:41 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/04/2014 04:38:41 PM,
	Serialize complete at 08/04/2014 04:38:41 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-04_04:2014-08-04, 2014-08-04,
	1970-01-01 signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/20] udev-cache: parametrize sysconf file paths
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
X-List-Received-Date: Mon, 04 Aug 2014 21:38:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/04, Otavio Salvador wrote:
> On Mon, Aug 4, 2014 at 3:41 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> > From: Richard Tollerton <rich.tollerton@ni.com>
> >
> > The udev-cache facility uses files that represent system states, to
> > ensure that the cache tarball is valid to apply. These paths were
> > hardcoded in several places; collect them into DEVCACHE_SYSCONF and
> > DEVCACHE_CURRENT_SYSCONF in the defaults file.
> >
> > Natinst-Rally-ID: TA44427
> > Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> > Natinst-ReviewBoard-ID: 58620
> > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > ---
> ...
> > --- a/meta/recipes-core/udev/udev/udev-cache
> > +++ b/meta/recipes-core/udev/udev/udev-cache
> > @@ -23,12 +23,12 @@ if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
> >      exit 0
> >  fi
> >
> > -if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
> > +if [ "$DEVCACHE" != "" -a -e "$DEVCACHE_CURRENT_SYSCONF" ]; then
> >         [ "${VERBOSE}" != "no" ] && echo "Populating dev cache"
> >         (
> >                 tar czf "${DEVCACHE}.tmp" dev -C / --exclude=log
> >                 mv -f "${DEVCACHE}.tmp" "$DEVCACHE"
> > -               mv /dev/shm/udev.cache /etc/udev/cache.data
> > +               mv "$DEVCACHE_CURRENT_SYSCONF" "$DEVCACHE_SYSCONF"
> >         ) &
> >  fi
> >
> > diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
> > index 656c2a4..7f39a68 100644
> > --- a/meta/recipes-core/udev/udev/udev-cache.default
> > +++ b/meta/recipes-core/udev/udev/udev-cache.default
> > @@ -2,4 +2,8 @@
> >
> >  # Comment this out to disable device cache
> >  DEVCACHE="/etc/udev-cache.tar.gz"
> > +
> > +DEVCACHE_SYSCONF="/etc/udev/cache.data"
> > +DEVCACHE_CURRENT_SYSCONF="/dev/shm/udev.cache"
> > +
> >  PROBE_PLATFORM_BUS="yes"
> > --
> 
> Most users won't need to change this so I think this should have a
> default value in the script and don't be added in the default.
> 

My concern is that the uses of both DEVCACHE_SYSCONF and
DEVCACHE_CURRENT_SYSCONF are split across two script files: udev/init
and udev/udev-cache.  I don't like replicating the same default setting
in both, but if that's preferable to adding it in the default, that's
OK.

Ben


> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

