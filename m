Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgeIS-0004X6-Qa
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 17:27:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Dec 2012 08:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="229883117"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2012 08:13:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 06 Dec 2012 16:13:07 +0000
Message-ID: <3896317.iJW1Gi8Xv1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1354807886.12928.9.camel@ted>
References: <cover.1354650148.git.mark.hatle@windriver.com>
	<04747ce39a3fbbd538556c67247452b931a3ccc5.1354650148.git.mark.hatle@windriver.com>
	<1354807886.12928.9.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] classes/*_rpm: integrate Smart into RPM filesystem construction
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
X-List-Received-Date: Thu, 06 Dec 2012 16:27:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 December 2012 15:31:26 Richard Purdie wrote:
> On Tue, 2012-12-04 at 13:49 -0600, Mark Hatle wrote:
> > From: Paul Eggleton <paul.eggleton@linux.intel.com>
> > 
> > Use Smart to construct the root filesystem for images and the contents
> > of SDKs rather than the custom scripts around rpm we had previously.
> > This ensures the result when producing an updated image will be the
> > same as upgrading to the same package versions from an older image on
> > the target, as well as allowing us to remove a substantial amount of
> > code making the rpm classes much easier to follow.
> > 
> > Some bugfixes from Bogdan Marinescu <bogdan.marinescu@intel.com>.
> > SDK implementation and testing as well as a number of bugfixes from
> > Mark Hatle <mark.hatle@windriver.com>.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > ---
> > 
> >  meta/classes/package_rpm.bbclass      |  533
> >  ++++++--------------------------- meta/classes/populate_sdk_rpm.bbclass
> >  |   48 +---
> >  meta/classes/rootfs_rpm.bbclass       |   31 +-
> >  3 files changed, 117 insertions(+), 495 deletions(-)
> > 
> > diff --git a/meta/classes/package_rpm.bbclass
> > b/meta/classes/package_rpm.bbclass index 200a941..aa5b156 100644
> > --- a/meta/classes/package_rpm.bbclass
> > +++ b/meta/classes/package_rpm.bbclass
> > @@ -8,6 +8,8 @@ RPMBUILD="rpmbuild"
> > 
> >  PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
> >  PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
> > 
> > +EXTRANATIVEPATH += "python-native"
> > +
> 
> Er, no!
> 
> Why do we need to do this? We now need python-native at package
> generation time? Why?

Sorry, I meant to come back to this before submitting; the reason I added it 
was so that smart can find its python modules that get installed into the 
native sysroot (which I was surprised to find that the setup did not allow it 
to do out of the box, frankly). I'm sure there is a much better way to handle 
this though - we only actually need the path to be accessible within 
do_rootfs.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


