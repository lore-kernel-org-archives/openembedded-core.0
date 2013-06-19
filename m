Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7975D608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 08:15:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J8Lc8D006779; Wed, 19 Jun 2013 09:21:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 25JddaXqHvvL; Wed, 19 Jun 2013 09:21:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J8LW4U006770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 09:21:34 +0100
Message-ID: <1371629715.20823.163.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Wed, 19 Jun 2013 09:15:15 +0100
In-Reply-To: <d144145e87b9f15189080665ce91db537522935f.1371609581.git.hongxu.jia@windriver.com>
References: <cover.1371609581.git.hongxu.jia@windriver.com>
	<d144145e87b9f15189080665ce91db537522935f.1371609581.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wget:fix do_configure failed
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
X-List-Received-Date: Wed, 19 Jun 2013 08:15:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 10:45 +0800, Hongxu Jia wrote:
> Create a new build enviroment, build wget failed
> ...
> configure:34512: checking for libssl
> configure:34542: i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/qemux86 -o conftest - O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c -ldl  -lssl /home/jiahongxu/yocto/build-  20130613-qemu/tmp/sysroots/qemux86/lib/libcrypto.so -lz >&5
> /home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld: cannot find -lz collect2: error: ld returned 1 exit status
> ...
> 
> From log as we known, the reason is link zlib failed, it isn't
> explicitly in wget's DEPENDS. Add zlib to wget's DEPENDS.
> 
> [YOCTO #4749]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-extended/wget/wget.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'll take this but the summary of this change should be something like
"wget: Add missing DEPENDS on zlib" which explains more about what the
change does. Fixing a configure failure doesn't tell us much when looked
at in a history of changes. I'll tweak the summary this time.

Cheers,

Richard

> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> index ba37a87..de9b620 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
>  SECTION = "console/network"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -DEPENDS = "openssl"
> +DEPENDS = "openssl zlib"
>  
>  INC_PR = "r16"
>  



