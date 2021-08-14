Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2927.1628966153078384088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Aug 2021 11:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D1F451C0003;
	Sat, 14 Aug 2021 18:35:38 +0000 (UTC)
Date: Sat, 14 Aug 2021 20:35:38 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
Message-ID: <YRgM+lOvm4ZAa+xW@piout.net>
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210714134248.21366-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 14/07/2021 08:42:48-0500, Joshua Watt wrote:
> Adds the command line compression tools which are needed by bitbake
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f451ba6a47..3801db7d42 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -484,12 +484,12 @@ HOSTTOOLS += " \
>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> -    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
> +    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> -    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> +    python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true uname \
> -    uniq wc wget which xargs \
> +    uniq wc wget which xargs zstd \

zstd seems to hurt reproducibility:

AssertionError: The following deb packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/elfutils-ptest_0.185-r0_amd64.deb
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/man-db-dbg_2.9.4-r0_amd64.deb
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/man-db-src_2.9.4-r0_amd64.deb
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/man-db_2.9.4-r0_amd64.deb
The following ipk packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/elfutils-ptest_0.185-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/man-db-dbg_2.9.4-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/man-db-src_2.9.4-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/man-db_2.9.4-r0_core2-64.ipk
The following rpm packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/elfutils-ptest-0.185-r0.core2_64.rpm
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/man-db-2.9.4-r0.core2_64.rpm
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/man-db-dbg-2.9.4-r0.core2_64.rpm
/home/pokybuild/yocto-worker/reproducible-ubuntu/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/man-db-src-2.9.4-r0.core2_64.rpm

diffoscope output here:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210814-qe8khapn/packages/diff-html/

I would think this was expected...

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
