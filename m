Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1291377255
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Sep 2016 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u84LSCmC029352; Sun, 4 Sep 2016 22:28:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zf17ZV3Vlu8j; Sun,  4 Sep 2016 22:28:12 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u84LS7Mt029348
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 4 Sep 2016 22:28:08 +0100
Message-ID: <1473024487.20226.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Date: Sun, 04 Sep 2016 22:28:07 +0100
In-Reply-To: <20160904162130.13313-1-marex@denx.de>
References: <20160904162130.13313-1-marex@denx.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Sun, 04 Sep 2016 21:28:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-09-04 at 18:21 +0200, Marek Vasut wrote:
> The u-boot recipes share a couple of common variables, which makes
> updating of the recipes error prone and a toil. Factor those common
> bits into u-boot-common.inc so that they are in one place.
> 
> No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc          | 16
> ++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb | 16 ++--------
> ------
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb  | 17 ++--------
> -------
>  meta/recipes-bsp/u-boot/u-boot.inc                 | 10 ++--------
>  meta/recipes-bsp/u-boot/u-boot_2016.03.bb          |  7 -------
>  5 files changed, 22 insertions(+), 44 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-common.inc
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> b/meta/recipes-bsp/u-boot/u-boot-common.inc
> new file mode 100644
> index 0000000..403e316
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -0,0 +1,16 @@
> +HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
> +SECTION = "bootloaders"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM =
> "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
> +
> +# This revision corresponds to the tag "v2016.03"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> +
> +PV = "v2016.03+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> +
> +S = "${WORKDIR}/git"

Since the common file you're creating is 2016.03 version specific, I'd
be tempted to call it u-boot-common_2016.03.inc and then its clear its
version specific...

Cheers,

Richard

