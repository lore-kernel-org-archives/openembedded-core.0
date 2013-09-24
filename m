Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6516C99C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 15:04:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2013 08:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,971,1371106800"; d="scan'208";a="400349902"
Received: from unknown (HELO [10.255.15.44]) ([10.255.15.44])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2013 08:04:25 -0700
Message-ID: <5241A9F9.808@linux.intel.com>
Date: Tue, 24 Sep 2013 08:04:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1380033916-31464-1-git-send-email-sgw@linux.intel.com>
	<1380033916-31464-2-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1380033916-31464-2-git-send-email-sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] sysvinit: don't use useradd
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
X-List-Received-Date: Tue, 24 Sep 2013 15:04:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2013 07:45 AM, Saul Wold wrote:
> It causes shadow to be used in core-image-minimal and increase the
> size by 1.5M.  We will add the shutdown user to group via base-passwd
> Ensure that sysvinit depends on base-passwd for the group chown.
>
> [YOCTO #5230]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index 97ecc51..9ec92e2 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                       file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
>   PR = "r11"
>
> -RDEPENDS_${PN} = "${PN}-inittab"
> +RDEPENDS_${PN} = "${PN}-inittab base-passwd"
>
This should be in DEPENDS, RP has this already patched.

Thanks
	Sau!

>   SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
>              file://install.patch \
> @@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5
>   S = "${WORKDIR}/sysvinit-${PV}"
>   B = "${S}/src"
>
> -inherit update-alternatives useradd
> +inherit update-alternatives
>   DEPENDS_append = " update-rc.d-native"
>
>   ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last mesg utmpdump wall"
> @@ -53,9 +53,6 @@ ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
>   ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
>   ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
>
> -USERADD_PACKAGES = "${PN}"
> -GROUPADD_PARAM_${PN} = "--system shutdown"
> -
>   PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
>   FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
>   FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
>

