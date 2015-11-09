Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3944476FC4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 01:45:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA91gtbf016454
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Nov 2015 17:42:55 -0800 (PST)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 8 Nov 2015 17:42:53 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Jens Rehsack
	<rehsack@gmail.com>
References: <9EEC2D18-21A2-40BA-97B3-D8DD67015AC9@gmail.com>
	<1444032741.5118.5.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <563FFA16.6070606@windriver.com>
Date: Sun, 8 Nov 2015 20:42:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444032741.5118.5.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.6]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should openssl(-native) build-depends on perl-native?
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
X-List-Received-Date: Mon, 09 Nov 2015 01:45:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-10-05 04:12 AM, Richard Purdie wrote:
> On Sat, 2015-10-03 at 14:51 +0200, Jens Rehsack wrote:
>> I hit a build error never seen before:
>>
>> | gcc  -I.. -I../.. -I../modes -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN     -DTERMIO -isystem/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -isystem/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/sysroots/x86_64-linux/usr/include  -c -o sha512.o sha512.c
>> | /home/sno/perl5/perlbrew/perls/perl-5.6.2/bin/perl asm/sha1-x86_64.pl elf > sha1-x86_64.s
>> | Can't locate bigint.pm in @INC (@INC contains: /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/5.6.2/x86_64-linux /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/5.6.2 /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl/5.6.2/x86_64-linux /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl/5.6.2 /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl .) at asm/../../perlasm/x86_64-xlate.pl line 200.
>> | BEGIN failed--compilation aborted at asm/../../perlasm/x86_64-xlate.pl line 200.
>> | make[2]: *** [sha1-x86_64.s] Error 141
>> | make[2]: Leaving directory `/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/openssl-1.0.2d/crypto/sha'
>> | make[1]: *** [subdirs] Error 1
>> | make[1]: Leaving directory `/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/openssl-1.0.2d/crypto'
>> | make: *** [build_crypto] Error 1
>> | ERROR: oe_runmake failed
>> | WARNING: /home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/temp/run.do_compile.15132:1 exit 1 from
>> |   exit 1
>> | ERROR: Function failed: do_compile (log file is located at /home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/temp/log.do_compile.15132)
>> ERROR: Task 1531 (virtual:native:/home/sno/fsl-community-bsp/sources/poky/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb, do_compile) failed with exit code '1'
>>
>> Seems I recently used the same session to run my own module tests for a perl module to upload.
>> OTOH - it's easy to avoid such a problem by depending on perl-native for openssl(-native).
>
> Whilst you could add this dependency, it would have quite a significant
> impact on build time. We rely on there being a working perl on the
> native system for autotools so there isn't really a good reason to do
> this.

openssl fails to build on Fedora 23 with this signature.
I suspect that bigint.pm isn't standard and that we
need to re-work:

commit cd3eddcf2842b9a360f72caf4337ab2968462bb2
Author: Cristian Iorga <cristian.iorga@intel.com>
Date:   Tue Jun 16 00:32:15 2015 +0300

     openssl: fix building on x32 systems

     Fix build on Fedora 21 i686.

     When building on x32 systems where the default type is 32bit,
     make sure that 64bit integers can be represented transparently.

     Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
     Signed-off-by: Ross Burton <ross.burton@intel.com>

---

$ git show cd3eddcf2842b9a360f72caf4337ab2968462bb2 | grep bigint
+Subject: [PATCH] crypto: use bigint in x86-64 perl
++	use bigint;
              file://crypto_use_bigint_in_x86-64_perl.patch \


More later in the week unless someone has fixed this already.

../Randy

>
> Cheers,
>
> Richard
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

