Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3bGw-0003x3-Er for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 23:48:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22MdpjC007485
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 22:39:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06663-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 22:39:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22MdgKe007479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 22:39:43 GMT
Message-ID: <1330727985.309.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 22:39:45 +0000
In-Reply-To: <CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Fri, 02 Mar 2012 22:48:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-03 at 01:29 +0300, Yury Bushmelev wrote:
> 2012/2/10 Khem Raj <raj.khem@gmail.com>:
> > Hi
> >
> > Just grepped for the occurances of disabled parallel make and I see
> > around 40 cases on oe-core
> >
> > git grep PARALLEL_MAKE.*=.*\"\" recipes* | grep -v "#"
> >
> > If someone has time to kill then it would help to see if some of these
> > are fixed by time or can be fixed
> >
> > it can help in paralleling the build a bit more.
> 
> Well, I have some first results! :)
> 
> 
> 1. Recipes (files) confirmed to fail with P_M enabled (need to have
> P_M disabled as it is now):
> meta/recipes-connectivity/bind/bind_9.8.1.bb
> meta/recipes-extended/slang/slang_2.2.4.bb
> meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> meta/recipes-support/pth/pth_2.0.7.bb
> 
> 
> 2. Recipes _not_ confirmed to fail with P_M enabled (i.e. are building
> ok in my environment with P_M enabled):
> meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
> meta/recipes-bsp/pcmciautils/pcmciautils.inc
> meta/recipes-connectivity/iproute2/iproute2.inc
> meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> meta/recipes-core/eggdbus/eggdbus_0.6.bb
> meta/recipes-devtools/autoconf/autoconf_2.68.bb
> meta/recipes-extended/at/at_3.1.12.bb
> meta/recipes-extended/groff/groff_1.20.1.bb
> meta/recipes-extended/mailx/mailx_12.5.bb
> meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> meta/recipes-extended/sat-solver/sat-solver_git.bb
> meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
> meta/recipes-graphics/xcb/xcb-util.inc
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> meta/recipes-multimedia/speex/speex_1.2rc1.bb
> meta/recipes-support/icu/icu-3.6.inc
> meta/recipes-support/libpcre/libpcre_8.21.bb
> 
> 
> 3. Recipes not tested yet (need more work):
> meta/recipes-bsp/x-load/x-load.inc (want specific ARCH)
> meta/recipes-bsp/u-boot/u-boot.inc (multiple versions available)
> meta/recipes-core/eglibc/eglibc.inc (multiple versions available)
> meta/recipes-core/gettext/gettext_0.16.1.bb (multiple versions available)
> meta/recipes-devtools/dpkg/dpkg.inc (fetch and patch tasks are failed)
> meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb (can't remember actually...)
> meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb (multiple versions available)
> meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb (multiple versions available)
> meta/recipes-devtools/valgrind/valgrind_3.7.0.bb (want specific ARCH)
> meta/recipes-extended/bash/bash_3.2.48.bb (multiple versions available)
> meta/recipes-extended/bash/bash.inc (multiple versions available)
> meta/recipes-graphics/xcb/libxcb.inc (multiple versions available)
> 
> 
> 4. Recipes with PARALLEL_MAKEINST disabled (not tested yet as well):
> meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
> meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> meta/recipes-devtools/mtools/mtools_3.9.9.bb
> meta/recipes-devtools/mtools/mtools_4.0.17.bb

FWIW, this last set of PARALLEL_MAKEINST are very recent and very likely
to break. I'd concentrate on those last.

Cheers,

Richard



