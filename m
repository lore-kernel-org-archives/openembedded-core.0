Return-Path: <paul.eggleton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1996074883
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 00:54:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 17:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,403,1517904000"; d="scan'208";a="47757264"
Received: from danayien-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.66.143])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2018 17:54:54 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: Enrico Jorns <ejo@pengutronix.de>
Date: Wed, 04 Apr 2018 12:54:50 +1200
Message-ID: <8233854.dOQLvdub4O@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1522794045.11431.272.camel@linuxfoundation.org>
References: <20180120234441.18217-1-ejo@pengutronix.de>
	<1522794045.11431.272.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: uol@pengutronix.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: fix do_unpack[cleandirs] varflag handling
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
X-List-Received-Date: Wed, 04 Apr 2018 00:54:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 4 April 2018 10:20:45 AM NZST Richard Purdie wrote:
> On Sun, 2018-01-21 at 00:44 +0100, Enrico Jorns wrote:
> > As introduced by a56fb90dc3805494eeaf04c60538425e8d52efc5 ('base.bbclass
> > wipe ${S} before unpacking source') the base.bbclass uses a python
> > anonymous function to set the 'do_unpack' varflag 'cleandirs' to either
> > '${S}' or '${S}/patches' depending on equality of '${S}' and '${WORKDIR}'.
> > 
> > Not that this only differs from the way almost all other recipes set or
> > modify a tasks 'cleandirs' flag, it also has a significant impact on the
> > kernel.bbclass (and possibly further ones) and causes incorrect
> > behavior for rebuilds triggered by source modification, e.g. by a change
> > of the defconfig file for a kernel build.
> > 
> > The kernel.bbclass tries to extend do_unpack[cleandirs]:
> > 
> > > 
> > > do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} $
{STAGING_KERNEL_BUILDDIR}"
> > As python anonymous functions are evaluated at the very end of recipe
> > parsing, the d.setVarFlag('do_unpack', 'cleandirs', '${S}') statement in
> > base.bbclass will overwrite every modification to cleandirs that is done
> > as shown for the kernel class above.
> > 
> > As a result of this, a change to a kernels 'defconfig' will lead to an
> > updated defconfig file in ${WORKDIR}, but as ${B} never gets cleaned and
> > ${B}/.config still exists, it will not be copied to ${B}/.config and
> > thus not find its way in the build kernel.
> > 
> > This is a severe issue for the kernel development and build process!
> > 
> > This patch changes setting of the cleandirs varflag in base.bbclass to
> > a simple variable assignment as almost all other recipes do it. This now
> > again allows overwriting or appending the varflag with common methods
> > such as done in kernel.bbclass.
> > 
> > This issue affects morty, pyro, rocko and master.
> > 
> > Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> > ---
> >  meta/classes/base.bbclass | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index 912e81e002..2949b074d8 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -152,12 +152,8 @@ python base_do_fetch() {
> >  addtask unpack after do_fetch
> >  do_unpack[dirs] = "${WORKDIR}"
> >  
> > -python () {
> > -    if d.getVar('S') != d.getVar('WORKDIR'):
> > -        d.setVarFlag('do_unpack', 'cleandirs', '${S}')
> > -    else:
> > -        d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}', 
'patches'))
> > -}
> > +do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != 
d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
> > +
> >  python base_do_unpack() {
> >      src_uri = (d.getVar('SRC_URI') or "").split()
> >      if len(src_uri) == 0:
> 
> I have tried to add this and it breaks oe-selftest devtool tests:
> 
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/964/steps/
Running%20oe-selftest/logs/stdio
> 
> You can probably reproduce by running:
> 
> oe-selftest -r devtool.DevtoolTests
> 
> I have no idea why its doing that but it can't merge until we get to
> the bottom of why this is happening. I suspect this is why we've never
> merged the patch but we've never quite tracked down the patch causing
> the regressions and reported back until now, sorry.
> 
> One alternative to you patch may be to use d.appendVarFlag in the
> anonymous python. I've not tested if that causes any problem with
> devtool.

So the issue is that devtool uses the externalsrc class, and the code in that 
class tries to ensure that whatever cleandirs is set to doesn't result in the 
user's source tree being trashed. It does so in a manner that avoids 
prematurely expanding the value, but unfortunately it does not currently 
handle expressions such as the ones this patch is setting, and as a result the 
potentially user modified source tree does in fact get deleted, which needless 
to say is quite bad :(

I am testing a fix locally which we should apply regardless of whether or not 
this patch goes in, since it will improve the safety of people's source trees 
with externalsrc. However before I can send it I'm still dealing with another 
possibly unrelated (not yet fully investigated) issue that prevents the 
devtool.DevtoolTests.test_devtool_buildclean oe-selftest test from passing.

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre



