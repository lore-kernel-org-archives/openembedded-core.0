Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T9920-00060r-D3
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 08:24:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q856Bile027115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2012 23:11:44 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 4 Sep 2012 23:11:43 -0700
Message-ID: <5046ED1D.9080204@windriver.com>
Date: Wed, 5 Sep 2012 14:11:41 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1346807137-4231-1-git-send-email-Martin.Jansa@gmail.com>
	<1346807137-4231-2-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1346807137-4231-2-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] pixman: ignore NEON, IWMMXT, LOONGSON_MMI variables for class-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 06:24:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2012 09:05 AM, Martin Jansa wrote:
> * pixman-native can have different do_configure sstate checksums if it's built with armv4t machine and armv7a
>    OE @ ~ $ bitbake/bin/bitbake-diffsigs
>      before-mgmt/stamps.1346795706/nokia900/x86_64-linux/pixman-native-*.do_configure.sigdata.*
>      after-mgmt/stamps.1346801508/om-gta02/x86_64-linux/pixman-native-*.do_configure.sigdata.*
>    basehash changed from 27e577de60880a788c7aaba797ef83e0 to c6799807eb3e767daf1e75738fc753f7
>    Variable NEON value changed from   to  --disable-arm-neon
> * so if you start building with different machine then last time (wrt
>    NEON setting) all recipes which depends on pixman-native will be rebuilt too
> * this explains why sstate-cache-management.sh wanted to remove many
>    native sstate packages when --stamps-dir option was used (see comment
>    28 in https://bugzilla.yoctoproject.org/show_bug.cgi?id=2897)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> index 35a2def..218808a 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
>   DEPENDS += "zlib libpng"
>   BBCLASSEXTEND = "native"
>
> -PR = "r1"
> +PR = "r2"
>
>   PE = "1"
>
> @@ -25,7 +25,8 @@ NEON = " --disable-arm-neon "
>   NEON_armv7a = " "
>   NEON_armv7a-vfp-neon = " "
>
> -EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> +EXTRA_OECONF = "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
> +EXTRA_OECONF_class-native = "--disable-gtk"
>

Hi Martin,

What's the differences between "_virtclass-native" and "_class-native", please?

// Robert


>   SRC_URI += "\
>               file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
>


