Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1URlPe-00005q-5g
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:33:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3FFGGrh008443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:16:16 -0700 (PDT)
Received: from msp-dhcp4.wrs.com (172.25.34.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 15 Apr 2013 08:16:15 -0700
Message-ID: <516C19C6.9080807@windriver.com>
Date: Mon, 15 Apr 2013 10:16:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1366024028-24911-8-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1366024028-24911-8-git-send-email-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 7/7] allarch: Drop various problematic allarch usages
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
X-List-Received-Date: Mon, 15 Apr 2013 15:33:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/13 6:07 AM, Richard Purdie wrote:
> In each of these cases allarch is used where the package in question has a
> dependency on things which are not allach and change when MACHINE is changed.
>
> This leads to a rebuild of the package each time MACHINE is switched and
> the sstate checksum changes. The dependencies in question are not suited
> be being marked as ABISAFE.

In each of these cases, does the contents of the package change when the MACHINE 
(or something in that machine) are modified?  If so, I agree they are definitely 
not allarch.

However, if the dependency really doesn't matter, then why isn't ABISAFE correct 
in each case?

--Mark

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-core/udev/udev-extraconf_1.0.bb               |    2 --
>   meta/recipes-devtools/devel-config/anjuta-remote-run.bb    |    2 --
>   meta/recipes-devtools/devel-config/distcc-config.bb        |    2 --
>   meta/recipes-devtools/devel-config/nfs-export-root.bb      |    2 --
>   meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb   |    2 +-
>   meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb |    2 +-
>   meta/recipes-graphics/x11-common/x11-common_0.1.bb         |    2 --
>   7 files changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
> index ea95a60..fd9a333 100644
> --- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
> +++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
> @@ -4,8 +4,6 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> -inherit allarch
> -
>   PR = "r8"
>
>   SRC_URI = " \
> diff --git a/meta/recipes-devtools/devel-config/anjuta-remote-run.bb b/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
> index 51fdf9e..b9cded7 100644
> --- a/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
> +++ b/meta/recipes-devtools/devel-config/anjuta-remote-run.bb
> @@ -15,5 +15,3 @@ do_install() {
>   PACKAGES = "${PN}"
>   RDEPENDS_${PN} = "dbus rsync"
>
> -inherit allarch
> -
> diff --git a/meta/recipes-devtools/devel-config/distcc-config.bb b/meta/recipes-devtools/devel-config/distcc-config.bb
> index 8deaa66..c9c024d 100644
> --- a/meta/recipes-devtools/devel-config/distcc-config.bb
> +++ b/meta/recipes-devtools/devel-config/distcc-config.bb
> @@ -21,5 +21,3 @@ do_install() {
>   }
>
>   RDEPENDS_${PN} = "distcc"
> -
> -inherit allarch
> diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
> index 4d9f6dd..5fa8cb3 100644
> --- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
> +++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
> @@ -15,5 +15,3 @@ do_install() {
>   }
>
>   RDEPENDS_${PN} = "packagegroup-core-nfs-server"
> -
> -inherit allarch
> diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> index a34825a..c99521f 100644
> --- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> +++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
> @@ -12,7 +12,7 @@ RDEPENDS_${PN} = "fontconfig-utils"
>   PR = "r4"
>   PE = "1"
>
> -inherit allarch fontcache
> +inherit fontcache
>
>   FONT_PACKAGES = "${PN}"
>
> diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> index ccd865c..75f78a2 100644
> --- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> +++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
>   PR = "r7"
>   RDEPENDS_${PN} = "fontconfig-utils"
>
> -inherit allarch fontcache
> +inherit fontcache
>
>   FONT_PACKAGES = "${PN}"
>
> diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
> index 49de5a3..2df1347 100644
> --- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
> +++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
> @@ -9,8 +9,6 @@ SRC_URI = "file://etc \
>
>   S = "${WORKDIR}"
>
> -inherit allarch
> -
>   do_install() {
>   	cp -R ${S}/etc ${D}${sysconfdir}
>   	chmod -R 755 ${D}${sysconfdir}
>



