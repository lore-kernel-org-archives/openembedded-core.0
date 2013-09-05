Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 88AAB615F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 03:33:00 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Sep 2013 20:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,843,1371106800"; d="scan'208";a="291006620"
Received: from unknown (HELO [10.255.14.80]) ([10.255.14.80])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2013 20:33:01 -0700
Message-ID: <1378351981.14029.50.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 04 Sep 2013 20:33:01 -0700
In-Reply-To: <CAP9ODKoZKArHD5+bTGwLrdNoa7DE+RWTOO7A_pVtPNevaz8sWg@mail.gmail.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAP9ODKoZKArHD5+bTGwLrdNoa7DE+RWTOO7A_pVtPNevaz8sWg@mail.gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 03:33:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-04 at 21:54 -0300, Otavio Salvador wrote:
> On Wed, Sep 4, 2013 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> > As part of pulling in the more generic components of the meta-intel
> > xserver infrastructure, include the configure and install appends from
> > the meta-intel version of xorg-driver-common.
> >
> > Modify the configure prepend to use ${S} in the paths explicitly as
> > without this the script appears to be running in a build/ directory
> > instead of the source directory, and cannot find the configure.ac.
> > This prepend is required for at least the -intel and -mga drivers.
> >
> > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  .../xorg-driver/xorg-driver-common.inc             |   17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > index 5f5d282..2d4f2ce 100644
> > --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> > @@ -5,7 +5,7 @@ SECTION = "x11/drivers"
> >  LICENSE = "MIT-X"
> >
> >  PE = "2"
> > -INC_PR = "r21"
> > +INC_PR = "r22"
> 
> This is need because you had a PRINC?
> 

It is my understanding that this change will ensure recipes including
this file will get rebuilt after this patch is merged and will get the
updated install append, clearing the .la files.

Yes/No?

Thanks for the review,

Darren

> >  DEPENDS = "virtual/xserver xproto randrproto util-macros"
> >
> > @@ -39,3 +39,18 @@ def add_abi_depends(d, name):
> >
> >      pn = d.getVar("PN", True)
> >      d.appendVar('RDEPENDS_' + pn, ' ' + abi)
> > +
> > +# AC_CHECK_FILE doesn't work when cross compiling, so we create a replacement
> > +# macro that simply assumes the test succeeds. This is required for at least
> > +# the -intel and -mga drivers.
> > +do_configure_prepend () {
> > +       echo 'AC_DEFUN(CC_AC_CHECK_FILE, $2)' > ${S}/configure.ac.new
> > +       sed 's/AC_CHECK_FILE/CC_AC_CHECK_FILE/g' ${S}/configure.ac >> ${S}/configure.ac.new
> > +       mv ${S}/configure.ac.new ${S}/configure.ac
> > +}
> > +
> > +# FIXME: We don't want to include the libtool archives (*.la) from modules
> > +# directory, as they serve no useful purpose. Upstream should fix Makefile.am
> > +do_install_append() {
> > +       find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
> > +}
> 
> Agreed.
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



