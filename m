Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5D52B6148C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 00:40:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Nov 2013 16:36:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="410872495"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2013 16:40:31 -0800
Message-ID: <528AB37E.8000302@linux.intel.com>
Date: Mon, 18 Nov 2013 16:40:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1384305535.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/6] Misc changes relating to toolchain and image gen
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
X-List-Received-Date: Tue, 19 Nov 2013 00:40:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 05:23 PM, Mark Hatle wrote:
> A few misc fixes relating to toolchain and image generation.
>
> The first two in the set simply updated gcc to remove the -symlinks package
> in favor of update-alternatives.
>
> The next fixes an issue w/ the previous binutils patch and upgrades.
>
> Next 2 update packagegroups to make revise and use the
> packagegroup-core-buildessentials.
>
> The final patch fixes an issue w/ the image generatation.  If the
> IMAGE_INSTALL contains a dependency instead of a package name, the system
> was not able to translate it into a package.  This now works properly.
>
> Note, there is a case where an unresolvable set could be determined (rare,
> but it is possible), in this case the user would need to add whatever is
> required to fix it to the IMAGE_INSTALL.  (This could happen when 2 or more
> conflicting packages all have the same provide, but none of them are in
> the IMAGE_INSTALL line.  The system will attempt to determine which to
> use, by checking if any of them are already in the IMAGE_INSTALL -- otherwise
> it chooses the first entry.  If something else implied by a packagegroup
> chooses a different version, a conflict would be generated.)
>
> The following changes since commit 616354f13732d13c17434d5b60b166f691c25761:
>
>    binutils: Add gnu-config-native to DEPENDS (2013-11-12 16:00:20 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib mhatle/misc1
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc1
>
> Mark Hatle (6):
>    gcc: Use alternatives for the *-symlinks packages.
>    gcc: Drop *-symlinks

Mark

This change set seems to be giving the Autobuilder some issues, please 
take a look at the AB (for example: 
http://autobuilder.yoctoproject.org:8011/builders/nightly-mips/builds/1/steps/Building%20Images/logs/stdio

Thanks
	Sau!

>    binutils: Ensure old -symlinks packages get removed
>    packagegroups: Remove toolchain *-symlinks packages
>    packagegroup-self-hosted: Use packagegroup-core-buildessentials
>    package_rpm: Allow translation of requirement to package name
>
>   meta/classes/package_rpm.bbclass                   |  79 +++++++++++++++-
>   .../packagegroup-core-buildessential.bb            |   4 -
>   .../packagegroups/packagegroup-self-hosted.bb      |  16 +---
>   meta/recipes-devtools/binutils/binutils.inc        |   1 +
>   meta/recipes-devtools/gcc/gcc-target.inc           | 103 +++++++++++++--------
>   5 files changed, 141 insertions(+), 62 deletions(-)
>

