Return-Path: <denis@denix.org>
X-Greylist: delayed 3261 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 20:55:22 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF9565F25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 20:55:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N56002JF7G6BI81@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 06 May 2014 15:55:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6E3A1201BF; Tue,
	06 May 2014 16:55:18 -0400 (EDT)
Date: Tue, 06 May 2014 16:55:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?Bj=F6rn?= Krombholz <pirobk@gmail.com>
Message-id: <20140506205518.GE11339@denix.org>
References: <536899F5.1030104@gmail.com>
MIME-version: 1.0
In-reply-to: <536899F5.1030104@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 20:55:23 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, May 06, 2014 at 10:14:45AM +0200, Björn Krombholz wrote:
> Hi,
> 
> I'm having trouble building a working toolchain (meta-toolchain) on 
> yocto-1.4 release.
> 
> Buildsystem is x86_64, on current Debian Sid.
> 
> The problem seems to be with ld-linux[...].so, SDKMACHINE doesn't seem to 
> matter (x86_64 and i686 produce broken binaries).
> 
> The effect is, that (almost) every binary in the toolchain segfaults when 
> being run.
> 
> 
> Example m4:
> (in /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux)
> 
> Host ld:
> $ usr/bin/m4 --help
> Segmentation fault
> 
> Explicitly using the toolchain ld:
> $ lib/ld-linux-x86-64.so.2 usr/bin/m4 --help
> Usage: usr/bin/m4 [OPTION]... [FILE]...
> [...]
> 
> 
> Comparing the build with a toolchain created on Jul 30th 2013 (which works 
> fine) I see one major difference:
> 
> Old (working) toolchain:
> $ ldd m4
>         linux-vdso.so.1 (0x00007fffdae00000)
>         libc.so.6 => /usr/local/oecore-x86_64.old_201307/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007f6a71ed0000)
>         /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f6a72280000)
> 
> 
> New (broken) toolchain:
> $ ldd m4
>         linux-vdso.so.1 (0x00007fff36e00000)
>         libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/./../../lib/libc.so.6 (0x00007f00e7860000)
>         /lib64/ld-linux-x86-64.so.2 (0x00007f00e7c10000)
> 
> 
> The internal toolchain (from tmp/build/) is working fine, though the ldd output looks similar to the broken built one:
> 
> [...]build/tmp-angstrom_v2013_06-eglibc/sysroots/x86_64-linux/usr/bin$ ldd m4 
>         linux-vdso.so.1 (0x00007fff9fdc8000)                                                                                                                                                                                                                                   
>         libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f481cda8000)                                                                                                                                                                                                      
>         /lib64/ld-linux-x86-64.so.2 (0x00007f481d188000)
> 
> ATM, on Debian Sid /lib64/ld-linux-x86-64.so.2 is just a link 
> /lib64/ld-linux-x86-64.so.2 -> /lib/x86_64-linux-gnu/ld-2.18.so
> 
> I'd appreciate if someone could give me a hint on this matter, or a point me 
> in a direction, where the problem might be. As mentioned I already tried 
> changing the SDKMACHINE and a completely clean build folder with no effect.

Do you know that OE toolchain is not relocatable? The above symptoms are very 
similar to when you try to execute toolchain binaries from a different 
location that the toolchain was built for or installed to. There is a script 
called relocate_sdk.py that adjusts binaries and libraries to work in the 
required location - it's called during install of the SDK. See pages 24-27 of 
my last year ELC presentation about more details on how OE SDK works:

http://elinux.org/images/c/c8/ExternalToolchainsInYocto.pdf

-- 
Denys

