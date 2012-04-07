Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGOvb-0005BN-5R
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 08:15:15 +0200
Received: by pbcum15 with SMTP id um15so2661294pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 23:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=+5I5meARJQruXx5uE9Wr/FUaAOy1EHgGti7psUJ1o58=;
	b=v+Xxrjlxq0oERfRC3gIH5oJIqpKSEW6f+8crAX4bwCxofGEUHq6tQmm04rxF0AH3YZ
	XADwKnJIcFgTT/R6TjBbpiDAQD/lIntVoiJByq/qMFOA8zVbFv8d5SkjE1A0tmI7SHFh
	gLJ9kIR+vqWNyiZvRa45qM73DclrkncajMUw/HExc6mP9pSaRFI2rxn4eXI0uRppINF7
	oEvjeYk/U7OOrB4QmSU/PJmwNOSB2wQHeA+LGWmXLwSpnWsPGox9Osojipn5nzJhF/gr
	zEw4izWPmP3Xo3ddqAfcZTSpJOz6TQj2MKcxDd1N14tvHN5ozWi4LpX0I1Sdafwetx9e
	O3+Q==
Received: by 10.68.236.194 with SMTP id uw2mr566988pbc.165.1333778760706;
	Fri, 06 Apr 2012 23:06:00 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id p4sm8327298pbp.13.2012.04.06.23.05.58
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 23:05:59 -0700 (PDT)
Message-ID: <4F7FD945.7030201@gmail.com>
Date: Fri, 06 Apr 2012 23:05:57 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1333493785.git.nitin.a.kamble@intel.com>
	<3c9f0f3047f80b6290ea2ceb4fcecdb7b286c1d5.1333493785.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C01382684@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C01382684@ORSMSX106.amr.corp.intel.com>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH 1/2] gcc-cross-intermediate: fix do_install for x32
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
X-List-Received-Date: Sat, 07 Apr 2012 06:15:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/03/2012 04:01 PM, Kamble, Nitin A wrote:
> 
> 
>> -----Original Message----- From:
>> openembedded-core-bounces@lists.openembedded.org 
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>> Behalf Of nitin.a.kamble@intel.com Sent: Tuesday, April 03, 2012
>> 3:58 PM To: openembedded-core@lists.openembedded.org Subject:
>> [OE-core] [PATCH 1/2] gcc-cross-intermediate: fix do_install for
>> x32
>> 
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> 
>> This Fixes [Ycoto #2223] bug.
>> 
>> The gcc osdir is obtained in the do_install by invocation of
>> command "gcc -print-multi-os-directory". For x32 it returns gcc
>> osdir for the default abi which is x86_64. Fix this by adding
>> target abi parameter to the gcc command line to get correct gcc
>> osdir with invocation of command "gcc -mx32
>> -print-multi-os-directory"


how does it do on ppc64 multilib ?

>> 
>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> --- 
>> .../gcc/gcc-cross-intermediate.inc                 |    3 ++- 1
>> files changed, 2 insertions(+), 1 deletions(-)
>> 
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc 
>> b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc index
>> 316a764..1995725 100644 ---
>> a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc +++
>> b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc @@ -35,9
>> +35,10 @@ do_compile () { }
>> 
>> do_install () { +	set -x
> 
> I have removed this debug line from the commit on the contrib
> branch. Nitin
> 
> 
>> oe_runmake 'DESTDIR=${D}' install install -d
>> ${D}${target_base_libdir}/ -
>> osdir=`${D}${STAGING_BINDIR_TOOLCHAIN}.${PN}/${TARGET_PREFIX}gcc 
>> -print-multi-os-directory` +
>> osdir=`${D}${STAGING_BINDIR_TOOLCHAIN}.${PN}/${TARGET_PREFIX}gcc 
>> +${TARGET_CC_ARCH} -print-multi-os-directory` mv
>> ${D}${exec_prefix}/${TARGET_SYS}/lib/$osdir/* 
>> ${D}${target_base_libdir}/
>> 
>> # We don't really need this (here shares/ contains man/, info/, 
>> locale/). -- 1.7.7.6
>> 
>> 
>> _______________________________________________ Openembedded-core
>> mailing list Openembedded-core@lists.openembedded.org 
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/2UUACgkQuwUzVZGdMxRRvwCeN8ulkeVxnXLliRUElg8anFfq
7aMAn0WU8GI58qHMxJxTjXOuQr4p5bPE
=A/xt
-----END PGP SIGNATURE-----


