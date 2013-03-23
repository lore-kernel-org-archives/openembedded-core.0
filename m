Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UJSZ6-0007A9-3R
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 18:49:18 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Mar 2013 10:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,897,1355126400"; d="scan'208";a="275001045"
Received: from unknown (HELO helios.localnet) ([10.255.13.143])
	by azsmga001.ch.intel.com with ESMTP; 23 Mar 2013 10:32:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sat, 23 Mar 2013 17:32:11 +0000
Message-ID: <8581719.do5prz68m2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1364054720.3097.27.camel@ted>
References: <cover.1363981980.git.paul.eggleton@linux.intel.com>
	<d6c0028803399294e9eb24cd598a2edf65bbcfbf.1363981980.git.paul.eggleton@linux.intel.com>
	<1364054720.3097.27.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/buildhistory: implement history collection for SDKs
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
X-List-Received-Date: Sat, 23 Mar 2013 17:49:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 23 March 2013 16:05:20 Richard Purdie wrote:
> On Fri, 2013-03-22 at 19:53 +0000, Paul Eggleton wrote:
> > SDKs are constructed in a similar manner to images, and the contents can
> > be influenced by a number of different factors, thus tracking the
> > contents of produced SDKs when buildhistory is enabled can help detect
> > the same kinds of issues as with images.
> > 
> > This required adding POPULATE_SDK_POST_HOST_COMMAND and
> > SDK_POSTPROCESS_COMMAND variables so that data collection functions can
> > be injected at the appropriate points in the SDK construction process,
> > as well as moving the list_installed_packages and
> > rootfs_list_installed_depends functions from the rootfs_{rpm,ipk,deb} to
> > the package_{rpm,ipk,deb} classes so they can also be called during
> > do_populate_sdk as well as do_rootfs.
> > 
> > Implements [YOCTO #3964].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/classes/buildhistory.bbclass      |  130
> >  ++++++++++++++++++++++---------- meta/classes/package_deb.bbclass      
> >  |   28 +++++++
> >  meta/classes/package_ipk.bbclass       |   24 ++++++
> >  meta/classes/package_rpm.bbclass       |   17 +++++
> >  meta/classes/populate_sdk_base.bbclass |    2 +
> >  meta/classes/populate_sdk_deb.bbclass  |    1 +
> >  meta/classes/populate_sdk_ipk.bbclass  |    2 +
> >  meta/classes/populate_sdk_rpm.bbclass  |    1 +
> >  meta/classes/rootfs_deb.bbclass        |   27 -------
> >  meta/classes/rootfs_ipk.bbclass        |   22 ------
> >  meta/classes/rootfs_rpm.bbclass        |   16 ----
> >  11 files changed, 165 insertions(+), 105 deletions(-)
> 
> This broke all the builds. Try setting PACKAGE_CLASSES with multiple
> entries. The order determines the exact breakage. The first class
> inherited needs to "win" but with the overlapping function names, this
> isn't the case.

I will look into this this evening.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


