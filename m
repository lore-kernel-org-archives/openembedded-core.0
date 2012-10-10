Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TLxSs-0000XP-0l
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 16:40:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Oct 2012 07:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,564,1344236400"; d="scan'208";a="232997169"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by fmsmga002.fm.intel.com with ESMTP; 10 Oct 2012 07:27:39 -0700
Message-ID: <1349879259.19865.42.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Oct 2012 09:27:39 -0500
In-Reply-To: <1349878484.15658.220.camel@ted>
References: <cover.1349829329.git.tom.zanussi@intel.com>
	<1349878484.15658.220.camel@ted>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] perl: fix @INC, v2
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
X-List-Received-Date: Wed, 10 Oct 2012 14:40:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-10 at 15:14 +0100, Richard Purdie wrote:
> On Tue, 2012-10-09 at 19:48 -0500, tom.zanussi@intel.com wrote:
> > From: Tom Zanussi <tom.zanussi@intel.com>
> > 
> > This fixes the bug reported by Kang Kai in a way that allows
> > perf scripting to continue to work.
> > 
> > Before this patch, @INC on the target would contain a native path:
> > 
> >    @INC:
> >      /etc/perl
> >      /usr/lib/perl/site_perl/5.14.2/
> >      /usr/lib/perl/site_perl/5.14.2
> >      /usr/lib/perl/vendor_perl/5.14.2/
> >      /usr/lib/perl/vendor_perl/5.14.2
> >      /mnt/sda10/poky-all-platform/build-qemuppc/tmp/sysroots/qemuppc/usr/lib/perl/5.14.2/
> >      /usr/lib/perl/5.14.2
> >      /usr/local/lib/site_perl
> >      /usr/lib/perl/5.14.2
> >      .
> > 
> > Kang Kai's patch reverted the problem that caused the native path
> > to appear, but also caused perf to report that scripting wasn't
> > supported.
> > 
> > With this patchset, the native path is gone:
> > 
> >   Built under linux
> >   Compiled at Oct  9 2012 18:40:15
> >   @INC:
> >     /etc/perl
> >     /usr/lib/perl/site_perl/5.14.2/
> >     /usr/lib/perl/site_perl/5.14.2
> >     /usr/lib/perl/vendor_perl/5.14.2/
> >     /usr/lib/perl/vendor_perl/5.14.2
> >     /usr/lib/perl/5.14.2/
> >     /usr/lib/perl/5.14.2
> >     /usr/local/lib/site_perl
> >     /usr/lib/perl/5.14.2
> >     .
> > 
> > and the perf Perl binding continues to work:
> > 
> > root@crownbay:~# perf script rwtop
> > 
> > read counts by pid:
> > 
> >    pid                  comm     # reads   bytes_req  bytes_read
> > ------  --------------------  ----------  ----------  ----------
> >   1524  perf                        5629      213712      213648
> >   1508  dropbear                       8      131000         607
> > 
> > write counts by pid:
> > 
> >    pid                  comm    # writes  bytes_written
> > ------  --------------------  ----------  -------------
> >   1522  perf                          11         845320
> >   1508  dropbear                       8            944
> > 
> > Tested on qemux86 and crownbay.
> > 
> > The following changes since commit 2c3e8280e67721d42d4be48a8e2c1e9ce9bb89fd:
> > 
> >   bitbake: hob/imageconfigurationpage: a 'hob-image' appears listed in the base image combo box (2012-10-08 16:23:34 +0100)
> > 
> > are available in the git repository at:
> > 
> >   git://git.yoctoproject.org/poky-contrib.git tzanussi/bug-3099-fix
> >   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/bug-3099-fix
> > 
> > Tom Zanussi (2):
> >   perl: add archlib_exp variable used to generate ARCHLIB_EXP in
> >     config.h
> >   perl: use archlib_exp config.sh variable
> 
> I've taken these but I didn't like them being two commits, or the lack
> of information in the patch header. I therefore tweaked it before
> applying.
> 

OK, thanks, sorry to miss those things, will keep it in mind for next
time...

Tom

> Cheers,
> 
> Richard
> 




