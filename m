Return-Path: <gchoc-openembedded-core@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id CBFD66B3CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:40:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1V2hJU-0006u7-41 for openembedded-core@lists.openembedded.org;
	Fri, 26 Jul 2013 14:40:04 +0200
Received: from gate-zuk2.freescale.com ([192.88.166.1])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 14:40:04 +0200
Received: from alexandru.sardan by gate-zuk2.freescale.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 14:40:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
Date: Fri, 26 Jul 2013 12:36:21 +0000 (UTC)
Message-ID: <loom.20130726T142233-407@post.gmane.org>
References: <CALaXJ9nQCTk==sDA2UySBBwRd_g_gqvO0F=_r7gK14gQE-rKwQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 192.88.166.1 (Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36
	(KHTML, like Gecko) Chrome/28.0.1500.72 Safari/537.36)
Subject: Re: Issue of Yocto multilib sdk
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
X-List-Received-Date: Fri, 26 Jul 2013 12:40:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

 
> Hi experts, 
> 
> I use Yocto to generate multilib sdk, I append following content in my 
local.conf. 
> 
>     require conf/multilib.conf
>     MULTILIBS = "multilib:lib64"
>     DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"
> 
>     IMAGE_INSTALL_append = " \
>         ${ <at> multilib_pkg_extend(d, "binutils")} \
> 
> 
>         ${ <at> multilib_pkg_extend(d, "eglibc")} \
> 
>         ${ <at> multilib_pkg_extend(d, "eglibc-dev")} \
>         ${ <at> multilib_pkg_extend(d, "eglibc-staticdev")} \
> 
>         ${ <at> multilib_pkg_extend(d, "gcc")} \
> 
>         ${ <at> multilib_pkg_extend(d, "glib-2.0")} \
>         ${ <at> multilib_pkg_extend(d, "glib-2.0-dev")} \
> 
>         ${ <at> multilib_pkg_extend(d, "libgcc-dev")} \
>         ${ <at> multilib_pkg_extend(d, "libstdc++")} \
> 
>         ${ <at> multilib_pkg_extend(d, "libstdc++-dev")} \
>         ${ <at> multilib_pkg_extend(d, "libstdc++-staticdev")} \
>     "
> 
> 
> 
> The sdk is generated successfully, I installed poky-eglibc-x86_64-i586-
toolchain-gmae-1.4+snapshot-20130619.sh in the default 
path(/opt/poky/1.4+snapshot/). 
> 
> 1. 32bit build for my test C program, it passed,
>     $ source /opt/poky/1.4+snapshot/environment-setup-i586-poky-linux
>     $ $CC mytest.c -o mytest.c
> 2. 64bit build for the same test C program, it failed.
>     $ source /opt/poky/1.4+snapshot/environment-setup-x86_64-pokymllib64-
linux
>     $ $CC mytest.c -o mytest
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find 
crtbegin.o: No such file or directory
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
when searching for -lgcc_s
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
when searching for -lgcc_s
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc_s
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc.so 
when searching for -lc
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc.so 
when searching for -lc
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lc
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
when searching for -lgcc_s
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
when searching for -lgcc_s
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc_s
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find 
crtend.o: No such file or directory
> collect2: error: ld returned 1 exit status
> 
> Am I missing something? 
> 
> 
> Cheers, 
> 
> Bruce
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@...
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

I am experiencing the same issue with poky-dylan-9.0.0.
Can someone please help with this problem?

Kind regards,
Alex


