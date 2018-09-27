Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1E31F71C07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 08:37:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8R8bCwk025421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 27 Sep 2018 09:37:14 +0100
Message-ID: <faadf31ff400b7828fe69ac85138a3401a42488f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitradio.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2018 09:37:12 +0100
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
X-List-Received-Date: Thu, 27 Sep 2018 08:37:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-27 at 12:18 +1200, Douglas Royds wrote:
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

Good work in tracking it down so far.

Going off a bit of a random memory fragment, would it help to use
relative paths in the compile/link command?

Cheers,

Richard

