Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1C3C74FBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 07:14:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A7ERZm007125
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 00:14:27 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 10 Oct 2018 00:14:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20181010055606.12668-1-hongxu.jia@windriver.com>
	<1539155808-29595-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <f4806ebc-4e4d-88c6-3dc4-06d6eea2a4f8@windriver.com>
Date: Wed, 10 Oct 2018 15:14:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1539155808-29595-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V4] webkitgtk/epiphany: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Oct 2018 07:14:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi RP,

I saw you merged V3 to master-next, but I found epiphany depends
on webkitgtk, it also need to add opengl to REQUIRED_DISTRO_FEATURES

Please use V4 to replace

I test it with `bitbake world -n' without `opengl' in DISTRO_FEATURES

Sorry for so many revision, thanks for patchtest, mention
me to correct the error I introduced.

//Hongxu

On 2018年10月10日 15:16, Hongxu Jia wrote:
> They can't be built without opengl in DISTRO_FEATURES.
> [snip]
> |webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
> fatal error: GL/gl.h: No such file or directory
> [snip]
>
> Some sort of GL is needed yes. We indicate that with opengl loosely in OE
>
> The epiphany depends on webkitgtk, add opengl to REQUIRED_DISTRO_FEATURES also.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb | 2 +-
>   meta/recipes-sato/webkit/webkitgtk_2.20.5.bb     | 3 +--
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
> index 8837b9c..b46c9d3 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
> @@ -8,7 +8,7 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
>   
>   GNOMEBASEBUILDCLASS = "meson"
>   inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 opengl"
>   
>   SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>              file://0002-help-meson.build-disable-the-use-of-yelp.patch \
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> index c8d4f94..7f1ffce 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> @@ -30,8 +30,7 @@ SRC_URI[sha256sum] = "15c0f8d26e9605afe0948d161ba5fd82efee8eda2debd409fd40a440ac
>   
>   inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>   
> -# depends on libxt
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 opengl"
>   
>   DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>              gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \



