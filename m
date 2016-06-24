Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDB666FFEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 06:19:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5O6JPbo006686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 23 Jun 2016 23:19:25 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 23 Jun 2016 23:19:24 -0700
To: "Randle, William C" <william.c.randle@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1458264628.9397.10.camel@intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <576CD0F6.2050408@windriver.com>
Date: Fri, 24 Jun 2016 14:19:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1458264628.9397.10.camel@intel.com>
X-Originating-IP: [128.224.162.229]
Subject: Re: [PATCH v2] grub: add -Wno-error=trampolines to native CFLAGS
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
X-List-Received-Date: Fri, 24 Jun 2016 06:19:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Is the error still there for gcc6 without this option for CFLAGS?
The problem is that gcc on some old hosts don't support this option.

Best Regards,
Chen Qi

On 03/18/2016 09:30 AM, Randle, William C wrote:
> Previous patch was not against master. Updated against master branch.
>
> Fixes YOCTO 9201
> Adds -Wno-error=trampolines to native CFLAGS prevent multiple compile
> errors when using gcc 5.3.0 for gentoo.
>
> Signed-off-by: Bill Randle <william.c.randle@intel.com>
> ---
>   meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> index 4e80e18..ca73234 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> @@ -35,6 +35,10 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
>   
>   EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
>   
> +# ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
> +# and many other places in the grub code when compiled with some native gcc 5.3 compilers
> +CFLAGS_append_class-native = " -Wno-error=trampolines"
> +
>   do_install_class-native() {
>      install -d ${D}${bindir}
>      install -m 755 grub-mkimage ${D}${bindir}
> --
> 2.5.0


