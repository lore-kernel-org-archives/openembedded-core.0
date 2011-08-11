Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrcvJ-0003bf-PE
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 23:36:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 14:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37661473"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2011 14:31:44 -0700
Message-ID: <4E444A40.8040206@linux.intel.com>
Date: Thu, 11 Aug 2011 14:31:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312967662.git.xiaofeng.yan@windriver.com>
	<83a60eb818d866533f9ac2069eae38b03fcedac6.1312967662.git.xiaofeng.yan@windriver.com>
In-Reply-To: <83a60eb818d866533f9ac2069eae38b03fcedac6.1312967662.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 1/1] rootfs_rpm: Fix bug 936
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
X-List-Received-Date: Thu, 11 Aug 2011 21:36:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2011 02:49 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> [YOCTO #936]
> "update-alternatives" installed: one in /usr/sbin from chkconfig \
> (symlinked to "alternatives"), and the other in /usr/bin \
> from update-alternatives-cworth.
> It appears for whatever reason that the one from chkconfig is run \
> during postinst processing but if you run the script from the command \
> line it gets the other one.
> this is due to differences in the PATH environment variable.
>
> The following is the sequence to call scripts after kernel booting
> inittab
>    -->rcS
>       -->./S40networking(PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin)
>       -->S98configure(call rpm-postinstall)
>          #"/usr/sbin" is found prior to "/usr/bin", so update-alternatives from chkconfig is run in this script
>    -->rc5.d
>    -->profile(profile:4:PATH="/usr/local/bin:/usr/bin:/bin" profile:15: PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin)
>    #"/usr/bin/" is found prior to "/usr/sbin", so update-alternatives from update-alternatives-cworth is run in this script
>
> So I remove the symlink (update-alternatives linked to chkconfig). The one from update-alternatives-cworth is left alone.
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   .../recipes-extended/chkconfig/chkconfig_1.3.52.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
> index 659f964..6dc8a0e 100644
> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
> +++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>
>   DEPENDS = "libnewt popt"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
>
> @@ -23,4 +23,5 @@ inherit autotools gettext
>
>   do_install_append() {
>       mkdir -p ${D}/etc/chkconfig.d
> +    rm -f ${D}/usr/sbin/update-alternatives
>   }
Merged into OE-Core

Thanks	
Sau!


