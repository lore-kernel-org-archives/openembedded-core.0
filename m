Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 259D26013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 09:24:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u669OavM010027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 02:24:36 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jul 2016 02:24:35 -0700
To: Catalin Enache <catalin.enache@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1462536830-30243-1-git-send-email-catalin.enache@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <577CCDED.9060707@windriver.com>
Date: Wed, 6 Jul 2016 17:22:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1462536830-30243-1-git-send-email-catalin.enache@windriver.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [PATCH] grub-efi: run autogen.sh before configure
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
X-List-Received-Date: Wed, 06 Jul 2016 09:24:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


ping

Thanks,
Grace

On 2016年05月06日 20:13, Catalin Enache wrote:
> When adding new source files from upstream the autogen.sh
> script needs to be run.
>
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> ---
>   meta/recipes-bsp/grub/grub-efi_2.00.bb | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> index 5a0dc95..62ded6e 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> @@ -2,6 +2,7 @@ require grub2.inc
>
>   DEPENDS_class-target = "grub-efi-native"
>   RDEPENDS_${PN}_class-target = "diffutils freetype"
> +DEPENDS += "autogen-native"
>   PR = "r3"
>
>   SRC_URI += " \
> @@ -39,6 +40,11 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-
>   # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
>   CFLAGS_append_class-native = " -Wno-error=trampolines"
>
> +do_configure_prepend() {
> +    ( cd ${S}
> +    ${S}/autogen.sh )
> +}
> +
>   do_install_class-native() {
>   	install -d ${D}${bindir}
>   	install -m 755 grub-mkimage ${D}${bindir}
>

