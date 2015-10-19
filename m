Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD66E60088
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:44:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9JEiGf4006965
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Oct 2015 07:44:16 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 19 Oct 2015 07:44:16 -0700
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <562501BF.6010202@windriver.com>
Date: Mon, 19 Oct 2015 09:44:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/3] libsdl: support native compilation
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
X-List-Received-Date: Mon, 19 Oct 2015 14:44:20 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/19/15 9:17 AM, Dmitry Eremin-Solenikov wrote:
> qemu-native can use SDL backend for graphical output. Currently it is
> expected to use libsdl provided by the host. However this can lead to
> library incompatibilities between host and target. Make libsdl recipe
> support native compilation.

I don't object to the patch.. but we did have multiple problems in the past
where libsdl (native) did not work with the host systems X11 or what-ever.

Various failure conditions about not linking, linking to the wrong libsdl, or
execution failing are what made us prefer the host system's libsdl -- or simply
disabling libsdl altogether.

--Mark

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> index c0d5c6a..c9f3e00 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -17,6 +17,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu', '', d)} \
>             tslib"
> +DEPENDS_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11-native libxrandr-native libxrender-native libxext-native', '', d)}"
>  DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
>  
>  PR = "r3"
> @@ -65,4 +66,4 @@ do_configure_prepend() {
>          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>  }
>  
> -BBCLASSEXTEND = "nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
> 


