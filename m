Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C1BD76B2CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 10:48:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7GAxXx1008315; Fri, 16 Aug 2013 11:59:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PU4DzN7fxoBI; Fri, 16 Aug 2013 11:59:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7GAxEEC008291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 16 Aug 2013 11:59:16 +0100
Message-ID: <1376650065.22952.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Fri, 16 Aug 2013 11:47:45 +0100
In-Reply-To: <b861e570e04aa288f05c344b161815b0dec8e788.1376647416.git.kai.kang@windriver.com>
References: <cover.1376647416.git.kai.kang@windriver.com>
	<b861e570e04aa288f05c344b161815b0dec8e788.1376647416.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Zhangle.Yang@windriver.com
Subject: Re: [PATCH 1/1] qemu: update dependency of native package
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
X-List-Received-Date: Fri, 16 Aug 2013 10:48:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-16 at 18:05 +0800, Kai Kang wrote:
> [YOCTO #4973]
> 
> It fails to start qemu with core-image-sato on Fedora 19. The error
> message shows:
> 
> Could not initialize SDL(No available video device) - exiting
> 
> Add dependecy libxext-native to qemu-native to fix this error.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 97e9b7b..a96e00c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "open source processor emulator"
>  HOMEPAGE = "http://qemu.org"
>  LICENSE = "GPLv2 & LGPLv2.1"
>  DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
> -DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
> +DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native libxext-native"
>  DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
>  RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"

This is one of the ugly dependencies we've tried to ignore.

We basically assume if your build machine has graphics, you have the
devel headers/libs there and qemu will autodetect and include graphics
support. Equally, if your build machine doesn't, it just won't build
graphics support. In general most people seem happy with this even if
its imperfect.

Adding libxext-native upsets this balance a little...

Cheers,

Richard



