Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBpk-0005fb-QL
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:36:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2012 15:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="210082884"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2012 15:23:43 -0700
Message-ID: <505CE8EE.5030703@linux.intel.com>
Date: Fri, 21 Sep 2012 15:23:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1347976732.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1347976732.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] opkg svn: respect to the arch priority
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
X-List-Received-Date: Fri, 21 Sep 2012 22:36:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 08:25 AM, Robert Yang wrote:
> After the discussion, this seems a proper solution:
>
> Let the arch priority win the higher version by default, and add an
> option (--select-higher-version) for it to make the higher version win
> the arch priority, so that the user can have another choice.
>
> This is only for opkg_svn.bb, maybe the opkg_0.1.8.bb should be removed
> since it does work on the master branch:
> - It doesn't support the "--force_postinstall" option which is used by
>    package_ipk.bbclass.
>
> - It still doesn't work after remove the "--force_postinstall" option,
>    it can't install the packages in complementary_pkgs.txt, I haven't
>    found out the reason.
>
>    I'd like to remove it.
>
> * Test info
>    - With MACHINE= "qemux86"
>    $ bitbake core-image-sato
>    - With MACHINE= "crownbay"
>    $ bitbake core-image-sato
>
>    The "xserver-xorg*_1.9.3-r1_core2.ipk" will be installed to the
>    crownbay's image. It would install the "xserver-xorg*_1.11.2-r7_i586.ipk"
>    in the past.
>
>    - Simulate the upgrade command:
>
>    > Update the list:
>    $ ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f \
> /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
> -o /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs update
>
>    > Test the upgrade command:
>    $ ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f
> /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf \
> -o /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs upgrade
>    # Nothing has been done
>
>    > Test the --select-higher-version
>    $ ./tmp/sysroots/i686-linux/usr/bin/opkg-cl -f
> /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/opkg.conf
> -o /buildarea2/lyang1/ipk_build/tmp/work/crownbay-poky-linux/core-image-sato-1.0-r0/rootfs \
> --select-higher-version upgrade
>    # The "xserver-xorg*_1.9.3-r1_core2.ipk" would be upgraded to
> 	"xserver-xorg*_1.11.2-r7_i586.ipk".
>
>    $ runqemu qemux86
>    The image started, and run the "opkg-cl" command in qemu, it worked well.
>
> // Robert
>
> The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:
>
>    upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/ipk_arch
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ipk_arch
>
> Robert Yang (1):
>    opkg svn: respect to the arch priority
>
>   .../opkg/opkg/select_higher_version.patch          |  102 ++++++++++++++++++++
>   meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
>   2 files changed, 104 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/select_higher_version.patch
>

Merged into OE-Core

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


