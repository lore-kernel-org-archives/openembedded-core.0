Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F19166010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 08:20:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u818Jtuu004913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 01:19:55 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 01:19:54 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-core@lists.openembedded.org>
References: <20160826103152.6211-1-git@andred.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <95e22ec6-7453-6a40-8359-37cdde69dd20@windriver.com>
Date: Thu, 1 Sep 2016 16:19:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160826103152.6211-1-git@andred.net>
Subject: Re: [PATCH 1/3] libnl: fix packaging mistakes
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
X-List-Received-Date: Thu, 01 Sep 2016 08:20:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi André,

It seems that this series cause errors when multilib:

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/930/steps/BuildImages_2/logs/stdio

// Robert

On 08/26/2016 06:31 PM, André Draszik wrote:
> - *.la files belong into -dev packages
> - the genl-ctrl-list command line utility should go to into the CLI
>   package, so as to prevent the libnl-genl library package from
>   pulling in all of the command line utilities (as genl-ctrl-list
>   is linked against libnl-cli-3.so.200)
>
> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta/recipes-support/libnl/libnl_3.2.25.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
> index cabe841..2624915 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.25.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
> @@ -25,18 +25,18 @@ FILES_${PN} = "${libdir}/libnl-3.so.* \
>                 ${sysconfdir}"
>  RREPLACES_${PN} = "libnl2"
>  RCONFLICTS_${PN} = "libnl2"
> +FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.la"
>  FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
>
> -PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl ${PN}-idiag"
> +PACKAGES += "${PN}-cli ${PN}-genl ${PN}-idiag ${PN}-nf ${PN}-route"
>  FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
>                       ${libdir}/libnl/cli/*/*.so \
> -                     ${libdir}/libnl/cli/*/*.la \
> +                     ${sbindir}/genl-ctrl-list \
>                       ${sbindir}/nl-*"
> -FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
> +FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
> +                     ${libdir}/libnl-genl.so.*"
>  FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
>  FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
> -FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
> -                     ${libdir}/libnl-genl.so.* \
> -                     ${sbindir}/genl-ctrl-list"
> +FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
>  RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
>  RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
>

