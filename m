Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsoV-0000Pp-T2
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:34:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2012 14:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="137599342"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2012 14:25:12 -0700
Message-ID: <4F9B0EB8.4000200@linux.intel.com>
Date: Fri, 27 Apr 2012 14:25:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334616144.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 00/17] Fix update-alternatives and RPM package dependencies
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
X-List-Received-Date: Fri, 27 Apr 2012 21:34:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/16/2012 03:45 PM, Mark Hatle wrote:
> It was recently noticed that many packages that use update-alternatives were
> not setting package level provides.  So a package that required /usr/bin/env
> would not be satisfied by coreutils, even though it had a /usr/bin/env
> alternative.
>
> The first patch in the series adds the enhanced alternatives capatibilities.
>
> The patches that follow resolve Yocto defect 2289 and use these new
> capabilities to ensure the produced packages are correct.
>
> (Note, this only affects RPM packages as they have enhanced dependency
> scanning and resolution compared to deb and ipk.)
>
> These patches were tested by running a core-image-minimal build on both
> qemux86 and qemumips.  I also ran a core-image-sato on qemux86 and built
> each of the items affected manually.  Once build, I verified the install
> time scriptlets were correct and each package provided the correct "Provides".
>
> The following changes since commit 03cfc6ea6df9d1fbf5520c9707a725e38d2e377b:
>
>    libzypp: add libproxy to DEPENDS (2012-04-16 23:30:41 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/upd-alt
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/upd-alt
>
The subset marked below has been merged into OE-Core, I believe that 
Richard had a concern about the moves and links that some of these other 
patches contained.

> Mark Hatle (17):
>    update-alternatives.bbclass: Ensure alternatives end up in per file
>      deps
>    coreutils_*.bb: Use update alternatives and add missing manual alt
>      links
>    coreutils_*.bb: Sync up file path with busybox and minor cleanup
>    grep: Use update-alternatives
>    openssh: Use update-alternatives
>    hdparm: Use update-alternatives
Merged
>    iputils: Use update-alternatives
>    net-tools: Use update-alternatives
Merged
>    shadow: Use update-alternatives
Merged
>    findutils: Use update-alternatives
Merged
>    gzip: Use update-alternatives class
Merged
>    module-init-tools: Update to use update-alternatives class
>    kbd: Use update-alternatives
Merged
>    console-tools: Use update-alternatives
Merged
>    sysvinit: Use update-alternatives in a different way
>    lrzsz: sz, sx and sb were linked incorrectly
Merged
>    lrzsz: Use update-alternatives to set provides
>
Thanks
	Sau!

>   meta/classes/package.bbclass                       |   16 +++--
>   meta/classes/package_rpm.bbclass                   |    4 -
>   meta/classes/update-alternatives.bbclass           |   69 +++++++++++++++++++-
>   meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |   21 +++++-
>   meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    9 ++-
>   .../console-tools/console-tools_0.3.2.bb           |   27 ++------
>   meta/recipes-core/coreutils/coreutils_6.9.bb       |   44 ++++++-------
>   meta/recipes-core/coreutils/coreutils_8.14.bb      |   49 +++++---------
>   meta/recipes-core/kbd/kbd_1.15.2.bb                |   34 ++--------
>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   44 ++++---------
>   meta/recipes-extended/findutils/findutils.inc      |    5 +-
>   .../recipes-extended/findutils/findutils_4.2.31.bb |   22 ++-----
>   meta/recipes-extended/findutils/findutils_4.4.2.bb |   17 +-----
>   meta/recipes-extended/grep/grep_2.5.1a.bb          |   25 +++-----
>   meta/recipes-extended/grep/grep_2.9.bb             |   22 ++----
>   meta/recipes-extended/gzip/gzip.inc                |   32 +++-------
>   meta/recipes-extended/gzip/gzip_1.3.12.bb          |   24 ++-----
>   meta/recipes-extended/gzip/gzip_1.4.bb             |    2 +-
>   meta/recipes-extended/hdparm/hdparm_9.39.bb        |   16 ++---
>   meta/recipes-extended/iputils/iputils_s20101006.bb |    5 +-
>   .../net-tools/net-tools_1.60-23.bb                 |   28 +++------
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   42 ++++++------
>   .../module-init-tools/module-init-tools_3.16.bb    |   35 ++++++----
>   23 files changed, 267 insertions(+), 325 deletions(-)
>


