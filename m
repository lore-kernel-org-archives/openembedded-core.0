Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SreMD-0004iP-0H
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 02:12:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2012 17:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="194737206"
Received: from unknown (HELO [10.255.12.217]) ([10.255.12.217])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2012 17:01:08 -0700
Message-ID: <50074E44.50503@linux.intel.com>
Date: Wed, 18 Jul 2012 17:01:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342572286-18552-1-git-send-email-yao.zhao@windriver.com>
In-Reply-To: <1342572286-18552-1-git-send-email-yao.zhao@windriver.com>
Subject: Re: [PATCH] qemu-nativesdk: fix the build failure that linux/kvm.h not found
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
X-List-Received-Date: Thu, 19 Jul 2012 00:12:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 05:44 PM, Yao Zhao wrote:
> qemu.inc: on older kernel build hosts that have < 2.6.20 which
> doesn't support kvm yet, build will fail. Add a check in do_configure
> to make sure whether linux/kvm.h exists for nativesdk build.
>
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 707493e..713674e 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -22,8 +22,9 @@ inherit autotools
>   do_configure() {
>       # Handle distros such as CentOS 5 32-bit that do not have kvm support
>       KVMOPTS="--disable-kvm"
> -    if [ "${PN}" != "qemu-native" ] || [ -f /usr/include/linux/kvm.h ] ; then
> -        KVMOPTS="--enable-kvm"
> +    if [ "${PN}" != "qemu-native" -a "${PN}" != "qemu-nativesdk" ] \
> +       || [ -f /usr/include/linux/kvm.h ] ; then
> +       KVMOPTS="--enable-kvm"
>       fi
>
>       ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
>
Merged into OE-Core

Thanks
	Sau!



