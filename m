Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D6BC377245
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 22:31:13 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b205so175772747wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=SYkuem+CmumySJKovzqyxkeVM5Ax578aFQoweuWFrrk=;
	b=YBSZ+OFpeiwjep4NLF/IJjac44rEYzw3E/xOQ3bLZb3Cu5ZVcUUpgQhtVoiwQtdsKe
	b6nALeGFWe2JJ/WHl/iNg6jytD0Q8BZ6zkSwCrSQnAVGeoCesGYTn+hRObCOpHmxL2rn
	dxS7bTtNLfVK6fYswMNZihuJP8JjhXnN8eafDze82rp2PZPq1YAil+cdoem9dILat6rT
	MIKWeY2jt2FYx/yOtKCV8p2eCwwkzTMf9ZJ4jCpG2PjkLBP7XfrqYlr2pN70FOdF8gS8
	XdC3rmI3cND/geR1/svcGz/E0VK8OhVywcE41mGEBqauq55XZ1GldVTiyX7XwrK+dIcL
	kPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=SYkuem+CmumySJKovzqyxkeVM5Ax578aFQoweuWFrrk=;
	b=LJf/z9imo2EKbEvsX+Idf5D2NmgSCb3d6p/hzQe/iQIQb8sHA5sopKf2oDeZQy2ksb
	BLclcKmVtB7TkC4w6TgNOgWsMNzYhY19Mglv1nIRYtMPfY/B3B1KYchPa5yqz8P1jW/L
	RC8NYZXi9E2j1aLq405teKDYSF7Z03ZNx0Fwl8Nb6d52dtqjB/F0W4xeuWA6Wiit8ntZ
	rI9EB8XNGIjMqxkA25rvfPPgsR7YF0yXDItklieHpuWP+Q0WIkzd0nSPzCc7wJpM4aJB
	Peq77ny6riYRv7TaAq19jt2PQ/FW4JR2TupzC2vg38ofhELJOZSr7lBjZLMrJ63hTfwH
	qL6A==
X-Gm-Message-State: AG10YOReEST2rFglLO0XEgJnE/dVGNY1R7siKBYXBpNPN/OHYfwRReag+U3/mOrxBkb39d0TnFy5JzirWqgfOw==
MIME-Version: 1.0
X-Received: by 10.28.50.133 with SMTP id y127mr14447140wmy.4.1456180273566;
	Mon, 22 Feb 2016 14:31:13 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 22 Feb 2016 14:31:13 -0800 (PST)
In-Reply-To: <f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
References: <cover.1455955403.git.raj.khem@gmail.com>
	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
Date: Mon, 22 Feb 2016 14:31:13 -0800
Message-ID: <CAJ86T=VoDWL_Os8yAFHKpTfWTv8Q-uTpu8TEtwQc-7+-dWKFuA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: Upgrade to 2.23
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
X-List-Received-Date: Mon, 22 Feb 2016 22:31:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 20, 2016 at 12:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Drop kconfig and options-group support
> Forward port cross-localedef support
> Assume ssp support in libc when building gcc-initial

Breaks for me when building for x86 with -Os (building with
-O1/-O2/-O3 are all OK):

i686-rdk-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
--sysroot=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32-tcbootstrap
../sysdeps/unix/sysv/linux/posix_fallocate.c -c -std=gnu11
-fgnu89-inline  -Os -Wall -Werror -Wno-error -Wundef -Wwrite-strings
-fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32=
-fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux=/usr/src/glibc
-fdebug-prefix-map=/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/git=/usr/src/glibc
-feliminate-unused-debug-types -fmerge-all-constants -frounding-math
-g -pipe -Wstrict-prototypes -Wold-style-definition   -Wa,-mtune=i686
-fexceptions  -ftls-model=initial-exec      -I../include
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io
 -I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux
 -I../sysdeps/unix/sysv/linux/i386/i686  -I../sysdeps/i386/i686/nptl
-I../sysdeps/unix/sysv/linux/i386  -I../sysdeps/unix/sysv/linux/x86
-I../sysdeps/i386/nptl  -I../sysdeps/unix/sysv/linux/include
-I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread
-I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv
-I../sysdeps/unix/i386  -I../sysdeps/unix  -I../sysdeps/posix
-I../sysdeps/i386/i686/fpu/multiarch  -I../sysdeps/i386/i686/fpu
-I../sysdeps/i386/i686/multiarch  -I../sysdeps/i386/i686
-I../sysdeps/i386/fpu  -I../sysdeps/x86/fpu/include
-I../sysdeps/x86/fpu  -I../sysdeps/i386  -I../sysdeps/x86
-I../sysdeps/wordsize-32  -I../sysdeps/ieee754/ldbl-96
-I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
-I../sysdeps/ieee754  -I../sysdeps/generic  -I.. -I../libio -I.
-nostdinc -isystem
/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include
-isystem /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-initial-i686/gcc/i686-rdk-linux/5.3.0/include-fixed
-isystem /home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32/usr/include
 -D_LIBC_REENTRANT -include
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/libc-modules.h
-DMODULE_NAME=libc -include ../include/libc-symbols.h       -o
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
-MD -MP -MF /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o.dt
-MT /home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
../sysdeps/unix/sysv/linux/posix_fallocate.c: In function 'posix_fallocate':
../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
used in asm here
 }
 ^
../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot be
used in asm here

