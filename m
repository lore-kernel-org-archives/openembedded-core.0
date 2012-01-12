Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTdS-0007VJ-Vm
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:00:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 22:28:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95015383"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:28:47 -0800
Message-ID: <4F0E7D9E.7030408@linux.intel.com>
Date: Wed, 11 Jan 2012 22:28:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325911915-16001-5-git-send-email-steve@sakoman.com>
In-Reply-To: <1325911915-16001-5-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH] update-modules: don't run modutils.sh if systemd is installed
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
X-List-Received-Date: Thu, 12 Jan 2012 23:00:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 08:51 PM, Steve Sakoman wrote:
> systemd has its own mechanism for loading kernel modules at startup
>
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   .../update-modules-1.0/update-modules              |    3 ++-
>   .../update-modules/update-modules_1.0.bb           |    3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules b/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
> index 636fe1c..7ee7df8 100755
> --- a/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
> +++ b/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
> @@ -181,7 +181,8 @@ fi
>   mv "$MODCONFTMPFILE" "$MODCONFFILE"
>   mv "$MODULESTMPFILE" "$MODULESFILE"
>
> -if [ $first_time -eq 1 ]; then
> +# Don't run modutils.sh if systemd is installed
> +if [ $first_time -eq 1 ]&&  [ ! -e /bin/systemctl ]; then
>     /etc/init.d/modutils.sh || true
>   fi
>
> diff --git a/meta/recipes-kernel/update-modules/update-modules_1.0.bb b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
> index dc44965..d9697de 100644
> --- a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
> +++ b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
> @@ -4,7 +4,8 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
>
>   RDEPENDS_${PN} = "module-init-tools-depmod"
> -PR = "r11"
> +
> +PR = "r12"
>
>   SRC_URI = "file://update-modules \
>              file://COPYING.GPL"

Merged into OE-Core

Thanks
	Sau!


