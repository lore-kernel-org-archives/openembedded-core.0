Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZgSa-0003hT-Jo for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 11:44:28 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZgP8-0004lQ-PU
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 11:40:55 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D6A3E0A9@shsmsx501.ccr.corp.intel.com>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
	<1308743075.21613.82.camel@phil-desktop>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6A3E0A9@shsmsx501.ccr.corp.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 23 Jun 2011 10:40:49 +0100
Message-ID: <1308822049.21613.128.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Thu, 23 Jun 2011 09:44:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 12:08 +0800, Xu, Dongxiao wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Phil Blundell
> > Sent: Wednesday, June 22, 2011 7:45 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale handling from libc
> > recipe.
> > 
> > I still don't quite understand why the virtual/libiconv provider has moved from
> > eglibc to eglibc-locale.  Can you explain what's going on there?
> 
> Generally, the purpose of this patch is to reduce eglibc's do_package time.
> 
> Since many other recipes' do_package have dependency on eglibc's do_package, thus the sooner eglibc could finish its do_package, the ealier can other do_packages be executed, which improves the parallelism. 
> 
> From our study, we found most of eglibc's do_package time is used to handle locale. Therefore we split all the locale related stuffs into a separately recipe eglibc-locale.

Yes, I understand that.  But I don't think this answers the question
about why, specifically, glibc-locale is now PROVIDEing
virtual/libiconv.  Does that recipe, in fact, implement libiconv?

p.

> 
> Thanks,
> Dongxiao
> 
> > 
> > p.
> > 
> > On Wed, 2011-06-22 at 17:01 +0800, Dongxiao Xu wrote:
> > > *libc's do_package will cost a lot of time due to the locale handing,
> > > which may delay the other recipe's do_package task and affect the
> > > build performance.
> > >
> > > This commit moves locale handling into a separate recipe *libc-locale.
> > >
> > > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > > ---
> > >  meta/classes/libc-common.bbclass                   |   23 ++++++++
> > >  meta/classes/libc-package.bbclass                  |   24 --------
> > >  meta/conf/distro/include/tclibc-eglibc.inc         |    2 +-
> > >  meta/conf/distro/include/tclibc-glibc.inc          |    2 +-
> > >  meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    4 ++
> > >  meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |   58
> > ++++++++++++++++++++
> > >  meta/recipes-core/eglibc/eglibc-package.inc        |   32 +----------
> > >  meta/recipes-core/eglibc/eglibc.inc                |    4 +-
> > >  meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++
> > >  meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |    4 ++
> > >  meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   50
> > +++++++++++++++++
> > >  meta/recipes-core/glibc/glibc-package.inc          |   29 ++---------
> > >  meta/recipes-core/glibc/glibc.inc                  |    2 +-
> > >  meta/recipes-core/glibc/glibc_2.10.1.bb            |   12 ++++
> > >  .../meta/external-csl-toolchain_2008q3-72.bb       |    1 +
> > >  15 files changed, 176 insertions(+), 83 deletions(-)  create mode
> > > 100644 meta/classes/libc-common.bbclass  create mode 100644
> > > meta/recipes-core/eglibc/eglibc-locale_2.13.bb
> > >  create mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb
> > >
> > > diff --git a/meta/conf/distro/include/tclibc-eglibc.inc
> > > b/meta/conf/distro/include/tclibc-eglibc.inc
> > > index a4c648e..90de04f 100644
> > > --- a/meta/conf/distro/include/tclibc-eglibc.inc
> > > +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> > > @@ -10,7 +10,7 @@ TARGET_OS_powerpc =
> > > "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
> > >  # Add glibc overrides to the overrides for eglibc.
> > >  OVERRIDES .= ":libc-glibc"
> > >
> > > -PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
> > > +PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc-locale"
> > >  PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "eglibc-nativesdk"
> > >  PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
> > >  PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
> > > diff --git a/meta/conf/distro/include/tclibc-glibc.inc
> > > b/meta/conf/distro/include/tclibc-glibc.inc
> > > index e5843b0..748c23f 100644
> > > --- a/meta/conf/distro/include/tclibc-glibc.inc
> > > +++ b/meta/conf/distro/include/tclibc-glibc.inc
> > > @@ -10,7 +10,7 @@ TARGET_OS_powerpc =
> > > "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
> > >  # Add glibc to the overrides.
> > >  OVERRIDES =. "libc-glibc:"
> > >
> > > -PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
> > > +PREFERRED_PROVIDER_virtual/libiconv ?= "glibc-locale"
> > >  PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "glibc-nativesdk"
> > >  PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
> > >  PREFERRED_PROVIDER_virtual/libc ?= "glibc"
> > 
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




