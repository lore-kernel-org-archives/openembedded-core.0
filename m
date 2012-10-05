Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TKAde-0003XP-Sx
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 18:20:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Oct 2012 09:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="230424214"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2012 09:07:31 -0700
Message-ID: <506F05C3.3050104@linux.intel.com>
Date: Fri, 05 Oct 2012 09:07:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1349350639-24126-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349350639-24126-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shutdown-desktop: ensure the postinst script succeeds
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
X-List-Received-Date: Fri, 05 Oct 2012 16:20:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2012 04:37 AM, Ross Burton wrote:
> When the hostname isn't qemuarm the grep fails so the postinst fails. Stop this
> happening by explicitly evaluating true.
>
> [YOCTO #3224]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
> index d0f507e..c5096c1 100644
> --- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
> +++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>
>   SRC_URI = "file://shutdown.desktop"
>
> +PR = "r1"
> +
>   S = "${WORKDIR}"
>
>   do_install() {
> @@ -14,7 +16,8 @@ do_install() {
>
>   pkg_postinst_${PN} () {
>       grep -q qemuarm $D${sysconfdir}/hostname && \
> -        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
> +        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/' \
> +        || true
>   }
>
>   inherit allarch
>
Merged into OE-Core

Thanks
	Sau!



