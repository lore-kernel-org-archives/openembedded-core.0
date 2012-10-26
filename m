Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TRlMX-0008WU-KF
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 16:58:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Oct 2012 07:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="160964338"
Received: from unknown (HELO helios.localnet) ([10.252.122.111])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Oct 2012 07:44:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mihai Lindner <mihaix.lindner@linux.intel.com>
Date: Fri, 26 Oct 2012 15:44:44 +0100
Message-ID: <3432214.SFZEzFPHYM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <040de77b972b11336e88c593cf2a7571977347db.1351261721.git.mihaix.lindner@linux.intel.com>
References: <cover.1351261721.git.mihaix.lindner@linux.intel.com>
	<040de77b972b11336e88c593cf2a7571977347db.1351261721.git.mihaix.lindner@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] lsb_release: add sanity to avoid Unknown
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
X-List-Received-Date: Fri, 26 Oct 2012 14:58:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 October 2012 17:37:17 Mihai Lindner wrote:
> Check for lsb_release command (package name should be lsb-release for
> most package managers) to avoid "Unknown" Linux distributions, untested
> distro warnings and "Unknown" dir in ./sstate-cache/
> Also add lsb-release in host's software needs, Fedora and CentOS for now.
> 
> Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
> ---
>  documentation/poky.ent      | 4 ++--
>  meta/classes/sanity.bbclass | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/poky.ent b/documentation/poky.ent
> index 8e0af71..ae8e70e 100644
> --- a/documentation/poky.ent
> +++ b/documentation/poky.ent
> @@ -50,8 +50,8 @@
>  <!ENTITY OE_INIT_FILE "oe-init-build-env">
>  <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "awk wget git-core diffstat unzip
> texinfo build-essential chrpath"> <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL
> "awk make wget tar bzip2 gzip python unzip perl patch diffutils diffstat
> git -cpp gcc gcc-c++ eglibc-devel texinfo chrpath ccache">
> +cpp gcc gcc-c++ eglibc-devel texinfo chrpath ccache lsb-release">
>  <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath
> make wget diffstat texinfo python-curses"> <!ENTITY
> CENTOS_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip python unzip
> perl patch diffutils diffstat git -cpp gcc gcc-c++ glibc-devel texinfo
> chrpath">
> +cpp gcc gcc-c++ glibc-devel texinfo chrpath lsb-release">
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 3806bc5..f0cc11c 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -2,7 +2,7 @@
>  # Sanity check the users setup for common misconfigurations
>  #
> 
> -SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip
> gawk chrpath wget cpio" +SANITY_REQUIRED_UTILITIES ?= "bzip2 chrpath cpio
> diffstat gawk git gzip lsb_release makeinfo patch tar wget"
> 
>  python check_bblayers_conf() {
>      bblayers_fn = os.path.join(d.getVar('TOPDIR', True),
> 'conf/bblayers.conf')

I don't particularly like this, because on some distros LSB comes as one 
package which pulls in a whole bunch of unnecessary things for a headless 
server. I think we need an alternative fix for this for the cases where 
lsb_release is not available.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


