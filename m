Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0ED7451E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 16:58:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w92Gwump000887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 2 Oct 2018 17:58:57 +0100
Message-ID: <c5a520ffbff2e4b1f12355b7605b5f5988228101.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitradio.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2018 17:58:56 +0100
In-Reply-To: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
References: <2f47bda4-deb2-9603-a151-8330f0d52e08@taitradio.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: glibc binary reproducibility
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
X-List-Received-Date: Tue, 02 Oct 2018 16:58:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-27 at 12:18 +1200, Douglas Royds wrote:
> When I build glibc in two different places, I get non-reproducible
> results - a 4-byte difference:
> > $ cmp -l ~/workspace/upstream[12]/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/package/lib/libc-2.28.so
> > 1259181  71 172
> > 1259182  27 304
> > 1259183 152  77
> > 1259184 363 243
> 
> These 4 bytes are the checksum that objcopy --add-gnu-debuglink adds
> to the binary when the .debug info is split out at do_package time,
> see package.bbclass +416
> So why is the debug info different? We add -fdebug-prefix-map to our
> CFLAGS, which ensures that all our intra-component debug paths are
> prefixed with /usr/src/debug/glibc/, for instance, but this isn't
> working in this case. The difference is happening in csu/crt1.o,
> which is being linked into libc.so (and others):
> > $ ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-
> > linux-gnueabi-objdump -t csu/crt1.o
> > ...
> > 00000000 l    df *ABS*    00000000
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
> > 00000000 l    df *ABS*    00000000
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/start.o
>  This abi-note.o symbol is finding its way into libc.so: 
> > $ ../recipe-sysroot-native/usr/bin/arm-tait-linux-gnueabi/arm-tait-
> > linux-gnueabi-objdump -t libc.so
> > ...
> > 00000000 l    df *ABS*    00000000             
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
>  So where does csu/crt1.o come from?
> > 
> > $ arm-tait-linux-gnueabi-gcc  -march=armv5te -marm -mcpu=arm926ej-s 
> > --sysroot=/home/douglas/workspace/upstream1/build/tmp/work/armv5e-
> > tait-linux-gnueabi/glibc/2.28-r0/recipe-sysroot -nostdlib
> > -nostartfiles -r -o
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/crt1.o
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/start.o
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/abi-note.o
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/init.o
> > /home/douglas/workspace/upstream1/build/tmp/work/armv5e-tait-linux-
> > gnueabi/glibc/2.28-r0/build-arm-tait-linux-gnueabi/csu/static-
> > reloc.o
> 
> Note the -r = --relocatable, an ld option, which, "Generate[s]
> relocatable output---i.e., generate[s] an output file that can in
> turn serve as input to ld.  This is often called partial linking",
> ie. the glibc build is just putting these .o files together for later
> convenience.
> Regrettably, this command both ignores -fdebug-prefix-map (which ld
> doesn't accept) and puts the fully-qualified path to some of the
> input .o files in the resulting crt1.o. At package splitdebuginfo()
> time, although the fully-qualified path info is split off into the
> .debug files, a (relative) path to the .debug files plus a checksum
> is tacked onto libc.so by objcopy --add-gnu-debuglink ... and the
> checksum depends on the path to the build.
> There is a work-around: turn off the debug packaging:
> > INHIBIT_PACKAGE_DEBUG_SPLIT_pn-glibc = "1"
> 
> I don't have a solution for this. Suggestions?

I did some digging.

I tried what I suggested using relative paths:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=22189be4bf508851950f72654870c4eebd4b73d9

and whilst it helps remove some references, there is a much wider
problem. I therefore went and had a look at the linker itself to
understand why its injecting this path. I found this code:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=f9aca51204990fbdbdfa7442f1dcc938e97bf782

which if disabled as per this hack, makes the binaries reproducible and
drops the problematic references.

We're swapping some misleading debug output for reproducibility with
that hack.

At this point we probably need to talk to some toolchain people about
what 'real' fixes may be possible...

Cheers,

Richard




