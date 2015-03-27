Return-Path: <zhengjunling@huawei.com>
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D175723B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 03:31:58 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJA39368; Fri, 27 Mar 2015 11:31:51 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Mar 2015 11:31:39 +0800
Message-ID: <5514CF16.2020804@huawei.com>
Date: Fri, 27 Mar 2015 11:31:34 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1427361482-5775-1-git-send-email-zhengjunling@huawei.com>
	<1427363666.14020.62.camel@linuxfoundation.org>
	<5513EE0B.5070802@huawei.com>
	<5513F450.1010701@communistcode.co.uk>
	<5514025A.4080004@huawei.com>
	<CAJTo0LYk7tA=5Vos6BC4j8cC5V=9TK4BZ9H0j0RQeajQuo=D0A@mail.gmail.com>
In-Reply-To: <CAJTo0LYk7tA=5Vos6BC4j8cC5V=9TK4BZ9H0j0RQeajQuo=D0A@mail.gmail.com>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"peifeiyue@huawei.com" <peifeiyue@huawei.com>
Subject: Re: [PATCH] file: remove the original magic.h
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
X-List-Received-Date: Fri, 27 Mar 2015 03:32:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 2015/3/26 21:08, Burton, Ross wrote:
> 
> On 26 March 2015 at 12:58, Junling Zheng <zhengjunling@huawei.com <mailto:zhengjunling@huawei.com>> wrote:
> 
>     This problem is that sometimes the magic.h wouldn't be generated again by magic.h.in <http://magic.h.in> if there
>     is already an original magic.h, and we may get an unexpected header file.
> 
> 
> libmagic_la_SOURCES = magic.c apprentice.c softmagic.c ascmagic.c \
>         encoding.c compress.c is_tar.c readelf.c print.c fsmagic.c \
>         funcs.c file.h readelf.h tar.h apptype.c \
>         file_opts.h elfclass.h mygetopt.h cdf.c cdf_time.c readcdf.c cdf.h
> 
> The problem is that the makefile doesn't actually say that the magic binaries depend on magic.h, so make is perfectly reasonably to build the binaries and then re-generate the makefile.
> 
> The correct fix here is to add magic.h to libmagic_la_SOURCES.
> 
> Ross
>
Hi, Ross

I don't think the dependency is the true reason, and I have tested it.

I add the magic.h to libmagic_la_SOURCES, and then make several times.

However, it's disappointing that sometimes the magic.h does still not generated again by the different magic.h.in.

I think the dependency of magic.h for magic binaries has been already declared in Makefile:

BUILT_SOURCES = magic.h
all: $(BUILT_SOURCES)
        $(MAKE) $(AM_MAKEFLAGS) all-am

The following is the comparison of the incorrect and the correct log of compiling:

z00238152@Patch-Test:~>0$ diff -ru log.do_compile.incorrect log.do_compile.correct
--- log.do_compile.incorrect	2015-03-27 11:05:23.000000000 +0800
+++ log.do_compile.correct	2015-03-27 11:09:27.000000000 +0800
@@ -5,6 +5,7 @@
 make[1]: Entering directory `/home/z00238152/halogen/build-fluorine-arma9el-qemu-HULK/tmp-eglibc/work/armv7a-euler-linux-gnueabi/file/5.14-r0/file-5.14'
 Making all in src
 make[2]: Entering directory `/home/z00238152/halogen/build-fluorine-arma9el-qemu-HULK/tmp-eglibc/work/armv7a-euler-linux-gnueabi/file/5.14-r0/file-5.14/src'
+sed -e "s/X.YY/$(echo 5.14 | tr -d .)/" < ../src/magic.h.in > magic.h
 make  all-am
 make[3]: Entering directory `/home/z00238152/halogen/build-fluorine-arma9el-qemu-HULK/tmp-eglibc/work/armv7a-euler-linux-gnueabi/file/5.14-r0/file-5.14/src'

And the Makefile in src directory is the same:

z00238152@Patch-Test:~>0$ diff -ru Makefile.incorrect Makefile.correct
z00238152@Patch-Test:~>0$

And I set the PARALLEL_MAKE ?= "-j 1", the problem also doesn't be fixed.

So I think the true reason is that if the magic.h exists already, sometimes Makefile will not generate it again.


