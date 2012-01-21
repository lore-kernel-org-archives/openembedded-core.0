Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RokRq-0003NF-NT
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 00:34:15 +0100
Received: by iabz21 with SMTP id z21so3032053iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 15:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=yFZMoVZ9VkYlXpsxaQ5xWD28NOE+CZ3WeL1FeAdX8Vg=;
	b=rLfAtFu9yIxW/6rHkcmcHDm6eHWZxDy3gYfqc/hg3zqxD19kXe5t7FRGUKqTHUw2gd
	RBa6Zwyy2mdaJnQXDtwCtGtrWoV3lpVjfJtNcepD/fbB17fOvYndo3cAIiJYPCripnGL
	qXrGg0Zxnr+A3E6eW21VoFbBciD7yIWytrRqs=
Received: by 10.50.184.168 with SMTP id ev8mr3738859igc.29.1327188391417;
	Sat, 21 Jan 2012 15:26:31 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id gh7sm13604016igb.1.2012.01.21.15.26.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 15:26:29 -0800 (PST)
Date: Sat, 21 Jan 2012 15:26:25 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120121232625.GB12691@sakrah.homelinux.org>
References: <cover.1325725256.git.nitin.a.kamble@intel.com>
	<aa69250b08b446ad0408357587a0271a66684f12.1325725256.git.nitin.a.kamble@intel.com>
	<521a1d1e78e4e797ce9c1787c83d8e0b2020281e.1325725256.git.nitin.a.kamble@intel.com>
	<CAMKF1srE2FO8iY0x0UvzYCKEosWV79VomhkovmLUUjXgU19dew@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C014F9D@ORSMSX106.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C014F9D@ORSMSX106.amr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/4] libxxf86dga: fix compilation with x32 toolchain
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
X-List-Received-Date: Sat, 21 Jan 2012 23:34:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (06/01/12 18:27), Kamble, Nitin A wrote:
> 
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Khem Raj
> > Sent: Thursday, January 05, 2012 12:49 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 3/4] libxxf86dga: fix compilation with
> > x32 toolchain
> > 
> > On Wed, Jan 4, 2012 at 5:02 PM,  <nitin.a.kamble@intel.com> wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > Fix type conversion for x32. For x32 the off_t is 64bit and pointers
> > are
> > > 32bit.
> > > so the conversion of pointer to off_t was resulting into this error:
> > >
> > > | XF86DGA2.c:931:24: error: cast from pointer to integer of different
> > > size [-Werror=pointer-to-int-cast]
> > > | cc1: some warnings being treated as errors
> > > |
> > > | make[2]: *** [XF86DGA2.lo] Error 1
> > >
> > > Fixed it by typecasting pointer into unsigned long 1st and then again
> > > typecasting unsigned long to off_t.
> > >
> > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > ---
> > >  .../libxxf86dga-1.1.2_fix_for_x32.patch            |   30
> > ++++++++++++++++++++
> > >  .../recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb |    5 ++-
> > >  2 files changed, 34 insertions(+), 1 deletions(-)
> > >  create mode 100644 meta/recipes-graphics/xorg-
> > lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch
> > >
> > > diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-
> > 1.1.2_fix_for_x32.patch b/meta/recipes-graphics/xorg-
> > lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch
> > > new file mode 100644
> > > index 0000000..30692ad
> > > --- /dev/null
> > > +++ b/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-
> > 1.1.2_fix_for_x32.patch
> > > @@ -0,0 +1,30 @@
> > > +Upstream-Status: pending
> > > +
> > > +Fix type conversion for x32. For x32 the off_t is 64bit and pointers
> > are 32bit.
> > > +so the conversion of pointer to off_t was resulting into this error:
> > > +
> > > +| XF86DGA2.c:931:24: error: cast from pointer to integer of
> > different size [-Werror=pointer-to-int-cast]
> > > +| cc1: some warnings being treated as errors
> > > +|
> > > +| make[2]: *** [XF86DGA2.lo] Error 1
> > > +
> > > +Fixed it by typecasting pointer into unsigned long 1st and then
> > again typecasting
> > > +unsigned long to off_t.
> > 
> > where is pointer here ?
> > http://cvsweb.xfree86.org/cvsweb/xc/lib/Xxf86dga/XF86DGA2.c?rev=1.30&co
> > ntent-type=text/vnd.viewcvs-markup
> > shows that base is of type mmapOffset which is
> > 
> > #if !defined(_LP64) && defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS
> > == 64)
> > typedef unsigned long long mmapOffset;
> > #else
> > typedef unsigned long      mmapOffset;
> > #endif
> > 
> > and off_t is typedef'ed to long int
> > 
> Khem,
> base is char * as seen in the changed file src/XF86DGA2.c:
> static Bool
> DGAMapPhysical(
>    int screen,
>    char *name,                  /* optional device name */
>    unsigned char* base,         /* physical memory */
>    CARD32 size,                 /* size */
>    CARD32 offset,               /* optional offset */
>    CARD32 extra,                /* optional extra data */
>    DGAMapPtr pMap
> ) {
> 

is that a local change ?

> Nitin
> 
> > > +
> > > +Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > +2012/01/04
> > > +
> > > +
> > > +Index: libXxf86dga-1.1.2/src/XF86DGA2.c
> > > +===================================================================
> > > +--- libXxf86dga-1.1.2.orig/src/XF86DGA2.c      2010-10-06
> > 21:17:11.000000000 -0700
> > > ++++ libXxf86dga-1.1.2/src/XF86DGA2.c   2012-01-04 14:21:36.275971172
> > -0800
> > > +@@ -928,7 +928,7 @@ DGAMapPhysical(
> > > +     if ((pMap->fd = open(name, O_RDWR)) < 0)
> > > +       return False;
> > > +     pMap->virtual = mmap(NULL, size, PROT_READ | PROT_WRITE,
> > > +-                      MAP_FILE | MAP_SHARED, pMap->fd,
> > (off_t)base);
> > > ++                      MAP_FILE | MAP_SHARED, pMap->fd,
> > (off_t)(unsigned long)base);
> > > +     if (pMap->virtual == (void *)-1)
> > > +       return False;
> > > +     mprotect(pMap->virtual, size, PROT_READ | PROT_WRITE);
> > > diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
> > b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
> > > index 8e777c3..9a1c96f 100644
> > > --- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
> > > +++ b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
> > > @@ -8,7 +8,10 @@ allows relative mouse reporting, et al.  It is
> > mainly used by games and \
> > >  emulators for games."
> > >
> > >  DEPENDS += "libxext xf86dgaproto"
> > > -PR = "r1"
> > > +PR = "r2"
> > > +
> > > +SRC_URI += "file://libxxf86dga-1.1.2_fix_for_x32.patch"
> > > +
> > >  PE = "1"
> > >
> > >  XORG_PN = "libXxf86dga"
> > > --
> > > 1.7.6.4
> > >
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


