Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id F370C7317D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 20:20:46 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l65so153584451wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xZX7eXfqhNtcVkRkXtPY7DAJ/OEszU/1+CwSZ6tuBGI=;
	b=lmn96sPkX4Paltu4/N7PWWP91MHGJmO6orHBPgKbbWOpcIIt6lihtQgCTg/G4FpPY8
	59V6UeJWrh30qn9m0hv/nQTxybkZHnjDuPCIGfGQzc5YArM/6yiz1nMZ1SkVrMz/bv7a
	nTJnpxDQ1DNLZLZ8OvELcPp8x9VIjTqRV33hSHBRCvLHpbUh6q2qphdAbCnFNPsGWF7z
	D0OTXS+anjqwDdNY8oUM7frLCfVw7qek7NOvvTFKSMrK5LfK26DEwlt4GjPCPa5jM8mf
	XLnIi3xx3fkjcobppMQTeP8g5uTKSQJPt8avK/asgiGbmHhalr5yPQtWr+QRj90GHG/F
	3Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xZX7eXfqhNtcVkRkXtPY7DAJ/OEszU/1+CwSZ6tuBGI=;
	b=GZnQ0ci30ZzADSEwxlq8IOjjTRFOWj/bo5B1NZDWC7Vfp18mkWKWQ9jXi4a04/5Jan
	1/kKsvQpBrCORfM283Rc9P7tw3VLpdI/ejw7h77vZPCLOctSSSL3Bqg8Ij+rVK+AV4ks
	VtkdcWRLL04iQBqTn9liODWyGZBsSnwb4b+5eo9tVUNPLqdkna3in8GPvaED/P659CjB
	cACLpsJcxzRnIlifUH8two5UYkGKnw8MP+fTYO/GEjwBvhszhH8Kui0dwIogL2lhbkqE
	8/Y5BDfYMGdNFRkQdmYp+0l04Nzu/b7wcQ7j5p/IL7IV/w+cGYvDkqmyj5b7NfT5auMQ
	ooxA==
X-Gm-Message-State: AG10YORf1biBCFL//1dutEShoM2NEaCn9BfcTABApEBqPgUkpch552EFafUIfho/78YeO+faqkD2DREc6XHXnQ==
MIME-Version: 1.0
X-Received: by 10.28.195.138 with SMTP id t132mr20379303wmf.61.1453234846945; 
	Tue, 19 Jan 2016 12:20:46 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 19 Jan 2016 12:20:46 -0800 (PST)
In-Reply-To: <569DE54C.7090506@windriver.com>
References: <569DE54C.7090506@windriver.com>
Date: Tue, 19 Jan 2016 12:20:46 -0800
Message-ID: <CAJ86T=WDHvsC2PKP5wKizrq_+Ri1Z6OTnJLhxsS4O1DoKpy=Bw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [BUG REPORT] failed to build valgrind on qemuarm
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
X-List-Received-Date: Tue, 19 Jan 2016 20:20:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 18, 2016 at 11:27 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
>
> 2: on qemuarma9
>

The problem seems to be that the machine doesn't support NEON and
Valgrind 3.11 includes a new test case which uses embedded NEON
instructions.

We do already disable a few tests which don't build for all ARM
machines (see "remove-arm-variant-specific.patch"), so maybe the
"sh-mem-random" test should be disabled as well. I'll take a look.

What DEFAULTTUNE does the qemuarma9 machine use?

>
> | arm-wrs-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=softfp  -marm
> -mthumb-interwork
> --sysroot=/work/wr/buildarea/arm/bitbake_build/tmp/sysroots/qemuarma9
> -DHAVE_CONFIG_H -I.
> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests
> -I../..
> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0
> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/include
> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind
> -I../../include
> -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/VEX/pub
> -I../../VEX/pub -DVGA_arm=1 -DVGO_linux=1 -DVGP_arm_linux=1
> -DVGPV_arm_linux_vanilla=1   -Winline -Wall -Wshadow -Wno-long-long -g
> -fno-stack-protector    -O2 -pipe -g  -fno-omit-frame-pointer
> -fvisibility=default -O0 -c -o sh-mem-random.o
> /work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests/sh-mem-random.c
> | {standard input}: Assembler messages:
> | {standard input}:1107: Error: selected processor does not support ARM mode
> `vld1.64 {d7},[r3]'
> | {standard input}:1107: Error: selected processor does not support ARM mode
> `vst1.64 {d7},[r2]'
> | Makefile:2467: recipe for target 'sh-mem-random.o' failed
>
>
> and the codes are below:
>
> 194 #elif defined(__linux__) && defined(__arm__) && !defined(__aarch64__)
> 195             /* On arm32, many compilers generate a 64-bit float move
> 196                using two 32 bit integer registers, which completely
> 197                defeats this test.  Hence force a 64-bit NEON load and
> 198                store.  I guess this will break the build on non-NEON
> 199                capable targets. */
> 200             __asm__ __volatile__ (
> 201                "vld1.64 {d7},[%0] ; vst1.64 {d7},[%1] "
> 202                : : "r"(arr+src), "r"(arr+dst) : "d7","memory"
> 203             );
> 204 #else
>
>
> -Roy
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

