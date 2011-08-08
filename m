Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QqSHj-0000c2-IH
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 18:02:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p78Fw51g001777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 08:58:06 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 8 Aug 2011 08:58:05 -0700
Message-ID: <4E40078C.2060904@windriver.com>
Date: Mon, 8 Aug 2011 10:58:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20110808113650.GA20162@chargestorm.se>
In-Reply-To: <20110808113650.GA20162@chargestorm.se>
Subject: Re: Unrecognized option while building pseudo (target)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2011 16:02:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

pseudo currently only works on IA32 hosts.  It was never really intended to work
on the target system, but should.

If you think you want pseudo on the target.. you'll have to verify that all of
the calls are being trapped properly on ARM, as well as modify the build
instructions to not worry about IA32 specific items.

(Right now, if you change the compilation to not specify the -m32 on arm, I'd
give pseudo about a 75% chance of working properly on ARM.. but it's never been
tested there.)

--Mark

On 8/8/11 6:36 AM, Anders Darander wrote:
> 
> Hi,
> 
> After updating my work-in-progress to upgrade our internal distro from
> oe-dev to oe-core, I got a new problem... (At least new to me, as far as
> I remember I didn't have that problem before the vacation. Otoh, my old
> build-box is temporarily out of service HW-problems, so this is a new
> build environment).
> 
> The problem is that my cross-compiler, arm-oe-linux-gnueabi-gcc, do not
> recognize the -m32 option, that the pseudo makefile tries to supply.
> 
> Short excerpt of the build log, just to show the call to gcc and its
> error message:
> | arm-oe-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork
> -mtune=arm926ej-s
> --sysroot=/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu
> -O2 -pipe -g -feliminate-unused-debug-types -pipe -std=gnu99 -Wall -W
> -Wextra -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -m32
> -DPSEUDO_PREFIX='"/usr"' -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"'
> -DPSEUDO_LIBDIR='"lib/pseudo/lib"' -DPSEUDO_LOCALSTATEDIR='"var/pseudo"'
> -DPSEUDO_VERSION='"1.1.1"' -O2 -g
> -L/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu/usr/lib
> -I/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu/usr/include
> -Wl,-R/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu/usr/lib
> -c -o pseudo_tables.o pseudo_tables.c
> | cc1: error: unrecognized command line option '-m32'cc1: error:
> unrecognized command line option '-m32'cc1: error: unrecognized command
> line option '-m32'cc1: error: unrecognized command line option '-m32'
> 
> By commenting out the setting of 'CFLAGS_CODE += -m$(BITS)' in
> Makefile.in, I can get the build to continue past pseudo.
> 
> Any ideas of how I should correctly fix this? Or if I have some other
> problem in my environment that could cause such a failure....
> 
> Cheers,
> Anders 
> 



