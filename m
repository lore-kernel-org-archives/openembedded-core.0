Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE4B76FE2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 08:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t958FY98004560; Mon, 5 Oct 2015 09:15:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j9NjlX953B9n; Mon,  5 Oct 2015 09:15:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t958COAm004351
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Oct 2015 09:14:38 +0100
Message-ID: <1444032741.5118.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <rehsack@gmail.com>
Date: Mon, 05 Oct 2015 09:12:21 +0100
In-Reply-To: <9EEC2D18-21A2-40BA-97B3-D8DD67015AC9@gmail.com>
References: <9EEC2D18-21A2-40BA-97B3-D8DD67015AC9@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 05 Oct 2015 08:15:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-10-03 at 14:51 +0200, Jens Rehsack wrote:
> I hit a build error never seen before:
> 
> | gcc  -I.. -I../.. -I../modes -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN     -DTERMIO -isystem/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -isystem/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/sysroots/x86_64-linux/usr/include  -c -o sha512.o sha512.c
> | /home/sno/perl5/perlbrew/perls/perl-5.6.2/bin/perl asm/sha1-x86_64.pl elf > sha1-x86_64.s
> | Can't locate bigint.pm in @INC (@INC contains: /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/5.6.2/x86_64-linux /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/5.6.2 /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl/5.6.2/x86_64-linux /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl/5.6.2 /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl .) at asm/../../perlasm/x86_64-xlate.pl line 200.
> | BEGIN failed--compilation aborted at asm/../../perlasm/x86_64-xlate.pl line 200.
> | make[2]: *** [sha1-x86_64.s] Error 141
> | make[2]: Leaving directory `/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/openssl-1.0.2d/crypto/sha'
> | make[1]: *** [subdirs] Error 1
> | make[1]: Leaving directory `/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/openssl-1.0.2d/crypto'
> | make: *** [build_crypto] Error 1
> | ERROR: oe_runmake failed
> | WARNING: /home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/temp/run.do_compile.15132:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at /home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/temp/log.do_compile.15132)
> ERROR: Task 1531 (virtual:native:/home/sno/fsl-community-bsp/sources/poky/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb, do_compile) failed with exit code '1'
> 
> Seems I recently used the same session to run my own module tests for a perl module to upload.
> OTOH - it's easy to avoid such a problem by depending on perl-native for openssl(-native).

Whilst you could add this dependency, it would have quite a significant
impact on build time. We rely on there being a working perl on the
native system for autotools so there isn't really a good reason to do
this.

Cheers,

Richard


