Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcZDp-0000pm-Nk for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 10:37:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p618XPtf008626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 09:33:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08550-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 09:33:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p618XJFx008620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 09:33:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
	<4E0D062C.5060302@linux.intel.com>
	<2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 09:32:58 +0100
Message-ID: <1309509178.20015.513.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: It's broken, please revert. Re: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Fri, 01 Jul 2011 08:37:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 09:15 +0200, Koen Kooi wrote:
> incremental build with rm_work turned on:
> 
> ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 for further information)
> ERROR: Logfile of failure stored in: /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092
> Log data follows:
> | + cd /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi
> | + do_configure
> | + sed -i '/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
> | sed: can't read /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/linux*.h: No such file or directory
> | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 for further information)
> NOTE: package gcc-cross-initial-4.5-r37.0+svnr175127: task do_configure: Failed
> ERROR: Task 764 (/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_configure) failed with exit code '1'
> 
> Can this patchset get reverted please and reapplied when it actually has been tested to work?

I checked and everything is fine with rm_work.

Looking at this error, something is changing ${S} as there is no mention
of work-shared in the sed command yet there should be.

At a guess this is coming from:

http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-devtools/gcc/gcc-4.5.inc

where it says:

S = "${WORKDIR}/${BRANCH}"

and if that is changed to

S_append = "/${BRANCH}"

or removed it will likely work better.

Cheers,

Richard



