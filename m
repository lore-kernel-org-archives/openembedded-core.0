Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEE271633
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 00:27:16 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Sat, 21 Feb 2015 11:27:07 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1L0R44X028262
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Sat, 21 Feb 2015 11:27:07 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YOxuS-0007mk-9V; Sat, 21 Feb 2015 11:27:04 +1100
Message-ID: <54E7D0D8.2060900@urbanec.net>
Date: Sat, 21 Feb 2015 11:27:04 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<1424455387.11836.57.camel@linuxfoundation.org>
In-Reply-To: <1424455387.11836.57.camel@linuxfoundation.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Sat, 21 Feb 2015 00:27:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 21/02/15 05:03, Richard Purdie wrote:
> On Mon, 2015-02-02 at 02:02 -0800, Khem Raj wrote:
>> I have put together upgrade to gcc 4.9.2 as well as glibc 2.21 (
...
> For info, I've now merged the glibc part of this change now too.

It looks like the new glibc turns all gcc warnings into errors. That does not seem to work too well in all cases:

| mipsel-oe-linux-gcc -mel -mabi=32 -mhard-float --sysroot=/home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/sysroots/inihdp-tcbootstrap pthread_equal.c -c -std=gnu99 -fgnu89-inline  -Os -Wall -Werror -Winline -Wno-error=undef -Wundef -Wwrite-strings -feliminate-unused-debug-types -fmerge-all-constants -frounding-math -g -pipe -Wstrict-prototypes   -fPIC        -I../include -I/home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/work/mips32el-oe-linux/glibc/glibc-2.21-r0/build-mipsel-oe-linux/nptl  -I/home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/work/mips32el-oe-linux/glibc/glibc-2.21-r0/build-mipsel-oe-linux  -I../sysdeps/unix/sysv/linux/mips/mips32/fpu  -I../sysdeps/unix/sysv/linux/mips/mips32  -I../sysdeps/unix/sysv/linux/mips  -I../sysdeps/mips/nptl  -I../sysdeps/unix/sysv/linux/include -I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread  -I../sysdeps/gnu  -I../!
 sysdeps/un
ix/inet  -I../sysdeps/unix/sysv  -I../sysdeps/unix/mips/mips32  -I../sysdeps/unix/mips  -I../sysdeps/unix  -I../sysdeps/posix  -I../sysdeps/mips/mips32/fpu  -I../sysdeps/mips/mips32  -I../sysdeps/mips/ieee754  -I../sysdeps/mips/soft-fp  -I../sysdeps/mips/include -I../sysdeps/mips  -I../sysdeps/ieee754/flt-32  -I../sysdeps/ieee754/dbl-64  -I../sysdeps/wordsize-32  -I../sysdeps/mips/fpu  -I../sysdeps/ieee754  -I../sysdeps/generic  -I.. -I../libio -I. -nostdinc -isystem /home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/sysroots/x86_64-linux/usr/lib/mipsel-oe-linux.gcc-cross-initial-mipsel/gcc/mipsel-oe-linux/4.9.2/include -isystem /home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/sysroots/x86_64-linux/usr/lib/mipsel-oe-linux.gcc-cross-initial-mipsel/gcc/mipsel-oe-linux/4.9.2/include-fixed -isystem /home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/sysroots/inihdp/usr/include  -D_LIBC_REE!
 NTRANT -in
clude /home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/work/mips32el-oe-linux/glibc/glibc-2.21-r0/build-mipsel-oe-linux/libc-modules.h -DMODULE_NAME=libpthread -include ../include/libc-symbols.h  -DPIC -DSHARED     -o /home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/work/mips32el-oe-linux/glibc/glibc-2.21-r0/build-mipsel-oe-linux/nptl/pthread_equal.os -MD -MP -MF /home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/work/mips32el-oe-linux/glibc/glibc-2.21-r0/build-mipsel-oe-linux/nptl/pthread_equal.os.dt -MT /home/peteru/Source/T3/build-enviroment-core-24/builds/beyonwiz/inihdp/tmp-glibc/work/mips32el-oe-linux/glibc/glibc-2.21-r0/build-mipsel-oe-linux/nptl/pthread_equal.os
| In file included from allocatestack.c:30:0,
|                  from pthread_create.c:55:
| allocatestack.c: In function 'stack_list_add':
| ../include/list.h:58:1: error: inlining failed in call to 'list_add': call is unlikely and code size would grow [-Werror=inline]
|  list_add (list_t *newp, list_t *head)
|  ^
| In file included from pthread_create.c:55:0:
| allocatestack.c:159:3: error: called from here [-Werror=inline]
|    list_add (elem, list);
|    ^


