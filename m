Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVO2g-0003na-Kd for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 14:48:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATDfb2k013705
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:41:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13247-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:41:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATDfROG013699
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:41:28 GMT
Message-ID: <1322574095.6171.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 13:41:35 +0000
In-Reply-To: <572ee988031418b5bc01716ac39b873aa7b915bd.1322570605.git.Martin.Jansa@gmail.com>
References: <cover.1322570605.git.Martin.Jansa@gmail.com>
	<572ee988031418b5bc01716ac39b873aa7b915bd.1322570605.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-core 4/5] libsdl: enable alsa based on PACKAGECONFIG and respect DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 13:48:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 13:48 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> index 17a3103..e5fdcc3 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642
>  inherit autotools binconfig pkgconfig
>  
>  EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
> -                --enable-file --disable-oss --enable-alsa --disable-esd --disable-arts \
> +                --enable-file --disable-oss --disable-esd --disable-arts \
>                  --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
>                  --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
>                  --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
> @@ -40,6 +40,9 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
>                  --disable-video-picogui --disable-video-qtopia --enable-dlopen \
>                  --disable-rpath"
>  
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib,"
> +
>  PARALLEL_MAKE = ""

Doesn't this patch need to remove alsa-lib from DEPENDS?

I've taken the other four patches.

Cheers,

Richard



