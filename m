Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SwRAt-0000hl-JT
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 07:08:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Jul 2012 21:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175565599"
Received: from unknown (HELO [10.252.121.69]) ([10.252.121.69])
	by azsmga001.ch.intel.com with ESMTP; 31 Jul 2012 21:57:07 -0700
Message-ID: <5018B722.7040809@intel.com>
Date: Wed, 01 Aug 2012 07:57:06 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
	<C6510F6D410BB64A8C15398EDC6B847C46ABCF1E@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C46ABCF1E@ORSMSX101.amr.corp.intel.com>
Subject: Re: [PATCH v2 0/6] relocatable SDK
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
X-List-Received-Date: Wed, 01 Aug 2012 05:08:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Jessica,

The patches sent to the list were applied against oe-core, not poky. So
that they can be easily applied. You can, however, cherry-pick the
patches into the poky/master.

Thanks,
Laurentiu

On 07/31/2012 09:41 PM, Zhang, Jessica wrote:
> Hi Laurentiu,
> 
> Seems there's some issue with your branch.  I cloned it and when I tried to do source oe-init-build-env, it complains the bitbake directory doesn't existing which is true and there're whole bunch of other directories also missing.  Can you take a look since I want to do some testing against it regarding relocatable SDK feature?
> 
> Thanks,
> Jessica
> 
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Laurentiu Palcu
> Sent: Tuesday, July 31, 2012 1:50 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2 0/6] relocatable SDK
> 
> Changes in v2:
>         - addressed Saul's comments: added Upstream-Status for patches, signed-off-by
>           and patches description;
>         - addressed Philip's comment about default installation directory: now the
>           default installation directory is the same as SDKPATH variable;
>         - added patch for eglibc-2.16;
> 
> 
> Hi,
> 
> This patchset adds relocatable SDK functionality. Instead of a tarball, the output of "bitbake meta-toolchain/meta-toolchain-sdk" will be a self extracting archive.
> 
> The user will then execute the .sh script and give it the target directory for SDK installation (default is /opt/poky). The installer will then extract the embedded tarball to the user provided location and will set up the
> SDK: change the paths in the environment script, change the dynamic loader path in all binaries and, also, change the ls.so.cache path in the dynamic loader itself, together with the SYSDIR paths/lengths.
> 
> With that, no more root privileges are needed in order to install the SDK.
> 
> Thanks,
> Laurentiu
> 
> The following changes since commit e12df2ca5c71ad672ebbfefbc47cabbac3333d61:
> 
>   lib/oe/lsb.py: Map unknown distributions to 'Unknown' (2012-07-31 08:01:28 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib lpalcu/relocatable_sdk
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/relocatable_sdk
> 
> Laurentiu Palcu (6):
>   eglibc: relocatable SDK changes
>   binutils: relocatable SDK: change PT_INTERP section size
>   scripts: add script for relocating the SDK
>   populate_sdk_base.bbclass: create self-extracting archive
>   relocatable.bbclass: split it up, to reuse code
>   package.bbclass: change RPATHs for nativesdk packages
> 
>  meta/classes/chrpath.bbclass                       |   89 +++++++++
>  meta/classes/package.bbclass                       |    5 +
>  meta/classes/populate_sdk_base.bbclass             |   86 +++++++++
>  meta/classes/relocatable.bbclass                   |   91 +--------
>  .../eglibc/eglibc-2.15/relocatable_sdk.patch       |   81 ++++++++
>  .../eglibc/eglibc-2.16/relocatable_sdk.patch       |  108 +++++++++++
>  meta/recipes-core/eglibc/eglibc_2.15.bb            |    6 +-
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    6 +-
>  .../binutils/binutils-crosssdk_2.22.bb             |    5 +
>  .../binutils/binutils/relocatable_sdk.patch        |   22 +++
>  scripts/relocate_sdk.py                            |  200 ++++++++++++++++++++
>  11 files changed, 606 insertions(+), 93 deletions(-)  create mode 100644 meta/classes/chrpath.bbclass  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
>  create mode 100755 scripts/relocate_sdk.py
> 
> --
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


