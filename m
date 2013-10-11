Return-Path: <angstrom-dev@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id C4ED56CC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 14:32:49 +0000 (UTC)
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id D71EACF1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 16:32:35 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjQXAEwLWFJT4ztUOmdsb2JhbAANTIt0skuIWwMBAQEBIhaDGUA9FhgDAgECATEaDQgBAa9fk0GTcQOYBZUo
X-IronPort-AV: E=Sophos;i="4.93,476,1378850400"; d="scan'208";a="412735066"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.59.84])
	by ipb3.telenor.se with ESMTP; 11 Oct 2013 16:32:35 +0200
Message-ID: <52580C02.2070507@emagii.com>
Date: Fri, 11 Oct 2013 16:32:34 +0200
From: Ulf Samuelsson <angstrom-dev@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Angstrom-distro-devel@linuxtogo.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Problems when building Angstrom master & 1.3 & 1.4 for Beagleboard Black
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
X-List-Received-Date: Fri, 11 Oct 2013 14:32:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Have tried out building Angstrom for Beaglebone Black on a Quad-Core 
i7/Ubuntu 12.04 i386 with:

PARALLEL_MAKE     = "-j8"
BB_NUMBER_THREADS = "8"

I bitbake "cloud9-gnome-image"

RESULTS:
* remotes/origin/angstrom-v2013.06-yocto1.4    commit 
246357a1cc4977683ada564d38218e837ac615e3

     image builds but does not boot.

* remotes/origin/angstrom-v2012.12-yocto1.3    commit 
01984cc460acfe5e7d5bab4feeb0888d5c6fe77f

     image builds but does not boot.

* origin/master commit 7a3b004f7bfa24ea54b0da78bd80e4dd7839321d

     Build fails on two issues.

     1.    libxklavier compile fails.
             | xklavier.c: In function 'xkl_engine_class_init':
             | xklavier.c:846:8: error: 'XKL_TYPE_ENGINE_FEATURES' 
undeclared (first use in this function)
             ...
             Summary: 1 task failed:
/home/ulf/projects/ICU/Angstrom/setup-scripts/sources/meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb, 

             do_compile

             Did "bitbake -c cleansstate libxklavier" and restarted, and 
then it continued without problem,
             so there seem to be a dependency problem.

     2.    nodejs compiles fails with error:
            |   arm-angstrom-linux-gnueabi-gcc  -march=armv7-a 
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 
--sysroot=/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/sysroots/beaglebone 
'-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-DL_ENDIAN' 
'-DOPENSSL_THREADS' '-DPURIFY' '-D_REENTRANT' '-DOPENSSL_NO_DTLS1' 
'-DOPENSSL_NO_SOCK' '-DOPENSSL_NO_DGRAM' '-DOPENSSL_NO_GOST' 
'-DOPENSSL_NO_HW_PADLOCK' '-DOPENSSL_NO_ASM' '-DENGINESDIR="/dev/null"' 
'-DOPENSSLDIR="/etc/ssl"' '-DTERMIOS' -I../deps/openssl 
-I../deps/openssl/openssl -I../deps/openssl/openssl/crypto 
-I../deps/openssl/openssl/crypto/asn1 
-I../deps/openssl/openssl/crypto/evp 
-I../deps/openssl/openssl/crypto/store -I../deps/openssl/openssl/include 
-I../deps/openssl/config/android -Wall -pthread -O2 -fno-strict-aliasing 
-fno-tree-vrp  -MMD -MF 
/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/nodejs-0.8.22-r0/node-v0.8.22/out/Release/.deps//home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/nodejs-0.8.22-r0/node-v0.8.22/out/Release/obj.target/openssl/deps/openssl/openssl/crypto/whrlpool/wp_block.o.d.raw 
-O2 -pipe -g -feliminate-unused-debug-types -c -o 
/home/ulf/projects/ICU/Angstrom/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/nodejs-0.8.22-r0/node-v0.8.22/out/Release/obj.target/openssl/deps/openssl/openssl/crypto/whrlpool/wp_block.o 
../deps/openssl/openssl/crypto/whrlpool/wp_block.c
| make[1]: execvp: printf: Argument list too long

     I get the second problem when I run from: 
"/home/ulf/projects/ICU/Angstrom/setup-scripts/"
     When I install Angstrom in "/home/icu/v2012.12" I do not see the 
problem.

---------------------------
     Have tried recompiling my kernel changing include/linux/binfmts.h

<# define MAX_ARG_PAGES    32
 ># define MAX_ARG_PAGES    64

     based on something I found on Internet, to no avail.

Checking a little bit more, I see it looks like:
#ifdef CONFIG_MMU
     ...
#else
# define MAX_ARG_PAGES    64
     struct page *page[MAX_ARG_PAGES];
#endif
     CONFIG_MMU is set,  so the change is in part of the code which is 
not used

     Maybe there should be some kind of warning about how deep in the 
directory structure Angstrom can be.

---------------------------
     The resulting kernel/filesystem will run on the Beagleboard Black.

     Anyone knows what to change to increase the argument area on 
linux-3.2.x?

BR
Ulf Samuelsson


