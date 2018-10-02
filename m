Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 484EE7944A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 21:19:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2018 14:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,333,1534834800"; d="scan'208";a="85235645"
Received: from hgpavank-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.79.21])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2018 14:19:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 03 Oct 2018 10:19:00 +1300
Message-ID: <1845499.TvibjpggTz@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CAMKF1sq4xUqHtSVOB_C8Gt6Op_6MNmjrxxEzGTtC5R1eoT4MPw@mail.gmail.com>
References: <20181002191136.8792-1-raj.khem@gmail.com>
	<CAJTo0LaN2cjd6o67epNgi0+8g1VE+1GnLCGdYDVsFLj01b_Oww@mail.gmail.com>
	<CAMKF1sq4xUqHtSVOB_C8Gt6Op_6MNmjrxxEzGTtC5R1eoT4MPw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: Disable asm on musl
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
X-List-Received-Date: Tue, 02 Oct 2018 21:19:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Can we have bit more detail in the commit message about what the issues are? 
We're not supposed to rely solely on a bug report reference to do that; also 
if it's considered a workaround and we're working with upstream to fix it, the 
commit message should state that as well.

Thanks
Paul

On Wednesday, 3 October 2018 8:37:10 AM NZDT Khem Raj wrote:
> I think it is. The way th calls are set for performance reasons seems to be
> causing this
> Ideally we should ensure to use right dialect for  tls calls I think musl
> is exposing a bug in Mesa
> Which we covered by disabling tls in Glx once we disable that then this
> problem pops up so we disable ASM
> 
> So this is a workaround until then
> 
> On Tue, Oct 2, 2018 at 12:28 PM Burton, Ross <ross.burton@intel.com> wrote:
> 
> > Isn't this a bit overkill?  Is the assembler actually broken?
> >
> > Ross
> > On Tue, 2 Oct 2018 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > some unknown part of mesa's x86 assembly
> > > code is broken by readonly text segments
> > >
> > > [ YOCTO #12918 ]
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> > b/meta/recipes-graphics/mesa/mesa.inc
> > > index 8d0e2cb67c..e6f3712706 100644
> > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > @@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] =
> > "--enable-${OSMESA},--disable-${OSMESA}"
> > >  PACKAGECONFIG[unwind] =
> > "--enable-libunwind,--disable-libunwind,libunwind"
> > >
> > >  EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
> > > -EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
> > > +EXTRA_OECONF_append_libc-musl = " --disable-asm --disable-glx-tls"
> > >  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> > >  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
> > >
> > > --
> > > 2.19.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> 


-- 

Paul Eggleton
Intel Open Source Technology Centre



