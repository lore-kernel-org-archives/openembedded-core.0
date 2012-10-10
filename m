Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TLkju-0005SN-Vc
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 03:05:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Oct 2012 17:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,562,1344236400"; d="scan'208";a="231973778"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by fmsmga001.fm.intel.com with ESMTP; 09 Oct 2012 17:52:25 -0700
Message-ID: <1349830345.19865.27.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 09 Oct 2012 19:52:25 -0500
In-Reply-To: <1349791928.19865.6.camel@empanada>
References: <cover.1349770454.git.kai.kang@windriver.com>
	<5638b12dc40290cff09fc211d14b472ef7c2c8c0.1349770454.git.kai.kang@windriver.com>
	<1349788232.15658.173.camel@ted> <1349791928.19865.6.camel@empanada>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl: fix @INC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 01:06:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-09 at 09:12 -0500, Tom Zanussi wrote:
> On Tue, 2012-10-09 at 14:10 +0100, Richard Purdie wrote:
> > On Tue, 2012-10-09 at 16:32 +0800, Kang Kai wrote:
> > > perl @INC path includes native perl modules path. When run "perl -V",
> > > the output at the end is something like:
> > >   @INC:
> > >     /etc/perl
> > >     /usr/lib/perl/site_perl/5.14.2/
> > >     /usr/lib/perl/site_perl/5.14.2
> > >     /usr/lib/perl/vendor_perl/5.14.2/
> > >     /usr/lib/perl/vendor_perl/5.14.2
> > >     /mnt/sda10/poky-all-platform/build-qemuppc/tmp/sysroots/qemuppc/usr/lib/perl/5.14.2/
> > >     /usr/lib/perl/5.14.2
> > >     /usr/local/lib/site_perl
> > >     /usr/lib/perl/5.14.2
> > >     .
> > > 
> > > And this is caused by commit aeca6512f3a5468b8f65e2986024ab07d2ce45b4.
> > > Because the native path is compiled into libperl.so that sed in
> > > perl_package_preprocess() could NOT remove it. So revert the commit.
> > > 
> > > [Yocto #3099]
> > > 
> > > Signed-off-by: Kang Kai <kai.kang@windriver.com>
> > > ---
> > >  meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
> > > index 0d4ca1c..dbfabb5 100644
> > > --- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
> > > +++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
> > > @@ -68,7 +68,7 @@ api_version='14'
> > >  api_versionstring='5.14.0'
> > >  ar='ar'
> > >  archlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
> > > -archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
> > > +archlibexp='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
> > >  archname64=''
> > >  archname='@ARCH@-thread-multi'
> > >  archobjs=''
> > 
> > I dislike fixing one bug at the expense of breaking another.
> > 
> > Tom,
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=aeca6512f3a5468b8f65e2986024ab07d2ce45b4
> > 
> > Any comments on this? How could we test the issue you originally fixed?
> > 
> 
> The original purpose of that commit was to allow the perf build to use
> ExtUtils::Embed to build the Perl language bindings for 'perf script'.
> 
> perl_package_preprocess() was (I thought) supposed to prevent the
> settings in config.sh from making it to the target - I'll have to look
> into why they do for libperl.so.
> 

I just submitted a patchset that gets rid of the @INC problem while
still allowing perf scripting to work (rather than exiting with a
'scripting not supported' message).

Tom

> Tom
> 
> > Cheers,
> > 
> > Richard
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 




