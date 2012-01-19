Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rntf6-000779-MM
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 16:12:24 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 07:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="58015462"
Received: from unknown (HELO helios.localnet) ([10.252.122.198])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Jan 2012 07:04:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 15:04:34 +0000
Message-ID: <3069877.zIVnnZc8iy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326978483.2511.68.camel@ted>
References: <1326978483.2511.68.camel@ted>
MIME-Version: 1.0
Subject: Re: Buildhistory in action
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
X-List-Received-Date: Thu, 19 Jan 2012 15:12:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 January 2012 13:08:03 Richard Purdie wrote:
> If I change into tmp/buildhistory and show the last commit the result is
> included below. Since the version changed, the diff isn't as readable as
> would be ideal, however reading through it clearly shows the .a files
> moving to the staticdev packages with no unintended changes as far as I
> could tell.
> 
> One of my big worries with the staticdev changes is any unintended
> packaging changes. This lets me view the changes more precisely which
> can only lead to higher quality regression spotting for the project. I'd
> like to suggest more people start enabling this and using it to check
> the changes they're making.
> 
> I know Paul is working on tools to better display these changes too and
> those will help make these diffs easier to read.

There's the command line buildhistory-diff tool (in scripts/) already, and this
will query the git repository and report just the changes that might represent
regressions, in a form that's a bit easier to read than git diff. For example
(simulated):

paul@helios:~/poky/poky/build/tmp/buildhistory$ ~/poky/poky/scripts/buildhistory-diff . HEAD^^
Changes to images/qemux86_64/eglibc/core-image-minimal (files-in-image.txt):
  /etc/anotherpkg.conf was added
  /sbin/anotherpkg was added
  * (installed-package-names.txt):
  *   anotherpkg was added
Changes to images/qemux86_64/eglibc/core-image-minimal (installed-package-names.txt):
  anotherpkg was added
packages/qemux86_64-poky-linux/v86d: PACKAGES: added "v86d-extras"
  * PR changed from "r0" to "r1"
  * PV changed from "0.1.10" to "0.1.12"
packages/qemux86_64-poky-linux/v86d/v86d: PKGSIZE changed from 110579 to 144381 (+30%)
  * PR changed from "r0" to "r1"
  * PV changed from "0.1.10" to "0.1.12"                                                                                                                         

For those that may not be aware I'm also working on a web frontend to
view/manage these changes more effectively (utilising the same backend code),
however it still needs quite a bit of work.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


