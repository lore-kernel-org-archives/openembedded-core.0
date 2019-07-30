Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2336D6D666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 05:10:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6U5Aqbc006213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jul 2019 22:10:53 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 29 Jul 2019 22:10:51 -0700
To: Adrian Bunk <bunk@stusta.de>, <openembedded-core@lists.openembedded.org>
References: <20190729113719.15521-1-bunk@stusta.de>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <814f8678-6b09-a766-91ff-7e4f0463745e@windriver.com>
Date: Tue, 30 Jul 2019 13:09:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729113719.15521-1-bunk@stusta.de>
Subject: Re: [PATCH] webkitgtk: Reenable on mips
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
X-List-Received-Date: Tue, 30 Jul 2019 05:10:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/29 下午7:37, Adrian Bunk wrote:
> It builds using the generic C_LOOP code.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   meta/recipes-gnome/epiphany/epiphany_3.32.3.bb | 3 ---
>   meta/recipes-sato/webkit/webkitgtk_2.24.2.bb   | 4 +---
>   2 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
> index d1c6af52ed..de1b6e2f84 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
> @@ -16,8 +16,5 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
>   SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"
>   SRC_URI[archive.sha256sum] = "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"
>   
> -# webkitgtk doesn't work with tune 'mips'
> -COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null', 'mips.*-linux', d)}"
> -
>   FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>   RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> index 891266b220..7f01c4e26d 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> @@ -43,8 +43,6 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>   	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
>             "
>   
> -COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null', 'mips.*-linux', d)}"
> -
>   PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
>                      enchant \
> @@ -97,7 +95,7 @@ EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
>   EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
>   
>   # JIT not supported on MIPS either
> -EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
> +EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "


Thanks. It works for me.

Regards,
Kai

>   
>   # JIT not supported on X32
>   # An attempt was made to upstream JIT support for x32 in


-- 
Kai Kang


