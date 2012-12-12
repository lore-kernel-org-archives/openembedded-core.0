Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiilG-0001eb-BH
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 10:37:54 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so296586wic.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 01:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HByyJkhRn782pSZjLd+xxrHzs6tEY6kfqhcPfA8tzyk=;
	b=lznYMezl/2hDqcNfPa2XJROuhzm3Bi25onTC5XCgNRXqM6TiRWCtqcLoV1MVshoRvm
	Hq9duAdeo8YLkXqg7sVER3j8ne5/Dyenzp4m9Exd5DPziw50gXNtUFfapfOc6uxv6mFc
	vL6aLXDq5Y+JAjP9xB4VCP1DblhIID3jWRlkBRLnX8kyMXUxjtbQV3tSxwSuryu+ACT1
	hVj8nBYKi5UktnOB38QIQUib5qTGLDYzwTGFVCfjsRk1JgtdurTSYNwF4B1mJAxy2LUR
	rOH2lu2I74oY+DRMqIr494HT1ml28tE0Cm+29pJIEY9PNyKK/oBnoKb+BgPzVTsv6Z+5
	f6LQ==
MIME-Version: 1.0
Received: by 10.180.19.99 with SMTP id d3mr590732wie.4.1355304201241; Wed, 12
	Dec 2012 01:23:21 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 12 Dec 2012 01:23:21 -0800 (PST)
In-Reply-To: <lywqwqktzq.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lywqwqktzq.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 12 Dec 2012 10:23:21 +0100
Message-ID: <CA+chaQe8uniTRz5pm+kWcC2kH=1836UkVgfyRMBO1p3M2Ldf=Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: binutils: regression on kernel builds
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
X-List-Received-Date: Wed, 12 Dec 2012 09:37:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 10, 2012 at 12:48 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Hi,
>
> with recent binutils, kernel build fails with
>
> | arm-linux-gnueabi-ld: error: arch/arm/boot/compressed/piggy.gzip.o: unknown CPU architecture
>
> I am able to reproduce it with
>
> $ > /tmp/x.s
> $ arm-linux-gnueabi-as  -march=armv7-a -march=all -o x0.o /tmp/x.s
> $ arm-linux-gnueabi-as  -march=armv7-a  -o x1.o /tmp/x.s
> $ arm-linux-gnueabi-ld.gold x0.o x1.o
> arm-linux-gnueabi-ld: error: x1.o: unknown CPU architecture
> $ arm-linux-gnueabi-ld.bfd x0.o x1.o
> arm-linux-gnueabi-ld.bfd: warning: cannot find entry symbol _start; defaulting to 0000000000008034
>
>
> (kernel sets '-Wa,-march=all' when building piggy.gzip.o)
>
>
> This works fine with binutils 2.22 and when using the BFD linker.

You need to patch your kernel sources, some examples for different
kernel versions (please ignore incorrect commit message)

https://github.com/shr-distribution/linux/commit/e465ff7527fb085b4854b0e68aa6bc592229bf43
https://github.com/shr-distribution/linux/commit/627c638794d61c27858d6220cf55c27c74dc9450
https://github.com/shr-distribution/linux/commit/37b0bacc00e81811dc113265a9ef826fe9aab788
https://github.com/shr-distribution/linux/commit/ec1ac589d49081286164246fbaaba0012ae7ecac

Cheers,


