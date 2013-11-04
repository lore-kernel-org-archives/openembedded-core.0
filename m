Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 685416D136
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:50:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA49o5mR006032
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2013 01:50:05 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 4 Nov 2013 01:50:04 -0800
Message-ID: <52776DC8.2090406@windriver.com>
Date: Mon, 4 Nov 2013 17:50:00 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1383549031.git.hongxu.jia@windriver.com>
	<ca0a126b362417bc5d0cddd5262d11dc43229694.1383549031.git.hongxu.jia@windriver.com>
In-Reply-To: <ca0a126b362417bc5d0cddd5262d11dc43229694.1383549031.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 3/4] udev: fix QA issue
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
X-List-Received-Date: Mon, 04 Nov 2013 09:50:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2013 03:13 PM, Hongxu Jia wrote:
> ...
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead3000)
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libffi.so.6 => /usr/lib/libffi.so.6 (0xdead4000)
> WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead5000)

This patch fixed the above three warning, not include the fourth.
So please drop this, v2 will send.

//Hongxu

> WARNING: QA Issue: udev: /lib/udev/udevd, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libkmod.so.2 => /usr/lib/libkmod.so.2 (0xdead3000)
> ...
>
> Install libgudev-1.0.so.0.1.1 in ${libdir} rather than ${base_libdir}
> fixed this issue.
>
> [YOCTO #5142]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/udev/udev.inc | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index 2ff8f00..2f883a0 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -32,14 +32,13 @@ inherit autotools pkgconfig update-rc.d
>   
>   libexecdir = "${base_libdir}"
>   EXTRA_OECONF = "--disable-introspection \
> -                --with-rootlibdir=${base_libdir} \
> +                --with-rootlibdir=${libdir} \
>                   --with-pci-ids-path=${datadir}/pci.ids \
>                   ac_cv_file__usr_share_pci_ids=no \
>                   ac_cv_file__usr_share_hwdata_pci_ids=no \
>                   ac_cv_file__usr_share_misc_pci_ids=yes \
>                   --sbindir=${base_sbindir} \
>                   --libexecdir=${nonarch_base_libdir} \
> -                --with-rootlibdir=${base_libdir} \
>                   --with-rootprefix= \
>                   --without-systemdsystemunitdir \
>                  "


